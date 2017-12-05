Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 21BEA786D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 14:18:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f140so1556981wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EEr5+HK/e5XaWpT/KSWNIFcng7vCL9/ZvWZ3Nf7blI0=;
	b=xyOfq29Jf7ueoPRSU0cYaAVSUu+gFfeOH7VOVsP6G1hZNUcKSAT8kjLFsiuPy+KOI3
	ys0bq7w6XlHV7sZajlt8KQt5jh1zyv9Yszj5OKZlRQ4H4tZ0EMo5+XLg1UWd/m976viI
	ia3ir2XUIbeyn5gYPvl8iTwljHfmzwwRfOZjzSI8t3dMndgbUWLwLY4LGGoBFYpMxnUZ
	S1wfDmUkFDgfORGxQppaKrQswGkK/pDrDqWxLqQ9j2EFTuc2U4boWNZeXQQBtaxgzH5Q
	f8DF181qwKmjYrjfAkn0KgmqTXWGVVZY/CJvVUj0CLzUwaQH7m0ifEEQ/h+e3zezMUEE
	KW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EEr5+HK/e5XaWpT/KSWNIFcng7vCL9/ZvWZ3Nf7blI0=;
	b=LGm/ESRIvN5KRQ8I1g4eJ73E40OzmwN3oMqUfhul7xBVW1JMyanj8yabStJ56s9HNi
	5PIF3KmZnL0Cpso4Lrh1vR1PlkuRaOZK1jX4liCc7zHV9KrZ899LdM1RcovrBG16pAor
	LLSa1FOPUQ+By3WTmIx/RuufNhnW7n4fri9nSSyJ2//e5ptVrmmlY4I29FyEWGmHYRS1
	HNvL8V4VwVJRWJrKxZlaj4DVSxs0c5/Fn/MHapOLMy0+UHgskZU5uGQMGI2gBKDFhM7H
	k64FK5lhTEkk9meIbhSfp1po0Dm2XlvDDB9Bfv9YkMlyToH3LMZ4fPXOyK4q7wZjzvOt
	QT1Q==
X-Gm-Message-State: AKGB3mIqo9/c+vnkh0JLzVW6DuQ4/0x6qYiZTTqlIWOdgpdkguabE4um
	IhDttc+WPFdbTXEToF+QO47aaERO
X-Google-Smtp-Source: AGs4zMbCjtUEvQRPy9r5WekAHHhzk86kdjyFsehR1F6RHg9TROnT6Vf1jYFGTh96yXAe03+EF7Ea6w==
X-Received: by 10.28.70.131 with SMTP id t125mr6314097wma.92.1512483537307;
	Tue, 05 Dec 2017 06:18:57 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 34sm301178wra.39.2017.12.05.06.18.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 06:18:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:18:45 +0000
Message-Id: <20171205141848.24825-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] weston: remove patch that isn't applied anymore
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2017 14:18:57 -0000

This patch was removed from SRC_URI in the Weston 3.0 upgrade (148920f) but the
patch wasn't deleted.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...1-configure.ac-Fix-wayland-protocols-path.patch | 29 ----------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
deleted file mode 100644
index 5f4d79c38c2..00000000000
--- a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1cfc1434a5d385a74de593ec7601674dba39e2fe Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 11 May 2016 16:16:30 +0300
-Subject: [PATCH] configure.ac: Fix wayland-protocols path
-
-The wayland-protocols directory is used during build: Fix the path
-to point to sysroot specified in recipe.
-
-Normally PKG_CONFIG_SYSROOT_DIR could be used in configure.ac but that
-breaks multilib weston as it would point to multilib sysroot when the
-(allarch) wayland-protocols is actually in the machine sysroot.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -187,7 +187,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [lib
- PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])
- 
- PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.7],
--		  [ac_wayland_protocols_pkgdatadir=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
-+		  [ac_wayland_protocols_pkgdatadir=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
- AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
- 
- AC_ARG_ENABLE(wayland-compositor, [  --enable-wayland-compositor],,
-- 
2.11.0


