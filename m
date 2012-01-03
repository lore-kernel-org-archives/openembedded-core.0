Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrN-0004fO-Qu
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752243"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:55 -0800
Message-Id: <ff67eadb578de91be2c52d9c90a94a164d2cadfd.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 069/113] Add Upstream-Status to patches
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../openswan/openswan-2.4.7/installflags.patch     |    2 ++
 .../openswan-2.4.7/ld-library-path-breakage.patch  |    2 ++
 .../openswan-2.4.7/openswan-2.4.7-gentoo.patch     |    2 ++
 .../wbxml/files/no-doc-install.patch               |    2 ++
 .../gcalctool/gcalctool/fix-includedir.patch       |    2 ++
 .../libfribidi/files/libtool-update.patch          |    2 ++
 .../openobex/files/disable-cable-test.patch        |    3 ++-
 .../openobex/files/libusb_crosscompile_check.patch |    2 ++
 .../use_correct_strip_in_cross_environment.patch   |    2 +-
 .../connman/connman/disable_alg-test.patch         |    2 +-
 .../connman/connman/ethernet_default.patch         |    2 +-
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |    2 ++
 .../dosfstools/fix_populated_dosfs_creation.patch  |    2 +-
 .../dosfstools/dosfstools/nofat32_autoselect.patch |    2 +-
 .../installer/files/wget_cache.patch               |    2 ++
 .../intltool-0.40.6/remove-xml-check.patch         |    3 +++
 .../opkg-utils/arfile_header_split.patch           |    2 +-
 .../pseudo/pseudo/static_sqlite.patch              |    2 ++
 .../python/python-native/multilib.patch            |    3 +++
 meta/recipes-devtools/python/python/multilib.patch |    3 +++
 .../rpm/rpm/header-include-fix.patch               |    2 ++
 .../rpm/rpm/remove-compiled-tests.patch            |    3 +++
 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch   |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch  |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |    2 ++
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |    3 +++
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch    |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-showrc.patch     |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch    |    2 ++
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
 .../strace/strace-4.5.20/sigmask.patch             |    1 +
 .../use-usr-bin-env-for-python.patch               |    2 ++
 .../libglade-2.6.4/python_environment.patch        |    2 +-
 .../blktrace/blktrace/blktrace-makefile.patch      |    2 ++
 meta/recipes-kernel/dtc/dtc/make_install.patch     |    2 ++
 .../linux-yocto/tools-perf-no-scripting.patch      |    3 +++
 meta/recipes-kernel/sysprof/files/rmb-arm.patch    |    3 +++
 meta/recipes-kernel/sysprof/files/rmb-mips.patch   |    2 ++
 .../allow-libdir-override.patch                    |    2 ++
 meta/recipes-support/gmp/gmp/gmp_bugfix.patch      |    2 +-
 44 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/installflags.patch b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/installflags.patch
index e6da2ea..ffebf2b 100644
--- a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/installflags.patch
+++ b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/installflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: openswan-2.4.7/Makefile.inc
 ===================================================================
 --- openswan-2.4.7.orig/Makefile.inc	2006-12-25 18:05:40.608503250 +0100
diff --git a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/ld-library-path-breakage.patch b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/ld-library-path-breakage.patch
index e3cc876..92f3547 100644
--- a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/ld-library-path-breakage.patch
+++ b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/ld-library-path-breakage.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- openswan-2.2.0.orig/programs/Makefile.program	2004-06-03 03:06:27.000000000 +0200
 +++ openswan-2.2.0/programs/Makefile.program	2005-03-05 13:50:19.000000000 +0100
 @@ -30,10 +30,6 @@
diff --git a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/openswan-2.4.7-gentoo.patch b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/openswan-2.4.7-gentoo.patch
index b3863a5..c24227c 100644
--- a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/openswan-2.4.7-gentoo.patch
+++ b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/openswan-2.4.7-gentoo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -Nru openswan-2.4.7.orig/doc/Makefile openswan-2.4.7/doc/Makefile
 --- openswan-2.4.7.orig/doc/Makefile	2005-11-08 23:32:45.000000000 +0200
 +++ openswan-2.4.7/doc/Makefile	2006-12-06 22:46:54.732830840 +0200
diff --git a/meta-demoapps/recipes-connectivity/wbxml/files/no-doc-install.patch b/meta-demoapps/recipes-connectivity/wbxml/files/no-doc-install.patch
index 16084e6..1d9ea43 100644
--- a/meta-demoapps/recipes-connectivity/wbxml/files/no-doc-install.patch
+++ b/meta-demoapps/recipes-connectivity/wbxml/files/no-doc-install.patch
@@ -1,3 +1,5 @@
+
+Upstream-Status: Inappropriate [configuration]
 --- wbxml2-0.9.2/Makefile.am.old	2007-01-03 19:50:24.000000000 +0000
 +++ wbxml2-0.9.2/Makefile.am	2007-01-03 19:50:39.000000000 +0000
 @@ -24,9 +24,9 @@
diff --git a/meta-demoapps/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch b/meta-demoapps/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
index aeb02ab..64a9aff 100644
--- a/meta-demoapps/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
+++ b/meta-demoapps/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
@@ -3,6 +3,8 @@
  gcalctool/Makefile.am |    2 --
  2 files changed, 1 insertion(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: gcalctool-5.8.17/gcalctool/Makefile.am
 ===================================================================
 --- gcalctool-5.8.17.orig/gcalctool/Makefile.am	2005-12-19 15:46:57.000000000 +0000
diff --git a/meta-demoapps/recipes-support/libfribidi/files/libtool-update.patch b/meta-demoapps/recipes-support/libfribidi/files/libtool-update.patch
index c703100..7fbbe28 100644
--- a/meta-demoapps/recipes-support/libfribidi/files/libtool-update.patch
+++ b/meta-demoapps/recipes-support/libfribidi/files/libtool-update.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- fribidi-0.10.4/configure.in~	2002-05-19 11:06:48.000000000 +0100
 +++ fribidi-0.10.4/configure.in	2004-08-03 17:42:28.000000000 +0100
 @@ -50,7 +50,7 @@
diff --git a/meta-demoapps/recipes-support/openobex/files/disable-cable-test.patch b/meta-demoapps/recipes-support/openobex/files/disable-cable-test.patch
index 95b636d..4251138 100644
--- a/meta-demoapps/recipes-support/openobex/files/disable-cable-test.patch
+++ b/meta-demoapps/recipes-support/openobex/files/disable-cable-test.patch
@@ -1,7 +1,8 @@
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
-#
+# 
+Upstream-Status: Inappropriate [configuration]
 
 --- openobex-1.2/apps/Makefile.am~disable-cable-test
 +++ openobex-1.2/apps/Makefile.am
diff --git a/meta-demoapps/recipes-support/openobex/files/libusb_crosscompile_check.patch b/meta-demoapps/recipes-support/openobex/files/libusb_crosscompile_check.patch
index 20ac70b..18841a8 100644
--- a/meta-demoapps/recipes-support/openobex/files/libusb_crosscompile_check.patch
+++ b/meta-demoapps/recipes-support/openobex/files/libusb_crosscompile_check.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: openobex-1.5/acinclude.m4
 ===================================================================
 --- openobex-1.5.orig/acinclude.m4	2009-02-08 18:30:22.000000000 +0000
diff --git a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
index c9ad668..bca75fb 100644
--- a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
+++ b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 Used the cross strip instead of host strip to avoid this build error:
 
diff --git a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch b/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
index c231d75..44ad768 100644
--- a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
+++ b/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Disable building of alg-test
 alg-test utility depends on linux/if_alg.h header that is only
 available on kernels >= 2.6.39.
 
-Upstream Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
diff --git a/meta/recipes-connectivity/connman/connman/ethernet_default.patch b/meta/recipes-connectivity/connman/connman/ethernet_default.patch
index d0c05d7..6dae2aa 100644
--- a/meta/recipes-connectivity/connman/connman/ethernet_default.patch
+++ b/meta/recipes-connectivity/connman/connman/ethernet_default.patch
@@ -3,7 +3,7 @@ will shut down all the networking when it starts without any configuration
 which is usualy not what the users expects. This is particularly
 problematic with our qemu images and runtime testing using qemu.
 
-Upstream Status: Inappropriate [Configuration]
+Upstream-Status: Inappropriate [Configuration]
 
 RP 2011/12/12
 
diff --git a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
index 083547a..7bc8caf 100644
--- a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
+++ b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
@@ -11,6 +11,8 @@ CDPATH="${ZSH_VERSION+.}:" && cd . && perllibdir="automake-1.11.1/lib:./lib" "au
 /bin/sh: automake-1.11.1/aclocal: No such file or directory
 make: *** [aclocal.m4] Error 127
 
+Upstream-Status: Pending
+
 Signed-off-by: Tom Rini <tom_rini@mentor.com>
 
 Index: automake-1.11.1/m4/tar.m4
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch b/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
index 510f12e..9d7f732 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Inappropriate
+Upstream-Status: Inappropriate
 
 This patch fixes populated dosfs image creation with directory 
 structures. Earlier it was causing segfault; and only image 
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch b/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
index 21ebc10..6ee3f7f 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
@@ -4,7 +4,7 @@ broken images with the -d option. It can still be enabled on the commandline
 at the users own risk. This changes us back to the 2.10 version's behaviour
 which was known to work well even with large images.
 
-Upstream Status: Inapprioriate [depends on other patches we apply]
+Upstream-Status: Inapproriate [depends on other patches we apply]
 
 RP 2011/12/13
 
diff --git a/meta/recipes-devtools/installer/files/wget_cache.patch b/meta/recipes-devtools/installer/files/wget_cache.patch
index 6fd38e5..1281d12 100644
--- a/meta/recipes-devtools/installer/files/wget_cache.patch
+++ b/meta/recipes-devtools/installer/files/wget_cache.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- trunk/libopkg/opkg_download.c	2011-03-10 16:41:29.000000000 +0800
 +++ trunk/libopkg/opkg_download.c	2011-03-10 16:42:33.000000000 +0800
 @@ -162,6 +162,7 @@
diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
index 476d091..2eb9abd 100644
--- a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
+++ b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: intltool-0.40.6/intltool.m4
 ===================================================================
 --- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
index 435e74e..b679f8b 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
@@ -6,7 +6,7 @@ Subject: ipkg-utils: Make arfile.py handle six digit UIDs
     as a single field.  This makes things better than before as it now honors
     the fixed field widths.
     
-Upsteam-status: Pending (there is no upstream after openmoko imploded)
+Upstream-Status: Pending (there is no upstream after openmoko imploded)
 
 --- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
 +++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
diff --git a/meta/recipes-devtools/pseudo/pseudo/static_sqlite.patch b/meta/recipes-devtools/pseudo/pseudo/static_sqlite.patch
index 6faa7a2..f9223a8 100644
--- a/meta/recipes-devtools/pseudo/pseudo/static_sqlite.patch
+++ b/meta/recipes-devtools/pseudo/pseudo/static_sqlite.patch
@@ -1,6 +1,8 @@
 Due to disabling the LD_LIBRARY_PATH handling, we need to use a static
 libsqlite.
 
+Upstream-Status: Inappropriate [configuration]
+
 diff -ur git.orig/Makefile.in git/Makefile.in
 --- git.orig/Makefile.in
 +++ git/Makefile.in
diff --git a/meta/recipes-devtools/python/python-native/multilib.patch b/meta/recipes-devtools/python/python-native/multilib.patch
index f8d7aee..0526031 100644
--- a/meta/recipes-devtools/python/python-native/multilib.patch
+++ b/meta/recipes-devtools/python/python-native/multilib.patch
@@ -16,6 +16,9 @@ The python recipe building was failing because python-native
 could not handle sys.lib var. sys.lib var is defined in the 
 multilib patch hence added this multilib.patch for python-native 
 recipe.
+
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 Index: Python-2.7.2/Include/pythonrun.h
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index babff12..df470f7 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -12,6 +12,9 @@ Date:   Tue Jun 28 21:21:29 2011 +0800
 
 2011/09/29
 Rebased for python 2.7.2
+
+Upstream-Status: Inappropriate [configuration]
+
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 Index: Python-2.7.2/Include/pythonrun.h
diff --git a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
index 92c534e..6aa072d 100644
--- a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/rpmdb/rpmdb.h b/rpmdb/rpmdb.h
 index 0e1bdd7..8b522bb 100644
 --- a/rpmdb/rpmdb.h
diff --git a/meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch b/meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
index 69b7130..3663692 100644
--- a/meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
+++ b/meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: rpm-5.1.9/configure.ac
 ===================================================================
 --- rpm-5.1.9.orig/configure.ac	2009-04-18 17:47:02.000000000 +0100
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch b/meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
index 30c5f7b..5e93517 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
@@ -4,6 +4,8 @@ configure.ac:11: error: m4_divert_push: cannot change diversion to `GROW' inside
 
 without this patch.
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 diff -ur rpm-5.1.10.orig/configure.ac rpm-5.1.10/configure.ac
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch b/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
index 323bb71..5fe6ded 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
@@ -2,6 +2,8 @@ Remove the sanity checking from the rpm autogen.sh.  This is required because
 we may have slightly different, but yet compatible versions.  If we do end
 up breaking things, we'll deal with it at that time.
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 diff -ur rpm-5.4.0.orig/autogen.sh rpm-5.4.0/autogen.sh
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
index 3619058..3aac116 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
@@ -14,6 +14,8 @@ This patch changes the list of supported items to:
   <arch>-<vendor>-<os>
   <arch>-<vendor>-<os>-<extension>
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 Index: rpm-5.4.0/lib/rpmrc.c
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch b/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
index d1e4bf6..1f948cd 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
@@ -7,6 +7,8 @@ Note: this is a temporary workaround.  Eventually we will want to have a way
 to seed per-file dependency and other information in order to generate a
 package from previously determined information.
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 diff --git a/lib/rpmfc.c b/lib/rpmfc.c
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
index 829399c..b5ff263 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
@@ -2,6 +2,8 @@ During installation, the libtool relink attempts to link to -lrpm...
 The problem is that it hasn't been installed yet!  So small change causes
 the libtool to instead use the build version.
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 --- rpm-5.4.0/lib/Makefile.am.orig
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch b/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
index aafa416..babafb3 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [configuration]
+
 diff --git a/rpmdb/DB_CONFIG.in b/rpmdb/DB_CONFIG.in
 index 8b94c94..e0b4689 100644
 --- a/rpmdb/DB_CONFIG.in
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
index 4aded75..d81e25a 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
@@ -1,5 +1,7 @@
 lib/order.c: Make the dependency loop messages into debug msgs
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 diff -urN rpm-5.4.0.orig/lib/order.c rpm-5.4.0/lib/order.c
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch b/meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
index 33039ad..f6e5828 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
@@ -1,5 +1,7 @@
 Backport from RPM 5.4.1 CVS, disabled fsync.
 
+Upstream-Status: Backport
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 diff -ur rpm-5.4.0.orig/CHANGES rpm-5.4.0/CHANGES
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
index 09a1c13..7b81857 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
@@ -1,5 +1,7 @@
 Fix up platform and related sysinfo file loading.
 
+Upstream-Status: Pending
+
 This ensures that RPM knows the compatible set of package types at all times.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-showrc.patch b/meta/recipes-devtools/rpm/rpm/rpm-showrc.patch
index 5051ce6..b38b34d 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-showrc.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-showrc.patch
@@ -1,5 +1,7 @@
 Workaround for a memory leak in --showrc.
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 diff -ur rpm-5.4.0.orig/lib/rpmrc.c rpm-5.4.0/lib/rpmrc.c
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch b/meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch
index 5c1819c..d6f43a2 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch
@@ -4,6 +4,8 @@ Previously the max was set to 5, up this to 20... this should be more
 then enough for now.. also add an RPM_ERROR message in case we exceed the
 new maximum.
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 diff -urN rpm-5.4.0.orig/rpmio/rpmbag.c rpm-5.4.0/rpmio/rpmbag.c
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
index 9e7bba0..dd8d8bd 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
@@ -1,5 +1,5 @@
 Source: None
-Status: Needs to go Upstream
+Upstream-Status: Pending
 Author: Khem Raj <raj.khem@gmail.com>
 Date: 2011-03-03
 Description:
diff --git a/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch b/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
index 9bca528..99962af 100644
--- a/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
+++ b/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
@@ -2,6 +2,7 @@ sigmask is a macro which is dropped if BSD compatibility is
 not enabled. So we check if the macro does not exist then
 we define it to __sigmask
 
+Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: strace-4.5.20/signal.c
diff --git a/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch b/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
index 67b8547..ea00157 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
+++ b/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gobject-introspection-0.9.10/tools/g-ir-annotation-tool.in
 ===================================================================
 --- gobject-introspection-0.9.10.orig/tools/g-ir-annotation-tool.in
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
index b4ca49d..b5b2ec4 100644
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
+++ b/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
@@ -1,7 +1,7 @@
 Using @PYTHON@ for this path would result in the build system python being 
 referred to. Instead we want to locate python from the environment.
 
-Upstream Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 diff -ruN libglade-2.6.4-orig//libglade-convert.in libglade-2.6.4/libglade-convert.in
 --- libglade-2.6.4-orig//libglade-convert.in	2011-09-22 10:18:28.991164003 +0800
diff --git a/meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch b/meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch
index c6a06ed..c0f5fb0 100644
--- a/meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch
+++ b/meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/Makefile
 ===================================================================
 --- git.orig/Makefile	2010-11-22 11:20:14.303472770 -0600
diff --git a/meta/recipes-kernel/dtc/dtc/make_install.patch b/meta/recipes-kernel/dtc/dtc/make_install.patch
index 2f7d809..1120617 100644
--- a/meta/recipes-kernel/dtc/dtc/make_install.patch
+++ b/meta/recipes-kernel/dtc/dtc/make_install.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/Makefile
 ===================================================================
 --- git.orig/Makefile	2011-11-02 14:52:17.243104779 -0700
diff --git a/meta/recipes-kernel/linux/linux-yocto/tools-perf-no-scripting.patch b/meta/recipes-kernel/linux/linux-yocto/tools-perf-no-scripting.patch
index e0ad999..d07335a 100644
--- a/meta/recipes-kernel/linux/linux-yocto/tools-perf-no-scripting.patch
+++ b/meta/recipes-kernel/linux/linux-yocto/tools-perf-no-scripting.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: tools/perf/Makefile
 ===================================================================
 --- a/tools/perf/Makefile	2011-01-14 14:17:33.127008554 -0600
diff --git a/meta/recipes-kernel/sysprof/files/rmb-arm.patch b/meta/recipes-kernel/sysprof/files/rmb-arm.patch
index 60e7f70..c53ac64 100644
--- a/meta/recipes-kernel/sysprof/files/rmb-arm.patch
+++ b/meta/recipes-kernel/sysprof/files/rmb-arm.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Pending
+
 Index: git/util.h
 ===================================================================
 --- git.orig/util.h	2010-12-07 22:41:57.156243001 -0600
diff --git a/meta/recipes-kernel/sysprof/files/rmb-mips.patch b/meta/recipes-kernel/sysprof/files/rmb-mips.patch
index 84f968e..e055b8a 100644
--- a/meta/recipes-kernel/sysprof/files/rmb-mips.patch
+++ b/meta/recipes-kernel/sysprof/files/rmb-mips.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/util.h
 ===================================================================
 --- git.orig/util.h	2010-12-08 01:22:44.486243001 -0600
diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch b/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch
index 88f414a..d59d12e 100644
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch
@@ -2,6 +2,8 @@ Allow LIB_INSTALL_DIR to be set by the the cmake configure invocation.  We dont
 easily have a way of determining something that patches ${LIB_SUFFIX} so we'll
 set LIB_INSTALL_DIR.
 
+Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
 
 Index: libmusicbrainz-3.0.3/CMakeLists.txt
diff --git a/meta/recipes-support/gmp/gmp/gmp_bugfix.patch b/meta/recipes-support/gmp/gmp/gmp_bugfix.patch
index a96136f..329c880 100644
--- a/meta/recipes-support/gmp/gmp/gmp_bugfix.patch
+++ b/meta/recipes-support/gmp/gmp/gmp_bugfix.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 When LONG_MIN is passed to val, -val is undefined.  This patch fixes
 it.  See for details: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50066
-- 
1.7.6.4



