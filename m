Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 995176EA3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 11:52:05 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so1592226ead.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 03:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pqgvlO4ssX4D0RK4ddNRbNLH+xuSjUkqKkzvw/MEe14=;
	b=WqYqRm4fNdJt/wF4SezAVMQrmaS3Uq7uw+hKu+3PdWr4NNucpy0paDx3mscXTserVD
	SdTXUChxvDB1/vYbKbBk8rVfKZqAFcInjmYxaNcD1pKYITFZFo1oX8ZgWOsCm8LTSAkl
	m9fIOElwM55Lft4/pOye1vxsqlQ1Bh9yAB1THyekmzXF6B6hSNKayd/IIgmSoN3MH6Jl
	Irn0AYtzBItUch0tS/Svn0fmzMyGPhs9Aeg39X8vvRIk+Ft8TS0Hl9zHf/nd9Zk6r8hj
	tIHgbkxtFUNogSWBX8S2S6PqOm7e6IulpvuxrwTfKSl9Vy0xcgf68lrTXAY0fJFzHdLJ
	x/gw==
X-Gm-Message-State: ALoCoQnQUTBQO8lF5JI7qLngNeaURvdLHBHLKWZrNwvyvaTNRorEjLiOTRrinyy1y9OQrJS+2u09
X-Received: by 10.15.43.141 with SMTP id x13mr16368885eev.35.1391082725934;
	Thu, 30 Jan 2014 03:52:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	d43sm21491574eep.18.2014.01.30.03.52.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jan 2014 03:52:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2014 11:51:58 +0000
Message-Id: <1391082719-14432-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391082719-14432-1-git-send-email-ross.burton@intel.com>
References: <1391082719-14432-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] gnome-desktop-testing: upgrade to current git master
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
X-List-Received-Date: Thu, 30 Jan 2014 11:52:06 -0000

no-introspection.patch has been merged upstream.

Update license checksum as copyright dates have been updated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/no-introspection.patch                    |   19 -------------------
 ...sting_2013.1.bb => gnome-desktop-testing_git.bb} |   12 +++++++-----
 2 files changed, 7 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
 rename meta/recipes-support/gnome-desktop-testing/{gnome-desktop-testing_2013.1.bb => gnome-desktop-testing_git.bb} (60%)

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
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_git.bb
similarity index 60%
rename from meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb
rename to meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_git.bb
index 36e13b1..be43d98 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_git.bb
@@ -2,13 +2,15 @@ SUMMARY = "Test runner for GNOME-style installed tests"
 HOMEPAGE = "https://wiki.gnome.org/GnomeGoals/InstalledTests"
 LICENSE = "LGPLv2+"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
-           file://no-introspection.patch"
-SRC_URI[md5sum] = "c6824f7bfac95bf0fcf6ed0c255979c1"
-SRC_URI[sha256sum] = "632e7224de8614a8e4b7cdf87fc32551531efa9290fba0da4dae56234c584b7b"
+SRCREV = "fbec635575013b22ed5aa853e725448057ac54bc"
+PV = "2013.1+git${SRCPV}"
+
+SRC_URI = "gitsm://git.gnome.org/${PN}"
+
+S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://src/gnome-desktop-testing-runner.c;endline=19;md5=ab86a2e00ab9cbb94f008d785004b181"
+                    file://src/gnome-desktop-testing-runner.c;endline=19;md5=67311a600b83fd0068dfc7e5b84ffb3f"
 
 DEPENDS = "glib-2.0"
 
-- 
1.7.10.4


