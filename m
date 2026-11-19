Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8009.1795062167036122572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KZnax5yM;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6464; q=dns/txt;
  s=iport01; t=1795062168; x=1796271768;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Oy+t0QL2GsxtIBN225kxBJjt9IAQLF2ccN7xUOgkijA=;
  b=KZnax5yMTMpIN1fzE7fiDABmBJ0ydKamMcpFC2vT4dGdYbw1IU7XlsL2
   AoG8kPSVN/GklvFcqqK+G60DszYjQuwSq5T/UpIFx0gHtgd0PYgPAKMhV
   8bdYSGDb65Nz32HmKb4aqCQZg5dxlVXVNa6p0a1GVccAt7dmx1tH5ZZUH
   rRCd/fICpBta+4+4nzzn5QhjOQHRSzCI9FZvKKpaPOwuknKMsqYdk36sZ
   vaPWa2gTvC1kxDpgeNle5GUOcsRUsPynaGwYy7Sv4A/UziBud6Uk73AQz
   2bHYGHjgIA3bifdypU9N2+cE7jjf71UXdIdL45gGoq4BC6deO7J1lKJca
   w==;
X-CSE-ConnectionGUID: FFo8AI0MSOW9L8rLM8OkHQ==
X-CSE-MsgGUID: jrmS9kHsTuWoZxTDw13+cw==
X-IPAS-Result: =?us-ascii?q?A0BLAgDWd/5q/8xK/pBaHgEBCxIMggULgld1YENJA4RUj?=
 =?us-ascii?q?1OCIQOeKYF+DwEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMjDwEYAT0cAwECAwImAgIrIwgZg?=
 =?us-ascii?q?wIBgjoDNwMRuTV6gTKBAYMpAT8CAkABUNhMEG+BaAELFAGBCi6FQoMgAYUDX?=
 =?us-ascii?q?RgBhH0nG4FJRIEVg2qBBYFcAgKFOoJqBIMcEoFUgQKMFQKBT4gKSIECHANZL?=
 =?us-ascii?q?AFVEw0KCwcFgWgDNRIqFW4yHYEjOxcvWBsGBYEcgR6BEoEDXYErKF4hgQiBd?=
 =?us-ascii?q?gKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCD?=
 =?us-ascii?q?Qx0ORAwHiQvBRomPhsKgQwnHx4bDgIOGA1IESw3FRkEPQFuB5NRgiUBJS0OE?=
 =?us-ascii?q?j0kKwIBK4IEDxkepVehEYQrjCSVOhozhVulFwuYfY4KlTWBHIRqgWg8gVkzG?=
 =?us-ascii?q?ggbFYMiCUoZD445g2uFE1HGWiYyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:9Z05oKPWYIluSCvvrR3vlsFynXyQoLVcMsEvi/4bfWQNrUolgjQFy
 zRJCmHUOq3eM2eneIt2bYSx8kwP7MfUnNZjHnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gm4saQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69tACxEfHNU9wcFIUEUe7
 9g9eBcOTinW0opawJrjIgVtrs0uNozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2IzBPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCNlV0oieexabI5fPSIX8Buz0W4v
 V7bwGPLEi02K4XEijGapyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgdUkG2if24kVKlHdVHJ
 koZ/yAjoaQ/+AqsVNaVYvGjiHeJpFsYHtFXCeB/sFrLwavP6AHfDW8BJtJcVOEbWAYNbWRC/
 je0cxnBXFSDbJX9paqhy4qp
IronPort-HdrOrdr: A9a23:secvW6x27Kc46NEA/Y7XKrPwDr1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHDP5gr5NEtMpTnEAtjifZq+z+8R3WBuB9aftWDd0QPCRr2Kr7GSoQEIcBeQygcy78
 tdmtBFaOHYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:cHFsEm8RRcNu0d8YhpiVv2A6HZAMUyX491DvcmvoE0JMGJqWaWbFrQ==
X-Talos-MUID: 9a23:pHwOgQlB5dv8k8tSpRlIdnpgLsJTsqeOE3wQrpI0q/WoKnUreDyC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61911741"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 1B32318000220
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:46 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 4B8C7CBEF6D; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 13/27] python3-git: fix CVE-2026-73619
Date: Wed, 18 Nov 2026 20:22:28 -0800
Message-Id: <20261119042242.1640611-14-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250621
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca
[2] https://github.com/gitpython-developers/GitPython/commit/52199b39ce02c6e8f9fb49e95628b59deebf44c0
[3] https://security-tracker.debian.org/tracker/CVE-2026-73619

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Split the patch into p1 and p2 and updated SRC_URI to apply them in
  order. P1 adds the unsafe clone and archive options; p2 clarifies
  the --bundle-uri risk and its effect on Git’s URI access.
---
Changes in v3:
- Restored the required trailing spaces.
---
 .../python3-git/CVE-2026-73619_p1.patch       | 58 +++++++++++++++++++
 .../python3-git/CVE-2026-73619_p2.patch       | 43 ++++++++++++++
 .../python/python3-git_3.1.43.bb              |  2 +
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73619_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73619_p1.patch
new file mode 100644
index 0000000000..a600b8c002
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73619_p1.patch
@@ -0,0 +1,58 @@
+From 91f2b27eb8976ef5c663f1a0ea8180e2cf28cb10 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 26 Jul 2026 06:00:59 +0200
+Subject: [PATCH] Block unsafe archive additions and bundle URI
+
+GHSA-539m-9xh6-q6rr reports incomplete unsafe option lists for archive inputs
+and clone bundle URLs. Caller-controlled archive additions can expose or inject
+filesystem content, while clone --bundle-uri can dereference an additional
+caller-controlled URL.
+
+Extend the existing archive denylist with --add-file and --add-virtual-file,
+and the clone denylist with --bundle-uri. Regression coverage exercises archive
+kwargs plus both clone multi-option and keyword paths.
+
+Git baseline: a23bace963d508bd96983cc637131392d3face18.
+Documentation/git-archive.adoc defines --add-file/--add-virtual-file, and
+Documentation/git-clone.adoc defines --bundle-uri as fetching from the supplied
+URI.
+
+CVE: CVE-2026-73619
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_repo.py because the current PyPI
+  source archive does not include the test suite and the python3-git recipe
+  does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 2776c19e..4b783586 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -150,6 +150,8 @@ class Repo:
+         "-c",
+         # Can install hooks that execute during clone:
+         "--template",
++        # Fetches from a caller-controlled URL:
++        "--bundle-uri",
+     ]
+     """Options to :manpage:`git-clone(1)` that allow arbitrary commands to be executed.
+ 
+@@ -171,6 +173,10 @@ class Repo:
+         # Writes output to a caller-controlled filesystem path.
+         "--output",
+         "-o",
++        # Reads from a caller-controlled filesystem path:
++        "--add-file",
++        # Injects a caller-controlled path and contents:
++        "--add-virtual-file",
+     ]
+ 
+     unsafe_git_revision_options = [
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73619_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73619_p2.patch
new file mode 100644
index 0000000000..70d28217ec
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73619_p2.patch
@@ -0,0 +1,43 @@
+From 52199b39ce02c6e8f9fb49e95628b59deebf44c0 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 26 Jul 2026 08:56:06 +0200
+Subject: [PATCH] address review comments
+
+CVE: CVE-2026-73619
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/52199b39ce02c6e8f9fb49e95628b59deebf44c0]
+
+(cherry picked from commit 52199b39ce02c6e8f9fb49e95628b59deebf44c0)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 93d1725..6594101 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -150,10 +150,10 @@ class Repo:
+         "-c",
+         # Can install hooks that execute during clone:
+         "--template",
+-        # Fetches from a caller-controlled URL:
++        # Fetches from an additional caller-controlled URI:
+         "--bundle-uri",
+     ]
+-    """Options to :manpage:`git-clone(1)` that allow arbitrary commands to be executed.
++    """Options to :manpage:`git-clone(1)` that permit unsafe command execution or I/O.
+ 
+     The ``--upload-pack``/``-u`` option allows users to execute arbitrary commands
+     directly:
+@@ -165,6 +165,11 @@ class Repo:
+ 
+     The ``--template`` option can install hooks that execute during clone:
+     https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---templatetemplate-directory
++
++    The ``--bundle-uri`` option fetches from an additional URI before fetching from the
++    clone URL. An untrusted value can therefore make Git access local files or
++    unintended network resources:
++    https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---bundle-uriuri
+     """
+     unsafe_git_archive_options = [
+         # Allows arbitrary command execution through the remote git-upload-archive command.
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index d47ce73d72..f0ffb70df8 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -34,6 +34,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73622.patch \
            file://CVE-2026-73621.patch \
            file://CVE-2026-73620.patch \
+           file://CVE-2026-73619_p1.patch \
+           file://CVE-2026-73619_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

