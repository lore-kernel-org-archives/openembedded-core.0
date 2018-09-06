Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id 25479795CC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:41 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id u1-v6so8487903eds.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VggUExVGaHgCFykwx3k6SKtolykPDrp1p6M+MZ/tawQ=;
	b=PUPeCW0EMSnpD72E546liAeO1YJnP3GZ4j7pyV7yACnE1O3SBcxU2fSgdfnAPySPI7
	txDDsLOOv19Ty++hgam9Qzf39khrqqz21PbR4CZnlFehwzNNmuCxAx6FwVF0r7dqyD2I
	t4jNWf5kTHMwahEwP4JVaDjxhfB7gDo7Hs1WtvN9CGQMt7Xtc1s7Cm4E57Cf4+DsAAC2
	qmpna369vw0cQcIYi63nQPbDPFsDdf+PtnnfvKt3ZsSR/P6zVcKZMLG+fczsjaitFWse
	AdFqP8HZ6M5EUy2sEC1x3fnZSMv0drq9AKiEYESNvPCXdA7Dy+N9uL0Wd8JhUL0sOtEr
	M3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VggUExVGaHgCFykwx3k6SKtolykPDrp1p6M+MZ/tawQ=;
	b=qxeFcJH6DmDbeiNwx/5P7N3NdO5ZT0/j2C1eIlExpN5nV+u0EzvAWGiWNINUkKzfIW
	VMSEtUH7yEJUh8SpETwkSKCSO0Aaxs1kAzWMfzZnH8fJHGbTTbcdEo3iM4obEsM6EmHO
	Pyl7WSYsv/IUGx5fV7TlugTd7dI0S7L3NU+0KOkTGTRybeqayB5LU2E/sITznBERgtUh
	NoxhPY2RzEnCKaG4+gZrVOdEDFNr1jJXgJzlw0S1hMrMa5HPYc3mEZneut7Rn4kV+v1b
	DS3UK81rc2B0phMKmaN+SraMP33R0/w2B4S+E+1AbE52y3lfTLGdv3s0FG8oKY6RyyNb
	WS0g==
X-Gm-Message-State: APzg51CsV4Sp0XPyflvAL1R60Eilg+d86bDKzqYtwyCwYvn4CTLFRcuO
	k4DdZLnTVgd/f3mSffM2PJRrPvzCcMM=
X-Google-Smtp-Source: ANB0VdbxTHcSASa5iCHJorjY3c7xAKtRqP3egGNHa4qh8G6i4o9VnuJFf0FjCmybsqejUSar1hO4Uw==
X-Received: by 2002:a50:a3cb:: with SMTP id
	t11-v6mr2680906edb.238.1536229782453; 
	Thu, 06 Sep 2018 03:29:42 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:11 +0200
Message-Id: <1536229770-29600-2-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/21] sysprof: update to 3.30.0
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:42 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...d-anything-in-help-as-it-requires-itstool.patch | 13 +++++----
 meta/recipes-kernel/sysprof/sysprof_3.26.1.bb      | 32 ---------------------
 meta/recipes-kernel/sysprof/sysprof_3.30.0.bb      | 33 ++++++++++++++++++++++
 3 files changed, 40 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
 create mode 100644 meta/recipes-kernel/sysprof/sysprof_3.30.0.bb

diff --git a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
index e28fdca..ade51cf 100644
--- a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
+++ b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
@@ -1,26 +1,27 @@
-From c2495a4c042e6a675da69bab20cc3669391e8e2a Mon Sep 17 00:00:00 2001
+From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 Aug 2017 18:38:26 +0300
-Subject: [PATCH 1/2] Do not build anything in help/ as it requires itstool.
+Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  meson.build | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 4ac3934..8c4369a 100644
+index 3986273..ae2f65e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -116,7 +116,6 @@ subdir('tools')
+@@ -164,7 +164,6 @@ subdir('tools')
  subdir('tests')
  
  subdir('data')
 -subdir('help')
  subdir('po')
  
- meson.add_install_script('build-aux/meson_post_install.sh')
+ meson.add_install_script('build-aux/meson/post_install.sh')
 -- 
-2.14.1
+2.7.4
 
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
deleted file mode 100644
index 9fb4e57..0000000
--- a/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "System-wide Performance Profiler for Linux"
-HOMEPAGE = "http://www.sysprof.com"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
-
-GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gettext systemd upstream-version-is-even
-
-DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
-
-SRC_URI[archive.md5sum] = "6f9f947960ba79bb1269d8ee49b7db78"
-SRC_URI[archive.sha256sum] = "d8b9d5c2246696e4a3776a312731dc7c014fbd33478bb14d5512c6f1f35a3b11"
-SRC_URI += " \
-           file://define-NT_GNU_BUILD_ID.patch \
-           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
-           "
-RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://bugzilla.gnome.org/show_bug.cgi?id=794625"
-
-PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
-PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
-PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
-
-SOLIBS = ".so"
-FILES_SOLIBSDEV = ""
-
-SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
-
-FILES_${PN} += " \
-               ${datadir}/dbus-1/system-services \
-               ${datadir}/dbus-1/system.d \
-               "
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb b/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
new file mode 100644
index 0000000..4f1b750
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "System-wide Performance Profiler for Linux"
+HOMEPAGE = "http://www.sysprof.com"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase gettext systemd upstream-version-is-even
+
+DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
+
+SRC_URI[archive.md5sum] = "ae896a8a2364e18c07fafa9573202f59"
+SRC_URI[archive.sha256sum] = "29cd2c4be277f00698dce48259219557c4fddc2c01254b8fac95900a8c663f63"
+SRC_URI += " \
+           file://define-NT_GNU_BUILD_ID.patch \
+           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
+           "
+RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://bugzilla.gnome.org/show_bug.cgi?id=794625"
+
+PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
+PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
+
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
+
+FILES_${PN} += " \
+               ${datadir}/dbus-1/system-services \
+               ${datadir}/dbus-1/system.d \
+               ${datadir}/metainfo \
+               "
-- 
2.7.4


