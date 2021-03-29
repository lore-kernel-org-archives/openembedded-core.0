Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.16624.1616987357089383564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 20:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VAVvPuQX;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id v8so3725930plz.10
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Mar 2021 20:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOD5q1nx/OXaep3uqflQxWyNo4eCrijeXMfWLji4l98=;
        b=VAVvPuQXufxKFCW9Mq3TqrNdGogMAHLorLMJDBcBvkQJOMHMC7lmFps2rdFjaIO2qP
         lknAmOk8CkpIIen+J0x0DGhCcrZuChuvlPHK4jM0de4c8eZ2DCNwHlmNzo3SLroxlnF+
         VuYxSgomqVpYfLCbVgrHroyLRxkdVjSdxzGELkt/9BBz+mQI/65t/KS+3ScjiEjTJWHM
         aA0z+0C8XI/EFvTr59fRwpKt7dpNtgrYEDPS/8BYNk5t+ecKF7v2VqctXyrkXZxKg8U+
         ddLFTXz2KpTl1SfHbPQIsJPmtiZuycxLw14YOBxrMwxt8oXGL7YPsHqZvZZsuR43QcdU
         RocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOD5q1nx/OXaep3uqflQxWyNo4eCrijeXMfWLji4l98=;
        b=rsvqD3l1MezjfbzuPXrdrIPcPyUU0Kf9QfX29FZCCY/yPBn9KOQdbz5pEf7rpVH0jh
         1LGyeDRJtd/bRP1kJl7lPZ/KvsV/aN/ebPp8ChqASDpYNC7seb95WFXMWfXcjg/dOMJb
         0P1NSzirVsSuHcAoW0b5FaUrz4tXyTCmfIpAvRyMwt0sJa/2p4Pwyf7Mb5ZW4A8ptluS
         HaWbQxooZ2+BJzIL7GGokFYIbRXmOBdrrWBPtnWYfy+5KZrwP3Tex7rkc/DlhX35JBI3
         fo6Sh0lWSegBhbgpNx0xxGkIe4Q0UuI1sQtSU8bNpeSVcMsFH92vMTGfmr6tVYCtmHFE
         szrw==
X-Gm-Message-State: AOAM533Fq0uFE4yEet/SxHIEKdA4ANjY4brN6EIHYTF41jtru5FNW603
	fM7sVmt3rbQYoOKxgqu3vqqcbcv2MoihlA==
X-Google-Smtp-Source: ABdhPJxZ0uPL1TrjceqiweKb6paYh16++LuddEO8jQ5NW1AxdLQgyXbhS71HBvHGplS6R8Xf4P5Y1Q==
X-Received: by 2002:a17:902:dacd:b029:e5:cf71:3901 with SMTP id q13-20020a170902dacdb02900e5cf713901mr25903383plx.23.1616987356036;
        Sun, 28 Mar 2021 20:09:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id gt22sm13801695pjb.35.2021.03.28.20.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 20:09:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] git: Remove CVE-2021-21300 patch
Date: Sun, 28 Mar 2021 20:09:12 -0700
Message-Id: <20210329030912.2532126-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its already in git 2.31.1, so delete it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/git/git.inc             |   1 -
 .../git/git/CVE-2021-21300.patch              | 304 ------------------
 2 files changed, 305 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git/CVE-2021-21300.patch

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index fb1dddc011..146983a918 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -10,7 +10,6 @@ PROVIDES_append_class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
            file://fixsort.patch \
-	   file://CVE-2021-21300.patch \
 "
 
 S = "${WORKDIR}/git-${PV}"
diff --git a/meta/recipes-devtools/git/git/CVE-2021-21300.patch b/meta/recipes-devtools/git/git/CVE-2021-21300.patch
deleted file mode 100644
index ec5d98395d..0000000000
--- a/meta/recipes-devtools/git/git/CVE-2021-21300.patch
+++ /dev/null
@@ -1,304 +0,0 @@
-From 464431b4155e3ff918709de663aa0195d73c99fd Mon Sep 17 00:00:00 2001
-From: Matheus Tavares <matheus.bernardino@usp.br>
-Date: Sat, 27 Mar 2021 11:50:05 +0900
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
- symlinks.c                      | 24 ++++++++++++++++++++
- t/t0021-conversion.sh           | 39 ++++++++++++++++++++++++++++++++
- t/t0021/rot13-filter.pl         | 21 ++++++++++++++---
- t/t2006-checkout-index-basic.sh | 40 +++++++++++++++++++++++++++++++++
- 7 files changed, 129 insertions(+), 3 deletions(-)
-
-diff --git a/cache.h b/cache.h
-index 7109765..83776f3 100644
---- a/cache.h
-+++ b/cache.h
-@@ -1657,6 +1657,7 @@ int has_symlink_leading_path(const char *name, int len);
- int threaded_has_symlink_leading_path(struct cache_def *, const char *, int);
- int check_leading_path(const char *name, int len);
- int has_dirs_only_path(const char *name, int len, int prefix_len);
-+extern void invalidate_lstat_cache(void);
- void schedule_dir_for_removal(const char *name, int len);
- void remove_scheduled_dirs(void);
- 
-diff --git a/compat/mingw.c b/compat/mingw.c
-index a00f331..a435998 100644
---- a/compat/mingw.c
-+++ b/compat/mingw.c
-@@ -367,6 +367,8 @@ int mingw_rmdir(const char *pathname)
- 	       ask_yes_no_if_possible("Deletion of directory '%s' failed. "
- 			"Should I try again?", pathname))
- 	       ret = _wrmdir(wpathname);
-+	if (!ret)
-+		invalidate_lstat_cache();
- 	return ret;
- }
- 
-diff --git a/git-compat-util.h b/git-compat-util.h
-index 104993b..7d3db43 100644
---- a/git-compat-util.h
-+++ b/git-compat-util.h
-@@ -349,6 +349,11 @@ static inline int noop_core_config(const char *var, const char *value, void *cb)
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
-index 69d458a..7dbb6b2 100644
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
-@@ -321,3 +328,20 @@ void remove_scheduled_dirs(void)
- {
- 	do_remove_scheduled_dirs(0);
- }
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
-index f6deaf4..60d34fd 100755
---- a/t/t0021-conversion.sh
-+++ b/t/t0021-conversion.sh
-@@ -953,4 +953,43 @@ test_expect_success PERL 'invalid file in delayed checkout' '
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
-index cd32a82..7bb9376 100644
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
- 			} elsif ($buffer =~ /^(ref|treeish|blob)=/) {
- 				print $debug " $buffer";
-diff --git a/t/t2006-checkout-index-basic.sh b/t/t2006-checkout-index-basic.sh
-index 8e181db..602d8fe 100755
---- a/t/t2006-checkout-index-basic.sh
-+++ b/t/t2006-checkout-index-basic.sh
-@@ -32,4 +32,44 @@ test_expect_success 'checkout-index reports errors (stdin)' '
- 	test_i18ngrep not.in.the.cache stderr
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
-- 
2.31.1

