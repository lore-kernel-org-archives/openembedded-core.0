Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6BA78C59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 23:01:08 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t13-v6so3227748wrv.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s7ks5XYQ7YszFmygcEhckksWvk7UvligqFoJ3Bpgeig=;
	b=sR/CZ3sM0jPYA70MuA/V0Kc9Ps0m7JT7dRU8QxRDJkaWV1tD4XO6vm00H3Sa5FYS/3
	CNFdNyJ47z10pIWj7OQe7VAGLk56lzrLSwLtDAX55xo6bquUSUgIAyY9p+Gvkc6AOGV8
	e+O1marn6CfjppWnHiu7QeedlaVivjQga+XMSexVRS5rdRLxL0iqtdRnatNdAFP4KgUl
	1CdYIUZt9WBQjlr6lMYAPyl6p4N/VbTXXJBSRqi/o+eQWRP/1J5rDqc9pFYOM+1cGi5o
	fZ4merZjiWBzCmuvgl+qr+O/MviXcgB7Bh8MbHD5KA1eGshqepXjSOqfSMlnhV/tchGu
	naKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s7ks5XYQ7YszFmygcEhckksWvk7UvligqFoJ3Bpgeig=;
	b=JkabmqER1eY/JjUbbqbZMIAHgYM/3UnllbCpqkuhLvVkUWE9Lpa2u2aSoVmRQG6tT1
	e4VrN+dNsPElh+CJRB/2N1jAUASWkLmXlXrCXIcNz5nzZaI59Da3fki/YJxZoiyOxRYp
	/f4EzHjeFgugHh3tleMsE0ZUOla1fZxxJxz9k04KHBiINyFsW8zjasFStYC/fjvTvO2o
	mbr4gXZdjOcHWbzKQW/HpFxbCr7/4Z7v+pKsTPmfn/6oKP/S9V2TCXYV04BB8hejHa9C
	J7Dw6zi2u4M7SekhGperdDqv4y6W/TGi4HHD7u5wGfYjyKkNWE9tJ+2QbUT1YFyMKpMU
	nPww==
X-Gm-Message-State: AOUpUlE/UGw8CQe1kBrMZKR54J+9O6yAbu5zFjaZGMPB+i4p7W12oOMR
	dDUHHYvyvtkWIC9CbJSdPRApbAVpwcQ=
X-Google-Smtp-Source: AAOMgpeItoafZn6obtLIEbUAnCeFGEv2F9DIR729AlfSf+Na6GQNsdNEznMfYX3Pl4fWkk2GNpD2hA==
X-Received: by 2002:a5d:494c:: with SMTP id
	r12-v6mr2948582wrs.66.1532646068925; 
	Thu, 26 Jul 2018 16:01:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h7-v6sm1948532wmb.48.2018.07.26.16.01.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 16:01:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 00:00:58 +0100
Message-Id: <20180726230100.6629-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180726230100.6629-1-ross.burton@intel.com>
References: <20180726230100.6629-1-ross.burton@intel.com>
Subject: [PATCH 3/5] dbus-glib: merge bb and inc
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
X-List-Received-Date: Thu, 26 Jul 2018 23:01:08 -0000

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


