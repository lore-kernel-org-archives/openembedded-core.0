Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 89A9872007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 18:09:54 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id bs8so27223502wib.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 10:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QzZjaOrajfevTsLtF4trEF9Xg2mO+pWJAaNdl3b8FH4=;
	b=WqOr3AwEeW9R06QftXxlA6W7AD8XW3d9+Td2C3zLmCqKhDwR/PKrMOVydCNJQ1Q1WH
	JYNiEuYM++Gy2bjSz+QToM6kDdhCRF6iy05J6pcsv36z9zVqgaE9mkHtBm48Z3yrDleN
	wPoBt9S13lbkLoFdaiqsmArNmMSBLm13+NFoo8te9J+ZLXhdxrS+lQvTg+9IB++EmdI6
	sZJoK91SsTz2OhvDJJYHO7pXq4RF2IB3nf+QPAzoNVRiTx9RFalvj9DdJl/eP1iGxfwA
	TU07F7eSVsCoq1F27w9Gqf/G3aKqZJ0KWllobBSM5lUYDEkv1Lpp8BYbboeDcEQI+nc4
	RVeQ==
X-Gm-Message-State: ALoCoQmNHEy/XexdJr/PHFfaLI+jwC9FIW2M7vG6lc54NhRLYdIjdK/NCJn2HlaFw5sLZhabruY0
X-Received: by 10.194.20.67 with SMTP id l3mr34239755wje.94.1424801395150;
	Tue, 24 Feb 2015 10:09:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id p1sm21568058wib.23.2015.02.24.10.09.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Feb 2015 10:09:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2015 18:07:26 +0000
Message-Id: <1424801246-16399-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
References: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] systemd: Upgrade 216 -> 218
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
X-List-Received-Date: Tue, 24 Feb 2015 18:09:55 -0000

From: Khem Raj <raj.khem@gmail.com>

Remove upstreamed patches as well as patches which arent needed anymore
since features are dropped from systemd e.g. userspace firmware download
Tested on qemux86

Change-Id: Ic53aaad198998de146c3a7702ef17de871de9de6
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...1-Make-root-s-home-directory-configurable.patch |  121 +++++++-------
 ...onfigure-the-list-of-system-users-files-a.patch |  176 --------------------
 ...o-not-install-tmpfiles-and-sysusers-files.patch |   56 -------
 ...-Fix-navigating-backwards-missing-entries.patch |   34 ----
 ...ing.h-add-fake-__NR_memfd_create-for-MIPS.patch |   29 ----
 ...ke-resolv.conf-entry-conditional-on-resol.patch |  142 ----------------
 .../systemd/systemd/binfmt-install.patch           |   35 ++--
 .../systemd/systemd-pam-fix-fallocate.patch        |   50 +++---
 .../systemd/systemd/uclibc-sysinfo_h.patch         |   19 ---
 .../systemd/{systemd_216.bb => systemd_218.bb}     |   34 ++--
 10 files changed, 114 insertions(+), 582 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
 rename meta/recipes-core/systemd/{systemd_216.bb => systemd_218.bb} (93%)

diff --git a/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
index c5ad291..a86c841 100644
--- a/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
@@ -21,11 +21,11 @@ Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
  units/rescue.service.m4.in        | 4 ++--
  8 files changed, 20 insertions(+), 11 deletions(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index 4028112..5d18f5c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -191,6 +191,7 @@ AM_CPPFLAGS = \
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -195,6 +195,7 @@ AM_CPPFLAGS = \
  	-DKEXEC=\"$(KEXEC)\" \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
@@ -33,7 +33,7 @@ index 4028112..5d18f5c 100644
  	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
  	-I $(top_builddir)/src/shared \
-@@ -5584,6 +5585,7 @@ EXTRA_DIST += \
+@@ -5830,6 +5831,7 @@ EXTRA_DIST += \
  substitutions = \
         '|rootlibexecdir=$(rootlibexecdir)|' \
         '|rootbindir=$(rootbindir)|' \
@@ -41,14 +41,14 @@ index 4028112..5d18f5c 100644
         '|bindir=$(bindir)|' \
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
-diff --git a/configure.ac b/configure.ac
-index 18b7198..365bc73 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1272,6 +1272,11 @@ AC_ARG_WITH([rootlibdir],
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -1310,6 +1310,11 @@ AC_ARG_WITH([rootlibdir],
          [],
          [with_rootlibdir=${libdir}])
-
+ 
 +AC_ARG_WITH([roothomedir],
 +        AS_HELP_STRING([--with-roothomedir=DIR], [Home directory for the root user]),
 +        [],
@@ -57,15 +57,15 @@ index 18b7198..365bc73 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1317,6 +1322,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+@@ -1362,6 +1367,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
  AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
 +AC_SUBST([roothomedir], [$with_roothomedir])
-
+ 
  AC_CONFIG_FILES([
          Makefile po/Makefile.in
-@@ -1400,6 +1406,7 @@ AC_MSG_RESULT([
+@@ -1446,6 +1452,7 @@ AC_MSG_RESULT([
          include_prefix:          ${INCLUDE_PREFIX}
          lib dir:                 ${libdir}
          rootlib dir:             ${with_rootlibdir}
@@ -73,55 +73,55 @@ index 18b7198..365bc73 100644
          SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
-diff --git a/src/core/unit-printf.c b/src/core/unit-printf.c
-index 62599d0..852d34c 100644
---- a/src/core/unit-printf.c
-+++ b/src/core/unit-printf.c
-@@ -259,7 +259,7 @@ static int specifier_user_home(char specifier, void *data, void *userdata, char
+Index: git/src/core/unit-printf.c
+===================================================================
+--- git.orig/src/core/unit-printf.c
++++ git/src/core/unit-printf.c
+@@ -259,7 +259,7 @@ static int specifier_user_home(char spec
                   * best of it if we can, but fail if we can't */
-
+ 
                  if (!c->user || streq(c->user, "root") || streq(c->user, "0"))
 -                        n = strdup("/root");
 +                        n = strdup(ROOTHOMEDIR);
                  else
                          return -ENOTSUP;
-
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index d01da45..3e876d5 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -3312,7 +3312,7 @@ int main(int argc, char *argv[]) {
+ 
+Index: git/src/nspawn/nspawn.c
+===================================================================
+--- git.orig/src/nspawn/nspawn.c
++++ git/src/nspawn/nspawn.c
+@@ -3183,7 +3183,7 @@ int main(int argc, char *argv[]) {
                          if (r < 0)
                                  _exit(EXIT_FAILURE);
-
+ 
 -                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
 +                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
                              (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
                              (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0)) {
                                  log_oom();
-@@ -3402,7 +3402,7 @@ int main(int argc, char *argv[]) {
-                         } else if (argc > optind)
-                                 execvpe(argv[optind], argv + optind, env_use);
+@@ -3278,7 +3278,7 @@ int main(int argc, char *argv[]) {
+                                 execvp(argv[optind], argv + optind);
+ #endif /* HAVE_EXECVPE */                      
                          else {
 -                                chdir(home ? home : "/root");
 +                                chdir(home ? home : ROOTHOMEDIR);
                                  execle("/bin/bash", "-bash", NULL, env_use);
                                  execle("/bin/sh", "-sh", NULL, env_use);
                          }
-diff --git a/src/shared/util.c b/src/shared/util.c
-index 85a570a..aef6033 100644
---- a/src/shared/util.c
-+++ b/src/shared/util.c
-@@ -4377,7 +4377,7 @@ int get_user_creds(
+Index: git/src/shared/util.c
+===================================================================
+--- git.orig/src/shared/util.c
++++ git/src/shared/util.c
+@@ -4523,7 +4523,7 @@ int get_user_creds(
                          *gid = 0;
-
+ 
                  if (home)
 -                        *home = "/root";
 +                        *home = ROOTHOMEDIR;
-
+ 
                  if (shell)
                          *shell = "/bin/sh";
-@@ -5363,7 +5363,7 @@ int get_home_dir(char **_h) {
+@@ -5491,7 +5491,7 @@ int get_home_dir(char **_h) {
          /* Hardcode home directory for root to avoid NSS */
          u = getuid();
          if (u == 0) {
@@ -129,14 +129,14 @@ index 85a570a..aef6033 100644
 +                h = strdup(ROOTHOMEDIR);
                  if (!h)
                          return -ENOMEM;
-
-diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
-index 3f4904a..e2af652 100644
---- a/units/console-shell.service.m4.in
-+++ b/units/console-shell.service.m4.in
+ 
+Index: git/units/console-shell.service.m4.in
+===================================================================
+--- git.orig/units/console-shell.service.m4.in
++++ git/units/console-shell.service.m4.in
 @@ -15,8 +15,8 @@ After=rc-local.service
  Before=getty.target
-
+ 
  [Service]
 -Environment=HOME=/root
 -WorkingDirectory=/root
@@ -145,36 +145,33 @@ index 3f4904a..e2af652 100644
  ExecStart=-/sbin/sulogin
  ExecStopPost=-@SYSTEMCTL@ poweroff
  Type=idle
-diff --git a/units/emergency.service.in b/units/emergency.service.in
-index 91fc1bb..659547e 100644
---- a/units/emergency.service.in
-+++ b/units/emergency.service.in
-@@ -13,8 +13,8 @@ Conflicts=shutdown.target
+Index: git/units/emergency.service.in
+===================================================================
+--- git.orig/units/emergency.service.in
++++ git/units/emergency.service.in
+@@ -14,8 +14,8 @@ Conflicts=rescue.service
  Before=shutdown.target
-
+ 
  [Service]
 -Environment=HOME=/root
 -WorkingDirectory=/root
 +Environment=HOME=@roothomedir@
 +WorkingDirectory=@roothomedir@
  ExecStartPre=-/bin/plymouth quit
- ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" to try again\\nto boot into default mode.'
+ ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
  ExecStart=-/bin/sh -c "/sbin/sulogin; @SYSTEMCTL@ --fail --no-block default"
-diff --git a/units/rescue.service.m4.in b/units/rescue.service.m4.in
-index ef54369..7aad86f 100644
---- a/units/rescue.service.m4.in
-+++ b/units/rescue.service.m4.in
-@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
+Index: git/units/rescue.service.in
+===================================================================
+--- git.orig/units/rescue.service.in
++++ git/units/rescue.service.in
+@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.serv
  Before=shutdown.target
-
+ 
  [Service]
 -Environment=HOME=/root
 -WorkingDirectory=/root
 +Environment=HOME=@roothomedir@
 +WorkingDirectory=@roothomedir@
  ExecStartPre=-/bin/plymouth quit
- ExecStartPre=-/bin/echo -e 'Welcome to rescue mode! Type "systemctl default" or ^D to enter default mode.\\nType "journalctl -xb" to view system logs. Type "systemctl reboot" to reboot.'
+ ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
  ExecStart=-/bin/sh -c "/sbin/sulogin; @SYSTEMCTL@ --fail --no-block default"
--- 
-1.9.3
-
diff --git a/meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch b/meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch
deleted file mode 100644
index e004359..0000000
--- a/meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From 5a16bc264c32237e38a844d55e7a1820a31b8440 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
-Date: Fri, 28 Nov 2014 15:59:59 +0100
-Subject: [PATCH] build-sys: configure the list of system users, files and
- directories
-
-Choose which system users defined in sysusers.d/systemd.conf and files
-or directories in tmpfiles.d/systemd.conf, should be provided depending
-on comile-time configuration.
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am                                  | 4 ++++
- configure.ac                                 | 2 ++
- sysusers.d/.gitignore                        | 1 +
- sysusers.d/{systemd.conf => systemd.conf.m4} | 8 ++++++++
- tmpfiles.d/.gitignore                        | 3 ++-
- tmpfiles.d/{systemd.conf => systemd.conf.m4} | 2 ++
- 6 files changed, 19 insertions(+), 1 deletion(-)
- rename sysusers.d/{systemd.conf => systemd.conf.m4} (77%)
- rename tmpfiles.d/{systemd.conf => systemd.conf.m4} (96%)
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am	2015-01-23 21:23:04.000000000 +0000
-+++ git/Makefile.am	2015-01-23 21:23:04.000000000 +0000
-@@ -5698,6 +5698,10 @@
- 	$(AM_V_at)$(MKDIR_P) $(dir $@)
- 	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
- 
-+sysusers.d/%: sysusers.d/%.m4
-+	$(AM_V_at)$(MKDIR_P) $(dir $@)
-+	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
-+
- tmpfiles.d/%: tmpfiles.d/%.m4
- 	$(AM_V_at)$(MKDIR_P) $(dir $@)
- 	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2015-01-23 21:23:04.000000000 +0000
-+++ git/configure.ac	2015-01-23 21:23:04.000000000 +0000
-@@ -971,6 +971,7 @@
- AC_ARG_ENABLE(timesyncd, AS_HELP_STRING([--disable-timesyncd], [disable timesync daemon]))
- if test "x$enable_timesyncd" != "xno"; then
-         have_timesyncd=yes
-+        M4_DEFINES="$M4_DEFINES -DENABLE_TIMESYNCD"
- fi
- AM_CONDITIONAL(ENABLE_TIMESYNCD, [test "$have_timesyncd" = "yes"])
- 
-@@ -1060,6 +1061,7 @@
- AS_IF([test "x$enable_networkd" != "xno"], [
-         AC_DEFINE(ENABLE_NETWORKD, 1, [Define if networkd support is to be enabled])
-         have_networkd=yes
-+        M4_DEFINES="$M4_DEFINES -DENABLE_NETWORKD"
- ])
- AM_CONDITIONAL(ENABLE_NETWORKD, [test "x$have_networkd" = "xyes"])
- 
-Index: git/sysusers.d/systemd.conf
-===================================================================
---- git.orig/sysusers.d/systemd.conf	2015-01-23 21:23:02.000000000 +0000
-+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
-@@ -1,12 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--g systemd-journal   - -
--u systemd-bus-proxy - "systemd Bus Proxy"
--u systemd-network   - "systemd Network Management"
--u systemd-resolve   - "systemd Resolver"
--u systemd-timesync  - "systemd Time Synchronization"
-Index: git/sysusers.d/systemd.conf.m4
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysusers.d/systemd.conf.m4	2015-01-23 21:26:30.000000000 +0000
-@@ -0,0 +1,20 @@
-+#  This file is part of systemd.
-+#
-+#  systemd is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU Lesser General Public License as published by
-+#  the Free Software Foundation; either version 2.1 of the License, or
-+#  (at your option) any later version.
-+
-+g systemd-journal   - -
-+m4_ifdef(`ENABLE_KDBUS',
-+u systemd-bus-proxy - "systemd Bus Proxy"
-+)m4_dnl
-+m4_ifdef(`ENABLE_NETWORKD',
-+u systemd-network   - "systemd Network Management"
-+)m4_dnl
-+m4_ifdef(`ENABLE_RESOLVED',
-+u systemd-resolve   - "systemd Resolver"
-+)m4_dnl
-+m4_ifdef(`ENABLE_TIMESYNCD',
-+u systemd-timesync  - "systemd Time Synchronization"
-+)m4_dnl
-Index: git/tmpfiles.d/systemd.conf
-===================================================================
---- git.orig/tmpfiles.d/systemd.conf	2015-01-23 21:23:02.000000000 +0000
-+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
-@@ -1,32 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--# See tmpfiles.d(5) for details
--
--d /run/user 0755 root root -
--F! /run/utmp 0664 root utmp -
--
--d /run/systemd/ask-password 0755 root root -
--d /run/systemd/seats 0755 root root -
--d /run/systemd/sessions 0755 root root -
--d /run/systemd/users 0755 root root -
--d /run/systemd/machines 0755 root root -
--d /run/systemd/shutdown 0755 root root -
--d /run/systemd/netif 0755 systemd-network systemd-network -
--d /run/systemd/netif/links 0755 systemd-network systemd-network -
--d /run/systemd/netif/leases 0755 systemd-network systemd-network -
--
--d /run/log 0755 root root -
--
--z /run/log/journal 2755 root systemd-journal - -
--Z /run/log/journal/%m ~2750 root systemd-journal - -
--
--z /var/log/journal 2755 root systemd-journal - -
--z /var/log/journal/%m 2755 root systemd-journal - -
--
--d /var/lib/systemd 0755 root root -
--d /var/lib/systemd/coredump 0755 root root 3d
-Index: git/tmpfiles.d/systemd.conf.m4
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/tmpfiles.d/systemd.conf.m4	2015-01-23 21:26:46.000000000 +0000
-@@ -0,0 +1,34 @@
-+#  This file is part of systemd.
-+#
-+#  systemd is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU Lesser General Public License as published by
-+#  the Free Software Foundation; either version 2.1 of the License, or
-+#  (at your option) any later version.
-+
-+# See tmpfiles.d(5) for details
-+
-+d /run/user 0755 root root -
-+F! /run/utmp 0664 root utmp -
-+
-+d /run/systemd/ask-password 0755 root root -
-+d /run/systemd/seats 0755 root root -
-+d /run/systemd/sessions 0755 root root -
-+d /run/systemd/users 0755 root root -
-+d /run/systemd/machines 0755 root root -
-+d /run/systemd/shutdown 0755 root root -
-+m4_ifdef(`ENABLE_NETWORKD',
-+d /run/systemd/netif 0755 systemd-network systemd-network -
-+d /run/systemd/netif/links 0755 systemd-network systemd-network -
-+d /run/systemd/netif/leases 0755 systemd-network systemd-network -
-+)m4_dnl
-+
-+d /run/log 0755 root root -
-+
-+z /run/log/journal 2755 root systemd-journal - -
-+Z /run/log/journal/%m ~2750 root systemd-journal - -
-+
-+z /var/log/journal 2755 root systemd-journal - -
-+z /var/log/journal/%m 2755 root systemd-journal - -
-+
-+d /var/lib/systemd 0755 root root -
-+d /var/lib/systemd/coredump 0755 root root 3d
diff --git a/meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch b/meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch
deleted file mode 100644
index 4795f86..0000000
--- a/meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From bedd083aaedb3bbb14ef579a047bf4b4fed56d9b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
-Date: Wed, 26 Nov 2014 09:17:50 +0100
-Subject: [PATCH] build-sys: do not install tmpfiles and sysusers files by
- default
-
-Upstream-Status: Backport
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Makefile.am | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ddd0df1..65bb176 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2039,7 +2039,6 @@ nodist_tmpfiles_DATA = \
- dist_tmpfiles_DATA = \
- 	tmpfiles.d/systemd.conf \
- 	tmpfiles.d/systemd-nologin.conf \
--	tmpfiles.d/systemd-remote.conf \
- 	tmpfiles.d/tmp.conf \
- 	tmpfiles.d/x11.conf \
- 	tmpfiles.d/var.conf
-@@ -2094,8 +2093,7 @@ SYSINIT_TARGET_WANTS += \
- 	systemd-sysusers.service
- 
- dist_sysusers_DATA = \
--	sysusers.d/systemd.conf \
--	sysusers.d/systemd-remote.conf
-+	sysusers.d/systemd.conf
- 
- nodist_sysusers_DATA = \
- 	sysusers.d/basic.conf
-@@ -3839,6 +3837,16 @@ systemd_journal_remote_CFLAGS = \
- systemd_journal_remote_LDADD += \
- 	$(MICROHTTPD_LIBS)
- 
-+if ENABLE_SYSUSERS
-+dist_sysusers_DATA += \
-+	sysusers.d/systemd-remote.conf
-+endif
-+
-+if ENABLE_TMPFILES
-+dist_tmpfiles_DATA += \
-+	tmpfiles.d/systemd-remote.conf
-+endif
-+
- if HAVE_GNUTLS
- systemd_journal_remote_LDADD += \
- 	$(GNUTLS_LIBS)
--- 
-1.9.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch b/meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch
deleted file mode 100644
index 621a0da..0000000
--- a/meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2173cbf847fc53ca24950e77958c902edecfc207 Mon Sep 17 00:00:00 2001
-From: Olivier Brunel <jjk@jjacky.com>
-Date: Fri, 5 Dec 2014 16:06:45 +0100
-Subject: [PATCH] journal: Fix navigating backwards missing entries
-
-With DIRECTION_UP (i.e. navigating backwards) in generic_array_bisect() when the
-needle was found as the last item in the array, it wasn't actually processed as
-match, resulting in entries being missed.
-
-https://bugs.freedesktop.org/show_bug.cgi?id=86855
-
-Upstream-Status: Backport
-
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/journal/journal-file.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
-index 7858435..c5d2d19 100644
---- a/src/journal/journal-file.c
-+++ b/src/journal/journal-file.c
-@@ -1657,7 +1657,7 @@ static int generic_array_bisect(
-                         }
-                 }
- 
--                if (k > n) {
-+                if (k >= n) {
-                         if (direction == DIRECTION_UP) {
-                                 i = n;
-                                 subtract_one = true;
--- 
-2.1.3
-
diff --git a/meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch b/meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch
deleted file mode 100644
index 448ef1a..0000000
--- a/meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-
-Subject: missing.h: add fake __NR_memfd_create for MIPS
-
-We don't have the correct __NR_memfd_create syscall number yet, so set it to
-0xffffffff for now to prevent compile time errors.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/shared/missing.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index 3ff1a21..3051cb5 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -167,6 +167,9 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
- #      define __NR_fanotify_mark 5296
- #    endif
- #  endif
-+#  ifndef __NR_memfd_create
-+#    define __NR_memfd_create 0xffffffff /* FIXME */
-+#  endif
- #else
- #  ifndef __NR_fanotify_init
- #    define __NR_fanotify_init 338
--- 
-1.9.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch
deleted file mode 100644
index b5b0168..0000000
--- a/meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From aeb50ff0bd4bbbca74c4695072232348351d512d Mon Sep 17 00:00:00 2001
-From: Tom Gundersen <teg@jklm.no>
-Date: Wed, 27 Aug 2014 17:45:41 +0200
-Subject: [PATCH] tmpfiles: make resolv.conf entry conditional on resolved
- support
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Makefile.am                          | 15 +++++++++++++--
- TODO                                 |  2 --
- configure.ac                         |  1 +
- tmpfiles.d/.gitignore                |  1 +
- tmpfiles.d/{etc.conf => etc.conf.m4} |  2 ++
- 5 files changed, 17 insertions(+), 4 deletions(-)
- create mode 100644 tmpfiles.d/.gitignore
- rename tmpfiles.d/{etc.conf => etc.conf.m4} (95%)
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am	2015-01-24 00:41:20.134716451 -0800
-+++ git/Makefile.am	2015-01-24 00:41:20.126716451 -0800
-@@ -1935,14 +1935,16 @@
- 	units/systemd-tmpfiles-setup.service \
- 	units/systemd-tmpfiles-clean.service
- 
-+nodist_tmpfiles_DATA = \
-+	tmpfiles.d/etc.conf
-+
- dist_tmpfiles_DATA = \
- 	tmpfiles.d/systemd.conf \
- 	tmpfiles.d/systemd-nologin.conf \
- 	tmpfiles.d/systemd-remote.conf \
- 	tmpfiles.d/tmp.conf \
- 	tmpfiles.d/x11.conf \
--	tmpfiles.d/var.conf \
--	tmpfiles.d/etc.conf
-+	tmpfiles.d/var.conf
- 
- if HAVE_SYSV_COMPAT
- dist_tmpfiles_DATA += \
-@@ -1965,10 +1967,14 @@
- endif
- 
- EXTRA_DIST += \
-+	tmpfiles.d/etc.conf.m4 \
- 	units/systemd-tmpfiles-setup-dev.service.in \
- 	units/systemd-tmpfiles-setup.service.in \
- 	units/systemd-tmpfiles-clean.service.in
- 
-+CLEANFILES += \
-+	tmpfiles.d/etc.conf
-+
- # ------------------------------------------------------------------------------
- if ENABLE_SYSUSERS
- systemd_sysusers_SOURCES = \
-@@ -5684,6 +5690,11 @@
- 	$(AM_V_at)$(MKDIR_P) $(dir $@)
- 	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
- 
-+tmpfiles.d/%: tmpfiles.d/%.m4
-+	$(AM_V_at)$(MKDIR_P) $(dir $@)
-+	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
-+
-+
- units/%: units/%.m4
- 	$(AM_V_at)$(MKDIR_P) $(dir $@)
- 	$(AM_V_M4)$(M4) -P $(M4_DEFINES) -DFOR_SYSTEM=1 < $< > $@
-Index: git/TODO
-===================================================================
---- git.orig/TODO	2015-01-24 00:41:20.134716451 -0800
-+++ git/TODO	2015-01-24 00:41:20.126716451 -0800
-@@ -111,8 +111,6 @@
- 
- * Allow multiple ExecStart= for all Type= settings, so that we can cover rescue.service nicely
- 
--* the resolv.conf tmpfiles line should be covered by ENABLE_NETWORKD...
--
- * Add a new verb "systemctl top"
- 
- * logind: allow users to kill or lock their own sessions
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2015-01-24 00:41:20.134716451 -0800
-+++ git/configure.ac	2015-01-24 00:41:20.126716451 -0800
-@@ -1041,6 +1041,7 @@
- AC_ARG_ENABLE(resolved, AS_HELP_STRING([--disable-resolved], [disable resolve daemon]))
- if test "x$enable_resolved" != "xno"; then
-         have_resolved=yes
-+        M4_DEFINES="$M4_DEFINES -DENABLE_RESOLVED"
- fi
- AM_CONDITIONAL(ENABLE_RESOLVED, [test "$have_resolved" = "yes"])
- 
-Index: git/tmpfiles.d/.gitignore
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/tmpfiles.d/.gitignore	2015-01-24 00:41:20.126716451 -0800
-@@ -0,0 +1 @@
-+etc.conf
-Index: git/tmpfiles.d/etc.conf
-===================================================================
---- git.orig/tmpfiles.d/etc.conf	2015-01-24 00:41:20.134716451 -0800
-+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
-@@ -1,15 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--# See tmpfiles.d(5) for details
--
--L /etc/os-release - - - - ../usr/lib/os-release
--L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
--L+ /etc/mtab - - - - ../proc/self/mounts
--L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
--C /etc/nsswitch.conf - - - -
--C /etc/pam.d - - - -
-Index: git/tmpfiles.d/etc.conf.m4
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/tmpfiles.d/etc.conf.m4	2015-01-24 00:41:20.126716451 -0800
-@@ -0,0 +1,17 @@
-+#  This file is part of systemd.
-+#
-+#  systemd is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU Lesser General Public License as published by
-+#  the Free Software Foundation; either version 2.1 of the License, or
-+#  (at your option) any later version.
-+
-+# See tmpfiles.d(5) for details
-+
-+L /etc/os-release - - - - ../usr/lib/os-release
-+L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
-+L+ /etc/mtab - - - - ../proc/self/mounts
-+m4_ifdef(`ENABLE_RESOLVED',
-+L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
-+)
-+C /etc/nsswitch.conf - - - -
-+C /etc/pam.d - - - -
diff --git a/meta/recipes-core/systemd/systemd/binfmt-install.patch b/meta/recipes-core/systemd/systemd/binfmt-install.patch
index c2d5099..93b8e3c 100644
--- a/meta/recipes-core/systemd/systemd/binfmt-install.patch
+++ b/meta/recipes-core/systemd/systemd/binfmt-install.patch
@@ -9,11 +9,11 @@ however can do that in a postinst.
 Upstream-Status: Denied
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-diff --git a/Makefile.am b/Makefile.am
-index 7933de6..78acb6f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3133,10 +3133,6 @@ INSTALL_DIRS += \
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -4495,10 +4495,6 @@
  	$(prefix)/lib/binfmt.d \
  	$(sysconfdir)/binfmt.d
  
@@ -24,30 +24,31 @@ index 7933de6..78acb6f 100644
  endif
  
  EXTRA_DIST += \
-diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 6be3893..709adef 100644
---- a/units/proc-sys-fs-binfmt_misc.automount
-+++ b/units/proc-sys-fs-binfmt_misc.automount
-@@ -16,3 +16,6 @@ ConditionPathIsReadWrite=/proc/sys/
+Index: git/units/proc-sys-fs-binfmt_misc.automount
+===================================================================
+--- git.orig/units/proc-sys-fs-binfmt_misc.automount
++++ git/units/proc-sys-fs-binfmt_misc.automount
+@@ -16,3 +16,6 @@
  
  [Automount]
  Where=/proc/sys/fs/binfmt_misc
 +
 +[Install]
 +WantedBy=sysinit.target
-diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index 02dfe77..86d3481 100644
---- a/units/systemd-binfmt.service.in
-+++ b/units/systemd-binfmt.service.in
-@@ -11,6 +11,7 @@ Documentation=man:systemd-binfmt.service(8) man:binfmt.d(5)
+Index: git/units/systemd-binfmt.service.in
+===================================================================
+--- git.orig/units/systemd-binfmt.service.in
++++ git/units/systemd-binfmt.service.in
+@@ -11,6 +11,8 @@
  Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
  DefaultDependencies=no
  Conflicts=shutdown.target
 +Wants=proc-sys-fs-binfmt_misc.automount
- After=systemd-readahead-collect.service systemd-readahead-replay.service proc-sys-fs-binfmt_misc.automount
++
+ After=proc-sys-fs-binfmt_misc.automount
  Before=sysinit.target shutdown.target
  ConditionPathIsReadWrite=/proc/sys/
-@@ -24,3 +25,6 @@ ConditionDirectoryNotEmpty=|/run/binfmt.d
+@@ -24,3 +26,6 @@
  Type=oneshot
  RemainAfterExit=yes
  ExecStart=@rootlibexecdir@/systemd-binfmt
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
index f8e19ce..28a9a34 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -9,11 +9,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/journal/journald-kmsg.c |   16 ++++++++++++++--
  2 files changed, 29 insertions(+), 3 deletions(-)
 
-diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
-index f2f1f35..092f87b 100644
---- a/src/journal/journal-file.c
-+++ b/src/journal/journal-file.c
-@@ -38,6 +38,8 @@
+Index: git/src/journal/journal-file.c
+===================================================================
+--- git.orig/src/journal/journal-file.c
++++ git/src/journal/journal-file.c
+@@ -35,6 +35,8 @@
  #include "compress.h"
  #include "fsprg.h"
  
@@ -22,7 +22,7 @@ index f2f1f35..092f87b 100644
  #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
  #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
  
-@@ -314,7 +316,7 @@ static int journal_file_verify_header(JournalFile *f) {
+@@ -314,7 +316,7 @@ static int journal_file_verify_header(Jo
  
  static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
          uint64_t old_size, new_size;
@@ -31,7 +31,7 @@ index f2f1f35..092f87b 100644
  
          assert(f);
  
-@@ -362,9 +364,21 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
+@@ -362,9 +364,21 @@ static int journal_file_allocate(Journal
          /* Note that the glibc fallocate() fallback is very
             inefficient, hence we try to minimize the allocation area
             as we can. */
@@ -53,10 +53,10 @@ index f2f1f35..092f87b 100644
  
          if (fstat(f->fd, &f->last_stat) < 0)
                  return -errno;
-diff --git a/src/journal/journald-kmsg.c b/src/journal/journald-kmsg.c
-index 12992e7..dc4fa93 100644
---- a/src/journal/journald-kmsg.c
-+++ b/src/journal/journald-kmsg.c
+Index: git/src/journal/journald-kmsg.c
+===================================================================
+--- git.orig/src/journal/journald-kmsg.c
++++ git/src/journal/journald-kmsg.c
 @@ -437,6 +437,7 @@ fail:
  int server_open_kernel_seqnum(Server *s) {
          _cleanup_close_ int fd;
@@ -65,28 +65,24 @@ index 12992e7..dc4fa93 100644
  
          assert(s);
  
-@@ -449,8 +450,19 @@ int server_open_kernel_seqnum(Server *s) {
-                 log_error("Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
+@@ -450,7 +451,19 @@ int server_open_kernel_seqnum(Server *s)
                  return 0;
          }
--
+ 
 -        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
 +#ifdef HAVE_POSIX_FALLOCATE
 +        r = posix_fallocate(fd, 0, sizeof(uint64_t));
 +#else
-+	/* Use good old method to write zeros into the journal file
-+	   perhaps very inefficient yet working. */
-+	char *buf = alloca(sizeof(uint64_t));
-+	off_t oldpos = lseek(fd, 0, SEEK_CUR);
-+	bzero(buf, sizeof(uint64_t));
-+	lseek(fd, 0, SEEK_SET);
-+	r = write(fd, buf, sizeof(uint64_t));
-+	lseek(fd, oldpos, SEEK_SET);
++        /* Use good old method to write zeros into the journal file
++           perhaps very inefficient yet working. */
++        char *buf = alloca(sizeof(uint64_t));
++        off_t oldpos = lseek(fd, 0, SEEK_CUR);
++        bzero(buf, sizeof(uint64_t));
++        lseek(fd, 0, SEEK_SET);
++        r = write(fd, buf, sizeof(uint64_t));
++        lseek(fd, oldpos, SEEK_SET);
 +#endif /* HAVE_POSIX_FALLOCATE */
-+	if (r < 0) {
-                 log_error("Failed to allocate sequential number file, ignoring: %m");
++        if (r < 0) {
+                 log_error_errno(errno, "Failed to allocate sequential number file, ignoring: %m");
                  return 0;
          }
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch b/meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
deleted file mode 100644
index 15645de..0000000
--- a/meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Dont include sys/sysinfo.h on uclibc it conflicts with linux/sysinfo.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate [uclibc specific]
-
-Index: systemd-209/src/readahead/readahead-common.c
-===================================================================
---- systemd-209.orig/src/readahead/readahead-common.c	2014-02-12 18:42:33.810685053 -0800
-+++ systemd-209/src/readahead/readahead-common.c	2014-02-19 23:49:31.856661142 -0800
-@@ -22,7 +22,9 @@
- #include <errno.h>
- #include <stdlib.h>
- #include <string.h>
-+#ifndef __UCLIBC__
- #include <sys/sysinfo.h>
-+#endif
- #include <sys/inotify.h>
- #include <fcntl.h>
- #include <sys/mman.h>
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_218.bb
similarity index 93%
rename from meta/recipes-core/systemd/systemd_216.bb
rename to meta/recipes-core/systemd/systemd_218.bb
index 569e88c..221c2cc 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_218.bb
@@ -1,6 +1,15 @@
-SUMMARY = "System and service manager for Linux, replacing SysVinit"
+SUMMARY = "A System and service manager"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 
+DESCRIPTION = "systemd is a system and service manager for Linux, compatible with \
+SysV and LSB init scripts. systemd provides aggressive parallelization \
+capabilities, uses socket and D-Bus activation for starting services, \
+offers on-demand starting of daemons, keeps track of processes using \
+Linux cgroups, supports snapshotting and restoring of the system \
+state, maintains mount and automount points and implements an \
+elaborate transactional dependency-based service control logic. It can \
+work as a drop-in replacement for sysvinit."
+
 LICENSE = "GPLv2 & LGPLv2.1 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
@@ -10,16 +19,16 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
-SRCREV = "5d0ae62c665262c4c55536457e84e278c252cc0b"
+SRCREV = "820aced6f6067a6b7c57b7d36e44f64378870cbf"
 
-PV = "216+git${SRCPV}"
+PV = "218+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
            file://binfmt-install.patch \
@@ -28,16 +37,10 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://systemd-pam-fix-fallocate.patch \
            file://systemd-pam-fix-mkostemp.patch \
            file://optional_secure_getenv.patch \
-           file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
            file://0001-add-support-for-executing-scripts-under-etc-rcS.d.patch \
-           file://0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch \
            file://0001-Make-root-s-home-directory-configurable.patch \
            file://0001-systemd-user-avoid-using-system-auth.patch \
-           file://0001-journal-Fix-navigating-backwards-missing-entries.patch \
-           file://0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch \
-           file://0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch \
-           file://0001-build-sys-configure-the-list-of-system-users-files-a.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
@@ -90,8 +93,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --enable-split-usr \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
-                 --with-firmware-path=/lib/firmware \
-                 ac_cv_path_KILL=${base_bindir}/kill \
                "
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
@@ -309,14 +310,7 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/scsi_id \
                ${rootlibexecdir}/udev/v4l_id \
                ${rootlibexecdir}/udev/keymaps \
-               ${rootlibexecdir}/udev/rules.d/4*.rules \
-               ${rootlibexecdir}/udev/rules.d/5*.rules \
-               ${rootlibexecdir}/udev/rules.d/6*.rules \
-               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
-               ${rootlibexecdir}/udev/rules.d/75*.rules \
-               ${rootlibexecdir}/udev/rules.d/78*.rules \
-               ${rootlibexecdir}/udev/rules.d/8*.rules \
-               ${rootlibexecdir}/udev/rules.d/95*.rules \
+               ${rootlibexecdir}/udev/rules.d/*.rules \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
-- 
1.7.10.4


