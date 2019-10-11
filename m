Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id ACB517F58E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:06 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f22so9895913wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B9bQp3LmKvtCk4BK2Ogub3dp8yjDRTyxYXWFZV/oD4U=;
	b=qpGnGaYnaVuqTcCcbacD+LfpXEQJxSr2+aJ6WTiBIi9Pd1TjJV9qx4dXhcLHJwe5DL
	xTHCTY8W2Kc+VW6uAhZLsWmYiH5l8bYodAwK5egeoalShAxVZ3tCm6Trt7dQZWJAvS2F
	kri8HJlTEcka2yrbNL7WEmMI8x282549XUl0kIVvLlPuzgZphH7OvufEGvSoAnv41ROM
	/iLbIS3To0gV86lWJ0SYvWNUHnofnoaZNJGp3fNYmSkb2BEszo/HYOpensykc/4Jvnvg
	kNbp8QVvCzw+xBIOgZEWE2/nyZtJtzJVkQnNOD/ZN3uBvVcGDtertSPj7Z/GaffGOXdu
	vEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B9bQp3LmKvtCk4BK2Ogub3dp8yjDRTyxYXWFZV/oD4U=;
	b=jxGkwLyxL8b0fHjDYG1S+/ZbghfsyAseuas//DEEu3ocCwkKybvzRSHuVR+iJ+gqQt
	yGXoknx8XK+JqBo/qBYUMB+JTCk5N7c3hb+VrhXxHMEyUIxtVTLI3y6PY3QZW9s2gPyy
	8JinE6lXKnuiGuADkidHnlBNX1loEn2EBt6xc00idm/7Jhuv14hjMQHkPor//ATWF4fl
	tp4EL3k4eNWAwvcHGaeZsZQViPH+teFpzzmxhO0ZBb+MEOvmwW120e8Gg5vxbP+MERvh
	Hc9sTezL7OVE2fjs9HSVqY95Lf4np25J5Xs3Gzeyzt23d8hUuxzaQIxoJ+t88BM+/ZUM
	Plcw==
X-Gm-Message-State: APjAAAUVppYTGBZKP2kJATXxGlXlJo8012lxu+udAHCmIDvhG+tBSNsw
	qMOThTSn8H3dDq8cFIGRTI2U+T1B
X-Google-Smtp-Source: APXvYqxMsBQcZ6U2kdzy89C2RXBCyRPqdhBY3XrPB8/EJyL2NL6kHFlQ5VKsreeEvsjlt9N3SMu64g==
X-Received: by 2002:a1c:d8:: with SMTP id 207mr2892043wma.65.1570794487039;
	Fri, 11 Oct 2019 04:48:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:42 +0200
Message-Id: <20191011114754.91740-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/19] sysprof: update to 3.34.1
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:07 -0000

0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
is replaced by a meson option.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...thing-in-help-as-it-requires-itstool.patch | 27 --------------
 ...-Define-NT_GNU_BUILD_ID-if-undefined.patch | 35 +++++++++++++++++++
 .../files/define-NT_GNU_BUILD_ID.patch        | 22 ------------
 .../{sysprof_3.32.0.bb => sysprof_3.34.1.bb}  | 16 +++++----
 4 files changed, 45 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 rename meta/recipes-kernel/sysprof/{sysprof_3.32.0.bb => sysprof_3.34.1.bb} (63%)

diff --git a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
deleted file mode 100644
index ade51cf864f..00000000000
--- a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 23 Aug 2017 18:38:26 +0300
-Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 3986273..ae2f65e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -164,7 +164,6 @@ subdir('tools')
- subdir('tests')
- 
- subdir('data')
--subdir('help')
- subdir('po')
- 
- meson.add_install_script('build-aux/meson/post_install.sh')
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch b/meta/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
new file mode 100644
index 00000000000..75aa86cdbf0
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
@@ -0,0 +1,35 @@
+From 3025d80aaacc5f67aa9eb1e6fde30f71d9c5b04b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Jul 2011 16:00:17 -0700
+Subject: [PATCH 1/2] sysprof: Define NT_GNU_BUILD_ID if undefined
+
+On uclibc elf.h does not have GNU extentions but we need this define
+so we define it locally if its not getting it from elf.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+%% original patch: define-NT_GNU_BUILD_ID.patch
+---
+ src/libsysprof/elfparser.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libsysprof/elfparser.h b/src/libsysprof/elfparser.h
+index 160e4c9..94fa5c0 100644
+--- a/src/libsysprof/elfparser.h
++++ b/src/libsysprof/elfparser.h
+@@ -18,6 +18,10 @@
+ 
+ #include <glib.h>
+ 
++#ifndef NT_GNU_BUILD_ID
++#define NT_GNU_BUILD_ID 3
++#endif
++
+ typedef struct ElfSym ElfSym;
+ typedef struct ElfParser ElfParser;
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
deleted file mode 100644
index f75ddad43a1..00000000000
--- a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-On uclibc elf.h does not have GNU extentions but we need this define
-so we define it locally if its not getting it from elf.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: git/elfparser.h
-===================================================================
---- git.orig/lib/util/elfparser.h	2011-07-16 18:57:41.000000000 -0700
-+++ git/lib/util/elfparser.h	2011-07-16 20:28:54.733829895 -0700
-@@ -17,6 +17,10 @@
-  */
- #include <glib.h>
- 
-+#ifndef NT_GNU_BUILD_ID
-+#define NT_GNU_BUILD_ID 3
-+#endif
-+
- typedef struct ElfSym ElfSym;
- typedef struct ElfParser ElfParser;
- 
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta/recipes-kernel/sysprof/sysprof_3.34.1.bb
similarity index 63%
rename from meta/recipes-kernel/sysprof/sysprof_3.32.0.bb
rename to meta/recipes-kernel/sysprof/sysprof_3.34.1.bb
index b92933806cf..6d04cce5303 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.32.0.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -2,23 +2,26 @@ SUMMARY = "System-wide Performance Profiler for Linux"
 HOMEPAGE = "http://www.sysprof.com"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
+                    file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext systemd upstream-version-is-even gsettings
 
 DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
-SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
-SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
+SRC_URI[archive.md5sum] = "cc32455277b31afb1965d627ae3e3629"
+SRC_URI[archive.sha256sum] = "844bbb8d8b65071b3bca96f8e921319ceef81f2d2c51fcc9da63a4b355c893d0"
 SRC_URI += " \
-           file://define-NT_GNU_BUILD_ID.patch \
-           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
+           file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
            "
 
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
-PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
+PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
 PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
+PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
+
+# Enablig this requries yelp
+EXTRA_OEMESON += "-Dhelp=false"
 
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
@@ -28,5 +31,6 @@ SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysp
 FILES_${PN} += " \
                ${datadir}/dbus-1/system-services \
                ${datadir}/dbus-1/system.d \
+               ${datadir}/dbus-1/interfaces \
                ${datadir}/metainfo \
                "
-- 
2.17.1


