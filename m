Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EEFC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:40:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.4934.1665477608200334982
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UefSeu3F;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665477606; i=@fujitsu.com;
	bh=YeXjoxPbxnBz9sWxFdyR4mn4vjHH6px11XO1Ddk0xfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UefSeu3FXRtmsyQUd3cm3tUhY9gs6DqJSflSaSjqjJBk9gOZ2Cq+AxIWebF7egwu+
	 L2i8rFCQ9k2vXPh7dPi5Fn/rSwkySC2ffKr5WOwcBM6w1h1k7S0hFSBomX7i/sxLzS
	 79B8aeKNLaojMB69Ah/q/vv7Uz2K5PuB+BayZWzfYOsW7LINpG59W7dkGGXVG+oz6/
	 GElGuUxWaOmODPKVmAP7vZhGOLNOyE/T6iia70XRlnKeiHkj12CLP0tHWr6kQQtdMp
	 KGGkhYN2+Pmlfsy1Mfoz2YumXta8M5XCKXmeGfmloJ5SyADmYD3P2NkfqqsA2hJqBp
	 Ttm9GuE1i+Q2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8OxWfeZtmu
  ywdcV/BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8acMwvZC24IV3Ru38jWwPhMsIuRi0NI4D6j
  xPIz51m6GDmBnEtMEr1ntCDsPYwSL3c5gdhsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgI9E7byoziM0ioCoxc2I7I4jNK+AkcepsC1iNhICCxJSH75lBxnAKOEsc3F8LsclJYu
  2kDhaIckGJkzOfsECMl5A4+OIFM0SrosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjNZJRZnpGSW5iZk5uoYGBrqGhqa6xua6hmZGeolVuol6qaW65anFJbpAbnmxXmpxsV5x
  ZW5yTopeXmrJJkZgAKcUqy7awbh/1U+9Q4ySHExKorxd6q7JQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4vbWAcoJFqempFWmZOcBogklLcPAoifAuVQFK8xYXJOYWZ6ZDpE4xWnJMnf1vPzPHcj
  A582vbAWYhlrz8vFQpcV4LYMwKCYA0ZJTmwY2DRfwlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hy
  MSsK8ESBTeDLzSuC2vgI6iAnooJNXnUAOKklESEk1MG1+bDXVJHK31vRJL3xiej+aRVp0VeVP
  NGRt+5iue/B6jMCLQoXEu8fN3uv+eX/vreDCEkY78wn7nTa4bkr7+GHi1dics602ce89VhR2X
  Ej9bBXCYWtvc1M4kIHBp6Pgyq3pBm/X39goI1CrqX3xatmp/tz1E6e/e/b6r9329TqaW5tfxf
  ydy9bJe/7EGXa9pwb8+06nLOjWmFh8yrbv0S+xCj+WHVWq/xjTQl5uF1iZ668rYrrwmbnU680
  LXs4RMLNLK7KI/9febmc5cZI236q+p1op/Yr7pOVLbr7t+X6eu/n691QOf9aFEQ92flvue/PG
  b59tp/aqtP1Ytbjx7CvDL8YnZtgcsmrcaHqd10+JpTgj0VCLuag4EQCLEZf3cwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1665477606!305895!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13168 invoked from network); 11 Oct 2022 08:40:06 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:40:06 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EA7EE73
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:40:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DDDDE7B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:40:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:40:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.24.0 -> 2.24.1
Date: Tue, 11 Oct 2022 16:39:23 +0800
Message-ID: <1665477563-16679-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
References: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:40:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171615

0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...sable-libunwind-in-native-OE-builds-by-not-looking.patch | 6 +++---
 .../libsdl2/{libsdl2_2.24.0.bb => libsdl2_2.24.1.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.24.0.bb => libsdl2_2.24.1.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
index 57bc522393..f34b870e74 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
@@ -1,4 +1,4 @@
-From 0234c546d86174fafe9ab280cf5f44de50b73676 Mon Sep 17 00:00:00 2001
+From 77093de6a12c24a60fc447698900d18d0a3943af Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Fri, 18 Mar 2022 12:06:23 +0100
 Subject: [PATCH] Disable libunwind in native OE builds by not looking for
@@ -22,10 +22,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 644715a..bbf2e28 100644
+index 7617205..d9b1522 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -869,7 +869,7 @@ if(SDL_LIBC)
+@@ -952,7 +952,7 @@ if(SDL_LIBC)
      check_include_file(sys/types.h HAVE_SYS_TYPES_H)
      foreach(_HEADER
              stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string.h limits.h float.h
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
index d5cbf73df2..6bff0b8fe3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-build
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "91e4c34b1768f92d399b078e171448c6af18cafda743987ed2064a28954d6d97"
+SRC_URI[sha256sum] = "bc121588b1105065598ce38078026a414c28ea95e66ed2adab4c44d80b309e1b"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


