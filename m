Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3710.1795172267748336496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DUz8Fjvm;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2363; q=dns/txt;
  s=iport01; t=1795172267; x=1796381867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b9e4ZNVk1zjT1H3FESful6yYKrLEjoDxybEZAtWW4kg=;
  b=DUz8FjvmOb+qrZA9Cmyga6LwKaMg45DMPbg+oqePWf+dBDnycDFrIb9P
   3rLvCAUiuGNuyedZVtPpmluR0rE3rLO4Qx2fkt0UpPeGVtGNK75NVqjev
   5FnVpBd25DwK6cwMa7tB5c5Fd9gOQCHk2Av0VP2hfz1TOQ4xf7NkeXiiO
   XspSl8UsfVIXXoqQzdT3Yzwt60Uy1E5iQixMQmJpe8XE1YxjqVz7Zj/Nz
   CV4lwVzmranGQvZUldS7TpxADvS5J5M7NOKd1kSvrmoS/dPldT0w9aKUe
   XxsKZC047d61/pi7PjqU+gnuF4BybtZ6XdjH7xMABmBL+WM0vccOhfHWQ
   Q==;
X-CSE-ConnectionGUID: xkByjJPKR/OWytkbLvRmPA==
X-CSE-MsgGUID: Vo7+Lc2PQ/+zBO8JdHiONg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDlJgBr/9RK/pBaglmCV3VhQkkDlkgDnimBGwNgD?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4hAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQCARG4LBs3gXkzg?=
 =?us-ascii?q?QGEftszAQsUAQWBM4VCiCRdGAGEfScbG4FygRWDaoEFgVwCgSeBBoV5BIIig?=
 =?us-ascii?q?QyBVBgGjHkCgU+IJkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGB?=
 =?us-ascii?q?YEcgR6BEoEDXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGD?=
 =?us-ascii?q?RgNSBEsNxUZBD5uB5NsgxmBDgErgQUMgRuldaERCiiDeYwklToaM4VbpRcLm?=
 =?us-ascii?q?H2OCpZRhGqBaDyBWXAVgyIJShkPjjmDa4QHylQjNQsDLwEBBwIHDgMLgWiQA?=
 =?us-ascii?q?CyBUgEB?=
IronPort-Data: A9a23:GsFK2a/FTrhzWcAVN7XSDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GpNWW6AbvmNYWbzKttwYInjoR4P7J7SmoQ2TARt+ShEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhMsvvrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kmPqcJ+MRPIlsJ0
 sMJNDMHSg65gtqflefTpulE3qzPLeHiMZlavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOXWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCwYYSNJ43XHq25mG6mo
 T2F22+jOihdd8617mqn/lKtocnAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:q/AUWK5OiesHwVlH5gPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:vU35RGOonmZhAu5DSCpN5Uw2IuMfNVri3WvTKWumM2NRYejA
X-Talos-MUID: 9a23:tXEQtguBmNjMLiV/Nc2nujY9d+NjuZyXTwMfu7JWmcWkNAtWNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59605953"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:45 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 1FE1F1800042C;
	Fri, 20 Nov 2026 10:57:45 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id C7047CBF222; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 3/8] cups: Fix CVE-2026-55480
Date: Fri, 20 Nov 2026 02:57:15 -0800
Message-Id: <20261120105720.2197092-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120105720.2197092-1-asparmar@cisco.com>
References: <20261120105720.2197092-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250765
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/OpenPrinting/cups/commit/98adfd855950e806508f961d5438ad32e26aac62
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-jj94-x3qh-ffp9

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 65db905563..482eb9c85d 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -27,6 +27,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-41079.patch \
            file://CVE-2026-55453.patch \
            file://CVE-2026-55467.patch \
+           file://CVE-2026-55480.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-55480.patch b/meta/recipes-extended/cups/cups/CVE-2026-55480.patch
new file mode 100644
index 0000000000..b7a682418a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-55480.patch
@@ -0,0 +1,32 @@
+From c93f88be468c6eeed863237d87da67e13b2e53c0 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 12 Jun 2026 16:15:56 -0400
+Subject: [PATCH] Open temporary PPD files more securely.
+
+CVE: CVE-2026-55480
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/98adfd855950e806508f961d5438ad32e26aac62]
+
+Backport Changes:
+- Omit the CHANGES.md release-note hunk for the newer upstream release.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ scheduler/ipp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 9a280e75..1c9798cb 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -4492,7 +4492,7 @@ copy_model(cupsd_client_t *con,		/* I - Client connection */
+ 
+   snprintf(buffer, sizeof(buffer), "%s/daemon/cups-driverd", ServerBin);
+   snprintf(tempfile, sizeof(tempfile), "%s/%d.ppd", TempDir, con->number);
+-  if ((tempfd = open(tempfile, O_WRONLY | O_CREAT | O_TRUNC, 0600)) < 0)
++  if ((tempfd = open(tempfile, O_WRONLY | O_CREAT | O_TRUNC | O_EXCL | O_NOFOLLOW, 0600)) < 0)
+     return (-1);
+   if (cupsdOpenPipe(temppipe))
+   {
+-- 
+2.35.6
+
-- 
2.35.6

