Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0247C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:29 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3032.1787216847044408415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=V7MFSASM;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1499; q=dns/txt;
  s=iport01; t=1787216847; x=1788426447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CREOiVQfT3kmlMyDWLQ9Y9Y99eLwAMvHFLHsXjeQjRI=;
  b=V7MFSASMfUQU98JVkI1wEVNf+e1vQBBiECUsXxBJiXlWWUA3dLLRfgtS
   KFnEnEZz251e8yx+VfhHffIRpUemSvKWwxECA99dH+MDXxhvMklw8o/JR
   OGV2s/dQniXpq5EUet+WHC0BmNCV/fh7mhP9om/hGzHjsDjWieK7YGnIe
   4P39CbS0VyKLZsTzLsBtw6r653gH6fCzjA4TqnUaHeCZ3I22aIdXG4jUC
   6dvYm8hyKBMlp79pihjXpdWu/p3dKiWyv4BlMfoRXpSdqmH6gSREeGqjh
   5dVn+eu5cXWhlrirqHfH23o5y88QOiBUJB44ZYA2VwwmK4y2QDqzJB/PW
   A==;
X-CSE-ConnectionGUID: nJem9Y8RR/GxglCwgWT0Cg==
X-CSE-MsgGUID: S0PoogaVQdix/nIMCeSUxA==
X-IPAS-Result: =?us-ascii?q?A0BEAgBrwoZq/5MQJK1aglmCV3ReQ0mEV48CAaEOgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl0nBAsBGAEtMAUCJgItRIMCAYJ0A8JCen8zgQGDKAGBVNswAQsUA?=
 =?us-ascii?q?QWBBS6FP4MfAYUCdoR8JxsbgXKEfoUQgw6CagSCIoEMk0pIgQIcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+FzVYGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBC?=
 =?us-ascii?q?YIKAoJwggYCAUlFDgkXCxgNSBEsNxQZBD0BbgeOUSCCS4EOAYFDpwqhDwoog?=
 =?us-ascii?q?3aMIZU6GjOqbC6YWqRahGmBaDyBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5NmA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:Ez2kMaCPAY9n4xVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApGkrhD1Sm
 2UWX2iDOK2IZjH2e98jPd+w90lQuJ/VzoVkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TExddjCRAHbbcivclnDmVl6
 vMnFGgmYUXW7w626OrTpuhEj8AnKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWUHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFUrgOmzaoWFEjCMbf4NpkGfq
 Wv4xmj4ElYcFfm0xAG44lv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIk/KS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:kjgziKoq7oPKqDM8vL9FOJoaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV+6faUskd1ZJhOo7G90cW7LE80lqQFg7X5Q43DYOCOggLBR+tfBODZrQEIdReTygd179
 YGT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AS8oBKWjYY9nVzn5EF0ucq0QxCjJudF/QySbhc3W?=
 =?us-ascii?q?CTkl5R7m+VlCvxPtPnJ87?=
X-Talos-MUID: 9a23:+P028gWgv2a7cyHq/AS0vDZlO85W2qivGAcLsLAttvK5JQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812896278"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:26 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 9796618000141;
	Thu, 20 Aug 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 35F70CC124A; Thu, 20 Aug 2026 02:07:26 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-wheel: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:26 -0700
Message-Id: <20260820090726.60903-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243829

From: Tim Orling <tim.orling@konsulko.com>

The proper CVE_PRODUCT is "wheel_project:wheel".

BEFORE: python:wheel -> 1 CVE
AFTER: wheel_project:wheel -> 2 CVEs

* Both are patched at 0.42.0.
  - CVE-2022-40898 — DoS in wheel CLI via malicious input. Affects <0.38.1.
  - CVE-2026-24049 — malicious wheel file can modify permissions of arbitrary
    files. Affects 0.40.0–<0.46.2; covered by the existing
    CVE-2026-24049.patch.

Note: The original commit targeted python3-wheel_0.47.0.bb. This is
adjusted for Scarthgap, where the recipe version is 0.42.0.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe55278e01bbe434452191109278b436bf008ebc)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-wheel_0.42.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
index 934f258a93..b3e4a08d85 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7cee
 
 inherit python_flit_core pypi
 
+CVE_PRODUCT = "wheel_project:wheel"
+
 SRC_URI += "file://CVE-2026-24049.patch"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

