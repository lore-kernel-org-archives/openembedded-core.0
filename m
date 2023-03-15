Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934C7C7EE3A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.12295.1678895725895515644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZeGe5sTK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010186e5fbba0f-a99c4f20-8445-4b79-b815-bfde93223639-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fB2vdIEPCg7qfqj2Ga/HuBv9XGeiaI8gauQOlqkKwGE=;
	b=ZeGe5sTKgU2s+JUHkJe7yXavqxinMWP5wt5IESP/1oDBYZoCwIfVT2oe3PKsuRiw
	Do62w/dkRcVjx1wFIlthwg0EUd6bxIYkv5ham7YiSWdHxTjh0v6pGlw1xWpbsLe82UB
	2otuhwwt1B3h760YnOsbi+JovR57pdiBnL2xdJfE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fB2vdIEPCg7qfqj2Ga/HuBv9XGeiaI8gauQOlqkKwGE=;
	b=iHNjBr0Tx8eTZ2k/KptOMtphHY/RDmLUoIxq+hpMASmqobfzSCCRPO3boZPvlOwD
	CT1sdn9FOdaO1HQs5B7QufCPRq+/LVQt1lHwrRV/7XiaaZlIeTuGstm+dC60kgZKGT/
	DiWfi6uGViuiK5nTT9DYqDFlU7uMDmant5ckukQw=
Content-Type: multipart/mixed; boundary="===============9125874952085974114=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.40.0 FAILED
Message-ID: <01010186e5fbba0f-a99c4f20-8445-4b79-b815-bfde93223639-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178595

--===============9125874952085974114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.40.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-git-upgrade-2.39.2-2.40.0.patch
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
--===============9125874952085974114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1790 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1790 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8a26052a81564959ed964f8921c7e4b10907ff0d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8a26052a81564959ed964f8921c7e4b10907ff0d"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 156 Local 148 Mirrors 0 Missed 8 Current 283 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1158 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_fetch)
NOTE: recipe git-2.40.0-r0: task do_fetch: Started
NOTE: recipe git-2.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1587 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_unpack)
NOTE: Running task 1588 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.40.0-r0: task do_unpack: Started
NOTE: recipe git-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1589 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_patch)
NOTE: recipe git-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.40.0-r0: task do_patch: Started
NOTE: recipe git-2.40.0-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1591 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_populate_lic)
NOTE: recipe git-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.40.0-r0: task do_populate_lic: Started
NOTE: recipe git-2.40.0-r0: task do_populate_lic: Succeeded
NOTE: recipe git-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1592 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_configure)
NOTE: recipe git-2.40.0-r0: task do_configure: Started
NOTE: recipe git-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_compile)
NOTE: recipe git-2.40.0-r0: task do_compile: Started
NOTE: recipe git-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_install)
NOTE: recipe git-2.40.0-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/y
 octo-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:d
 o_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'glibc', 'zlib', 'gcc-cross-i686', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'bash-completion', 'curl', 'autoconf-native', 'automake-native', 'patch-native', 'perl-native', 'pseudo-native', 'texinfo-dummy-native', 'make-native', 'gdbm-native', 'zlib-native', 'attr-native', 'libmpc-native', 'linux-libc-headers', 'binutils-cross-i686', 'gmp-native', 'flex-native', 'zstd-native', 'gnu-config-native', 'xz-native', 'mpfr-native', 'm4-native', 'libidn2', 'opkg-utils', 'libgcc', 'gettext-minimal-native', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 56 NO_PYTHON=1 CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0=/usr/src/debug/git/2.40.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0=/usr/src/debug/git/2.40.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0=/usr/src/debug/git/2.40.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0=/usr/src/debug/git/2.40.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/recipe-sysroot-native=  LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0=/usr/src/debug/git/2.40.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0=/usr/src/debug/git/2.40.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0=/usr/src/debug/git/2.40.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0=/usr/src/debug/git/2.40.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/g
 it/2.40.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now PERL_PATH=/usr/bin/env perl COMPUTE_HEADER_DEPENDENCIES=no NO_GETTEXT=1 install DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image bindir=/usr/bin template_dir=/usr/share/git-core/templates
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/gitweb'
| install -m 755 gitweb/gitweb.cgi '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/gitweb'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/gitweb/static'
| install -m 644 gitweb/static/gitweb.js gitweb/static/gitweb.css gitweb/static/git-logo.png gitweb/static/git-favicon.png \
| 	'/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/gitweb/static'
|     SUBDIR templates
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/bin'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core'
| install   git-daemon git-http-backend git-imap-send git-sh-i18n--envsubst git-shell git-http-fetch git-http-push git-remote-http git-remote-https git-remote-ftp git-remote-ftps '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core'
| install git-difftool--helper git-filter-branch git-merge-octopus git-merge-one-file git-merge-resolve git-mergetool git-quiltimport git-request-pull git-submodule git-web--browse git-archimport git-cvsexportcommit git-cvsimport git-cvsserver git-send-email git-svn git-p4 git-instaweb '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core'
| install -m 644 git-mergetool--lib git-sh-i18n git-sh-setup '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core'
| install  git scalar git-receive-pack git-shell git-upload-archive git-upload-pack '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/bin'
| install git-cvsserver '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/bin'
| make -C templates DESTDIR='/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image' install
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0/templates'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/git-core/templates'
| (cd blt && tar cf - .) | \
| (cd '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/git-core/templates' && umask 022 && tar xof -)
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/git-2.40.0/templates'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/mergetools'
| install -m 644 mergetools/* '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/mergetools'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/perl5'
| (cd perl/build/lib && tar cf - .) | \
| (cd '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/perl5' && umask 022 && tar xof -)
| bindir=$(cd '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/bin' && pwd) && \
| execdir=$(cd '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core' && pwd) && \
| destdir_from_execdir_SQ=$(echo 'libexec/git-core' | sed -e 's|[^/][^/]*|..|g') && \
| { test "$bindir/" = "$execdir/" || \
|   for p in git scalar git-shell git-cvsserver; do \
| 	rm -f "$execdir/$p" && \
| 	test -n "" && \
| 	ln -s "$destdir_from_execdir_SQ/bin/$p" "$execdir/$p" || \
| 	{ test -z "" && \
| 	  ln "$bindir/$p" "$execdir/$p" 2>/dev/null || \
| 	  cp "$bindir/$p" "$execdir/$p" || exit; } \
|   done; \
| } && \
| for p in git-receive-pack git-upload-archive git-upload-pack; do \
| 	rm -f "$bindir/$p" && \
| 	test -n "" && \
| 	ln -s "git" "$bindir/$p" || \
| 	{ test -z "" && \
| 	  ln "$bindir/git" "$bindir/$p" 2>/dev/null || \
| 	  ln -s "git" "$bindir/$p" 2>/dev/null || \
| 	  cp "$bindir/git" "$bindir/$p" || exit; }; \
| done && \
| for p in git-add git-am git-annotate git-apply git-archive git-bisect git-blame git-branch git-bugreport git-bundle git-cat-file git-check-attr git-check-ignore git-check-mailmap git-check-ref-format git-checkout--worker git-checkout-index git-checkout git-clean git-clone git-column git-commit-graph git-commit-tree git-commit git-config git-count-objects git-credential-cache--daemon git-credential-cache git-credential-store git-credential git-describe git-diagnose git-diff-files git-diff-index git-diff-tree git-diff git-difftool git-fast-export git-fast-import git-fetch-pack git-fetch git-fmt-merge-msg git-for-each-ref git-for-each-repo git-fsck git-fsmonitor--daemon git-gc git-get-tar-commit-id git-grep git-hash-object git-help git-hook git-index-pack git-init-db git-interpret-trailers git-log git-ls-files git-ls-remote git-ls-tree git-mailinfo git-mailsplit git-merge-base git-merge-file git-merge-index git-merge-ours git-merge-recursive git-merge-tree git-merge git-mktag git-mktr
 ee git-multi-pack-index git-mv git-name-rev git-notes git-pack-objects git-pack-redundant git-pack-refs git-patch-id git-prune-packed git-prune git-pull git-push git-range-diff git-read-tree git-rebase git-receive-pack git-reflog git-remote-ext git-remote-fd git-remote git-repack git-replace git-rerere git-reset git-rev-list git-rev-parse git-revert git-rm git-send-pack git-shortlog git-show-branch git-show-index git-show-ref git-sparse-checkout git-stash git-stripspace git-submodule--helper git-symbolic-ref git-tag git-unpack-file git-unpack-objects git-update-index git-update-ref git-update-server-info git-upload-archive git-upload-pack git-var git-verify-commit git-verify-pack git-verify-tag git-worktree git-write-tree git-cherry git-cherry-pick git-format-patch git-fsck-objects git-init git-maintenance git-merge-subtree git-restore git-show git-stage git-status git-switch git-version git-whatchanged; do \
| 	rm -f "$execdir/$p" && \
| 	if test -z ""; \
| 	then \
| 		test -n "" && \
| 		ln -s "$destdir_from_execdir_SQ/bin/git" "$execdir/$p" || \
| 		{ test -z "" && \
| 		  ln "$execdir/git" "$execdir/$p" 2>/dev/null || \
| 		  ln -s "git" "$execdir/$p" 2>/dev/null || \
| 		  cp "$execdir/git" "$execdir/$p" || exit; }; \
| 	fi \
| done && \
| remote_curl_aliases="git-remote-https git-remote-ftp git-remote-ftps" && \
| for p in $remote_curl_aliases; do \
| 	rm -f "$execdir/$p" && \
| 	test -n "" && \
| 	ln -s "git-remote-http" "$execdir/$p" || \
| 	{ test -z "" && \
| 	  ln "$execdir/git-remote-http" "$execdir/$p" 2>/dev/null || \
| 	  ln -s "git-remote-http" "$execdir/$p" 2>/dev/null || \
| 	  cp "$execdir/git-remote-http" "$execdir/$p" || exit; } \
| done
| sed: can't read /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-add--interactive: No such file or directory
| sed: warning: failed to get security context of /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/git-core/templates/hooks/prepare-commit-msg.sample: No data availablesed: warning: failed to get security context of /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/git-core/templates/hooks/pre-rebase.sample: No data availablesed: warning: failed to get security context of /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/git-core/templates/hooks/fsmonitor-watchman.sample: No data availableWARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/temp/run.do_install.3378054:175 exit 2 from 'sed -i -e 's#/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/recipe-sysroot-native/usr/bin/perl-native/#/usr/bin/#' -e 's#/usr/li
 b/perl-native/#/usr/lib/#' /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/bin/git-cvsserver /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-add--interactive /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-archimport /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-cvsexportcommit /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-cvsimport /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-cvsserver /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-send-email /home/pokybuild/yocto-w
 orker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-svn /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/libexec/git-core/git-instaweb /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/gitweb/gitweb.cgi /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/git-core/templates/hooks/prepare-commit-msg.sample /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/git-core/templates/hooks/pre-rebase.sample /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/image/usr/share/git-core/templates/hooks/fsmonitor-watchman.sample'
| WARNING: Backtrace (BB generated script):
| 	#1: perl_native_fixup, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/temp/run.do_install.3378054, line 175
| 	#2: do_install, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/temp/run.do_install.3378054, line 165
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/temp/run.do_install.3378054, line 227
NOTE: recipe git-2.40.0-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1594 tasks of which 1585 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: git-2.40.0-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/temp/run.do_install.3378054', 2, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.40.0-r0/temp/log.do_install.3378054
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.40.0.bb:do_install) failed with exit code '1'

--===============9125874952085974114==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.39.2-2.40.0.patch"

RnJvbSBmYzNhNTgyNGNmOWM0NDY3OWI1NGJmMDk5YTcwMTEzYjJkZTE5YjMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDc6NDA6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi4zOS4yIC0+IDIuNDAuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L3tnaXRfMi4zOS4yLmJiID0+IGdpdF8yLjQwLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC97Z2l0XzIuMzkuMi5iYiA9PiBnaXRfMi40MC4wLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM5LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDAuMC5iYgppbmRleCAyMjJlNTQ1ZjYw
Li45ZDM2MmY5M2ZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8y
LjM5LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi40MC4wLmJiCkBA
IC0xNjgsNCArMTY4LDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5z
X2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRU
RVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gImZiNjgwN2QxZWI0MDk0YmIy
MzQ5YWI5N2QyMDNmZTFlNmMzZWIyOGFmNzNlYTM5MWRlY2ZiZDNhMDNjMDJlODUiCitTUkNfVVJJ
W3RhcmJhbGwuc2hhMjU2c3VtXSA9ICJhYjM3YzM0M2MwYWQwOTcyODJmZDMxMWFiOWNhNTIxYWIz
ZGE4MzZlNWM0ZWQyMDkzOTk0ZjFiN2Y4NTc1YjA5IgotLSAKMi4zOS4yCgo=

--===============9125874952085974114==--

