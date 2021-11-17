Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5C0C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8684.1637163345052403018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hMgBrmPk;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id w29so5442034wra.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EWo3nzf1ZkvB0gbI5+unUkt8HnQmOfgtdVNsWxgrUos=;
        b=hMgBrmPkVbpPD/xTV/Dm2pzMIU8EOpmuBW2jRHn4APutyugxsXpt2/clZvJsZbZFsW
         6O40z6m0LPGmNAUzbAQPbbalmtQX8WA8gPla33bxfT3q9xT7C9SOA+sEvT08+RpnrNaQ
         JgA2H8dIYGSKmUKsKRWL9UFF6MvC3GOas0JcCOWi/tnS7Knn25y0f90+wYqgpArNhid+
         szRfvUC/m8CM8I+0YVoh+MLGhrONSW3a3VdNuarTnLJmO0PWl6HbG38p9xiwlEqzKV4L
         eiJVWx8OAefOLGvNu6+UVWI0/9u3N3JToTrFRLwYYj5Dl+SiRLUkre4aAVhKRvulY6WE
         ESQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EWo3nzf1ZkvB0gbI5+unUkt8HnQmOfgtdVNsWxgrUos=;
        b=OtCLyOA0F89+hRo8hQ+zZLoBQe+DvL+ERekdB9FMO0SCL6SDPQUwrotsg+AwNVu1F2
         f47TmEulWk/VtetF7I/45vpQ5LBkB+J4MpdetP5WQ9mi8KAo6CQIi4kUxa5g+revMDso
         SP0aKE9SGOPOlwmiRMXKFgKBE7g3v6/I3tz+NutXBFckXc1AvQpGdTQ6JT4vbgFf/63i
         QoF0aaqLW0/mDivpAzkJ9SUHNDCrw7gqFJf4jXFhd2Ywf4/+OI1uCFr9IVvKg14ahUto
         j1kJ74eT9xnwueNxWGtyS6Aqnxolfoywqv6TnAJ75Sq10FVh3upuexHGCsVE6Ia4YbPo
         PgHg==
X-Gm-Message-State: AOAM532U44+VErWKBNn2ipvkDE9LJiR7EzcgDIctKx5QiTsKp4rc8/Tv
	n9cldAxrRrC55vzCpaztigVKROjpgnw=
X-Google-Smtp-Source: 
 ABdhPJzUEKGt4ZpDstOZJdkZ8BiPLV2/62EAPYMag1kbUtvuDgNFfw/vF2J/ZkPidHhmkd59nj6JUg==
X-Received: by 2002:a5d:588b:: with SMTP id
 n11mr21970685wrf.344.1637163343176;
        Wed, 17 Nov 2021 07:35:43 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/36] patches: correct whitespace/spelling for
 Upstream-Status tags
Date: Wed, 17 Nov 2021 16:35:13 +0100
Message-Id: <20211117153525.257146-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158419

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-Makefile.am-fix-undefined-function-for-libnsm.a.patch | 2 +-
 ...-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch | 2 +-
 ...ysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch | 2 +-
 meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch | 2 +-
 meta/recipes-core/sysvinit/sysvinit/realpath.patch           | 2 +-
 ...fd-Close-the-file-descriptor-if-there-is-no-archive.patch | 2 +-
 .../bootchart2/0001-bootchart2-support-usrmerge.patch        | 2 +-
 .../dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch          | 2 +-
 .../files/0001-skip-the-test-when-gcc-not-deployed.patch     | 2 +-
 .../recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch | 2 +-
 meta/recipes-devtools/patch/patch/CVE-2019-13636.patch       | 2 +-
 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch       | 2 +-
 meta/recipes-devtools/perl/files/native-perlinc.patch        | 2 +-
 meta/recipes-devtools/perl/files/perl-dynloader.patch        | 2 +-
 .../strace/0001-Avoid-relying-on-presence-of-ipx.h.patch     | 2 +-
 .../0001-configure-use-pkg-config-for-pcre-detection.patch   | 2 +-
 ...evert-tests-wait-for-complete-rebuild-in-integrity-.patch | 2 +-
 .../mdadm/files/0001-mdadm-skip-test-11spare-migration.patch | 2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch            | 5 ++---
 .../jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch | 2 +-
 .../xf86-video-vmware/0002-add-option-for-vmwgfx.patch       | 2 +-
 ...ix-cpu-hotplug-Remove-deprecated-CPU-hotplug-functi.patch | 2 +-
 ...ix-Revert-Makefile-Enable-Wimplicit-fallthrough-for.patch | 2 +-
 .../apr/apr-util/0001-Fix-error-handling-in-gdbm.patch       | 3 +--
 ...001-confiure.ac-Believe-the-cflags-from-environment.patch | 2 +-
 .../recipes-support/vim/files/disable_acl_header_check.patch | 2 +-
 26 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
index bd350144e3..7603eb680d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
@@ -19,7 +19,7 @@ As there is already one source file named file.c
 as support/nsm/file.c in support/nsm/Makefile.am,
 so rename ../support/misc/file.c to ../support/misc/misc.c.
 
-Upstream-Status: Submitted[https://marc.info/?l=linux-nfs&m=154502780423058&w=2]
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=154502780423058&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index c2766ef4c3..474cea5a0d 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -10,7 +10,7 @@ ${S}/.pc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch/ports/sysdeps/
 aarch64/libm-test-ulps), run libm-err-tab.pl with specific dirs
 in ${S}.
 
-Upstream-Status: inappropriate [OE specific]
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
diff --git a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index e8332a53c2..1b99af7110 100644
--- a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -4,7 +4,7 @@ Date: Wed, 18 Mar 2015 00:27:10 +0000
 Subject: [PATCH] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
-Upstream-Status:Pending
+Upstream-Status: Pending
 
 Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 494aa0e012..17f72b4829 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -10,7 +10,7 @@ each other's pids.
 
 https://bugzilla.redhat.com/show_bug.cgi?id=883856
 
-Upstream-Status: backport
+Upstream-Status: Backport
 Imported patch from: https://bugzilla.redhat.com/attachment.cgi?id=658166
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
diff --git a/meta/recipes-core/sysvinit/sysvinit/realpath.patch b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
index 859fd8baad..b559aa3b49 100644
--- a/meta/recipes-core/sysvinit/sysvinit/realpath.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] Fix build on musl use realpath() API its available on all
 realpath() API doesnt work on systems with PATH_MAX set to be unlimited e.g. GNU/Hurd
 However for Linux it should always work
 
-Upstream-Status: Inappropriate[Linux specific]
+Upstream-Status: Inappropriate [Linux specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch b/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
index 9becee39a2..924980b4e8 100644
--- a/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
+++ b/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
@@ -33,7 +33,7 @@ ld/
 (cherry picked from commit 5a98fb7513b559e20dfebdbaa2a471afda3b4742)
 (cherry picked from commit 7dc37e1e1209c80e0bab784df6b6bac335e836f2)
 
-Upstream-Status: Accepted[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0]
+Upstream-Status: Accepted [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0]
 ---
  bfd/plugin.c                       |  8 +++++++
  ld/testsuite/ld-plugin/lto.exp     | 34 ++++++++++++++++++++++++++++++
diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
index 8ee6723df1..88597cf3a9 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
@@ -3,7 +3,7 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 5 Sep 2019 18:37:31 +0800
 Subject: [PATCH] bootchart2: support usrmerge
 
-Upstream-Status: Inappropriate[oe-specific]
+Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
index 50e6894406..d66ab4476a 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -3,7 +3,7 @@ From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
 
-Upstream-Status: Pending.
+Upstream-Status: Pending
 Changes made on ostable and tupletable to enable muslx32 build.
 
 Signed-off-by: sweeaun <swee.aun.khor@intel.com>
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 114ca63cb5..0e6bf5573c 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] skip the test when gcc not deployed
 Skip the tests which depend on gcc when
 gcc not deployed.
 
-Upstream-Status: Submitted[https://sourceware.org/ml/elfutils-devel/2019-q2/msg00091.html]
+Upstream-Status: Submitted [https://sourceware.org/ml/elfutils-devel/2019-q2/msg00091.html]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 
diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
index 8184e68743..5f14dd2a58 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
@@ -23,7 +23,7 @@ Do same for riscv64, aarch64 & arc
 
 RP 15/8/11
 
-Upstream-Status: Inappropriate[OE-Specific]
+Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
diff --git a/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch b/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
index 9f8b6db0b9..8059d9fe19 100644
--- a/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
+++ b/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
@@ -11,7 +11,7 @@ that consistently for input files.
 with O_CREAT | O_EXCL to avoid following symlinks in that case as well.
 
 CVE: CVE-2019-13636
-Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/patch.git/patch/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
 ---
diff --git a/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
index 03988a179c..9b2c07cf1e 100644
--- a/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
+++ b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
@@ -7,7 +7,7 @@ Subject: Avoid invalid memory access in context format diffs
 diffs.
 
 CVE: CVE-2019-20633
-Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/patch.git/patch/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 
 ---
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index a2e1aefd41..20d7fe6060 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-Upstream-Status:Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 Index: perl-5.8.8/lib/ExtUtils/MM_Unix.pm
diff --git a/meta/recipes-devtools/perl/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
index 6bb832a426..b49e6e4066 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-Upstream-Status:Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Allow the location that .so files are searched for for dynamic
 loading to be changed via an environment variable. This is to allow
diff --git a/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch b/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
index 6df673fa95..e791b4130d 100644
--- a/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
+++ b/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
@@ -24,7 +24,7 @@ check_ipx.
 
 Closes: https://github.com/strace/strace/issues/201
 
-Upstream-Status: backport [commit cca828197c0e1 branch esyr/5.15]
+Upstream-Status: Backport [commit cca828197c0e1 branch esyr/5.15]
 
 [bva: changed context to apply to a released strace 5.14 tarball]
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
index 114de7ed94..fdb9760e89 100644
--- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
+++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
@@ -4,7 +4,7 @@ Date: Tue, 17 Jun 2014 08:18:17 +0200
 Subject: [PATCH] configure: use pkg-config for pcre detection
 
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-Status: pending
+Upstream-Status: Pending
 ---
  configure.ac | 38 +++++++-------------------------------
  1 file changed, 7 insertions(+), 31 deletions(-)
diff --git a/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch b/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch
index b196084a5c..fb4bc165fb 100644
--- a/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch
@@ -10,7 +10,7 @@ use the previous logic "check wait" which also used
 commonly by other tests such as tests/02r5grow, tests/07revert-grow
 and etc.
 
-Upstream-Status: Submitted[https://marc.info/?l=linux-raid&m=156317157314030&w=2]
+Upstream-Status: Submitted [https://marc.info/?l=linux-raid&m=156317157314030&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 ---
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch
index 3a192cc95c..84517caade 100644
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch
@@ -17,7 +17,7 @@ done
 "try" includes near 20 sub testcase, so there are nearly 80 subcases need to run,
 so it will take long time than ptest-runner timeout limit, skip it as workaround.
 
-Upstream-Status: Inappropriate[oe-specific]
+Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
index 8e46df8e1e..cf4f993c1a 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
@@ -7,9 +7,8 @@ Date:   Tue Feb 12 09:53:50 2013 -0500
     Added support for socklen_t type to len argument passed to socket related
     calls. This fixes a bug that causes tcp wrappers to fail when using sshd.
     
-    Upstream-Status: Pending
-    
-    Signed-off-by: farrah rashid <farrah.rashid@windriver.com>
+Upstream-Status: Pending
+Signed-off-by: farrah rashid <farrah.rashid@windriver.com>
 
 diff --git a/fix_options.c b/fix_options.c
 index 7473adf..fe2b442 100644
diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
index 152db441bc..fab5109f83 100644
--- a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
+++ b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
@@ -7,7 +7,7 @@ Fix package qa errors like below:
 libjpeg.so.62.3.0 contains probably-redundant RPATH /usr/lib [useless-rpaths]
 usr/bin/cjpeg contains probably-redundant RPATH /usr/lib
 
-Upstream-Status: Inappropriate[oe-specific]
+Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
index 5bda720ce5..b37f697aa4 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
@@ -3,7 +3,7 @@ From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 9 Dec 2016 14:35:45 +0200
 Subject: [PATCH] Add option for vmwgfx
 
-Upstream-Status:Submitted
+Upstream-Status: Submitted
 
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-cpu-hotplug-Remove-deprecated-CPU-hotplug-functi.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-cpu-hotplug-Remove-deprecated-CPU-hotplug-functi.patch
index 4e52e5f122..08ad2ddaa8 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-cpu-hotplug-Remove-deprecated-CPU-hotplug-functi.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-cpu-hotplug-Remove-deprecated-CPU-hotplug-functi.patch
@@ -37,7 +37,7 @@ Introduced in v4.13 :
 
     Rename all instances in the cpu hotplug code while at it.
 
-Upstream-Status: backport [https://git.lttng.org/?p=lttng-modules.git;a=commit;h=ffcc873470121ef1ebb110df3d9038a38d9cb7cb]
+Upstream-Status: Backport [https://git.lttng.org/?p=lttng-modules.git;a=commit;h=ffcc873470121ef1ebb110df3d9038a38d9cb7cb]
 
 Change-Id: I5a37cf5afc075a402b7347989fac637dfa60a1ed
 Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-Revert-Makefile-Enable-Wimplicit-fallthrough-for.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-Revert-Makefile-Enable-Wimplicit-fallthrough-for.patch
index 5b5edc5319..14185efa40 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-Revert-Makefile-Enable-Wimplicit-fallthrough-for.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-Revert-Makefile-Enable-Wimplicit-fallthrough-for.patch
@@ -73,7 +73,7 @@ See upstream commit by the man himself:
 
     so if clang ever fixes its bad behavior we can try enabling it there again.
 
-Upstream-Status: backport [https://git.lttng.org/?p=lttng-modules.git;a=commit;h=c190d76e8c7b44d62b3651ab845b765c1b1f8104]
+Upstream-Status: Backport [https://git.lttng.org/?p=lttng-modules.git;a=commit;h=c190d76e8c7b44d62b3651ab845b765c1b1f8104]
 
 Change-Id: Iea69849592fb69ac04fb9bb28efcd6b8dce8ba88
 Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
diff --git a/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch b/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
index 57e7453312..6f27876a7f 100644
--- a/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
+++ b/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
@@ -13,8 +13,7 @@ what the berkleydb driver already does.
 
 Also ensure that dsize is 0 if dptr == NULL.
 
-Upstream-Status: Backport[https://svn.apache.org/viewvc?
-view=revision&amp;revision=1825311]
+Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&amp;revision=1825311]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
diff --git a/meta/recipes-support/gmp/gmp/0001-confiure.ac-Believe-the-cflags-from-environment.patch b/meta/recipes-support/gmp/gmp/0001-confiure.ac-Believe-the-cflags-from-environment.patch
index 56564db505..b26f4db98e 100644
--- a/meta/recipes-support/gmp/gmp/0001-confiure.ac-Believe-the-cflags-from-environment.patch
+++ b/meta/recipes-support/gmp/gmp/0001-confiure.ac-Believe-the-cflags-from-environment.patch
@@ -12,8 +12,8 @@ Secondly, dont set armv4 for march when no selection
 is made, since it is passed from cmdline
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [OE-Specific]
 ---
-Upstream-Status: Inappropriate[OE-Specific]
 
  configure.ac | 11 -----------
  1 file changed, 11 deletions(-)
diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch b/meta/recipes-support/vim/files/disable_acl_header_check.patch
index 33089162b4..26335d3297 100644
--- a/meta/recipes-support/vim/files/disable_acl_header_check.patch
+++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] disable acl header check
 
 Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-- 
2.20.1


