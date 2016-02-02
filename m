Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6D81D70030
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:59:42 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id is5so3298293obc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 13:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dE3yJ8jeuN2D2PgfOsHLXu0gtY+Fi7Xf8STL6WDnxqA=;
	b=diy7NFfKJUqbKtDTUEHdUiG+7ofedttiG5ZQTx93BgFcXZJRiIrB75e1PICSb+sCHD
	iJKzWjfvcGE3bLolx4D3TCPLxkP7aoc2RY53xqBuCAyuEd+GdIWG/24/bJcyUhhIyPoQ
	0CtXDzptfq8fRUKm7LNMEhdNAlA6ZwGCgbQrvnZrEsQLlXw9S4QoOaIDpA6qNzBeeHfE
	3grDiadUsBl74NukBwksgfIjzuPrBMP/6NR/XK8i5AMusO0vxwdnxC79KJXirp512n20
	Oik7Qu81SvL/PSRBhnOroo1dyyoR44FcxDXkAPyszFljpRkWm0YFNzVtZeztIs+5Rb8S
	kigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dE3yJ8jeuN2D2PgfOsHLXu0gtY+Fi7Xf8STL6WDnxqA=;
	b=JzXGh9oxaMrzWTeMKy3rp/lK61uBLZ4hi8xRbutN5VMv4IUGRdnrs+YcPIednXkYUI
	vi39VzJeTHHmefi9Yx7ksWO6RyIM+SCbhT4+H+3+kag1+ye+eMw77kMajli/zzIysNdA
	YF/QTZmNlaaWQYccXpXUqVuq9VH080FLPnQoWmVmu7P5LvFICtayOy8Thk24EJe7spFg
	/Eco6PwWANfTlVA5rW95kaY0wcxQoBIU/GV29JRft8NXMl4a7Nw6PVuRWf89dTY+Jlwm
	dR8Tqr3KfO8CjEczxkSB+hPP8t85GnC9oXuC53hIJrVZxo/vI5ykQwoiujatWaCz3WA/
	QdYg==
X-Gm-Message-State: AG10YOQ+G4+7ouEH+4KbKsvC3my3KoubLD4F9eY7XlopfXw7YVWpOjPpsAsMNxbfbgc99w==
X-Received: by 10.60.246.37 with SMTP id xt5mr16703049oec.72.1454450382721;
	Tue, 02 Feb 2016 13:59:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q3sm1663547oex.12.2016.02.02.13.59.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 13:59:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:59:35 -0800
Message-Id: <1454450375-25017-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libxsettings-client: drop obsolete disable_Os_option.patch
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
X-List-Received-Date: Tue, 02 Feb 2016 21:59:43 -0000

This patch to configure.ac to change the default CFLAGS from -Os to
-O2 was added in 2010 as a workaround for a ppc specific bug which
affected gcc 4.5.x:

  http://git.openembedded.org/openembedded-core/commit/?id=ce456306dad3fdf42494830011dacae213c48edf

The bug in gcc was fixed upstream in gcc 4.6.x and backported to the
gcc 4.5.1 recipe in oe-core, making disable_Os_option.patch obsolete.

  http://git.openembedded.org/openembedded-core/commit/?id=0fabe078a31591f41c3fdabe5aa9de1111ef82c7
  http://git.openembedded.org/openembedded-core/commit/?id=fef385e37e82a0eec743fbd1da11021b9e7158b5

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../libxsettings-client/disable_Os_option.patch       | 19 -------------------
 .../libxsettings-client/libxsettings-client_0.10.bb   |  1 -
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/disable_Os_option.patch

diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client/disable_Os_option.patch b/meta/recipes-graphics/libxsettings-client/libxsettings-client/disable_Os_option.patch
deleted file mode 100644
index 64b7efa..0000000
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client/disable_Os_option.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Do not set Os optimization in target APP CFLAGS, since it may have potential
-error if "--enable-target-optspace" is not set when configuring GCC.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff -ruN Xsettings-client-0.10-orig/configure.ac Xsettings-client-0.10/configure.ac
---- Xsettings-client-0.10-orig/configure.ac	2010-09-21 14:01:47.000000000 +0800
-+++ Xsettings-client-0.10/configure.ac	2010-09-21 14:02:01.000000000 +0800
-@@ -3,7 +3,7 @@
- AM_INIT_AUTOMAKE(Xsettings-client, 0.10)
- AM_CONFIG_HEADER(config.h)
- 
--CFLAGS="-Os -Wall"
-+CFLAGS="-O2 -Wall"
- 
- # Checks for programs.
- AC_PROG_CC
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
index 670d9fc..67c5e27 100644
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
+++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
@@ -19,7 +19,6 @@ headers = "xsettings-common.h xsettings-client.h"
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/optional-dependencies/Xsettings-client-0.10.tar.gz \
         file://MIT-style-license \
         file://link-x11.patch;apply=yes \
-        file://disable_Os_option.patch \
         file://obsolete_automake_macros.patch \
 "
 
-- 
1.9.1


