Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3151F6021E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 16:51:44 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k3so1952293pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MJVWNgXm+3X1QoI8w97oC367RCKPqBadMaDlD1MoRA0=;
	b=KL9J/Cv9UU3caDnfyoBEk8Bfb6tS2ZoU5zxIZSU8jW6QGtVAzsMTBJxdfeKpP7mqcM
	HJHpK6YS02szaKgu40qCkcrmvgM7q/5104I98DibjFwwIe6em+DiiOGD7k1ktOjpUvgR
	k9xcJXEhlpOOA6hpOUkFAwqDbt/edFGlQt72xFvICwEFmG01+B/iTb7+esYwOuvmMBbo
	KRhulqyD3Xy2aNnaXVM5isr3dkfSDlFbMpi2eVO1bYoEZiJ8KqsJeG5ggRHWpEe7GsBc
	f6gFECzpgsXoiXzgpa8JXUC/l0M6ZijQkBHQmXG9sf32HdhDPwmg/yCZu1HKkz4Sj6+z
	aNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MJVWNgXm+3X1QoI8w97oC367RCKPqBadMaDlD1MoRA0=;
	b=BTteCbhXUZ1D9F0l6efiffua0AZOgfUdWMH4t5xxhPnxCYkcCGhBbdF6w29sbWjj8k
	iZJzrJbJ7888VFzI4PcKB64SveRdhx79I8A5wMvkdYMJM7hkK+1r3YbxL2UH1NqUYTIh
	eSXIy9kTWPcO1NWyl/lLKhunfg6mDZbTEyCJjG3Xkeka8TeG6UQjIUT/nca4lsmWMJyD
	8JC39aHWQm1fOCD4Q/R/IYHjxEWilU1Fmzi0A6KbnEodO7bJ2akTQcsjd181ukvDEUC0
	ToaL8giEi3EOU2+iXfGQOIKK7IF7K8dmJjwf+dwOlpuRE8Dal0rjV9zGM4qGCmwVoQ/E
	QAyQ==
X-Gm-Message-State: APjAAAVYvyDyzlTWIHpKmpCwOjnW6kDzJXqUOSD/2ByavrbAeq/YWEOj
	2Voli49/pK2uJqWJdwqh4z+sHkJiLs8=
X-Google-Smtp-Source: APXvYqwb8ZafoYo9uZvHWaENUJebGkwVawM/EWkrrYr2/oAl/YQU6zAQln78hIthE8kjltVLwZyrtw==
X-Received: by 2002:a63:f70b:: with SMTP id x11mr5733606pgh.80.1580403104282; 
	Thu, 30 Jan 2020 08:51:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	d69sm4091279pfd.72.2020.01.30.08.51.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jan 2020 08:51:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2020 08:51:47 -0800
Message-Id: <24a8b4f8d4bdcf67fcae933539008f9f109c9fae.1580403003.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580403003.git.raj.khem@gmail.com>
References: <cover.1580403003.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runit: Add runit and related recipes
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:01 -0000
Content-Transfer-Encoding: 8bit

* Another init system, very small in size with application life
  cycle management
* Add runit-services recipe for additional runit services from void linux
* socklog is a system/kernel logger
* Add socklog-services to provide additional logging services

* disable the chkshsgr tests in socklog

Running the chkhsgr test during cross compile fails

./chkshsgr || ( cat warn-shsgr; exit 1 )
Oops. Your getgroups() returned 0, and setgroups() failed; this means
that I can't reliably do my shsgr test. Please either ``make'' as root
or ``make'' while you're in one or more supplementary groups.

All OE based targets have working getgroups()/setgroups()
implementation, so its a safe assumption and therefore make the test
to be a dummy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +
 meta/conf/layer.conf                          |   1 +
 meta/recipes-core/runit/runit-serialgetty.bb  |  43 ++++++++
 .../runit/runit-serialgetty/finish            |   2 +
 meta/recipes-core/runit/runit-serialgetty/run |   2 +
 meta/recipes-core/runit/runit-services.bb     |  50 +++++++++
 ...y-for-services-on-Debian-is-etc-servi.diff |  87 +++++++++++++++
 ...t-nosync-file-to-make-sync-on-shutdow.diff |  95 ++++++++++++++++
 ...03-utmpset.c-mixes-int32_t-and-time_t.diff |  57 ++++++++++
 ...-t-use-static-to-link-runit-runit-ini.diff |  30 ++++++
 .../0005-patch-etc-runit-2-for-FHS.patch      |  17 +++
 ...0006-make-buildsystem-respect-CFLAGS.patch |  21 ++++
 .../runit/0007-move-communication-files.patch | 102 ++++++++++++++++++
 .../runit/0008-emulate-sysv-runlevel-5.patch  |  20 ++++
 .../runit/0009-fix-error-in-manpage.patch     |  23 ++++
 meta/recipes-core/runit/runit/clearmem.patch  |  22 ++++
 meta/recipes-core/runit/runit/cross.patch     |  50 +++++++++
 ...h-disable-chkshgrp-test-that-fails-i.patch |  19 ++++
 ...h-fix-spin-lock-on-systems-with-poor.patch |  20 ++++
 ...h-make-build-system-print-compilatio.patch |  15 +++
 meta/recipes-core/runit/runit/svlogd.patch    |  19 ++++
 meta/recipes-core/runit/runit_2.1.2.bb        |  68 ++++++++++++
 meta/recipes-core/runit/socklog-services.bb   |  23 ++++
 ...-options-to-cp-to-ensure-proper-mods.patch |  33 ++++++
 meta/recipes-core/runit/socklog/cross.patch   |  58 ++++++++++
 meta/recipes-core/runit/socklog_2.1.0.bb      |  32 ++++++
 26 files changed, 911 insertions(+)
 create mode 100644 meta/recipes-core/runit/runit-serialgetty.bb
 create mode 100644 meta/recipes-core/runit/runit-serialgetty/finish
 create mode 100644 meta/recipes-core/runit/runit-serialgetty/run
 create mode 100644 meta/recipes-core/runit/runit-services.bb
 create mode 100644 meta/recipes-core/runit/runit/0001-default-directory-for-services-on-Debian-is-etc-servi.diff
 create mode 100644 meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-make-sync-on-shutdow.diff
 create mode 100644 meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.diff
 create mode 100644 meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-link-runit-runit-ini.diff
 create mode 100644 meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch
 create mode 100644 meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patch
 create mode 100644 meta/recipes-core/runit/runit/0007-move-communication-files.patch
 create mode 100644 meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch
 create mode 100644 meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch
 create mode 100644 meta/recipes-core/runit/runit/clearmem.patch
 create mode 100644 meta/recipes-core/runit/runit/cross.patch
 create mode 100644 meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.patch
 create mode 100644 meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.patch
 create mode 100644 meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.patch
 create mode 100644 meta/recipes-core/runit/runit/svlogd.patch
 create mode 100644 meta/recipes-core/runit/runit_2.1.2.bb
 create mode 100644 meta/recipes-core/runit/socklog-services.bb
 create mode 100644 meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensure-proper-mods.patch
 create mode 100644 meta/recipes-core/runit/socklog/cross.patch
 create mode 100644 meta/recipes-core/runit/socklog_2.1.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a80e85a2f6..5e79dc3892 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -616,6 +616,8 @@ RECIPE_MAINTAINER_pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ruby = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-run-postinsts = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-runit = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-runit-serialgetty = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-sato-screenshot = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-sbc = "Tanu Kaskinen <tanuk@iki.fi>"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index fcdf9ae5a3..07d9a9e32d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -35,6 +35,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   keymaps \
   udev-extraconf \
   packagegroup-x11-xserver \
+  runit-serialgetty \
   systemd-serialgetty \
   initscripts \
   shadow \
diff --git a/meta/recipes-core/runit/runit-serialgetty.bb b/meta/recipes-core/runit/runit-serialgetty.bb
new file mode 100644
index 0000000000..780a74bafa
--- /dev/null
+++ b/meta/recipes-core/runit/runit-serialgetty.bb
@@ -0,0 +1,43 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Serial terminal support for runit"
+
+SECTION = "base utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "\
+           file://run \
+           file://finish \
+"
+
+S = "${WORKDIR}"
+
+SERIAL_CONSOLES ??= "115200;ttyS0"
+
+do_install() {
+	install -d ${D}${sysconfdir}/service ${D}${sysconfdir}/runit/runsvdir/default
+	tmp="${SERIAL_CONSOLES}"
+	for i in $tmp
+	do
+		baudrate=`echo $i | sed 's/\;.*//'`
+		ttydev=`echo $i | sed -e 's/^[0-9]*\;//' -e 's/\;.*//'`
+		install -d ${D}${sysconfdir}/sv/getty-${ttydev}
+		install -m 755 ${WORKDIR}/run ${D}${sysconfdir}/sv/getty-${ttydev}
+		install -m 755 ${WORKDIR}/finish ${D}${sysconfdir}/sv/getty-${ttydev}
+		sed -i -e s/\@BAUDRATE\@/$baudrate/g ${D}${sysconfdir}/sv/getty-${ttydev}/run
+		sed -i -e s/\@BAUDRATE\@/$baudrate/g ${D}${sysconfdir}/sv/getty-${ttydev}/finish
+		sed -i -e s/\@TTY\@/$ttydev/g ${D}${sysconfdir}/sv/getty-${ttydev}/run
+		sed -i -e s/\@TTY\@/$ttydev/g ${D}${sysconfdir}/sv/getty-${ttydev}/finish
+		ln -s ${localstatedir}/run/sv.getty-${ttydev} ${D}${sysconfdir}/sv/getty-${ttydev}/supervise
+		ln -s ${sysconfdir}/sv/getty-${ttydev} ${D}${sysconfdir}/service/getty-${ttydev}
+		ln -s ${sysconfdir}/sv/getty-${ttydev} ${D}${sysconfdir}/runit/runsvdir/default/getty-${ttydev}
+	done
+}
+# Since SERIAL_CONSOLES is likely to be set from the machine configuration
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} = "${sysconfdir}"
diff --git a/meta/recipes-core/runit/runit-serialgetty/finish b/meta/recipes-core/runit/runit-serialgetty/finish
new file mode 100644
index 0000000000..860c07d64d
--- /dev/null
+++ b/meta/recipes-core/runit/runit-serialgetty/finish
@@ -0,0 +1,2 @@
+#!/bin/sh
+exec utmpset -w @TTY@
diff --git a/meta/recipes-core/runit/runit-serialgetty/run b/meta/recipes-core/runit/runit-serialgetty/run
new file mode 100644
index 0000000000..2070fbd711
--- /dev/null
+++ b/meta/recipes-core/runit/runit-serialgetty/run
@@ -0,0 +1,2 @@
+#!/bin/sh
+exec /sbin/getty @BAUDRATE@ @TTY@ vt102
diff --git a/meta/recipes-core/runit/runit-services.bb b/meta/recipes-core/runit/runit-services.bb
new file mode 100644
index 0000000000..d24ed592dc
--- /dev/null
+++ b/meta/recipes-core/runit/runit-services.bb
@@ -0,0 +1,50 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Additional runit scripts for OE based systems"
+HOMEPAGE = "https://github.com/YoeDistro/oe-runit"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://README.md;beginline=41;endline=48;md5=f2f8535b84b11359cc7757b009cfd646"
+SECTION = "base"
+
+PV = "20180623+git${SRCPV}"
+
+SRCREV = "8d5db5c26670e49524f33800aaf0337466495c84"
+SRC_URI = "git://github.com/YoeDistro/oe-runit;branch=oe/master \
+"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "PREFIX=${exec_prefix}"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+	install -d ${D}${base_bindir} ${D}${sysconfdir}/runit/runsvdir
+	for f in shutdown halt reboot poweroff
+	do
+		ln -sf ${bindir}/$f ${D}${base_bindir}/$f
+	done
+}
+
+pkg_postinst_ontarget_${PN} () {
+        # Enable default services:
+        #       - agetty-tty[1-4] (default)
+        #       - udevd (default)
+        #       - sulogin (single)
+        mkdir -p $D/etc/runit/runsvdir/single
+        ln -sf /etc/sv/sulogin $D/etc/runit/runsvdir/single
+
+        mkdir -p $D/etc/runit/runsvdir/default
+        if [ ! -e $D/etc/runit/runsvdir/current ]; then
+		ln -sf default $D/etc/runit/runsvdir/current
+	fi
+        if [ -e $D/etc/sv/udevd/run ]; then
+        	ln -sf /etc/sv/udevd $D/etc/runit/runsvdir/default
+	fi
+}
+
+RDEPENDS_${PN} = "runit findutils util-linux-fsck coreutils"
+
+PACKAGES =+ "${PN}-dracut"
+
+FILES_${PN}-dracut = "${nonarch_libdir}/dracut"
diff --git a/meta/recipes-core/runit/runit/0001-default-directory-for-services-on-Debian-is-etc-servi.diff b/meta/recipes-core/runit/runit/0001-default-directory-for-services-on-Debian-is-etc-servi.diff
new file mode 100644
index 0000000000..afc1bc5564
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0001-default-directory-for-services-on-Debian-is-etc-servi.diff
@@ -0,0 +1,87 @@
+From d99515f6c8427e5f1c8f252532df8858bdef1007 Mon Sep 17 00:00:00 2001
+From: Gerrit Pape <pape@smarden.org>
+Date: Wed, 7 May 2008 23:51:16 +0000
+Subject: [PATCH] default directory for services on Debian is /etc/service/,
+ not /service/
+
+---
+ runit-2.1.2/man/runsv.8      | 4 ++--
+ runit-2.1.2/man/runsvchdir.8 | 4 ++--
+ runit-2.1.2/man/sv.8         | 4 ++--
+ runit-2.1.2/src/sv.c         | 2 +-
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/runit-2.1.2/man/runsv.8 b/runit-2.1.2/man/runsv.8
+index 7c5abfc..75bc73a 100644
+--- a/runit-2.1.2/man/runsv.8
++++ b/runit-2.1.2/man/runsv.8
+@@ -157,9 +157,9 @@ This command is ignored if it is given to
+ .IR service /log/supervise/control.
+ .P
+ Example: to send a TERM signal to the socklog-unix service, either do
+-  # sv term /service/socklog-unix
++  # sv term /etc/service/socklog-unix
+  or
+-  # printf t >/service/socklog-unix/supervise/control
++  # printf t >/etc/service/socklog-unix/supervise/control
+ .P
+ .BR printf (1)
+ usually blocks if no
+diff --git a/runit-2.1.2/man/runsvchdir.8 b/runit-2.1.2/man/runsvchdir.8
+index f7f94dc..a5fc180 100644
+--- a/runit-2.1.2/man/runsvchdir.8
++++ b/runit-2.1.2/man/runsvchdir.8
+@@ -27,13 +27,13 @@ with a symlink pointing to
+ .IR dir .
+ .P
+ Normally 
+-.I /service
++.I /etc/service
+ is a symlink to
+ .IR current ,
+ and
+ .BR runsvdir (8)
+ is running
+-.IR /service/ .
++.IR /etc/service/ .
+ .SH EXIT CODES
+ .B runsvchdir
+ prints an error message and exits 111 on error.
+diff --git a/runit-2.1.2/man/sv.8 b/runit-2.1.2/man/sv.8
+index 7ed9852..fa56443 100644
+--- a/runit-2.1.2/man/sv.8
++++ b/runit-2.1.2/man/sv.8
+@@ -30,7 +30,7 @@ If
+ .I service
+ doesn't start with a dot or slash and doesn't end with a slash, it is
+ searched in the default services directory
+-.IR /service/ ,
++.IR /etc/service/ ,
+ otherwise relative to the current directory.
+ .P
+ .I command
+@@ -232,7 +232,7 @@ This option implies
+ .TP
+ .B SVDIR
+ The environment variable $SVDIR overrides the default services directory
+-.IR /service/ .
++.IR /etc/service/ .
+ .TP
+ .B SVWAIT
+ The environment variable $SVWAIT overrides the default 7 seconds to wait
+diff --git a/runit-2.1.2/src/sv.c b/runit-2.1.2/src/sv.c
+index 0125795..887e9d1 100644
+--- a/runit-2.1.2/src/sv.c
++++ b/runit-2.1.2/src/sv.c
+@@ -32,7 +32,7 @@
+ char *progname;
+ char *action;
+ char *acts;
+-char *varservice ="/service/";
++char *varservice ="/etc/service/";
+ char **service;
+ char **servicex;
+ unsigned int services;
+-- 
+2.0.1
+
diff --git a/meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-make-sync-on-shutdow.diff b/meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-make-sync-on-shutdow.diff
new file mode 100644
index 0000000000..91f9e947e1
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-make-sync-on-shutdow.diff
@@ -0,0 +1,95 @@
+From aed8774b9aa813cbb3e8b732f6f7ae132f86c82b Mon Sep 17 00:00:00 2001
+From: Andras Korn <korn-debbugs@elan.rulez.org>
+Date: Thu, 6 Dec 2012 16:57:06 +0100
+Subject: [PATCH] support /etc/runit/nosync file to make sync on
+ shutdown/reboot optional
+
+https://bugs.debian.org/695281
+---
+ runit-2.1.2/doc/runit.8.html |  2 ++
+ runit-2.1.2/man/runit.8      |  5 +++++
+ runit-2.1.2/src/runit.c      | 15 ++++++++++-----
+ runit-2.1.2/src/runit.h      |  1 +
+ 4 files changed, 18 insertions(+), 5 deletions(-)
+
+--- a/runit-2.1.2/doc/runit.8.html
++++ b/runit-2.1.2/doc/runit.8.html
+@@ -34,6 +34,8 @@ stage 2 if it is running, and runs <i>/e
+ and possibly halt or reboot the system are done here. If stage 3 returns,
+ <b>runit</b> checks if the file <i>/etc/runit/reboot</i> exists and has the execute by
+ owner permission set. If so, the system is rebooted, it&rsquo;s halted otherwise.
++If <i>/etc/runit/nosync</i> exists, <b>runit</b> doesn&rsquo;t invoke
++sync(). This is useful in vservers.
+ 
+ <h2><a name='sect6'>Ctrl-alt-del</a></h2>
+ If <b>runit</b> receives the ctrl-alt-del keyboard request and the file
+--- a/runit-2.1.2/man/runit.8
++++ b/runit-2.1.2/man/runit.8
+@@ -48,6 +48,11 @@ checks if the file
+ .I /etc/runit/reboot
+ exists and has the execute by owner permission set.
+ If so, the system is rebooted, it's halted otherwise.
++If
++.I /etc/runit/nosync
++exists,
++.B runit
++doesn't invoke sync(). This is useful in vservers.
+ .SH CTRL-ALT-DEL
+ If
+ .B runit
+--- a/runit-2.1.2/src/runit.c
++++ b/runit-2.1.2/src/runit.c
+@@ -41,6 +41,11 @@ void sig_int_handler (void) {
+ }
+ void sig_child_handler (void) { write(selfpipe[1], "", 1); }
+ 
++void sync_if_needed() {
++  struct stat s;
++  if (stat(NOSYNC, &s) == -1) sync();
++}
++
+ int main (int argc, const char * const *argv, char * const *envp) {
+   const char * prog[2];
+   int pid, pid2;
+@@ -305,28 +310,28 @@ int main (int argc, const char * const *
+   case -1:
+   if ((stat(REBOOT, &s) != -1) && (s.st_mode & S_IXUSR)) {
+     strerr_warn2(INFO, "system reboot.", 0);
+-    sync();
++    sync_if_needed();
+     reboot_system(RB_AUTOBOOT);
+   }
+   else {
+ #ifdef RB_POWER_OFF
+     strerr_warn2(INFO, "power off...", 0);
+-    sync();
++    sync_if_needed();
+     reboot_system(RB_POWER_OFF);
+     sleep(2);
+ #endif
+ #ifdef RB_HALT_SYSTEM
+     strerr_warn2(INFO, "system halt.", 0);
+-    sync();
++    sync_if_needed();
+     reboot_system(RB_HALT_SYSTEM);
+ #else
+ #ifdef RB_HALT
+     strerr_warn2(INFO, "system halt.", 0);
+-    sync();
++    sync_if_needed();
+     reboot_system(RB_HALT);
+ #else
+     strerr_warn2(INFO, "system reboot.", 0);
+-    sync();
++    sync_if_needed();
+     reboot_system(RB_AUTOBOOT);
+ #endif
+ #endif
+--- a/runit-2.1.2/src/runit.h
++++ b/runit-2.1.2/src/runit.h
+@@ -1,4 +1,5 @@
+ #define RUNIT "/sbin/runit"
+ #define STOPIT "/etc/runit/stopit"
+ #define REBOOT "/etc/runit/reboot"
++#define NOSYNC "/run/runit.nosync"
+ #define CTRLALTDEL "/etc/runit/ctrlaltdel"
diff --git a/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.diff b/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.diff
new file mode 100644
index 0000000000..6b21bbb40e
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.diff
@@ -0,0 +1,57 @@
+From 20a0afcd367666efc17c59cf121a0d991ff1bd09 Mon Sep 17 00:00:00 2001
+From: Gerrit Pape <pape@smarden.org>
+Date: Thu, 31 Jul 2014 12:25:49 +0000
+Subject: [PATCH] utmpset.c: mixes "int32_t *" and "time_t *"
+
+Don't pass int32_t to time(), thx Lorenzo Beretta,
+https://bugs.debian.org/754849
+---
+ runit-2.1.2/src/utmpset.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/runit-2.1.2/src/utmpset.c b/runit-2.1.2/src/utmpset.c
+index eea41a5..2e8a525 100644
+--- a/runit-2.1.2/src/utmpset.c
++++ b/runit-2.1.2/src/utmpset.c
+@@ -24,6 +24,7 @@ void usage(void) { strerr_die4x(1, "usage: ", progname, USAGE, "\n"); }
+ int utmp_logout(const char *line) {
+   int fd;
+   uw_tmp ut;
++  time_t t;
+   int ok =-1;
+ 
+   if ((fd =open(UW_TMP_UFILE, O_RDWR, 0)) < 0)
+@@ -35,7 +36,8 @@ int utmp_logout(const char *line) {
+     if (!ut.ut_name[0] || (str_diff(ut.ut_line, line) != 0)) continue;
+     memset(ut.ut_name, 0, sizeof ut.ut_name);
+     memset(ut.ut_host, 0, sizeof ut.ut_host);
+-    if (time(&ut.ut_time) == -1) break;
++    if (time(&t) == -1) break;
++    ut.ut_time = t;
+ #ifdef DEAD_PROCESS
+     ut.ut_type =DEAD_PROCESS;
+ #endif
+@@ -52,6 +54,7 @@ int wtmp_logout(const char *line) {
+   int len;
+   struct stat st;
+   uw_tmp ut;
++  time_t t;
+ 
+   if ((fd = open_append(UW_TMP_WFILE)) == -1)
+     strerr_die4sys(111, FATAL, "unable to open ", UW_TMP_WFILE, ": ");
+@@ -65,10 +68,11 @@ int wtmp_logout(const char *line) {
+   memset(&ut, 0, sizeof(uw_tmp));
+   if ((len =str_len(line)) > sizeof ut.ut_line) len =sizeof ut.ut_line -2;
+   byte_copy(ut.ut_line, len, line);
+-  if (time(&ut.ut_time) == -1) {
++  if (time(&t) == -1) {
+     close(fd);
+     return(-1);
+   }
++  ut.ut_time = t;
+ #ifdef DEAD_PROCESS
+   ut.ut_type =DEAD_PROCESS;
+ #endif
+-- 
+2.0.1
+
diff --git a/meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-link-runit-runit-ini.diff b/meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-link-runit-runit-ini.diff
new file mode 100644
index 0000000000..c2cdfc8881
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-link-runit-runit-ini.diff
@@ -0,0 +1,30 @@
+From 77d0f60701a401ea0de0925d9422c78fb560b4f6 Mon Sep 17 00:00:00 2001
+From: Gerrit Pape <pape@smarden.org>
+Date: Thu, 31 Jul 2014 12:54:32 +0000
+Subject: [PATCH] src/Makefile: don't use -static to link runit, runit-init on
+ Debian
+
+---
+ runit-2.1.2/src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/runit-2.1.2/src/Makefile b/runit-2.1.2/src/Makefile
+index d9624de..507a419 100644
+--- a/runit-2.1.2/src/Makefile
++++ b/runit-2.1.2/src/Makefile
+@@ -6,10 +6,10 @@ check: $(IT)
+ 	./check-local $(IT)
+ 
+ runit: load runit.o unix.a byte.a
+-	./load runit unix.a byte.a -static
++	./load runit unix.a byte.a
+ 
+ runit-init: load runit-init.o unix.a byte.a
+-	./load runit-init unix.a byte.a -static
++	./load runit-init unix.a byte.a
+ 
+ runsv: load runsv.o unix.a byte.a time.a
+ 	./load runsv unix.a byte.a time.a
+-- 
+2.0.1
+
diff --git a/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch b/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch
new file mode 100644
index 0000000000..8bcfe8801c
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch
@@ -0,0 +1,17 @@
+Description: Make /etc/runit/2 respect FHS
+ On Debian system services directory is /etc/service, not /service.
+Author: Dmitry Bogatov <KAction@gnu.org>
+Last-Update: 2016-05-31
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+--- a/runit-2.1.2/etc/2
++++ b/runit-2.1.2/etc/2
+@@ -1,6 +1,6 @@
+ #!/bin/sh
+ 
+-PATH=/command:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin
++PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin
+ 
+ exec env - PATH=$PATH \
+-runsvdir -P /service 'log: ...........................................................................................................................................................................................................................................................................................................................................................................................................'
++runsvdir -P /etc/service 'log: ...........................................................................................................................................................................................................................................................................................................................................................................................................'
diff --git a/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patch b/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patch
new file mode 100644
index 0000000000..269d79a49b
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patch
@@ -0,0 +1,21 @@
+Description: Make buildsystem respect dpkg-buildflags
+Author: Dmitry Bogatov <KAction@gnu.org>
+Last-Update: 2016-06-01
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+--- a/runit-2.1.2/src/print-cc.sh
++++ b/runit-2.1.2/src/print-cc.sh
+@@ -2,4 +2,4 @@ cc="`head -n1 conf-cc`"
+ systype="`cat systype`"
+ 
+ cat warn-auto.sh
+-echo exec "$cc" '-c ${1+"$@"}'
++echo exec "$cc" "$CPPFLAGS" "$CFLAGS" '-c ${1+"$@"}'
+--- a/runit-2.1.2/src/print-ld.sh
++++ b/runit-2.1.2/src/print-ld.sh
+@@ -3,4 +3,4 @@ systype="`cat systype`"
+ 
+ cat warn-auto.sh
+ echo 'main="$1"; shift'
+-echo exec "$ld" '-o "$main" "$main".o ${1+"$@"}'
++echo exec "$ld" "$LDFLAGS" '-o "$main" "$main".o ${1+"$@"}'
diff --git a/meta/recipes-core/runit/runit/0007-move-communication-files.patch b/meta/recipes-core/runit/runit/0007-move-communication-files.patch
new file mode 100644
index 0000000000..bfcbac8015
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0007-move-communication-files.patch
@@ -0,0 +1,102 @@
+Description: Move communication files under /run
+ Runit by default uses files /etc/runit/stop and /etc/runit/reboot.
+ This configuration will not work when /etc is mounted read-only,
+ as such this patch renames this files into /run/runit.stop and
+ /run/runit.reboot
+Author: Dmitry Bogatov <KAction@gnu.org>
+Last-Update: 2016-06-02
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+--- a/runit-2.1.2/etc/debian/1
++++ b/runit-2.1.2/etc/debian/1
+@@ -6,5 +6,5 @@ PATH=/command:/sbin:/bin:/usr/sbin:/usr/
+ /etc/init.d/rcS
+ /etc/init.d/rmnologin
+ 
+-touch /etc/runit/stopit
+-chmod 0 /etc/runit/stopit
++touch /run/runit.stopit
++chmod 0 /run/runit.stopit
+--- a/runit-2.1.2/etc/debian/3
++++ b/runit-2.1.2/etc/debian/3
+@@ -4,7 +4,7 @@ exec 2>&1
+ PATH=/command:/sbin:/bin:/usr/sbin:/usr/bin
+ 
+ LAST=0
+-test -x /etc/runit/reboot && LAST=6
++test -x /run/runit.reboot && LAST=6
+ 
+ echo 'Waiting for services to stop...'
+ sv -w196 force-stop /service/*
+--- a/runit-2.1.2/etc/debian/ctrlaltdel
++++ b/runit-2.1.2/etc/debian/ctrlaltdel
+@@ -4,6 +4,6 @@ PATH=/bin:/usr/bin
+ MSG="System is going down in 14 seconds..."
+ 
+ # echo 'disabled.' ; exit
+-touch /etc/runit/stopit
+-chmod 100 /etc/runit/stopit && echo "$MSG" | wall
++touch /etc/runit.stopit
++chmod 100 /etc/runit.stopit && echo "$MSG" | wall
+ /bin/sleep 14
+--- a/runit-2.1.2/man/runit-init.8
++++ b/runit-2.1.2/man/runit-init.8
+@@ -26,9 +26,9 @@ To signal
+ the system halt request,
+ .B runit-init
+ removes all permissions of the file
+-.I /etc/runit/reboot
++.I /run/runit.reboot
+ (chmod 0), and sets the execute by owner permission of the file
+-.I /etc/runit/stopit
++.I /run/runit.stopit
+ (chmod 100).
+ Then a CONT signal is sent to
+ .BR runit (8).
+@@ -40,9 +40,9 @@ To signal
+ the system reboot request,
+ .B runit-init
+ sets the execute by owner permission of the files
+-.I /etc/runit/reboot
++.I /run/runit.reboot
+ and
+-.I /etc/runit/stopit
++.I /run/runit.stopit
+ (chmod 100). Then a CONT signal is sent to
+ .BR runit (8).
+ .SH EXIT CODES
+--- a/runit-2.1.2/man/runit.8
++++ b/runit-2.1.2/man/runit.8
+@@ -45,11 +45,11 @@ done here.
+ If stage 3 returns,
+ .B runit
+ checks if the file
+-.I /etc/runit/reboot
++.I /run/runit.reboot
+ exists and has the execute by owner permission set.
+ If so, the system is rebooted, it's halted otherwise.
+ If
+-.I /etc/runit/nosync
++.I /run/runit.nosync
+ exists,
+ .B runit
+ doesn't invoke sync(). This is useful in vservers.
+@@ -70,7 +70,7 @@ only accepts signals in stage 2.
+ If
+ .B runit
+ receives a CONT signal and the file
+-.I /etc/runit/stopit
++.I /run/runit.stopit
+ exists and has the execute by owner permission set,
+ .B runit
+ is told to shutdown the system.
+--- a/runit-2.1.2/src/runit.h
++++ b/runit-2.1.2/src/runit.h
+@@ -1,5 +1,5 @@
+ #define RUNIT "/sbin/runit"
+-#define STOPIT "/etc/runit/stopit"
+-#define REBOOT "/etc/runit/reboot"
++#define STOPIT "/run/runit.stopit"
++#define REBOOT "/run/runit.reboot"
+ #define NOSYNC "/run/runit.nosync"
+ #define CTRLALTDEL "/etc/runit/ctrlaltdel"
diff --git a/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch b/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch
new file mode 100644
index 0000000000..0d370c8fe7
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch
@@ -0,0 +1,20 @@
+Description: Emulalate sysv runlevel 5 by default
+ Currently, not many daemons in Debian provides proper runscripts, so
+ if user switches to runit, she will on next reboot, that none of daemons,
+ including essential, like cron, are started.
+ .
+ This patch starts them in sysv-init style -- unmanaged, in background.
+ It is sub-par solution, but allows one-by-one transition.
+Author: Dmitry Bogatov
+Forwarded: not-needed
+Last-Update: 2016-06-09
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+--- a/runit-2.1.2/etc/debian/1
++++ b/runit-2.1.2/etc/debian/1
+@@ -8,3 +8,5 @@ PATH=/command:/sbin:/bin:/usr/sbin:/usr/
+ 
+ touch /run/runit.stopit
+ chmod 0 /run/runit.stopit
++
++[ -e /etc/runit/no-emulate-sysv ] || /etc/init.d/rc 5
diff --git a/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch b/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch
new file mode 100644
index 0000000000..5803b0a387
--- /dev/null
+++ b/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch
@@ -0,0 +1,23 @@
+Description: Fix factual error in manpage.
+ Log ./finish script is not actually invoked. It is not clear, whether this
+ limitation is worth lifting.
+Author: Dmitry Bogatov <KAction@gnu.org>
+Forwarded: no
+Last-Update: 2016-08-31
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+--- a/runit-2.1.2/man/runsv.8
++++ b/runit-2.1.2/man/runsv.8
+@@ -54,10 +54,8 @@ and
+ .IR service /finish's
+ standard output to the pipe, switches to the directory
+ .IR service /log
+-and starts ./run (and ./finish) exactly as described above for the
+-.I service
+-directory.
+-The standard input of the log service is redirected to read from the pipe.
++and starts ./run script. The standard input of the log service
++is redirected to read from the pipe.
+ .P
+ .B runsv
+ maintains status information in a binary format (compatible to the
diff --git a/meta/recipes-core/runit/runit/clearmem.patch b/meta/recipes-core/runit/runit/clearmem.patch
new file mode 100644
index 0000000000..3fa28a7006
--- /dev/null
+++ b/meta/recipes-core/runit/runit/clearmem.patch
@@ -0,0 +1,22 @@
+fix segfault in svlogd discovered on armv7hf-musl.
+
+Code in svlogd.c allocates some memory at startup which is
+not zeroed, and other code was using those garbage values.
+I have no idea why this has never caused a problem before, but
+for me, svlogd consistently segfaults on armv7hf-musl when
+it is called by socklog.
+
+Upstream-Status: Pending
+Author: Christopher Brannon <chris@the-brannons.com>
+
+diff -Naur runit-2.1.2/src/svlogd.c runit-2.1.2/src/svlogd.c
+--- runit-2.1.2/src/svlogd.c	2014-08-10 11:22:34.000000000 -0700
++++ runit-2.1.2/src/svlogd.c	2018-03-03 03:28:08.243085845 -0800
+@@ -705,6 +705,7 @@
+   coe(fdwdir);
+   dir =(struct logdir*)alloc(dirn *sizeof(struct logdir));
+   if (! dir) die_nomem();
++  memset(dir, 0, dirn * sizeof(struct logdir));
+   for (i =0; i < dirn; ++i) {
+     dir[i].fddir =-1; dir[i].fdcur =-1;
+     dir[i].btmp =(char*)alloc(buflen *sizeof(char));
diff --git a/meta/recipes-core/runit/runit/cross.patch b/meta/recipes-core/runit/runit/cross.patch
new file mode 100644
index 0000000000..3a9dcd8afe
--- /dev/null
+++ b/meta/recipes-core/runit/runit/cross.patch
@@ -0,0 +1,50 @@
+chskshsgr must be built for the host.
+
+Index: runit-2.1.2/src/Makefile
+===================================================================
+--- runit-2.1.2.orig/src/Makefile
++++ runit-2.1.2/src/Makefile
+@@ -170,11 +170,11 @@ byte_diff.o: byte.h byte_diff.c compile
+ byte_rchr.o: byte.h byte_rchr.c compile
+ 	./compile byte_rchr.c
+ 
+-chkshsgr: chkshsgr.o load
+-	./load chkshsgr 
++chkshsgr: chkshsgr.o loadhost
++	./loadhost chkshsgr
+ 
+-chkshsgr.o: chkshsgr.c compile
+-	./compile chkshsgr.c
++chkshsgr.o: chkshsgr.c compilehost
++	./compilehost chkshsgr.c
+ 
+ choose: choose.sh warn-auto.sh
+ 	rm -f choose
+@@ -185,6 +185,11 @@ choose: choose.sh warn-auto.sh
+ coe.o: coe.c coe.h compile
+ 	./compile coe.c
+ 
++compilehost:
++	cat warn-auto.sh > compilehost
++	@echo 'exec ${BUILD_CC} ${BUILD_CFLAGS} -c $${1+"$$@"}' >> compilehost
++	chmod 555 compilehost
++
+ compile: conf-cc print-cc.sh systype warn-auto.sh
+ 	rm -f compile
+ 	sh print-cc.sh > compile
+@@ -246,6 +251,15 @@ iopause.h: choose compile iopause.h1 iop
+ iopause.o: compile iopause.c iopause.h select.h tai.h taia.h uint64.h
+ 	./compile iopause.c
+ 
++loadhost:
++	rm -f loadhost
++	@echo > loadhost
++	@echo 'systype="`cat systype`"' >> loadhost
++	@echo 'cat warn-auto.sh' >> loadhost
++	@echo 'main="$$1"; shift' >> loadhost
++	@echo 'exec ${BUILD_CC} ${BUILD_LDFLAGS}  -o "$$main" "$$main".o $${1+"$$@"}' >> loadhost
++	chmod 555 loadhost
++
+ load: conf-ld print-ld.sh systype warn-auto.sh
+ 	rm -f load
+ 	sh print-ld.sh > load
diff --git a/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.patch b/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.patch
new file mode 100644
index 0000000000..6753dff4ef
--- /dev/null
+++ b/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.patch
@@ -0,0 +1,19 @@
+From: Dmitry Bogatov <KAction@gnu.org>
+Date: Sun, 13 May 2018 10:38:20 +0300
+X-Dgit-Generated: 2.1.2-14 2c8a08023e964bf54344e7030573ef7ad6881880
+Subject: [PATCH] Disable chkshgrp test, that fails in whalebuilder
+
+Upstream-Status: Pending
+
+---
+
+--- runit-2.1.2.orig/runit-2.1.2/src/Makefile
++++ runit-2.1.2/runit-2.1.2/src/Makefile
+@@ -234,7 +234,6 @@ hassgprm.h: choose compile hassgprm.h1 h
+ 
+ hasshsgr.h: chkshsgr choose compile hasshsgr.h1 hasshsgr.h2 load \
+ tryshsgr.c warn-shsgr
+-	./chkshsgr || ( cat warn-shsgr; exit 1 )
+ 	./choose clr tryshsgr hasshsgr.h1 hasshsgr.h2 > hasshsgr.h
+ 
+ haswaitp.h: choose compile haswaitp.h1 haswaitp.h2 load trywaitp.c
diff --git a/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.patch b/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.patch
new file mode 100644
index 0000000000..6f15e92779
--- /dev/null
+++ b/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.patch
@@ -0,0 +1,20 @@
+From: Dmitry Bogatov <KAction@gnu.org>
+Date: Mon, 28 May 2018 21:46:39 +0300
+X-Dgit-Generated: 2.1.2-15 7791b76917a00ca44e3a5c297675214a40f7f215
+Subject: [PATCH] Fix spin lock on systems with poor clock
+
+Upstream-Status: Pending
+
+---
+
+--- runit-2.1.2.orig/runit-2.1.2/src/svlogd.c
++++ runit-2.1.2/runit-2.1.2/src/svlogd.c
+@@ -234,7 +234,7 @@ void rmoldest(struct logdir *ld) {
+         if (unlink(f->d_name) == -1)
+           warn2("unable to unlink processor leftover", f->d_name);
+       }
+-      else {
++      else if (f->d_name[26] != 'u') {
+         ++n;
+         if (str_diff(f->d_name, oldest) < 0) byte_copy(oldest, 27, f->d_name);
+       }
diff --git a/meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.patch b/meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.patch
new file mode 100644
index 0000000000..f62dfa36d3
--- /dev/null
+++ b/meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.patch
@@ -0,0 +1,15 @@
+From: Dmitry Bogatov <KAction@gnu.org>
+Date: Tue, 10 Apr 2018 20:08:14 +0300
+X-Dgit-Generated: 2.1.2-10 9187ce34534181446afc87277ec0d460e5575f9c
+Subject: [PATCH] Make build system print compilation commands
+
+Upstream-Status: Pending
+
+---
+
+--- runit-2.1.2.orig/runit-2.1.2/src/warn-auto.sh
++++ runit-2.1.2/runit-2.1.2/src/warn-auto.sh
+@@ -1,2 +1,2 @@
+-#!/bin/sh
++#!/bin/sh -x
+ # WARNING: This file was auto-generated. Do not edit!
diff --git a/meta/recipes-core/runit/runit/svlogd.patch b/meta/recipes-core/runit/runit/svlogd.patch
new file mode 100644
index 0000000000..468fdb2ae4
--- /dev/null
+++ b/meta/recipes-core/runit/runit/svlogd.patch
@@ -0,0 +1,19 @@
+Initialize all fields of sockaddr_in.
+http://skarnet.org/cgi-bin/archive.cgi?2:mss:1163:201602:gpiglpbjdemlioaeabbn
+
+set all fields of sockaddr_in in svlogd.
+
+Upstream-Status: Submitted
+
+Author: Leah Neukirchen <leah@vuxu.org>
+
+--- runit-2.1.2/src/svlogd.c 2014-08-10 15:22:34.000000000 -0300
++++ runit-2.1.2/src/svlogd.c 2016-02-04 22:53:52.910965361 -0300
+@@ -430,6 +430,7 @@
+   ld->name =(char*)fn;
+   ld->ppid =0;
+   ld->match ='+';
++  ld->udpaddr.sin_family =AF_INET;
+   ld->udpaddr.sin_port =0;
+   ld->udponly =0;
+   while (! stralloc_copys(&ld->prefix, "")) pause_nomem();
diff --git a/meta/recipes-core/runit/runit_2.1.2.bb b/meta/recipes-core/runit/runit_2.1.2.bb
new file mode 100644
index 0000000000..affb309be1
--- /dev/null
+++ b/meta/recipes-core/runit/runit_2.1.2.bb
@@ -0,0 +1,68 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "A UNIX init scheme with service supervision"
+HOMEPAGE = "http://smarden.org/runit/"
+LICENSE = "BSD-3-Clause"
+SECTION = "base"
+
+LIC_FILES_CHKSUM = "file://package/COPYING;md5=c9e8a560732fc8b860b6a91341cc603b"
+
+inherit update-alternatives
+
+SRC_URI = "http://smarden.org/${BPN}/${BP}.tar.gz \
+           file://0001-default-directory-for-services-on-Debian-is-etc-servi.diff;striplevel=2 \
+           file://0002-support-etc-runit-nosync-file-to-make-sync-on-shutdow.diff;striplevel=2 \
+           file://0003-utmpset.c-mixes-int32_t-and-time_t.diff;striplevel=2 \
+           file://0004-src-Makefile-don-t-use-static-to-link-runit-runit-ini.diff;striplevel=2 \
+           file://0005-patch-etc-runit-2-for-FHS.patch;striplevel=2 \
+           file://0006-make-buildsystem-respect-CFLAGS.patch;striplevel=2 \
+           file://0007-move-communication-files.patch;striplevel=2 \
+           file://0008-emulate-sysv-runlevel-5.patch;striplevel=2 \
+           file://0009-fix-error-in-manpage.patch;striplevel=2 \
+           file://patch-make-build-system-print-compilatio.patch;striplevel=2 \
+           file://patch-disable-chkshgrp-test-that-fails-i.patch;striplevel=2 \
+           file://patch-fix-spin-lock-on-systems-with-poor.patch;striplevel=2 \
+           file://cross.patch \
+           file://clearmem.patch \
+           file://svlogd.patch \
+"
+
+SRC_URI[md5sum] = "6c985fbfe3a34608eb3c53dc719172c4"
+SRC_URI[sha256sum] = "6fd0160cb0cf1207de4e66754b6d39750cff14bb0aa66ab49490992c0c47ba18"
+
+S = "${WORKDIR}/admin/${BPN}-${PV}"
+
+do_compile() {
+	cd ${S}/src
+	sed -e 's,sbin/runit,usr/bin/runit,g' -i ${S}/src/runit.h
+	echo "$CC -D_GNU_SOURCE $CFLAGS" >conf-cc
+	echo "$CC $LDFLAGS -Wl,-z -Wl,noexecstack" >conf-ld
+	# change type short to gid_t for getgroups(2) and setgroups(2)
+	sed -i -e 's:short x\[4\];$:gid_t x[4];:' ${S}/src/chkshsgr.c
+	oe_runmake
+
+}
+
+do_install() {
+	cd ${S}/src
+	install -d ${D}${bindir}
+	for f in chpst runit runit-init runsv runsvchdir runsvdir \
+		sv svlogd utmpset; do
+		install -m 0755 $f ${D}${bindir}
+	done
+	install -d ${D}${sysconfdir}/runit
+	for f in 1 2 3 ctrlaltdel; do
+		install -m 0755 ${S}/etc/debian/$f ${D}${sysconfdir}/runit/$f
+	done
+	sed -e 's,rmnologin,rmnologin.sh,g' -i ${D}${sysconfdir}/runit/1
+	ln -s ${localstatedir}/run/runit.stopit ${D}${sysconfdir}/runit/stopit
+        rm -rf ${D}${sysconfdir}/runit/{1,2,3,stopit,ctrlaltdel}
+}
+
+RDEPENDS_${PN} += "runit-serialgetty socklog socklog-services"
+
+ALTERNATIVE_${PN} = "init"
+ALTERNATIVE_TARGET[init] = "${bindir}/runit-init"
+ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
+ALTERNATIVE_PRIORITY[init] ?= "300"
diff --git a/meta/recipes-core/runit/socklog-services.bb b/meta/recipes-core/runit/socklog-services.bb
new file mode 100644
index 0000000000..795bf8f390
--- /dev/null
+++ b/meta/recipes-core/runit/socklog-services.bb
@@ -0,0 +1,23 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Additional socklog configurations from Void Distro"
+HOMEPAGE = "https://github.com/void-linux/void-socklog"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://nanoklogd.c;beginline=3;endline=6;md5=8c10698c7abd64f01ac4245e2b11ab64"
+SECTION = "base"
+
+PV = "20150726+git${SRCPV}"
+
+SRCREV = "e6b8b91dcd38ebcfbb0d41753d814edf78b06989"
+SRC_URI = "git://github.com/void-linux/socklog-void \
+           file://0001-Use-options-to-cp-to-ensure-proper-mods.patch \
+"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "PREFIX=${exec_prefix}"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
diff --git a/meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensure-proper-mods.patch b/meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensure-proper-mods.patch
new file mode 100644
index 0000000000..edd5bae2ef
--- /dev/null
+++ b/meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensure-proper-mods.patch
@@ -0,0 +1,33 @@
+From b1f46a4d7273ba9b446527dc3f50aa4c318acdd3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Jan 2019 18:15:18 -0800
+Subject: [PATCH] Use options to cp to ensure proper mods
+
+This ensures that permissions are in line when using staged installed in
+OE e.g.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4f96b6e..4889229 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,8 +5,8 @@ install: all
+ 	install -Dm755 svlogtail ${DESTDIR}/usr/bin/svlogtail
+ 	install -Dm755 syslog-stripdate ${DESTDIR}/usr/bin/syslog-stripdate
+ 	mkdir -p ${DESTDIR}/etc ${DESTDIR}/var/log
+-	cp -a sv ${DESTDIR}/etc
+-	cp -a socklog ${DESTDIR}/var/log
++	cp -R --no-dereference --preserve=mode,links sv ${DESTDIR}/etc
++	cp -R --no-dereference --preserve=mode,links socklog ${DESTDIR}/var/log
+ 
+ clean:
+ 	rm -f nanoklogd
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/runit/socklog/cross.patch b/meta/recipes-core/runit/socklog/cross.patch
new file mode 100644
index 0000000000..bc0385f54e
--- /dev/null
+++ b/meta/recipes-core/runit/socklog/cross.patch
@@ -0,0 +1,58 @@
+chskshsgr must be built for the host. 
+
+Original at: https://github.com/void-linux/void-packages/blob/master/srcpkgs/socklog/patches/cross.patch
+
+Upstream-Status: Inappropriate [Cross-compile Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -117,11 +117,11 @@ byte_rchr.o: byte.h byte_rchr.c compile
+ byte_zero.o: byte.h byte_zero.c compile
+ 	./compile byte_zero.c
+ 
+-chkshsgr: chkshsgr.o load
+-	./load chkshsgr 
++chkshsgr: chkshsgr.o loadhost
++	./loadhost chkshsgr
+ 
+-chkshsgr.o: chkshsgr.c compile
+-	./compile chkshsgr.c
++chkshsgr.o: chkshsgr.c compilehost
++	./compilehost chkshsgr.c
+ 
+ choose: choose.sh warn-auto.sh
+ 	rm -f choose
+@@ -137,6 +137,11 @@ compile: conf-cc print-cc.sh systype war
+ 	sh print-cc.sh > compile
+ 	chmod 555 compile
+ 
++compilehost:
++	cat warn-auto.sh > compilehost
++	@echo 'gcc -c $${1+"$$@"}' >> compilehost
++	chmod 555 compilehost
++
+ direntry.h: choose compile direntry.h1 direntry.h2 trydrent.c
+ 	./choose c trydrent direntry.h1 direntry.h2 > direntry.h
+ 
+@@ -198,6 +203,15 @@ load: conf-ld print-ld.sh systype warn-a
+ 	sh print-ld.sh > load
+ 	chmod 555 load
+ 
++loadhost:
++	rm -f loadhost
++	@echo > loadhost
++	@echo 'systype="`cat systype`"' >> loadhost
++	@echo 'cat warn-auto.sh' >> loadhost
++	@echo 'main="$$1"; shift' >> loadhost
++	@echo 'gcc -o "$$main" "$$main".o $${1+"$$@"}' >> loadhost
++	chmod 555 loadhost
++
+ lock_ex.o: compile hasflock.h lock.h lock_ex.c
+ 	./compile lock_ex.c
+ 
+@@ -410,4 +424,3 @@ wait_nohang.o: compile haswaitp.h wait_n
+ 
+ wait_pid.o: compile error.h haswaitp.h wait_pid.c
+ 	./compile wait_pid.c
+-
diff --git a/meta/recipes-core/runit/socklog_2.1.0.bb b/meta/recipes-core/runit/socklog_2.1.0.bb
new file mode 100644
index 0000000000..fc3fbd9826
--- /dev/null
+++ b/meta/recipes-core/runit/socklog_2.1.0.bb
@@ -0,0 +1,32 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Small and secure syslogd replacement for use with runit"
+HOMEPAGE = "http://smarden.org/socklog/"
+LICENSE = "BSD-3-Clause"
+SECTION = "base"
+
+LIC_FILES_CHKSUM = "file://package/COPYING;md5=c7a77593c4b489904800014396f3f742"
+SRC_URI = "http://smarden.org/${BPN}/${BP}.tar.gz \
+           file://cross.patch \
+"
+SRC_URI[md5sum] = "5d0e8e28c9329ad3af982c5241df9ff1"
+SRC_URI[sha256sum] = "aa869a787ee004da4e5509b5a0031bcc17a4ab4ac650c2ce8d4e488123acb455"
+
+S = "${WORKDIR}/admin/${BPN}-${PV}"
+
+do_compile() {
+	cd ${S}/src
+	echo "$CC -D_GNU_SOURCE $CFLAGS" >conf-cc
+	echo "$CC $LDFLAGS -Wl,-z -Wl,noexecstack" >conf-ld
+	echo "int main() { return 0; }" >${S}/src/chkshsgr.c
+	oe_runmake
+}
+
+do_install() {
+	cd ${S}/src
+	install -d ${D}${bindir}
+	for f in socklog socklog-conf socklog-check uncat tryto; do
+		install -m 0755 $f ${D}${bindir}
+	done
+}
-- 
2.25.0


