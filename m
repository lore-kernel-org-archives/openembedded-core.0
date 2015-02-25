Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE2572007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 02:48:35 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so1438935ieb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 18:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zD90uIe9qqzmRbmhVwnyHszMRhdEUxim8xvt6FBXGEA=;
	b=DfvR1zmic6kiUYni4WHGFCdnV4ilXAf12Eq7plEYbw7wYfgft1COyUMnRiS4nnCWJY
	EKshKCoC3qzu0CIAdsOO7UzZNC/NHu/suEEBsOkiBCuLEbkllNf+J9g6IPApEZ5LbfLc
	xAlnFe8z0K5rz0C5bVV0Whc6+xLNIJeIL1K9619YtISPXZOJnRvmeTbPi9lp0vMUJWBK
	rWMo+nJu1FbVgYCte/Pki87Eu3HIM/v/woWwqKIAcf7j1KQZuPjqj2mXyKRXmlEsDG+t
	xXPHgmBKqw/4BsZpNWRJAYDYUo6JDVVmNODBBtSHDHEegTklXIv1zcLO3eQzOBGR/7w6
	zzkQ==
X-Received: by 10.43.126.67 with SMTP id gv3mr1491611icc.31.1424832516313;
	Tue, 24 Feb 2015 18:48:36 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id z3sm9047272igl.1.2015.02.24.18.48.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Feb 2015 18:48:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 02:47:55 +0000
Message-Id: <1424832475-20806-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] systemd: Upgrade 218 -> 219
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
X-List-Received-Date: Wed, 25 Feb 2015 02:48:36 -0000

219 has been in the docks for sometime, the older patch got merged
this patch is now upgrading 218 to 219

Make all patches using git

Change-Id: Ib0350144592aba26cad56c13c9a5522515915c58
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-getty-to-agetty-in-console-setup-system.patch |  44 +++++++++
 ...ed-missing.h-fall-back-to-insecure-getenv.patch |  25 +++++
 ...t-install-dependency-links-at-install-tim.patch |  74 ++++++++++++++
 ...eck-for-additional-features-that-uclibc-.patch} |  26 ++++-
 ...n-Use-execvpe-only-when-libc-supports-it.patch} |  32 ++++--
 ...al-Use-posix-fallocate-only-if-available.patch} |  48 +++++----
 ...til-Use-mkostemp-only-if-libc-supports-it.patch |  42 ++++++++
 ...unimplemented-_SC_PHYS_PAGES-system-conf.patch} |  29 ++++--
 ...or-add-support-for-executing-scripts-und.patch} |  43 ++++----
 ...-Make-root-s-home-directory-configurable.patch} | 108 +++++++++++----------
 ...011-systemd-user-avoid-using-system-auth.patch} |  12 ++-
 .../systemd/systemd/binfmt-install.patch           |  57 -----------
 .../systemd/systemd/optional_secure_getenv.patch   |  19 ----
 .../systemd/systemd-pam-fix-getty-unit.patch       |  35 -------
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  30 ------
 .../systemd/{systemd_218.bb => systemd_219.bb}     |  37 ++++---
 16 files changed, 384 insertions(+), 277 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch
 rename meta/recipes-core/systemd/systemd/{systemd-pam-configure-check-uclibc.patch => 0004-configure-Check-for-additional-features-that-uclibc-.patch} (57%)
 rename meta/recipes-core/systemd/systemd/{systemd-pam-fix-execvpe.patch => 0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch} (54%)
 rename meta/recipes-core/systemd/systemd/{systemd-pam-fix-fallocate.patch => 0006-journal-Use-posix-fallocate-only-if-available.patch} (65%)
 create mode 100644 meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
 rename meta/recipes-core/systemd/systemd/{uclibc-get-physmem.patch => 0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch} (58%)
 rename meta/recipes-core/systemd/systemd/{0001-add-support-for-executing-scripts-under-etc-rcS.d.patch => 0009-sysv-generator-add-support-for-executing-scripts-und.patch} (84%)
 rename meta/recipes-core/systemd/systemd/{0001-Make-root-s-home-directory-configurable.patch => 0010-Make-root-s-home-directory-configurable.patch} (67%)
 rename meta/recipes-core/systemd/systemd/{0001-systemd-user-avoid-using-system-auth.patch => 0011-systemd-user-avoid-using-system-auth.patch} (71%)
 delete mode 100644 meta/recipes-core/systemd/systemd/binfmt-install.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 rename meta/recipes-core/systemd/{systemd_218.bb => systemd_219.bb} (92%)

diff --git a/meta/recipes-core/systemd/systemd/0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch b/meta/recipes-core/systemd/systemd/0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch
new file mode 100644
index 0000000..b6ab5ef
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch
@@ -0,0 +1,44 @@
+From 100e50604efc4032001a2de6a6b47853c0003817 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:29:15 +0000
+Subject: [PATCH 01/11] units: Prefer getty to agetty in console setup systemd
+ units
+
+Upstream-Status: Inappropriate [configuration specific]
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ units/getty@.service.m4        | 2 +-
+ units/serial-getty@.service.m4 | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/units/getty@.service.m4 b/units/getty@.service.m4
+index 46164ab..bdf6ec8 100644
+--- a/units/getty@.service.m4
++++ b/units/getty@.service.m4
+@@ -27,7 +27,7 @@ ConditionPathExists=/dev/tty0
+ 
+ [Service]
+ # the VT is cleared by TTYVTDisallocate
+-ExecStart=-/sbin/agetty --noclear %I $TERM
++ExecStart=-/sbin/getty -L %I $TERM
+ Type=idle
+ Restart=always
+ RestartSec=0
+diff --git a/units/serial-getty@.service.m4 b/units/serial-getty@.service.m4
+index 4522d0d..e6d499d 100644
+--- a/units/serial-getty@.service.m4
++++ b/units/serial-getty@.service.m4
+@@ -22,7 +22,7 @@ Before=getty.target
+ IgnoreOnIsolate=yes
+ 
+ [Service]
+-ExecStart=-/sbin/agetty --keep-baud 115200,38400,9600 %I $TERM
++ExecStart=-/sbin/getty -L 115200 %I $TERM
+ Type=idle
+ Restart=always
+ UtmpIdentifier=%I
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch b/meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
new file mode 100644
index 0000000..1cf7840
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
@@ -0,0 +1,25 @@
+From 03baade6db2cf83b44a157818ba827d725449bb0 Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Thu, 18 Sep 2014 15:24:47 +0200
+Subject: [PATCH 02/11] shared/missing.h: fall back to insecure getenv
+
+---
+ src/shared/missing.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index b33a70c..11cca04 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -366,7 +366,7 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+ #  ifdef HAVE___SECURE_GETENV
+ #    define secure_getenv __secure_getenv
+ #  else
+-#    error "neither secure_getenv nor __secure_getenv are available"
++#    define secure_getenv getenv
+ #  endif
+ #endif
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch
new file mode 100644
index 0000000..c14cc6f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -0,0 +1,74 @@
+From 184a89caacfa00f07e7275bca592bd7dda1b541e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:03:44 +0000
+Subject: [PATCH 03/11] binfmt: Don't install dependency links at install time
+ for the binfmt services
+
+use [Install] blocks so that they get created when the service is enabled
+like a traditional service.
+
+The [Install] blocks were rejected upstream as they don't have a way to
+"enable"
+it on install without static symlinks which can't be disabled, only
+masked.  We
+however can do that in a postinst.
+
+Upstream-Status: Denied
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am                             | 4 ----
+ units/proc-sys-fs-binfmt_misc.automount | 3 +++
+ units/systemd-binfmt.service.in         | 5 +++++
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ba63f68..0fb3f9f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4838,10 +4838,6 @@ INSTALL_DIRS += \
+ 	$(prefix)/lib/binfmt.d \
+ 	$(sysconfdir)/binfmt.d
+ 
+-SYSINIT_TARGET_WANTS += \
+-	systemd-binfmt.service \
+-	proc-sys-fs-binfmt_misc.automount
+-
+ endif
+ 
+ EXTRA_DIST += \
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
+index 6be3893..709adef 100644
+--- a/units/proc-sys-fs-binfmt_misc.automount
++++ b/units/proc-sys-fs-binfmt_misc.automount
+@@ -16,3 +16,6 @@ ConditionPathIsReadWrite=/proc/sys/
+ 
+ [Automount]
+ Where=/proc/sys/fs/binfmt_misc
++
++[Install]
++WantedBy=sysinit.target
+diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
+index 34a5d52..617462b 100644
+--- a/units/systemd-binfmt.service.in
++++ b/units/systemd-binfmt.service.in
+@@ -11,6 +11,8 @@ Documentation=man:systemd-binfmt.service(8) man:binfmt.d(5)
+ Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
+ DefaultDependencies=no
+ Conflicts=shutdown.target
++Wants=proc-sys-fs-binfmt_misc.automount
++
+ After=proc-sys-fs-binfmt_misc.automount
+ Before=sysinit.target shutdown.target
+ ConditionPathIsReadWrite=/proc/sys/
+@@ -24,3 +26,6 @@ ConditionDirectoryNotEmpty=|/run/binfmt.d
+ Type=oneshot
+ RemainAfterExit=yes
+ ExecStart=@rootlibexecdir@/systemd-binfmt
++
++[Install]
++WantedBy=sysinit.target
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch b/meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch
similarity index 57%
rename from meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
rename to meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch
index 4639532..dddb7da 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
+++ b/meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch
@@ -1,11 +1,24 @@
+From 4e2e8dbf3f23ab7dca32286cc0f37bff6ac49e22 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:05:45 +0000
+Subject: [PATCH 04/11] configure: Check for additional features that uclibc
+ doesnt support
+
+This helps in supporting uclibc which does not have all features that
+glibc might have
+
 Upstream-Status: Denied [no desire for uclibc support]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2014-03-15 17:53:51.756340454 -0700
-+++ git/configure.ac	2014-03-15 18:07:34.888355897 -0700
-@@ -78,6 +78,24 @@
+diff --git a/configure.ac b/configure.ac
+index 9a2235b..a5b2e6e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -103,6 +103,24 @@ AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't s
  
  M4_DEFINES=
  
@@ -30,3 +43,6 @@ Index: git/configure.ac
  # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
  m4_ifdef([GTK_DOC_CHECK], [
  GTK_DOC_CHECK([1.18],[--flavour no-tmpl])],
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch b/meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch
similarity index 54%
rename from meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
rename to meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch
index 7170a38..85279d6 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
+++ b/meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch
@@ -1,20 +1,29 @@
+From a7417c2e6950d55c22c1b0d15783898b8ff229ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:10:37 +0000
+Subject: [PATCH 05/11] nspawn: Use execvpe only when libc supports it
+
 Upstream-Status: Denied [no desire for uclibc support]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nspawn/nspawn.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
-Index: systemd-209/src/nspawn/nspawn.c
-===================================================================
---- systemd-209.orig/src/nspawn/nspawn.c	2014-02-19 15:03:09.000000000 -0800
-+++ systemd-209/src/nspawn/nspawn.c	2014-02-19 23:20:38.720628627 -0800
-@@ -91,6 +91,8 @@
-         LINK_GUEST
- } LinkJournal;
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 0d8d199..b597edb 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -129,6 +129,8 @@ typedef enum Volatile {
+         VOLATILE_STATE,
+ } Volatile;
  
 +#include "config.h"
 +
  static char *arg_directory = NULL;
+ static char *arg_template = NULL;
  static char *arg_user = NULL;
- static sd_id128_t arg_uuid = {};
-@@ -2045,7 +2047,12 @@
+@@ -4257,7 +4259,12 @@ int main(int argc, char *argv[]) {
                                  a[0] = (char*) "/sbin/init";
                                  execve(a[0], a, env_use);
                          } else if (argc > optind)
@@ -23,7 +32,10 @@ Index: systemd-209/src/nspawn/nspawn.c
 +#else
 +                                environ = env_use;
 +                                execvp(argv[optind], argv + optind);
-+#endif /* HAVE_EXECVPE */                      
++#endif /* HAVE_EXECVPE */
                          else {
                                  chdir(home ? home : "/root");
                                  execle("/bin/bash", "-bash", NULL, env_use);
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch
similarity index 65%
rename from meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
rename to meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch
index 28a9a34..631dd77 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch
@@ -1,19 +1,24 @@
-Upstream-Status: Denied [no desire for uclibc support]
+From 34a61b6c9eed3fad360066fb63132ebc7e0aaaa6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:12:48 +0000
+Subject: [PATCH 06/11] journal: Use posix fallocate only if available
+
+Some architecture ports in uclibc did not support it in past
 
-This patch is uclibc specific, thus not suitable for upstream.
+Upstream-Status: Denied [no desire for uclibc support]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/journal/journal-file.c  |   16 +++++++++++++++-
- src/journal/journald-kmsg.c |   16 ++++++++++++++--
- 2 files changed, 29 insertions(+), 3 deletions(-)
+ src/journal/journal-file.c  | 16 +++++++++++++++-
+ src/journal/journald-kmsg.c | 15 ++++++++++++++-
+ 2 files changed, 29 insertions(+), 2 deletions(-)
 
-Index: git/src/journal/journal-file.c
-===================================================================
---- git.orig/src/journal/journal-file.c
-+++ git/src/journal/journal-file.c
-@@ -35,6 +35,8 @@
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index 2845e05..9431171 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -36,6 +36,8 @@
  #include "compress.h"
  #include "fsprg.h"
  
@@ -22,7 +27,7 @@ Index: git/src/journal/journal-file.c
  #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
  #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
  
-@@ -314,7 +316,7 @@ static int journal_file_verify_header(Jo
+@@ -354,7 +356,7 @@ static int journal_file_fstat(JournalFile *f) {
  
  static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
          uint64_t old_size, new_size;
@@ -31,7 +36,7 @@ Index: git/src/journal/journal-file.c
  
          assert(f);
  
-@@ -362,9 +364,21 @@ static int journal_file_allocate(Journal
+@@ -418,9 +420,21 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
          /* Note that the glibc fallocate() fallback is very
             inefficient, hence we try to minimize the allocation area
             as we can. */
@@ -51,13 +56,13 @@ Index: git/src/journal/journal-file.c
 +
 +#endif /* HAVE_POSIX_FALLOCATE */
  
-         if (fstat(f->fd, &f->last_stat) < 0)
-                 return -errno;
-Index: git/src/journal/journald-kmsg.c
-===================================================================
---- git.orig/src/journal/journald-kmsg.c
-+++ git/src/journal/journald-kmsg.c
-@@ -437,6 +437,7 @@ fail:
+         f->header->arena_size = htole64(new_size - le64toh(f->header->header_size));
+ 
+diff --git a/src/journal/journald-kmsg.c b/src/journal/journald-kmsg.c
+index c4216c4..a998ed5 100644
+--- a/src/journal/journald-kmsg.c
++++ b/src/journal/journald-kmsg.c
+@@ -436,6 +436,7 @@ fail:
  int server_open_kernel_seqnum(Server *s) {
          _cleanup_close_ int fd;
          uint64_t *p;
@@ -65,7 +70,7 @@ Index: git/src/journal/journald-kmsg.c
  
          assert(s);
  
-@@ -450,7 +451,19 @@ int server_open_kernel_seqnum(Server *s)
+@@ -449,7 +450,19 @@ int server_open_kernel_seqnum(Server *s) {
                  return 0;
          }
  
@@ -86,3 +91,6 @@ Index: git/src/journal/journald-kmsg.c
                  log_error_errno(errno, "Failed to allocate sequential number file, ignoring: %m");
                  return 0;
          }
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
new file mode 100644
index 0000000..29c20c0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
@@ -0,0 +1,42 @@
+From f771407d3e0288ca0c06a894194d3ddad69b9a8e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:17:05 +0000
+Subject: [PATCH 07/11] util: Use mkostemp only if libc supports it
+
+Upstream-Status: Denied [no desire for uclibc support]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/util.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/shared/util.c b/src/shared/util.c
+index dc65280..72f4665 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -97,6 +97,8 @@
+ #include "def.h"
+ #include "sparse-endian.h"
+ 
++#include "config.h"
++
+ int saved_argc = 0;
+ char **saved_argv = NULL;
+ 
+@@ -6682,7 +6684,13 @@ int mkostemp_safe(char *pattern, int flags) {
+ 
+         u = umask(077);
+ 
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(pattern, flags);
++#else
++        fd = mkstemp(pattern);
++        if (fd >= 0) fcntl(fd, F_SETFD, flags);
++#endif /* HAVE_MKOSTEMP */
++
+         if (fd < 0)
+                 return -errno;
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/uclibc-get-physmem.patch b/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
similarity index 58%
rename from meta/recipes-core/systemd/systemd/uclibc-get-physmem.patch
rename to meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
index 39dfc9e..5297625 100644
--- a/meta/recipes-core/systemd/systemd/uclibc-get-physmem.patch
+++ b/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
@@ -1,18 +1,24 @@
-bypass unimplemented _SC_PHYS_PAGES system configuration API in uclibc
+From b45ea3bfd6635744c8a6b74d0ac701b44bb1d294 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:19:37 +0000
+Subject: [PATCH 08/11] util: bypass unimplemented _SC_PHYS_PAGES system
+ configuration API on uclibc
 
 Upstream-Status: Inappropriate [uclibc-specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/util.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
 
-Index: git/src/shared/util.c
-===================================================================
---- git.orig/src/shared/util.c	2014-03-15 18:09:34.796358146 -0700
-+++ git/src/shared/util.c	2014-03-15 20:16:33.836501084 -0700
-@@ -6332,11 +6332,24 @@
- 
+diff --git a/src/shared/util.c b/src/shared/util.c
+index 72f4665..cbbe3b1 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -6793,10 +6793,25 @@ uint64_t physical_memory(void) {
          /* We return this as uint64_t in case we are running as 32bit
           * process on a 64bit kernel with huge amounts of memory */
--
+ 
 +#ifdef __UCLIBC__
 +        char line[128];
 +        FILE *f = fopen("/proc/meminfo", "r");
@@ -29,9 +35,12 @@ Index: git/src/shared/util.c
 +#else
          mem = sysconf(_SC_PHYS_PAGES);
          assert(mem > 0);
--
+ 
          return (uint64_t) mem * (uint64_t) page_size();
 +#endif
  }
  
- char* mount_test_option(const char *haystack, const char *needle) {
+ void hexdump(FILE *f, const void *p, size_t s) {
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch b/meta/recipes-core/systemd/systemd/0009-sysv-generator-add-support-for-executing-scripts-und.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
rename to meta/recipes-core/systemd/systemd/0009-sysv-generator-add-support-for-executing-scripts-und.patch
index 9aa07c1..9ea3e83 100644
--- a/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
+++ b/meta/recipes-core/systemd/systemd/0009-sysv-generator-add-support-for-executing-scripts-und.patch
@@ -1,20 +1,25 @@
-Upstream-Status: Inappropriate [OE specific]
-
-Subject: add support for executing scripts under /etc/rcS.d/
+From 8791b5b3934c55694872b6915a67340683ead91b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:22:52 +0000
+Subject: [PATCH 09/11] sysv-generator: add support for executing scripts under
+ /etc/rcS.d/
 
 To be compatible, all services translated from scripts under /etc/rcS.d would
 run before services translated from scripts under /etc/rcN.d.
 
+Upstream-Status: Inappropriate [OE specific]
+
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/sysv-generator/sysv-generator.c | 50 ++++++++++++++++++++++++++++---------
  1 file changed, 38 insertions(+), 12 deletions(-)
 
 diff --git a/src/sysv-generator/sysv-generator.c b/src/sysv-generator/sysv-generator.c
-index 9a869ba..10c55c0 100644
+index bd67f32..6756cc6 100644
 --- a/src/sysv-generator/sysv-generator.c
 +++ b/src/sysv-generator/sysv-generator.c
-@@ -43,7 +43,8 @@
+@@ -42,7 +42,8 @@
  
  typedef enum RunlevelType {
          RUNLEVEL_UP,
@@ -24,9 +29,9 @@ index 9a869ba..10c55c0 100644
  } RunlevelType;
  
  static const struct {
-@@ -58,6 +59,9 @@ static const struct {
-         { "rc4.d",  SPECIAL_RUNLEVEL4_TARGET, RUNLEVEL_UP },
-         { "rc5.d",  SPECIAL_RUNLEVEL5_TARGET, RUNLEVEL_UP },
+@@ -57,6 +58,9 @@ static const struct {
+         { "rc4.d",  SPECIAL_MULTI_USER_TARGET, RUNLEVEL_UP },
+         { "rc5.d",  SPECIAL_GRAPHICAL_TARGET,  RUNLEVEL_UP },
  
 +        /* Debian style rcS.d, also adopted by OE */
 +        { "rcS.d",  SPECIAL_SYSINIT_TARGET,   RUNLEVEL_SYSINIT},
@@ -34,7 +39,7 @@ index 9a869ba..10c55c0 100644
          /* Standard SysV runlevels for shutdown */
          { "rc0.d",  SPECIAL_POWEROFF_TARGET,  RUNLEVEL_DOWN },
          { "rc6.d",  SPECIAL_REBOOT_TARGET,    RUNLEVEL_DOWN }
-@@ -66,7 +70,7 @@ static const struct {
+@@ -65,7 +69,7 @@ static const struct {
             directories in this order, and we want to make sure that
             sysv_start_priority is known when we first load the
             unit. And that value we only know from S links. Hence
@@ -43,7 +48,7 @@ index 9a869ba..10c55c0 100644
  };
  
  typedef struct SysvStub {
-@@ -82,6 +86,8 @@ typedef struct SysvStub {
+@@ -81,6 +85,8 @@ typedef struct SysvStub {
          char **conflicts;
          bool has_lsb;
          bool reload;
@@ -52,7 +57,7 @@ index 9a869ba..10c55c0 100644
  } SysvStub;
  
  const char *arg_dest = "/tmp";
-@@ -156,6 +162,9 @@ static int generate_unit_file(SysvStub *s) {
+@@ -183,6 +189,9 @@ static int generate_unit_file(SysvStub *s) {
                  "Description=%s\n",
                  s->path, s->description);
  
@@ -62,7 +67,7 @@ index 9a869ba..10c55c0 100644
          if (!isempty(before))
                  fprintf(f, "Before=%s\n", before);
          if (!isempty(after))
-@@ -661,18 +670,30 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
+@@ -704,18 +713,30 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
                  if (s->has_lsb && other->has_lsb)
                          continue;
  
@@ -101,7 +106,7 @@ index 9a869ba..10c55c0 100644
  
                  /* FIXME: Maybe we should compare the name here lexicographically? */
          }
-@@ -725,6 +746,8 @@ static int enumerate_sysv(LookupPaths lp, Hashmap *all_services) {
+@@ -778,6 +799,8 @@ static int enumerate_sysv(LookupPaths lp, Hashmap *all_services) {
                                  return log_oom();
  
                          service->sysv_start_priority = -1;
@@ -110,7 +115,7 @@ index 9a869ba..10c55c0 100644
                          service->name = name;
                          service->path = fpath;
  
-@@ -810,9 +833,11 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
+@@ -864,9 +887,11 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
  
                                  if (de->d_name[0] == 'S')  {
  
@@ -122,8 +127,8 @@ index 9a869ba..10c55c0 100644
 +                                                service->from_rcsd = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?true:false;
                                          }
  
-                                         r = set_ensure_allocated(&runlevel_services[i],
-@@ -825,7 +850,8 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
+                                         r = set_ensure_allocated(&runlevel_services[i], NULL);
+@@ -878,7 +903,8 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
                                                  goto finish;
  
                                  } else if (de->d_name[0] == 'K' &&
@@ -131,8 +136,8 @@ index 9a869ba..10c55c0 100644
 +                                           (rcnd_table[i].type == RUNLEVEL_DOWN ||
 +                                            rcnd_table[i].type == RUNLEVEL_SYSINIT)) {
  
-                                         r = set_ensure_allocated(&shutdown_services,
-                                                                  trivial_hash_func, trivial_compare_func);
+                                         r = set_ensure_allocated(&shutdown_services, NULL);
+                                         if (r < 0)
 -- 
-1.9.1
+2.1.4
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
similarity index 67%
rename from meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
rename to meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
index a86c841..41b9039 100644
--- a/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
@@ -1,7 +1,7 @@
-From 4dc8dee0435bb63cbe474004b0a8df0363fe94dd Mon Sep 17 00:00:00 2001
-From: Dan McGregor <dan.mcgregor@usask.ca>
-Date: Fri, 5 Sep 2014 06:28:58 -0600
-Subject: [PATCH] Make root's home directory configurable.
+From 3dc731c1d270e2e143de621db9bd898299fd849d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:24:49 +0000
+Subject: [PATCH 10/11] Make root's home directory configurable
 
 OpenEmbedded has a configurable home directory for root. Allow
 systemd to be built using its idea of what root's home directory
@@ -10,6 +10,7 @@ should be.
 Upstream-Status: Pending
 
 Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.am                       | 2 ++
  configure.ac                      | 7 +++++++
@@ -18,14 +19,14 @@ Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
  src/shared/util.c                 | 4 ++--
  units/console-shell.service.m4.in | 4 ++--
  units/emergency.service.in        | 4 ++--
- units/rescue.service.m4.in        | 4 ++--
+ units/rescue.service.in           | 4 ++--
  8 files changed, 20 insertions(+), 11 deletions(-)
 
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -195,6 +195,7 @@ AM_CPPFLAGS = \
+diff --git a/Makefile.am b/Makefile.am
+index 0fb3f9f..4623963 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -199,6 +199,7 @@ AM_CPPFLAGS = \
  	-DKEXEC=\"$(KEXEC)\" \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
@@ -33,7 +34,7 @@ Index: git/Makefile.am
  	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
  	-I $(top_builddir)/src/shared \
-@@ -5830,6 +5831,7 @@ EXTRA_DIST += \
+@@ -6342,6 +6343,7 @@ EXTRA_DIST += \
  substitutions = \
         '|rootlibexecdir=$(rootlibexecdir)|' \
         '|rootbindir=$(rootbindir)|' \
@@ -41,11 +42,11 @@ Index: git/Makefile.am
         '|bindir=$(bindir)|' \
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -1310,6 +1310,11 @@ AC_ARG_WITH([rootlibdir],
+diff --git a/configure.ac b/configure.ac
+index a5b2e6e..55bb7d8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1428,6 +1428,11 @@ AC_ARG_WITH([rootlibdir],
          [],
          [with_rootlibdir=${libdir}])
  
@@ -57,7 +58,7 @@ Index: git/configure.ac
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1362,6 +1367,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+@@ -1518,6 +1523,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
  AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
@@ -65,7 +66,7 @@ Index: git/configure.ac
  
  AC_CONFIG_FILES([
          Makefile po/Makefile.in
-@@ -1446,6 +1452,7 @@ AC_MSG_RESULT([
+@@ -1617,6 +1623,7 @@ AC_MSG_RESULT([
          include_prefix:          ${INCLUDE_PREFIX}
          lib dir:                 ${libdir}
          rootlib dir:             ${with_rootlibdir}
@@ -73,11 +74,11 @@ Index: git/configure.ac
          SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
-Index: git/src/core/unit-printf.c
-===================================================================
---- git.orig/src/core/unit-printf.c
-+++ git/src/core/unit-printf.c
-@@ -259,7 +259,7 @@ static int specifier_user_home(char spec
+diff --git a/src/core/unit-printf.c b/src/core/unit-printf.c
+index 97135db..14d12f1 100644
+--- a/src/core/unit-printf.c
++++ b/src/core/unit-printf.c
+@@ -259,7 +259,7 @@ static int specifier_user_home(char specifier, void *data, void *userdata, char
                   * best of it if we can, but fail if we can't */
  
                  if (!c->user || streq(c->user, "root") || streq(c->user, "0"))
@@ -86,11 +87,11 @@ Index: git/src/core/unit-printf.c
                  else
                          return -ENOTSUP;
  
-Index: git/src/nspawn/nspawn.c
-===================================================================
---- git.orig/src/nspawn/nspawn.c
-+++ git/src/nspawn/nspawn.c
-@@ -3183,7 +3183,7 @@ int main(int argc, char *argv[]) {
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index b597edb..0b32673 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -4192,7 +4192,7 @@ int main(int argc, char *argv[]) {
                          if (r < 0)
                                  _exit(EXIT_FAILURE);
  
@@ -99,20 +100,20 @@ Index: git/src/nspawn/nspawn.c
                              (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
                              (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0)) {
                                  log_oom();
-@@ -3278,7 +3278,7 @@ int main(int argc, char *argv[]) {
+@@ -4266,7 +4266,7 @@ int main(int argc, char *argv[]) {
                                  execvp(argv[optind], argv + optind);
- #endif /* HAVE_EXECVPE */                      
+ #endif /* HAVE_EXECVPE */
                          else {
 -                                chdir(home ? home : "/root");
 +                                chdir(home ? home : ROOTHOMEDIR);
                                  execle("/bin/bash", "-bash", NULL, env_use);
                                  execle("/bin/sh", "-sh", NULL, env_use);
                          }
-Index: git/src/shared/util.c
-===================================================================
---- git.orig/src/shared/util.c
-+++ git/src/shared/util.c
-@@ -4523,7 +4523,7 @@ int get_user_creds(
+diff --git a/src/shared/util.c b/src/shared/util.c
+index cbbe3b1..a0e3cc5 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -4609,7 +4609,7 @@ int get_user_creds(
                          *gid = 0;
  
                  if (home)
@@ -121,7 +122,7 @@ Index: git/src/shared/util.c
  
                  if (shell)
                          *shell = "/bin/sh";
-@@ -5491,7 +5491,7 @@ int get_home_dir(char **_h) {
+@@ -5611,7 +5611,7 @@ int get_home_dir(char **_h) {
          /* Hardcode home directory for root to avoid NSS */
          u = getuid();
          if (u == 0) {
@@ -130,10 +131,10 @@ Index: git/src/shared/util.c
                  if (!h)
                          return -ENOMEM;
  
-Index: git/units/console-shell.service.m4.in
-===================================================================
---- git.orig/units/console-shell.service.m4.in
-+++ git/units/console-shell.service.m4.in
+diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
+index 5c80722..efde5f0 100644
+--- a/units/console-shell.service.m4.in
++++ b/units/console-shell.service.m4.in
 @@ -15,8 +15,8 @@ After=rc-local.service
  Before=getty.target
  
@@ -142,13 +143,13 @@ Index: git/units/console-shell.service.m4.in
 -WorkingDirectory=/root
 +Environment=HOME=@roothomedir@
 +WorkingDirectory=@roothomedir@
- ExecStart=-/sbin/sulogin
+ ExecStart=-@SULOGIN@
  ExecStopPost=-@SYSTEMCTL@ poweroff
  Type=idle
-Index: git/units/emergency.service.in
-===================================================================
---- git.orig/units/emergency.service.in
-+++ git/units/emergency.service.in
+diff --git a/units/emergency.service.in b/units/emergency.service.in
+index 2695d7b..7f47b73 100644
+--- a/units/emergency.service.in
++++ b/units/emergency.service.in
 @@ -14,8 +14,8 @@ Conflicts=rescue.service
  Before=shutdown.target
  
@@ -159,12 +160,12 @@ Index: git/units/emergency.service.in
 +WorkingDirectory=@roothomedir@
  ExecStartPre=-/bin/plymouth quit
  ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
- ExecStart=-/bin/sh -c "/sbin/sulogin; @SYSTEMCTL@ --fail --no-block default"
-Index: git/units/rescue.service.in
-===================================================================
---- git.orig/units/rescue.service.in
-+++ git/units/rescue.service.in
-@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.serv
+ ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --fail --no-block default"
+diff --git a/units/rescue.service.in b/units/rescue.service.in
+index de73fee..47f3593 100644
+--- a/units/rescue.service.in
++++ b/units/rescue.service.in
+@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
  Before=shutdown.target
  
  [Service]
@@ -174,4 +175,7 @@ Index: git/units/rescue.service.in
 +WorkingDirectory=@roothomedir@
  ExecStartPre=-/bin/plymouth quit
  ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
- ExecStart=-/bin/sh -c "/sbin/sulogin; @SYSTEMCTL@ --fail --no-block default"
+ ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --fail --no-block default"
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd/0001-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0011-systemd-user-avoid-using-system-auth.patch
similarity index 71%
rename from meta/recipes-core/systemd/systemd/0001-systemd-user-avoid-using-system-auth.patch
rename to meta/recipes-core/systemd/systemd/0011-systemd-user-avoid-using-system-auth.patch
index 97701f7..e562bca 100644
--- a/meta/recipes-core/systemd/systemd/0001-systemd-user-avoid-using-system-auth.patch
+++ b/meta/recipes-core/systemd/systemd/0011-systemd-user-avoid-using-system-auth.patch
@@ -1,11 +1,15 @@
-Upstream-Status: Inappropriate [oe specific]
-
-Subject: systemd-user: avoid using system-auth
+From 7e202f71785bf5a67c8a4f6b58d3585608fbfdc4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 05:26:25 +0000
+Subject: [PATCH 11/11] systemd-user: avoid using system-auth
 
 In OE, we don't provide system-auth, instead, we use common-* files.
 So modify systemd-user file to use common-* files.
 
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/login/systemd-user | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -23,5 +27,5 @@ index 8112d74..99635af 100644
 +account  include common-account
 +session  include common-session
 -- 
-1.9.1
+2.1.4
 
diff --git a/meta/recipes-core/systemd/systemd/binfmt-install.patch b/meta/recipes-core/systemd/systemd/binfmt-install.patch
deleted file mode 100644
index 93b8e3c..0000000
--- a/meta/recipes-core/systemd/systemd/binfmt-install.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Don't install dependency links at install time for the binfmt services, use
-[Install] blocks so that they get created when the service is enabled like a
-traditional service.
-
-The [Install] blocks were rejected upstream as they don't have a way to "enable"
-it on install without static symlinks which can't be disabled, only masked.  We
-however can do that in a postinst.
-
-Upstream-Status: Denied
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -4495,10 +4495,6 @@
- 	$(prefix)/lib/binfmt.d \
- 	$(sysconfdir)/binfmt.d
- 
--SYSINIT_TARGET_WANTS += \
--	systemd-binfmt.service \
--	proc-sys-fs-binfmt_misc.automount
--
- endif
- 
- EXTRA_DIST += \
-Index: git/units/proc-sys-fs-binfmt_misc.automount
-===================================================================
---- git.orig/units/proc-sys-fs-binfmt_misc.automount
-+++ git/units/proc-sys-fs-binfmt_misc.automount
-@@ -16,3 +16,6 @@
- 
- [Automount]
- Where=/proc/sys/fs/binfmt_misc
-+
-+[Install]
-+WantedBy=sysinit.target
-Index: git/units/systemd-binfmt.service.in
-===================================================================
---- git.orig/units/systemd-binfmt.service.in
-+++ git/units/systemd-binfmt.service.in
-@@ -11,6 +11,8 @@
- Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
- DefaultDependencies=no
- Conflicts=shutdown.target
-+Wants=proc-sys-fs-binfmt_misc.automount
-+
- After=proc-sys-fs-binfmt_misc.automount
- Before=sysinit.target shutdown.target
- ConditionPathIsReadWrite=/proc/sys/
-@@ -24,3 +26,6 @@
- Type=oneshot
- RemainAfterExit=yes
- ExecStart=@rootlibexecdir@/systemd-binfmt
-+
-+[Install]
-+WantedBy=sysinit.target
diff --git a/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch b/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
deleted file mode 100644
index 2063268..0000000
--- a/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-on uclibc secure_getenv is not available
-therefore default to using getenv instead
-
-Upstream-Status: Denied [no desire for uclibc support]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/src/shared/missing.h
-===================================================================
---- git.orig/src/shared/missing.h	2012-09-22 18:46:44.141282145 -0700
-+++ git/src/shared/missing.h	2012-09-22 18:48:44.081276570 -0700
-@@ -233,6 +233,8 @@
- #ifndef HAVE_SECURE_GETENV
- #  ifdef HAVE___SECURE_GETENV
- #    define secure_getenv __secure_getenv
-+#  elif defined __UCLIBC__
-+#    define secure_getenv getenv
- #  else
- #    error neither secure_getenv nor __secure_getenv are available
- #  endif
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
deleted file mode 100644
index 9b4c940..0000000
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Prefer getty to agetty in console setup systemd units
-
-Upstream-Status: Inappropriate [configuration specific]
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- units/getty@.service.m4        |    2 +-
- units/serial-getty@.service.m4 |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: git/units/getty@.service.m4
-===================================================================
---- git.orig/units/getty@.service.m4	2014-03-15 08:16:17.000000000 -0700
-+++ git/units/getty@.service.m4	2014-03-15 08:21:11.007695825 -0700
-@@ -27,7 +27,7 @@
- 
- [Service]
- # the VT is cleared by TTYVTDisallocate
--ExecStart=-/sbin/agetty --noclear %I $TERM
-+ExecStart=-/sbin/getty -L %I $TERM
- Type=idle
- Restart=always
- RestartSec=0
-Index: git/units/serial-getty@.service.m4
-===================================================================
---- git.orig/units/serial-getty@.service.m4	2014-03-15 08:16:17.000000000 -0700
-+++ git/units/serial-getty@.service.m4	2014-03-15 08:22:31.291697331 -0700
-@@ -22,7 +22,7 @@
- IgnoreOnIsolate=yes
- 
- [Service]
--ExecStart=-/sbin/agetty --keep-baud 115200,38400,9600 %I $TERM
-+ExecStart=-/sbin/getty -L 115200 %I $TERM
- Type=idle
- Restart=always
- RestartSec=0
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
deleted file mode 100644
index 8c7aa07..0000000
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Denied [no desire for uclibc support]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/src/shared/util.c
-===================================================================
---- git.orig/src/shared/util.c	2014-03-15 15:14:21.368160908 -0700
-+++ git/src/shared/util.c	2014-03-15 15:44:21.988194688 -0700
-@@ -85,6 +85,8 @@
- #include "def.h"
- #include "missing.h"
- 
-+#include "config.h"
-+
- int saved_argc = 0;
- char **saved_argv = NULL;
- 
-@@ -6222,7 +6224,13 @@
- 
-         u = umask(077);
- 
-+#ifdef HAVE_MKOSTEMP
-         fd = mkostemp(pattern, flags);
-+#else
-+        fd = mkstemp(pattern);
-+        if (fd >= 0) fcntl(fd, F_SETFD, flags);
-+#endif /* HAVE_MKOSTEMP */
-+
-         if (fd < 0)
-                 return -errno;
- 
diff --git a/meta/recipes-core/systemd/systemd_218.bb b/meta/recipes-core/systemd/systemd_219.bb
similarity index 92%
rename from meta/recipes-core/systemd/systemd_218.bb
rename to meta/recipes-core/systemd/systemd_219.bb
index 221c2cc..4859304 100644
--- a/meta/recipes-core/systemd/systemd_218.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -19,28 +19,28 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux-libs"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
-SRCREV = "820aced6f6067a6b7c57b7d36e44f64378870cbf"
+SRCREV = "a88abde72169ddc2df77df3fa5bed30725022253"
 
-PV = "218+git${SRCPV}"
+PV = "219+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
-           file://binfmt-install.patch \
-           file://systemd-pam-configure-check-uclibc.patch \
-           file://systemd-pam-fix-execvpe.patch \
-           file://systemd-pam-fix-fallocate.patch \
-           file://systemd-pam-fix-mkostemp.patch \
-           file://optional_secure_getenv.patch \
-           file://uclibc-get-physmem.patch \
-           file://0001-add-support-for-executing-scripts-under-etc-rcS.d.patch \
-           file://0001-Make-root-s-home-directory-configurable.patch \
-           file://0001-systemd-user-avoid-using-system-auth.patch \
+           file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
+           file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
+           file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
+           file://0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch \
+           file://0006-journal-Use-posix-fallocate-only-if-available.patch \
+           file://0007-util-Use-mkostemp-only-if-libc-supports-it.patch \
+           file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
+           file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
+           file://0010-Make-root-s-home-directory-configurable.patch \
+           file://0011-systemd-user-avoid-using-system-auth.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
@@ -50,8 +50,8 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
 S = "${WORKDIR}/git"
 
 SRC_URI_append_libc-uclibc = "\
-                             file://systemd-pam-fix-getty-unit.patch \
-                            "
+            file://0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
+           "
 LDFLAGS_append_libc-uclibc = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
@@ -127,6 +127,9 @@ do_install() {
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 	touch ${D}${sysconfdir}/machine-id
 
+
+	install -d ${D}${sysconfdir}/udev/rules.d/
+	install -d ${D}${sysconfdir}/tmpfiles.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
@@ -159,7 +162,9 @@ do_install() {
 	sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
 	# for existence else it fails
-	${@bb.utils.contains('PACKAGECONFIG', 'networkd', '', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
+	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
+		${@bb.utils.contains('PACKAGECONFIG', 'networkd', '', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
+	fi
 }
 
 do_install_ptest () {
-- 
2.1.4


