Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1QWUWK-0007fv-VG
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 16:23:09 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id E02B3A62043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 15:10:45 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 15:10:44 +0100
Message-Id: <1308060644.12359.41.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Subject: [PATCH] Recipe for util-linux-2.19.1
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
X-List-Received-Date: Tue, 14 Jun 2011 14:23:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Add a recipe for util-linux-2.19.1. 

Since 2.19 util-linux has dropped the '-ng' part of the package
filename / extracted directory name.  So util-linux.inc now uses
base_version_less_or_equal to insert this string if required.  This
caused a deprecation warning for bb.vercmp, so changed that to
bb.utils.vercmp_string.

Most of the patches for 2.17.2 apply unchanged, so renamed the directory
meta/recipes-core/util-linux/util-linux-2.17.2 to
meta/recipes-core/util-linux/util-linux so that they can be shared
between package revisions.

Signed-off-by: Chris Elston <celston@katalix.com>
---
 meta/lib/oe/utils.py                               |    2 +-
 .../util-linux/util-linux-2.17.2/MCONFIG           |  223
--------------------
 .../util-linux/util-linux-2.17.2/defines.h         |   10 -
 .../util-linux/util-linux-2.17.2/make_include      |   17 --
 .../util-linux-2.17.2/remove-lscpu.patch           |  103 ---------
 .../util-linux/util-linux-2.17.2/swapargs.h        |    3 -
 .../util-linux-2.17.2/uclibc-compile.patch         |   15 --
 .../util-linux-ng-2.16-mount_lock_path.patch       |   27 ---
 .../util-linux-ng-replace-siginterrupt.patch       |   25 ---
 meta/recipes-core/util-linux/util-linux.inc        |    5 +-
 meta/recipes-core/util-linux/util-linux/MCONFIG    |  223
++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux/defines.h  |   10 +
 .../util-linux/util-linux/make_include             |   17 ++
 .../util-linux/util-linux/remove-lscpu.patch       |  103 +++++++++
 meta/recipes-core/util-linux/util-linux/swapargs.h |    3 +
 .../util-linux/util-linux/uclibc-compile.patch     |   15 ++
 .../util-linux-ng-2.16-mount_lock_path.patch       |   27 +++
 .../util-linux-ng-replace-siginterrupt.patch       |   25 +++
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |   51 +++++
 19 files changed, 478 insertions(+), 426 deletions(-)
 delete mode 100644
meta/recipes-core/util-linux/util-linux-2.17.2/MCONFIG
 delete mode 100644
meta/recipes-core/util-linux/util-linux-2.17.2/defines.h
 delete mode 100644
meta/recipes-core/util-linux/util-linux-2.17.2/make_include
 delete mode 100644
meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
 delete mode 100644
meta/recipes-core/util-linux/util-linux-2.17.2/swapargs.h
 delete mode 100644
meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch
 delete mode 100644
meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch
 delete mode 100644
meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/MCONFIG
 create mode 100644 meta/recipes-core/util-linux/util-linux/defines.h
 create mode 100644 meta/recipes-core/util-linux/util-linux/make_include
 create mode 100644
meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/swapargs.h
 create mode 100644
meta/recipes-core/util-linux/util-linux/uclibc-compile.patch
 create mode 100644
meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
 create mode 100644
meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux_2.19.1.bb

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index f6d4142..4ebde67 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -28,7 +28,7 @@ def less_or_equal(variable, checkvalue, truevalue,
falsevalue, d):
         return falsevalue
 
 def version_less_or_equal(variable, checkvalue, truevalue, falsevalue,
d):
-    result = bb.vercmp(bb.data.getVar(variable,d,True), checkvalue)
+    result = bb.utils.vercmp_string(bb.data.getVar(variable,d,True),
checkvalue)
     if result <= 0:
         return truevalue
     else:
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/MCONFIG
b/meta/recipes-core/util-linux/util-linux-2.17.2/MCONFIG
deleted file mode 100644
index 3fea2c0..0000000
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/MCONFIG
+++ /dev/null
@@ -1,223 +0,0 @@
-# MCONFIG -- Configuration stuff for util-linux
-# Created: Sat Feb  4 15:50:30 1995
-# Copyright 1995 Rickard E. Faith (faith@cs.unc.edu)
-
-# For a user-mode install, make (at least) three changes:
-#  - remove the `-o root' part in INSTALLSUID
-#  - set USE_TTY_GROUP=no
-#  - define DESTDIR
-
-# Select for ARCH one of intel, alpha, sparc, arm, m68k, mips
-# Select for CPU i386 if the binaries must be able to run on an intel
386
-# (by default i486 code is generated, see below)
-CPU=$(shell uname -m)
-ARCH=$(shell echo $(CPU) | sed 's/i.86/intel/;s/arm.*/arm/')
-
-# If HAVE_PAM is set to "yes", then login, chfn, chsh, and newgrp
-# will use PAM for authentication. Additionally, passwd will not be
-# installed as it is not PAM aware.
-HAVE_PAM=no
-
-# If HAVE_SHADOW is set to "yes", then login, chfn, chsh, newgrp,
passwd,
-# and vipw will not be built or installed from the login-utils
-# subdirectory.  
-HAVE_SHADOW=yes
-
-# If HAVE_PASSWD is set to "yes", then passwd will not be built or
-# installed from the login-utils subdirectory (but login, chfn, chsh,
-# newgrp, and vipw *will* be installed).
-HAVE_PASSWD=no
-
-# If you use chfn and chsh from this package, REQUIRE_PASSWORD will
require
-# non-root users to enter the account password before
updating /etc/passwd.
-REQUIRE_PASSWORD=yes
-#REQUIRE_PASSWORD=no
-
-# If you use chsh from this package, ONLY_LISTED_SHELLS will require
that
-# the selected shell be listed in /etc/shells -- otherwise only a
warning is
-# printed.  This prevents someone from setting their shell
to /bin/false.
-ONLY_LISTED_SHELLS=yes
-#ONLY_LISTED_SHELLS=no
-
-
-# If HAVE_SYSVINIT is set to "yes", then simpleinit and shutdown will
not
-# be built or installed from the login-utils subdirectory.  (The
shutdown
-# and halt that come with the SysVinit package should be used with the
init
-# found in that package.)
-HAVE_SYSVINIT=no
-
-# If HAVE_SYSVINIT_UTILS is set to "yes", then last, mesg, and wall
will
-# not be built or installed from the login-utils subdirectory.  (The
-# shutdown and init from the SysVinit package do not depend on the
last,
-# mesg, and wall from that package.)
-HAVE_SYSVINIT_UTILS=no
-
-# If HAVE_WRITE is set to "yes", then write will not be built or
-# installed from the misc-utils subdirectory.
-# (There is a network aware write in netwrite from NetKit 0.16 or
later.)
-HAVE_WRITE=no
-
-# If HAVE_GETTY is set to "yes", then agetty will not be built or
-# installed from the login-utils subdirectory.  Note that agetty can
-# co-exist with other gettys, so this option should never be used.
-HAVE_GETTY=no
-
-# If USE_TTY_GROUP is set to "yes", then wall and write will be
installed
-# setgid to the "tty" group, and mesg will only set the group write
bit.
-# Note that this is only useful if login/xterm/etc. change the group of
the
-# user's tty to "tty" [The login in util-linux does this correctly, and
-# xterm will do it correctly if X is compiled with USE_TTY_GROUP set
-# properly.]
-USE_TTY_GROUP=no
-
-# If HAVE_KILL is set to "yes", then kill will not be built or
-# installed from the misc-utils subdirectory.
-# (There is also a kill in the procps package.)
-HAVE_KILL=no
-
-# If ALLOW_VCS_USE is set to "yes", then login will chown /dev/vcsN
-# to the current user, allowing her to make a screendump and do other
-# nifty things on the console, but also allowing him to keep an open
-# file descriptor after logging out to trick the next user.
-ALLOW_VCS_USE=yes
-
-# If HAVE_RESET is set to "yes", then reset won't be installed.  The
version
-# of reset that comes with the ncurses package is less aggressive.
-HAVE_RESET=yes
-
-# If HAVE_SLN is set to "yes", then sln won't be installed
-# (but the man page sln.8 will be installed anyway).
-# sln also comes with libc and glibc.
-HAVE_SLN=no
-
-# If HAVE_FDUTILS is set to "yes", then setfdprm won't be installed.
-HAVE_FDUTILS=no
-
-# If SILENT_PG is set to "yes", then pg will not ring the bell
-# when an invalid key is pressed
-SILENT_PG=no
-
-# If configure decides that Native Language Support (NLS) is available,
-# it sets MAY_ENABLE_NLS in defines.h. If you don't want NLS, set
-# DISABLE_NLS to "yes".
-DISABLE_NLS=no
-
-# Different optimizations for different cpus.
-# gcc 3.0 likes options -mcpu=i486 instead of -m486
-ifeq "$(ARCH)" "intel"
-  ifeq "$(HAVE_OLD_GCC)" "yes"
-    CPUHEAD=-m
-  else
-    CPUHEAD=-mcpu=i
-  endif
-  ifeq "$(CPU)" "i386"
-    CPUTAIL=386
-  else
-    CPUTAIL=486
-  endif
-  CPUOPT= $(CPUHEAD)$(CPUTAIL)
-  OPT=          -pipe -O2 $(CPUOPT) -fomit-frame-pointer
-else 
-  ifeq "$(ARCH)" "arm"
-    OPT=	-pipe -O2 -fsigned-char -fomit-frame-pointer
-  else
-    OPT=	-O2 -fomit-frame-pointer
-  endif
-endif
-
-WARNFLAGS = -Wall -Wmissing-prototypes -Wstrict-prototypes
-
-LIB=../lib
-
-ERR_O=$(LIB)/err.o
-
-# Set HAVE_SLANG to yes if you have slang (and prefer to use that for
cfdisk)
-# (If neither HAVE_NCURSES nor HAVE_SLANG is defined, cfdisk is not
made.)
-# HAVE_SLANG=yes
-# There is a subdirectory /usr/include/slang containing slcurses.h
-# SLANGFLAGS=-I/usr/include/slang
-# No such subdirectory - slcurses.h lives in /usr/include
-#   (no extra definition required).
-LIBSLANG=-lslang
-
-#
-# Paths used for compilation (not all are actually used, see CFLAGS
below)
-#
-DEV_DIR=	/dev
-ETC_DIR=	/etc
-SBIN_DIR=	/sbin
-USRSBIN_DIR=	/usr/sbin
-USRLIB_DIR=	/usr/lib
-USRBIN_DIR=	/usr/bin
-USRGAMES_DIR=	/usr/games
-USRSHAREMISC_DIR=/usr/share/misc
-LOCALE_DIR=	/usr/share/locale
-BIN_DIR=        /bin
-VAR_PATH=	/var
-LOG_DIR=	/var/log
-MAN_DIR=	/usr/share/man
-INFO_DIR=	/usr/share/info
-
-#
-# Paths used for install
-#
-DEVDIR=		$(DESTDIR)$(DEV_DIR)
-ETCDIR=		$(DESTDIR)$(ETC_DIR)
-SBINDIR=	$(DESTDIR)$(SBIN_DIR)
-USRSBINDIR=	$(DESTDIR)$(USRSBIN_DIR)
-USRLIBDIR=      $(DESTDIR)$(USRLIB_DIR)
-USRBINDIR=      $(DESTDIR)$(USRBIN_DIR)
-USRGAMESDIR=    $(DESTDIR)$(USRGAMES_DIR)
-USRSHAREMISCDIR=$(DESTDIR)$(USRSHAREMISC_DIR)
-LOCALEDIR=      $(DESTDIR)$(LOCALE_DIR)
-BINDIR=         $(DESTDIR)$(BIN_DIR)
-VARPATH=	$(DESTDIR)$(VAR_PATH)
-LOGDIR=		$(DESTDIR)$(LOG_DIR)
-MANDIR=		$(DESTDIR)$(MAN_DIR)
-MAN1DIR=	$(MANDIR)/man1
-MAN3DIR=	$(MANDIR)/man3
-MAN5DIR=	$(MANDIR)/man5
-MAN6DIR=	$(MANDIR)/man6
-MAN8DIR=	$(MANDIR)/man8
-INFODIR=	$(DESTDIR)$(INFO_DIR)
-
-# Directory for shutdown, halt, reboot, etc.
-SHUTDOWNDIR=	$(SBINDIR)
-
-# Modes
-DIRMODE=	755
-BINMODE=	755
-MANMODE=	644
-DATMODE=	644
-INFOMODE=	644
-SUIDMODE=      4755
-
-CHMOD=		chmod
-INSTALL=	install
-INSTALLDIR=	$(INSTALL) -d -m $(DIRMODE)
-INSTALLBIN=	$(INSTALL) -m $(BINMODE)
-INSTALLMAN=	$(INSTALL) -m $(MANMODE)
-INSTALLDAT=	$(INSTALL) -m $(DATMODE)
-INSTALLSUID=    $(INSTALL) -m $(SUIDMODE)
-
-ifeq "$(DISABLE_NLS)" "yes"
-NLSFLAGS = -DDISABLE_NLS
-endif
-
-CFLAGS := $(OPT) -I$(LIB) $(WARNFLAGS) \
-			$(CURSESFLAGS) $(SLANGFLAGS) $(NLSFLAGS) \
-			-D_FILE_OFFSET_BITS=64 \
-			-DSBINDIR=\"$(SBIN_DIR)\" \
-			-DUSRSBINDIR=\"$(USRSBIN_DIR)\" \
-			-DLOGDIR=\"$(LOG_DIR)\" \
-			-DVARPATH=\"$(VAR_PATH)\" \
-			-DLOCALEDIR=\"$(LOCALE_DIR)\" \
-			$(CFLAGS)
-
-
-%.o: %.c
-	$(CC) -c $(CFLAGS) $< -o $@
-
-%: %.cc
-	$(CXX) $(CFLAGS) $< -o $@
-
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/defines.h
b/meta/recipes-core/util-linux/util-linux-2.17.2/defines.h
deleted file mode 100644
index 6ce6b86..0000000
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/defines.h
+++ /dev/null
@@ -1,10 +0,0 @@
-#define UTIL_LINUX_VERSION "2.12"
-#define util_linux_version "util-linux-2.12"
-
-#define HAVE_blkpg_h
-#define HAVE_kd_h
-#define HAVE_locale_h
-#define HAVE_langinfo_h
-#define HAVE_sys_user_h
-#define HAVE_asm_types_h
-//#define NEED_tqueue_h
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/make_include
b/meta/recipes-core/util-linux/util-linux-2.17.2/make_include
deleted file mode 100644
index e6abcd9..0000000
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/make_include
+++ /dev/null
@@ -1,17 +0,0 @@
-VERSION=2.12
-CC=gcc
-CFLAGS=
-LDFLAGS=
-HAVE_OLD_GCC=yes
-HAVE_RAW_H=yes
-HAVE_NCURSES=yes
-CURSESFLAGS=-DNCH=1
-LIBCURSES=-lncurses
-HAVE_TERMCAP=no
-NEED_LIBCRYPT=yes
-FOREIGN = --foreign-user
-HAVE_XGETTEXT=yes
-HAVE_OPENPTY=yes
-HAVE_PIVOT_ROOT=yes
-HAVE_GOOD_RPC=yes
-HAVE_ZLIB=yes
diff --git
a/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
b/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
deleted file mode 100644
index c726cf1..0000000
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-Take out lscpu stuff from the code
-
-2011/03/17
-Saul Wold <saul.wold@intel.com>
-Nitin A Kamble <nitin.a.kamble@intel.com>
-
-Index: util-linux-ng-2.17.2/sys-utils/Makefile.am
-===================================================================
---- util-linux-ng-2.17.2.orig/sys-utils/Makefile.am
-+++ util-linux-ng-2.17.2/sys-utils/Makefile.am
-@@ -11,11 +11,11 @@ dist_man_MANS = flock.1 ipcrm.1 ipcs.1 i
- if LINUX
- bin_PROGRAMS += dmesg
- sbin_PROGRAMS += ctrlaltdel
--usrbin_exec_PROGRAMS += cytune setarch lscpu
-+usrbin_exec_PROGRAMS += cytune setarch
- usrsbin_exec_PROGRAMS += ldattach tunelp rtcwake
- 
- dist_man_MANS += dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
--		ldattach.8 lscpu.1 tunelp.8 rtcwake.8
-+		ldattach.8 tunelp.8 rtcwake.8
- endif
- 
- cytune_SOURCES = cytune.c cyclades.h
-Index: util-linux-ng-2.17.2/sys-utils/Makefile.in
-===================================================================
---- util-linux-ng-2.17.2.orig/sys-utils/Makefile.in
-+++ util-linux-ng-2.17.2/sys-utils/Makefile.in
-@@ -47,10 +47,10 @@ usrsbin_exec_PROGRAMS = readprofile$(EXE
- 	$(am__EXEEXT_10)
- @LINUX_TRUE@am__append_1 = dmesg
- @LINUX_TRUE@am__append_2 = ctrlaltdel
--@LINUX_TRUE@am__append_3 = cytune setarch lscpu
-+@LINUX_TRUE@am__append_3 = cytune setarch
- @LINUX_TRUE@am__append_4 = ldattach tunelp rtcwake
- @LINUX_TRUE@am__append_5 = dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
--@LINUX_TRUE@		ldattach.8 lscpu.1 tunelp.8 rtcwake.8
-+@LINUX_TRUE@		ldattach.8 tunelp.8 rtcwake.8
- 
- @BUILD_FALLOCATE_TRUE@am__append_6 = fallocate
- @BUILD_FALLOCATE_TRUE@am__append_7 = fallocate.1
-@@ -100,7 +100,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" 
- @BUILD_PIVOT_ROOT_TRUE@am__EXEEXT_4 = pivot_root$(EXEEXT)
- @BUILD_SWITCH_ROOT_TRUE@am__EXEEXT_5 = switch_root$(EXEEXT)
- @LINUX_TRUE@am__EXEEXT_6 = cytune$(EXEEXT) setarch$(EXEEXT) \
--@LINUX_TRUE@	lscpu$(EXEEXT)
-+@LINUX_TRUE@
- @BUILD_FALLOCATE_TRUE@am__EXEEXT_7 = fallocate$(EXEEXT)
- @BUILD_UNSHARE_TRUE@am__EXEEXT_8 = unshare$(EXEEXT)
- @LINUX_TRUE@am__EXEEXT_9 = ldattach$(EXEEXT) tunelp$(EXEEXT) \
-@@ -141,9 +141,6 @@ ipcs_LDADD = $(LDADD)
- ldattach_SOURCES = ldattach.c
- ldattach_OBJECTS = ldattach.$(OBJEXT)
- ldattach_LDADD = $(LDADD)
--lscpu_SOURCES = lscpu.c
--lscpu_OBJECTS = lscpu.$(OBJEXT)
--lscpu_LDADD = $(LDADD)
- pivot_root_SOURCES = pivot_root.c
- pivot_root_OBJECTS = pivot_root.$(OBJEXT)
- pivot_root_LDADD = $(LDADD)
-@@ -201,11 +198,11 @@ AM_V_GEN = $(am__v_GEN_$(V))
- am__v_GEN_ = $(am__v_GEN_$(AM_DEFAULT_VERBOSITY))
- am__v_GEN_0 = @echo "  GEN   " $@;
- SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) dmesg.c fallocate.c \
--	flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c lscpu.c pivot_root.c \
-+	flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c pivot_root.c \
- 	rdev.c readprofile.c renice.c rtcwake.c setarch.c setsid.c \
- 	switch_root.c $(tunelp_SOURCES) unshare.c
- DIST_SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) dmesg.c \
--	fallocate.c flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c lscpu.c \
-+	fallocate.c flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c \
- 	pivot_root.c rdev.c readprofile.c renice.c rtcwake.c setarch.c \
- 	setsid.c switch_root.c $(tunelp_SOURCES) unshare.c
- INFO_DEPS = $(srcdir)/ipc.info
-@@ -248,7 +245,7 @@ NROFF = nroff
- MANS = $(dist_man_MANS) $(man_MANS)
- am__dist_noinst_DATA_DIST = flock.1 ipcrm.1 ipcs.1 ipcmk.1 renice.1 \
- 	setsid.1 readprofile.1 dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
--	ldattach.8 lscpu.1 tunelp.8 rtcwake.8 fallocate.1 pivot_root.8 \
-+	ldattach.8 tunelp.8 rtcwake.8 fallocate.1 pivot_root.8 \
- 	switch_root.8 unshare.1 arch.1 rdev.8
- DATA = $(dist_noinst_DATA)
- ETAGS = etags
-@@ -678,9 +675,6 @@ ipcs$(EXEEXT): $(ipcs_OBJECTS) $(ipcs_DE
- ldattach$(EXEEXT): $(ldattach_OBJECTS) $(ldattach_DEPENDENCIES) 
- 	@rm -f ldattach$(EXEEXT)
- 	$(AM_V_CCLD)$(LINK) $(ldattach_OBJECTS) $(ldattach_LDADD) $(LIBS)
--lscpu$(EXEEXT): $(lscpu_OBJECTS) $(lscpu_DEPENDENCIES) 
--	@rm -f lscpu$(EXEEXT)
--	$(AM_V_CCLD)$(LINK) $(lscpu_OBJECTS) $(lscpu_LDADD) $(LIBS)
- pivot_root$(EXEEXT): $(pivot_root_OBJECTS) $(pivot_root_DEPENDENCIES) 
- 	@rm -f pivot_root$(EXEEXT)
- 	$(AM_V_CCLD)$(LINK) $(pivot_root_OBJECTS) $(pivot_root_LDADD) $(LIBS)
-@@ -728,7 +722,6 @@ distclean-compile:
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcrm.Po@am__quote@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcs.Po@am__quote@
- @AMDEP_TRUE@@am__include@
@am__quote@./$(DEPDIR)/ldattach.Po@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/lscpu.Po@am__quote@
- @AMDEP_TRUE@@am__include@
@am__quote@./$(DEPDIR)/pivot_root.Po@am__quote@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/rdev.Po@am__quote@
- @AMDEP_TRUE@@am__include@
@am__quote@./$(DEPDIR)/readprofile.Po@am__quote@
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/swapargs.h
b/meta/recipes-core/util-linux/util-linux-2.17.2/swapargs.h
deleted file mode 100644
index e960eef..0000000
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/swapargs.h
+++ /dev/null
@@ -1,3 +0,0 @@
-#define SWAPON_HAS_TWO_ARGS
-#include <asm/page.h>
-#include <sys/swap.h>
diff --git
a/meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch
b/meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch
deleted file mode 100644
index 75774d8..0000000
---
a/meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: util-linux-ng-2.16/misc-utils/cal.c
-===================================================================
---- util-linux-ng-2.16.orig/misc-utils/cal.c	2009-07-03
16:20:01.000000000 -0700
-+++ util-linux-ng-2.16/misc-utils/cal.c	2009-07-18 23:21:37.000000000
-0700
-@@ -407,7 +407,7 @@
-   strcpy(day_headings,"");
-   strcpy(j_day_headings,"");
- 
--#ifdef HAVE_LANGINFO_H
-+#ifdef HAVE_LANGINFO_H && !defined(__UCLIBC__)
- # define weekday(wd)	nl_langinfo(ABDAY_1+wd)
- #else
- # define weekday(wd)	_time_info->abbrev_wkday[wd]
diff --git
a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch
deleted file mode 100644
index 5773d7e..0000000
---
a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-The FHS indicates that /etc must be capable of being mounted R/O.
-
-The FHS also indicates that lock files belong in /var/lock, and /var
must
-be R/W as soon as possible during boot.
-
-This patch moves the mtab lock file from the potentially R/O /etc, to
the
-R/W /var/lock area.  This lock file is used when mounting disks and
making
-other mount adjustments.  The _PATH_MOUNTED_TMP is not adjusted, as
failing
-to write to this file does not cause any functional limitations.
-
-(Note, if /etc is R/O, then /etc/mtab should be a symlink
to /proc/mounts)
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
---- util-linux-ng-2.16/include/pathnames.h.orig
-+++ util-linux-ng-2.16/include/pathnames.h
-@@ -90,7 +90,7 @@
- # endif
- #endif
- 
--#define _PATH_MOUNTED_LOCK	_PATH_MOUNTED "~"
-+#define _PATH_MOUNTED_LOCK	"/var/lock/mtab~"
- #define _PATH_MOUNTED_TMP	_PATH_MOUNTED ".tmp"
- 
- #ifndef _PATH_DEV
diff --git
a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch
deleted file mode 100644
index c5c0aff..0000000
---
a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-Index: util-linux-ng-2.14/login-utils/login.c
-===================================================================
---- util-linux-ng-2.14.orig/login-utils/login.c	2008-05-28
16:01:02.000000000 -0700
-+++ util-linux-ng-2.14/login-utils/login.c	2009-03-04
18:31:42.000000000 -0800
-@@ -358,6 +358,7 @@
-     char *childArgv[10];
-     char *buff;
-     int childArgc = 0;
-+    struct sigaction act;
- #ifdef HAVE_SECURITY_PAM_MISC_H
-     int retcode;
-     pam_handle_t *pamh = NULL;
-@@ -373,7 +374,9 @@
-     pid = getpid();
- 
-     signal(SIGALRM, timedout);
--    siginterrupt(SIGALRM,1);           /* we have to interrupt
syscalls like ioclt() */
-+    (void) sigaction(SIGALRM, NULL, &act);
-+    act.sa_flags &= ~SA_RESTART;
-+    sigaction(SIGALRM, &act, NULL);
-     alarm((unsigned int)timeout);
-     signal(SIGQUIT, SIG_IGN);
-     signal(SIGINT, SIG_IGN);
diff --git a/meta/recipes-core/util-linux/util-linux.inc
b/meta/recipes-core/util-linux/util-linux.inc
index 489ec1a..b37a545 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,8 +17,9 @@ inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native_append = " lzo-native"
 
+NG = ${@base_version_less_or_equal( "MAJOR_VERSION", "2.18", "-ng", "",
d )}
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v
${MAJOR_VERSION}/util-linux-ng-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v
${MAJOR_VERSION}/util-linux${NG}-${PV}.tar.bz2 \
            file://MCONFIG \
            file://swapargs.h \
            file://defines.h \
@@ -31,7 +32,7 @@ PACKAGES =+ "util-linux-fdisk util-linux-cfdisk
util-linux-sfdisk \
              util-linux-libblkid-dev util-linux-libuuid
util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu"
 
-S = "${WORKDIR}/util-linux-ng-${PV}"
+S = "${WORKDIR}/util-linux${NG}-${PV}"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown
--enable-elvtune --enable-init --enable-kill --enable-last \
  --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset
\
diff --git a/meta/recipes-core/util-linux/util-linux/MCONFIG
b/meta/recipes-core/util-linux/util-linux/MCONFIG
new file mode 100644
index 0000000..3fea2c0
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/MCONFIG
@@ -0,0 +1,223 @@
+# MCONFIG -- Configuration stuff for util-linux
+# Created: Sat Feb  4 15:50:30 1995
+# Copyright 1995 Rickard E. Faith (faith@cs.unc.edu)
+
+# For a user-mode install, make (at least) three changes:
+#  - remove the `-o root' part in INSTALLSUID
+#  - set USE_TTY_GROUP=no
+#  - define DESTDIR
+
+# Select for ARCH one of intel, alpha, sparc, arm, m68k, mips
+# Select for CPU i386 if the binaries must be able to run on an intel
386
+# (by default i486 code is generated, see below)
+CPU=$(shell uname -m)
+ARCH=$(shell echo $(CPU) | sed 's/i.86/intel/;s/arm.*/arm/')
+
+# If HAVE_PAM is set to "yes", then login, chfn, chsh, and newgrp
+# will use PAM for authentication. Additionally, passwd will not be
+# installed as it is not PAM aware.
+HAVE_PAM=no
+
+# If HAVE_SHADOW is set to "yes", then login, chfn, chsh, newgrp,
passwd,
+# and vipw will not be built or installed from the login-utils
+# subdirectory.  
+HAVE_SHADOW=yes
+
+# If HAVE_PASSWD is set to "yes", then passwd will not be built or
+# installed from the login-utils subdirectory (but login, chfn, chsh,
+# newgrp, and vipw *will* be installed).
+HAVE_PASSWD=no
+
+# If you use chfn and chsh from this package, REQUIRE_PASSWORD will
require
+# non-root users to enter the account password before
updating /etc/passwd.
+REQUIRE_PASSWORD=yes
+#REQUIRE_PASSWORD=no
+
+# If you use chsh from this package, ONLY_LISTED_SHELLS will require
that
+# the selected shell be listed in /etc/shells -- otherwise only a
warning is
+# printed.  This prevents someone from setting their shell
to /bin/false.
+ONLY_LISTED_SHELLS=yes
+#ONLY_LISTED_SHELLS=no
+
+
+# If HAVE_SYSVINIT is set to "yes", then simpleinit and shutdown will
not
+# be built or installed from the login-utils subdirectory.  (The
shutdown
+# and halt that come with the SysVinit package should be used with the
init
+# found in that package.)
+HAVE_SYSVINIT=no
+
+# If HAVE_SYSVINIT_UTILS is set to "yes", then last, mesg, and wall
will
+# not be built or installed from the login-utils subdirectory.  (The
+# shutdown and init from the SysVinit package do not depend on the
last,
+# mesg, and wall from that package.)
+HAVE_SYSVINIT_UTILS=no
+
+# If HAVE_WRITE is set to "yes", then write will not be built or
+# installed from the misc-utils subdirectory.
+# (There is a network aware write in netwrite from NetKit 0.16 or
later.)
+HAVE_WRITE=no
+
+# If HAVE_GETTY is set to "yes", then agetty will not be built or
+# installed from the login-utils subdirectory.  Note that agetty can
+# co-exist with other gettys, so this option should never be used.
+HAVE_GETTY=no
+
+# If USE_TTY_GROUP is set to "yes", then wall and write will be
installed
+# setgid to the "tty" group, and mesg will only set the group write
bit.
+# Note that this is only useful if login/xterm/etc. change the group of
the
+# user's tty to "tty" [The login in util-linux does this correctly, and
+# xterm will do it correctly if X is compiled with USE_TTY_GROUP set
+# properly.]
+USE_TTY_GROUP=no
+
+# If HAVE_KILL is set to "yes", then kill will not be built or
+# installed from the misc-utils subdirectory.
+# (There is also a kill in the procps package.)
+HAVE_KILL=no
+
+# If ALLOW_VCS_USE is set to "yes", then login will chown /dev/vcsN
+# to the current user, allowing her to make a screendump and do other
+# nifty things on the console, but also allowing him to keep an open
+# file descriptor after logging out to trick the next user.
+ALLOW_VCS_USE=yes
+
+# If HAVE_RESET is set to "yes", then reset won't be installed.  The
version
+# of reset that comes with the ncurses package is less aggressive.
+HAVE_RESET=yes
+
+# If HAVE_SLN is set to "yes", then sln won't be installed
+# (but the man page sln.8 will be installed anyway).
+# sln also comes with libc and glibc.
+HAVE_SLN=no
+
+# If HAVE_FDUTILS is set to "yes", then setfdprm won't be installed.
+HAVE_FDUTILS=no
+
+# If SILENT_PG is set to "yes", then pg will not ring the bell
+# when an invalid key is pressed
+SILENT_PG=no
+
+# If configure decides that Native Language Support (NLS) is available,
+# it sets MAY_ENABLE_NLS in defines.h. If you don't want NLS, set
+# DISABLE_NLS to "yes".
+DISABLE_NLS=no
+
+# Different optimizations for different cpus.
+# gcc 3.0 likes options -mcpu=i486 instead of -m486
+ifeq "$(ARCH)" "intel"
+  ifeq "$(HAVE_OLD_GCC)" "yes"
+    CPUHEAD=-m
+  else
+    CPUHEAD=-mcpu=i
+  endif
+  ifeq "$(CPU)" "i386"
+    CPUTAIL=386
+  else
+    CPUTAIL=486
+  endif
+  CPUOPT= $(CPUHEAD)$(CPUTAIL)
+  OPT=          -pipe -O2 $(CPUOPT) -fomit-frame-pointer
+else 
+  ifeq "$(ARCH)" "arm"
+    OPT=	-pipe -O2 -fsigned-char -fomit-frame-pointer
+  else
+    OPT=	-O2 -fomit-frame-pointer
+  endif
+endif
+
+WARNFLAGS = -Wall -Wmissing-prototypes -Wstrict-prototypes
+
+LIB=../lib
+
+ERR_O=$(LIB)/err.o
+
+# Set HAVE_SLANG to yes if you have slang (and prefer to use that for
cfdisk)
+# (If neither HAVE_NCURSES nor HAVE_SLANG is defined, cfdisk is not
made.)
+# HAVE_SLANG=yes
+# There is a subdirectory /usr/include/slang containing slcurses.h
+# SLANGFLAGS=-I/usr/include/slang
+# No such subdirectory - slcurses.h lives in /usr/include
+#   (no extra definition required).
+LIBSLANG=-lslang
+
+#
+# Paths used for compilation (not all are actually used, see CFLAGS
below)
+#
+DEV_DIR=	/dev
+ETC_DIR=	/etc
+SBIN_DIR=	/sbin
+USRSBIN_DIR=	/usr/sbin
+USRLIB_DIR=	/usr/lib
+USRBIN_DIR=	/usr/bin
+USRGAMES_DIR=	/usr/games
+USRSHAREMISC_DIR=/usr/share/misc
+LOCALE_DIR=	/usr/share/locale
+BIN_DIR=        /bin
+VAR_PATH=	/var
+LOG_DIR=	/var/log
+MAN_DIR=	/usr/share/man
+INFO_DIR=	/usr/share/info
+
+#
+# Paths used for install
+#
+DEVDIR=		$(DESTDIR)$(DEV_DIR)
+ETCDIR=		$(DESTDIR)$(ETC_DIR)
+SBINDIR=	$(DESTDIR)$(SBIN_DIR)
+USRSBINDIR=	$(DESTDIR)$(USRSBIN_DIR)
+USRLIBDIR=      $(DESTDIR)$(USRLIB_DIR)
+USRBINDIR=      $(DESTDIR)$(USRBIN_DIR)
+USRGAMESDIR=    $(DESTDIR)$(USRGAMES_DIR)
+USRSHAREMISCDIR=$(DESTDIR)$(USRSHAREMISC_DIR)
+LOCALEDIR=      $(DESTDIR)$(LOCALE_DIR)
+BINDIR=         $(DESTDIR)$(BIN_DIR)
+VARPATH=	$(DESTDIR)$(VAR_PATH)
+LOGDIR=		$(DESTDIR)$(LOG_DIR)
+MANDIR=		$(DESTDIR)$(MAN_DIR)
+MAN1DIR=	$(MANDIR)/man1
+MAN3DIR=	$(MANDIR)/man3
+MAN5DIR=	$(MANDIR)/man5
+MAN6DIR=	$(MANDIR)/man6
+MAN8DIR=	$(MANDIR)/man8
+INFODIR=	$(DESTDIR)$(INFO_DIR)
+
+# Directory for shutdown, halt, reboot, etc.
+SHUTDOWNDIR=	$(SBINDIR)
+
+# Modes
+DIRMODE=	755
+BINMODE=	755
+MANMODE=	644
+DATMODE=	644
+INFOMODE=	644
+SUIDMODE=      4755
+
+CHMOD=		chmod
+INSTALL=	install
+INSTALLDIR=	$(INSTALL) -d -m $(DIRMODE)
+INSTALLBIN=	$(INSTALL) -m $(BINMODE)
+INSTALLMAN=	$(INSTALL) -m $(MANMODE)
+INSTALLDAT=	$(INSTALL) -m $(DATMODE)
+INSTALLSUID=    $(INSTALL) -m $(SUIDMODE)
+
+ifeq "$(DISABLE_NLS)" "yes"
+NLSFLAGS = -DDISABLE_NLS
+endif
+
+CFLAGS := $(OPT) -I$(LIB) $(WARNFLAGS) \
+			$(CURSESFLAGS) $(SLANGFLAGS) $(NLSFLAGS) \
+			-D_FILE_OFFSET_BITS=64 \
+			-DSBINDIR=\"$(SBIN_DIR)\" \
+			-DUSRSBINDIR=\"$(USRSBIN_DIR)\" \
+			-DLOGDIR=\"$(LOG_DIR)\" \
+			-DVARPATH=\"$(VAR_PATH)\" \
+			-DLOCALEDIR=\"$(LOCALE_DIR)\" \
+			$(CFLAGS)
+
+
+%.o: %.c
+	$(CC) -c $(CFLAGS) $< -o $@
+
+%: %.cc
+	$(CXX) $(CFLAGS) $< -o $@
+
diff --git a/meta/recipes-core/util-linux/util-linux/defines.h
b/meta/recipes-core/util-linux/util-linux/defines.h
new file mode 100644
index 0000000..6ce6b86
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/defines.h
@@ -0,0 +1,10 @@
+#define UTIL_LINUX_VERSION "2.12"
+#define util_linux_version "util-linux-2.12"
+
+#define HAVE_blkpg_h
+#define HAVE_kd_h
+#define HAVE_locale_h
+#define HAVE_langinfo_h
+#define HAVE_sys_user_h
+#define HAVE_asm_types_h
+//#define NEED_tqueue_h
diff --git a/meta/recipes-core/util-linux/util-linux/make_include
b/meta/recipes-core/util-linux/util-linux/make_include
new file mode 100644
index 0000000..e6abcd9
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/make_include
@@ -0,0 +1,17 @@
+VERSION=2.12
+CC=gcc
+CFLAGS=
+LDFLAGS=
+HAVE_OLD_GCC=yes
+HAVE_RAW_H=yes
+HAVE_NCURSES=yes
+CURSESFLAGS=-DNCH=1
+LIBCURSES=-lncurses
+HAVE_TERMCAP=no
+NEED_LIBCRYPT=yes
+FOREIGN = --foreign-user
+HAVE_XGETTEXT=yes
+HAVE_OPENPTY=yes
+HAVE_PIVOT_ROOT=yes
+HAVE_GOOD_RPC=yes
+HAVE_ZLIB=yes
diff --git a/meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
b/meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
new file mode 100644
index 0000000..c726cf1
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
@@ -0,0 +1,103 @@
+Upstream-Status: Inappropriate [distribution]
+
+Take out lscpu stuff from the code
+
+2011/03/17
+Saul Wold <saul.wold@intel.com>
+Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: util-linux-ng-2.17.2/sys-utils/Makefile.am
+===================================================================
+--- util-linux-ng-2.17.2.orig/sys-utils/Makefile.am
++++ util-linux-ng-2.17.2/sys-utils/Makefile.am
+@@ -11,11 +11,11 @@ dist_man_MANS = flock.1 ipcrm.1 ipcs.1 i
+ if LINUX
+ bin_PROGRAMS += dmesg
+ sbin_PROGRAMS += ctrlaltdel
+-usrbin_exec_PROGRAMS += cytune setarch lscpu
++usrbin_exec_PROGRAMS += cytune setarch
+ usrsbin_exec_PROGRAMS += ldattach tunelp rtcwake
+ 
+ dist_man_MANS += dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
+-		ldattach.8 lscpu.1 tunelp.8 rtcwake.8
++		ldattach.8 tunelp.8 rtcwake.8
+ endif
+ 
+ cytune_SOURCES = cytune.c cyclades.h
+Index: util-linux-ng-2.17.2/sys-utils/Makefile.in
+===================================================================
+--- util-linux-ng-2.17.2.orig/sys-utils/Makefile.in
++++ util-linux-ng-2.17.2/sys-utils/Makefile.in
+@@ -47,10 +47,10 @@ usrsbin_exec_PROGRAMS = readprofile$(EXE
+ 	$(am__EXEEXT_10)
+ @LINUX_TRUE@am__append_1 = dmesg
+ @LINUX_TRUE@am__append_2 = ctrlaltdel
+-@LINUX_TRUE@am__append_3 = cytune setarch lscpu
++@LINUX_TRUE@am__append_3 = cytune setarch
+ @LINUX_TRUE@am__append_4 = ldattach tunelp rtcwake
+ @LINUX_TRUE@am__append_5 = dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
+-@LINUX_TRUE@		ldattach.8 lscpu.1 tunelp.8 rtcwake.8
++@LINUX_TRUE@		ldattach.8 tunelp.8 rtcwake.8
+ 
+ @BUILD_FALLOCATE_TRUE@am__append_6 = fallocate
+ @BUILD_FALLOCATE_TRUE@am__append_7 = fallocate.1
+@@ -100,7 +100,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" 
+ @BUILD_PIVOT_ROOT_TRUE@am__EXEEXT_4 = pivot_root$(EXEEXT)
+ @BUILD_SWITCH_ROOT_TRUE@am__EXEEXT_5 = switch_root$(EXEEXT)
+ @LINUX_TRUE@am__EXEEXT_6 = cytune$(EXEEXT) setarch$(EXEEXT) \
+-@LINUX_TRUE@	lscpu$(EXEEXT)
++@LINUX_TRUE@
+ @BUILD_FALLOCATE_TRUE@am__EXEEXT_7 = fallocate$(EXEEXT)
+ @BUILD_UNSHARE_TRUE@am__EXEEXT_8 = unshare$(EXEEXT)
+ @LINUX_TRUE@am__EXEEXT_9 = ldattach$(EXEEXT) tunelp$(EXEEXT) \
+@@ -141,9 +141,6 @@ ipcs_LDADD = $(LDADD)
+ ldattach_SOURCES = ldattach.c
+ ldattach_OBJECTS = ldattach.$(OBJEXT)
+ ldattach_LDADD = $(LDADD)
+-lscpu_SOURCES = lscpu.c
+-lscpu_OBJECTS = lscpu.$(OBJEXT)
+-lscpu_LDADD = $(LDADD)
+ pivot_root_SOURCES = pivot_root.c
+ pivot_root_OBJECTS = pivot_root.$(OBJEXT)
+ pivot_root_LDADD = $(LDADD)
+@@ -201,11 +198,11 @@ AM_V_GEN = $(am__v_GEN_$(V))
+ am__v_GEN_ = $(am__v_GEN_$(AM_DEFAULT_VERBOSITY))
+ am__v_GEN_0 = @echo "  GEN   " $@;
+ SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) dmesg.c fallocate.c \
+-	flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c lscpu.c pivot_root.c \
++	flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c pivot_root.c \
+ 	rdev.c readprofile.c renice.c rtcwake.c setarch.c setsid.c \
+ 	switch_root.c $(tunelp_SOURCES) unshare.c
+ DIST_SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) dmesg.c \
+-	fallocate.c flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c lscpu.c \
++	fallocate.c flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c \
+ 	pivot_root.c rdev.c readprofile.c renice.c rtcwake.c setarch.c \
+ 	setsid.c switch_root.c $(tunelp_SOURCES) unshare.c
+ INFO_DEPS = $(srcdir)/ipc.info
+@@ -248,7 +245,7 @@ NROFF = nroff
+ MANS = $(dist_man_MANS) $(man_MANS)
+ am__dist_noinst_DATA_DIST = flock.1 ipcrm.1 ipcs.1 ipcmk.1 renice.1 \
+ 	setsid.1 readprofile.1 dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
+-	ldattach.8 lscpu.1 tunelp.8 rtcwake.8 fallocate.1 pivot_root.8 \
++	ldattach.8 tunelp.8 rtcwake.8 fallocate.1 pivot_root.8 \
+ 	switch_root.8 unshare.1 arch.1 rdev.8
+ DATA = $(dist_noinst_DATA)
+ ETAGS = etags
+@@ -678,9 +675,6 @@ ipcs$(EXEEXT): $(ipcs_OBJECTS) $(ipcs_DE
+ ldattach$(EXEEXT): $(ldattach_OBJECTS) $(ldattach_DEPENDENCIES) 
+ 	@rm -f ldattach$(EXEEXT)
+ 	$(AM_V_CCLD)$(LINK) $(ldattach_OBJECTS) $(ldattach_LDADD) $(LIBS)
+-lscpu$(EXEEXT): $(lscpu_OBJECTS) $(lscpu_DEPENDENCIES) 
+-	@rm -f lscpu$(EXEEXT)
+-	$(AM_V_CCLD)$(LINK) $(lscpu_OBJECTS) $(lscpu_LDADD) $(LIBS)
+ pivot_root$(EXEEXT): $(pivot_root_OBJECTS) $(pivot_root_DEPENDENCIES) 
+ 	@rm -f pivot_root$(EXEEXT)
+ 	$(AM_V_CCLD)$(LINK) $(pivot_root_OBJECTS) $(pivot_root_LDADD) $(LIBS)
+@@ -728,7 +722,6 @@ distclean-compile:
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcrm.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcs.Po@am__quote@
+ @AMDEP_TRUE@@am__include@
@am__quote@./$(DEPDIR)/ldattach.Po@am__quote@
+-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/lscpu.Po@am__quote@
+ @AMDEP_TRUE@@am__include@
@am__quote@./$(DEPDIR)/pivot_root.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/rdev.Po@am__quote@
+ @AMDEP_TRUE@@am__include@
@am__quote@./$(DEPDIR)/readprofile.Po@am__quote@
diff --git a/meta/recipes-core/util-linux/util-linux/swapargs.h
b/meta/recipes-core/util-linux/util-linux/swapargs.h
new file mode 100644
index 0000000..e960eef
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/swapargs.h
@@ -0,0 +1,3 @@
+#define SWAPON_HAS_TWO_ARGS
+#include <asm/page.h>
+#include <sys/swap.h>
diff --git
a/meta/recipes-core/util-linux/util-linux/uclibc-compile.patch
b/meta/recipes-core/util-linux/util-linux/uclibc-compile.patch
new file mode 100644
index 0000000..75774d8
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/uclibc-compile.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Index: util-linux-ng-2.16/misc-utils/cal.c
+===================================================================
+--- util-linux-ng-2.16.orig/misc-utils/cal.c	2009-07-03
16:20:01.000000000 -0700
++++ util-linux-ng-2.16/misc-utils/cal.c	2009-07-18 23:21:37.000000000
-0700
+@@ -407,7 +407,7 @@
+   strcpy(day_headings,"");
+   strcpy(j_day_headings,"");
+ 
+-#ifdef HAVE_LANGINFO_H
++#ifdef HAVE_LANGINFO_H && !defined(__UCLIBC__)
+ # define weekday(wd)	nl_langinfo(ABDAY_1+wd)
+ #else
+ # define weekday(wd)	_time_info->abbrev_wkday[wd]
diff --git
a/meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
new file mode 100644
index 0000000..5773d7e
--- /dev/null
+++
b/meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+The FHS indicates that /etc must be capable of being mounted R/O.
+
+The FHS also indicates that lock files belong in /var/lock, and /var
must
+be R/W as soon as possible during boot.
+
+This patch moves the mtab lock file from the potentially R/O /etc, to
the
+R/W /var/lock area.  This lock file is used when mounting disks and
making
+other mount adjustments.  The _PATH_MOUNTED_TMP is not adjusted, as
failing
+to write to this file does not cause any functional limitations.
+
+(Note, if /etc is R/O, then /etc/mtab should be a symlink
to /proc/mounts)
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- util-linux-ng-2.16/include/pathnames.h.orig
++++ util-linux-ng-2.16/include/pathnames.h
+@@ -90,7 +90,7 @@
+ # endif
+ #endif
+ 
+-#define _PATH_MOUNTED_LOCK	_PATH_MOUNTED "~"
++#define _PATH_MOUNTED_LOCK	"/var/lock/mtab~"
+ #define _PATH_MOUNTED_TMP	_PATH_MOUNTED ".tmp"
+ 
+ #ifndef _PATH_DEV
diff --git
a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
new file mode 100644
index 0000000..c5c0aff
--- /dev/null
+++
b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+Index: util-linux-ng-2.14/login-utils/login.c
+===================================================================
+--- util-linux-ng-2.14.orig/login-utils/login.c	2008-05-28
16:01:02.000000000 -0700
++++ util-linux-ng-2.14/login-utils/login.c	2009-03-04
18:31:42.000000000 -0800
+@@ -358,6 +358,7 @@
+     char *childArgv[10];
+     char *buff;
+     int childArgc = 0;
++    struct sigaction act;
+ #ifdef HAVE_SECURITY_PAM_MISC_H
+     int retcode;
+     pam_handle_t *pamh = NULL;
+@@ -373,7 +374,9 @@
+     pid = getpid();
+ 
+     signal(SIGALRM, timedout);
+-    siginterrupt(SIGALRM,1);           /* we have to interrupt
syscalls like ioclt() */
++    (void) sigaction(SIGALRM, NULL, &act);
++    act.sa_flags &= ~SA_RESTART;
++    sigaction(SIGALRM, &act, NULL);
+     alarm((unsigned int)timeout);
+     signal(SIGQUIT, SIG_IGN);
+     signal(SIGINT, SIG_IGN);
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
new file mode 100644
index 0000000..02485fa
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -0,0 +1,51 @@
+MAJOR_VERSION = "2.19"
+PR = "r8"
+require util-linux.inc
+
+LIC_FILES_CHKSUM =
"file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f \
+                    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552
\
+
file://licenses/COPYING.GPL;md5=8ca43cbc842c2336e835926c2166c28b \
+
file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
+
file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+# note that `lscpu' is under GPLv3+
+LICENSE_util-linux-lscpu = "GPLv3+"
+
+SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
+            file://util-linux-ng-2.16-mount_lock_path.patch"
+
+SRC_URI[md5sum] = "3eab06f05163dfa65479c44e5231932c"
+SRC_URI[sha256sum] =
"d3eac4afcc687b3ae1ffedcab2dc12df84c7ba7045cce31386d2b7040a011c7d"
+
+# Only lscpu part is gplv3; rest of the code is not, 
+# so take out the lscpu parts while running non-gplv3 build.
+python () {
+    d.setVar("REMOVELSCPU", "no")
+    if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") !=
-1:
+        # avoid GPLv3 
+        d.setVar("REMOVELSCPU", "yes")
+        packages = (d.getVar("PACKAGES", False) or "").split()
+        if "util-linux-lscpu" in packages:
+            packages.remove("util-linux-lscpu")
+        d.setVar("PACKAGES", " ".join(packages))
+
+        src_uri = (d.getVar("SRC_URI", False) or "").split()
+        src_uri.append("file://remove-lscpu.patch")
+        d.setVar("SRC_URI", " ".join(src_uri))
+}       
+
+do_remove_lscpu() {
+    if [ "x${REMOVELSCPU}" = "xyes" ]; then
+         rm -f sys-utils/lscpu.c sys-utils/lscpu.1
+         rm -rf tests/ts/lscpu tests/expected/lscpu
+    fi
+}
+
+addtask remove_lscpu before do_configure after do_patch
+
+# fallocate is glibc 2.10, fallocate64 is glibc 2.11
+# we need to disable it for older versions
+EXTRA_OECONF += "ac_cv_func_fallocate=no"
+EXTRA_OECONF_virtclass-native += "--disable-fallocate
--disable-use-tty-group"
+
+
-- 
1.6.2.5




