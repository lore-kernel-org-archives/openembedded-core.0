Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7520.1793976214416324349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dh5KDhZY;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3714; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9R105VMwMvmqcOaHFu+LaE+QayjkHKo/xA1t/q/Mz9s=;
  b=dh5KDhZYawqN7s7v/6UrzR3gmMu9FUPwEgHUA7nXKqlI5H46ho90mGU6
   ImqkDyKtE+nek/mI72TlY5S1uGJgP673/Qh0Nix+M/OzNTdM+Oaq12PEF
   61gI1Bxs0i7HdkvZtBoCYVYkTrVmuSC6USgSY62D6UWM6nDFcZcfUEGuw
   pCusAtQp2kYVGDdVglLpg2fjsdeZM70mw+VYq0PK9sBTeGkGg/K/61khe
   ZF1IBlwO8xRtXSvS3G7y6jB7VFpRt+6Oxkip0SKWJ5PdyIYBpXdcFl1+u
   3mgWRW0uYaRrfgXV8/Xmfyvy/G8FN1K3U+IydtseuXyr2Pjwo0a3tuI7q
   g==;
X-CSE-ConnectionGUID: oOgIoMmQQ2inMyZwedhbJw==
X-CSE-MsgGUID: 1+tLY4hFTPeDmSBxFld+kg==
X-IPAS-Result: =?us-ascii?q?A0BLAgAN5+1q/4r/Ja1aHgE8DA4LgVmCV3VgQ0kDlCeCI?=
 =?us-ascii?q?QOeIYF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3A?=
 =?us-ascii?q?xG8TYF5M4EBgykBPwICQAFQ2EwQb4FoAQsUAYE4hUKIJF0YAYR9JxuBSUSBF?=
 =?us-ascii?q?YNpgQWBXAICiCQEgxwSgVqNGAKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovG?=
 =?us-ascii?q?A1IESw3FRkEPm4Hkj2CRTsSPRsJLQErgiweBqVSoRGEKowklToaM4VbpRYLm?=
 =?us-ascii?q?H2OCpZRhGmBaDyBWTMaCBsVgyIJShkPjjmDa4UTUcYIJjICCQMvAQEHAgcOA?=
 =?us-ascii?q?wuBaJACLYFPAQE?=
IronPort-Data: A9a23:3LJ//6qJZLki1a/gldsa8yL3FbFeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmFOfaOMWH3co1xOdzg8EJVsJ/UxtM2SlRv+XtnH34WpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uFQDkBJ0
 PkhEWoMaDWStf27zLKxaPY506zPLOGzVG8ekmtrwTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWPrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fSFZkMzhbGz
 o7A1z26HjUraNyx9QKI3neXrP/hmS+4W41HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:T/6vHaBFbi+qxIflHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3ASF/E9Gsz4agouA7VKubIj8rM6IsiVXL8y1LVGnb?=
 =?us-ascii?q?iCGBMWY+KRFOQ8oF7xp8=3D?=
X-Talos-MUID: 9a23:O0+ZBQozRBeI6v21qkAez2ghKONZv6SANHgAvZA9kdmqMSAzODjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="530841886"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 6E9E2180001DC
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id E1911CBEF98; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 08/27] python3-git: fix CVE-2026-73623
Date: Fri,  6 Nov 2026 06:43:12 -0800
Message-Id: <20261106144331.3354811-9-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249670
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/ffcb5359e87619f4fe4a70a4aff5f08c5580ba97
[2] https://security-tracker.debian.org/tracker/CVE-2026-73623

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Updated the Backport Changes line wrapping and hunk context.
---
 .../python/python3-git/CVE-2026-73623.patch   | 53 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
new file mode 100644
index 0000000000..7cb48e1511
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
@@ -0,0 +1,53 @@
+From 3621c3099fef859e91f9f960707902018a370978 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:43:26 +0200
+Subject: [PATCH] fix: reject unsafe clone templates
+
+<!-- agent -->
+
+Treat git clone --template as unsafe because caller-controlled
+templates can install hooks that execute during clone.
+
+Add regression coverage for both direct option and keyword forms.
+
+References GHSA-6p8h-3wgx-97gf.
+Validated against Git baseline a23bace9.
+
+CVE: CVE-2026-73623
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/ffcb5359e87619f4fe4a70a4aff5f08c5580ba97]
+
+Backport Changes:
+- Omitted test/test_clone.py because the current PyPI
+  source archive does not include the test suite and
+  the python3-git recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit ffcb5359e87619f4fe4a70a4aff5f08c5580ba97)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index d661f036..2776c19e 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -148,6 +148,8 @@ Repo.unsafe_git_clone_options
+         # Can override configuration variables that execute arbitrary commands:
+         "--config",
+         "-c",
++        # Can install hooks that execute during clone:
++        "--template",
+     ]
+     """Options to :manpage:`git-clone(1)` that allow arbitrary commands to be executed.
+ 
+@@ -158,6 +160,9 @@ Repo.unsafe_git_clone_options
+     The ``--config``/``-c`` option allows users to override configuration variables like
+     ``protocol.allow`` and ``core.gitProxy`` to execute arbitrary commands:
+     https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---configltkeygtltvaluegt
++
++    The ``--template`` option can install hooks that execute during clone:
++    https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---templatetemplate-directory
+     """
+     unsafe_git_archive_options = [
+         # Allows arbitrary command execution through the remote git-upload-archive command.
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 551b47fc39..d996d4f9f5 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67322.patch \
            file://CVE-2026-69097.patch \
            file://CVE-2026-73625.patch \
+           file://CVE-2026-73623.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

