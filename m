Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0996CAD5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 11:06:55 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so2192051wes.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2014 03:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fjSuGjuTYjVHGg2Vi8U88k24lLACiJss+i7cIiGu9JE=;
	b=NYQiwjLRH/8CTqrpvWNa1WqsjQ8UJ2LwRBcndZNPNeh4U58Lf3is++TPRREvk7iOg4
	JtIg53bng8tahqOcfkNkGCwTDD85OyNjIwVM8+lQTRSF/9aUyFxRpO10FHXem+Z+gYv/
	xux3GD4c7Oe3lSFAkCtHV9q9WCLo4Z/ABZ/oRpFSNov7i5aHyN8XzsMHe53NRGn1odQ0
	dvhRnlIYOqeEQyQ1lY+3bSXJKq4MddtF5RvL08jqe31qnoZpGsu03qdx3ctmSdhVENx+
	ir3/2XxCmpo2EeUM5H8ycc3ZuRXaMYP9zShhg82lObz1qPldjaJvoFa+3i6o6gqZFIcV
	VIrA==
X-Gm-Message-State: ALoCoQkZh471HhiVMe2HDFzFb8wPUnkSoRS40nzsoxYSoTIU0sC6J2EuBc+2RQMj/mF57VqmCJcK
X-Received: by 10.194.81.196 with SMTP id c4mr1105257wjy.57.1391771215323;
	Fri, 07 Feb 2014 03:06:55 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id h13sm9802647wjr.22.2014.02.07.03.06.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Feb 2014 03:06:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2014 11:06:49 +0000
Message-Id: <1391771210-18624-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] gnome-desktop-testing: upgrade to 2014.1
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
X-List-Received-Date: Fri, 07 Feb 2014 11:06:56 -0000

no-introspection.patch has been merged upstream.

Update license checksum as copyright dates have been updated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/no-introspection.patch                    |   19 -------------------
 ...ng_2013.1.bb => gnome-desktop-testing_2014.1.bb} |    9 ++++-----
 2 files changed, 4 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
 rename meta/recipes-support/gnome-desktop-testing/{gnome-desktop-testing_2013.1.bb => gnome-desktop-testing_2014.1.bb} (60%)

diff --git a/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch b/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
deleted file mode 100644
index 67b64f2..0000000
--- a/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Introspection is a hard requirement to build gnome-desktop-testing upstream, but
-it isn't needed anymore.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 7460c69..6249caf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,8 +27,6 @@ AC_SUBST(WARN_CFLAGS)
- LT_PREREQ([2.2.4])
- LT_INIT([disable-static])
- 
--GOBJECT_INTROSPECTION_REQUIRE([1.34.0])
--
- PKG_CHECK_MODULES(GIO_UNIX, [gio-unix-2.0 >= 2.34.0])
- GIO_UNIX_CFLAGS="$GIO_UNIX_CFLAGS -DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_36 -DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_36"
- 
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
similarity index 60%
rename from meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb
rename to meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
index 36e13b1..30ca808 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
@@ -2,13 +2,12 @@ SUMMARY = "Test runner for GNOME-style installed tests"
 HOMEPAGE = "https://wiki.gnome.org/GnomeGoals/InstalledTests"
 LICENSE = "LGPLv2+"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
-           file://no-introspection.patch"
-SRC_URI[md5sum] = "c6824f7bfac95bf0fcf6ed0c255979c1"
-SRC_URI[sha256sum] = "632e7224de8614a8e4b7cdf87fc32551531efa9290fba0da4dae56234c584b7b"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "a608ad72a77e23a1aecdfd8d07a94baf"
+SRC_URI[sha256sum] = "1a3eed73678dd22d09d6a7ec4f899557df3e8b4a802affa76d0f163b31286539"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://src/gnome-desktop-testing-runner.c;endline=19;md5=ab86a2e00ab9cbb94f008d785004b181"
+                    file://src/gnome-desktop-testing-runner.c;endline=19;md5=67311a600b83fd0068dfc7e5b84ffb3f"
 
 DEPENDS = "glib-2.0"
 
-- 
1.7.10.4


