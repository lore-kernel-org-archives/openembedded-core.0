Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C17C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:02:29 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5578.1785218547699478086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Cjd4w2pz;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1353; q=dns/txt;
  s=iport01; t=1785218547; x=1786428147;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xHf+r3PGnY3BLhPjdq806726MSSBr91if5zGAhmBeEA=;
  b=Cjd4w2pzg/OwNIRVb8YCViignrrLZKFAs6A5UPSTrlhJh70HhUJDZtZf
   wKSFDcx2riwjvPl3BoYX8XrPF6o4XZEJc/VgwuK9daKWHjRbimfJ3z1JV
   YI2NwJD1wE5WeQhN/JrKEkwrqCmFlZOc2rf1e3XhJ09O2qrrTik5PeeSI
   cWsWpCi98y0ko+1A6vPTi6w/GxI3NlqXsDkfL9jyrJCoknDWzbwfpyzPT
   /JsdYxZE3vQYs2j9vdbDnv/y7DweLTXacvRQH7UlNwdyayHCSMYD0KlgC
   8XBaQBECsSI5QUXni6pW0laEFEhivjEajAi/ficB80HusJ7bPrAg68pkS
   A==;
X-CSE-ConnectionGUID: qSTRVTTyQUCQDf2ttTW7oQ==
X-CSE-MsgGUID: Qrsc7lfoSK2hEXSJHRicIw==
X-IPAS-Result: =?us-ascii?q?A0BAAgAZH2hq/48QJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjWUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgFGMFxEgwIBgnQDEcBBgiyBAYR92y4BCxQBgTiFP4ggdYR8Jxsbg?=
 =?us-ascii?q?XKEfoUQhXgEgiKBDIF4gTePE0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYEdgSxhhFgjGTl/gTF1SnctaQESF4EagzwCghUDCxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB411IoI9gQ6CNJQgkXqhDwoog3WMIZU6GjOqbC6YWqRahGmBaDyBWXAVg?=
 =?us-ascii?q?yIJShkP32gnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:Op54lqBurkl7pBVW/33iw5YqxClBgxIJ4kV8jS/XYbTApDkrhjRTz
 DYaDGrXO/bfYDP1KNEgYNu38h4PucTSyd8yOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/hGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2s5SNn8KAZwhx81OLW8U6
 eAkF28KV0XW7w626OrTpuhEj8AnKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWEHgBfoO3WjPn8XCpsym+GAjXjkeDoeo1WQzUYyyzeDnFwsieW8a7I5fPSzX95ewUKWo
 VnlpWTUMio4FOaewhuapyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgdUkG2if24kVKlHdVHJ
 koZ/yAjoaQ/+AqsVNaVYvGjiHeAuhhZX59bFPc3rVnTjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWcHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:9ReBNqoyetXXxJQp3CZxPQAaV5odeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:P/FRpWFU9kDvzMeeqmJ+z3IuJPwZY0Tg5078LRWkFVpWF7qsHAo=
X-Talos-MUID: 9a23:Qo+a0AQcwb3MFlNARXTVnippa8Nm5J+NUkAgoa4km/OFPg1vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,189,1779148800"; 
   d="scan'208";a="788851593"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 06:02:26 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 9D098180005B1;
	Tue, 28 Jul 2026 06:02:26 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 32302CC1611; Mon, 27 Jul 2026 23:02:26 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-certifi: set CVE_PRODUCT
Date: Mon, 27 Jul 2026 23:02:21 -0700
Message-Id: <20260728060221.3190911-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242166

From: "mark.yang" <mark.yang@lge.com>

NVD tracks certifi as certifi:certifi, so the default python:certifi
vendor prefix never matches and its CVEs are not evaluated at all.
Use the exact vendor:product pair.

All three existing CVEs (CVE-2022-23491, CVE-2023-37920,
CVE-2024-39689) are fixed before 2024.7.4. The wrynose recipe version
is 2026.2.25, so it is outside the affected ranges and these CVEs
resolve as not affected.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26c49743ec431a3cc39803664eec8851be75756e)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>

---
 meta/recipes-devtools/python/python3-certifi_2026.2.25.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
index 7034f7a6f1..0425f3544f 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e8
 
 inherit pypi python_setuptools_build_meta
 
+CVE_PRODUCT = "certifi:certifi"
+
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "python3-io"
-- 
2.35.6


