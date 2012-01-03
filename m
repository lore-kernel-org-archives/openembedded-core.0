Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrQ-0004Y7-2P
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752263"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:04 -0800
Message-Id: <1b55339284fd2da1c12d6a30650276ebde1e1419.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 078/113] perl: mark upstream status for all patches
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

All the patches imported from debian source packages are marked
accordingly.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../debian/arm_thread_stress_timeout.diff          |    1 +
 .../perl-5.14.2/debian/cpan_definstalldirs.diff    |    1 +
 .../perl-5.14.2/debian/cpanplus_config_path.diff   |    1 +
 .../debian/cpanplus_definstalldirs.diff            |    1 +
 .../perl/perl-5.14.2/debian/db_file_ver.diff       |    1 +
 .../perl-5.14.2/debian/deprecate-with-apt.diff     |    1 +
 .../perl-5.14.2/debian/disable-zlib-bundling.diff  |    1 +
 .../perl/perl-5.14.2/debian/doc_info.diff          |    1 +
 .../perl/perl-5.14.2/debian/enc2xs_inc.diff        |    1 +
 .../perl/perl-5.14.2/debian/errno_ver.diff         |    1 +
 .../debian/extutils_set_libperl_path.diff          |    1 +
 .../perl/perl-5.14.2/debian/fakeroot.diff          |    1 +
 .../perl/perl-5.14.2/debian/find_html2text.diff    |    1 +
 .../debian/fixes/document_makemaker_ccflags.diff   |    1 +
 .../debian/fixes/extutils-cbuilder-cflags.diff     |    1 +
 .../perl-5.14.2/debian/fixes/h2ph-multiarch.diff   |    1 +
 .../perl-5.14.2/debian/fixes/hurd-ccflags.diff     |    1 +
 .../perl/perl-5.14.2/debian/fixes/hurd-hints.diff  |    1 +
 .../perl-5.14.2/debian/fixes/index-tainting.diff   |    1 +
 .../debian/fixes/module-build-home-directory.diff  |    1 +
 .../perl-5.14.2/debian/fixes/net_smtp_docs.diff    |    1 +
 .../perl/perl-5.14.2/debian/fixes/pod_fixes.diff   |    1 +
 .../perl-5.14.2/debian/fixes/respect_umask.diff    |    1 +
 .../fixes/sys-syslog-socket-timeout-kfreebsd.patch |    1 +
 .../perl/perl-5.14.2/debian/instmodsh_doc.diff     |    1 +
 .../perl/perl-5.14.2/debian/ld_run_path.diff       |    1 +
 .../perl-5.14.2/debian/libnet_config_path.diff     |    1 +
 .../perl/perl-5.14.2/debian/libperl_embed_doc.diff |    1 +
 .../perl-5.14.2/debian/m68k_thread_stress.diff     |    1 +
 .../perl/perl-5.14.2/debian/mod_paths.diff         |    1 +
 .../debian/module_build_man_extensions.diff        |    1 +
 .../perl-5.14.2/debian/no_packlist_perllocal.diff  |    1 +
 .../perl/perl-5.14.2/debian/patchlevel.diff        |    1 +
 .../perl/perl-5.14.2/debian/perlivp.diff           |    1 +
 .../perl/perl-5.14.2/debian/prefix_changes.diff    |    1 +
 .../perl/perl-5.14.2/debian/prune_libs.diff        |    1 +
 .../perl-5.14.2/debian/skip-kfreebsd-crash.diff    |    1 +
 .../debian/skip-upstream-git-tests.diff            |    1 +
 .../debian/squelch-locale-warnings.diff            |    1 +
 .../perl-5.14.2/debian/writable_site_dirs.diff     |    1 +
 40 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/arm_thread_stress_timeout.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/arm_thread_stress_timeout.diff
index 1d80e95..6e70c66 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/arm_thread_stress_timeout.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/arm_thread_stress_timeout.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From f624a9f1206cdd44fde99c40d82e2f326db485dd Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sat, 1 Nov 2008 15:10:16 +0200
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpan_definstalldirs.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/cpan_definstalldirs.diff
index 9fa9378..57e7636 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpan_definstalldirs.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/cpan_definstalldirs.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 4b63b9a433661cd13cfb1448dbfb90c5f53a53be Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_config_path.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_config_path.diff
index e3e5ec9..f33221c 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_config_path.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 9825086b15f34f365a272cc8d6caf4e2044bede6 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Mon, 6 Jul 2009 22:17:53 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_definstalldirs.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_definstalldirs.diff
index 6d05c34..7df2860 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_definstalldirs.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_definstalldirs.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 66517b14790aa6410fd37e411dd62521e1e02b7f Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Mon, 6 Jul 2009 21:58:41 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/db_file_ver.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/db_file_ver.diff
index ff07ec5..8726056 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/db_file_ver.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/db_file_ver.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 0d1acf7af6da3a3f933faba8459ad9ff03fe3e5b Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/deprecate-with-apt.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/deprecate-with-apt.diff
index 65a132d..3a145a1 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/deprecate-with-apt.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/deprecate-with-apt.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From c2bd2059cfbba573643c748ace4ff4db4cbf015d Mon Sep 17 00:00:00 2001
 From: Dominic Hargreaves <dom@earth.li>
 Date: Mon, 17 May 2010 13:23:07 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/disable-zlib-bundling.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/disable-zlib-bundling.diff
index 80c0acb..03ef76f 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/disable-zlib-bundling.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/disable-zlib-bundling.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 90c7967530102c66bbff25d89273d3f0bf189a83 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 10 Apr 2009 01:17:43 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/doc_info.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/doc_info.diff
index a118da3..889024a 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/doc_info.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/doc_info.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 16ebe1f5232621d8894aa6c6210fdf2fc9b54a84 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/enc2xs_inc.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/enc2xs_inc.diff
index 7c33e90..9440348 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/enc2xs_inc.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/enc2xs_inc.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From e9fd6e7729b9ebd9bc74b8cf295cd3a7f5aa5472 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/errno_ver.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/errno_ver.diff
index 0f3bfa6..c7b0531 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/errno_ver.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/errno_ver.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 973bed42db538804179f39d66dab37c82c6ade24 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/extutils_set_libperl_path.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/extutils_set_libperl_path.diff
index 4c2da32..d704c00 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/extutils_set_libperl_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/extutils_set_libperl_path.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 334ac01a8306485ed901f4fb45d79f39a944fe77 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fakeroot.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fakeroot.diff
index bd90af9..79e7fcf 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fakeroot.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fakeroot.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From a46a7107fb045ffa6047488b8002fec97b621a11 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/find_html2text.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/find_html2text.diff
index 16de7ad..29dc576 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/find_html2text.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/find_html2text.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From ca66b95be369b47a6d372c3653be57cd737f7f21 Mon Sep 17 00:00:00 2001
 From: Andreas Marschke <andreas.marschke@googlemail.com>
 Date: Sat, 17 Sep 2011 11:38:42 +0100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/document_makemaker_ccflags.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/document_makemaker_ccflags.diff
index 3bda8f7..3f2c3dc 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/document_makemaker_ccflags.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/document_makemaker_ccflags.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From f0e3a51bd7286788e410510af86a6c07edac4445 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Mon, 30 May 2011 22:54:24 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/extutils-cbuilder-cflags.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/extutils-cbuilder-cflags.diff
index cd86a76..f9a3c6b 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/extutils-cbuilder-cflags.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/extutils-cbuilder-cflags.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 0c91624f1f9ec46a6f13cad3031b706213233479 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Thu, 28 Apr 2011 09:18:54 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/h2ph-multiarch.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/h2ph-multiarch.diff
index b18b464..3b6b4a0 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/h2ph-multiarch.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/h2ph-multiarch.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 37969e249dfc593ebabfcb682893b6c69dc6b313 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Wed, 18 May 2011 21:44:06 -0700
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff
index 901f98d..6822720 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From f66e8575cb0ca11171f43efe0f9e3c6e790b75bc Mon Sep 17 00:00:00 2001
 From: Samuel Thibault <sthibault@debian.org>
 Date: Wed, 4 Aug 2010 13:34:05 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
index 1ba9cbd..6c55e71 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From d6fd7595fcd04b332e7449f59ea298639f10a183 Mon Sep 17 00:00:00 2001
 From: Pino Toscano <pino@debian.org>
 Date: Wed, 10 Aug 2011 08:11:33 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/index-tainting.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/index-tainting.diff
index 204e999..ee00ca3 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/index-tainting.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/index-tainting.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From e25298a339dd6679f1b080f0125ac1b237b87950 Mon Sep 17 00:00:00 2001
 From: David Mitchell <davem@iabyn.com>
 Date: Tue, 28 Jun 2011 17:04:40 +0100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/module-build-home-directory.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/module-build-home-directory.diff
index 1c9009b..998a6a3 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/module-build-home-directory.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/module-build-home-directory.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 9266292f705f2a3b6e5b97fa50e5f2be31371d5c Mon Sep 17 00:00:00 2001
 From: Dominic Hargreaves <dom@earth.li>
 Date: Mon, 2 May 2011 10:35:04 +0100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/net_smtp_docs.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/net_smtp_docs.diff
index 549fc10..f68c352 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/net_smtp_docs.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/net_smtp_docs.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From ab32eba7fcc45d864c22e8f4ee02e0a6712070e0 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Thu, 20 Sep 2007 19:47:14 +1000
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/pod_fixes.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/pod_fixes.diff
index eb0eb0b..58e770b 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/pod_fixes.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/pod_fixes.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From c6b1fdd18dab0236458502564e54c180bb0ce341 Mon Sep 17 00:00:00 2001
 From: Keith Thompson <kst@mib.org>
 Date: Fri, 29 Jul 2011 17:17:00 -0700
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/respect_umask.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/respect_umask.diff
index a84c9f9..aa9307f 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/respect_umask.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/respect_umask.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 0d1ab4f799eb14d5488fcc959f4a6bdec548b370 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
index e29e9b0..632d426 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 9ba88d73444c22788b7c2a212e15dbfe3da2a1af Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Wed, 3 Aug 2011 22:36:24 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/instmodsh_doc.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/instmodsh_doc.diff
index ab0133d..ae13178 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/instmodsh_doc.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/instmodsh_doc.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From ab89a31d1f46388a61953349c3546e4082cd38de Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/ld_run_path.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/ld_run_path.diff
index d38b04b..929328b 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/ld_run_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/ld_run_path.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 704f6017119ce0301a9105944512120a38a43a02 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/libnet_config_path.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/libnet_config_path.diff
index 6604d35..454cb9e 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/libnet_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/libnet_config_path.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 7465b6d008187580eabe655b9c8e75351d3d24b4 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/libperl_embed_doc.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/libperl_embed_doc.diff
index cc3e050..d1bf8bd 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/libperl_embed_doc.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/libperl_embed_doc.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From d70e88badfcc6edd05e884597f19fbbdcf2cf6a7 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/m68k_thread_stress.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/m68k_thread_stress.diff
index f1dfe36..1c3b6b5 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/m68k_thread_stress.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/m68k_thread_stress.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 55a718425dc4612ac01850ef786f75f072b20b9e Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Mon, 8 Sep 2008 20:48:14 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/mod_paths.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/mod_paths.diff
index 2cc0946..ceac541 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/mod_paths.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/mod_paths.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 11633e598640b02e19329f323623af254fbac451 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/module_build_man_extensions.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/module_build_man_extensions.diff
index b11433f..64401d9 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/module_build_man_extensions.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/module_build_man_extensions.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From fbb5f07872d45bac76b5c3c83b50a19aa5da10b0 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Thu, 8 May 2008 14:32:33 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/no_packlist_perllocal.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/no_packlist_perllocal.diff
index 3324c1e..00633e3 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/no_packlist_perllocal.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/no_packlist_perllocal.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 44c7521619dd0e637920393184affcb26a27d5b7 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/patchlevel.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/patchlevel.diff
index 0a8a467..9c25eb7 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/patchlevel.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/patchlevel.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From cf928101697efa4a46ada500c2f449caeb854fd4 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sun, 15 May 2011 19:35:58 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/perlivp.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/perlivp.diff
index 98b1b50..21711e8 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/perlivp.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/perlivp.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 4c7e04f75c9513451d1622e5a6dd58c2c8377d81 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 9 Jan 2009 18:54:47 +0200
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/prefix_changes.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/prefix_changes.diff
index a1e17ce..5a1ad99 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/prefix_changes.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/prefix_changes.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 148e2717682ce8c65475ffdeea84b3cdd1ab1649 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/prune_libs.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/prune_libs.diff
index bb05a94..e3c320e 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/prune_libs.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/prune_libs.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 063566907896ff32bea27897fa73cebbbd7bacce Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-kfreebsd-crash.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-kfreebsd-crash.diff
index 7992129..cdade88 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-kfreebsd-crash.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-kfreebsd-crash.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From ff2815399ad94915da2e63cb3c4bbd2d02dac4b2 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 5 Aug 2011 10:50:18 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-upstream-git-tests.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-upstream-git-tests.diff
index a157bc7..2c30536 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-upstream-git-tests.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-upstream-git-tests.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 2be2eed9148c38d3e982d3371f379ce77021aeb5 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 22 Apr 2011 11:15:32 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/squelch-locale-warnings.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/squelch-locale-warnings.diff
index 71660b0..f0a6924 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/squelch-locale-warnings.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/squelch-locale-warnings.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 718e9cbd59f0739fc9104af111e42fff66f927a7 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sun, 3 Oct 2010 21:36:17 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/writable_site_dirs.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/writable_site_dirs.diff
index a4fc32a..a4a9adf 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/writable_site_dirs.diff
+++ b/meta/recipes-devtools/perl/perl-5.14.2/debian/writable_site_dirs.diff
@@ -1,3 +1,4 @@
+Upstream-Status:Inappropriate [debian patches]
 From 492e0d6b4e3e0d786fb88b9058d581f6466c4a3e Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
-- 
1.7.6.4



