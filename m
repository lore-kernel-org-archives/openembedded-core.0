Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8251.1795062168147154355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ilYTSIlS;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3709; q=dns/txt;
  s=iport01; t=1795062169; x=1796271769;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WB0RTlqZO/c3PVzhynCVXPxV+chk9V9pxz++fLTTPpo=;
  b=ilYTSIlS+g7i4i3pfwAUvWiTOSzZlg17MrYX/pHo6bfYP4LeJtfVvbft
   fod9yWkH4vg9WeCzWv9dd1No6SUhIk3b3JQIziWberjBPoH0SCnVWmU2k
   Dbt4lp3g0Rj306PaKHJElAp6gYZ+Tj7ocW4+xVJsMew4wrs5ehVQsTKhg
   rel59F6a8pbVypvb09GfRUKaiDO0C4zXaNj/ZLIdZvT9PZMFjAdvCsubD
   6H6jxXv1cC0HOcCydk3zRv59qq4Vd8WTZ8w73eIjPnb7o+qTpDhA7DS0o
   ap7Zrfk2Ru6YPHosMZzhOlHO2BXGOPLOZBbm9pkyGHXcImCaXa+D6bpMQ
   w==;
X-CSE-ConnectionGUID: 5H1PyKF8RAmX4sekhCOO5A==
X-CSE-MsgGUID: 8tsZtGukTB+axsQILbpSrg==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9NK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaoEFgVwCg?=
 =?us-ascii?q?SeGfwSDHBKBVI0XAoFPiApIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXg?=
 =?us-ascii?q?QcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CD?=
 =?us-ascii?q?hgNSBEsNxUZBD5uB5NRgktNPRw1ASsEgQ1zKE6SZ5JAoRGEK4wklToaM4QEg?=
 =?us-ascii?q?VeSQ5JUC5h9jgqWUYRqgWg8gVkzGggbFYMiCUoZD445g2uFE1HGWiYyAgkDL?=
 =?us-ascii?q?wEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:U89ZHKBox/qgThVW/2Piw5YqxClBgxIJ4kV8jS/XYbTApG4n1jMGm
 moXDWGBOfjZNmv1fNx+OYy+/EkH757XxtdgOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb8i2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEntU3NFAVE90i0+NHXXpD9
 vwzDxdQR0XW7w626OrTpuhEj8k5ac2uN4QFtzQ5lXfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMGMHgBfoO3WjPn8GFYg3kOqAjXjkeDoeo1WQzUYyyzWCkVwqieexWDbTUoyWXvdJsVubm
 kiF9nTiOzA+PsSk0zXQpxpAgceKx0sXQrk6E6W18PNvilCfymEfTRYRT1aTpfiillX4XMpSL
 UER8CcioaU+skuxQbHAswaQqXOe+xpZUN1KHqhjsEeGy7Hf5ECSAW1soiN9VeHKffQeHVQCv
 mJlVfuwbdCzmNV5kU6gy4o=
IronPort-HdrOrdr: A9a23:UoAbFaCZQdjfooTlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:Kr8wqGPm+fxaOu5DBQk+zF83NJAfW3jtkGzdIE+TLkE0YejA
X-Talos-MUID: =?us-ascii?q?9a23=3A2MtjywzlVYXoB0QR/FnDQl85lkOaqPSyE3IRvog?=
 =?us-ascii?q?Fh+PHPDxrAha5hiyMWIByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59583174"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 78CF2180001F3
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 97C11CC8C94; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 23/27] python3-git: fix CVE-2026-78675
Date: Wed, 18 Nov 2026 20:22:38 -0800
Message-Id: <20261119042242.1640611-24-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250622
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/ef7568e3b317ce617eacda39b8b54dcdff8c3b5c
[2] https://security-tracker.debian.org/tracker/CVE-2026-78675

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
---
Changes in v3:
- Restored the required trailing spaces.
---
 .../python/python3-git/CVE-2026-78675.patch   | 47 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
new file mode 100644
index 0000000000..20a7cfbc11
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
@@ -0,0 +1,47 @@
+From eaa63265a59f069bf13384481c48fa48a25ff087 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 12:32:24 +0200
+Subject: [PATCH] fix: ignore includes in submodule configuration
+
+<!-- agent -->
+Submodule configuration is read from .gitmodules, whose contents may come
+from an untrusted repository. Its parser inherited merge_includes=True and
+could therefore open files named by include directives during ordinary
+submodule enumeration.
+
+Disable include merging at the SubmoduleConfigParser construction site. This
+matches Repo.config_writer() hardening from 41ecc6a4 and addresses
+GHSA-7833-fr7j-v32q without changing include behavior for trusted config
+parsers.
+
+The regression points .gitmodules at a non-config file and verifies the
+submodule entry remains readable without opening the included path.
+
+CVE: CVE-2026-78675
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/ef7568e3b317ce617eacda39b8b54dcdff8c3b5c]
+
+Backport Changes:
+- Omitted test/test_submodule.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit ef7568e3b317ce617eacda39b8b54dcdff8c3b5c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 410f41e2..e37f8fa9 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -268,7 +268,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("Cannot write blobs of 'historical' submodule configurations")
+         # END handle writes of historical submodules
+ 
+-        return SubmoduleConfigParser(fp_module, read_only=read_only)
++        return SubmoduleConfigParser(fp_module, read_only=read_only, merge_includes=False)
+ 
+     def _clear_cache(self) -> None:
+         """Clear the possibly changed values."""
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index badbf04415..0dd42e1f04 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -47,6 +47,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78678_CVE-2026-78679.patch \
            file://CVE-2026-78677.patch \
            file://CVE-2026-78676.patch \
+           file://CVE-2026-78675.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

