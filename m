Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Srpf8-0003iM-2z
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 14:16:58 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 05:05:34 -0700
Received: by wibhm11 with SMTP id hm11so4753235wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 05:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=NG3zJzvATemu8Zxnt9DK1JNXE/UNLnKwl758etV09Kg=;
	b=hh65GxrTeftnnxBw4SX4ocUqbXChjLL+GP8RDHqBUuhT/ljYdMswghb5MhBMVxDTu5
	4y5Vi/IlebPdrSlCesNp+e/BxovZqg4pSfryGGufUnBcBLZ59WpqUSbMSROuydIlSu3+
	0NsQM0l01fLxe+LwGpktC6zrjdiBjfGfnrngk3UP1JOZhJ1JpdYDZ33SRQ2PI8tmrgmQ
	On2LEfxh2KE+CCOz4PCKzDKPPWE6P3Rzcr1fliXbBMT4HquXm+41sCIKK8T1I5AUl5tr
	YVyXDA7PP3o9tz8zonwG6+cycNZsH1/aG1ZeTITwIhDdSC0LoM+mjCHNiBmyMXOuz86+
	XJhg==
Received: by 10.216.233.95 with SMTP id o73mr1127345weq.59.1342699533086;
	Thu, 19 Jul 2012 05:05:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t8sm38149972wiy.3.2012.07.19.05.05.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 05:05:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:05:09 +0100
Message-Id: <c45181c5fcaee663c5ade1c81c78efd81fbd9875.1342699470.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342699470.git.ross.burton@intel.com>
References: <cover.1342699470.git.ross.burton@intel.com>
In-Reply-To: <cover.1342699470.git.ross.burton@intel.com>
References: <cover.1342699470.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmiAe2uZhSBz9+WHBmjqCmv28dDC/Hf1Kdz3CLfk3GKlkX+8610sLJvr0zgOGzyjWIdS656
Subject: [PATCH 3/3] eggdbus: remove, nothing uses it
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
X-List-Received-Date: Thu, 19 Jul 2012 12:16:58 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/multilib.conf                         |    1 -
 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch |   34 -----------------------
 meta/recipes-core/eggdbus/eggdbus/marshal.patch |   28 -------------------
 meta/recipes-core/eggdbus/eggdbus_0.6.bb        |   31 ---------------------
 4 files changed, 94 deletions(-)
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus/marshal.patch
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus_0.6.bb

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index bb21815..2ee4ab2 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -127,7 +127,6 @@ BBCLASSEXTEND_append_pn-ed = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-evolution-data-server = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eds-tools = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eee-acpi-scripts = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-eggdbus = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eglibc-initial = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eglibc-locale = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eglibc = " ${MULTILIBS}"
diff --git a/meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch b/meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
deleted file mode 100644
index abd7ff4..0000000
--- a/meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Inappropriate [configuration] 
-
-Index: eggdbus-0.6/docs/eggdbus/Makefile.am
-===================================================================
---- eggdbus-0.6.orig/docs/eggdbus/Makefile.am
-+++ eggdbus-0.6/docs/eggdbus/Makefile.am
-@@ -87,11 +87,7 @@ HTML_IMAGES = 				\
- # Extra options to supply to gtkdoc-fixref
- FIXXREF_OPTIONS=
- 
--if ENABLE_GTK_DOC
--include $(top_srcdir)/gtk-doc.make
--else
- CLEANFILES =
--endif
- 
- CLEANFILES +=   *~				\
- 		eggdbus-scan.*			\
-Index: eggdbus-0.6/docs/tests/Makefile.am
-===================================================================
---- eggdbus-0.6.orig/docs/tests/Makefile.am
-+++ eggdbus-0.6/docs/tests/Makefile.am
-@@ -65,11 +65,7 @@ HTML_IMAGES = 				\
- # Extra options to supply to gtkdoc-fixref
- FIXXREF_OPTIONS=
- 
--if ENABLE_GTK_DOC
--include $(top_srcdir)/gtk-doc.make
--else
- CLEANFILES =
--endif
- 
- CLEANFILES +=   *~				\
- 		tests-scan.*			\
diff --git a/meta/recipes-core/eggdbus/eggdbus/marshal.patch b/meta/recipes-core/eggdbus/eggdbus/marshal.patch
deleted file mode 100644
index a605a34..0000000
--- a/meta/recipes-core/eggdbus/eggdbus/marshal.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: eggdbus-0.6/src/eggdbus/Makefile.am
-===================================================================
---- eggdbus-0.6.orig/src/eggdbus/Makefile.am
-+++ eggdbus-0.6/src/eggdbus/Makefile.am
-@@ -130,7 +130,7 @@ BUILT_SOURCES =								\
- 	$(NULL)
- 
- eggdbus-built-sources.stamp : eggdbus-binding-tool Makefile.am org.freedesktop.DBus.xml org.freedesktop.DBus.Peer.xml org.freedesktop.DBus.Properties.xml org.freedesktop.DBus.Introspectable.xml eggdbus-glib-genmarshal
--	EGG_DBUS_GENMARSHAL=$(top_builddir)/src/eggdbus/eggdbus-glib-genmarshal $(top_builddir)/src/eggdbus/eggdbus-binding-tool							\
-+	EGG_DBUS_GENMARSHAL=eggdbus-glib-genmarshal eggdbus-binding-tool							\
- 		--namespace EggDBus									\
- 		--dbus-namespace org.freedesktop.DBus							\
- 		--interfaces-only									\
-Index: eggdbus-0.6/src/tests/Makefile.am
-===================================================================
---- eggdbus-0.6.orig/src/tests/Makefile.am
-+++ eggdbus-0.6/src/tests/Makefile.am
-@@ -25,7 +25,7 @@ BUILT_SOURCES = 							\
- 	$(NULL)
- 
- test-built-sources.stamp : Makefile.am $(top_builddir)/src/eggdbus/eggdbus-binding-tool com.example.Frob.xml com.example.Tweak.xml com.example.Twiddle.xml
--	EGG_DBUS_GENMARSHAL=$(top_builddir)/src/eggdbus/eggdbus-glib-genmarshal $(top_builddir)/src/eggdbus/eggdbus-binding-tool									\
-+	EGG_DBUS_GENMARSHAL=eggdbus-glib-genmarshal eggdbus-binding-tool									\
- 	  --namespace       "Test"										\
- 	  --dbus-namespace  "com.example"									\
- 	  --include-header  testtypes.h										\
diff --git a/meta/recipes-core/eggdbus/eggdbus_0.6.bb b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
deleted file mode 100644
index 75f56de..0000000
--- a/meta/recipes-core/eggdbus/eggdbus_0.6.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "An alternative to dbug-glib."
-DESCRIPTION = "An alternative to dbus-glib. It is designed specifically to make it comfortable to work with very large and potentially complex D-Bus services like e.g. DeviceKit-disks"
-HOMEPAGE = "http://cgit.freedesktop.org/~david/eggdbus"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
-                    file://src/eggdbus/eggdbus.h;md5=6b312aef57ed8d738b3f131ad037d6c2"
-PR = "r3"
-
-DEPENDS = "dbus glib-2.0 dbus-glib eggdbus-native"
-DEPENDS_virtclass-native = "dbus-native glib-2.0-native dbus-glib-native"
-
-BASE_SRC_URI = "http://cgit.freedesktop.org/~david/${BPN}/snapshot/${BPN}-${PV}.tar.bz2 \
-          file://gtk-doc.patch;apply=yes \
-          "
-
-SRC_URI = "${BASE_SRC_URI} \
-           file://marshal.patch;apply=yes \
-          "
-
-SRC_URI[md5sum] = "0a111faa54dfba2cf432c2c8e8a76e06"
-SRC_URI[sha256sum] = "3ad26e271c1a879bafcd181e065fe0ed53b542299a773c3188c9edb25b895ed1"
-
-SRC_URI_virtclass-native = "${BASE_SRC_URI}"
-
-inherit autotools
-
-EXTRA_OECONF = " --disable-man-pages --disable-gtk-doc-html "
-
-BBCLASSEXTEND = "native"
-
-PARALLEL_MAKE = ""
-- 
1.7.10



