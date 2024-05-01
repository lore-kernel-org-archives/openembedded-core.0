Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F2AC27C5F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1119.1714579216857379641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f0/JQawv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Z7RVBf+M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f34e29720-3d6965e2-66ec-4020-a56a-7eb4e26fd959-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kd9Kx5XdMso6LwNUPH4UgmMgIdKE62cCXa9Ug9hSlPs=;
	b=f0/JQawvZon8dXUWHWW3VpEg/0kAEc5UThqoSOnP3zT2gtlbidT5vW28TXn7b3PG
	cB+e1f4uiEHEsQufEGFHMEHCpPytrQeVMz0PWsaseM8H0e/x2dEXc5fPP4pxTVIywlP
	+cr27xxws3ia7j4FxGv6uoSfeRTERHINa/GpBih4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kd9Kx5XdMso6LwNUPH4UgmMgIdKE62cCXa9Ug9hSlPs=;
	b=Z7RVBf+MsiA+eUCPLaexHVUqNRQLHQyexKOhDsqPQJm5X98wwtnoCXPn4ku32A0r
	gvyNbS1CJ6qArLqyMGAJaFGNuUHH7wjfW3CHmfcpQfZCho1dj5rBRDhGt3dEibwFGA6
	EdLPzNi0Wy6nNKvaW5KILCDNwwmX1YNEVxmqZdK4=
Content-Type: multipart/mixed; boundary="===============1925154317740060424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap: upgrading to 5.1 FAILED
Message-ID: <0101018f34e29720-3d6965e2-66ec-4020-a56a-7eb4e26fd959-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198853

--===============1925154317740060424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap* to *5.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemtap-upgrade-5.0-5.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 0d00fda7ce7b506b869567350dc9b69a22d39166 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 13:27:51 +0000
Subject: [PATCH] systemtap: upgrade 5.0 -> 5.1

---
 ...gure-write-a-python-location-into-th.patch |  7 +--
 ...ython-modules-to-correct-library-dir.patch |  7 +--
 ...ve-runtime-linux-uprobes-and-runtime.patch | 40 ---------------
 ...x-fix-build-against-upcoming-gcc-14-.patch | 40 ---------------
 ...-broken-libdebuginfod-library-auto-d.patch | 51 -------------------
 ...rove-reproducibility-for-c-compiling.patch |  7 +--
 .../0001-prerelease-datestamp-fixes.patch     | 23 ---------
 ...staprun-address-ncurses-6.3-failures.patch | 11 ++--
 ...d-against-upcoming-gcc-14-Werror-cal.patch | 36 -------------
 ...-don-t-support-installing-a-non-root.patch | 17 +++----
 .../recipes-kernel/systemtap/systemtap_git.bb |  5 +-
 .../systemtap/systemtap_git.inc               |  4 +-
 12 files changed, 24 insertions(+), 224 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
index 742b1187fc..412f95ac60 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
@@ -1,4 +1,4 @@
-From ab29615ed6c2e779b472903564dc683dc1015de7 Mon Sep 17 00:00:00 2001
+From d3dc317e32ef5a38e054843a3707ff096d5648b6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 13:37:33 +0200
 Subject: [PATCH] Do not let configure write a python location into the dtrace
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dtrace.in b/dtrace.in
-index 5e1cf8079..a24229cbc 100644
+index 73a6f22e2..870999e36 100644
 --- a/dtrace.in
 +++ b/dtrace.in
 @@ -1,4 +1,4 @@
@@ -20,6 +20,3 @@ index 5e1cf8079..a24229cbc 100644
  # vim: et sta sts=4 sw=4 ts=8
  
  # This handles the systemtap equivalent of
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
index 48cf4aee85..f2fede2a2c 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
@@ -1,4 +1,4 @@
-From 2ada22f05460223924efe54080cb4419e2b4c276 Mon Sep 17 00:00:00 2001
+From 0a7dd304e5be14df24e16fa1d1f86d1b73962433 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Feb 2017 17:53:02 +0200
 Subject: [PATCH] Install python modules to correct library dir.
@@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/python/Makefile.am b/python/Makefile.am
-index a254480..578602f 100644
+index a254480f9..578602fdd 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -8,6 +8,10 @@ AUTOMAKE_OPTIONS = subdir-objects
@@ -51,6 +51,3 @@ index a254480..578602f 100644
  	 --single-version-externally-managed \
  	 --record $(shell readlink -f $(builddir))/py3build/install_files.txt \
           --verbose)
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
deleted file mode 100644
index 2d46a3962d..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5a01e28bd806326b2143e3e6bb28d4780c5d879d Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <victor.kamensky7@gmail.com>
-Date: Sun, 3 Dec 2023 18:40:05 -0800
-Subject: [PATCH] Makefile.am: remove runtime/linux/uprobes and
- runtime/linux/uprobes2 install
-
-"PR30434 continuation:  Removed old uprobes, uprobes2 implementation,
-uprobes-inc.h & any mentions of CONFIG_UTRACE." commit removed uprobes,
-and uprobes2 sources and directories, but Makefile.am still tries to
-install them. In fact after failing to 'cd' into runtime/linux/uprobes
-directory it copies top level *.[ch] files into
-${prefix}/share/systemtap/runtime/linux/uprobes directory.
-
-The issue was caught by OpenEmbedded project do_package_qa checks.
-
-Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/systemtap/2023q4/027880.html] 
----
- Makefile.am | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 5737c6b20..2ba896088 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -277,10 +277,6 @@ endif
- 		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/softfloat/$$f; done)
- 	(cd $(srcdir)/runtime/linux; for f in *.[ch]; \
- 		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/$$f; done)
--	(cd $(srcdir)/runtime/linux/uprobes; for f in Makefile *.[ch]; \
--		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/uprobes/$$f; done)
--	(cd $(srcdir)/runtime/linux/uprobes2; for f in *.[ch]; \
--		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/uprobes2/$$f; done)
- 	(cd $(srcdir)/tapset; find . \( -name '*.stp' -o -name '*.stpm' -o -name README \) -print \
- 		| while read f; do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/tapset/$$f; done)
- 	(cd $(srcdir)/testsuite/systemtap.examples; find . -type f -print \
--- 
-2.31.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch b/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
deleted file mode 100644
index e3d94d9312..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d42139cf9cd26d0c0363fcfe007716baeb8de517 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Fri, 22 Dec 2023 19:42:38 +0000
-Subject: [PATCH] bpf-translate.cxx: fix build against upcoming `gcc-14`
- (`-Werror=calloc-transposed-args`)
-
-`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
-detected minor infelicity in `calloc()` API usage in `systemtap`:
-
-    bpf-translate.cxx: In function 'bpf::BPF_Section* bpf::output_probe(BPF_Output&, program&, const std::string&, unsigned int)':
-    bpf-translate.cxx:5044:39: error: 'void* calloc(size_t, size_t)' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
-     5044 |   bpf_insn *buf = (bpf_insn*) calloc (sizeof(bpf_insn), ninsns);
-          |                                       ^~~~~~~~~~~~~~~~
-    bpf-translate.cxx:5044:39: note: earlier argument should specify number of elements, later size of each element
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=d42139cf9cd26d0c0363fcfe007716baeb8de517]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- bpf-translate.cxx | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bpf-translate.cxx b/bpf-translate.cxx
-index 1a9302463..aa8ef65ce 100644
---- a/bpf-translate.cxx
-+++ b/bpf-translate.cxx
-@@ -5041,9 +5041,9 @@ output_probe(BPF_Output &eo, program &prog,
- 	}
-     }
- 
--  bpf_insn *buf = (bpf_insn*) calloc (sizeof(bpf_insn), ninsns);
-+  bpf_insn *buf = (bpf_insn*) calloc (ninsns, sizeof(bpf_insn));
-   assert (buf);
--  Elf64_Rel *rel = (Elf64_Rel*) calloc (sizeof(Elf64_Rel), nreloc);
-+  Elf64_Rel *rel = (Elf64_Rel*) calloc (nreloc, sizeof(Elf64_Rel));
-   assert (rel);
- 
-   unsigned i = 0, r = 0;
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch b/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch
deleted file mode 100644
index 98641826f6..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 3913ad3e28a19811e1b52338112344a487057e4f Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <victor.kamensky7@gmail.com>
-Date: Mon, 18 Dec 2023 03:13:38 +0000
-Subject: [PATCH 1/2] configure.ac: fix broken libdebuginfod library auto
- detection
-
-After 2e67b053e3796ee7cf29a39f9698729b52078406 "configury: rework debuginfod searches"
-commit, libdebuginfod.so library auto detection is broken. It was reported by Martin Jansa
-on openembedded-core mailing list [1].
-
-Currently configure.ac does "AC_DEFINE([HAVE_LIBDEBUGINFOD], [1] ..." as long as
-no --without-debuginfod option is passed, regardless PKG_CHECK_MODULES check result.
-It seems to be bad copy/paste. Address the issue by moving the AC_DEFINE back to
-PKG_CHECK_MODULES action-if-found block.
-
-To reproduce the issue on FC system, one can do the following
-"sudo dnf remove elfutils-debuginfod-client-devel" and then try to build SystemTap
-util.cxx will fail to compile because of missing elfutils/debuginfod.h because
-config.h will have "#define HAVE_LIBDEBUGINFOD 1", while config.log and configure
-output indicates that check for libdebuginfod library failed.
-
-[1] https://lists.openembedded.org/g/openembedded-core/message/192109?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Csystemtap%2C20%2C2%2C0%2C102987514
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/systemtap/2023q4/027914.html]
-Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
----
- configure.ac | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d9559c5c3..18cd7f84a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -219,12 +219,11 @@ dnl take the user at his or her word
- elif test "x$with_debuginfod" != xno; then
- dnl check in the system pkgconfig
-   PKG_CHECK_MODULES([debuginfod], [libdebuginfod >= 0.179],
--    [have_debuginfod=1],
-+    [have_debuginfod=1
-+     AC_DEFINE([HAVE_LIBDEBUGINFOD], [1], [Define to 1 if debuginfod is enabled.])],
-     [if test "x$with_debuginfod" = xyes; then
-        AC_MSG_ERROR(["--with-debuginfod was given, but libdebuginfod is missing or unusable."])
-      fi])
--  AC_DEFINE([HAVE_LIBDEBUGINFOD], [1], [Define to 1 if debuginfod is enabled.])
--  AC_MSG_RESULT([yes])  
- else
-   AC_MSG_RESULT([no])
- fi
--- 
-2.31.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
index 15a6f2a9a5..51f088ac85 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
@@ -1,4 +1,4 @@
-From 6288ba5df0a8c73ef842b609081449ac4de86123 Mon Sep 17 00:00:00 2001
+From 27dec5c68e09e96ce73aecbc656384151fbe0071 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 18 Jul 2018 16:58:33 +0800
 Subject: [PATCH] improve reproducibility for c++ compiling
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/stringtable.h b/stringtable.h
-index 5fc42e7..6fd8a1e 100644
+index 5fc42e7ab..6fd8a1e26 100644
 --- a/stringtable.h
 +++ b/stringtable.h
 @@ -19,7 +19,7 @@
@@ -26,6 +26,3 @@ index 5fc42e7..6fd8a1e 100644
  
  // XXX: experimental tunables
  #define INTERNED_STRING_FIND_MEMMEM 1 /* perf stat indicates a very slight benefit */
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
deleted file mode 100644
index afdc10a3fe..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00 2001
-From: "Frank Ch. Eigler" <fche@redhat.com>
-Date: Sat, 4 Nov 2023 12:19:59 -0400
-Subject: [PATCH] prerelease datestamp fixes
-
-Upstream-Status: Backport
----
- NEWS | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/NEWS b/NEWS
-index c7f31e8b7..f0f9056c4 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,4 +1,4 @@
--* What's new in version 5.0, 2023-11-03
-+* What's new in version 5.0, 2023-11-04
- 
- - Performance improvements in uprobe registration and module startup.
- 
--- 
-2.31.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
index 1decf21593..c52e31d435 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
@@ -1,4 +1,4 @@
-From 191f528da19193d713d94ee252e2485efd9af4d3 Mon Sep 17 00:00:00 2001
+From 039819ca1cfab8b7b5ef77cc437baf8e946b9441 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 25 Oct 2021 17:59:24 +0200
 Subject: [PATCH] staprun: address ncurses 6.3 failures
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/staprun/monitor.c b/staprun/monitor.c
-index 478634c09..f4fbfd686 100644
+index 851ee14c4..7d83a3846 100644
 --- a/staprun/monitor.c
 +++ b/staprun/monitor.c
-@@ -448,12 +448,12 @@ void monitor_render(void)
+@@ -453,12 +453,12 @@ void monitor_render(void)
        if (active_window == 0)
          wattron(status, A_BOLD);
        wprintw(status, "\n%*s\t%*s\t%*s\t%*s\t%*s\t%*s\t%s\n",
@@ -32,7 +32,7 @@ index 478634c09..f4fbfd686 100644
                HIGHLIGHT("name", p_name, comp_fn_index));
        if (active_window == 0)
          wattroff(status, A_BOLD);
-@@ -466,17 +466,17 @@ void monitor_render(void)
+@@ -471,17 +471,17 @@ void monitor_render(void)
            json_object *probe, *field;
            probe = json_object_array_get_idx(jso_probe_list, i);
            json_object_object_get_ex(probe, "index", &field);
@@ -56,6 +56,3 @@ index 478634c09..f4fbfd686 100644
            getyx(status, discard, cur_x);
            json_object_object_get_ex(probe, "name", &field);
            wprintw(status, "%.*s", max_cols-cur_x-1, json_object_get_string(field));
--- 
-2.20.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch
deleted file mode 100644
index 22578fb3f6..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 52596f023652114642faba5726c99488529029ce Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Thu, 21 Dec 2023 10:00:06 +0000
-Subject: [PATCH] staprun: fix build against upcoming `gcc-14`
- (`-Werror=calloc-transposed-args`)
-
-`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
-detected minor infelicity in `calloc()` API usage in `systemtap`:
-
-    staprun.c: In function 'main':
-    staprun.c:550:50: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
-      550 |                 char ** new_argv = calloc(sizeof(char *),argc+2);
-          |                                                  ^~~~
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=52596f023652114642faba5726c99488529029ce]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- staprun/staprun.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/staprun/staprun.c b/staprun/staprun.c
-index 8437f3af6..d1b0b221b 100644
---- a/staprun/staprun.c
-+++ b/staprun/staprun.c
-@@ -547,7 +547,7 @@ int main(int argc, char **argv)
-            us to extend argv[], with all the C fun that entails. */
- #ifdef HAVE_OPENAT
-         if (relay_basedir_fd >= 0) {
--                char ** new_argv = calloc(sizeof(char *),argc+2);
-+                char ** new_argv = calloc(argc+2, sizeof(char *));
-                 const int new_Foption_size = 10; /* -FNNNNN */
-                 char * new_Foption = malloc(new_Foption_size);
-                 int i;
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
index e2f8b3b057..db029e0146 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
@@ -1,4 +1,4 @@
-From 3e13a006fe3dff9489269274093bf868532036e2 Mon Sep 17 00:00:00 2001
+From 77b359d64264f536210fed4c3c54737a1ed22502 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Tue, 5 Sep 2017 16:02:55 -0700
 Subject: [PATCH] staprun/stapbpf: don't support installing a non-root
@@ -10,15 +10,14 @@ the binaries.
 Upstream-Status: Inappropriate [Embedded]
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 ---
- stapbpf/Makefile.am | 14 +++++++-------
- staprun/Makefile.am | 12 ++++++------
- 2 files changed, 13 insertions(+), 13 deletions(-)
+ stapbpf/Makefile.am | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
-Index: git/stapbpf/Makefile.am
-===================================================================
---- git.orig/stapbpf/Makefile.am
-+++ git/stapbpf/Makefile.am
-@@ -41,10 +41,10 @@
+diff --git a/stapbpf/Makefile.am b/stapbpf/Makefile.am
+index bb0c1eef8..323003b88 100644
+--- a/stapbpf/Makefile.am
++++ b/stapbpf/Makefile.am
+@@ -40,10 +40,10 @@ git_version.stamp ../git_version.h:
  
  # Why the "id -u" condition?  This way, an unprivileged user can run
  # make install, and have "sudo stap ...." or "sudo stapbpf ...." work later.
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 68f5c76428..01c87a5727 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,10 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
-SRC_URI += " \
+SRC_URI += "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
+           file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
+           file://0001-Install-python-modules-to-correct-library-dir.patch \
+           file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
            "
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c574bcb2ba..e859109356 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "e72dc118e563c645d93a1a2d771e8d90e8fec1ae"
-PV = "5.0"
+SRCREV = "3a0c9c15163520dd0d9ab07177da62ce9cc2332f"
+PV = "5.1"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.44.0


--===============1925154317740060424==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-upgrade-5.0-5.1.patch"

RnJvbSAwZDAwZmRhN2NlN2I1MDZiODY5NTY3MzUwZGM5YjY5YTIyZDM5MTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMzoyNzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbXRhcDogdXBncmFkZSA1LjAgLT4gNS4xCgotLS0KIC4uLmd1cmUtd3JpdGUtYS1weXRob24t
bG9jYXRpb24taW50by10aC5wYXRjaCB8ICA3ICstLQogLi4ueXRob24tbW9kdWxlcy10by1jb3Jy
ZWN0LWxpYnJhcnktZGlyLnBhdGNoIHwgIDcgKy0tCiAuLi52ZS1ydW50aW1lLWxpbnV4LXVwcm9i
ZXMtYW5kLXJ1bnRpbWUucGF0Y2ggfCA0MCAtLS0tLS0tLS0tLS0tLS0KIC4uLngtZml4LWJ1aWxk
LWFnYWluc3QtdXBjb21pbmctZ2NjLTE0LS5wYXRjaCB8IDQwIC0tLS0tLS0tLS0tLS0tLQogLi4u
LWJyb2tlbi1saWJkZWJ1Z2luZm9kLWxpYnJhcnktYXV0by1kLnBhdGNoIHwgNTEgLS0tLS0tLS0t
LS0tLS0tLS0tLQogLi4ucm92ZS1yZXByb2R1Y2liaWxpdHktZm9yLWMtY29tcGlsaW5nLnBhdGNo
IHwgIDcgKy0tCiAuLi4vMDAwMS1wcmVyZWxlYXNlLWRhdGVzdGFtcC1maXhlcy5wYXRjaCAgICAg
fCAyMyAtLS0tLS0tLS0KIC4uLnN0YXBydW4tYWRkcmVzcy1uY3Vyc2VzLTYuMy1mYWlsdXJlcy5w
YXRjaCB8IDExICsrLS0KIC4uLmQtYWdhaW5zdC11cGNvbWluZy1nY2MtMTQtV2Vycm9yLWNhbC5w
YXRjaCB8IDM2IC0tLS0tLS0tLS0tLS0KIC4uLi1kb24tdC1zdXBwb3J0LWluc3RhbGxpbmctYS1u
b24tcm9vdC5wYXRjaCB8IDE3ICsrKy0tLS0KIC4uLi9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAv
c3lzdGVtdGFwX2dpdC5iYiB8ICA1ICstCiAuLi4vc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5j
ICAgICAgICAgICAgICAgfCAgNCArLQogMTIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygr
KSwgMjI0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJu
ZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLU1ha2VmaWxlLmFtLXJlbW92ZS1ydW50aW1lLWxp
bnV4LXVwcm9iZXMtYW5kLXJ1bnRpbWUucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1icGYtdHJhbnNsYXRlLmN4eC1m
aXgtYnVpbGQtYWdhaW5zdC11cGNvbWluZy1nY2MtMTQtLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtY29uZmlndXJl
LmFjLWZpeC1icm9rZW4tbGliZGVidWdpbmZvZC1saWJyYXJ5LWF1dG8tZC5wYXRjaAogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAx
LXByZXJlbGVhc2UtZGF0ZXN0YW1wLWZpeGVzLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtc3RhcHJ1bi1maXgtYnVp
bGQtYWdhaW5zdC11cGNvbWluZy1nY2MtMTQtV2Vycm9yLWNhbC5wYXRjaAoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLURvLW5vdC1sZXQt
Y29uZmlndXJlLXdyaXRlLWEtcHl0aG9uLWxvY2F0aW9uLWludG8tdGgucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1Eby1ub3QtbGV0LWNvbmZpZ3Vy
ZS13cml0ZS1hLXB5dGhvbi1sb2NhdGlvbi1pbnRvLXRoLnBhdGNoCmluZGV4IDc0MmIxMTg3ZmMu
LjQxMmY5NWFjNjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcC8wMDAxLURvLW5vdC1sZXQtY29uZmlndXJlLXdyaXRlLWEtcHl0aG9uLWxvY2F0aW9u
LWludG8tdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVt
dGFwLzAwMDEtRG8tbm90LWxldC1jb25maWd1cmUtd3JpdGUtYS1weXRob24tbG9jYXRpb24taW50
by10aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWIyOTYxNWVkNmMyZTc3OWI0NzI5MDM1
NjRkYzY4M2RjMTAxNWRlNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDNkYzMxN2Uz
MmVmNWEzOGUwNTQ4NDNhMzcwN2ZmMDk2ZDU2NDhiNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTog
V2VkLCAyMiBGZWIgMjAxNyAxMzozNzozMyArMDIwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qg
bGV0IGNvbmZpZ3VyZSB3cml0ZSBhIHB5dGhvbiBsb2NhdGlvbiBpbnRvIHRoZSBkdHJhY2UKQEAg
LTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9kdHJhY2UuaW4gYi9kdHJhY2UuaW4KLWluZGV4IDVlMWNm
ODA3OS4uYTI0MjI5Y2JjIDEwMDY0NAoraW5kZXggNzNhNmYyMmUyLi44NzA5OTllMzYgMTAwNjQ0
CiAtLS0gYS9kdHJhY2UuaW4KICsrKyBiL2R0cmFjZS5pbgogQEAgLTEsNCArMSw0IEBACkBAIC0y
MCw2ICsyMCwzIEBAIGluZGV4IDVlMWNmODA3OS4uYTI0MjI5Y2JjIDEwMDY0NAogICMgdmltOiBl
dCBzdGEgc3RzPTQgc3c9NCB0cz04CiAgCiAgIyBUaGlzIGhhbmRsZXMgdGhlIHN5c3RlbXRhcCBl
cXVpdmFsZW50IG9mCi0tLSAKLTIuMTEuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2Vy
bmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1JbnN0YWxsLXB5dGhvbi1tb2R1bGVzLXRvLWNv
cnJlY3QtbGlicmFyeS1kaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9z
eXN0ZW10YXAvMDAwMS1JbnN0YWxsLXB5dGhvbi1tb2R1bGVzLXRvLWNvcnJlY3QtbGlicmFyeS1k
aXIucGF0Y2gKaW5kZXggNDhjZjRhZWU4NS4uZjJmZWRlMmEyYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtSW5zdGFsbC1weXRob24tbW9k
dWxlcy10by1jb3JyZWN0LWxpYnJhcnktZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLUluc3RhbGwtcHl0aG9uLW1vZHVsZXMtdG8tY29y
cmVjdC1saWJyYXJ5LWRpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmFkYTIyZjA1NDYw
MjIzOTI0ZWZlNTQwODBjYjQ0MTllMmI0YzI3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMGE3ZGQzMDRlNWJlMTRkZjI0ZTE2ZmExZDFmODZkMWI3Mzk2MjQzMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogRGF0ZTogRnJpLCAyNCBGZWIgMjAxNyAxNzo1MzowMiArMDIwMAogU3ViamVjdDogW1BB
VENIXSBJbnN0YWxsIHB5dGhvbiBtb2R1bGVzIHRvIGNvcnJlY3QgbGlicmFyeSBkaXIuCkBAIC0x
OSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJp
dmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvcHl0aG9uL01ha2VmaWxlLmFtIGIvcHl0aG9uL01ha2VmaWxlLmFt
Ci1pbmRleCBhMjU0NDgwLi41Nzg2MDJmIDEwMDY0NAoraW5kZXggYTI1NDQ4MGY5Li41Nzg2MDJm
ZGQgMTAwNjQ0CiAtLS0gYS9weXRob24vTWFrZWZpbGUuYW0KICsrKyBiL3B5dGhvbi9NYWtlZmls
ZS5hbQogQEAgLTgsNiArOCwxMCBAQCBBVVRPTUFLRV9PUFRJT05TID0gc3ViZGlyLW9iamVjdHMK
QEAgLTUxLDYgKzUxLDMgQEAgaW5kZXggYTI1NDQ4MC4uNTc4NjAyZiAxMDA2NDQKICAJIC0tc2lu
Z2xlLXZlcnNpb24tZXh0ZXJuYWxseS1tYW5hZ2VkIFwKICAJIC0tcmVjb3JkICQoc2hlbGwgcmVh
ZGxpbmsgLWYgJChidWlsZGRpcikpL3B5M2J1aWxkL2luc3RhbGxfZmlsZXMudHh0IFwKICAgICAg
ICAgICAtLXZlcmJvc2UpCi0tLSAKLTIuNy40Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLU1ha2VmaWxlLmFtLXJlbW92ZS1ydW50aW1l
LWxpbnV4LXVwcm9iZXMtYW5kLXJ1bnRpbWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5
c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1NYWtlZmlsZS5hbS1yZW1vdmUtcnVudGltZS1saW51eC11
cHJvYmVzLWFuZC1ydW50aW1lLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAy
ZDQ2YTM5NjJkLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFw
L3N5c3RlbXRhcC8wMDAxLU1ha2VmaWxlLmFtLXJlbW92ZS1ydW50aW1lLWxpbnV4LXVwcm9iZXMt
YW5kLXJ1bnRpbWUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MCArMCwwIEBACi1Gcm9tIDVh
MDFlMjhiZDgwNjMyNmIyMTQzZTNlNmJiMjhkNDc4MGM1ZDg3OWQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCi1Gcm9tOiBWaWN0b3IgS2FtZW5za3kgPHZpY3Rvci5rYW1lbnNreTdAZ21haWwuY29t
PgotRGF0ZTogU3VuLCAzIERlYyAyMDIzIDE4OjQwOjA1IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0hd
IE1ha2VmaWxlLmFtOiByZW1vdmUgcnVudGltZS9saW51eC91cHJvYmVzIGFuZAotIHJ1bnRpbWUv
bGludXgvdXByb2JlczIgaW5zdGFsbAotCi0iUFIzMDQzNCBjb250aW51YXRpb246ICBSZW1vdmVk
IG9sZCB1cHJvYmVzLCB1cHJvYmVzMiBpbXBsZW1lbnRhdGlvbiwKLXVwcm9iZXMtaW5jLmggJiBh
bnkgbWVudGlvbnMgb2YgQ09ORklHX1VUUkFDRS4iIGNvbW1pdCByZW1vdmVkIHVwcm9iZXMsCi1h
bmQgdXByb2JlczIgc291cmNlcyBhbmQgZGlyZWN0b3JpZXMsIGJ1dCBNYWtlZmlsZS5hbSBzdGls
bCB0cmllcyB0bwotaW5zdGFsbCB0aGVtLiBJbiBmYWN0IGFmdGVyIGZhaWxpbmcgdG8gJ2NkJyBp
bnRvIHJ1bnRpbWUvbGludXgvdXByb2JlcwotZGlyZWN0b3J5IGl0IGNvcGllcyB0b3AgbGV2ZWwg
Ki5bY2hdIGZpbGVzIGludG8KLSR7cHJlZml4fS9zaGFyZS9zeXN0ZW10YXAvcnVudGltZS9saW51
eC91cHJvYmVzIGRpcmVjdG9yeS4KLQotVGhlIGlzc3VlIHdhcyBjYXVnaHQgYnkgT3BlbkVtYmVk
ZGVkIHByb2plY3QgZG9fcGFja2FnZV9xYSBjaGVja3MuCi0KLVNpZ25lZC1vZmYtYnk6IFZpY3Rv
ciBLYW1lbnNreSA8dmljdG9yLmthbWVuc2t5N0BnbWFpbC5jb20+Ci0KLVVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtodHRwczovL3NvdXJjZXdhcmUub3JnL3BpcGVybWFpbC9zeXN0ZW10YXAv
MjAyM3E0LzAyNzg4MC5odG1sXSAKLS0tLQotIE1ha2VmaWxlLmFtIHwgNCAtLS0tCi0gMSBmaWxl
IGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01h
a2VmaWxlLmFtCi1pbmRleCA1NzM3YzZiMjAuLjJiYTg5NjA4OCAxMDA2NDQKLS0tLSBhL01ha2Vm
aWxlLmFtCi0rKysgYi9NYWtlZmlsZS5hbQotQEAgLTI3NywxMCArMjc3LDYgQEAgZW5kaWYKLSAJ
CWRvICQoSU5TVEFMTF9EQVRBKSAtRCAkJGYgJChERVNURElSKSQocGtnZGF0YWRpcikvcnVudGlt
ZS9zb2Z0ZmxvYXQvJCRmOyBkb25lKQotIAkoY2QgJChzcmNkaXIpL3J1bnRpbWUvbGludXg7IGZv
ciBmIGluICouW2NoXTsgXAotIAkJZG8gJChJTlNUQUxMX0RBVEEpIC1EICQkZiAkKERFU1RESVIp
JChwa2dkYXRhZGlyKS9ydW50aW1lL2xpbnV4LyQkZjsgZG9uZSkKLS0JKGNkICQoc3JjZGlyKS9y
dW50aW1lL2xpbnV4L3Vwcm9iZXM7IGZvciBmIGluIE1ha2VmaWxlICouW2NoXTsgXAotLQkJZG8g
JChJTlNUQUxMX0RBVEEpIC1EICQkZiAkKERFU1RESVIpJChwa2dkYXRhZGlyKS9ydW50aW1lL2xp
bnV4L3Vwcm9iZXMvJCRmOyBkb25lKQotLQkoY2QgJChzcmNkaXIpL3J1bnRpbWUvbGludXgvdXBy
b2JlczI7IGZvciBmIGluICouW2NoXTsgXAotLQkJZG8gJChJTlNUQUxMX0RBVEEpIC1EICQkZiAk
KERFU1RESVIpJChwa2dkYXRhZGlyKS9ydW50aW1lL2xpbnV4L3Vwcm9iZXMyLyQkZjsgZG9uZSkK
LSAJKGNkICQoc3JjZGlyKS90YXBzZXQ7IGZpbmQgLiBcKCAtbmFtZSAnKi5zdHAnIC1vIC1uYW1l
ICcqLnN0cG0nIC1vIC1uYW1lIFJFQURNRSBcKSAtcHJpbnQgXAotIAkJfCB3aGlsZSByZWFkIGY7
IGRvICQoSU5TVEFMTF9EQVRBKSAtRCAkJGYgJChERVNURElSKSQocGtnZGF0YWRpcikvdGFwc2V0
LyQkZjsgZG9uZSkKLSAJKGNkICQoc3JjZGlyKS90ZXN0c3VpdGUvc3lzdGVtdGFwLmV4YW1wbGVz
OyBmaW5kIC4gLXR5cGUgZiAtcHJpbnQgXAotLS0gCi0yLjMxLjEKLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtYnBmLXRyYW5zbGF0ZS5j
eHgtZml4LWJ1aWxkLWFnYWluc3QtdXBjb21pbmctZ2NjLTE0LS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWJwZi10cmFuc2xhdGUuY3h4LWZpeC1i
dWlsZC1hZ2FpbnN0LXVwY29taW5nLWdjYy0xNC0ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IGUzZDk0ZDkzMTIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5l
bC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtYnBmLXRyYW5zbGF0ZS5jeHgtZml4LWJ1aWxkLWFn
YWluc3QtdXBjb21pbmctZ2NjLTE0LS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQwICswLDAg
QEAKLUZyb20gZDQyMTM5Y2Y5Y2QyNmQwYzAzNjNmY2ZlMDA3NzE2YmFlYjhkZTUxNyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFNlcmdlaSBUcm9maW1vdmljaCA8c2x5aWNoQGdtYWls
LmNvbT4KLURhdGU6IEZyaSwgMjIgRGVjIDIwMjMgMTk6NDI6MzggKzAwMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gYnBmLXRyYW5zbGF0ZS5jeHg6IGZpeCBidWlsZCBhZ2FpbnN0IHVwY29taW5nIGBnY2Mt
MTRgCi0gKGAtV2Vycm9yPWNhbGxvYy10cmFuc3Bvc2VkLWFyZ3NgKQotCi1gZ2NjLTE0YCBhZGRl
ZCBhIG5ldyBgLVdjYWxsb2MtdHJhbnNwb3NlZC1hcmdzYCB3YXJuaW5nIHJlY2VudGx5LiBJdAot
ZGV0ZWN0ZWQgbWlub3IgaW5mZWxpY2l0eSBpbiBgY2FsbG9jKClgIEFQSSB1c2FnZSBpbiBgc3lz
dGVtdGFwYDoKLQotICAgIGJwZi10cmFuc2xhdGUuY3h4OiBJbiBmdW5jdGlvbiAnYnBmOjpCUEZf
U2VjdGlvbiogYnBmOjpvdXRwdXRfcHJvYmUoQlBGX091dHB1dCYsIHByb2dyYW0mLCBjb25zdCBz
dGQ6OnN0cmluZyYsIHVuc2lnbmVkIGludCknOgotICAgIGJwZi10cmFuc2xhdGUuY3h4OjUwNDQ6
Mzk6IGVycm9yOiAndm9pZCogY2FsbG9jKHNpemVfdCwgc2l6ZV90KScgc2l6ZXMgc3BlY2lmaWVk
IHdpdGggJ3NpemVvZicgaW4gdGhlIGVhcmxpZXIgYXJndW1lbnQgYW5kIG5vdCBpbiB0aGUgbGF0
ZXIgYXJndW1lbnQgWy1XZXJyb3I9Y2FsbG9jLXRyYW5zcG9zZWQtYXJnc10KLSAgICAgNTA0NCB8
ICAgYnBmX2luc24gKmJ1ZiA9IChicGZfaW5zbiopIGNhbGxvYyAoc2l6ZW9mKGJwZl9pbnNuKSwg
bmluc25zKTsKLSAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fgotICAgIGJwZi10cmFuc2xhdGUuY3h4OjUwNDQ6Mzk6IG5vdGU6
IGVhcmxpZXIgYXJndW1lbnQgc2hvdWxkIHNwZWNpZnkgbnVtYmVyIG9mIGVsZW1lbnRzLCBsYXRl
ciBzaXplIG9mIGVhY2ggZWxlbWVudAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRw
czovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1zeXN0ZW10YXAuZ2l0O2E9Y29tbWl0O2g9ZDQyMTM5
Y2Y5Y2QyNmQwYzAzNjNmY2ZlMDA3NzE2YmFlYjhkZTUxN10KLVNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBicGYtdHJhbnNsYXRlLmN4eCB8IDQgKyst
LQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRp
ZmYgLS1naXQgYS9icGYtdHJhbnNsYXRlLmN4eCBiL2JwZi10cmFuc2xhdGUuY3h4Ci1pbmRleCAx
YTkzMDI0NjMuLmFhOGVmNjVjZSAxMDA2NDQKLS0tLSBhL2JwZi10cmFuc2xhdGUuY3h4Ci0rKysg
Yi9icGYtdHJhbnNsYXRlLmN4eAotQEAgLTUwNDEsOSArNTA0MSw5IEBAIG91dHB1dF9wcm9iZShC
UEZfT3V0cHV0ICZlbywgcHJvZ3JhbSAmcHJvZywKLSAJfQotICAgICB9Ci0gCi0tICBicGZfaW5z
biAqYnVmID0gKGJwZl9pbnNuKikgY2FsbG9jIChzaXplb2YoYnBmX2luc24pLCBuaW5zbnMpOwot
KyAgYnBmX2luc24gKmJ1ZiA9IChicGZfaW5zbiopIGNhbGxvYyAobmluc25zLCBzaXplb2YoYnBm
X2luc24pKTsKLSAgIGFzc2VydCAoYnVmKTsKLS0gIEVsZjY0X1JlbCAqcmVsID0gKEVsZjY0X1Jl
bCopIGNhbGxvYyAoc2l6ZW9mKEVsZjY0X1JlbCksIG5yZWxvYyk7Ci0rICBFbGY2NF9SZWwgKnJl
bCA9IChFbGY2NF9SZWwqKSBjYWxsb2MgKG5yZWxvYywgc2l6ZW9mKEVsZjY0X1JlbCkpOwotICAg
YXNzZXJ0IChyZWwpOwotIAotICAgdW5zaWduZWQgaSA9IDAsIHIgPSAwOwotLS0gCi0yLjQzLjAK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAw
MDEtY29uZmlndXJlLmFjLWZpeC1icm9rZW4tbGliZGVidWdpbmZvZC1saWJyYXJ5LWF1dG8tZC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWNvbmZp
Z3VyZS5hYy1maXgtYnJva2VuLWxpYmRlYnVnaW5mb2QtbGlicmFyeS1hdXRvLWQucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDk4NjQxODI2ZjYuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtY29uZmlndXJlLmFj
LWZpeC1icm9rZW4tbGliZGVidWdpbmZvZC1saWJyYXJ5LWF1dG8tZC5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDUxICswLDAgQEAKLUZyb20gMzkxM2FkM2UyOGExOTgxMWUxYjUyMzM4MTEyMzQ0
YTQ4NzA1N2U0ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFZpY3RvciBLYW1lbnNr
eSA8dmljdG9yLmthbWVuc2t5N0BnbWFpbC5jb20+Ci1EYXRlOiBNb24sIDE4IERlYyAyMDIzIDAz
OjEzOjM4ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8yXSBjb25maWd1cmUuYWM6IGZpeCBicm9r
ZW4gbGliZGVidWdpbmZvZCBsaWJyYXJ5IGF1dG8KLSBkZXRlY3Rpb24KLQotQWZ0ZXIgMmU2N2Iw
NTNlMzc5NmVlN2NmMjlhMzlmOTY5ODcyOWI1MjA3ODQwNiAiY29uZmlndXJ5OiByZXdvcmsgZGVi
dWdpbmZvZCBzZWFyY2hlcyIKLWNvbW1pdCwgbGliZGVidWdpbmZvZC5zbyBsaWJyYXJ5IGF1dG8g
ZGV0ZWN0aW9uIGlzIGJyb2tlbi4gSXQgd2FzIHJlcG9ydGVkIGJ5IE1hcnRpbiBKYW5zYQotb24g
b3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0IFsxXS4KLQotQ3VycmVudGx5IGNvbmZpZ3Vy
ZS5hYyBkb2VzICJBQ19ERUZJTkUoW0hBVkVfTElCREVCVUdJTkZPRF0sIFsxXSAuLi4iIGFzIGxv
bmcgYXMKLW5vIC0td2l0aG91dC1kZWJ1Z2luZm9kIG9wdGlvbiBpcyBwYXNzZWQsIHJlZ2FyZGxl
c3MgUEtHX0NIRUNLX01PRFVMRVMgY2hlY2sgcmVzdWx0LgotSXQgc2VlbXMgdG8gYmUgYmFkIGNv
cHkvcGFzdGUuIEFkZHJlc3MgdGhlIGlzc3VlIGJ5IG1vdmluZyB0aGUgQUNfREVGSU5FIGJhY2sg
dG8KLVBLR19DSEVDS19NT0RVTEVTIGFjdGlvbi1pZi1mb3VuZCBibG9jay4KLQotVG8gcmVwcm9k
dWNlIHRoZSBpc3N1ZSBvbiBGQyBzeXN0ZW0sIG9uZSBjYW4gZG8gdGhlIGZvbGxvd2luZwotInN1
ZG8gZG5mIHJlbW92ZSBlbGZ1dGlscy1kZWJ1Z2luZm9kLWNsaWVudC1kZXZlbCIgYW5kIHRoZW4g
dHJ5IHRvIGJ1aWxkIFN5c3RlbVRhcAotdXRpbC5jeHggd2lsbCBmYWlsIHRvIGNvbXBpbGUgYmVj
YXVzZSBvZiBtaXNzaW5nIGVsZnV0aWxzL2RlYnVnaW5mb2QuaCBiZWNhdXNlCi1jb25maWcuaCB3
aWxsIGhhdmUgIiNkZWZpbmUgSEFWRV9MSUJERUJVR0lORk9EIDEiLCB3aGlsZSBjb25maWcubG9n
IGFuZCBjb25maWd1cmUKLW91dHB1dCBpbmRpY2F0ZXMgdGhhdCBjaGVjayBmb3IgbGliZGVidWdp
bmZvZCBsaWJyYXJ5IGZhaWxlZC4KLQotWzFdIGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTkyMTA5P3A9JTJDJTJDJTJDMjAlMkMwJTJD
MCUyQzAlM0ElM0FjcmVhdGVkJTJDMCUyQ3N5c3RlbXRhcCUyQzIwJTJDMiUyQzAlMkMxMDI5ODc1
MTQKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vc291cmNld2FyZS5vcmcv
cGlwZXJtYWlsL3N5c3RlbXRhcC8yMDIzcTQvMDI3OTE0Lmh0bWxdCi1TaWduZWQtb2ZmLWJ5OiBW
aWN0b3IgS2FtZW5za3kgPHZpY3Rvci5rYW1lbnNreTdAZ21haWwuY29tPgotLS0tCi0gY29uZmln
dXJlLmFjIHwgNSArKy0tLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWlu
ZGV4IGQ5NTU5YzVjMy4uMThjZDdmODRhIDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysg
Yi9jb25maWd1cmUuYWMKLUBAIC0yMTksMTIgKzIxOSwxMSBAQCBkbmwgdGFrZSB0aGUgdXNlciBh
dCBoaXMgb3IgaGVyIHdvcmQKLSBlbGlmIHRlc3QgIngkd2l0aF9kZWJ1Z2luZm9kIiAhPSB4bm87
IHRoZW4KLSBkbmwgY2hlY2sgaW4gdGhlIHN5c3RlbSBwa2djb25maWcKLSAgIFBLR19DSEVDS19N
T0RVTEVTKFtkZWJ1Z2luZm9kXSwgW2xpYmRlYnVnaW5mb2QgPj0gMC4xNzldLAotLSAgICBbaGF2
ZV9kZWJ1Z2luZm9kPTFdLAotKyAgICBbaGF2ZV9kZWJ1Z2luZm9kPTEKLSsgICAgIEFDX0RFRklO
RShbSEFWRV9MSUJERUJVR0lORk9EXSwgWzFdLCBbRGVmaW5lIHRvIDEgaWYgZGVidWdpbmZvZCBp
cyBlbmFibGVkLl0pXSwKLSAgICAgW2lmIHRlc3QgIngkd2l0aF9kZWJ1Z2luZm9kIiA9IHh5ZXM7
IHRoZW4KLSAgICAgICAgQUNfTVNHX0VSUk9SKFsiLS13aXRoLWRlYnVnaW5mb2Qgd2FzIGdpdmVu
LCBidXQgbGliZGVidWdpbmZvZCBpcyBtaXNzaW5nIG9yIHVudXNhYmxlLiJdKQotICAgICAgZmld
KQotLSAgQUNfREVGSU5FKFtIQVZFX0xJQkRFQlVHSU5GT0RdLCBbMV0sIFtEZWZpbmUgdG8gMSBp
ZiBkZWJ1Z2luZm9kIGlzIGVuYWJsZWQuXSkKLS0gIEFDX01TR19SRVNVTFQoW3llc10pICAKLSBl
bHNlCi0gICBBQ19NU0dfUkVTVUxUKFtub10pCi0gZmkKLS0tIAotMi4zMS4xCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWltcHJvdmUt
cmVwcm9kdWNpYmlsaXR5LWZvci1jLWNvbXBpbGluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWltcHJvdmUtcmVwcm9kdWNpYmlsaXR5LWZvci1j
LWNvbXBpbGluZy5wYXRjaAppbmRleCAxNWE2ZjJhOWE1Li41MWYwODhhYzg1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1pbXByb3ZlLXJl
cHJvZHVjaWJpbGl0eS1mb3ItYy1jb21waWxpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtl
cm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtaW1wcm92ZS1yZXByb2R1Y2liaWxpdHktZm9y
LWMtY29tcGlsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2Mjg4YmE1ZGYwYThjNzNl
Zjg0MmI2MDkwODE0NDlhYzRkZTg2MTIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
N2RlYzVjNjhlMDllOTZjZTczYWVjYmM2NTYzODQxNTFmYmUwMDcxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogV2VkLCAxOCBKdWwgMjAxOCAxNjo1ODozMyArMDgwMAogU3ViamVjdDogW1BBVENIXSBpbXBy
b3ZlIHJlcHJvZHVjaWJpbGl0eSBmb3IgYysrIGNvbXBpbGluZwpAQCAtMTQsNyArMTQsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS9zdHJpbmd0YWJsZS5oIGIvc3RyaW5ndGFibGUuaAotaW5kZXggNWZjNDJlNy4uNmZkOGExZSAx
MDA2NDQKK2luZGV4IDVmYzQyZTdhYi4uNmZkOGExZTI2IDEwMDY0NAogLS0tIGEvc3RyaW5ndGFi
bGUuaAogKysrIGIvc3RyaW5ndGFibGUuaAogQEAgLTE5LDcgKzE5LDcgQEAKQEAgLTI2LDYgKzI2
LDMgQEAgaW5kZXggNWZjNDJlNy4uNmZkOGExZSAxMDA2NDQKICAKICAvLyBYWFg6IGV4cGVyaW1l
bnRhbCB0dW5hYmxlcwogICNkZWZpbmUgSU5URVJORURfU1RSSU5HX0ZJTkRfTUVNTUVNIDEgLyog
cGVyZiBzdGF0IGluZGljYXRlcyBhIHZlcnkgc2xpZ2h0IGJlbmVmaXQgKi8KLS0tIAotMi43LjQK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAw
MDEtcHJlcmVsZWFzZS1kYXRlc3RhbXAtZml4ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVs
L3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1wcmVyZWxlYXNlLWRhdGVzdGFtcC1maXhlcy5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYWZkYzEwYTNmZS4uMDAwMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1wcmVyZWxl
YXNlLWRhdGVzdGFtcC1maXhlcy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDIzICswLDAgQEAK
LUZyb20gY2ZjMmMxZDUzOTI0ZmFjZTExZTNmYWI3OGRlZDYxYzM1OTc3OGViOSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206ICJGcmFuayBDaC4gRWlnbGVyIiA8ZmNoZUByZWRoYXQuY29t
PgotRGF0ZTogU2F0LCA0IE5vdiAyMDIzIDEyOjE5OjU5IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hd
IHByZXJlbGVhc2UgZGF0ZXN0YW1wIGZpeGVzCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQK
LS0tLQotIE5FV1MgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9ORVdTIGIvTkVXUwotaW5kZXggYzdmMzFlOGI3Li5m
MGY5MDU2YzQgMTAwNjQ0Ci0tLS0gYS9ORVdTCi0rKysgYi9ORVdTCi1AQCAtMSw0ICsxLDQgQEAK
LS0qIFdoYXQncyBuZXcgaW4gdmVyc2lvbiA1LjAsIDIwMjMtMTEtMDMKLSsqIFdoYXQncyBuZXcg
aW4gdmVyc2lvbiA1LjAsIDIwMjMtMTEtMDQKLSAKLSAtIFBlcmZvcm1hbmNlIGltcHJvdmVtZW50
cyBpbiB1cHJvYmUgcmVnaXN0cmF0aW9uIGFuZCBtb2R1bGUgc3RhcnR1cC4KLSAKLS0tIAotMi4z
MS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRh
cC8wMDAxLXN0YXBydW4tYWRkcmVzcy1uY3Vyc2VzLTYuMy1mYWlsdXJlcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLXN0YXBydW4tYWRkcmVzcy1u
Y3Vyc2VzLTYuMy1mYWlsdXJlcy5wYXRjaAppbmRleCAxZGVjZjIxNTkzLi5jNTJlMzFkNDM1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1z
dGFwcnVuLWFkZHJlc3MtbmN1cnNlcy02LjMtZmFpbHVyZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtc3RhcHJ1bi1hZGRyZXNzLW5jdXJz
ZXMtNi4zLWZhaWx1cmVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxOTFmNTI4ZGExOTE5
M2Q3MTNkOTRlZTI1MmUyNDg1ZWZkOWFmNGQzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwMzk4MTljYTFjZmFiOGI3YjVlZjc3Y2M0MzdiYWY4ZTk0NmI5NDQxIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4K
IERhdGU6IE1vbiwgMjUgT2N0IDIwMjEgMTc6NTk6MjQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
c3RhcHJ1bjogYWRkcmVzcyBuY3Vyc2VzIDYuMyBmYWlsdXJlcwpAQCAtMTAsMTAgKzEwLDEwIEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAg
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvc3RhcHJ1bi9tb25pdG9yLmMgYi9zdGFwcnVuL21vbml0b3IuYwotaW5kZXggNDc4
NjM0YzA5Li5mNGZiZmQ2ODYgMTAwNjQ0CitpbmRleCA4NTFlZTE0YzQuLjdkODNhMzg0NiAxMDA2
NDQKIC0tLSBhL3N0YXBydW4vbW9uaXRvci5jCiArKysgYi9zdGFwcnVuL21vbml0b3IuYwotQEAg
LTQ0OCwxMiArNDQ4LDEyIEBAIHZvaWQgbW9uaXRvcl9yZW5kZXIodm9pZCkKK0BAIC00NTMsMTIg
KzQ1MywxMiBAQCB2b2lkIG1vbml0b3JfcmVuZGVyKHZvaWQpCiAgICAgICAgaWYgKGFjdGl2ZV93
aW5kb3cgPT0gMCkKICAgICAgICAgIHdhdHRyb24oc3RhdHVzLCBBX0JPTEQpOwogICAgICAgIHdw
cmludHcoc3RhdHVzLCAiXG4lKnNcdCUqc1x0JSpzXHQlKnNcdCUqc1x0JSpzXHQlc1xuIiwKQEAg
LTMyLDcgKzMyLDcgQEAgaW5kZXggNDc4NjM0YzA5Li5mNGZiZmQ2ODYgMTAwNjQ0CiAgICAgICAg
ICAgICAgICBISUdITElHSFQoIm5hbWUiLCBwX25hbWUsIGNvbXBfZm5faW5kZXgpKTsKICAgICAg
ICBpZiAoYWN0aXZlX3dpbmRvdyA9PSAwKQogICAgICAgICAgd2F0dHJvZmYoc3RhdHVzLCBBX0JP
TEQpOwotQEAgLTQ2NiwxNyArNDY2LDE3IEBAIHZvaWQgbW9uaXRvcl9yZW5kZXIodm9pZCkKK0BA
IC00NzEsMTcgKzQ3MSwxNyBAQCB2b2lkIG1vbml0b3JfcmVuZGVyKHZvaWQpCiAgICAgICAgICAg
IGpzb25fb2JqZWN0ICpwcm9iZSwgKmZpZWxkOwogICAgICAgICAgICBwcm9iZSA9IGpzb25fb2Jq
ZWN0X2FycmF5X2dldF9pZHgoanNvX3Byb2JlX2xpc3QsIGkpOwogICAgICAgICAgICBqc29uX29i
amVjdF9vYmplY3RfZ2V0X2V4KHByb2JlLCAiaW5kZXgiLCAmZmllbGQpOwpAQCAtNTYsNiArNTYs
MyBAQCBpbmRleCA0Nzg2MzRjMDkuLmY0ZmJmZDY4NiAxMDA2NDQKICAgICAgICAgICAgZ2V0eXgo
c3RhdHVzLCBkaXNjYXJkLCBjdXJfeCk7CiAgICAgICAgICAgIGpzb25fb2JqZWN0X29iamVjdF9n
ZXRfZXgocHJvYmUsICJuYW1lIiwgJmZpZWxkKTsKICAgICAgICAgICAgd3ByaW50dyhzdGF0dXMs
ICIlLipzIiwgbWF4X2NvbHMtY3VyX3gtMSwganNvbl9vYmplY3RfZ2V0X3N0cmluZyhmaWVsZCkp
OwotLS0gCi0yLjIwLjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10
YXAvc3lzdGVtdGFwLzAwMDEtc3RhcHJ1bi1maXgtYnVpbGQtYWdhaW5zdC11cGNvbWluZy1nY2Mt
MTQtV2Vycm9yLWNhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3Rl
bXRhcC8wMDAxLXN0YXBydW4tZml4LWJ1aWxkLWFnYWluc3QtdXBjb21pbmctZ2NjLTE0LVdlcnJv
ci1jYWwucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDIyNTc4ZmIzZjYuLjAw
MDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAw
MDEtc3RhcHJ1bi1maXgtYnVpbGQtYWdhaW5zdC11cGNvbWluZy1nY2MtMTQtV2Vycm9yLWNhbC5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM2ICswLDAgQEAKLUZyb20gNTI1OTZmMDIzNjUyMTE0
NjQyZmFiYTU3MjZjOTk0ODg1MjkwMjljZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IFNlcmdlaSBUcm9maW1vdmljaCA8c2x5aWNoQGdtYWlsLmNvbT4KLURhdGU6IFRodSwgMjEgRGVj
IDIwMjMgMTA6MDA6MDYgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gc3RhcHJ1bjogZml4IGJ1aWxk
IGFnYWluc3QgdXBjb21pbmcgYGdjYy0xNGAKLSAoYC1XZXJyb3I9Y2FsbG9jLXRyYW5zcG9zZWQt
YXJnc2ApCi0KLWBnY2MtMTRgIGFkZGVkIGEgbmV3IGAtV2NhbGxvYy10cmFuc3Bvc2VkLWFyZ3Ng
IHdhcm5pbmcgcmVjZW50bHkuIEl0Ci1kZXRlY3RlZCBtaW5vciBpbmZlbGljaXR5IGluIGBjYWxs
b2MoKWAgQVBJIHVzYWdlIGluIGBzeXN0ZW10YXBgOgotCi0gICAgc3RhcHJ1bi5jOiBJbiBmdW5j
dGlvbiAnbWFpbic6Ci0gICAgc3RhcHJ1bi5jOjU1MDo1MDogZXJyb3I6ICdjYWxsb2MnIHNpemVz
IHNwZWNpZmllZCB3aXRoICdzaXplb2YnIGluIHRoZSBlYXJsaWVyIGFyZ3VtZW50IGFuZCBub3Qg
aW4gdGhlIGxhdGVyIGFyZ3VtZW50IFstV2Vycm9yPWNhbGxvYy10cmFuc3Bvc2VkLWFyZ3NdCi0g
ICAgICA1NTAgfCAgICAgICAgICAgICAgICAgY2hhciAqKiBuZXdfYXJndiA9IGNhbGxvYyhzaXpl
b2YoY2hhciAqKSxhcmdjKzIpOwotICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9y
dCBbaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9c3lzdGVtdGFwLmdpdDthPWNvbW1pdDto
PTUyNTk2ZjAyMzY1MjExNDY0MmZhYmE1NzI2Yzk5NDg4NTI5MDI5Y2VdCi1TaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc3RhcHJ1bi9zdGFwcnVuLmMg
fCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0K
LWRpZmYgLS1naXQgYS9zdGFwcnVuL3N0YXBydW4uYyBiL3N0YXBydW4vc3RhcHJ1bi5jCi1pbmRl
eCA4NDM3ZjNhZjYuLmQxYjBiMjIxYiAxMDA2NDQKLS0tLSBhL3N0YXBydW4vc3RhcHJ1bi5jCi0r
KysgYi9zdGFwcnVuL3N0YXBydW4uYwotQEAgLTU0Nyw3ICs1NDcsNyBAQCBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCi0gICAgICAgICAgICB1cyB0byBleHRlbmQgYXJndltdLCB3aXRo
IGFsbCB0aGUgQyBmdW4gdGhhdCBlbnRhaWxzLiAqLwotICNpZmRlZiBIQVZFX09QRU5BVAotICAg
ICAgICAgaWYgKHJlbGF5X2Jhc2VkaXJfZmQgPj0gMCkgewotLSAgICAgICAgICAgICAgICBjaGFy
ICoqIG5ld19hcmd2ID0gY2FsbG9jKHNpemVvZihjaGFyICopLGFyZ2MrMik7Ci0rICAgICAgICAg
ICAgICAgIGNoYXIgKiogbmV3X2FyZ3YgPSBjYWxsb2MoYXJnYysyLCBzaXplb2YoY2hhciAqKSk7
Ci0gICAgICAgICAgICAgICAgIGNvbnN0IGludCBuZXdfRm9wdGlvbl9zaXplID0gMTA7IC8qIC1G
Tk5OTk4gKi8KLSAgICAgICAgICAgICAgICAgY2hhciAqIG5ld19Gb3B0aW9uID0gbWFsbG9jKG5l
d19Gb3B0aW9uX3NpemUpOwotICAgICAgICAgICAgICAgICBpbnQgaTsKLS0tIAotMi40My4wCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAx
LXN0YXBydW4tc3RhcGJwZi1kb24tdC1zdXBwb3J0LWluc3RhbGxpbmctYS1ub24tcm9vdC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLXN0YXBydW4t
c3RhcGJwZi1kb24tdC1zdXBwb3J0LWluc3RhbGxpbmctYS1ub24tcm9vdC5wYXRjaAppbmRleCBl
MmY4YjNiMDU3Li5kYjAyOWUwMTQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5
c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1zdGFwcnVuLXN0YXBicGYtZG9uLXQtc3VwcG9ydC1pbnN0
YWxsaW5nLWEtbm9uLXJvb3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10
YXAvc3lzdGVtdGFwLzAwMDEtc3RhcHJ1bi1zdGFwYnBmLWRvbi10LXN1cHBvcnQtaW5zdGFsbGlu
Zy1hLW5vbi1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzZTEzYTAwNmZlM2RmZjk0
ODkyNjkyNzQwOTNiZjg2ODUzMjAzNmUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3
N2IzNTlkNjQyNjRmNTM2MjEwZmVkNGMzYzU0NzM3YTFlZDIyNTAyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tPgogRGF0ZTogVHVl
LCA1IFNlcCAyMDE3IDE2OjAyOjU1IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN0YXBydW4vc3Rh
cGJwZjogZG9uJ3Qgc3VwcG9ydCBpbnN0YWxsaW5nIGEgbm9uLXJvb3QKQEAgLTEwLDE1ICsxMCwx
NCBAQCB0aGUgYmluYXJpZXMuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW0VtYmVk
ZGVkXQogU2lnbmVkLW9mZi1ieTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tPgogLS0t
Ci0gc3RhcGJwZi9NYWtlZmlsZS5hbSB8IDE0ICsrKysrKystLS0tLS0tCi0gc3RhcHJ1bi9NYWtl
ZmlsZS5hbSB8IDEyICsrKysrKy0tLS0tLQotIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCisgc3RhcGJwZi9NYWtlZmlsZS5hbSB8IDEyICsrKysrKy0t
LS0tLQorIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiAK
LUluZGV4OiBnaXQvc3RhcGJwZi9NYWtlZmlsZS5hbQotPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGdpdC5vcmln
L3N0YXBicGYvTWFrZWZpbGUuYW0KLSsrKyBnaXQvc3RhcGJwZi9NYWtlZmlsZS5hbQotQEAgLTQx
LDEwICs0MSwxMCBAQAorZGlmZiAtLWdpdCBhL3N0YXBicGYvTWFrZWZpbGUuYW0gYi9zdGFwYnBm
L01ha2VmaWxlLmFtCitpbmRleCBiYjBjMWVlZjguLjMyMzAwM2I4OCAxMDA2NDQKKy0tLSBhL3N0
YXBicGYvTWFrZWZpbGUuYW0KKysrKyBiL3N0YXBicGYvTWFrZWZpbGUuYW0KK0BAIC00MCwxMCAr
NDAsMTAgQEAgZ2l0X3ZlcnNpb24uc3RhbXAgLi4vZ2l0X3ZlcnNpb24uaDoKICAKICAjIFdoeSB0
aGUgImlkIC11IiBjb25kaXRpb24/ICBUaGlzIHdheSwgYW4gdW5wcml2aWxlZ2VkIHVzZXIgY2Fu
IHJ1bgogICMgbWFrZSBpbnN0YWxsLCBhbmQgaGF2ZSAic3VkbyBzdGFwIC4uLi4iIG9yICJzdWRv
IHN0YXBicGYgLi4uLiIgd29yayBsYXRlci4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3Rl
bXRhcC9zeXN0ZW10YXBfZ2l0LmJiCmluZGV4IDY4ZjVjNzY0MjguLjAxYzg3YTU3MjcgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5iYgpAQCAtNiw3
ICs2LDEwIEBAIEhPTUVQQUdFID0gImh0dHBzOi8vc291cmNld2FyZS5vcmcvc3lzdGVtdGFwLyIK
IAogcmVxdWlyZSBzeXN0ZW10YXBfZ2l0LmluYwogCi1TUkNfVVJJICs9ICIgXAorU1JDX1VSSSAr
PSAiZ2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L3N5c3RlbXRhcC5naXQ7YnJhbmNoPW1hc3Rlcjtw
cm90b2NvbD1odHRwcyBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvLW5vdC1sZXQtY29uZmln
dXJlLXdyaXRlLWEtcHl0aG9uLWxvY2F0aW9uLWludG8tdGgucGF0Y2ggXAorICAgICAgICAgICBm
aWxlOi8vMDAwMS1JbnN0YWxsLXB5dGhvbi1tb2R1bGVzLXRvLWNvcnJlY3QtbGlicmFyeS1kaXIu
cGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1zdGFwcnVuLXN0YXBicGYtZG9uLXQtc3Vw
cG9ydC1pbnN0YWxsaW5nLWEtbm9uLXJvb3QucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1pbXByb3ZlLXJlcHJvZHVjaWJpbGl0eS1mb3ItYy1jb21waWxpbmcucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1zdGFwcnVuLWFkZHJlc3MtbmN1cnNlcy02LjMtZmFpbHVyZXMucGF0
Y2ggXAogICAgICAgICAgICAiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3Rl
bXRhcC9zeXN0ZW10YXBfZ2l0LmluYyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcF9naXQuaW5jCmluZGV4IGM1NzRiY2IyYmEuLmU4NTkxMDkzNTYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCisrKyBiL21l
dGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCkBAIC0xLDcgKzEs
NyBAQAogTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKLVNSQ1JFViA9
ICJlNzJkYzExOGU1NjNjNjQ1ZDkzYTFhMmQ3NzFlOGQ5MGU4ZmVjMWFlIgotUFYgPSAiNS4wIgor
U1JDUkVWID0gIjNhMGM5YzE1MTYzNTIwZGQwZDlhYjA3MTc3ZGE2MmNlOWNjMjMzMmYiCitQViA9
ICI1LjEiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L3N5c3RlbXRhcC5n
aXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LURvLW5vdC1sZXQtY29uZmlndXJlLXdyaXRlLWEtcHl0aG9uLWxvY2F0aW9uLWludG8tdGgucGF0
Y2ggXAotLSAKMi40NC4wCgo=

--===============1925154317740060424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-native_git.bb: Unable to get checksum for nativesdk-systemtap-native SRC_URI entry 0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.1/poky/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/poky/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/poky/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.1/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.1/x86-64/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/x86-64/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/x86-64/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.1/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
ERROR: /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap_git.bb: Unable to get checksum for nativesdk-systemtap SRC_URI entry 0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.1/poky/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/poky/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/poky/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.1/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.1/x86-64/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/x86-64/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/x86-64/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.1/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
ERROR: Parsing halted due to errors, see error messages above

--===============1925154317740060424==--

