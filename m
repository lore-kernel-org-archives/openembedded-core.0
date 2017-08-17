Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2993678470
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 08:43:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H8hLQC007554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Aug 2017 01:43:21 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 17 Aug 2017 01:43:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 17 Aug 2017 04:43:19 -0400
Message-ID: <1502959399-45750-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] dpkg: 1.18.10 -> 1.18.24
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
X-List-Received-Date: Thu, 17 Aug 2017 08:43:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The 1.18.24 fixed CVE-2016-7948

Rebase patches:
- noman.patch -> 0001
- remove-tar-no-timestamp.patch -> 0002
- arch_pm.patch -> 0003
- add_armeb_triplet_entry.patch -> 0004
- 0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch -> 0005
- 0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch -> 0006
- 0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch -> 0007
- 0005-dpkg-compiler.m4-remove-Wvla.patch -> 0008
- 0006-add-musleabi-to-known-target-tripets.patch -> 0009
- 0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch -> 0010
- glibc2.5-sync_file_range.patch -> 0011

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../dpkg/dpkg/{noman.patch => 0001-no-man.patch}   | 28 +++++++--
 ...mp.patch => 0002-remove-tar-no-timestamp.patch} | 27 +++++++--
 .../dpkg/{arch_pm.patch => 0003-arch-pm.patch}     | 27 +++++++--
 ...04-add-armeb-tuple-entry-into-tupletable.patch} | 39 +++++++------
 ...ux-wrs-kernel-version-which-has-characte.patch} | 29 ++++++----
 ...insts-expect-D-to-be-set-when-running-in.patch} | 11 ++--
 ...function-doesn-t-work-properly-for-all-s.patch} | 14 +++--
 ...tch => 0008-dpkg-compiler.m4-remove-Wvla.patch} | 13 +++--
 ...-add-musleabi-to-known-target-tupletable.patch} | 66 +++++++++++-----------
 ...ild.c-Remove-usage-of-clamp-mtime-in-tar.patch} | 33 ++++++-----
 ...e.patch => 0011-glibc2.5-sync-file-range.patch} | 31 +++++++---
 .../dpkg/{dpkg_1.18.10.bb => dpkg_1.18.24.bb}      | 28 ++++-----
 12 files changed, 214 insertions(+), 132 deletions(-)
 rename meta/recipes-devtools/dpkg/dpkg/{noman.patch => 0001-no-man.patch} (19%)
 rename meta/recipes-devtools/dpkg/dpkg/{remove-tar-no-timestamp.patch => 0002-remove-tar-no-timestamp.patch} (38%)
 rename meta/recipes-devtools/dpkg/dpkg/{arch_pm.patch => 0003-arch-pm.patch} (36%)
 rename meta/recipes-devtools/dpkg/dpkg/{add_armeb_triplet_entry.patch => 0004-add-armeb-tuple-entry-into-tupletable.patch} (51%)
 rename meta/recipes-devtools/dpkg/dpkg/{0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch => 0005-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch} (61%)
 rename meta/recipes-devtools/dpkg/dpkg/{0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch => 0006-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch} (88%)
 rename meta/recipes-devtools/dpkg/dpkg/{0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch => 0007-The-lutimes-function-doesn-t-work-properly-for-all-s.patch} (68%)
 rename meta/recipes-devtools/dpkg/dpkg/{0005-dpkg-compiler.m4-remove-Wvla.patch => 0008-dpkg-compiler.m4-remove-Wvla.patch} (78%)
 rename meta/recipes-devtools/dpkg/dpkg/{0006-add-musleabi-to-known-target-tripets.patch => 0009-add-musleabi-to-known-target-tupletable.patch} (14%)
 rename meta/recipes-devtools/dpkg/dpkg/{0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch => 0010-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch} (52%)
 rename meta/recipes-devtools/dpkg/dpkg/{glibc2.5-sync_file_range.patch => 0011-glibc2.5-sync-file-range.patch} (81%)
 rename meta/recipes-devtools/dpkg/{dpkg_1.18.10.bb => dpkg_1.18.24.bb} (19%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/0001-no-man.patch
similarity index 19%
rename from meta/recipes-devtools/dpkg/dpkg/noman.patch
rename to meta/recipes-devtools/dpkg/dpkg/0001-no-man.patch
index d30c150..7eb3dae 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-no-man.patch
@@ -1,14 +1,32 @@
+From 3be0b1983c943c31534f0f3e199a702a0033f3be Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 17 Aug 2017 10:29:21 +0800
+Subject: [PATCH 01/11] no man
+
 Upstream-Status: Inappropriate [disable feature]
 
-diff -ruN dpkg-1.15.8.5-orig/Makefile.am dpkg-1.15.8.5/Makefile.am
---- dpkg-1.15.8.5-orig/Makefile.am	2010-10-08 12:27:15.042083703 +0800
-+++ dpkg-1.15.8.5/Makefile.am	2010-10-08 12:27:27.755148228 +0800
-@@ -12,8 +12,7 @@
- 	utils \
+Signed-off-by: anonymous
+
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0da52cb..a1f79e0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,8 +13,7 @@ SUBDIRS = \
  	$(MAYBE_DSELECT) \
  	scripts \
+ 	t-func \
 -	po \
 -	man
 +	po
  
  ACLOCAL_AMFLAGS = -I m4
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/0002-remove-tar-no-timestamp.patch
similarity index 38%
rename from meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
rename to meta/recipes-devtools/dpkg/dpkg/0002-remove-tar-no-timestamp.patch
index 4f408ff..b003ce8 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-remove-tar-no-timestamp.patch
@@ -1,13 +1,25 @@
+From 2b55b89318b41b60c66d186e065fea715b4ff49d Mon Sep 17 00:00:00 2001
+From: Constantin Musca <constantinx.musca@intel.com>
+Date: Thu, 17 Aug 2017 10:31:49 +0800
+Subject: [PATCH 02/11] remove tar no timestamp
+
 busybox-1.19.4 tar utility doesn't support --warning=no-timestamp
 
+Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Upstream-Status: Inappropriate [configuration]
-Index: dpkg-1.17.1/dpkg-deb/extract.c
-===================================================================
---- dpkg-1.17.1.orig/dpkg-deb/extract.c
-+++ dpkg-1.17.1/dpkg-deb/extract.c
-@@ -318,7 +318,6 @@ extracthalf(const char *debar, const cha
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ dpkg-deb/extract.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/dpkg-deb/extract.c b/dpkg-deb/extract.c
+index b1d66ee..8f4ac04 100644
+--- a/dpkg-deb/extract.c
++++ b/dpkg-deb/extract.c
+@@ -328,7 +328,6 @@ extracthalf(const char *debar, const char *dir,
  
        command_add_arg(&cmd, "-f");
        command_add_arg(&cmd, "-");
@@ -15,3 +27,6 @@ Index: dpkg-1.17.1/dpkg-deb/extract.c
  
        m_dup2(p2[0],0);
        close(p2[0]);
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/0003-arch-pm.patch
similarity index 36%
rename from meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
rename to meta/recipes-devtools/dpkg/dpkg/0003-arch-pm.patch
index cad4c0f..d676c88 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-arch-pm.patch
@@ -1,3 +1,8 @@
+From 715be14a5794cb1774532656c7227f6b3622b0e4 Mon Sep 17 00:00:00 2001
+From: Joe Slater <jslater@windriver.com>
+Date: Thu, 17 Aug 2017 10:40:51 +0800
+Subject: [PATCH 03/11] arch pm
+
 configure cannot determine the proper cpu, os, or
 architecture for mips64, and possibly other arch's
 because of faulty code added to Arch.pm in the latest
@@ -7,16 +12,26 @@ Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ scripts/Dpkg/Arch.pm | 3 ---
+ 1 file changed, 3 deletions(-)
 
+diff --git a/scripts/Dpkg/Arch.pm b/scripts/Dpkg/Arch.pm
+index 1720847..6345ce3 100644
 --- a/scripts/Dpkg/Arch.pm
 +++ b/scripts/Dpkg/Arch.pm
-@@ -233,9 +233,6 @@ sub read_triplettable()
- 		    (my $dt = $debtriplet) =~ s/<cpu>/$_cpu/;
+@@ -323,9 +323,6 @@ sub _load_tupletable()
+ 		    (my $dt = $debtuple) =~ s/<cpu>/$_cpu/;
  		    (my $da = $debarch) =~ s/<cpu>/$_cpu/;
  
--		    next if exists $debarch_to_debtriplet{$da}
--		         or exists $debtriplet_to_debarch{$dt};
+-		    next if exists $debarch_to_debtuple{$da}
+-		         or exists $debtuple_to_debarch{$dt};
 -
- 		    $debarch_to_debtriplet{$da} = $dt;
- 		    $debtriplet_to_debarch{$dt} = $da;
+ 		    $debarch_to_debtuple{$da} = $dt;
+ 		    $debtuple_to_debarch{$dt} = $da;
  		}
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/0004-add-armeb-tuple-entry-into-tupletable.patch
similarity index 51%
rename from meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
rename to meta/recipes-devtools/dpkg/dpkg/0004-add-armeb-tuple-entry-into-tupletable.patch
index dc69eb2..b57f3ab 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-add-armeb-tuple-entry-into-tupletable.patch
@@ -1,7 +1,8 @@
-Author: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
-Date:   Wed Apr 8 18:08:14 2015 +0530
-
-[PATCH] add armeb triplet entry into triplettable.
+From ee7658878d93d58f3057ec4108d01195ccbb6a2c Mon Sep 17 00:00:00 2001
+From: "Krishnanjanappa, Jagadeesh"
+ <jagadeesh.krishnanjanappa@caviumnetworks.com>
+Date: Thu, 17 Aug 2017 10:50:27 +0800
+Subject: [PATCH 04/11] add armeb tuple entry into tupletable.
 
 Cross-compling dpkg application for armeb fails with below error
 during configure task,
@@ -25,22 +26,24 @@ Upstream-Status: Pending
 
 Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
 
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- triplettable | 1 +
+ data/tupletable | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/triplettable b/triplettable
-index abe4726..1e9c247 100644
---- a/triplettable
-+++ b/triplettable
-@@ -11,6 +11,7 @@ gnueabihf-linux-arm	armhf
- gnueabi-linux-arm	armel
- gnuabin32-linux-mips64r6el	mipsn32r6el
- gnuabin32-linux-mips64r6	mipsn32r6
-+gnueabi-linux-armeb	armeb
- gnuabin32-linux-mips64el	mipsn32el
- gnuabin32-linux-mips64	mipsn32
- gnuabi64-linux-mips64r6el	mips64r6el
+diff --git a/data/tupletable b/data/tupletable
+index b7802be..5f500f6 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -12,6 +12,7 @@ base-musl-linux-<cpu>		musl-linux-<cpu>
+ ilp32-gnu-linux-arm64		arm64ilp32
+ eabihf-gnu-linux-arm		armhf
+ eabi-gnu-linux-arm		armel
++eabi-gnu-linux-armeb		armeb
+ abin32-gnu-linux-mips64r6el	mipsn32r6el
+ abin32-gnu-linux-mips64r6	mipsn32r6
+ abin32-gnu-linux-mips64el	mipsn32el
 -- 
-2.1.4
+1.8.3.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0005-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
similarity index 61%
rename from meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
rename to meta/recipes-devtools/dpkg/dpkg/0005-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index 231a6a2..4cb0f7e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0005-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -1,25 +1,30 @@
-From b4ea54158c399874e12394ebc91afe98954695e2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 26 Aug 2015 16:16:16 +0300
-Subject: [PATCH 2/5] Adapt to linux-wrs kernel version, which has character
- '_' inside. Remove the first-char-digit-check (as the 1.15.8.5 version does).
+From b86ed1bbaa8d5a318a886beb3593178c8420c934 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 17 Aug 2017 11:09:56 +0800
+Subject: [PATCH 05/11] Adapt to linux-wrs kernel version, which has character 
+ '_' inside.
+
+Remove the first-char-digit-check (as the 1.15.8.5 version does).
+
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Upstream-Status: Inappropriate [embedded specific]
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  lib/dpkg/parsehelp.c | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
-index 79b2908..7758aa5 100644
+index 453077f..ba42ff9 100644
 --- a/lib/dpkg/parsehelp.c
 +++ b/lib/dpkg/parsehelp.c
-@@ -235,14 +235,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
- 
-   /* XXX: Would be faster to use something like cisversion and cisrevision. */
+@@ -243,14 +243,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
    ptr = rversion->version;
+   if (!*ptr)
+     return dpkg_put_error(err, _("version number is empty"));
 -  if (*ptr && !c_isdigit(*ptr++))
 -    return dpkg_put_warn(err, _("version number does not start with digit"));
    for (; *ptr; ptr++) {
@@ -29,10 +34,10 @@ index 79b2908..7758aa5 100644
    }
    for (ptr = rversion->revision; *ptr; ptr++) {
 -    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".+~", *ptr) == NULL)
-+    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~_", *ptr) == NULL)
++    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".+~_", *ptr) == NULL)
        return dpkg_put_warn(err, _("invalid character in revision number"));
    }
  
 -- 
-2.1.4
+1.8.3.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0006-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
similarity index 88%
rename from meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
rename to meta/recipes-devtools/dpkg/dpkg/0006-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 93d8704..159eab6 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -1,7 +1,7 @@
-From 24229971492515b64c81e8c6392e5dfbdc22b44c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
+From b1bcfbfd95512268d9925ff65c1e5ca5c4675a67 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
-Subject: [PATCH 3/5] Our pre/postinsts expect $D to be set when running in a
+Subject: [PATCH 06/11] Our pre/postinsts expect $D to be set when running in a
  sysroot and don't expect a chroot. This matches up our system expectations
  with what dpkg does.
 
@@ -10,6 +10,9 @@ Upstream-Status: Inappropriate [OE Specific]
 RP 2011/12/07
 ALIMON 2016/05/26
 ALIMON 2017/02/21
+
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  src/script.c | 44 +++-----------------------------------------
  1 file changed, 3 insertions(+), 41 deletions(-)
@@ -71,5 +74,5 @@ index 2f252ae..768a9d1 100644
  
  /**
 -- 
-2.1.4
+1.8.3.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0007-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
similarity index 68%
rename from meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
rename to meta/recipes-devtools/dpkg/dpkg/0007-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
index 56c85c7..daa6179 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -1,21 +1,23 @@
-From adb6bfd0feeceaf030df0debe3343d7f73e708a0 Mon Sep 17 00:00:00 2001
+From d661b0c20a5a8c8cefa8c88fbca8b37e9b693948 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:27:45 +0300
-Subject: [PATCH 4/5] The lutimes function doesn't work properly for all
+Subject: [PATCH 07/11] The lutimes function doesn't work properly for all
  systems.
 
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Upstream-Status: Inappropriate [embedded specific]
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  src/archives.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/archives.c b/src/archives.c
-index bff5f14..b711013 100644
+index b82ee4f..4b2fc92 100644
 --- a/src/archives.c
 +++ b/src/archives.c
-@@ -449,8 +449,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
+@@ -486,8 +486,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
  
    if (te->type == TAR_FILETYPE_SYMLINK) {
  #ifdef HAVE_LUTIMES
@@ -27,5 +29,5 @@ index bff5f14..b711013 100644
    } else {
      if (utimes(path, tv))
 -- 
-2.1.4
+1.8.3.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch b/meta/recipes-devtools/dpkg/dpkg/0008-dpkg-compiler.m4-remove-Wvla.patch
similarity index 78%
rename from meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
rename to meta/recipes-devtools/dpkg/dpkg/0008-dpkg-compiler.m4-remove-Wvla.patch
index 96e96f2..eae9fcb 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0008-dpkg-compiler.m4-remove-Wvla.patch
@@ -1,7 +1,7 @@
-From 0ad7bba80d5b9035089ff2b2f77a774b5b201915 Mon Sep 17 00:00:00 2001
+From ad0730d82b64e5caf56e71267649bef67146d70f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:28:59 +0300
-Subject: [PATCH 5/5] dpkg-compiler.m4: remove -Wvla
+Subject: [PATCH 08/11] dpkg-compiler.m4: remove -Wvla
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -15,15 +15,18 @@ Upstream-Status: Pending
 Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  m4/dpkg-compiler.m4 | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/m4/dpkg-compiler.m4 b/m4/dpkg-compiler.m4
-index 682857c..23ed7d0 100644
+index ad11c19..b2e3fbf 100644
 --- a/m4/dpkg-compiler.m4
 +++ b/m4/dpkg-compiler.m4
-@@ -52,7 +52,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
+@@ -58,7 +58,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
    DPKG_CHECK_COMPILER_FLAG([-Wlogical-op])
    DPKG_CHECK_COMPILER_FLAG([-Wlogical-not-parentheses])
    DPKG_CHECK_COMPILER_FLAG([-Wswitch-bool])
@@ -32,5 +35,5 @@ index 682857c..23ed7d0 100644
    DPKG_CHECK_COMPILER_FLAG([-Wwrite-strings])
    DPKG_CHECK_COMPILER_FLAG([-Wcast-align])
 -- 
-2.1.4
+1.8.3.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0009-add-musleabi-to-known-target-tupletable.patch
similarity index 14%
rename from meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
rename to meta/recipes-devtools/dpkg/dpkg/0009-add-musleabi-to-known-target-tupletable.patch
index a6b0088..5915841 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0009-add-musleabi-to-known-target-tupletable.patch
@@ -1,42 +1,44 @@
-From f8910022dc3ec622272f168cd0022dbdf6dff93a Mon Sep 17 00:00:00 2001
+From aefb1e87fa6cdc71bf80ccb5a6e179eb461b73bc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Dec 2015 23:05:41 +0000
-Subject: [PATCH] add musleabi to known target tripets
+Date: Thu, 17 Aug 2017 11:21:27 +0800
+Subject: [PATCH 09/11] add musleabi to known target tupletable
 
 helps compiling dpkg for musl/arm-softfloat
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
- ostable      | 1 +
- triplettable | 1 +
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ data/ostable    | 1 +
+ data/tupletable | 1 +
  2 files changed, 2 insertions(+)
 
-diff --git a/ostable b/ostable
-index 3bb6819..d0ffdc7 100644
---- a/ostable
-+++ b/ostable
-@@ -15,6 +15,7 @@
- uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
- uclibc-linux		linux-uclibc		linux[^-]*-uclibc
- musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
-+musleabi-linux		linux-musleabi		linux[^-]*-musleabi
- musl-linux		linux-musl		linux[^-]*-musl
- gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
- gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
-diff --git a/triplettable b/triplettable
-index 1213584..70d24c1 100644
---- a/triplettable
-+++ b/triplettable
-@@ -6,6 +6,7 @@
- uclibceabi-linux-arm	uclibc-linux-armel
- uclibc-linux-<cpu>	uclibc-linux-<cpu>
- musleabihf-linux-arm	musl-linux-armhf
-+musleabi-linux-arm	musl-linux-armel
- musl-linux-<cpu>	musl-linux-<cpu>
- gnueabihf-linux-arm	armhf
- gnueabi-linux-arm	armel
+diff --git a/data/ostable b/data/ostable
+index 99c1f88..be64342 100644
+--- a/data/ostable
++++ b/data/ostable
+@@ -17,6 +17,7 @@
+ eabi-uclibc-linux	linux-uclibceabi	linux[^-]*-uclibceabi
+ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
+ eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
++eabi-musl-linux		linux-musleabi		linux[^-]*-musleabi
+ base-musl-linux		linux-musl		linux[^-]*-musl
+ eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
+ eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
+diff --git a/data/tupletable b/data/tupletable
+index 5f500f6..28f00bf 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -8,6 +8,7 @@
+ eabi-uclibc-linux-arm		uclibc-linux-armel
+ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
+ eabihf-musl-linux-arm		musl-linux-armhf
++eabi-musl-linux-arm		musl-linux-armel
+ base-musl-linux-<cpu>		musl-linux-<cpu>
+ ilp32-gnu-linux-arm64		arm64ilp32
+ eabihf-gnu-linux-arm		armhf
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0010-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
similarity index 52%
rename from meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
rename to meta/recipes-devtools/dpkg/dpkg/0010-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index 8bfaad1..7469daf 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0010-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -1,7 +1,7 @@
-From 8659eeeeda74d71e12080121f0b13a88cbdda433 Mon Sep 17 00:00:00 2001
+From d944ba5c4f42512cb9e3f9c60c96d25dc6b949ee Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Tue, 21 Feb 2017 11:23:27 -0600
-Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
+Date: Thu, 17 Aug 2017 11:24:28 +0800
+Subject: [PATCH 10/11] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -12,29 +12,32 @@ build tarballs [1].
 But host tools doesn't support this option because is new on tar
 so disable in our builds.
 
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
 Upstream-Status: Inappropriate [Configuration]
 
 [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=759999#20
 [2] https://lists.gnu.org/archive/html/help-tar/2016-01/msg00000.html
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  dpkg-deb/build.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 655aa55..927f56f 100644
+index a92b58e..a3d1912 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
-@@ -447,7 +447,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
-     snprintf(mtime, sizeof(mtime), "@%ld", timestamp);
+@@ -450,7 +450,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  
-     execlp(TAR, "tar", "-cf", "-", "--format=gnu",
--                       "--mtime", mtime, "--clamp-mtime",
-+                       "--mtime", mtime,
-                        "--null", "--no-unquote",
-                        "--no-recursion", "-T", "-", NULL);
-     ohshite(_("unable to execute %s (%s)"), "tar -cf", TAR);
+     command_init(&cmd, TAR, "tar -cf");
+     command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
+-                           "--mtime", mtime, "--clamp-mtime", NULL);
++                           "--mtime", mtime, NULL);
+     /* Mode might become a positional argument, pass it before -T. */
+     if (mode)
+       command_add_args(&cmd, "--mode", mode, NULL);
 -- 
-2.1.4
+1.8.3.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch b/meta/recipes-devtools/dpkg/dpkg/0011-glibc2.5-sync-file-range.patch
similarity index 81%
rename from meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
rename to meta/recipes-devtools/dpkg/dpkg/0011-glibc2.5-sync-file-range.patch
index d56b8a6..d71d045 100644
--- a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0011-glibc2.5-sync-file-range.patch
@@ -1,12 +1,17 @@
-CentOS 5.8 kernels and headers support the sync_file_range() system call,
-but glibc 2.5 doesn't provide the syscall stub.  It appears that this
+From 1763500b67f21291b52157a5c40144bf40266090 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 17 Aug 2017 11:26:41 +0800
+Subject: [PATCH 11/11] glibc2.5 sync file range
+
+CentOS 5.8 kernels and headers support the sync_file_range() system
+call,but glibc 2.5 doesn't provide the syscall stub.  It appears that this
 problem is known but will never be fixed:
 
   https://bugzilla.redhat.com/show_bug.cgi?id=518581
 
-  Bug 518581 - [RHEL5] glibc misses sync_file_range syscall interface 
+  Bug 518581 - [RHEL5] glibc misses sync_file_range syscall interface
 
-  Status:       CLOSED CANTFIX 
+  Status:       CLOSED CANTFIX
   Last Closed:  2009-11-22 22:19:55
 
   Kirby Zhou 2009-08-20 23:37:55 EDT
@@ -41,8 +46,8 @@ problem is known but will never be fixed:
   int sync_file_range (int fd, __off64_t from, __off64_t to, unsigned int flags)
   {
     return syscall (NR_sync_file_range, fd,
-                           __LONG_LONG_PAIR ((long) (from >> 32), (long) from),
-                           __LONG_LONG_PAIR ((long) (to >> 32), (long) to),
+                           __LONG_LONG_PAIR ((long) (from >> 32), (long)from),
+                           __LONG_LONG_PAIR ((long) (to >> 32), (long)to),
                            flags);
   }
   #endif
@@ -60,13 +65,18 @@ Upstream-Status: Inappropriate [everyone else builds on newer hosts :-)]
 
 Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
 Signed-off-by: Lei Liu <lei.liu2@windriver.com>
+
+Rebase to 1.18.24
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/archives.c |    4 ++--
+ src/archives.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/archives.c b/src/archives.c
+index 4b2fc92..a92b795 100644
 --- a/src/archives.c
 +++ b/src/archives.c
-@@ -75,7 +75,7 @@
+@@ -69,7 +69,7 @@ fd_writeback_init(int fd)
    /* Ignore the return code as it should be considered equivalent to an
     * asynchronous hint for the kernel, we are doing an fsync() later on
     * anyway. */
@@ -75,7 +85,7 @@ Signed-off-by: Lei Liu <lei.liu2@windriver.com>
    sync_file_range(fd, 0, 0, SYNC_FILE_RANGE_WRITE);
  #elif defined(HAVE_POSIX_FADVISE)
    posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
-@@ -1179,7 +1179,7 @@
+@@ -1078,7 +1078,7 @@ tarobject(void *ctx, struct tar_entry *ti)
    return 0;
  }
  
@@ -84,3 +94,6 @@ Signed-off-by: Lei Liu <lei.liu2@windriver.com>
  static void
  tar_writeback_barrier(struct fileinlist *files, struct pkginfo *pkg)
  {
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.10.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
similarity index 19%
rename from meta/recipes-devtools/dpkg/dpkg_1.18.10.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
index 21385af..6323e68 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.10.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
@@ -1,20 +1,20 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160731T221931Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
-           file://noman.patch \
-           file://remove-tar-no-timestamp.patch \
-           file://arch_pm.patch \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20170816T214423Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://dpkg-configure.service \
-           file://add_armeb_triplet_entry.patch \
-           file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
-           file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
-           file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
-           file://0005-dpkg-compiler.m4-remove-Wvla.patch \
-           file://0006-add-musleabi-to-known-target-tripets.patch \
-           file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
+           file://0001-no-man.patch \
+           file://0002-remove-tar-no-timestamp.patch \
+           file://0003-arch-pm.patch \
+           file://0004-add-armeb-tuple-entry-into-tupletable.patch \
+           file://0005-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
+           file://0006-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
+           file://0007-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
+           file://0008-dpkg-compiler.m4-remove-Wvla.patch \
+           file://0009-add-musleabi-to-known-target-tupletable.patch \
+           file://0010-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            "
-SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
+SRC_URI_append_class-native = " file://0011-glibc2.5-sync-file-range.patch "
 
-SRC_URI[md5sum] = "ccff17730c0964428fc186ded2f2f401"
-SRC_URI[sha256sum] = "025524da41ba18b183ff11e388eb8686f7cc58ee835ed7d48bd159c46a8b6dc5"
+SRC_URI[md5sum] = "02e8af8faf1e689228da806c3e8c6882"
+SRC_URI[sha256sum] = "d853081d3e06bfd46a227056e591f094e42e78fa8a5793b0093bad30b710d7b4"
-- 
2.8.1


