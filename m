Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BDFC5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 11:02:25 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14075.1787569335821884674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 04:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TrPEO6f2;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1090; q=dns/txt;
  s=iport01; t=1787569335; x=1788778935;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8ege7WQf2sDN0ZlUVq/ZHlwQhkueU1QBZxmbtU9fWc0=;
  b=TrPEO6f2MRUFtD6qCO1k1kmsi8eFUzT4MLRcejfWLpUn1D+y/tggwB7c
   2GZ4ddQ2dkLGTtLvVyFjbc504WHO9BkOih9jPk1A//qs6K0xO7crvHPG0
   h6dG8mBTM3JMrfdhXJdvCkfdz2r2K11QbLk1KzKIpGPlbbhIG0PThEnnp
   4fBIxb8mmD/57gbHo5MhdiyKqfUNW7OlaMXSawiuQBYn9gQoiulJSTd8G
   Ox7tCJK4i4teb9bFCUZ1XxXjfx37on5yPRlzywztaR6ZMNcKTcbySUAVF
   qiku3rhgtwWBiXSpZCgl5ILafYZYv1/gI9k4wws2x1h1BeXYU9woI/dHG
   A==;
X-CSE-ConnectionGUID: OJdu2mk6RcOSc0j4hvF19w==
X-CSE-MsgGUID: jeDusLcLRsmlPH5YZz/jWg==
X-IPAS-Result: =?us-ascii?q?A0D3AgBsJIxq/48QJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUFjW4CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAPCTIIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CKFcicbG4FyhAh2hAoNeYV4BIIigQyTWkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylkARIXgQmCBwKCWoIFAgFJQ?=
 =?us-ascii?q?w4HRyILGA1IESw3FBkEPm4Hjl4fgkcBPFEZggCUO5F6oQ8KKIN2jCKVOhozq?=
 =?us-ascii?q?mwumFqkWoRpgW8FMEaBE3AVgyIJShkP3lwnMgI9BwIHDwKRc4F+AQE?=
IronPort-Data: A9a23:iJXM76BQ8WxxVBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApG5032FWz
 mcZCzzVPfnbZzGmKY9xOYi1pk8BsZ6AnYIyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//h2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5NdiERszPtMi8cFMCjlMq
 fwGBmlccUXW7w626OrTpuhEj8AnKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWEHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFUvjeW1b4GJEjCMbcdYsluDg
 mnixX/8Bik6ae2t232HzX3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvSS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6eX9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:6Q+jPagsQbh8mAdYkBgp/G4TKXBQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:oZL1UmAOf1QkU4n6Ew5F+FNOH8N7SHb693yIIRO4F0gwGaLAHA==
X-Talos-MUID: 9a23:9tVUmwW+U1qdWvbq/D3hqCx5EMxM2b+rDHgtzKQ0qY6GCiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="816550734"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 11:01:57 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 61BAE180006C4;
	Mon, 24 Aug 2026 11:01:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 02F50CC12A9; Mon, 24 Aug 2026 04:01:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] expat: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 04:01:56 -0700
Message-Id: <20260824110156.25775-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244090

From: Devansh Patel <devanshp@cisco.com>

The current product-only mapping generates vendor-wildcard CPEs, while
the old libexpat:expat dictionary entries are deprecated.
libexpat_project:libexpat is the active NVD dictionary CPE and
configuration identity, and is also used by CNA affected-data records
for the packaged libexpat source.

This changes the generated product identity. With the frozen
sbom-cve-check database, the 63-entry CVE report is unchanged, so this is
an identity correction with no CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-core/expat/expat_2.8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 79e8c15227..e431792826 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -30,4 +30,4 @@ do_install_ptest:class-target() {
 
 BBCLASSEXTEND += "native nativesdk"
 
-CVE_PRODUCT = "expat libexpat"
+CVE_PRODUCT = "libexpat_project:libexpat"
-- 
2.35.6

