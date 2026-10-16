Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D36CCF2C2
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15902.1792131565169883842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CmWvtYfN;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4504; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UyxD81cF7MRkVCLshB97amFeYOcpofzZ8gwRSS3Kq7U=;
  b=CmWvtYfNcoj7LrtBzyGwrWaxVr9zBwyqcPvDVS1jlKJgIq7Gvlb4ODp0
   rciVuZuaZcIX9dtvRgagxWELtMlnMh6xNhAA/W8JFZhO88ScjVb3IozBz
   ftW1ddVmPyJEMvexE/y3GXD1p5hoQz0gSUydDPu59zH2O0LxjUipbucfi
   u7zKzQw7SwbXzD2W5vUO2yNrsh+P+KbWJN0xdvCCsBjD0be6cuNKwSwIg
   PFmEglO7B/CzDM2XEf5a2ixcIcfLekgumL6MTdsjEfUKrpZfj0tofHyXO
   EQQA24x+tn9aH60b2Z40WQDoaBS8qKNGDy+hDMjxD/+Kt/RWF8k2FPq0O
   g==;
X-CSE-ConnectionGUID: b5j3KMYMT0SayD96V21XQg==
X-CSE-MsgGUID: H9/MBVSDRlOt9jsH8GwJag==
X-IPAS-Result: =?us-ascii?q?A0BKAgDpwNFq/5D/Ja1aHgE8DA4LgVmCV3VgQ0mUKYIhA?=
 =?us-ascii?q?54cgX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDE?=
 =?us-ascii?q?bx2gXkzgQGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYMZgWMnG4FJRIEVg?=
 =?us-ascii?q?2mBBYFcAgIYiAsEgg2BDxKBWoEDhAuQOUiBHgNZLAFVEw0KCwcFgWgDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3F?=
 =?us-ascii?q?RkEPm4HkhQegXImRgc9UQEQGwSBAYE2pWahD4QojCKVOhozhVulFAuYfY4Kl?=
 =?us-ascii?q?WYcTYRpgWg8gVkzGggbFTuCZwlKGQ+OLgsLg2CFE1FsyAonMgIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:uwF10a8oKaqA704AbIDxDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WYaD2CGbqmMajf2Kt53OoTg9UlU756GyN5mHlY5pC5EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k8YI9D2cNGJF0Wz
 vUJBGFTUErat9u5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW2boWPIIPRGa25mG649
 yXj1VrCLiseE8DOyyGlol2zpObAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYS/1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:2RtKbqiIR5Tx8VI9n6Im/FgKVnBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:pDtws2zmtXY7VlNIhgNABgUeR8J+UVjs6UuIGEapJTc3dufMeWafrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AHEi7zg0sE4GmYPT+N1k2/I7lPTUjw/XpLWozqrk?=
 =?us-ascii?q?8v+6YZC5rG2eykxa+Tdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536722734"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 9CEE8180003CB
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 0BF10CC1251; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 11/27] python3-git: fix CVE-2026-73621
Date: Thu, 15 Oct 2026 23:19:06 -0700
Message-Id: <20261016061922.843414-12-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247982

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1]

[1] https://github.com/gitpython-developers/GitPython/commit/38553b6fddc7f6a667cdb45a6762343a08fc72b2
[2] https://www.cve.org/CVERecord?id=CVE-2026-73621

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73621.patch   | 76 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
new file mode 100644
index 0000000000..4f17cdc23c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
@@ -0,0 +1,76 @@
+From f4029fab1d9f47bd31ccd8334f433249c430e0a4 Mon Sep 17 00:00:00 2001
+From: Sebastian Thiel <sebastian.thiel@icloud.com>
+Date: Sat, 25 Jul 2026 06:27:01 +0200
+Subject: [PATCH 19/38] fix: reject unsafe output options in Commit.count
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
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 38553b6fddc7f6a667cdb45a6762343a08fc72b2)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/commit.py |   19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/git/objects/commit.py b/git/objects/commit.py
+index ae60d286..ff852489 100644
+--- a/git/objects/commit.py
++++ b/git/objects/commit.py
+@@ -241,21 +241,34 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
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
+             An optional path or a list of paths restricting the return value
+             to commits actually containing the paths.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--output``.
++
+         :param kwargs:
+             Additional options to be passed to git-rev-list. They must not alter
+             the output style of the command, or parsing will yield incorrect results.
+ 
+         :return: An int defining the number of reachable commits
+         """
+-        # Yes, it makes a difference whether empty paths are given or not in our case
+-        # as the empty paths version will ignore merge commits for some reason.
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs), unsafe_options=self.unsafe_git_rev_options
++            )
++
++        # Yes, it makes a difference whether empty paths are given or not in our case as
++        # the empty paths version will ignore merge commits for some reason.
+         if paths:
+             return len(self.repo.git.rev_list(self.hexsha, "--", paths, **kwargs).splitlines())
+         return len(self.repo.git.rev_list(self.hexsha, **kwargs).splitlines())
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index fe809b2229..5bbb20c842 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -32,6 +32,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-73623.patch \
             file://CVE-2026-73624.patch \
             file://CVE-2026-73622.patch \
+            file://CVE-2026-73621.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


