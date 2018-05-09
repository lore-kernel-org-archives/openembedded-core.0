Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE9D750CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:47:03 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id c11-v6so20550plr.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=as7Vp/nYDHyGO4ijsFDqQqCaaBzYtAAEN7Ajep1VOg0=;
	b=lvWWAbKWHWlOxaGvOFy0azsW93kyF4vDi38akQzQ/UAb7LZ4+67TSB+TNbVdWU1CKq
	qj4mOahhUJLZUmvCw80ILiWmohWbpOcQzNMj4E1Hx/sV0DCXTA+BIPMQqL3sEcsm19rS
	sYP9qpKTGRdW2qqcFY+DXFVvEnhkjMQZ1LjS4WEo+FWHFpBjF4nf99i0P/1PgtFCLBSk
	fhifhe1DRlv0HyB189+5UBf9Z6l11NS3rmT2zsSKNU7x19dLr62FlF6dPCev0sEgGYMB
	KgadHh17rBoQ+h36nGIIaAFb4RGKA5nxtMf9ihIl5M4VXlGMWxtRwYDa6A9g4RraQlMS
	fuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=as7Vp/nYDHyGO4ijsFDqQqCaaBzYtAAEN7Ajep1VOg0=;
	b=lrp4gu30PCAipBHxokoeayyuDaG/153WRCVfP4cJ19atpi2qwIMF53fJ89/hrRWL0Q
	SIXE1gHUPGwDAKRZFnASMKYz1o86/2rzEea0m2BhMvWYKpswSZoqj4zsa+PN8iY3sZiQ
	9HXiuPvrhCWDo7ZcFpnW1gzX+IVTRI9PCPy6lnhZS4v3Ydnl5c4ApyR+9ka+yKeC4GPe
	aE+yV8HM7Of9EuFwbdSjfnBYan7TIFfYhofQzEYwebnjg6706kEf2Rcjagou5TCpljfQ
	TY0U9qM7Gk0Ne+lQNXj8swEKRr/0ufl4IN2mWpU2pgbOlPa5xlGgdDdOSHcAGFsmeflJ
	2PXw==
X-Gm-Message-State: ALQs6tAuXtyu66ibET4A/YS/GXdBaRV4O8SCknmszZb1g1LfdpyYzF1d
	EDAbwzolhkUj6EMcvi+fvimd4g==
X-Google-Smtp-Source: AB8JxZpNG8CIA6z/EW0iE3iWAp9cB5ye8qFo8Jr35bgLPijPmb0eZ0aafNwpVLJNr84J4kU4boTvHQ==
X-Received: by 2002:a17:902:369:: with SMTP id
	96-v6mr25342567pld.64.1525902424508; 
	Wed, 09 May 2018 14:47:04 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm3699193pge.75.2018.05.09.14.47.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:47:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:46:47 -0700
Message-Id: <1525902408-6796-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 7/8] puzzles: move ASNEEDED over-ride into the puzzles recipe
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
X-List-Received-Date: Wed, 09 May 2018 21:47:03 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Also misc minor recipe cleanup (re-order variables to follow the OE
style guide, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc   |  1 -
 meta/recipes-sato/puzzles/puzzles_git.bb | 35 +++++++++++++++++---------------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index c67f2f3..f56d432 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -2,7 +2,6 @@
 ASNEEDED = "-Wl,--as-needed"
 
 ASNEEDED_pn-openobex = ""
-ASNEEDED_pn-puzzles = ""
 ASNEEDED_pn-rpm = ""
 
 TARGET_LDFLAGS += "${ASNEEDED}"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 3670ab8..7d08b96 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,20 +1,20 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=da6110d4ed1225a287eab2bf0ac0193b"
 
 DEPENDS = "libxt"
 
 # The libxt requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=da6110d4ed1225a287eab2bf0ac0193b"
-
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            "
+
 UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "c6e0161dd475415316ed66dc82794d68e52f0025"
 PE = "2"
@@ -24,24 +24,13 @@ S = "${WORKDIR}/git"
 
 inherit autotools distro_features_check pkgconfig
 
-CFLAGS_append = " -Wno-deprecated-declarations"
-
 PACKAGECONFIG ??= "gtk3"
 PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
 PACKAGECONFIG[gtk3] = "--with-gtk=3,,gtk+3,"
 
-PACKAGES += "${PN}-extra"
-FILES_${PN} = ""
-FILES_${PN}-extra = "${prefix}/bin ${datadir}/applications"
+CFLAGS_append = " -Wno-deprecated-declarations"
 
-python __anonymous () {
-    var = d.expand("FILES_${PN}")
-    data = d.getVar(var, False)
-    for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
-        data = data + " ${bindir}/%s" % name
-        data = data + " ${datadir}/applications/%s.desktop" % name
-    d.setVar(var, data)
-}
+ASNEEDED = ""
 
 do_configure_prepend () {
     cd ${S}
@@ -74,3 +63,17 @@ STOP
         fi
     done
 }
+
+PACKAGES += "${PN}-extra"
+
+FILES_${PN} = ""
+FILES_${PN}-extra = "${prefix}/bin ${datadir}/applications"
+
+python __anonymous () {
+    var = d.expand("FILES_${PN}")
+    data = d.getVar(var, False)
+    for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
+        data = data + " ${bindir}/%s" % name
+        data = data + " ${datadir}/applications/%s.desktop" % name
+    d.setVar(var, data)
+}
-- 
1.9.1


