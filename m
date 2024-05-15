Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6E9C3DA5E
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:30 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1275.1715794337852088800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JJAcUuQt;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2M3cItS/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018f7d4fe52f-b0ed17f3-1b8b-4742-bfa6-ab852de37fc6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6w2YD6LPlnC+7YpR4Jwhk4WUDkB8Ub2frrDxRDyJBZU=;
	b=JJAcUuQtO+hxNi8Wv+GAjjovU88ZpE9WT7k9f7zDxhy3BG1QCSDZknUOh9fH4rFH
	MlVwGhqygJ5yr2/IlXK4HQpjNxT/5qlrwPu4zBBw+VPQuDCJxsDsKF5G1Xf5J2ZTMxI
	372zkgD9N4ebYwcsFzvXH6jXPpAcUxJTgKHo8l0U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6w2YD6LPlnC+7YpR4Jwhk4WUDkB8Ub2frrDxRDyJBZU=;
	b=2M3cItS/b4Nd1APY0ERpL8ewZJaoIJ0aOMzuNMSIkLU0rIONxPpwe6jeQfnlI555
	ouErN0ej8r0G5/4AjEz8LF/rEmeUW9vPibAIqm18ojIu6xrvV3UhEE5AOnmvAkncdkF
	gYokVEPdNzfFTjRl/ukviv8AmSYx4d8Mz26hMb6U=
Content-Type: multipart/mixed; boundary="===============5226938914875775481=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap: upgrading to 5.1 FAILED
Message-ID: <0101018f7d4fe52f-b0ed17f3-1b8b-4742-bfa6-ab852de37fc6-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199388

--===============5226938914875775481==
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
From 76f0b2c3d65eb1a1bfb4d1e10a2420edacd9ebd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 15:19:18 +0000
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
index 742b1187fc..aafc48205e 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
@@ -1,4 +1,4 @@
-From ab29615ed6c2e779b472903564dc683dc1015de7 Mon Sep 17 00:00:00 2001
+From 7e59c028e99f7a6a6a5bca59075b4f1a2899a73e Mon Sep 17 00:00:00 2001
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
index 48cf4aee85..8cdbf166c2 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
@@ -1,4 +1,4 @@
-From 2ada22f05460223924efe54080cb4419e2b4c276 Mon Sep 17 00:00:00 2001
+From 236c670783d9081846716971c2da9102854f9049 Mon Sep 17 00:00:00 2001
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
index 15a6f2a9a5..97af7179a2 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
@@ -1,4 +1,4 @@
-From 6288ba5df0a8c73ef842b609081449ac4de86123 Mon Sep 17 00:00:00 2001
+From 4df68307300398b310d39ea91b3cd673b089d225 Mon Sep 17 00:00:00 2001
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
index 1decf21593..136b81b9c5 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
@@ -1,4 +1,4 @@
-From 191f528da19193d713d94ee252e2485efd9af4d3 Mon Sep 17 00:00:00 2001
+From 4fb13d3d7e01adc08cdd108e2abf6054425c7891 Mon Sep 17 00:00:00 2001
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
index e2f8b3b057..8158055227 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
@@ -1,4 +1,4 @@
-From 3e13a006fe3dff9489269274093bf868532036e2 Mon Sep 17 00:00:00 2001
+From 512a74333a937ea8c60d8bf493df5491a01ce328 Mon Sep 17 00:00:00 2001
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


--===============5226938914875775481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
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

--===============5226938914875775481==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-upgrade-5.0-5.1.patch"

RnJvbSA3NmYwYjJjM2Q2NWViMWExYmZiNGQxZTEwYTI0MjBlZGFjZDllYmQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTU6MTk6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW10YXA6IHVwZ3JhZGUgNS4wIC0+IDUuMQoKLS0tCiAuLi5ndXJlLXdyaXRlLWEtcHl0aG9u
LWxvY2F0aW9uLWludG8tdGgucGF0Y2ggfCAgNyArLS0KIC4uLnl0aG9uLW1vZHVsZXMtdG8tY29y
cmVjdC1saWJyYXJ5LWRpci5wYXRjaCB8ICA3ICstLQogLi4udmUtcnVudGltZS1saW51eC11cHJv
YmVzLWFuZC1ydW50aW1lLnBhdGNoIHwgNDAgLS0tLS0tLS0tLS0tLS0tCiAuLi54LWZpeC1idWls
ZC1hZ2FpbnN0LXVwY29taW5nLWdjYy0xNC0ucGF0Y2ggfCA0MCAtLS0tLS0tLS0tLS0tLS0KIC4u
Li1icm9rZW4tbGliZGVidWdpbmZvZC1saWJyYXJ5LWF1dG8tZC5wYXRjaCB8IDUxIC0tLS0tLS0t
LS0tLS0tLS0tLS0KIC4uLnJvdmUtcmVwcm9kdWNpYmlsaXR5LWZvci1jLWNvbXBpbGluZy5wYXRj
aCB8ICA3ICstLQogLi4uLzAwMDEtcHJlcmVsZWFzZS1kYXRlc3RhbXAtZml4ZXMucGF0Y2ggICAg
IHwgMjMgLS0tLS0tLS0tCiAuLi5zdGFwcnVuLWFkZHJlc3MtbmN1cnNlcy02LjMtZmFpbHVyZXMu
cGF0Y2ggfCAxMSArKy0tCiAuLi5kLWFnYWluc3QtdXBjb21pbmctZ2NjLTE0LVdlcnJvci1jYWwu
cGF0Y2ggfCAzNiAtLS0tLS0tLS0tLS0tCiAuLi4tZG9uLXQtc3VwcG9ydC1pbnN0YWxsaW5nLWEt
bm9uLXJvb3QucGF0Y2ggfCAxNyArKystLS0tCiAuLi4vcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFw
L3N5c3RlbXRhcF9naXQuYmIgfCAgNSArLQogLi4uL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0Lmlu
YyAgICAgICAgICAgICAgIHwgIDQgKy0KIDEyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMo
KyksIDIyNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2Vy
bmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1NYWtlZmlsZS5hbS1yZW1vdmUtcnVudGltZS1s
aW51eC11cHJvYmVzLWFuZC1ydW50aW1lLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtYnBmLXRyYW5zbGF0ZS5jeHgt
Zml4LWJ1aWxkLWFnYWluc3QtdXBjb21pbmctZ2NjLTE0LS5wYXRjaAogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWNvbmZpZ3Vy
ZS5hYy1maXgtYnJva2VuLWxpYmRlYnVnaW5mb2QtbGlicmFyeS1hdXRvLWQucGF0Y2gKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAw
MS1wcmVyZWxlYXNlLWRhdGVzdGFtcC1maXhlcy5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLXN0YXBydW4tZml4LWJ1
aWxkLWFnYWluc3QtdXBjb21pbmctZ2NjLTE0LVdlcnJvci1jYWwucGF0Y2gKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1Eby1ub3QtbGV0
LWNvbmZpZ3VyZS13cml0ZS1hLXB5dGhvbi1sb2NhdGlvbi1pbnRvLXRoLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtRG8tbm90LWxldC1jb25maWd1
cmUtd3JpdGUtYS1weXRob24tbG9jYXRpb24taW50by10aC5wYXRjaAppbmRleCA3NDJiMTE4N2Zj
Li5hYWZjNDgyMDVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9z
eXN0ZW10YXAvMDAwMS1Eby1ub3QtbGV0LWNvbmZpZ3VyZS13cml0ZS1hLXB5dGhvbi1sb2NhdGlv
bi1pbnRvLXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3Rl
bXRhcC8wMDAxLURvLW5vdC1sZXQtY29uZmlndXJlLXdyaXRlLWEtcHl0aG9uLWxvY2F0aW9uLWlu
dG8tdGgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFiMjk2MTVlZDZjMmU3NzliNDcyOTAz
NTY0ZGM2ODNkYzEwMTVkZTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdlNTljMDI4
ZTk5ZjdhNmE2YTViY2E1OTA3NWI0ZjFhMjg5OWE3M2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IFdlZCwgMjIgRmViIDIwMTcgMTM6Mzc6MzMgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90
IGxldCBjb25maWd1cmUgd3JpdGUgYSBweXRob24gbG9jYXRpb24gaW50byB0aGUgZHRyYWNlCkBA
IC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZHRyYWNlLmluIGIvZHRyYWNlLmluCi1pbmRleCA1ZTFj
ZjgwNzkuLmEyNDIyOWNiYyAxMDA2NDQKK2luZGV4IDczYTZmMjJlMi4uODcwOTk5ZTM2IDEwMDY0
NAogLS0tIGEvZHRyYWNlLmluCiArKysgYi9kdHJhY2UuaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAt
MjAsNiArMjAsMyBAQCBpbmRleCA1ZTFjZjgwNzkuLmEyNDIyOWNiYyAxMDA2NDQKICAjIHZpbTog
ZXQgc3RhIHN0cz00IHN3PTQgdHM9OAogIAogICMgVGhpcyBoYW5kbGVzIHRoZSBzeXN0ZW10YXAg
ZXF1aXZhbGVudCBvZgotLS0gCi0yLjExLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtl
cm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtSW5zdGFsbC1weXRob24tbW9kdWxlcy10by1j
b3JyZWN0LWxpYnJhcnktZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAv
c3lzdGVtdGFwLzAwMDEtSW5zdGFsbC1weXRob24tbW9kdWxlcy10by1jb3JyZWN0LWxpYnJhcnkt
ZGlyLnBhdGNoCmluZGV4IDQ4Y2Y0YWVlODUuLjhjZGJmMTY2YzIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLUluc3RhbGwtcHl0aG9uLW1v
ZHVsZXMtdG8tY29ycmVjdC1saWJyYXJ5LWRpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1JbnN0YWxsLXB5dGhvbi1tb2R1bGVzLXRvLWNv
cnJlY3QtbGlicmFyeS1kaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJhZGEyMmYwNTQ2
MDIyMzkyNGVmZTU0MDgwY2I0NDE5ZTJiNGMyNzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDIzNmM2NzA3ODNkOTA4MTg0NjcxNjk3MWMyZGE5MTAyODU0ZjkwNDkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4KIERhdGU6IEZyaSwgMjQgRmViIDIwMTcgMTc6NTM6MDIgKzAyMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gSW5zdGFsbCBweXRob24gbW9kdWxlcyB0byBjb3JyZWN0IGxpYnJhcnkgZGlyLgpAQCAt
MTksNyArMTksNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRy
aXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL3B5dGhvbi9NYWtlZmlsZS5hbSBiL3B5dGhvbi9NYWtlZmlsZS5h
bQotaW5kZXggYTI1NDQ4MC4uNTc4NjAyZiAxMDA2NDQKK2luZGV4IGEyNTQ0ODBmOS4uNTc4NjAy
ZmRkIDEwMDY0NAogLS0tIGEvcHl0aG9uL01ha2VmaWxlLmFtCiArKysgYi9weXRob24vTWFrZWZp
bGUuYW0KIEBAIC04LDYgKzgsMTAgQEAgQVVUT01BS0VfT1BUSU9OUyA9IHN1YmRpci1vYmplY3Rz
CkBAIC01MSw2ICs1MSwzIEBAIGluZGV4IGEyNTQ0ODAuLjU3ODYwMmYgMTAwNjQ0CiAgCSAtLXNp
bmdsZS12ZXJzaW9uLWV4dGVybmFsbHktbWFuYWdlZCBcCiAgCSAtLXJlY29yZCAkKHNoZWxsIHJl
YWRsaW5rIC1mICQoYnVpbGRkaXIpKS9weTNidWlsZC9pbnN0YWxsX2ZpbGVzLnR4dCBcCiAgICAg
ICAgICAgLS12ZXJib3NlKQotLS0gCi0yLjcuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
a2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1NYWtlZmlsZS5hbS1yZW1vdmUtcnVudGlt
ZS1saW51eC11cHJvYmVzLWFuZC1ydW50aW1lLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9z
eXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtTWFrZWZpbGUuYW0tcmVtb3ZlLXJ1bnRpbWUtbGludXgt
dXByb2Jlcy1hbmQtcnVudGltZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MmQ0NmEzOTYyZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRh
cC9zeXN0ZW10YXAvMDAwMS1NYWtlZmlsZS5hbS1yZW1vdmUtcnVudGltZS1saW51eC11cHJvYmVz
LWFuZC1ydW50aW1lLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDAgKzAsMCBAQAotRnJvbSA1
YTAxZTI4YmQ4MDYzMjZiMjE0M2UzZTZiYjI4ZDQ3ODBjNWQ4NzlkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogVmljdG9yIEthbWVuc2t5IDx2aWN0b3Iua2FtZW5za3k3QGdtYWlsLmNv
bT4KLURhdGU6IFN1biwgMyBEZWMgMjAyMyAxODo0MDowNSAtMDgwMAotU3ViamVjdDogW1BBVENI
XSBNYWtlZmlsZS5hbTogcmVtb3ZlIHJ1bnRpbWUvbGludXgvdXByb2JlcyBhbmQKLSBydW50aW1l
L2xpbnV4L3Vwcm9iZXMyIGluc3RhbGwKLQotIlBSMzA0MzQgY29udGludWF0aW9uOiAgUmVtb3Zl
ZCBvbGQgdXByb2JlcywgdXByb2JlczIgaW1wbGVtZW50YXRpb24sCi11cHJvYmVzLWluYy5oICYg
YW55IG1lbnRpb25zIG9mIENPTkZJR19VVFJBQ0UuIiBjb21taXQgcmVtb3ZlZCB1cHJvYmVzLAot
YW5kIHVwcm9iZXMyIHNvdXJjZXMgYW5kIGRpcmVjdG9yaWVzLCBidXQgTWFrZWZpbGUuYW0gc3Rp
bGwgdHJpZXMgdG8KLWluc3RhbGwgdGhlbS4gSW4gZmFjdCBhZnRlciBmYWlsaW5nIHRvICdjZCcg
aW50byBydW50aW1lL2xpbnV4L3Vwcm9iZXMKLWRpcmVjdG9yeSBpdCBjb3BpZXMgdG9wIGxldmVs
ICouW2NoXSBmaWxlcyBpbnRvCi0ke3ByZWZpeH0vc2hhcmUvc3lzdGVtdGFwL3J1bnRpbWUvbGlu
dXgvdXByb2JlcyBkaXJlY3RvcnkuCi0KLVRoZSBpc3N1ZSB3YXMgY2F1Z2h0IGJ5IE9wZW5FbWJl
ZGRlZCBwcm9qZWN0IGRvX3BhY2thZ2VfcWEgY2hlY2tzLgotCi1TaWduZWQtb2ZmLWJ5OiBWaWN0
b3IgS2FtZW5za3kgPHZpY3Rvci5rYW1lbnNreTdAZ21haWwuY29tPgotCi1VcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9waXBlcm1haWwvc3lzdGVtdGFw
LzIwMjNxNC8wMjc4ODAuaHRtbF0gCi0tLS0KLSBNYWtlZmlsZS5hbSB8IDQgLS0tLQotIDEgZmls
ZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9N
YWtlZmlsZS5hbQotaW5kZXggNTczN2M2YjIwLi4yYmE4OTYwODggMTAwNjQ0Ci0tLS0gYS9NYWtl
ZmlsZS5hbQotKysrIGIvTWFrZWZpbGUuYW0KLUBAIC0yNzcsMTAgKzI3Nyw2IEBAIGVuZGlmCi0g
CQlkbyAkKElOU1RBTExfREFUQSkgLUQgJCRmICQoREVTVERJUikkKHBrZ2RhdGFkaXIpL3J1bnRp
bWUvc29mdGZsb2F0LyQkZjsgZG9uZSkKLSAJKGNkICQoc3JjZGlyKS9ydW50aW1lL2xpbnV4OyBm
b3IgZiBpbiAqLltjaF07IFwKLSAJCWRvICQoSU5TVEFMTF9EQVRBKSAtRCAkJGYgJChERVNURElS
KSQocGtnZGF0YWRpcikvcnVudGltZS9saW51eC8kJGY7IGRvbmUpCi0tCShjZCAkKHNyY2Rpcikv
cnVudGltZS9saW51eC91cHJvYmVzOyBmb3IgZiBpbiBNYWtlZmlsZSAqLltjaF07IFwKLS0JCWRv
ICQoSU5TVEFMTF9EQVRBKSAtRCAkJGYgJChERVNURElSKSQocGtnZGF0YWRpcikvcnVudGltZS9s
aW51eC91cHJvYmVzLyQkZjsgZG9uZSkKLS0JKGNkICQoc3JjZGlyKS9ydW50aW1lL2xpbnV4L3Vw
cm9iZXMyOyBmb3IgZiBpbiAqLltjaF07IFwKLS0JCWRvICQoSU5TVEFMTF9EQVRBKSAtRCAkJGYg
JChERVNURElSKSQocGtnZGF0YWRpcikvcnVudGltZS9saW51eC91cHJvYmVzMi8kJGY7IGRvbmUp
Ci0gCShjZCAkKHNyY2RpcikvdGFwc2V0OyBmaW5kIC4gXCggLW5hbWUgJyouc3RwJyAtbyAtbmFt
ZSAnKi5zdHBtJyAtbyAtbmFtZSBSRUFETUUgXCkgLXByaW50IFwKLSAJCXwgd2hpbGUgcmVhZCBm
OyBkbyAkKElOU1RBTExfREFUQSkgLUQgJCRmICQoREVTVERJUikkKHBrZ2RhdGFkaXIpL3RhcHNl
dC8kJGY7IGRvbmUpCi0gCShjZCAkKHNyY2RpcikvdGVzdHN1aXRlL3N5c3RlbXRhcC5leGFtcGxl
czsgZmluZCAuIC10eXBlIGYgLXByaW50IFwKLS0tIAotMi4zMS4xCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWJwZi10cmFuc2xhdGUu
Y3h4LWZpeC1idWlsZC1hZ2FpbnN0LXVwY29taW5nLWdjYy0xNC0ucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1icGYtdHJhbnNsYXRlLmN4eC1maXgt
YnVpbGQtYWdhaW5zdC11cGNvbWluZy1nY2MtMTQtLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCBlM2Q5NGQ5MzEyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWJwZi10cmFuc2xhdGUuY3h4LWZpeC1idWlsZC1h
Z2FpbnN0LXVwY29taW5nLWdjYy0xNC0ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MCArMCww
IEBACi1Gcm9tIGQ0MjEzOWNmOWNkMjZkMGMwMzYzZmNmZTAwNzcxNmJhZWI4ZGU1MTcgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBTZXJnZWkgVHJvZmltb3ZpY2ggPHNseWljaEBnbWFp
bC5jb20+Ci1EYXRlOiBGcmksIDIyIERlYyAyMDIzIDE5OjQyOjM4ICswMDAwCi1TdWJqZWN0OiBb
UEFUQ0hdIGJwZi10cmFuc2xhdGUuY3h4OiBmaXggYnVpbGQgYWdhaW5zdCB1cGNvbWluZyBgZ2Nj
LTE0YAotIChgLVdlcnJvcj1jYWxsb2MtdHJhbnNwb3NlZC1hcmdzYCkKLQotYGdjYy0xNGAgYWRk
ZWQgYSBuZXcgYC1XY2FsbG9jLXRyYW5zcG9zZWQtYXJnc2Agd2FybmluZyByZWNlbnRseS4gSXQK
LWRldGVjdGVkIG1pbm9yIGluZmVsaWNpdHkgaW4gYGNhbGxvYygpYCBBUEkgdXNhZ2UgaW4gYHN5
c3RlbXRhcGA6Ci0KLSAgICBicGYtdHJhbnNsYXRlLmN4eDogSW4gZnVuY3Rpb24gJ2JwZjo6QlBG
X1NlY3Rpb24qIGJwZjo6b3V0cHV0X3Byb2JlKEJQRl9PdXRwdXQmLCBwcm9ncmFtJiwgY29uc3Qg
c3RkOjpzdHJpbmcmLCB1bnNpZ25lZCBpbnQpJzoKLSAgICBicGYtdHJhbnNsYXRlLmN4eDo1MDQ0
OjM5OiBlcnJvcjogJ3ZvaWQqIGNhbGxvYyhzaXplX3QsIHNpemVfdCknIHNpemVzIHNwZWNpZmll
ZCB3aXRoICdzaXplb2YnIGluIHRoZSBlYXJsaWVyIGFyZ3VtZW50IGFuZCBub3QgaW4gdGhlIGxh
dGVyIGFyZ3VtZW50IFstV2Vycm9yPWNhbGxvYy10cmFuc3Bvc2VkLWFyZ3NdCi0gICAgIDUwNDQg
fCAgIGJwZl9pbnNuICpidWYgPSAoYnBmX2luc24qKSBjYWxsb2MgKHNpemVvZihicGZfaW5zbiks
IG5pbnNucyk7Ci0gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn4KLSAgICBicGYtdHJhbnNsYXRlLmN4eDo1MDQ0OjM5OiBub3Rl
OiBlYXJsaWVyIGFyZ3VtZW50IHNob3VsZCBzcGVjaWZ5IG51bWJlciBvZiBlbGVtZW50cywgbGF0
ZXIgc2l6ZSBvZiBlYWNoIGVsZW1lbnQKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0
cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9c3lzdGVtdGFwLmdpdDthPWNvbW1pdDtoPWQ0MjEz
OWNmOWNkMjZkMGMwMzYzZmNmZTAwNzcxNmJhZWI4ZGU1MTddCi1TaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gYnBmLXRyYW5zbGF0ZS5jeHggfCA0ICsr
LS0KLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1k
aWZmIC0tZ2l0IGEvYnBmLXRyYW5zbGF0ZS5jeHggYi9icGYtdHJhbnNsYXRlLmN4eAotaW5kZXgg
MWE5MzAyNDYzLi5hYThlZjY1Y2UgMTAwNjQ0Ci0tLS0gYS9icGYtdHJhbnNsYXRlLmN4eAotKysr
IGIvYnBmLXRyYW5zbGF0ZS5jeHgKLUBAIC01MDQxLDkgKzUwNDEsOSBAQCBvdXRwdXRfcHJvYmUo
QlBGX091dHB1dCAmZW8sIHByb2dyYW0gJnByb2csCi0gCX0KLSAgICAgfQotIAotLSAgYnBmX2lu
c24gKmJ1ZiA9IChicGZfaW5zbiopIGNhbGxvYyAoc2l6ZW9mKGJwZl9pbnNuKSwgbmluc25zKTsK
LSsgIGJwZl9pbnNuICpidWYgPSAoYnBmX2luc24qKSBjYWxsb2MgKG5pbnNucywgc2l6ZW9mKGJw
Zl9pbnNuKSk7Ci0gICBhc3NlcnQgKGJ1Zik7Ci0tICBFbGY2NF9SZWwgKnJlbCA9IChFbGY2NF9S
ZWwqKSBjYWxsb2MgKHNpemVvZihFbGY2NF9SZWwpLCBucmVsb2MpOwotKyAgRWxmNjRfUmVsICpy
ZWwgPSAoRWxmNjRfUmVsKikgY2FsbG9jIChucmVsb2MsIHNpemVvZihFbGY2NF9SZWwpKTsKLSAg
IGFzc2VydCAocmVsKTsKLSAKLSAgIHVuc2lnbmVkIGkgPSAwLCByID0gMDsKLS0tIAotMi40My4w
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8w
MDAxLWNvbmZpZ3VyZS5hYy1maXgtYnJva2VuLWxpYmRlYnVnaW5mb2QtbGlicmFyeS1hdXRvLWQu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1jb25m
aWd1cmUuYWMtZml4LWJyb2tlbi1saWJkZWJ1Z2luZm9kLWxpYnJhcnktYXV0by1kLnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5ODY0MTgyNmY2Li4wMDAwMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWNvbmZpZ3VyZS5h
Yy1maXgtYnJva2VuLWxpYmRlYnVnaW5mb2QtbGlicmFyeS1hdXRvLWQucGF0Y2gKKysrIC9kZXYv
bnVsbApAQCAtMSw1MSArMCwwIEBACi1Gcm9tIDM5MTNhZDNlMjhhMTk4MTFlMWI1MjMzODExMjM0
NGE0ODcwNTdlNGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBWaWN0b3IgS2FtZW5z
a3kgPHZpY3Rvci5rYW1lbnNreTdAZ21haWwuY29tPgotRGF0ZTogTW9uLCAxOCBEZWMgMjAyMyAw
MzoxMzozOCArMDAwMAotU3ViamVjdDogW1BBVENIIDEvMl0gY29uZmlndXJlLmFjOiBmaXggYnJv
a2VuIGxpYmRlYnVnaW5mb2QgbGlicmFyeSBhdXRvCi0gZGV0ZWN0aW9uCi0KLUFmdGVyIDJlNjdi
MDUzZTM3OTZlZTdjZjI5YTM5Zjk2OTg3MjliNTIwNzg0MDYgImNvbmZpZ3VyeTogcmV3b3JrIGRl
YnVnaW5mb2Qgc2VhcmNoZXMiCi1jb21taXQsIGxpYmRlYnVnaW5mb2Quc28gbGlicmFyeSBhdXRv
IGRldGVjdGlvbiBpcyBicm9rZW4uIEl0IHdhcyByZXBvcnRlZCBieSBNYXJ0aW4gSmFuc2EKLW9u
IG9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdCBbMV0uCi0KLUN1cnJlbnRseSBjb25maWd1
cmUuYWMgZG9lcyAiQUNfREVGSU5FKFtIQVZFX0xJQkRFQlVHSU5GT0RdLCBbMV0gLi4uIiBhcyBs
b25nIGFzCi1ubyAtLXdpdGhvdXQtZGVidWdpbmZvZCBvcHRpb24gaXMgcGFzc2VkLCByZWdhcmRs
ZXNzIFBLR19DSEVDS19NT0RVTEVTIGNoZWNrIHJlc3VsdC4KLUl0IHNlZW1zIHRvIGJlIGJhZCBj
b3B5L3Bhc3RlLiBBZGRyZXNzIHRoZSBpc3N1ZSBieSBtb3ZpbmcgdGhlIEFDX0RFRklORSBiYWNr
IHRvCi1QS0dfQ0hFQ0tfTU9EVUxFUyBhY3Rpb24taWYtZm91bmQgYmxvY2suCi0KLVRvIHJlcHJv
ZHVjZSB0aGUgaXNzdWUgb24gRkMgc3lzdGVtLCBvbmUgY2FuIGRvIHRoZSBmb2xsb3dpbmcKLSJz
dWRvIGRuZiByZW1vdmUgZWxmdXRpbHMtZGVidWdpbmZvZC1jbGllbnQtZGV2ZWwiIGFuZCB0aGVu
IHRyeSB0byBidWlsZCBTeXN0ZW1UYXAKLXV0aWwuY3h4IHdpbGwgZmFpbCB0byBjb21waWxlIGJl
Y2F1c2Ugb2YgbWlzc2luZyBlbGZ1dGlscy9kZWJ1Z2luZm9kLmggYmVjYXVzZQotY29uZmlnLmgg
d2lsbCBoYXZlICIjZGVmaW5lIEhBVkVfTElCREVCVUdJTkZPRCAxIiwgd2hpbGUgY29uZmlnLmxv
ZyBhbmQgY29uZmlndXJlCi1vdXRwdXQgaW5kaWNhdGVzIHRoYXQgY2hlY2sgZm9yIGxpYmRlYnVn
aW5mb2QgbGlicmFyeSBmYWlsZWQuCi0KLVsxXSBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE5MjEwOT9wPSUyQyUyQyUyQzIwJTJDMCUy
QzAlMkMwJTNBJTNBY3JlYXRlZCUyQzAlMkNzeXN0ZW10YXAlMkMyMCUyQzIlMkMwJTJDMTAyOTg3
NTE0Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL3NvdXJjZXdhcmUub3Jn
L3BpcGVybWFpbC9zeXN0ZW10YXAvMjAyM3E0LzAyNzkxNC5odG1sXQotU2lnbmVkLW9mZi1ieTog
VmljdG9yIEthbWVuc2t5IDx2aWN0b3Iua2FtZW5za3k3QGdtYWlsLmNvbT4KLS0tLQotIGNvbmZp
Z3VyZS5hYyB8IDUgKystLS0KLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1p
bmRleCBkOTU1OWM1YzMuLjE4Y2Q3Zjg0YSAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysr
IGIvY29uZmlndXJlLmFjCi1AQCAtMjE5LDEyICsyMTksMTEgQEAgZG5sIHRha2UgdGhlIHVzZXIg
YXQgaGlzIG9yIGhlciB3b3JkCi0gZWxpZiB0ZXN0ICJ4JHdpdGhfZGVidWdpbmZvZCIgIT0geG5v
OyB0aGVuCi0gZG5sIGNoZWNrIGluIHRoZSBzeXN0ZW0gcGtnY29uZmlnCi0gICBQS0dfQ0hFQ0tf
TU9EVUxFUyhbZGVidWdpbmZvZF0sIFtsaWJkZWJ1Z2luZm9kID49IDAuMTc5XSwKLS0gICAgW2hh
dmVfZGVidWdpbmZvZD0xXSwKLSsgICAgW2hhdmVfZGVidWdpbmZvZD0xCi0rICAgICBBQ19ERUZJ
TkUoW0hBVkVfTElCREVCVUdJTkZPRF0sIFsxXSwgW0RlZmluZSB0byAxIGlmIGRlYnVnaW5mb2Qg
aXMgZW5hYmxlZC5dKV0sCi0gICAgIFtpZiB0ZXN0ICJ4JHdpdGhfZGVidWdpbmZvZCIgPSB4eWVz
OyB0aGVuCi0gICAgICAgIEFDX01TR19FUlJPUihbIi0td2l0aC1kZWJ1Z2luZm9kIHdhcyBnaXZl
biwgYnV0IGxpYmRlYnVnaW5mb2QgaXMgbWlzc2luZyBvciB1bnVzYWJsZS4iXSkKLSAgICAgIGZp
XSkKLS0gIEFDX0RFRklORShbSEFWRV9MSUJERUJVR0lORk9EXSwgWzFdLCBbRGVmaW5lIHRvIDEg
aWYgZGVidWdpbmZvZCBpcyBlbmFibGVkLl0pCi0tICBBQ19NU0dfUkVTVUxUKFt5ZXNdKSAgCi0g
ZWxzZQotICAgQUNfTVNHX1JFU1VMVChbbm9dKQotIGZpCi0tLSAKLTIuMzEuMQotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1pbXByb3Zl
LXJlcHJvZHVjaWJpbGl0eS1mb3ItYy1jb21waWxpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1pbXByb3ZlLXJlcHJvZHVjaWJpbGl0eS1mb3It
Yy1jb21waWxpbmcucGF0Y2gKaW5kZXggMTVhNmYyYTlhNS4uOTdhZjcxNzlhMiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtaW1wcm92ZS1y
ZXByb2R1Y2liaWxpdHktZm9yLWMtY29tcGlsaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1r
ZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLWltcHJvdmUtcmVwcm9kdWNpYmlsaXR5LWZv
ci1jLWNvbXBpbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjI4OGJhNWRmMGE4Yzcz
ZWY4NDJiNjA5MDgxNDQ5YWM0ZGU4NjEyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NGRmNjgzMDczMDAzOThiMzEwZDM5ZWE5MWIzY2Q2NzNiMDg5ZDIyNSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFdlZCwgMTggSnVsIDIwMTggMTY6NTg6MzMgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gaW1w
cm92ZSByZXByb2R1Y2liaWxpdHkgZm9yIGMrKyBjb21waWxpbmcKQEAgLTE0LDcgKzE0LDcgQEAg
U2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvc3RyaW5ndGFibGUuaCBiL3N0cmluZ3RhYmxlLmgKLWluZGV4IDVmYzQyZTcuLjZmZDhhMWUg
MTAwNjQ0CitpbmRleCA1ZmM0MmU3YWIuLjZmZDhhMWUyNiAxMDA2NDQKIC0tLSBhL3N0cmluZ3Rh
YmxlLmgKICsrKyBiL3N0cmluZ3RhYmxlLmgKIEBAIC0xOSw3ICsxOSw3IEBACkBAIC0yNiw2ICsy
NiwzIEBAIGluZGV4IDVmYzQyZTcuLjZmZDhhMWUgMTAwNjQ0CiAgCiAgLy8gWFhYOiBleHBlcmlt
ZW50YWwgdHVuYWJsZXMKICAjZGVmaW5lIElOVEVSTkVEX1NUUklOR19GSU5EX01FTU1FTSAxIC8q
IHBlcmYgc3RhdCBpbmRpY2F0ZXMgYSB2ZXJ5IHNsaWdodCBiZW5lZml0ICovCi0tLSAKLTIuNy40
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8w
MDAxLXByZXJlbGVhc2UtZGF0ZXN0YW1wLWZpeGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5l
bC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtcHJlcmVsZWFzZS1kYXRlc3RhbXAtZml4ZXMucGF0
Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGFmZGMxMGEzZmUuLjAwMDAwMDAwMDAK
LS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtcHJlcmVs
ZWFzZS1kYXRlc3RhbXAtZml4ZXMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyMyArMCwwIEBA
Ci1Gcm9tIGNmYzJjMWQ1MzkyNGZhY2UxMWUzZmFiNzhkZWQ2MWMzNTk3NzhlYjkgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCi1Gcm9tOiAiRnJhbmsgQ2guIEVpZ2xlciIgPGZjaGVAcmVkaGF0LmNv
bT4KLURhdGU6IFNhdCwgNCBOb3YgMjAyMyAxMjoxOTo1OSAtMDQwMAotU3ViamVjdDogW1BBVENI
XSBwcmVyZWxlYXNlIGRhdGVzdGFtcCBmaXhlcwotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0
Ci0tLS0KLSBORVdTIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvTkVXUyBiL05FV1MKLWluZGV4IGM3ZjMxZThiNy4u
ZjBmOTA1NmM0IDEwMDY0NAotLS0tIGEvTkVXUwotKysrIGIvTkVXUwotQEAgLTEsNCArMSw0IEBA
Ci0tKiBXaGF0J3MgbmV3IGluIHZlcnNpb24gNS4wLCAyMDIzLTExLTAzCi0rKiBXaGF0J3MgbmV3
IGluIHZlcnNpb24gNS4wLCAyMDIzLTExLTA0Ci0gCi0gLSBQZXJmb3JtYW5jZSBpbXByb3ZlbWVu
dHMgaW4gdXByb2JlIHJlZ2lzdHJhdGlvbiBhbmQgbW9kdWxlIHN0YXJ0dXAuCi0gCi0tLSAKLTIu
MzEuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10
YXAvMDAwMS1zdGFwcnVuLWFkZHJlc3MtbmN1cnNlcy02LjMtZmFpbHVyZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1zdGFwcnVuLWFkZHJlc3Mt
bmN1cnNlcy02LjMtZmFpbHVyZXMucGF0Y2gKaW5kZXggMWRlY2YyMTU5My4uMTM2YjgxYjljNSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEt
c3RhcHJ1bi1hZGRyZXNzLW5jdXJzZXMtNi4zLWZhaWx1cmVzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLXN0YXBydW4tYWRkcmVzcy1uY3Vy
c2VzLTYuMy1mYWlsdXJlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTkxZjUyOGRhMTkx
OTNkNzEzZDk0ZWUyNTJlMjQ4NWVmZDlhZjRkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNGZiMTNkM2Q3ZTAxYWRjMDhjZGQxMDhlMmFiZjYwNTQ0MjVjNzg5MSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+
CiBEYXRlOiBNb24sIDI1IE9jdCAyMDIxIDE3OjU5OjI0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHN0YXBydW46IGFkZHJlc3MgbmN1cnNlcyA2LjMgZmFpbHVyZXMKQEAgLTEwLDEwICsxMCwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgog
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL3N0YXBydW4vbW9uaXRvci5jIGIvc3RhcHJ1bi9tb25pdG9yLmMKLWluZGV4IDQ3
ODYzNGMwOS4uZjRmYmZkNjg2IDEwMDY0NAoraW5kZXggODUxZWUxNGM0Li43ZDgzYTM4NDYgMTAw
NjQ0CiAtLS0gYS9zdGFwcnVuL21vbml0b3IuYwogKysrIGIvc3RhcHJ1bi9tb25pdG9yLmMKLUBA
IC00NDgsMTIgKzQ0OCwxMiBAQCB2b2lkIG1vbml0b3JfcmVuZGVyKHZvaWQpCitAQCAtNDUzLDEy
ICs0NTMsMTIgQEAgdm9pZCBtb25pdG9yX3JlbmRlcih2b2lkKQogICAgICAgIGlmIChhY3RpdmVf
d2luZG93ID09IDApCiAgICAgICAgICB3YXR0cm9uKHN0YXR1cywgQV9CT0xEKTsKICAgICAgICB3
cHJpbnR3KHN0YXR1cywgIlxuJSpzXHQlKnNcdCUqc1x0JSpzXHQlKnNcdCUqc1x0JXNcbiIsCkBA
IC0zMiw3ICszMiw3IEBAIGluZGV4IDQ3ODYzNGMwOS4uZjRmYmZkNjg2IDEwMDY0NAogICAgICAg
ICAgICAgICAgSElHSExJR0hUKCJuYW1lIiwgcF9uYW1lLCBjb21wX2ZuX2luZGV4KSk7CiAgICAg
ICAgaWYgKGFjdGl2ZV93aW5kb3cgPT0gMCkKICAgICAgICAgIHdhdHRyb2ZmKHN0YXR1cywgQV9C
T0xEKTsKLUBAIC00NjYsMTcgKzQ2NiwxNyBAQCB2b2lkIG1vbml0b3JfcmVuZGVyKHZvaWQpCitA
QCAtNDcxLDE3ICs0NzEsMTcgQEAgdm9pZCBtb25pdG9yX3JlbmRlcih2b2lkKQogICAgICAgICAg
ICBqc29uX29iamVjdCAqcHJvYmUsICpmaWVsZDsKICAgICAgICAgICAgcHJvYmUgPSBqc29uX29i
amVjdF9hcnJheV9nZXRfaWR4KGpzb19wcm9iZV9saXN0LCBpKTsKICAgICAgICAgICAganNvbl9v
YmplY3Rfb2JqZWN0X2dldF9leChwcm9iZSwgImluZGV4IiwgJmZpZWxkKTsKQEAgLTU2LDYgKzU2
LDMgQEAgaW5kZXggNDc4NjM0YzA5Li5mNGZiZmQ2ODYgMTAwNjQ0CiAgICAgICAgICAgIGdldHl4
KHN0YXR1cywgZGlzY2FyZCwgY3VyX3gpOwogICAgICAgICAgICBqc29uX29iamVjdF9vYmplY3Rf
Z2V0X2V4KHByb2JlLCAibmFtZSIsICZmaWVsZCk7CiAgICAgICAgICAgIHdwcmludHcoc3RhdHVz
LCAiJS4qcyIsIG1heF9jb2xzLWN1cl94LTEsIGpzb25fb2JqZWN0X2dldF9zdHJpbmcoZmllbGQp
KTsKLS0tIAotMi4yMC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVt
dGFwL3N5c3RlbXRhcC8wMDAxLXN0YXBydW4tZml4LWJ1aWxkLWFnYWluc3QtdXBjb21pbmctZ2Nj
LTE0LVdlcnJvci1jYWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0
ZW10YXAvMDAwMS1zdGFwcnVuLWZpeC1idWlsZC1hZ2FpbnN0LXVwY29taW5nLWdjYy0xNC1XZXJy
b3ItY2FsLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyMjU3OGZiM2Y2Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8w
MDAxLXN0YXBydW4tZml4LWJ1aWxkLWFnYWluc3QtdXBjb21pbmctZ2NjLTE0LVdlcnJvci1jYWwu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNiArMCwwIEBACi1Gcm9tIDUyNTk2ZjAyMzY1MjEx
NDY0MmZhYmE1NzI2Yzk5NDg4NTI5MDI5Y2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBTZXJnZWkgVHJvZmltb3ZpY2ggPHNseWljaEBnbWFpbC5jb20+Ci1EYXRlOiBUaHUsIDIxIERl
YyAyMDIzIDEwOjAwOjA2ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIHN0YXBydW46IGZpeCBidWls
ZCBhZ2FpbnN0IHVwY29taW5nIGBnY2MtMTRgCi0gKGAtV2Vycm9yPWNhbGxvYy10cmFuc3Bvc2Vk
LWFyZ3NgKQotCi1gZ2NjLTE0YCBhZGRlZCBhIG5ldyBgLVdjYWxsb2MtdHJhbnNwb3NlZC1hcmdz
YCB3YXJuaW5nIHJlY2VudGx5LiBJdAotZGV0ZWN0ZWQgbWlub3IgaW5mZWxpY2l0eSBpbiBgY2Fs
bG9jKClgIEFQSSB1c2FnZSBpbiBgc3lzdGVtdGFwYDoKLQotICAgIHN0YXBydW4uYzogSW4gZnVu
Y3Rpb24gJ21haW4nOgotICAgIHN0YXBydW4uYzo1NTA6NTA6IGVycm9yOiAnY2FsbG9jJyBzaXpl
cyBzcGVjaWZpZWQgd2l0aCAnc2l6ZW9mJyBpbiB0aGUgZWFybGllciBhcmd1bWVudCBhbmQgbm90
IGluIHRoZSBsYXRlciBhcmd1bWVudCBbLVdlcnJvcj1jYWxsb2MtdHJhbnNwb3NlZC1hcmdzXQot
ICAgICAgNTUwIHwgICAgICAgICAgICAgICAgIGNoYXIgKiogbmV3X2FyZ3YgPSBjYWxsb2Moc2l6
ZW9mKGNoYXIgKiksYXJnYysyKTsKLSAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnQgW2h0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPXN5c3RlbXRhcC5naXQ7YT1jb21taXQ7
aD01MjU5NmYwMjM2NTIxMTQ2NDJmYWJhNTcyNmM5OTQ4ODUyOTAyOWNlXQotU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIHN0YXBydW4vc3RhcHJ1bi5j
IHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQot
Ci1kaWZmIC0tZ2l0IGEvc3RhcHJ1bi9zdGFwcnVuLmMgYi9zdGFwcnVuL3N0YXBydW4uYwotaW5k
ZXggODQzN2YzYWY2Li5kMWIwYjIyMWIgMTAwNjQ0Ci0tLS0gYS9zdGFwcnVuL3N0YXBydW4uYwot
KysrIGIvc3RhcHJ1bi9zdGFwcnVuLmMKLUBAIC01NDcsNyArNTQ3LDcgQEAgaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQotICAgICAgICAgICAgdXMgdG8gZXh0ZW5kIGFyZ3ZbXSwgd2l0
aCBhbGwgdGhlIEMgZnVuIHRoYXQgZW50YWlscy4gKi8KLSAjaWZkZWYgSEFWRV9PUEVOQVQKLSAg
ICAgICAgIGlmIChyZWxheV9iYXNlZGlyX2ZkID49IDApIHsKLS0gICAgICAgICAgICAgICAgY2hh
ciAqKiBuZXdfYXJndiA9IGNhbGxvYyhzaXplb2YoY2hhciAqKSxhcmdjKzIpOwotKyAgICAgICAg
ICAgICAgICBjaGFyICoqIG5ld19hcmd2ID0gY2FsbG9jKGFyZ2MrMiwgc2l6ZW9mKGNoYXIgKikp
OwotICAgICAgICAgICAgICAgICBjb25zdCBpbnQgbmV3X0ZvcHRpb25fc2l6ZSA9IDEwOyAvKiAt
Rk5OTk5OICovCi0gICAgICAgICAgICAgICAgIGNoYXIgKiBuZXdfRm9wdGlvbiA9IG1hbGxvYyhu
ZXdfRm9wdGlvbl9zaXplKTsKLSAgICAgICAgICAgICAgICAgaW50IGk7Ci0tLSAKLTIuNDMuMAot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAw
MS1zdGFwcnVuLXN0YXBicGYtZG9uLXQtc3VwcG9ydC1pbnN0YWxsaW5nLWEtbm9uLXJvb3QucGF0
Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1zdGFwcnVu
LXN0YXBicGYtZG9uLXQtc3VwcG9ydC1pbnN0YWxsaW5nLWEtbm9uLXJvb3QucGF0Y2gKaW5kZXgg
ZTJmOGIzYjA1Ny4uODE1ODA1NTIyNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9z
eXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtc3RhcHJ1bi1zdGFwYnBmLWRvbi10LXN1cHBvcnQtaW5z
dGFsbGluZy1hLW5vbi1yb290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVt
dGFwL3N5c3RlbXRhcC8wMDAxLXN0YXBydW4tc3RhcGJwZi1kb24tdC1zdXBwb3J0LWluc3RhbGxp
bmctYS1ub24tcm9vdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2UxM2EwMDZmZTNkZmY5
NDg5MjY5Mjc0MDkzYmY4Njg1MzIwMzZlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NTEyYTc0MzMzYTkzN2VhOGM2MGQ4YmY0OTNkZjU0OTFhMDFjZTMyOCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFNhdWwgV29sZCA8c2d3QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFR1
ZSwgNSBTZXAgMjAxNyAxNjowMjo1NSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBzdGFwcnVuL3N0
YXBicGY6IGRvbid0IHN1cHBvcnQgaW5zdGFsbGluZyBhIG5vbi1yb290CkBAIC0xMCwxNSArMTAs
MTQgQEAgdGhlIGJpbmFyaWVzLgogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtFbWJl
ZGRlZF0KIFNpZ25lZC1vZmYtYnk6IFNhdWwgV29sZCA8c2d3QGxpbnV4LmludGVsLmNvbT4KIC0t
LQotIHN0YXBicGYvTWFrZWZpbGUuYW0gfCAxNCArKysrKysrLS0tLS0tLQotIHN0YXBydW4vTWFr
ZWZpbGUuYW0gfCAxMiArKysrKystLS0tLS0KLSAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKyksIDEzIGRlbGV0aW9ucygtKQorIHN0YXBicGYvTWFrZWZpbGUuYW0gfCAxMiArKysrKyst
LS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQog
Ci1JbmRleDogZ2l0L3N0YXBicGYvTWFrZWZpbGUuYW0KLT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBnaXQub3Jp
Zy9zdGFwYnBmL01ha2VmaWxlLmFtCi0rKysgZ2l0L3N0YXBicGYvTWFrZWZpbGUuYW0KLUBAIC00
MSwxMCArNDEsMTAgQEAKK2RpZmYgLS1naXQgYS9zdGFwYnBmL01ha2VmaWxlLmFtIGIvc3RhcGJw
Zi9NYWtlZmlsZS5hbQoraW5kZXggYmIwYzFlZWY4Li4zMjMwMDNiODggMTAwNjQ0CistLS0gYS9z
dGFwYnBmL01ha2VmaWxlLmFtCisrKysgYi9zdGFwYnBmL01ha2VmaWxlLmFtCitAQCAtNDAsMTAg
KzQwLDEwIEBAIGdpdF92ZXJzaW9uLnN0YW1wIC4uL2dpdF92ZXJzaW9uLmg6CiAgCiAgIyBXaHkg
dGhlICJpZCAtdSIgY29uZGl0aW9uPyAgVGhpcyB3YXksIGFuIHVucHJpdmlsZWdlZCB1c2VyIGNh
biBydW4KICAjIG1ha2UgaW5zdGFsbCwgYW5kIGhhdmUgInN1ZG8gc3RhcCAuLi4uIiBvciAic3Vk
byBzdGFwYnBmIC4uLi4iIHdvcmsgbGF0ZXIuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2Vy
bmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0
ZW10YXAvc3lzdGVtdGFwX2dpdC5iYgppbmRleCA2OGY1Yzc2NDI4Li4wMWM4N2E1NzI3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIKQEAgLTYs
NyArNiwxMCBAQCBIT01FUEFHRSA9ICJodHRwczovL3NvdXJjZXdhcmUub3JnL3N5c3RlbXRhcC8i
CiAKIHJlcXVpcmUgc3lzdGVtdGFwX2dpdC5pbmMKIAotU1JDX1VSSSArPSAiIFwKK1NSQ19VUkkg
Kz0gImdpdDovL3NvdXJjZXdhcmUub3JnL2dpdC9zeXN0ZW10YXAuZ2l0O2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMgXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3QtbGV0LWNvbmZp
Z3VyZS13cml0ZS1hLXB5dGhvbi1sb2NhdGlvbi1pbnRvLXRoLnBhdGNoIFwKKyAgICAgICAgICAg
ZmlsZTovLzAwMDEtSW5zdGFsbC1weXRob24tbW9kdWxlcy10by1jb3JyZWN0LWxpYnJhcnktZGly
LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtc3RhcHJ1bi1zdGFwYnBmLWRvbi10LXN1
cHBvcnQtaW5zdGFsbGluZy1hLW5vbi1yb290LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtaW1wcm92ZS1yZXByb2R1Y2liaWxpdHktZm9yLWMtY29tcGlsaW5nLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtc3RhcHJ1bi1hZGRyZXNzLW5jdXJzZXMtNi4zLWZhaWx1cmVzLnBh
dGNoIFwKICAgICAgICAgICAgIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0
ZW10YXAvc3lzdGVtdGFwX2dpdC5pbmMgYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9z
eXN0ZW10YXBfZ2l0LmluYwppbmRleCBjNTc0YmNiMmJhLi5lODU5MTA5MzU2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmluYworKysgYi9t
ZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmluYwpAQCAtMSw3ICsx
LDcgQEAKIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCi1TUkNSRVYg
PSAiZTcyZGMxMThlNTYzYzY0NWQ5M2ExYTJkNzcxZThkOTBlOGZlYzFhZSIKLVBWID0gIjUuMCIK
K1NSQ1JFViA9ICIzYTBjOWMxNTE2MzUyMGRkMGQ5YWIwNzE3N2RhNjJjZTljYzIzMzJmIgorUFYg
PSAiNS4xIgogCiBTUkNfVVJJID0gImdpdDovL3NvdXJjZXdhcmUub3JnL2dpdC9zeXN0ZW10YXAu
Z2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1Eby1ub3QtbGV0LWNvbmZpZ3VyZS13cml0ZS1hLXB5dGhvbi1sb2NhdGlvbi1pbnRvLXRoLnBh
dGNoIFwKLS0gCjIuNDQuMAoK

--===============5226938914875775481==--

