Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8009.1795062167036122572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Pn5Fs2hM;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3915; q=dns/txt;
  s=iport01; t=1795062168; x=1796271768;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xj8j29GyaetKOFuVCyE1loRX+vImEk/jvFS8y8aNdxs=;
  b=Pn5Fs2hMx5VivdSZsN4ljO8GSR/0i67dlW7ygn+xSNyvjIOfwWfYK9E6
   EKoy1VCz/QPAXvkNanUQCJHf7bSq8PUetP1Xu69aRz1X4qASJ0A/wAfG8
   eMQjlfr9P9/9ksAtJ7q6uXaZwDS/WLHwGyUUKWCpmK0m3ddWuaSPFCqRd
   VTLmqmDjzOWA+6X8YdmB+5GVSrQGDewLevqK+ND3XJ5DCaClotP5zEy3I
   ed6mC05Umy6A6e3EdFyc2x+VEFRedKn3czMB+R6E5bjL77J4rRw4Q0Wx9
   80Eha/B/6S3muH6FCotDmSc20PcZxylIC7OeWu7b6ESFnloK76yVSQG8r
   Q==;
X-CSE-ConnectionGUID: TaimdiVGQNOHzbWPjqTd+A==
X-CSE-MsgGUID: pTTWX2oySvKrmytsm8pIhQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/85K/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaoEFgVwCi?=
 =?us-ascii?q?CYEgg2BDxKBVIECgiCJdQKBT4gKSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfH?=
 =?us-ascii?q?hsOAg4YDUgRLDcVGQQ+bgeTUYJLTT1RASuCLA+TKJAdgiGhEYQrjCSVOhozq?=
 =?us-ascii?q?nILmH2OCpZRhGqBaDyBWTMaCBsVO4JnCUoZD445g2uFE1HGWiYyAgYDAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:gqXQNaMfssY+myPvrR3vlsFynXyQoLVcMsEvi/4bfWQNrUoh1TxWy
 zMaX2qPbPuPamr8KNogPIm0pksAu57cm4dqHnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gm4saQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68lnDUQ6PLM3w8BQIXNEy
 sQaMQwBLTnW0opawJrjIgVtrs0uNozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2IxBPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCNlV0oieexaLI5fPSSeflqrhyft
 1nY3H78Ew0BMYyH6Dq8pyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgdUkG2if24kVKlHdVHJ
 koZ/yAjoaQ/+AqsVNaVYvGjiHeJpFsYHtFXCeB/sFzLwavP6AHfDW8BJtJcVOEbWAYNbWRC/
 je0cxnBXFSDbJX9paqhy4qp
IronPort-HdrOrdr: A9a23:UOUFiqHlNvG2qSZcpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3A4aCjvGrqeqnExK/XuZmCQinmUfwsc3jRzUn/Gmm?=
 =?us-ascii?q?fKXRjd4WXUGOcu4oxxg=3D=3D?=
X-Talos-MUID: 9a23:4affDwRvTMQstaFeRXT0uA1dBJ1v8p+wK1oIgIkdvpmcFCxJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61911740"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id D5B0C180003BA
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:45 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 1D6F5CBEF8A; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 07/27] python3-git: fix CVE-2026-73625
Date: Wed, 18 Nov 2026 20:22:22 -0800
Message-Id: <20261119042242.1640611-8-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250616
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/e8d0fbf774d1f6baa3b481adfe48bd262e43b453
[2] https://security-tracker.debian.org/tracker/CVE-2026-73625

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Refreshed the embedded hunk context and index hashes.
---
 .../python/python3-git/CVE-2026-73625.patch   | 59 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
new file mode 100644
index 0000000000..8f2638017c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
@@ -0,0 +1,59 @@
+From ef95f1434023af72deabaf91e7154260d4625271 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:39:00 +0200
+Subject: [PATCH] fix: validate split short-option values
+
+<!-- agent -->
+
+Single-character keyword arguments are transformed into an option token and
+a separate value token. The unsafe-option candidate builder only checked the
+keyword name, allowing an option-like value to bypass guards shared by clone,
+remote, revision, blame, and archive operations.
+
+Include dash-prefixed values only when short options are actually split,
+including sequence values, while preserving bare values and the non-splitting
+compatibility path.
+
+Git baseline a23bace9 defines clone -n and --upload-pack as distinct options,
+matching the argv boundary this validation now preserves.
+
+Refs GHSA-r9mr-m37c-5fr3.
+
+CVE: CVE-2026-73625
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/e8d0fbf774d1f6baa3b481adfe48bd262e43b453]
+
+Backport Changes:
+- Omitted test/test_git.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does
+  not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit e8d0fbf774d1f6baa3b481adfe48bd262e43b453)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index eb7bf055..2ce27290 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -804,11 +804,18 @@ Git._option_candidates
+             option for option in cls._unpack_args([arg for arg in args if arg is not None]) if option.startswith("-")
+         ]
+         if kwargs:
++            split_single_char_options = kwargs.get("split_single_char_options", True)
+             for key, value in kwargs.items():
+                 values = value if isinstance(value, (list, tuple)) else (value,)
+                 if any(value is True or (value is not False and value is not None) for value in values):
+                     key = str(key)
+                     options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
++                    if len(key) == 1 and split_single_char_options:
++                        options.extend(
++                            str(value)
++                            for value in values
++                            if value is not True and value not in (False, None) and str(value).startswith("-")
++                        )
+         return options
+ 
+     class AutoInterrupt:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 781ec512cc..551b47fc39 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67324.patch \
            file://CVE-2026-67322.patch \
            file://CVE-2026-69097.patch \
+           file://CVE-2026-73625.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

