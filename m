Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E35DC55178
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32605.1771565685725808830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bfpUhJqj;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2849; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ScEQZ/2RKcPpf1BxUyo12Hs3F62CAxs51YoH8o7deN8=;
  b=bfpUhJqj2MDxrWSTnFzY1sMcLlMjwscaKIR7ncdb213jbQvrXbcLe0/4
   zg2khl9ExO4VfJ84phvx4eDIviw09xdjSvx1jUtA0RDHaeWVO5WoBr0Pt
   QLZ50CnO6YN2fSil0vEgevJCQpULnS30YMqVTZuW4dnnJdeGMWIlIKDm7
   vHdf+mpT/RQhcr99fYWRJt7Jj19zyDn8/KRCF9R38LqU+UMQPF+6eugML
   SP2QxZjg9CNKYNmf3PWxGaz5bK5EK13B6p2W4XqLknTNiO4tsQXpXyLIb
   /36xXD5aucihUQchtpVWJhtYQWVw3rpM2l66NcXgAxABWWkzzguLuMiwN
   Q==;
X-CSE-ConnectionGUID: rP2lBZ0eQ6mUdJcZs9oXFg==
X-CSE-MsgGUID: 5ksK4FDjQr68N2eaURtprw==
X-IPAS-Result: =?us-ascii?q?A0BBBAC68Zdp/4z/Ja1aglmCSA+BUEJJlk6LZJI2gX8PA?=
 =?us-ascii?q?QEBD1EEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZbAgEDMgFGECAxIAsdAQ0ZgwKCOwM2AgGnT4IsgQHdQw2CU?=
 =?us-ascii?q?gELFAGBOIU8gnmFIHSEeicbG4FyhA5vgh+CcYV3BIIigQ6TT0iBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYdTD4kFeG6BIIEbAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeOLz+CNAGBDoFLlEuSNaAdcQoog3SbXIV8GjOqa5kGkhKRXmmEaIFoP?=
 =?us-ascii?q?IFZcBWDIlIZD45fvjoiNTwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:os9f1aj1UipBF7UxpdnA7ZBkX161NxEKZh0ujC45NGQN5FlHY01je
 htvCjjUP/mKZWb2fNlyPNm/8E5S78CAmtdjHgNq+S1mHihjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsfjb8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUCwrxzK1MW+
 MVGLQ0BTBuxnLOx8Jy0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglH/fiFAoU69rqss6G+Vxwt0uFToGISKIoTRFJkMzi50o
 Eqb/H/aXj82NuWFl2qjqH+lu9XThTnkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:+q8GmKqt9rYpyNCmkyZXj5EaV5oseYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMbC/5vyKmTVR1L0bsb+6zJw=
X-Talos-CUID: 9a23:1auwu2E82IFfml7RqmJ9zBQQMPJ9f0SDyUrcAUSKEjdueJOaHAo=
X-Talos-MUID: 9a23:n2l21ATjYuqYk+IxRXSxhypBaOlE4Z20VhAry5gPhvOYLTZvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="670039418"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 8CFE0180005A3;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id BD78ECC8D07; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 22/34] spdx30: Allow VEX Justification to be configurable
Date: Thu, 19 Feb 2026 21:34:31 -0800
Message-Id: <20260220053443.3006180-22-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231467

From: Joshua Watt <JPEWhacker@gmail.com>

Instead of hard coding the VEX justifications for "Ignored" CVE status,
add a map that configures what justification should be used for each
status.

This allows other justifications to be easily added, and also ensures
that status fields added externally (by downstream) can set an
appropriate justification if necessary.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c0fa3d92cefa74fa57c6c48c94acc64aa454e781)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/conf/cve-check-map.conf |  4 ++++
 meta/lib/oe/spdx30_tasks.py  | 33 ++++++++++++++++-----------------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index ac956379d1..fc49fe0a50 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -28,8 +28,12 @@ CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
 CVE_CHECK_STATUSMAP[disputed] = "Ignored"
 # use when vulnerability depends on build or runtime configuration which is not used
 CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
+CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
+
 # use when vulnerability affects other platform (e.g. Windows or Debian)
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
+CVE_CHECK_VEX_JUSTIFICATION[not-applicable-platform] = "vulnerableCodeNotPresent"
+
 # use when upstream acknowledged the vulnerability but does not plan to fix it
 CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a3d848ceb1..c6bb3bd964 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -719,24 +719,23 @@ def create_spdx(d):
                             impact_statement=description,
                         )
 
-                        if detail in (
-                            "ignored",
-                            "cpe-incorrect",
-                            "disputed",
-                            "upstream-wontfix",
-                        ):
-                            # VEX doesn't have justifications for this
-                            pass
-                        elif detail in (
-                            "not-applicable-config",
-                            "not-applicable-platform",
-                        ):
-                            for v in spdx_vex:
-                                v.security_justificationType = (
-                                    oe.spdx30.security_VexJustificationType.vulnerableCodeNotPresent
+                        vex_just_type = d.getVarFlag(
+                            "CVE_CHECK_VEX_JUSTIFICATION", detail
+                        )
+                        if vex_just_type:
+                            if (
+                                vex_just_type
+                                not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
+                            ):
+                                bb.fatal(
+                                    f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
                                 )
-                        else:
-                            bb.fatal(f"Unknown detail '{detail}' for ignored {cve}")
+
+                            for v in spdx_vex:
+                                v.security_justificationType = oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
+                                    vex_just_type
+                                ]
+
                     else:
                         bb.fatal(f"Unknown {cve} status '{status}'")
 

