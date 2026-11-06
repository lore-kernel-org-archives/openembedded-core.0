Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7520.1793976214416324349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U2w76X8X;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6401; q=dns/txt;
  s=iport01; t=1793976215; x=1795185815;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1Vt1VYGcPL91BN9pjY7HrCQHVEvwlWZ+is/1ySmRMmU=;
  b=U2w76X8X2cE0M+UULK+s2HkmG03BBuHVgYuWaGA2QMt2x40x+RdvEJ4g
   5ssvBIBavODsSeCG8m6iEfxjkZFyqrhTHtMdjkc1FgeEc/3BMiW/untEG
   QxBQYqARs3tcrg/eNQuUMfswPVTZhUnD/lq+qzrMHQZs/z3MpUM6+qAq4
   3UPndE4rZy0Z7MMCzLePFRBCuAyZnXvbXWEFuqp4e952TXciHzkJdvTJi
   fF2rT8w/cNx02th61m06nD5mI0xu2Yr2XlIg9XVBcGtpC41LkyfICN+1/
   ZDUCmAf8p5bnET7xXF04bZBo/+idTXBWqNCn5iKSLuVvP3pzSWzvgYpkz
   g==;
X-CSE-ConnectionGUID: XxME6hARTSm8uAsZoies8A==
X-CSE-MsgGUID: EzLloPgLS9OsiYpbz7GAdw==
X-IPAS-Result: =?us-ascii?q?A0AaAAAN5+1q/4r/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJA4RUiBuHOIIhA54hgX4PAQEBD0QNBAEBhD9GAo4dAiY0C?=
 =?us-ascii?q?Q4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMPA?=
 =?us-ascii?q?RgBPRwDAQIDAiYCAisjCBmDAgGCOgM3AxG8TXqBMoEBgykBPwICQAFQ2EwQb?=
 =?us-ascii?q?4FoAQsUAYEKLgGFQYMgAYUDXRgBhH0nG4FJRIEVg2mBBYFcAgKFOoJqBIMcE?=
 =?us-ascii?q?oFagQOMFQKBUYZ5SIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvWBsGB?=
 =?us-ascii?q?YEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNSBEsNxUZBD0Bb?=
 =?us-ascii?q?geSPYIfASUtDhI9JCsCASuCExkepVihEYQqjCSVOhozhVulFguYfY4KlTWBH?=
 =?us-ascii?q?IRpgWg8gVkzGggbFYMiCUoZD445g2uFE1HGCCYyAgkDLwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:Qq3/xKnLxIjMBDo9cV9W3TPo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfD2DSb/aDYWege4oka42xpEMB7JSDn4VlTVRkqSFgRFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs//b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fb0I38spAUh0y
 ccdeC0kdSKEhu+tkJvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYGNKoDTFZUK9qqej
 k/U22D+Oh4+D4240ju06ni+2cDmkTyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:U2qZDa8RBYPhnf7hLFFuk+D6I+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3Ag87vpWlYCFNzje/efoODN5JH9MjXOU3N6VqOI2a?=
 =?us-ascii?q?CNV1sGKC8Um2X+a5/w+M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AYCHZkg04+GiDvITsqchTd29hnDUjzraKDEc1nrE?=
 =?us-ascii?q?96u6fNB1oMSXCox27Xdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="530841887"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 7DE6718000280
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 12565CBEF6D; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 13/27] python3-git: fix CVE-2026-73619
Date: Fri,  6 Nov 2026 06:43:17 -0800
Message-Id: <20261106144331.3354811-14-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249688
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
 .../python3-git/CVE-2026-73619_p1.patch       | 58 +++++++++++++++++++
 .../python3-git/CVE-2026-73619_p2.patch       | 43 ++++++++++++++
 .../python/python3-git_3.1.43.bb              |  2 +
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73619_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73619_p1.patch
new file mode 100644
index 0000000000..0f8541216c
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
2.53.0

