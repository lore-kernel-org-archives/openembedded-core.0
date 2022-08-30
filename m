Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61F7ECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:10:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.7721.1661832598888890204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=b5NkG0Y9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832596; i=@fujitsu.com;
	bh=Knv52BDCBsTOl8QkYJGIZSS8JJVisK/bF9R7B4aAUxg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=b5NkG0Y9YIs/n8BlecGTl/QoTqqaizVSem9NsUitEubMwTLQ5eoNm/Jrt8N2arSmJ
	 t2rx1zQeoe3TVdEwHBMe7ntiMRyParPdVv79zQerxjKprzWKZ0/3yk3o89rGfZYBbL
	 KCU9bqO3yRBiEQYpnYc9mnhztuxS5IzKUQtapoRK0F9SvqKPTb2u31Zp4ED5UTBZpJ
	 cyTDxP4Y+pPixV01teOiShxdZnQhWQUwhzmNmjVXojzMTQEOZ0GcazVkAayhqmjfjW
	 V7TWEZRCUdpShLsypSy+6Jy/s6o+vZHbSsebMcYRsck9DaMKLun4Q4URXo0OBfhrX4
	 mE5bPO8pg93hQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsViZ8ORpDullzf
  Z4P5sIYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePF/26mghVSFTsun2FtYNwr3sXIxSEk8IBR
  4vLy3ywQzhUmiT9H9zFCOHsZJa4/2sLcxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAtYS85+cZAWxWQRUJWY8O8cOUs4r4CTx9LUnSFhCQEFiysP3YBM5BZwlVl99xQRiCw
  GVbHqxggXE5hUQlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0rsmdXPBGGrSVw9t4l5AqPgLCT
  ts5C0L2BkWsVomVSUmZ5RkpuYmaNraGCga2hoqmuoa2qpl1ilm6iXWqpbnlpcomuol1herJda
  XKxXXJmbnJOil5dasokRGMApxYzWOxg7+n7qHWKU5GBSEuVd2MqbLMSXlJ9SmZFYnBFfVJqTW
  nyIUYaDQ0mC93I3UE6wKDU9tSItMwcYTTBpCQ4eJRFe7y6gNG9xQWJucWY6ROoUoyvHh0NX9j
  JzXL0CIqfO/refmWM5mJz5te0AsxBLXn5eqpQ474QeoGYBkOaM0jy40bBEcIlRVkqYl5GBgUG
  IpyC1KDezBFX+FaM4B6OSMO8GkCk8mXklcBe8AjqOCei4h0u4QY4rSURISTUw5RV+Wv/+yvO8
  HSuOvt52i9ntfMJsfvm5AUX9zMz7RKarTTuRc3zZkskP3e9teHGpzf6jZomCYN97FsX7F6923
  vq6tdjLSW+r5aZ/RZnx095WTNKpbzBJcH47+91Ht1vsR77xtglbX7/eICTWob0mlDe7J1FhyW
  J+zgwz5xNr3usEnNxW5295ehKLwfSljTu+59vMzpqxYeX1Mx9SLpRsvLTp6KWKJs17bO9jJbO
  i6n+cebol5Dm/QbVZauTf8Fgd1r/LVh2/EqMdf/6nXXrXx57UR8Hr927s2jJ1faH5bYnp8zvZ
  ru048cx7iuILrSVLLafd/eo84674rE98E58GKYtZfXjxzLFY+pqonkO35j4lluKMREMt5qLiR
  ACVnjkufwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1661832596!416395!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22555 invoked from network); 30 Aug 2022 04:09:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:09:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DDE5C1AD
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:55 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D1EB81AB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:09:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libwpe: upgrade 1.12.2 -> 1.12.3
Date: Tue, 30 Aug 2022 12:09:21 +0800
Message-ID: <1661832561-12506-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
References: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:10:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170051

Changelog:
  Fix the build when using Clang's libc++ or the Musl libc.

0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
removed since it's included in 1.12.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ure-due-to-libc-using-libc-functions.patch | 42 -------------------
 .../{libwpe_1.12.2.bb => libwpe_1.12.3.bb}    |  6 +--
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
 rename meta/recipes-sato/webkit/{libwpe_1.12.2.bb => libwpe_1.12.3.bb} (72%)

diff --git a/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch b/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
deleted file mode 100644
index 6d27b4835d..0000000000
--- a/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ccf8a58c3536ca0e62748e0ea477514e14d821bc Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Thu, 4 Aug 2022 12:19:05 +0300
-Subject: [PATCH] Fix build failure due to libc++ using libc functions
-
-Include the "alloc-private.h" header after the C++ standard library
-headers. This sidesteps build failures caused by implementations of
-std::map and std::string which use libc memory allocation functions
-in expanded templates after they have been marked with the "poison"
-pragma.
-
-Fixes #115
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/pasteboard-generic.cpp | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/src/pasteboard-generic.cpp b/src/pasteboard-generic.cpp
-index 86fe4ee..a357027 100644
---- a/src/pasteboard-generic.cpp
-+++ b/src/pasteboard-generic.cpp
-@@ -26,12 +26,15 @@
- 
- #include "pasteboard-private.h"
- 
--#include "alloc-private.h"
--#include <cstdlib>
--#include <cstring>
- #include <map>
- #include <string>
- 
-+// We need to include this header last, in order to avoid template expansions
-+// from the C++ standard library happening after it forbids usage of the libc
-+// memory functions.
-+#include "alloc-private.h"
-+#include <cstring>
-+
- namespace Generic {
- using Pasteboard = std::map<std::string, std::string>;
- }
diff --git a/meta/recipes-sato/webkit/libwpe_1.12.2.bb b/meta/recipes-sato/webkit/libwpe_1.12.3.bb
similarity index 72%
rename from meta/recipes-sato/webkit/libwpe_1.12.2.bb
rename to meta/recipes-sato/webkit/libwpe_1.12.3.bb
index e23a9ac32d..77ca517ef7 100644
--- a/meta/recipes-sato/webkit/libwpe_1.12.2.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.12.3.bb
@@ -10,10 +10,8 @@ inherit cmake features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz \
-           file://0001-Fix-build-failure-due-to-libc-using-libc-functions.patch \
-           "
-SRC_URI[sha256sum] = "4ac4fd0a8b562b721bffd0f46ae9f06c2b5a3114407581978be875a9d651642a"
+SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "b84fdbfbc849ce4fdf084bb28b58e5463b1b4b6cc8f200dc77b41f8545d5329d"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.25.1


