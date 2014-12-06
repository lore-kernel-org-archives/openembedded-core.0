Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECED60673
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 14:37:09 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id y19so3034488wgg.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Dec 2014 06:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=4CM19u+AA9CeMlPQSp7NO5UjEr529TTUTMAIPCLFvAY=;
	b=cbn6c0aBBf39kkVN8F01UXk0el6+T59Z7w97fQHQM9ijXhwL3J7Gm4H3gDrbgaSIXi
	fe1DOVIiK9h7nHF+xFzpYBw4poAy7bd/0lNb6UY9SL4Cfv1/XcwmtKp03qhH6oTM0ffg
	uOlXxUQsGh4WUo/zQ39Uc7ERFKKNIS5YftWYYLrIpxpnXh/tu9fNf3Y9IVf70sD63q5W
	+yYdBuaTk3Zqp22dLCUFyXfQEauJ9a7SGoPGLGs0rRUZB91ayhbM93jl6/e/S6sktbt8
	O+kXO4JTcyRNeslb5Dgh4VJcoLzEdTou8SrrgoaoyoTvJOl969k1G1W85HvkpLMVAygg
	81tQ==
X-Gm-Message-State: ALoCoQnBxXjH4eUsEZfNK+rDN5kFjwxmVFtdjKG+b0DA033jw/Ue/7m7KFLgK8fKSC+VVkq2Ys/D
X-Received: by 10.194.5.227 with SMTP id v3mr33011952wjv.63.1417876629948;
	Sat, 06 Dec 2014 06:37:09 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	je12sm2067255wic.22.2014.12.06.06.37.08 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Dec 2014 06:37:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1417851531-3540-1-git-send-email-sgw@linux.intel.com>
Date: Sat, 6 Dec 2014 15:37:07 +0100
Message-Id: <FB5AD677-B717-4E86-A600-524D77A13F09@dominion.thruhere.net>
References: <1417851531-3540-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHi v3] procps: Upgrade to 3.3.10
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
X-List-Received-Date: Sat, 06 Dec 2014 14:37:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 6 dec. 2014, om 08:38 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>=20
> This is now the procps-ng version
>=20
> cleaned up patches
> added to fix up usrbin_execprefix in OE-Core
>=20
> Add CPPFLAGS to allow seperate build directory works
>=20
> [YOCTO #6952]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>=20
> Thanks for Koen for keeping me honest ;-)

If you feel bored, there's a stray backslash in DESCRIPTION and the '+=3D'=
 for EXTRA_OECONF can be a regular '=3D'. Next time I'll try to catch =
everything in one go :)


>=20
> Sau!
>=20
> .../procps-3.2.8/0001-Fix-musl-build-failure.patch |  29 ------
> .../procps-3.2.8/60_linux_version_init.patch       |  54 ----------
> .../procps/procps-3.2.8/detect_bitness.patch       |  26 -----
> .../procps/procps-3.2.8/gnu-kbsd-version.patch     |  44 --------
> .../procps/procps-3.2.8/install.patch              |  39 --------
> .../procps/procps-3.2.8/linux-limits.patch         |  15 ---
> .../procps/procps-3.2.8/procmodule.patch           |  38 -------
> .../procps-3.2.8/procps-3.2.7-top-remcpu.patch     | 111 =
---------------------
> .../procps-3.2.8/procps-3.2.8+gmake-3.82.patch     |  19 ----
> .../procps-3.2.8/procps-3.2.8-ps-cgroup.patch      |  82 =
---------------
> .../procps/procps-3.2.8/psmodule.patch             |  23 -----
> meta/recipes-extended/procps/procps.inc            |  31 ------
> .../procps/{procps-3.2.8 =3D> procps}/sysctl.conf    |   0
> meta/recipes-extended/procps/procps_3.2.8.bb       |  37 -------
> meta/recipes-extended/procps/procps_3.3.10.bb      |  62 ++++++++++++
> 15 files changed, 62 insertions(+), 548 deletions(-)
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.patc=
h
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/detect_bitness.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/install.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/procmodule.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
> delete mode 100644 =
meta/recipes-extended/procps/procps-3.2.8/psmodule.patch
> delete mode 100644 meta/recipes-extended/procps/procps.inc
> rename meta/recipes-extended/procps/{procps-3.2.8 =3D> =
procps}/sysctl.conf (100%)
> delete mode 100644 meta/recipes-extended/procps/procps_3.2.8.bb
> create mode 100644 meta/recipes-extended/procps/procps_3.3.10.bb
>=20
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.pa=
tch =
b/meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.pa=
tch
> deleted file mode 100644
> index 71dc3f0..0000000
> --- =
a/meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.pa=
tch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -=46rom 6f2fd55ef7621fd7ab7897aee2c2651b6faf9e6a Mon Sep 17 00:00:00 =
2001
> -From: Paul Barker <paul@paulbarker.me.uk>
> -Date: Wed, 20 Aug 2014 11:56:11 +0200
> -Subject: [PATCH] Fix musl build failure
> -
> -Include <limits.h> for PATH_MAX.
> -
> -Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> -
> -Upstream-status: Pending
> ----
> - proc/readproc.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/proc/readproc.c b/proc/readproc.c
> -index 4fad11d..c5b1869 100644
> ---- a/proc/readproc.c
> -+++ b/proc/readproc.c
> -@@ -26,6 +26,7 @@
> - #include <sys/dir.h>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> -+#include <limits.h>
> -=20
> - // sometimes it's easier to do this manually, w/o gcc helping
> - #ifdef PROF
> ---=20
> -1.9.1
> -
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch =
b/meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch
> deleted file mode 100644
> index 203ccb3..0000000
> --- =
a/meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -## 60_linux_init.dpatch by  <david.sugar@canonical.com>
> -##
> -## All lines beginning with `## DP:' are a description of the patch.
> -## DP: Fix Linux version detection which relied on elf loader =
side-effect.
> -## DP: This patch also depends on 40_gnu-kbsd-version, which modified
> -## DP: init_Linux_version().
> -
> -@DPATCH@
> -
> -Upstream-Status: inappropriate [upstream unmaintained]
> ----
> - proc/sysinfo.c |    1 +
> - proc/version.c |    5 +++--
> - proc/version.h |    1 +
> - 3 files changed, 5 insertions(+), 2 deletions(-)
> -
> -Index: procps-3.2.8/proc/sysinfo.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- procps-3.2.8.orig/proc/sysinfo.c
> -+++ procps-3.2.8/proc/sysinfo.c
> -@@ -212,6 +212,7 @@ static int check_for_privs(void){
> - static void init_libproc(void) __attribute__((constructor));
> - static void init_libproc(void){
> -   have_privs =3D check_for_privs();
> -+  init_Linux_version(); // make sure we have version before =
continuing...
> -   // ought to count CPUs in /proc/stat instead of relying
> -   // on glibc, which foolishly tries to parse /proc/cpuinfo
> -   //
> -Index: procps-3.2.8/proc/version.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- procps-3.2.8.orig/proc/version.c
> -+++ procps-3.2.8/proc/version.c
> -@@ -33,8 +33,7 @@ void display_version(void) {
> -=20
> - int linux_version_code;
> -=20
> --static void init_Linux_version(void) __attribute__((constructor));
> --static void init_Linux_version(void) {
> -+void init_Linux_version(void) {
> -     int x =3D 0, y =3D 0, z =3D 0;	/* cleared in case sscanf() < 2 =
*/
> -     FILE *fp;
> -     char buf[256];
> -Index: procps-3.2.8/proc/version.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- procps-3.2.8.orig/proc/version.h
> -+++ procps-3.2.8/proc/version.h
> -@@ -14,6 +14,7 @@
> -=20
> - EXTERN_C_BEGIN
> -=20
> -+extern void init_Linux_version(void);	/* initialize linux =
version */
> - extern void display_version(void);	/* display suite version */
> - extern const char procps_version[];		/* global buf for suite =
version */
> -=20
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/detect_bitness.patch =
b/meta/recipes-extended/procps/procps-3.2.8/detect_bitness.patch
> deleted file mode 100644
> index 1523c3d..0000000
> --- a/meta/recipes-extended/procps/procps-3.2.8/detect_bitness.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Do not try to detect 64bit/32bit system
> -we already feed that information via compiler
> -defaults
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Inappropriate [OE specific]
> -Index: procps-3.2.8/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- procps-3.2.8.orig/Makefile	2014-05-03 01:00:01.707387583 =
-0700
> -+++ procps-3.2.8/Makefile	2014-05-03 08:53:08.087175369 -0700
> -@@ -118,15 +118,6 @@
> - # until you go looking for a 64-bit curses library.
> - check_gcc =3D $(shell if $(CC) $(ALL_CPPFLAGS) $(ALL_CFLAGS) dummy.c =
$(ALL_LDFLAGS) $(1) -o /dev/null $(CURSES) > /dev/null 2>&1; then echo =
"$(1)"; else echo "$(2)"; fi ;)
> -=20
> --# Be 64-bit if at all possible. In a cross-compiling situation, one =
may
> --# do "make m64=3D-m32 lib64=3Dlib" to produce 32-bit executables. DO =
NOT
> --# attempt to use a 32-bit executable on a 64-bit kernel. Packagers =
MUST
> --# produce separate executables for ppc and ppc64, s390 and s390x,
> --# i386 and x86-64, mips and mips64, sparc and sparc64, and so on.
> --# Failure to do so will cause data corruption.
> --m64 :=3D $(call check_gcc,-m64,$(call check_gcc,-mabi=3D64,))
> --ALL_CFLAGS +=3D $(m64)
> --
> - ALL_CFLAGS +=3D $(call check_gcc,-Wdeclaration-after-statement,)
> - ALL_CFLAGS +=3D $(call check_gcc,-Wpadded,)
> - ALL_CFLAGS +=3D $(call check_gcc,-Wstrict-aliasing,)
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch =
b/meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch
> deleted file mode 100644
> index 2582857..0000000
> --- a/meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -Upstream-Status: Inappropriate [not author, no upstream]
> -
> -Imported from Debian.
> -Source: =
http://anonscm.debian.org/gitweb/?p=3Dcollab-maint/procps.git;a=3Dblob;f=3D=
debian/patches/gnu-kbsd-version.patch;h=3Dfe5489fc772a3355ff8c0dcf9b953bf0=
c05aa9f8;hb=3Db460cfd726b019f8d918b380f78af4c19c5f3e50
> -Bugtracker: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D632749
> -
> -Stops procps utilities from printing a warning when used with
> -kernels having only two digit versions, e.g. 3.0.
> -
> -Author: <csmall@debian.org>
> -Description: Rework version parsing so its ok with other OSes
> ---- a/proc/version.c
> -+++ b/proc/version.c
> -@@ -35,15 +35,23 @@
> -=20
> - static void init_Linux_version(void) __attribute__((constructor));
> - static void init_Linux_version(void) {
> --    static struct utsname uts;
> --    int x =3D 0, y =3D 0, z =3D 0;	/* cleared in case sscanf() < 3 =
*/
> -+    int x =3D 0, y =3D 0, z =3D 0;	/* cleared in case sscanf() < 2 =
*/
> -+    FILE *fp;
> -+    char buf[256];
> -    =20
> --    if (uname(&uts) =3D=3D -1)	/* failure implies impending =
death */
> --	exit(1);
> --    if (sscanf(uts.release, "%d.%d.%d", &x, &y, &z) < 3)
> -+    if ( (fp=3Dfopen("/proc/version","r")) =3D=3D NULL) /* failure =
implies impending death */
> -+      exit(1);
> -+    if (fgets(buf, 256, fp) =3D=3D NULL) {
> -+      fprintf(stderr, "Cannot read kernel version from =
/proc/version\n");
> -+      fclose(fp);
> -+      exit(1);
> -+    }
> -+    fclose(fp);
> -+    if (sscanf(buf, "Linux version %d.%d.%d", &x, &y, &z) < 2)
> - 	fprintf(stderr,		/* *very* unlikely to happen by accident =
*/
> - 		"Non-standard uts for running kernel:\n"
> --		"release %s=3D%d.%d.%d gives version code %d\n",
> --		uts.release, x, y, z, LINUX_VERSION(x,y,z));
> -+        "release %s=3D%d.%d.%d gives version code %d\n",
> -+        buf,
> -+        x, y, z, LINUX_VERSION(x,y,z));
> -     linux_version_code =3D LINUX_VERSION(x, y, z);
> - }
> diff --git a/meta/recipes-extended/procps/procps-3.2.8/install.patch =
b/meta/recipes-extended/procps/procps-3.2.8/install.patch
> deleted file mode 100644
> index 2a59a5f..0000000
> --- a/meta/recipes-extended/procps/procps-3.2.8/install.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -diff -ruN procps-3.2.8-orig//Makefile procps-3.2.8/Makefile
> ---- procps-3.2.8-orig//Makefile	2011-08-23 22:06:46.471163999 =
+0800
> -+++ procps-3.2.8/Makefile	2011-08-23 22:15:01.091163999 +0800
> -@@ -29,9 +29,6 @@
> - ln_sf    :=3D ln -sf
> - install  :=3D install -D --owner 0 --group 0
> -=20
> --# Lame x86-64 /lib64 and /usr/lib64 abomination:
> --lib64    :=3D lib$(shell [ -d /lib64 ] && echo 64)
> --
> - usr/bin                  :=3D $(DESTDIR)/usr/bin/
> - bin                      :=3D $(DESTDIR)/bin/
> - sbin                     :=3D $(DESTDIR)/sbin/
> -@@ -39,8 +36,8 @@
> - man1                     :=3D $(DESTDIR)/usr/share/man/man1/
> - man5                     :=3D $(DESTDIR)/usr/share/man/man5/
> - man8                     :=3D $(DESTDIR)/usr/share/man/man8/
> --lib                      :=3D $(DESTDIR)/$(lib64)/
> --usr/lib                  :=3D $(DESTDIR)/usr/$(lib64)/
> -+lib                      :=3D $(DESTDIR)/$(base_libdir)/
> -+usr/lib                  :=3D $(DESTDIR)/$(libdir)/
> - usr/include              :=3D $(DESTDIR)/usr/include/
> -=20
> - #SKIP     :=3D $(bin)kill $(man1)kill.1
> -@@ -222,10 +219,10 @@
> - ###### install
> -=20
> - $(BINFILES) : all
> --	$(install) --mode a=3Drx $(notdir $@) $@
> -+	$(install) -m 555 $(notdir $@) $@
> -=20
> - $(MANFILES) : all
> --	$(install) --mode a=3Dr $(notdir $@) $@
> -+	$(install) -m 444 $(notdir $@) $@
> -=20
> - install: $(filter-out $(SKIP) $(addprefix =
$(DESTDIR),$(SKIP)),$(INSTALL))
> - 	cd $(usr/bin) && $(ln_f) skill snice
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch =
b/meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch
> deleted file mode 100644
> index 2ca9724..0000000
> --- a/meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Pending
> -
> -diff --git a/pwdx.c b/pwdx.c
> -index cb96a52..29ebce2 100644
> ---- a/pwdx.c
> -+++ b/pwdx.c
> -@@ -13,7 +13,7 @@
> - #include <stdlib.h>
> - #include <sys/types.h>
> - #include <regex.h>
> --#include <limits.h>
> -+#include <linux/limits.h>
> - #include <unistd.h>
> - #include <errno.h>
> -=20
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/procmodule.patch =
b/meta/recipes-extended/procps/procps-3.2.8/procmodule.patch
> deleted file mode 100644
> index 2a65c35..0000000
> --- a/meta/recipes-extended/procps/procps-3.2.8/procmodule.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Upstream-Status: Pending
> -
> -*** procps-3.2.5/proc/module.mk.orig	Sun Jul 24 11:53:49 2005
> ---- procps-3.2.5/proc/module.mk	Sun Jul 24 11:54:32 2005
> -***************
> -*** 96,102 ****
> -  #################### install rules ###########################
> - =20
> -  $(lib)$(SOFILE) : proc/$(SONAME)
> -! 	$(install) --mode a=3Drx $< $@
> - =20
> -  ifneq ($(SOLINK),$(SOFILE))
> -  .PHONY: $(lib)$(SOLINK)
> ---- 96,102 ----
> -  #################### install rules ###########################
> - =20
> -  $(lib)$(SOFILE) : proc/$(SONAME)
> -! 	$(install) -m 555 $< $@
> - =20
> -  ifneq ($(SOLINK),$(SOFILE))
> -  .PHONY: $(lib)$(SOLINK)
> -***************
> -*** 115,121 ****
> -  	$(ldconfig)
> - =20
> -  $(usr/lib)$(ANAME) : proc/$(ANAME)
> -! 	$(install) --mode a=3Dr $< $@
> - =20
> -  # Junk anyway... supposed to go in /usr/include/$(NAME)
> -  #INSTALL +=3D $(addprefix $(include),$(HDRFILES))
> ---- 115,121 ----
> -  	$(ldconfig)
> - =20
> -  $(usr/lib)$(ANAME) : proc/$(ANAME)
> -! 	$(install) -m 444 $< $@
> - =20
> -  # Junk anyway... supposed to go in /usr/include/$(NAME)
> -  #INSTALL +=3D $(addprefix $(include),$(HDRFILES))
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch =
b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch
> deleted file mode 100644
> index 0306c8d..0000000
> --- =
a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -Upstream-Status: Pending
> -
> -fix that top will quit after cpu offline
> -   =20
> -top utiliy fails to read /proc/stat after cpu offline, because =
Cpu_tot
> -is still the original cpu numbers when calling cpus_refresh, in which
> -it is trying to read and sscanf Cpu_tot times /proc/stat.
> -
> -The patch is from procps-3.2.8-2.fc12.src.rpm
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> -
> ----
> ---- procps-3.2.7/top.c.remcpu	2006-07-10 10:41:11.000000000 =
+0200
> -+++ procps-3.2.7/top.c	2006-07-10 10:41:35.000000000 +0200
> -@@ -912,6 +912,7 @@
> - static CPU_t *cpus_refresh (CPU_t *cpus)
> - {
> -    static FILE *fp =3D NULL;
> -+   static int cpu_max;
> -    int i;
> -    int num;
> -    // enough for a /proc/stat CPU line (not the intr line)
> -@@ -926,24 +927,29 @@
> -                can hold tics representing the /proc/stat cpu summary =
(the first
> -                line read) -- that slot supports our View_CPUSUM =
toggle */
> -       cpus =3D alloc_c((1 + Cpu_tot) * sizeof(CPU_t));
> -+      cpu_max =3D Cpu_tot;
> -    }
> -+   else if (cpu_max > Cpu_tot)
> -+      /* move saved CUPs summary to cpu_max possition */
> -+      memcpy(&cpus[cpu_max], &cpus[Cpu_tot], sizeof(CPU_t));
> -+  =20
> -    rewind(fp);
> -    fflush(fp);
> -=20
> -    // first value the last slot with the cpu summary line
> -    if (!fgets(buf, sizeof(buf), fp)) std_err("failed /proc/stat =
read");
> --   cpus[Cpu_tot].x =3D 0;  // FIXME: can't tell by kernel version =
number
> --   cpus[Cpu_tot].y =3D 0;  // FIXME: can't tell by kernel version =
number
> --   cpus[Cpu_tot].z =3D 0;  // FIXME: can't tell by kernel version =
number
> -+   cpus[cpu_max].x =3D 0;  // FIXME: can't tell by kernel version =
number
> -+   cpus[cpu_max].y =3D 0;  // FIXME: can't tell by kernel version =
number
> -+   cpus[cpu_max].z =3D 0;  // FIXME: can't tell by kernel version =
number
> -    num =3D sscanf(buf, "cpu %Lu %Lu %Lu %Lu %Lu %Lu %Lu %Lu",
> --      &cpus[Cpu_tot].u,
> --      &cpus[Cpu_tot].n,
> --      &cpus[Cpu_tot].s,
> --      &cpus[Cpu_tot].i,
> --      &cpus[Cpu_tot].w,
> --      &cpus[Cpu_tot].x,
> --      &cpus[Cpu_tot].y,
> --      &cpus[Cpu_tot].z
> -+      &cpus[cpu_max].u,
> -+      &cpus[cpu_max].n,
> -+      &cpus[cpu_max].s,
> -+      &cpus[cpu_max].i,
> -+      &cpus[cpu_max].w,
> -+      &cpus[cpu_max].x,
> -+      &cpus[cpu_max].y,
> -+      &cpus[cpu_max].z
> -    );
> -    if (num < 4)
> -          std_err("failed /proc/stat read");
> -@@ -955,7 +961,7 @@
> -    }
> -=20
> -    // now value each separate cpu's tics
> --   for (i =3D 0; 1 < Cpu_tot && i < Cpu_tot; i++) {
> -+   for (i =3D 0; ; i++) {
> -       if (!fgets(buf, sizeof(buf), fp)) std_err("failed /proc/stat =
read");
> -       cpus[i].x =3D 0;  // FIXME: can't tell by kernel version =
number
> -       cpus[i].y =3D 0;  // FIXME: can't tell by kernel version =
number
> -@@ -964,9 +970,35 @@
> -          &cpus[i].id,
> -          &cpus[i].u, &cpus[i].n, &cpus[i].s, &cpus[i].i, &cpus[i].w, =
&cpus[i].x, &cpus[i].y, &cpus[i].z
> -       );
> --      if (num < 4)
> --            std_err("failed /proc/stat read");
> -+      if (num < 4) {
> -+	 Cpu_tot =3D i;
> -+	 break;
> -+      }
> -+      if (i =3D=3D cpu_max - 1) {
> -+	 // Bump cpu_max and extend cpus
> -+	 cpu_max++;
> -+	 cpus =3D realloc(cpus, (1 + cpu_max) * sizeof(CPU_t));
> -+	 if (!cpus) std_err("realloc failed");
> -+	 memcpy(&cpus[cpu_max], &cpus[cpu_max-1], sizeof(CPU_t));
> -+      }
> -+   }
> -+
> -+   if (cpu_max > Cpu_tot)
> -+      memcpy(&cpus[Cpu_tot], &cpus[cpu_max], sizeof(CPU_t));
> -+
> -+   // and just in case we're 2.2.xx compiled without SMP support...
> -+   if (Cpu_tot =3D=3D 1) {
> -+      cpus[0].id =3D cpus[1].id =3D 0;
> -+      cpus[0].u =3D cpus[1].u;
> -+      cpus[0].n =3D cpus[1].n;
> -+      cpus[0].s =3D cpus[1].s;
> -+      cpus[0].i =3D cpus[1].i;
> -+      cpus[0].w =3D cpus[1].w;
> -+      cpus[0].x =3D cpus[1].x;
> -+      cpus[0].y =3D cpus[1].y;
> -+      cpus[0].z =3D cpus[1].z;
> -    }
> -+  =20
> -    return cpus;
> - }
> -=20
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch =
b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch
> deleted file mode 100644
> index c8cee26..0000000
> --- =
a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Upstream-Status: Backport
> -
> -Fix for stricter Makefile parser in Make 3.82 take from Gentoo =
bugzilla:
> =
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-process/procp=
s/files/procps-3.2.8%2Bgmake-3.82.patch?revision=3D1.1
> -
> -Index: procps-3.2.8/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- procps-3.2.8.orig/Makefile
> -+++ procps-3.2.8/Makefile
> -@@ -174,7 +174,8 @@ INSTALL :=3D $(BINFILES) $(MANFILES)
> - # want this rule first, use :=3D on ALL, and ALL not filled in yet
> - all: do_all
> -=20
> ---include */module.mk
> -+-include proc/module.mk
> -+-include ps/module.mk
> -=20
> - do_all:    $(ALL)
> -=20
> diff --git =
a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch =
b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
> deleted file mode 100644
> index 1a29414..0000000
> --- =
a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -=46rom e529ce0b53f6b73d8b760cd37b23e0397720cede Mon Sep 17 00:00:00 =
2001
> -From: Daniel Novotny <dnovotny@fedoraproject.org>
> -Date: Mon, 16 Feb 2009 12:22:20 +0000
> -Subject: add cgroup support
> -
> -Rebased for 3.2.8: Andrei Gherzan <andrei.gherzan@windriver.com>
> -
> -Upstream-Status: Pending
> -
> -The patch was imported from the meta-ivi repository
> -(git://git.yoctoproject.org/meta-ivi) as of commit id
> -74b9624fe94b2b90810717a13d481b0db9d2d95a
> -
> -Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> -
> -Index: procps-3.2.8/ps/output.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- procps-3.2.8.orig/ps/output.c	2012-11-15 17:44:05.501337741 =
+0200
> -+++ procps-3.2.8/ps/output.c	2012-11-15 17:48:31.585328231 +0200
> -@@ -1099,6 +1099,39 @@
> -   return snprintf(outbuf, COLWID, "*");
> - }
> -=20
> -+static int pr_cgroup(char *restrict const outbuf, const proc_t =
*restrict const pp){
> -+  char filename[48];
> -+  FILE *fd;
> -+  int counter =3D 0;
> -+  int c;
> -+  int is_cgroup =3D 0;
> -+
> -+  outbuf[0]=3D'\0';
> -+  snprintf(filename, sizeof filename, "/proc/%d/cgroup", pp->tgid);
> -+  fd =3D fopen(filename, "r");
> -+  if (likely(fd =3D=3D NULL)) goto fail;
> -+  while (( (c =3D fgetc(fd)) !=3D EOF) && (counter<665)) {
> -+    if (is_cgroup =3D=3D 0) {
> -+      if (c =3D=3D ':') {
> -+        is_cgroup =3D 1;
> -+        if (counter>0)
> -+          outbuf[counter++]=3D';';
> -+      }
> -+    }else
> -+      if ((c =3D=3D '\n') || (c =3D=3D '\0'))
> -+        is_cgroup =3D 0;
> -+      else
> -+        outbuf[counter++]=3Dc;
> -+  }
> -+  outbuf[counter]=3D'\0';
> -+  close(fd);
> -+  if (counter>0)
> -+    return counter;
> -+fail:
> -+  outbuf[0] =3D '-';
> -+  outbuf[1] =3D '\0';
> -+  return 1;
> -+}
> -=20
> - /****************** FLASK & seLinux security stuff =
**********************/
> - // move the bulk of this to libproc sometime
> -@@ -1293,6 +1326,7 @@
> - {"bsdtime",   "TIME",    pr_bsdtime,  sr_nop,     6,   0,    LNX, =
ET|RIGHT},
> - {"c",         "C",       pr_c,        sr_pcpu,    2,   0,    SUN, =
ET|RIGHT},
> - {"caught",    "CAUGHT",  pr_sigcatch, sr_nop,     9,   0,    BSD, =
TO|SIGNAL}, /*sigcatch*/
> -+{"cgroup",    "CGROUP",  pr_cgroup,   sr_nop,    35,   0,    LNX, =
PO|LEFT},  /* cgroups*/
> - {"class",     "CLS",     pr_class,    sr_sched,   3,   0,    XXX, =
TO|LEFT},
> - {"cls",       "CLS",     pr_class,    sr_sched,   3,   0,    HPU, =
TO|RIGHT}, /*says HPUX or RT*/
> - {"cmaj_flt",  "-",       pr_nop,      sr_cmaj_flt, 1,  0,    LNX, =
AN|RIGHT},
> -Index: procps-3.2.8/ps/ps.1
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- procps-3.2.8.orig/ps/ps.1	2012-11-15 17:44:50.845336117 =
+0200
> -+++ procps-3.2.8/ps/ps.1	2012-11-15 17:49:09.621326859 +0200
> -@@ -904,6 +904,10 @@
> - displayed.  (alias\ \fBsig_catch\fR,\ \fBsigcatch\fR).
> - T}
> -=20
> -+cgroup	CGROUP	T{
> -+display control groups to which the process belonges.
> -+t}
> -+
> - class	CLS	T{
> - scheduling class of the process.  (alias\ \fBpolicy\fR,\ \fBcls\fR).
> - Field's possible values are:
> diff --git a/meta/recipes-extended/procps/procps-3.2.8/psmodule.patch =
b/meta/recipes-extended/procps/procps-3.2.8/psmodule.patch
> deleted file mode 100644
> index 0775eab..0000000
> --- a/meta/recipes-extended/procps/procps-3.2.8/psmodule.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Upstream-Status: Pending
> -
> -*** procps-3.2.5/ps/module.mk.orig	Sun Jul 24 11:54:40 2005
> ---- procps-3.2.5/ps/module.mk	Sun Jul 24 11:55:02 2005
> -***************
> -*** 33,40 ****
> - =20
> - =20
> -  $(bin)ps: ps/ps
> -! 	$(install) --mode a=3Drx $< $@
> - =20
> -  $(man1)ps.1 : ps/ps.1
> -! 	$(install) --mode a=3Dr $< $@
> -  	-rm -f $(DESTDIR)/var/catman/cat1/ps.1.gz =
$(DESTDIR)/var/man/cat1/ps.1.gz
> ---- 33,40 ----
> - =20
> - =20
> -  $(bin)ps: ps/ps
> -! 	$(install) -m 555 $< $@
> - =20
> -  $(man1)ps.1 : ps/ps.1
> -! 	$(install) -m 444 $< $@
> -  	-rm -f $(DESTDIR)/var/catman/cat1/ps.1.gz =
$(DESTDIR)/var/man/cat1/ps.1.gz
> diff --git a/meta/recipes-extended/procps/procps.inc =
b/meta/recipes-extended/procps/procps.inc
> deleted file mode 100644
> index da91da2..0000000
> --- a/meta/recipes-extended/procps/procps.inc
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY =3D "System and process monitoring utilities"
> -DESCRIPTION =3D "Procps contains a set of system utilities that =
provide system information about processes using \
> -the /proc filesystem. The package \ includes the programs ps, top, =
vmstat, w, kill, and skill."
> -HOMEPAGE =3D "http://procps.sf.net"
> -SECTION =3D "base"
> -LICENSE =3D "GPLv2+ & LGPLv2+"
> -LIC_FILES_CHKSUM=3D"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317b=
b3 \
> -                  =
file://COPYING.LIB;md5=3D6e29c688d912da12b66b73e32b03d812 \
> -                  =
file://ps/COPYING;md5=3D6e29c688d912da12b66b73e32b03d812 \
> -                  =
file://proc/COPYING;md5=3D6e29c688d912da12b66b73e32b03d812"
> -DEPENDS =3D "ncurses"
> -
> -SRC_URI =3D "http://procps.sourceforge.net/procps-${PV}.tar.gz \
> -           file://install.patch"
> -
> -inherit autotools-brokensep update-alternatives
> -
> -do_install_append() {
> -	mv ${D}${bindir}/watch ${D}${bindir}/watch.${BPN}
> -}
> -
> -FILES_${PN} +=3D "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
> -FILES_SOLIBSDEV =3D ""
> -
> -ALTERNATIVE_${PN} =3D "top uptime free pkill pmap kill sysctl ps =
pgrep pwdx watch"
> -ALTERNATIVE_LINK_NAME[kill] =3D "${base_bindir}/kill"
> -ALTERNATIVE_LINK_NAME[sysctl] =3D "${base_sbindir}/sysctl"
> -ALTERNATIVE_LINK_NAME[ps] =3D "${base_bindir}/ps"
> -ALTERNATIVE_LINK_NAME[watch] =3D "${base_bindir}/watch"
> -ALTERNATIVE_TARGET[watch] =3D "${bindir}/watch.${BPN}"
> -ALTERNATIVE_PRIORITY =3D "110"
> diff --git a/meta/recipes-extended/procps/procps-3.2.8/sysctl.conf =
b/meta/recipes-extended/procps/procps/sysctl.conf
> similarity index 100%
> rename from meta/recipes-extended/procps/procps-3.2.8/sysctl.conf
> rename to meta/recipes-extended/procps/procps/sysctl.conf
> diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb =
b/meta/recipes-extended/procps/procps_3.2.8.bb
> deleted file mode 100644
> index fcfde19..0000000
> --- a/meta/recipes-extended/procps/procps_3.2.8.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -require procps.inc
> -
> -PR =3D "r12"
> -
> -SRC_URI +=3D "file://procmodule.patch \
> -            file://psmodule.patch \
> -            file://linux-limits.patch \
> -            file://sysctl.conf \
> -            file://procps-3.2.8+gmake-3.82.patch \
> -            file://gnu-kbsd-version.patch \
> -            file://60_linux_version_init.patch \
> -            file://procps-3.2.7-top-remcpu.patch \
> -            file://procps-3.2.8-ps-cgroup.patch \
> -            file://detect_bitness.patch \
> -            file://0001-Fix-musl-build-failure.patch \
> -           "
> -
> -SRC_URI[md5sum] =3D "9532714b6846013ca9898984ba4cd7e0"
> -SRC_URI[sha256sum] =3D =
"11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535"
> -
> -EXTRA_OEMAKE =3D 'CFLAGS=3D"${CFLAGS} -I${STAGING_INCDIR}" \
> -                CPPFLAGS=3D-I${STAGING_INCDIR} \
> -                LDFLAGS=3D"${LDFLAGS}" \
> -                CURSES=3D-lncurses \
> -                install=3D"install -D" \
> -                ldconfig=3Decho'
> -
> -do_install_append () {
> -	install -d ${D}${sysconfdir}
> -	install -m 0644 ${WORKDIR}/sysctl.conf =
${D}${sysconfdir}/sysctl.conf
> -	if =
${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> -		install -d ${D}${sysconfdir}/sysctl.d
> -		ln -sf ../sysctl.conf =
${D}${sysconfdir}/sysctl.d/99-sysctl.conf
> -	fi
> -}
> -
> -CONFFILES_${PN} =3D "${sysconfdir}/sysctl.conf"
> diff --git a/meta/recipes-extended/procps/procps_3.3.10.bb =
b/meta/recipes-extended/procps/procps_3.3.10.bb
> new file mode 100644
> index 0000000..c0233cb
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps_3.3.10.bb
> @@ -0,0 +1,62 @@
> +SUMMARY =3D "System and process monitoring utilities"
> +DESCRIPTION =3D "Procps contains a set of system utilities that =
provide system information about processes using \
> +the /proc filesystem. The package \ includes the programs ps, top, =
vmstat, w, kill, and skill."
> +HOMEPAGE =3D "https://gitorious.org/procps"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2+ & LGPLv2+"
> +LIC_FILES_CHKSUM=3D"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a42=
63 \
> +                  =
file://COPYING.LIB;md5=3D4cf66a4984120007c9881cc871cf49db \
> +                 "
> +
> +DEPENDS =3D "ncurses"
> +
> +inherit autotools gettext pkgconfig update-alternatives
> +
> +SRC_URI =3D =
"http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-$=
{PV}.tar.xz \
> +           file://fix-configure.patch \
> +           file://sysctl.conf \
> +          "
> +
> +SRC_URI[md5sum] =3D "1fb7f3f6bf92ce6c5c9ed9949ae858fe"
> +SRC_URI[sha256sum] =3D =
"a02e6f98974dfceab79884df902ca3df30b0e9bad6d76aee0fb5dce17f267f04"
> +
> +S =3D "${WORKDIR}/procps-ng-${PV}"
> +
> +EXTRA_OECONF +=3D "--enable-skill \
> +                "
> +CPPFLAGS +=3D "-I${S}"
> +
> +do_install_append () {
> +	install -d ${D}${base_bindir}
> +	[ "${bindir}" !=3D "${base_bindir}" ] && for i in =
${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
> +	install -d ${D}${base_sbindir}
> +	[ "${sbindir}" !=3D "${base_sbindir}" ] && for i in =
${base_sbindir_progs}; do mv ${D}${sbindir}/$i ${D}${base_sbindir}/$i; =
done
> +        # Remove now empty dir
> +	rmdir ${D}/${sbindir}
> +
> +        install -d ${D}${sysconfdir}
> +        install -m 0644 ${WORKDIR}/sysctl.conf =
${D}${sysconfdir}/sysctl.conf
> +        if =
${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +                install -d ${D}${sysconfdir}/sysctl.d
> +                ln -sf ../sysctl.conf =
${D}${sysconfdir}/sysctl.d/99-sysctl.conf
> +        fi
> +}
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/sysctl.conf"
> +
> +bindir_progs =3D "free pkill pmap pgrep pwdx skill snice top uptime"
> +base_bindir_progs +=3D "kill pidof ps watch"
> +base_sbindir_progs +=3D "sysctl"
> +
> +ALTERNATIVE_PRIORITY =3D "100"
> +
> +ALTERNATIVE_${PN} =3D "${bindir_progs} ${base_bindir_progs} =
${base_sbindir_progs}"
> +
> +python __anonymous() {
> +    for prog in d.getVar('base_bindir_progs', True).split():
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % =
(d.getVar('base_bindir', True), prog))
> +
> +    for prog in d.getVar('base_sbindir_progs', True).split():
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % =
(d.getVar('base_sbindir', True), prog))
> +}
> +
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


