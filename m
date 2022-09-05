Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21017ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:03:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.22865.1662368629101970036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ES3g8Ab8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368627; i=@fujitsu.com;
	bh=PFG6aHNV1JjHes41OTeQ2b6Jp1G9cfE5uTTPzaDpBP4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ES3g8Ab8p1vJGgd4OL34n+KIRCqN9YBONTV2eeeNT0vXgoDtPAeers8gpX6nKjMK6
	 bK2/0344RKVvBoVG8q7M7rLykKfcyrT6abbXJsteuMjvijDbYjr1z9tuXHQKhvgkgd
	 ecteY0IxKg3Dm7gMSgGu6xV5eoy5L4TXJUiqBTJ5rU2jzD2o5z6Ds8E/kvGeitPjun
	 sWxgWHdVzyCtGur9HK9pBp4E1Cj5nxi+GNBxjsBvpiB51T+ibM5DyhDp6M3ZWVJDpZ
	 AmShj1JV/11TJboYPY1PuMcqm4/3YnphTkDYRxYxwgWOf7Lx9yJFBgaqC6+p1mj4Be
	 +0ONu/jnbtnlw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRWlGSWpSXmKPExsViZ8MxSbdot2i
  yQVerrsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtG54BhrwWKxih+f57I1ML4X7mLk4hASeMwo
  se39bvYuRk4g5xqTxOvVRRCJ3YwSy2csYgJJsAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z1gvcICthKzN50Hs1mA4rd+NjGD2LwCThJnZuxjA7ElBBQkpjx8zwwyhlPAWeLkST+ItU4SS/
  e+ZoIoF5Q4OfMJC8R4CYmDL14wQ7QqSsy+3MwCYVdINE4/xARhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJtUlJmeUZKbmJmja2hgoGtoaAqkjXWNDM30Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1
  iitzk3NS9PJSSzYxAsM4pTj9xg7GXft+6R1ilORgUhLlfT9HNFmILyk/pTIjsTgjvqg0J7X4E
  KMMB4eSBO/KHUA5waLU9NSKtMwcYEzBpCU4eJREeP3XAaV5iwsSc4sz0yFSpxjtOabO/refmW
  M5mJz5te0AM8emfV0HmIVY8vLzUqXEeTeBTBUAacsozYMbCksBlxhlpYR5GRkYGIR4ClKLcjN
  LUOVfMYpzMCoJ83KBTOHJzCuB2/0K6CwmoLPs+oRBzipJREhJNTBJHJz5+aH1a57Ny3U1FES0
  Bd5tfTBjLlfU/pdXb989YxJ8Xn2n3B9vJa1SG6tNwnNZc5rjxcP8zt0wbs39MomlbYFil+YH9
  rufuEVkjefOW3XOVmldfau1AXNsFM/cW0sWq+9R95Dz+XOoQ2aHxeI755SPX2k+xNVTcv6nC8
  O6/jdne57c1GJr6DzavOLK9Func5a8rLueUvjyeP057wcrfV66TGXNLQ1eevmO/NT/u1i8f6x
  96zk/fHLTv94XD5Sq9dkf6mlldx48+CRQL2GWX9o1JubvZ8ydl4f/b/Ow8Wf5pfhhUzHnhOUv
  Zj9c9njSpfu7LLtjdF/+cFvSsjyafbFroHu07ZauvJXXhCKeKLEUZyQaajEXFScCALn0Mlt8A
  wAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1662368626!261828!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1534 invoked from network); 5 Sep 2022 09:03:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:03:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1D56D1000C1
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:46 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 10A22100078
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:03:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] piglit: upgrade to latest revision
Date: Mon, 5 Sep 2022 17:03:20 +0800
Message-ID: <1662368601-32265-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
References: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170303

0004-CMakeLists.txt-add-missing-endian.h-check.patch
removed sinct it's included in new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Lists.txt-add-missing-endian.h-check.patch | 25 -------------------
 meta/recipes-graphics/piglit/piglit_git.bb    |  6 ++---
 2 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0004-CMakeLists.txt-add-missing-endian.h-check.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0004-CMakeLists.txt-add-missing-endian.h-check.patch b/meta/recipes-graphics/piglit/piglit/0004-CMakeLists.txt-add-missing-endian.h-check.patch
deleted file mode 100644
index 68f783ebe4..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0004-CMakeLists.txt-add-missing-endian.h-check.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a8ea135125b284a8a9c965d8091b3d1d9a31849c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 5 Apr 2022 16:51:34 +0200
-Subject: [PATCH] CMakeLists.txt: add missing endian.h check
-
-This is needed to actually have HAVE_ENDIAN_H defined properly in config.h.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/648]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9fb0508da..158fac4bc 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -481,6 +481,7 @@ check_include_file(sys/stat.h  HAVE_SYS_STAT_H)
- check_include_file(unistd.h    HAVE_UNISTD_H)
- check_include_file(fcntl.h     HAVE_FCNTL_H)
- check_include_file(linux/sync_file.h HAVE_LINUX_SYNC_FILE_H)
-+check_include_file(endian.h    HAVE_ENDIAN_H)
- 
- if(DEFINED PIGLIT_INSTALL_VERSION)
- 	set(PIGLIT_INSTALL_VERSION_SUFFIX
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 29360a246b..f758208c6b 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,11 +10,11 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
-           file://0004-CMakeLists.txt-add-missing-endian.h-check.patch \
-           file://0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch"
+           file://0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch \
+           "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "6403e90dc7da02d486906cddab8d02c2552a8d46"
+SRCREV = "265896c86f90cb72e8f218ba6a3617fca8b9a1e3"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.25.1


