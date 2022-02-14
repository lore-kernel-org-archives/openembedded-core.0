Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2278CC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 23:54:57 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.3341.1644882895065377668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 15:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v5Ej0MQO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644882893; i=@fujitsu.com;
	bh=vCrVpkfwpHoB70614WD3H4I/3mYpFvzzQBX8hQp+d4M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v5Ej0MQODUUwCOUQ/pVdP5O+NY8H0JS/tpMgVBxP97b4egGpP2wFABGH1EdEdfuWk
	 64vAjAADOOcXanK2amc7r/o3RkAyYYUMeM0uf0kUrI+y2UmMOC1kCx1W4Fzv4m2xsj
	 z3Pcd4NoiXnR0/AHIbRi3o/2UIwfGgjZ9hTIwwSobWdfTPwD6fIw28K+bAvarURijW
	 Oka93jC1RD53HJFMGO7qNppDssZGdO/NPViKqUfVBr84GCiqgM+RnJb7r2uRiioCOW
	 YPXN4QCHuruHmnw9Xduf8GsMcvUklmCIRcAbMkIO9SRsCaYTcpNGvm1q3e0zQNIJsQ
	 2ltqayGWAOeUg==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 6F/61-24566-CCBEA026; Mon, 14 Feb 2022 23:54:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MRonvmNVe
  SwfkrKhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bMrX1MBWdlK3Zfm8TWwNgj1cXIxSEkMINJ
  Yt73Z8wQzglGicWTd7J1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sILawgI1Ew
  +4+VhCbRUBV4sj+iUwgNq+Ao8TWlnZGEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44gUzRI2ixO
  zLzSwQdoXErFltTBMYeWchaZmFpGUBI9MqRrukosz0jJLcxMwcXUMDA11DQ1NdM3NdQzMzvcQ
  q3US91FLd5NS8kqJEoLReYnmxXmpxsV5xZW5yTopeXmrJJkZgqKUUOy/bwfiu76feIUZJDiYl
  Ud6YPVxJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4pR4B5QSLUtNTK9Iyc4BhD5OW4OBREuG98
  QAozVtckJhbnJkOkTrFaM+xc8vlvcwcV69cAZI3wOSmNTf2Mgux5OXnpUqJ8/rfBmoTAGnLKM
  2DGwqL00uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnNXgFN4cnMK4Hb/QroLCagsxQbwc4
  qSURISTUwabYWWdQzsTIHLNQoykpV1bDkkH2+cskrxg+171vkVs8w2Hfxy7tbb3Pa/3Zylp6b
  P6mGIzV+7vvlDi+c9Fb/mPqAO8E3/cjG98G1DYlBky/9l33P0D175p6sSc8kS7MunrsQXJB++
  2f6Je11sarsDRY6SyK/r245yb8s2bPpyMUDT6x3mO+yCk2//skk3t5ai+X98cmRN4OXv8zilb
  h+xjH03NMYu5fbry7/+LXggJ22/PEMQ8vzS7v61XszJ62NT2XXvCnUIL8nvmbNHbs8/1+MTPK
  SE/tcnHqvKG22iki/d+b4vX2L9v12ebY2SFJ240TOXaFPP/F6sq/6/n630b6F19wT9/7ui41a
  rfyLS4mlOCPRUIu5qDgRAGStJGpOAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-532.messagelabs.com!1644882892!31889!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11240 invoked from network); 14 Feb 2022 23:54:52 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 23:54:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21ENskoZ015267
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 23:54:52 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 23:54:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libhandy: upgrade 1.5.0 -> 1.5.90
Date: Tue, 15 Feb 2022 07:54:33 +0800
Message-ID: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 23:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161735

0001-Add-private-headers.patch
removed since it's included in 1.5.90.

Changelog:
=========
- Documentation
  - Port to gi-docgen
  - Use "Since: 1.0" for pre-1.0 symbols
  - Various cleanups and consistency updates
- Demo
  - Fix keyboard navigation
  - Don't make rows containing buttons activatable
  - Set minimum width on the view switcher window
- HdyCarousel
  - Properly remove mouse wheel timer
- HdyClamp
  - Fix measuring
- HdyKeypad
  - Fix keyboard navigation
- HdyStyleManager
  - Properly reset animations after style changes
- HdySwipeTracker
  - Fix a runtime warning
- HdyTabView
  - Propagate Alt+[0-9] when trying to switch to the selected tab
- HdyViewSwitcher
  - Properly center button labels
- Build and CI cleanups
- Remove unused distro packaging
- Translation updates:
  - Czech
  - Romanian
  - Slovenian
  - Spanish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libhandy/0001-Add-private-headers.patch   | 37 -------------------
 .../{libhandy_1.5.0.bb => libhandy_1.5.90.bb} |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
 rename meta/recipes-gnome/libhandy/{libhandy_1.5.0.bb => libhandy_1.5.90.bb} (88%)

diff --git a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch b/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
deleted file mode 100644
index 7b2a512738..0000000000
--- a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e7c3e8fa00f6a68b2e0629db5ee115e641ea710e Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 8 Dec 2021 07:35:52 +0000
-Subject: [PATCH] Add private headers
-
-After the commit(8157ecc Separate public and private enums) introduced,
-there comes a race as below:
- | In file included from ../git/src/hdy-settings.c:11:
- | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
- |    16 | #include "hdy-enums-private.h"
-
-So also add private headers like private sources to libhandy_sources to
-fix the issue.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/796]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index d087323..6f11f27 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -64,7 +64,7 @@ hdy_private_enums = gnome.mkenums('hdy-enums-private',
- )
- 
- libhandy_public_sources += [hdy_public_enums[0]]
--libhandy_private_sources += [hdy_private_enums[0]]
-+libhandy_private_sources += hdy_private_enums
- libhandy_generated_headers += [hdy_public_enums[1]]
- 
- src_headers = [
--- 
-2.32.0
-
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.90.bb
similarity index 88%
rename from meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.5.90.bb
index 605ef2b5fa..cb8abcee73 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.5.90.bb
@@ -9,10 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
-           file://0001-Add-private-headers.patch \
-"
-SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=main"
+SRCREV = "c09c1503237dc719d91b52182fc4ab632cc390ad"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.25.1


