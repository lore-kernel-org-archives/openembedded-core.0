Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fLV-0003th-Ga
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:49:53 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3201846fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uN10Rdx3debGANoDLYqhY5KYERl1kTrVbY2n3QeVAwU=;
	b=tIgiFcX2SmZChnjxTXtSmqIJemwJBLANjnRQYdLbxIpBKxfrInfHxG6uPMWAsMjhs2
	hMk9pABZr1mVD1bkVQ/UY4JiDOBVsHomkxzD6XMiKOoomWZEEIVJ/kXDR/DoVj3U+5G6
	r/ZoxawCRdI3TIypVf9QdUBCLAwAsZ6myjIYI=
Received: by 10.223.36.68 with SMTP id s4mr18542901fad.92.1317397465949;
	Fri, 30 Sep 2011 08:44:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm7179840fab.12.2011.09.30.08.44.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:44:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:43:26 +0200
Message-Id: <3fbdf6c6a16b66b7bf0f84b1bcb8dbafaea24db1.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
References: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397204.git.Martin.Jansa@gmail.com>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 7/9] gdk-pixbuf: upgrade to 2.24.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 15:49:53 -0000

* older version doesn't build with glib-2.30.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../configure_fix.patch                            |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.22.1.bb => gdk-pixbuf_2.24.0.bb} |    7 +++----
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.22.1 => gdk-pixbuf-2.24.0}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.22.1 => gdk-pixbuf-2.24.0}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.22.1.bb => gdk-pixbuf_2.24.0.bb} (92%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_fix.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_fix.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
similarity index 92%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
index 50597b0..9fabbe2 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
@@ -9,15 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 SECTION = "libs"
 
 DEPENDS = "libpng glib-2.0 jpeg"
-PR = "r1"
 
-SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${PV}.tar.gz \
+SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.bz2 \
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
            "
 
-SRC_URI[md5sum] = "fcfc854e9aec7dbb2bb3059484d44556"
-SRC_URI[sha256sum] = "bbb57364ffba70d64f5fcfe6eda1d67249b3d58844edb06dc0f94d1ad599b4ec"
+SRC_URI[md5sum] = "d8ece3a4ade4a91c768328620e473ab8"
+SRC_URI[sha256sum] = "38d2630314e6d91976bffd833236f84fefa440a9038f86dc422820a39f2e3700"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.6.1



