Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA9CCCFA18
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2996.1762386448160184465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V0aPrbu7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386449; x=1793922449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V7TNn4r8VY9wi2+esImpAt6QHi5EMr5OF43dBwmxYc4=;
  b=V0aPrbu7BnMLZzVNV+cLwNqUZSzWhEy/Yk+2NrtrAGa1QpMmuhx4aVDz
   Zrk8upoFegOry+s/myfXH1Db34oBMmtz9evV47V6VC7Vkt92nsEL0PqfY
   KV3iGE6MTeJZvqPVQhvEGR0GiR3Z7mwbwyUz8T9KpvnsZUhxFO9Zv3wYS
   JlyZ3FqEzl90p4Y2AFVk3XTFFXK+u9bQIQXwkDQz0xVFiJZVsWDy3WJQP
   wDdIWxUOFqHEMHMfsZB0/6E9hoC4A0PwAAOGOrIa1ZVUzi8oeGMaWOK+S
   Fa16m0ORx6wEZp0vX/3vlyQHTL5BD7BdBMeYplIKH7J70D2R6rm2Cjgov
   A==;
X-CSE-ConnectionGUID: OPKvjqwBR86ly46y2yqw4g==
X-CSE-MsgGUID: OyEpzSF4Ra28ZilPc9Hdfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197067414"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197067414"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:28 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 82C1042A332
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:28 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3B4B41C00101
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B49E614005BF;
	Wed,  5 Nov 2025 23:47:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/29] dnf: upgrade 4.23.0 -> 4.24.0
Date: Thu,  6 Nov 2025 07:46:49 +0800
Message-ID: <20251105234712.446-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225936

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
refreshed for 4.24.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.23.0.bb => dnf_4.24.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.23.0.bb => dnf_4.24.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..9d978cdc5f 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From c2b2b91b58f4531d4baf0a01f5d868d71e577a84 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4aee99fb..9e2e9e9e 100644
+index e71e9517..8fcb2069 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
+@@ -3,8 +3,8 @@ PROJECT (dnf NONE)
  
  INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
  
diff --git a/meta/recipes-devtools/dnf/dnf_4.23.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.23.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.24.0.bb
index 927a8d8930..d40b85c4b0 100644
--- a/meta/recipes-devtools/dnf/dnf_4.23.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
+SRCREV = "e47634fbe3565d0580e89ec21adb7c1b308642ce"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
-- 
2.43.0


