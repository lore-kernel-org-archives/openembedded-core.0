Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4FF78C11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:32:59 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id t25-v6so5882789wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s7ks5XYQ7YszFmygcEhckksWvk7UvligqFoJ3Bpgeig=;
	b=yEh99E1Q/5osmMzV7eCojv4toqfJ1ZaXzboYvDDNa1M6wyUP516FBJTAtRz9PHhSQ0
	/DZPjFgUODaZfIHbApGnypH3P21qw3O8lyO253UMwk6COaZhtKTSm9YH8/aQHOK5PMe+
	NlwHbwDc/Zt2YOkRR9IPg23gPQrb3T22mPRxdcuXI9O8xOf3y3DQY1kzdure2zGb+ZpC
	WeSivq6qDNqBArTzH0u/aVT0q37I98SKfIlgseeYz6HKAoIFqELVjpeprIdPBf/AupWD
	cgc91ZvAwwtHlXYy4LrH5CLFOJYSFtrNH1xs7TwyTeOCnE+pKtYmnsxNXp7aJscueL4s
	13fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s7ks5XYQ7YszFmygcEhckksWvk7UvligqFoJ3Bpgeig=;
	b=oh/aC1Dx1mJOQAeWc7kLpYepDPI+ymc/aQSaYrZmqwHgskW7A725aIyjip0iLHgwpX
	VKYLPNZp319LiLzqk/T62nKEwH2xlV/XKrG/3+iFd/ObQWg1nHW9QSRYiwZY/Dd6Nsj+
	M3vCCmGz4tBL5rkaN/8m8HPaYX8hqE8sObVOFiR1cbA7S5QlWwX/N3L33JVsL5Z5lfpF
	BrDycVSh8d9zjNv0R28bjSoR76qcXXg9PCNFTZTUr2KwDZCQB2H7WnNXaG1850i2yZLx
	rYIG15GNUnM/mgQamju69rVOFKWxNlDKVzOE3n4duTPIZZZa8JmNEk9XLn4jR1NvXhYD
	Xw7w==
X-Gm-Message-State: AOUpUlGZIDtxW5VqsszzLw+0VC+uJbt6JB8UUFgX6j1VeuFR1LYAiSGw
	U/mMXqN/OFMOTPnl2nWt88yMafUFn1Y=
X-Google-Smtp-Source: AAOMgpcPELe2oIJfKHmyXIJw5Ew2714hiOxKufkgwHxWCBR1LQPHNRjHpVEOtcxfZOVZJzJcIYdQ8A==
X-Received: by 2002:a1c:6709:: with SMTP id b9-v6mr4463699wmc.30.1532705579725;
	Fri, 27 Jul 2018 08:32:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.32.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:32:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:39 +0100
Message-Id: <20180727153248.22838-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 07/16] dbus-glib: merge bb and inc
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
X-List-Received-Date: Fri, 27 Jul 2018 15:32:59 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus-glib.inc      | 37 -------------------------------
 meta/recipes-core/dbus/dbus-glib_0.110.bb | 37 ++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib.inc

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
deleted file mode 100644
index 16dbf4f08a1..00000000000
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "High level language (GLib) binding for D-Bus"
-DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
-the D-Bus library with the GLib thread abstraction and main loop."
-HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
-LICENSE = "AFL-2 | GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cf5b3a2f7083750d504333114e738656 \
-                    file://dbus/dbus-glib.h;beginline=7;endline=21;md5=7755c9d7abccd5dbd25a6a974538bb3c"
-SECTION = "base"
-
-DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
-DEPENDS_class-native = "glib-2.0-native dbus-native"
-
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
-           file://no-examples.patch \
-           file://test-install-makefile.patch \
-"
-
-inherit autotools pkgconfig gettext bash-completion gtk-doc
-
-#default disable regression tests, some unit test code in non testing code
-#PACKAGECONFIG_pn-${PN} = "tests" enable regression tests local.conf
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[tests] = "--enable-tests,,,"
-
-EXTRA_OECONF_class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
-
-PACKAGES += "${PN}-tests"
-
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-bash-completion += "${libexecdir}/dbus-bash-completion-helper"
-FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
-FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
-
-RDEPENDS_${PN}-tests += "dbus-x11"
-FILES_${PN}-tests = "${datadir}/${BPN}/tests"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.110.bb b/meta/recipes-core/dbus/dbus-glib_0.110.bb
index 81205050105..b7383bd2a6b 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.110.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.110.bb
@@ -1,4 +1,39 @@
-require dbus-glib.inc
+SUMMARY = "High level language (GLib) binding for D-Bus"
+DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
+the D-Bus library with the GLib thread abstraction and main loop."
+HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
+LICENSE = "AFL-2 | GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cf5b3a2f7083750d504333114e738656 \
+                    file://dbus/dbus-glib.h;beginline=7;endline=21;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+SECTION = "base"
 
+DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
+DEPENDS_class-native = "glib-2.0-native dbus-native"
+
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
+           file://no-examples.patch \
+           file://test-install-makefile.patch \
+"
 SRC_URI[md5sum] = "d7cebf1d69445cbd28b4983392145192"
 SRC_URI[sha256sum] = "7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825"
+
+inherit autotools pkgconfig gettext bash-completion gtk-doc
+
+#default disable regression tests, some unit test code in non testing code
+#PACKAGECONFIG_pn-${PN} = "tests" enable regression tests local.conf
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[tests] = "--enable-tests,,,"
+
+EXTRA_OECONF_class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
+
+PACKAGES += "${PN}-tests"
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-bash-completion += "${libexecdir}/dbus-bash-completion-helper"
+FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
+FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
+
+RDEPENDS_${PN}-tests += "dbus-x11"
+FILES_${PN}-tests = "${datadir}/${BPN}/tests"
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


