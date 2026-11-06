Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7518.1793976213994639424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VrJBu0kt;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4451; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=80D9DbwH+lzgJpiUaNtYWzeAGG15okqQnhVYTsoEPJY=;
  b=VrJBu0ktSyqpCXWpY5porOU5obqEC4ysCDNnUl9GhI5oxpye/G66dcoi
   Tw3OFSWYGTSlDuZi9zrA1egZUQrkIg84/EGgl/hphcDv0tAqfN21PGYJ3
   7XKJa68EpdAeArB9UVo8MUfW9y1XmPLB4/mbmF/fESIQwSOu2Y4QAvyYj
   WOHeefF9obmWTryosb++w/iEXrcHLAJWCYUVU7I7o87QXngNF0CNREi1z
   doQ/+WgyyNn2UuD0w+uMbyVq5Hcg33YV37FgdAvF+f7cAAlPmyMlGxfVI
   RgSZZu5pQFzHJ5SwkYPvKODyxmn0jvXolobsn1kvF1ln23oE5Bm8CXMHg
   A==;
X-CSE-ConnectionGUID: 6LtodBHcQX6KAXby8jaDnA==
X-CSE-MsgGUID: C234mXymT7uQPNQpzRLfNQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgAQ5u1q/5D/Ja1aH4I6gld1YENJA5QngiEDniGBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRvD+Be?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBhH0nG4FJRIEVg2mBBYFcA?=
 =?us-ascii?q?oEnhn8Egg2BDxKBWoEDgiKJcwKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovG?=
 =?us-ascii?q?A1IESw3FRkEPm4Hkj2CHyZGBz1RARAbBIEBgScPpWehEYQqjCSVOhozhVulF?=
 =?us-ascii?q?guYfY4KlWgcTYRpgWg8gVkzGggbFTuCZwlKGQ+OLgsLg2CFE1FsxRwmMgIJA?=
 =?us-ascii?q?y8BAQcCBw4DC4FokAACJgeBTwEB?=
IronPort-Data: A9a23:+xPX76PmW/Ro+kTvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUomhGZSz
 WcWWm2Ca/uIYGL2f9h0bd7jp0tT78PUndRkGnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66tKEEY6F60Tw9YpIkh+/
 +1IKjkhaDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVAsieG8a4uLEjCMbe4PxRqdl
 nPDwzvkOyk8DcSN8x6L1Ev504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvWS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:/Ar506vqGNxG5oNFwGi/p2Gl7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3At5LFImu1TJazt/pfXa0hm8ZQ6It7VmHawF3wKHa?=
 =?us-ascii?q?IV0VAeLeEGV2Z1KVNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AGUKm1gxqPtVUEqBwXVCCRa0VDmeaqI/0UxwIoYQ?=
 =?us-ascii?q?Dh5aZDBRWAi+PthC5ZLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545119396"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 781CE180003FC
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 04029CBEF6B; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 11/27] python3-git: fix CVE-2026-73621
Date: Fri,  6 Nov 2026 06:43:15 -0800
Message-Id: <20261106144331.3354811-12-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249668
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/38553b6fddc7f6a667cdb45a6762343a08fc72b2
[2] https://security-tracker.debian.org/tracker/CVE-2026-73621

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Cleaned whitespace in the Backport Changes note.
---
 .../python/python3-git/CVE-2026-73621.patch   | 72 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
new file mode 100644
index 0000000000..49cdb257d0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
@@ -0,0 +1,72 @@
+From 3186ded297a9818f887c3de47fc2f0aba6a8b298 Mon Sep 17 00:00:00 2001
+From: Sebastian Thiel <sebastian.thiel@icloud.com>
+Date: Sat, 25 Jul 2026 06:27:01 +0200
+Subject: [PATCH] fix: reject unsafe output options in Commit.count
+
+<!-- agent -->
+
+Commit.count forwards keyword arguments to git rev-list but did not apply the
+unsafe-option validation used by the sibling revision APIs.
+
+Validate forwarded options with the existing Git.check_unsafe_options helper
+and retain the explicit allow_unsafe_options escape hatch. This covers
+GHSA-p538-c434-8v24 without adding another option parser.
+
+Git baseline: git.git a23bace963 defines --output as a shared diff option
+consumed by setup_revisions; t/t6000-rev-list-misc.sh exercises that option
+with rev-list.
+
+CVE: CVE-2026-73621
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/38553b6fddc7f6a667cdb45a6762343a08fc72b2]
+
+Backport Changes:
+- Omitted test/test_commit.py because the current PyPI source
+  archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 38553b6fddc7f6a667cdb45a6762343a08fc72b2)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/commit.py | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/commit.py b/git/objects/commit.py
+index cc85e7dd..549e12c7 100644
+--- a/git/objects/commit.py
++++ b/git/objects/commit.py
+@@ -269,13 +269,21 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+         else:
+             return self.message.split(b"\n", 1)[0]
+
+-    def count(self, paths: Union[PathLike, Sequence[PathLike]] = "", **kwargs: Any) -> int:
++    def count(
++        self,
++        paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> int:
+         """Count the number of commits reachable from this commit.
+
+         :param paths:
+             An optional path or a list of paths restricting the return value to commits
+             actually containing the paths.
+
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--output``.
++
+         :param kwargs:
+             Additional options to be passed to :manpage:`git-rev-list(1)`. They must not
+             alter the output style of the command, or parsing will yield incorrect
+@@ -284,6 +292,11 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+         :return:
+             An int defining the number of reachable commits
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs), unsafe_options=self.unsafe_git_rev_options
++            )
++
+         # Yes, it makes a difference whether empty paths are given or not in our case as
+         # the empty paths version will ignore merge commits for some reason.
+         if paths:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 6456031620..f712a0e699 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73623.patch \
            file://CVE-2026-73624.patch \
            file://CVE-2026-73622.patch \
+           file://CVE-2026-73621.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

