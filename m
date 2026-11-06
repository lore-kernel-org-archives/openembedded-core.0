Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7337.1793976214149599703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=REq5hy//;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5371; q=dns/txt;
  s=iport01; t=1793976215; x=1795185815;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Z4S+0jUd5yYgp6hP/gWALaBiUzhtCWD6q58KWDeoSB8=;
  b=REq5hy//HaLvnhSZ+c0YD0kcxCBi3gOANuO1G3oEeJ+YC+QNEIlX+qY1
   edlvGkBzL9fBZf0UZzmfItOtV5WnoSdLuqeb0aEtZyKgldL6ykA/0XWfM
   hDeWgNrAw/GsIlWp62D9y5uDKcstEnxxr8P4A5KF0fqDjljmzL30fvhwv
   zE93lvHoSo2rMlkpBlLCw/J4e0KTj+kGc7pch24SFyj4GZJkKeVf4M4yF
   SX7CzLGszl1h4ToAUObBeWVfwB+7AgfYa+0CQNjv45Da3IoDqpxir3sDb
   nNKwa8xlhbgeFtTzYi1ku3YNLnpcx6yaGJtYxcfylv43xRYmMotfbTSdb
   Q==;
X-CSE-ConnectionGUID: lA80B5+fQf+X7ABflnoxYA==
X-CSE-MsgGUID: hpHaWWGtS0Kg0USwWb0kmg==
X-IPAS-Result: =?us-ascii?q?A0AaAACS5u1q/4//Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJA4xvhziCIQOeIYF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYA?=
 =?us-ascii?q?T0cAwECLysjCBmDAgGCOgM3AxG8RYF5M4EBgykBPwJDUNhMEG+BaAELFAGBO?=
 =?us-ascii?q?AGFQYgkXRgBhH0nG4FJRIEVg2mBBYFcAogmBIMcEoFajRgCgVGGeUiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBd?=
 =?us-ascii?q?gKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCD?=
 =?us-ascii?q?Qx0ORAwHiQvBRwmPhsKLxgNSBEsNxUZBD5uB5I9gh8mLQ4SLw5RAStWRYERk?=
 =?us-ascii?q?y5Dj2SCIYE1n1yEKowklToaM4QEgVelFguYfYJZizGWUYRpgWg8gVkzGggbF?=
 =?us-ascii?q?YMiCUoZD44uCwuDYIUTUcYIJjICCQMvAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:dRKaFaD3adqAARVW/37iw5YqxClBgxIJ4kV8jS/XYbTApG4qhTQPy
 WMWDGuDaf3eMWfxKN13OY7jp00C7Z7WyNc1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEx9w+VGtrfoMh9KVHXkhk+
 /geLyA8R0XW7w626OrTpuhEnM8vKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY0BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOl1IgieCwa4W9ltqiRd11l3mni
 X79p0f2WiwhK+OVkTmA/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVlOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:MKfYbqDqYVzrdM3lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:s/P+XWAHZg/Opt76Ey1OpBY+R4MrS3Oe/Cj5CUG8D2F5eZTAHA==
X-Talos-MUID: 9a23:wXArHgsqgx7YSsPPLc2nhClCPfhXzLiVUGMCyag9pPaObS91NGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="536910537"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id D3D38180004BA
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 461F9CBEF72; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 21/27] python3-git: fix CVE-2026-78677
Date: Fri,  6 Nov 2026 06:43:25 -0800
Message-Id: <20261106144331.3354811-22-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249680
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/b68afff45af0f49e79a3e2d2162018986b37ad5d
[2] https://security-tracker.debian.org/tracker/CVE-2026-78677

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Clarified the --bundle-uri comment and changed the unsafe-clone-options
  docstring to cover unsafe command execution or I/O. The --separate-git-dir
  guard is unchanged.
---
 .../python/python3-git/CVE-2026-78677.patch   | 87 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch
new file mode 100644
index 0000000000..2f7714e6cc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch
@@ -0,0 +1,87 @@
+From 03baa6374b8769a9544292d84040b323c5f1437a Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 11:20:03 +0200
+Subject: [PATCH] Block separate git directories during clone
+
+<!-- agent -->
+Repo.clone() and Repo.clone_from() did not reject the clone option that
+redirects repository metadata to a caller-controlled path (GHSA-8mcc-hrx5-hvxc).
+Regression coverage exercises both keyword and multi-option input through both
+public clone APIs.
+
+Add the option to the existing clone denylist, matching Repo.init()
+and the documented allow_unsafe_options contract. Git itself registers
+
+The Python package and Alpine test workflows failed across the submodule suite
+because GitPython internally supplies --separate-git-dir when creating modern
+submodule layouts. The new public clone guard correctly rejected that option,
+but could not distinguish the library-generated path from caller input.
+
+Validate caller-provided keyword and multi-options before adding the
+library-controlled metadata path, then explicitly allow the resulting trusted
+clone invocation. This preserves rejection of unsafe clone_multi_options while
+restoring normal submodule creation. Update the one test that intentionally
+invokes Repo.clone_from() with its own separate git directory to opt in
+explicitly.
+
+CVE: CVE-2026-78677
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/b68afff45af0f49e79a3e2d2162018986b37ad5d]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_submodule.py because the current PyPI
+  source archive does not include the test suite and the python3-git recipe
+  does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit b68afff45af0f49e79a3e2d2162018986b37ad5d)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 10 ++++++++++
+ git/repo/base.py              |  2 ++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index d25df367..410f41e2 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -9,6 +9,7 @@ import logging
+ import ntpath
+ import os
+ import os.path as osp
++import shlex
+ import stat
+ import sys
+ import uuid
+@@ -360,6 +361,15 @@ class Submodule(IndexObject, TraversableIterableObj):
+         module_abspath = cls._module_abspath(repo, path, name)
+         module_checkout_path = module_abspath
+         if cls._need_gitfile_submodules(repo.git):
++            if not allow_unsafe_options:
++                Git.check_unsafe_options(Git._option_candidates([], kwargs), repo.unsafe_git_clone_options)
++                multi_options = kwargs.get("multi_options")
++                if multi_options:
++                    Git.check_unsafe_options(
++                        shlex.split(" ".join(cast("Sequence[str]", multi_options))),
++                        repo.unsafe_git_clone_options,
++                    )
++            allow_unsafe_options = True
+             kwargs["separate_git_dir"] = module_abspath
+             module_abspath_dir = osp.dirname(module_abspath)
+             if not osp.isdir(module_abspath_dir):
+diff --git a/git/repo/base.py b/git/repo/base.py
+index fd6d660d..56a19dc5 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -158,7 +158,9 @@ class Repo:
+         "-c",
+         # Can install hooks that execute during clone:
+         "--template",
++        # Redirects the repository metadata to a caller-controlled path:
++        "--separate-git-dir",
+         # Fetches from an additional caller-controlled URI:
+         "--bundle-uri",
+     ]
+     """Options to :manpage:`git-clone(1)` that permit unsafe command execution or I/O.
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index dc7694f593..fbb1553778 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -45,6 +45,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76222-regression.patch \
            file://CVE-2026-76222_p2.patch \
            file://CVE-2026-78678_CVE-2026-78679.patch \
+           file://CVE-2026-78677.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

