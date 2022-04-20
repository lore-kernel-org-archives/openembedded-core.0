Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA77C65BA5
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.13946.1650491500252573831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7Nby0mPr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id c23so3064878plo.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FKK10WxnV4zGcfplVOlJSBv3hNACWYeFNoJ4b4rpY98=;
        b=7Nby0mPrphrwfnuRSgDkargSQFgMobFknLnZYne0z9Gc1kudH0sVpfTSF7mC9Lh16h
         sbU8yZOOMNrnruMEh1rOLiEAOwDj2EjKUaZXuhYquVehvTs92PYTeSSO8YKv5bJ2cYjb
         tZfmxJuStbt0b5W/sCh0mG+aJv9plgmLCB3xzU7VDuoii6LtG5eTy0e4nXsDPD4xfnrP
         /K/xcXyfGlU0beW3YhAIudgjqgphH9ZfWNlB/n3UO7tKNcCwszow19ZCx2wK7xSwJNot
         QC5b9HWag1R5rg61tMoY6YO81U/suCVyIDZuyx5N2QI7e5QpXTu45i+TEYYONv3UcOy9
         0nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FKK10WxnV4zGcfplVOlJSBv3hNACWYeFNoJ4b4rpY98=;
        b=rm4boqhNZvMAN8RYAhLEX8w+/jG+n/bn2eTxzK2oWYF9Jy7WFhZHCEDSY2vzVt8hUv
         CfPqZXsI7xqx3OnlAxPUMSU3+rRmFVed+heX750fJUe6JviGhH10ptI9xEeqmA/iqWBZ
         OiscYEWpJ6scEgafwG6HLRmBT6jray5kntw0gcydXDgoIOTHqBb2JbpAoAtjnFdi1sk8
         hP4PcP/25WggabAXpvAZKPgRXambJL1My4e/A+5O8zSRZx03sgoaQpRumIbI7CWZOccM
         N4pwn66JpJJ3dMqOq65/SKjTaoB/3fUGEn6ePXpxgG68O9II+yr1PphXWMMDzL+tI37+
         zWvg==
X-Gm-Message-State: AOAM5335NyJic+MuapRDFIXQZhO+NhKKN85TlA1+zY0ePd7DLguKvFf6
	Pj6FNUn4vGu+8DAKB7UuUsgSm8Ox1iMmdsr1Z3E=
X-Google-Smtp-Source: 
 ABdhPJxvlOVEcAbDKukL6xo2Q8zeCkamx96p53uiORKpMFYqB73Dx76wgOy/zd0Rn6ITxVI0L3sIlA==
X-Received: by 2002:a17:90b:1a8f:b0:1d2:acdc:71d2 with SMTP id
 ng15-20020a17090b1a8f00b001d2acdc71d2mr6728290pjb.41.1650491499187;
        Wed, 20 Apr 2022 14:51:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b0050567191161sm21102153pfe.210.2022.04.20.14.51.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:51:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] git update from 2.24.3 to 2.24.4
Date: Wed, 20 Apr 2022 11:51:11 -1000
Message-Id: 
 <8606d99041c3c1a002b2300c59afc116050c73cc.1650491190.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650491190.git.steve@sakoman.com>
References: <cover.1650491190.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164731

Security release, fixes CVE-2021-21300, so remove that patch.

22539ec3b5 unpack_trees(): start with a fresh lstat cache
0d58fef58a run-command: invalidate lstat cache after a command finished
684dd4c2b4 checkout: fix bug that makes checkout follow symlinks in leading path

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/files/CVE-2021-21300.patch            | 305 ------------------
 meta/recipes-devtools/git/git.inc             |   1 -
 .../git/{git_2.24.3.bb => git_2.24.4.bb}      |   4 +-
 3 files changed, 2 insertions(+), 308 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/files/CVE-2021-21300.patch
 rename meta/recipes-devtools/git/{git_2.24.3.bb => git_2.24.4.bb} (51%)

diff --git a/meta/recipes-devtools/git/files/CVE-2021-21300.patch b/meta/recipes-devtools/git/files/CVE-2021-21300.patch
deleted file mode 100644
index 9206f711cf..0000000000
--- a/meta/recipes-devtools/git/files/CVE-2021-21300.patch
+++ /dev/null
@@ -1,305 +0,0 @@
-From 0e9cef2414f0df3fa5b9b56ff9072aa122bef29c Mon Sep 17 00:00:00 2001
-From: Minjae Kim <flowrgom@gmail.com>
-Date: Sat, 27 Mar 2021 15:18:46 +0900
-Subject: [PATCH] checkout: fix bug that makes checkout follow symlinks in
- leading path
-
-Before checking out a file, we have to confirm that all of its leading
-components are real existing directories. And to reduce the number of
-lstat() calls in this process, we cache the last leading path known to
-contain only directories. However, when a path collision occurs (e.g.
-when checking out case-sensitive files in case-insensitive file
-systems), a cached path might have its file type changed on disk,
-leaving the cache on an invalid state. Normally, this doesn't bring
-any bad consequences as we usually check out files in index order, and
-therefore, by the time the cached path becomes outdated, we no longer
-need it anyway (because all files in that directory would have already
-been written).
-
-But, there are some users of the checkout machinery that do not always
-follow the index order. In particular: checkout-index writes the paths
-in the same order that they appear on the CLI (or stdin); and the
-delayed checkout feature -- used when a long-running filter process
-replies with "status=delayed" -- postpones the checkout of some entries,
-thus modifying the checkout order.
-
-When we have to check out an out-of-order entry and the lstat() cache is
-invalid (due to a previous path collision), checkout_entry() may end up
-using the invalid data and thrusting that the leading components are
-real directories when, in reality, they are not. In the best case
-scenario, where the directory was replaced by a regular file, the user
-will get an error: "fatal: unable to create file 'foo/bar': Not a
-directory". But if the directory was replaced by a symlink, checkout
-could actually end up following the symlink and writing the file at a
-wrong place, even outside the repository. Since delayed checkout is
-affected by this bug, it could be used by an attacker to write
-arbitrary files during the clone of a maliciously crafted repository.
-
-Some candidate solutions considered were to disable the lstat() cache
-during unordered checkouts or sort the entries before passing them to
-the checkout machinery. But both ideas include some performance penalty
-and they don't future-proof the code against new unordered use cases.
-
-Instead, we now manually reset the lstat cache whenever we successfully
-remove a directory. Note: We are not even checking whether the directory
-was the same as the lstat cache points to because we might face a
-scenario where the paths refer to the same location but differ due to
-case folding, precomposed UTF-8 issues, or the presence of `..`
-components in the path. Two regression tests, with case-collisions and
-utf8-collisions, are also added for both checkout-index and delayed
-checkout.
-
-Note: to make the previously mentioned clone attack unfeasible, it would
-be sufficient to reset the lstat cache only after the remove_subtree()
-call inside checkout_entry(). This is the place where we would remove a
-directory whose path collides with the path of another entry that we are
-currently trying to check out (possibly a symlink). However, in the
-interest of a thorough fix that does not leave Git open to
-similar-but-not-identical attack vectors, we decided to intercept
-all `rmdir()` calls in one fell swoop.
-
-This addresses CVE-2021-21300.
-
-Co-authored-by: Johannes Schindelin <johannes.schindelin@gmx.de>
-Signed-off-by: Matheus Tavares <matheus.bernardino@usp.br>
-
-Upstream-Status: Acepted [https://github.com/git/git/commit/684dd4c2b414bcf648505e74498a608f28de4592]
-CVE: CVE-2021-21300
-Signed-off-by: Minjae Kim <flowergom@gmail.com>
----
- cache.h                         |  1 +
- compat/mingw.c                  |  2 ++
- git-compat-util.h               |  5 +++++
- symlinks.c                      | 25 +++++++++++++++++++++
- t/t0021-conversion.sh           | 39 ++++++++++++++++++++++++++++++++
- t/t0021/rot13-filter.pl         | 21 ++++++++++++++---
- t/t2006-checkout-index-basic.sh | 40 +++++++++++++++++++++++++++++++++
- 7 files changed, 130 insertions(+), 3 deletions(-)
-
-diff --git a/cache.h b/cache.h
-index 04cabaa..dda373f 100644
---- a/cache.h
-+++ b/cache.h
-@@ -1675,6 +1675,7 @@ int has_symlink_leading_path(const char *name, int len);
- int threaded_has_symlink_leading_path(struct cache_def *, const char *, int);
- int check_leading_path(const char *name, int len);
- int has_dirs_only_path(const char *name, int len, int prefix_len);
-+extern void invalidate_lstat_cache(void);
- void schedule_dir_for_removal(const char *name, int len);
- void remove_scheduled_dirs(void);
- 
-diff --git a/compat/mingw.c b/compat/mingw.c
-index bd24d91..cea9c72 100644
---- a/compat/mingw.c
-+++ b/compat/mingw.c
-@@ -340,6 +340,8 @@ int mingw_rmdir(const char *pathname)
- 	       ask_yes_no_if_possible("Deletion of directory '%s' failed. "
- 			"Should I try again?", pathname))
- 	       ret = _wrmdir(wpathname);
-+	if (!ret)
-+		invalidate_lstat_cache();
- 	return ret;
- }
- 
-diff --git a/git-compat-util.h b/git-compat-util.h
-index d0dd9c0..a1ecfd3 100644
---- a/git-compat-util.h
-+++ b/git-compat-util.h
-@@ -365,6 +365,11 @@ static inline int noop_core_config(const char *var, const char *value, void *cb)
- #define platform_core_config noop_core_config
- #endif
- 
-+int lstat_cache_aware_rmdir(const char *path);
-+#if !defined(__MINGW32__) && !defined(_MSC_VER)
-+#define rmdir lstat_cache_aware_rmdir
-+#endif
-+
- #ifndef has_dos_drive_prefix
- static inline int git_has_dos_drive_prefix(const char *path)
- {
-diff --git a/symlinks.c b/symlinks.c
-index 69d458a..ae3c665 100644
---- a/symlinks.c
-+++ b/symlinks.c
-@@ -267,6 +267,13 @@ int has_dirs_only_path(const char *name, int len, int prefix_len)
-  */
- static int threaded_has_dirs_only_path(struct cache_def *cache, const char *name, int len, int prefix_len)
- {
-+	/*
-+	 * Note: this function is used by the checkout machinery, which also
-+	 * takes care to properly reset the cache when it performs an operation
-+	 * that would leave the cache outdated. If this function starts caching
-+	 * anything else besides FL_DIR, remember to also invalidate the cache
-+	 * when creating or deleting paths that might be in the cache.
-+	 */
- 	return lstat_cache(cache, name, len,
- 			   FL_DIR|FL_FULLPATH, prefix_len) &
- 		FL_DIR;
-@@ -321,3 +328,21 @@ void remove_scheduled_dirs(void)
- {
- 	do_remove_scheduled_dirs(0);
- }
-+
-+
-+void invalidate_lstat_cache(void)
-+{
-+	reset_lstat_cache(&default_cache);
-+}
-+
-+#undef rmdir
-+int lstat_cache_aware_rmdir(const char *path)
-+{
-+	/* Any change in this function must be made also in `mingw_rmdir()` */
-+	int ret = rmdir(path);
-+
-+	if (!ret)
-+		invalidate_lstat_cache();
-+
-+	return ret;
-+}
-diff --git a/t/t0021-conversion.sh b/t/t0021-conversion.sh
-index c954c70..6a1d5f6 100755
---- a/t/t0021-conversion.sh
-+++ b/t/t0021-conversion.sh
-@@ -820,4 +820,43 @@ test_expect_success PERL 'invalid file in delayed checkout' '
- 	grep "error: external filter .* signaled that .unfiltered. is now available although it has not been delayed earlier" git-stderr.log
- '
- 
-+for mode in 'case' 'utf-8'
-+do
-+	case "$mode" in
-+	case)	dir='A' symlink='a' mode_prereq='CASE_INSENSITIVE_FS' ;;
-+	utf-8)
-+		dir=$(printf "\141\314\210") symlink=$(printf "\303\244")
-+		mode_prereq='UTF8_NFD_TO_NFC' ;;
-+	esac
-+
-+	test_expect_success PERL,SYMLINKS,$mode_prereq \
-+	"delayed checkout with $mode-collision don't write to the wrong place" '
-+		test_config_global filter.delay.process \
-+			"\"$TEST_ROOT/rot13-filter.pl\" --always-delay delayed.log clean smudge delay" &&
-+		test_config_global filter.delay.required true &&
-+		git init $mode-collision &&
-+		(
-+			cd $mode-collision &&
-+			mkdir target-dir &&
-+			empty_oid=$(printf "" | git hash-object -w --stdin) &&
-+			symlink_oid=$(printf "%s" "$PWD/target-dir" | git hash-object -w --stdin) &&
-+			attr_oid=$(echo "$dir/z filter=delay" | git hash-object -w --stdin) &&
-+			cat >objs <<-EOF &&
-+			100644 blob $empty_oid	$dir/x
-+			100644 blob $empty_oid	$dir/y
-+			100644 blob $empty_oid	$dir/z
-+			120000 blob $symlink_oid	$symlink
-+			100644 blob $attr_oid	.gitattributes
-+			EOF
-+			git update-index --index-info <objs &&
-+			git commit -m "test commit"
-+		) &&
-+		git clone $mode-collision $mode-collision-cloned &&
-+		# Make sure z was really delayed
-+		grep "IN: smudge $dir/z .* \\[DELAYED\\]" $mode-collision-cloned/delayed.log &&
-+		# Should not create $dir/z at $symlink/z
-+		test_path_is_missing $mode-collision/target-dir/z
-+	'
-+done
-+
- test_done
-diff --git a/t/t0021/rot13-filter.pl b/t/t0021/rot13-filter.pl
-index 4701072..007f2d7 100644
---- a/t/t0021/rot13-filter.pl
-+++ b/t/t0021/rot13-filter.pl
-@@ -2,9 +2,15 @@
- # Example implementation for the Git filter protocol version 2
- # See Documentation/gitattributes.txt, section "Filter Protocol"
- #
--# The first argument defines a debug log file that the script write to.
--# All remaining arguments define a list of supported protocol
--# capabilities ("clean", "smudge", etc).
-+# Usage: rot13-filter.pl [--always-delay] <log path> <capabilities>
-+#
-+# Log path defines a debug log file that the script writes to. The
-+# subsequent arguments define a list of supported protocol capabilities
-+# ("clean", "smudge", etc).
-+#
-+# When --always-delay is given all pathnames with the "can-delay" flag
-+# that don't appear on the list bellow are delayed with a count of 1
-+# (see more below).
- #
- # This implementation supports special test cases:
- # (1) If data with the pathname "clean-write-fail.r" is processed with
-@@ -53,6 +59,13 @@ sub gitperllib {
- use Git::Packet;
- 
- my $MAX_PACKET_CONTENT_SIZE = 65516;
-+
-+my $always_delay = 0;
-+if ( $ARGV[0] eq '--always-delay' ) {
-+	$always_delay = 1;
-+	shift @ARGV;
-+}
-+
- my $log_file                = shift @ARGV;
- my @capabilities            = @ARGV;
- 
-@@ -134,6 +147,8 @@ sub rot13 {
- 			if ( $buffer eq "can-delay=1" ) {
- 				if ( exists $DELAY{$pathname} and $DELAY{$pathname}{"requested"} == 0 ) {
- 					$DELAY{$pathname}{"requested"} = 1;
-+				} elsif ( !exists $DELAY{$pathname} and $always_delay ) {
-+					$DELAY{$pathname} = { "requested" => 1, "count" => 1 };
- 				}
- 			} else {
- 				die "Unknown message '$buffer'";
-diff --git a/t/t2006-checkout-index-basic.sh b/t/t2006-checkout-index-basic.sh
-index 57cbdfe..f223a02 100755
---- a/t/t2006-checkout-index-basic.sh
-+++ b/t/t2006-checkout-index-basic.sh
-@@ -21,4 +21,44 @@ test_expect_success 'checkout-index -h in broken repository' '
- 	test_i18ngrep "[Uu]sage" broken/usage
- '
- 
-+for mode in 'case' 'utf-8'
-+do
-+	case "$mode" in
-+	case)	dir='A' symlink='a' mode_prereq='CASE_INSENSITIVE_FS' ;;
-+	utf-8)
-+		dir=$(printf "\141\314\210") symlink=$(printf "\303\244")
-+		mode_prereq='UTF8_NFD_TO_NFC' ;;
-+	esac
-+
-+	test_expect_success SYMLINKS,$mode_prereq \
-+	"checkout-index with $mode-collision don't write to the wrong place" '
-+		git init $mode-collision &&
-+		(
-+			cd $mode-collision &&
-+			mkdir target-dir &&
-+			empty_obj_hex=$(git hash-object -w --stdin </dev/null) &&
-+			symlink_hex=$(printf "%s" "$PWD/target-dir" | git hash-object -w --stdin) &&
-+			cat >objs <<-EOF &&
-+			100644 blob ${empty_obj_hex}	${dir}/x
-+			100644 blob ${empty_obj_hex}	${dir}/y
-+			100644 blob ${empty_obj_hex}	${dir}/z
-+			120000 blob ${symlink_hex}	${symlink}
-+			EOF
-+			git update-index --index-info <objs &&
-+			# Note: the order is important here to exercise the
-+			# case where the file at ${dir} has its type changed by
-+			# the time Git tries to check out ${dir}/z.
-+			#
-+			# Also, we use core.precomposeUnicode=false because we
-+			# want Git to treat the UTF-8 paths transparently on
-+			# Mac OS, matching what is in the index.
-+			#
-+			git -c core.precomposeUnicode=false checkout-index -f \
-+				${dir}/x ${dir}/y ${symlink} ${dir}/z &&
-+			# Should not create ${dir}/z at ${symlink}/z
-+			test_path_is_missing target-dir/z
-+		)
-+	'
-+done
-+
- test_done
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index ffbae145cf..879920d97e 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -9,7 +9,6 @@ PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
-	   file://CVE-2021-21300.patch \
            file://fixsort.patch \
            file://CVE-2021-40330.patch \
            "
diff --git a/meta/recipes-devtools/git/git_2.24.3.bb b/meta/recipes-devtools/git/git_2.24.4.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.24.3.bb
rename to meta/recipes-devtools/git/git_2.24.4.bb
index ddd875f07b..f38c25f0ef 100644
--- a/meta/recipes-devtools/git/git_2.24.3.bb
+++ b/meta/recipes-devtools/git/git_2.24.4.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "ef6d1d1de1d7921a54d23d07479bd2766f050d6435cea5d3b5322aa4897cb3d7"
-SRC_URI[manpages.sha256sum] = "325795ba33c0be02370de79636f32ad3b447665c1f2b5b4de65181fa804bed31"
+SRC_URI[tarball.sha256sum] = "6e119e70d3762f28e1dc9928c526eb4d7519fd3870f862775cd10186653eb85a"
+SRC_URI[manpages.sha256sum] = "e687bcc91a6fd9cb74243f91a9c2d77c50ce202a09b35931021ecc521a373ed5"
-- 
2.25.1


