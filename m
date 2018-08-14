Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71ACF79007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 13:09:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h15-v6so17166091wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5uCxKp5woveefkc0otYpCmu3dI79oTSlpxpwa26GxfQ=;
	b=B6l+cX1WXJFd0FUUv4Onl3EBRGa3jRGC9UyxNtiCtPRvisJECsl0gfkp5m8PBN3cKy
	M854jevUVHEo0xM3FqfcRPiODToCX7YSe3va2Lp6IAbscd94m1+ywzBUONO7Q/Uk5Naq
	1IhAtukEPkVHnnNBUEmtmhkVY+yilLflpYA1uqjRoDfM9ilKYFI6f3vYj0d3WahPIRwb
	7oDEn0U0SIBj5iA0rcL9GrqTmRvmwNKdVKHw0V8tQ0JGYHTjRX0/vSFg8hlS8YjIQQYe
	rRmi7MNgASURiR6hSxwxLtz9Ug23x+Q6rvwCCJK86ImZuPln0WHu++PZueYLA5T9Ri+t
	SZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5uCxKp5woveefkc0otYpCmu3dI79oTSlpxpwa26GxfQ=;
	b=gtLKwZN286ujq7IgoPeojmZB42BS4LmlAnxsIzqBBWbajt6BIbToBQgUOCJgt8b6h2
	teFlvlq11FxjT9yR6ZMb5BwDAgpj59AlmjsVMZwK1IqVcPRWtAVxiJRqKWSi3Zvwlmy/
	600MCm093aWzSHTcXdN4qbang8aOzTKWLrP12AXGdByLMVWN50UbalLyxlhtsPpX0nxy
	2MRuSkHH4s5gG5gzbP+ahTVSvdw5ispJsRKugr0+9qMD5/KB4b+KtQ10+qEIBNlZYCZt
	CFLSb+fB4DNyOLFbPNp3wBJnWXuTkW41vaFTH4igDWmj8lCePRL+6SZ4SWPSVxk6elIh
	jt5Q==
X-Gm-Message-State: AOUpUlGEwce4/nFLL0kKPRh3wI5/lnYV4ab67PLsgkbtcTlvxcjdpMSf
	PKQ8CIpDtbWVaFhryHeFsDPgKuWuxqo=
X-Google-Smtp-Source: AA+uWPyD4WZDt+s6CURPVo56jbW72b0c8GXkNG41Cq7qDof9YE2O+YkendyR51XgsB3GIk0ljwLCqQ==
X-Received: by 2002:adf:806d:: with SMTP id
	100-v6mr13501880wrk.23.1534252172652; 
	Tue, 14 Aug 2018 06:09:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g7-v6sm14714198wrw.30.2018.08.14.06.09.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 06:09:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 14:09:28 +0100
Message-Id: <20180814130928.2230-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pcmciautils: remove from oe-core
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
X-List-Received-Date: Tue, 14 Aug 2018 13:09:32 -0000

PCMCIA is pretty rare these days, so now that the recipe is in meta-oe we can
remove it from oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |   1 -
 .../pcmciautils-018/lex_sys_types.patch            |  21 -----
 .../pcmciautils/pcmciautils-018/makefile_fix.patch | 101 ---------------------
 .../pcmciautils-018/makefile_race.patch            |  29 ------
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |  34 -------
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |  11 ---
 6 files changed, 197 deletions(-)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils.inc
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 08f8c46ff47..0d1c72a85fe 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -519,7 +519,6 @@ RECIPE_MAINTAINER_pn-patchelf = "Richard Purdie <richard.purdie@linuxfoundation.
 RECIPE_MAINTAINER_pn-pbzip2 = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-pcmciautils = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-perl-native = "Maxin B. John <maxin.john@intel.com>"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch
deleted file mode 100644
index d4c2bed15ca..00000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Include sys/types.h for u_long definition
-
-Fix errors like
-In file included from src/lex_config.l:34:0:
-src/yacc_config.y:45:5: error: unknown type name 'u_long'
-     u_long num;
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: pcmciautils-018/src/lex_config.l
-===================================================================
---- pcmciautils-018.orig/src/lex_config.l
-+++ pcmciautils-018/src/lex_config.l
-@@ -22,6 +22,7 @@
- #include <unistd.h>
- #include <string.h>
- #include <syslog.h>
-+#include <sys/types.h>
- 
- #ifdef HAS_WORDEXP
- #include <wordexp.h>
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
deleted file mode 100644
index 7b0ce21194c..00000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Hardcoded paths are bad...
-This lets us use the install from OE's native sysroot
-rebase the patch to 018, removing hardcoded path for true
-as well. Removing of -D in install invocation is a little
-questionable, is it some GNU extention?
-
--Khem Raj <raj.khem@gmail.com>
-
-Index: pcmciautils-018/Makefile
-===================================================================
---- pcmciautils-018.orig/Makefile
-+++ pcmciautils-018/Makefile
-@@ -76,7 +76,7 @@ sbindir =	${exec_prefix}/sbin
- mandir =	${prefix}/usr/share/man
- udevdir =	${prefix}/lib/udev
- 
--INSTALL = /usr/bin/install -c
-+INSTALL = install -c
- INSTALL_PROGRAM = ${INSTALL}
- INSTALL_DATA  = ${INSTALL} -m 644
- INSTALL_SCRIPT = ${INSTALL_PROGRAM}
-@@ -180,7 +180,7 @@ endif
- # if DEBUG is enabled, then we do not strip or optimize
- ifeq ($(strip $(DEBUG)),true)
- 	CFLAGS  += -O1 -g -DDEBUG -D_GNU_SOURCE
--	STRIPCMD = /bin/true -Since_we_are_debugging
-+	STRIPCMD = true -Since_we_are_debugging
- else
- 	CFLAGS  += $(OPTIMIZATION) -fomit-frame-pointer -D_GNU_SOURCE
- 	STRIPCMD = $(STRIP) -s --remove-section=.note --remove-section=.comment
-@@ -273,30 +273,32 @@ clean:
- 
- install-hotplug:
- 	$(INSTALL) -d $(DESTDIR)$(hotplugdir)
--	$(INSTALL_PROGRAM) -D hotplug/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.agent
--	$(INSTALL_PROGRAM) -D hotplug/pcmcia.rc $(DESTDIR)$(hotplugdir)/pcmcia.rc
-+	$(INSTALL_PROGRAM) hotplug/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.agent
-+	$(INSTALL_PROGRAM) hotplug/pcmcia.rc $(DESTDIR)$(hotplugdir)/pcmcia.rc
- 
- uninstall-hotplug:
- 	- rm -f $(DESTDIR)$(hotplugdir)/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.rc
- 
- install-socket-hotplug:
--	$(INSTALL_PROGRAM) -D hotplug/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent
--	$(INSTALL_PROGRAM) -D hotplug/pcmcia_socket.rc $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
-+	$(INSTALL_PROGRAM) hotplug/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent
-+	$(INSTALL_PROGRAM) hotplug/pcmcia_socket.rc $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
- 
- uninstall-socket-hotplug:
- 	- rm -f $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
- 
- install-socket-tools:
--	$(INSTALL_PROGRAM) -D $(PCMCIA_SOCKET_STARTUP) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
-+	$(INSTALL) -d $(DESTDIR)$(udevhelperdir)
-+	$(INSTALL_PROGRAM) $(PCMCIA_SOCKET_STARTUP) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
- 
- uninstall-socket-tools:
- 	- rm -f $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
- 
- install-tools:
- 	$(INSTALL) -d $(DESTDIR)$(sbindir)
--	$(INSTALL_PROGRAM) -D $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(PCCARDCTL)
-+	$(INSTALL) -d $(DESTDIR)$(udevhelperdir)
-+	$(INSTALL_PROGRAM) $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(PCCARDCTL)
- 	$(SYMLINK) $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(LSPCMCIA)
--	$(INSTALL_PROGRAM) -D $(PCMCIA_CHECK_BROKEN_CIS) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_CHECK_BROKEN_CIS)
-+	$(INSTALL_PROGRAM) $(PCMCIA_CHECK_BROKEN_CIS) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_CHECK_BROKEN_CIS)
- 
- uninstall-tools:
- 	- rm -f $(DESTDIR)$(sbindir)/$(PCCARDCTL)
-@@ -305,22 +307,24 @@ uninstall-tools:
- 
- install-config:
- 	$(INSTALL) -d $(DESTDIR)$(pcmciaconfdir)
--	$(INSTALL_DATA)  -D config/config.opts $(DESTDIR)$(pcmciaconfdir)/config.opts
-+	$(INSTALL_DATA)  config/config.opts $(DESTDIR)$(pcmciaconfdir)/config.opts
- 	if [ -f config/config.opts.$(ARCH) ]; then \
--		$(INSTALL_DATA) -D config/config.opts.$(ARCH) $(DESTDIR)$(pcmciaconfdir)/config.opts; \
-+		$(INSTALL_DATA) config/config.opts.$(ARCH) $(DESTDIR)$(pcmciaconfdir)/config.opts; \
- 	fi
- 
- uninstall-config:
- #	- rm -f $(DESTDIR)$(pcmciaconfdir)/config.opts
- 
- install-udev:
--	$(INSTALL_DATA) -D $(UDEV_RULES_FILE) $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
-+	$(INSTALL) -d $(DESTDIR)$(udevrulesdir)
-+	$(INSTALL_DATA) $(UDEV_RULES_FILE) $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
- 
- uninstall-udev:
- 	- rm -f $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
- 
- install-man:
--	$(INSTALL_DATA) -D man/man8/pccardctl.8 $(DESTDIR)$(mandir)/man8/pccardctl.8
-+	$(INSTALL) -d $(DESTDIR)$(mandir)/man8
-+	$(INSTALL_DATA) man/man8/pccardctl.8 $(DESTDIR)$(mandir)/man8/pccardctl.8
- 	$(SYMLINK) pccardctl.8 $(DESTDIR)$(mandir)/man8/lspcmcia.8
- 
- uninstall-man:
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch
deleted file mode 100644
index 4c5eba7951e..00000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-"make src/lex_config.o"
-
-results in:
-
-src/lex_config.l:35:25: fatal error: yacc_config.h: No such file or directory
-
-so add missing dependency through a missing rule. Also remove a rule which
-doesn't appear to do anything.
-
-RP
-2016/1/31
-
-Upstream-Status: Pending
-
-Index: pcmciautils-018/Makefile
-===================================================================
---- pcmciautils-018.orig/Makefile
-+++ pcmciautils-018/Makefile
-@@ -246,8 +246,8 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
- 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
- 	$(QUIET) $(STRIPCMD) $@
- 
--yacc_config.o lex_config.o: %.o: %.c
--	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
-+src/lex_config.o : src/lex_config.c src/yacc_config.h ccdv
-+	$(QUIET) $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
- 
- debugtools: ccdv $(CBDUMP) $(CISDUMP)
- 
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
deleted file mode 100644
index 26c6d75d4b7..00000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Linux kernel userland utilities for the PCMCIA subsystem"
-HOMEPAGE = "https://www.kernel.org/pub/linux/utils/kernel/pcmcia/"
-SECTION = "kernel/userland"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "udev sysfsutils flex-native bison-native"
-RDEPENDS_${PN} = "udev module-init-tools"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz"
-
-S = "${WORKDIR}/pcmciautils-${PV}"
-
-inherit pkgconfig
-
-export HOSTCC = "${BUILD_CC}"
-export etcdir = "${sysconfdir}"
-export sbindir = "${base_sbindir}"
-export pcmciaconfdir = "${sysconfdir}/pcmcia"
-export udevdir = "`pkg-config --variable=udevdir udev`"
-export udevrulesdir = "`pkg-config --variable=udevdir udev`/rules.d"
-export UDEV = "1"
-LD = "${CC}"
-CFLAGS =+ "-I${S}/src"
-CFLAGS =+ "-DPCMCIAUTILS_VERSION=\\"${PV}\\""
-
-EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-}
-
-CONFFILES_${PN} += "${sysconfdir}/pcmcia/config.opts"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
deleted file mode 100644
index bf0f58a7cc6..00000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require pcmciautils.inc
-
-SRC_URI += "file://makefile_fix.patch \
-            file://makefile_race.patch \
-            file://lex_sys_types.patch \
-"
-
-SRC_URI[md5sum] = "885431c3cefb76ffdad8cb985134e996"
-SRC_URI[sha256sum] = "57c27be8f04ef4d535bcfa988567316cc57659fe69068327486dab53791e6558"
-
-PR = "r1"
-- 
2.11.0


