Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01D9C54734
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.75735.1722536822483793946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bsiAobth;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kTKDXQIH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f32034b-b30ee729-c8b2-435a-b8ae-57d621fe1ecc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mR6nUwTTugRJEoISpUZ5dN6F+Jjyla1tU8nUbYVBEsA=;
	b=bsiAobthFw9PoIAXek1lAC7Dc/DLv52xIS51eNijzNY8jTUB7s0pP3FlFbV+Kdgr
	tci5G3vurgkIp2HPIyLM8iZEdBqbRrRKWSpjOMNbq9lY+9Gt/Nms+crwi993bRC78Dg
	nSkxVlRItSpy/SGcM1GOBw7MuH7DgOFYdmGjmuAQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mR6nUwTTugRJEoISpUZ5dN6F+Jjyla1tU8nUbYVBEsA=;
	b=kTKDXQIHxATEwh4bf/aaZ2Dg0H7vXQuBfguwqbZQrLrj1F6pZooJuxwBXKcEsyaP
	7mNwyviJPnR9XOtc1wHupQ5wZtrMM6i+EdnZnj5/bDiRjU+KlUYvW/FUlt5HNqXuq3g
	a/M7QT6WXtIZjANX6Q3Kyo1whkk1UvfTe0vG6wdM=
Content-Type: multipart/mixed; boundary="===============4460148073758989712=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo,libstd-rs,rust-llvm,rust: upgrading to
 1.80.0,1.80.0,1.80.0,1.80.0 FAILED
Message-ID: <010101910f32034b-b30ee729-c8b2-435a-b8ae-57d621fe1ecc-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202768

--===============4460148073758989712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo,libstd-rs,rust-llvm,rust* to *1.80.0,1.80.0,1.80.0,1.80.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo -V 1.80.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-f1e85e33bac48f52062b5f26c31cb71f5bcaa2f9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f1e85e33bac48f52062b5f26c31cb71f5bcaa2f9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1884 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-f1e85e33bac48f52062b5f26c31cb71f5bcaa2f9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f1e85e33bac48f52062b5f26c31cb71f5bcaa2f9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-9y9kid00: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-kur_gvoz/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-kur_gvoz/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:20:57
Adding changed files:   0% |                                    | ETA:  0:15:56
Adding changed files:   0% |                                    | ETA:  0:14:14
Adding changed files:   0% |                                    | ETA:  0:13:25
Adding changed files:   0% |                                    | ETA:  0:12:52
Adding changed files:   0% |                                    | ETA:  0:12:28
Adding changed files:   0% |                                    | ETA:  0:11:55
Adding changed files:   0% |                                    | ETA:  0:11:33
Adding changed files:   0% |                                    | ETA:  0:11:23
Adding changed files:   0% |                                    | ETA:  0:11:06
Adding changed files:   0% |                                    | ETA:  0:10:54
Adding changed files:   0% |                                    | ETA:  0:10:46
Adding changed files:   0% |                                    | ETA:  0:10:40
Adding changed files:   0% |                                    | ETA:  0:10:30
Adding changed files:   0% |                                    | ETA:  0:10:26
Adding changed files:   0% |                                    | ETA:  0:10:19
Adding changed files:   1% |                                    | ETA:  0:10:17
Adding changed files:   1% |                                    | ETA:  0:10:14
Adding changed files:   1% |                                    | ETA:  0:10:10
Adding changed files:   1% |                                    | ETA:  0:10:08
Adding changed files:   1% |                                    | ETA:  0:10:06
Adding changed files:   1% |                                    | ETA:  0:10:03
Adding changed files:   1% |                                    | ETA:  0:09:59
Adding changed files:   1% |                                    | ETA:  0:09:56
Adding changed files:   1% |                                    | ETA:  0:09:55
Adding changed files:   1% |                                    | ETA:  0:09:53
Adding changed files:   1% |                                    | ETA:  0:09:52
Adding changed files:   1% |                                    | ETA:  0:09:50
Adding changed files:   1% |                                    | ETA:  0:09:46
Adding changed files:   1% |                                    | ETA:  0:09:43
Adding changed files:   1% |                                    | ETA:  0:09:41
Adding changed files:   1% |                                    | ETA:  0:09:42
Adding changed files:   1% |                                    | ETA:  0:09:43
Adding changed files:   2% |                                    | ETA:  0:09:41
Adding changed files:   2% |                                    | ETA:  0:09:40
Adding changed files:   2% |                                    | ETA:  0:09:39
Adding changed files:   2% |                                    | ETA:  0:09:41
Adding changed files:   2% |                                    | ETA:  0:09:39
Adding changed files:   2% |                                    | ETA:  0:09:36
Adding changed files:   2% |                                    | ETA:  0:09:34
Adding changed files:   2% |                                    | ETA:  0:09:32
Adding changed files:   2% |                                    | ETA:  0:09:32
Adding changed files:   2% |                                    | ETA:  0:09:31
Adding changed files:   2% |                                    | ETA:  0:09:31
Adding changed files:   2% |                                    | ETA:  0:09:31
Adding changed files:   2% |#                                   | ETA:  0:09:29
Adding changed files:   2% |#                                   | ETA:  0:09:29
Adding changed files:   2% |#                                   | ETA:  0:09:29
Adding changed files:   2% |#                                   | ETA:  0:09:27
Adding changed files:   3% |#                                   | ETA:  0:09:27
Adding changed files:   3% |#                                   | ETA:  0:09:26
Adding changed files:   3% |#                                   | ETA:  0:09:24
Adding changed files:   3% |#                                   | ETA:  0:09:22
Adding changed files:   3% |#                                   | ETA:  0:09:21
Adding changed files:   3% |#                                   | ETA:  0:09:21
Adding changed files:   3% |#                                   | ETA:  0:09:20
Adding changed files:   3% |#                                   | ETA:  0:09:19
Adding changed files:   3% |#                                   | ETA:  0:09:19
Adding changed files:   3% |#                                   | ETA:  0:09:19
Adding changed files:   3% |#                                   | ETA:  0:09:18
Adding changed files:   3% |#                                   | ETA:  0:09:16
Adding changed files:   3% |#                                   | ETA:  0:09:16
Adding changed files:   3% |#                                   | ETA:  0:09:14
Adding changed files:   3% |#                                   | ETA:  0:09:13
Adding changed files:   3% |#                                   | ETA:  0:09:11
Adding changed files:   3% |#                                   | ETA:  0:09:10
Adding changed files:   4% |#                                   | ETA:  0:09:09
Adding changed files:   4% |#                                   | ETA:  0:09:08
Adding changed files:   4% |#                                   | ETA:  0:09:08
Adding changed files:   4% |#                                   | ETA:  0:09:07
Adding changed files:   4% |#                                   | ETA:  0:09:06
Adding changed files:   4% |#                                   | ETA:  0:09:06
Adding changed files:   4% |#                                   | ETA:  0:09:05
Adding changed files:   4% |#                                   | ETA:  0:09:04
Adding changed files:   4% |#                                   | ETA:  0:09:04
Adding changed files:   4% |#                                   | ETA:  0:09:04
Adding changed files:   4% |#                                   | ETA:  0:09:03
Adding changed files:   4% |#                                   | ETA:  0:09:02
Adding changed files:   4% |#                                   | ETA:  0:09:02
Adding changed files:   4% |#                                   | ETA:  0:09:02
Adding changed files:   4% |#                                   | ETA:  0:09:01
Adding changed files:   4% |#                                   | ETA:  0:09:00
Adding changed files:   5% |#                                   | ETA:  0:08:59
Adding changed files:   5% |#                                   | ETA:  0:08:58
Adding changed files:   5% |#                                   | ETA:  0:08:57
Adding changed files:   5% |#                                   | ETA:  0:08:56
Adding changed files:   5% |#                                   | ETA:  0:08:55
Adding changed files:   5% |#                                   | ETA:  0:08:54
Adding changed files:   5% |#                                   | ETA:  0:08:53
Adding changed files:   5% |#                                   | ETA:  0:08:52
Adding changed files:   5% |#                                   | ETA:  0:08:51
Adding changed files:   5% |##                                  | ETA:  0:08:50
Adding changed files:   5% |##                                  | ETA:  0:08:49
Adding changed files:   5% |##                                  | ETA:  0:08:48
Adding changed files:   5% |##                                  | ETA:  0:08:47
Adding changed files:   5% |##                                  | ETA:  0:08:46
Adding changed files:   5% |##                                  | ETA:  0:08:46
Adding changed files:   5% |##                                  | ETA:  0:08:45
Adding changed files:   5% |##                                  | ETA:  0:08:44
Adding changed files:   6% |##                                  | ETA:  0:08:43
Adding changed files:   6% |##                                  | ETA:  0:08:42
Adding changed files:   6% |##                                  | ETA:  0:08:41
Adding changed files:   6% |##                                  | ETA:  0:08:41
Adding changed files:   6% |##                                  | ETA:  0:08:40
Adding changed files:   6% |##                                  | ETA:  0:08:39
Adding changed files:   6% |##                                  | ETA:  0:08:38
Adding changed files:   6% |##                                  | ETA:  0:08:38
Adding changed files:   6% |##                                  | ETA:  0:08:37
Adding changed files:   6% |##                                  | ETA:  0:08:36
Adding changed files:   6% |##                                  | ETA:  0:08:36
Adding changed files:   6% |##                                  | ETA:  0:08:35
Adding changed files:   6% |##                                  | ETA:  0:08:34
Adding changed files:   6% |##                                  | ETA:  0:08:34
Adding changed files:   6% |##                                  | ETA:  0:08:33
Adding changed files:   6% |##                                  | ETA:  0:08:32
Adding changed files:   7% |##                                  | ETA:  0:08:32
Adding changed files:   7% |##                                  | ETA:  0:08:31
Adding changed files:   7% |##                                  | ETA:  0:08:30
Adding changed files:   7% |##                                  | ETA:  0:08:30
Adding changed files:   7% |##                                  | ETA:  0:08:29
Adding changed files:   7% |##                                  | ETA:  0:08:29
Adding changed files:   7% |##                                  | ETA:  0:08:28
Adding changed files:   7% |##                                  | ETA:  0:08:27
Adding changed files:   7% |##                                  | ETA:  0:08:27
Adding changed files:   7% |##                                  | ETA:  0:08:26
Adding changed files:   7% |##                                  | ETA:  0:08:26
Adding changed files:   7% |##                                  | ETA:  0:08:25
Adding changed files:   7% |##                                  | ETA:  0:08:24
Adding changed files:   7% |##                                  | ETA:  0:08:24
Adding changed files:   7% |##                                  | ETA:  0:08:23
Adding changed files:   7% |##                                  | ETA:  0:08:23
Adding changed files:   7% |##                                  | ETA:  0:08:23
Adding changed files:   8% |##                                  | ETA:  0:08:22
Adding changed files:   8% |##                                  | ETA:  0:08:21
Adding changed files:   8% |##                                  | ETA:  0:08:21
Adding changed files:   8% |##                                  | ETA:  0:08:21
Adding changed files:   8% |##                                  | ETA:  0:08:20
Adding changed files:   8% |###                                 | ETA:  0:08:20
Adding changed files:   8% |###                                 | ETA:  0:08:19
Adding changed files:   8% |###                                 | ETA:  0:08:19
Adding changed files:   8% |###                                 | ETA:  0:08:18
Adding changed files:   8% |###                                 | ETA:  0:08:18
Adding changed files:   8% |###                                 | ETA:  0:08:17
Adding changed files:   8% |###                                 | ETA:  0:08:17
Adding changed files:   8% |###                                 | ETA:  0:08:16
Adding changed files:   8% |###                                 | ETA:  0:08:16
Adding changed files:   8% |###                                 | ETA:  0:08:16
Adding changed files:   8% |###                                 | ETA:  0:08:16
Adding changed files:   9% |###                                 | ETA:  0:08:15
Adding changed files:   9% |###                                 | ETA:  0:08:15
Adding changed files:   9% |###                                 | ETA:  0:08:15
Adding changed files:   9% |###                                 | ETA:  0:08:14
Adding changed files:   9% |###                                 | ETA:  0:08:14
Adding changed files:   9% |###                                 | ETA:  0:08:13
Adding changed files:   9% |###                                 | ETA:  0:08:13
Adding changed files:   9% |###                                 | ETA:  0:08:13
Adding changed files:   9% |###                                 | ETA:  0:08:13
Adding changed files:   9% |###                                 | ETA:  0:08:12
Adding changed files:   9% |###                                 | ETA:  0:08:12
Adding changed files:   9% |###                                 | ETA:  0:08:12
Adding changed files:   9% |###                                 | ETA:  0:08:13
Adding changed files:   9% |###                                 | ETA:  0:08:13
Adding changed files:   9% |###                                 | ETA:  0:08:13
Adding changed files:   9% |###                                 | ETA:  0:08:13
Adding changed files:   9% |###                                 | ETA:  0:08:12
Adding changed files:  10% |###                                 | ETA:  0:08:12
Adding changed files:  10% |###                                 | ETA:  0:08:11
Adding changed files:  10% |###                                 | ETA:  0:08:11
Adding changed files:  10% |###                                 | ETA:  0:08:10
Adding changed files:  10% |###                                 | ETA:  0:08:10
Adding changed files:  10% |###                                 | ETA:  0:08:10
Adding changed files:  10% |###                                 | ETA:  0:08:10
Adding changed files:  10% |###                                 | ETA:  0:08:09
Adding changed files:  10% |###                                 | ETA:  0:08:09
Adding changed files:  10% |###                                 | ETA:  0:08:12
Adding changed files:  10% |###                                 | ETA:  0:08:12
Adding changed files:  10% |###                                 | ETA:  0:08:12
Adding changed files:  10% |###                                 | ETA:  0:08:13
Adding changed files:  10% |###                                 | ETA:  0:08:13
Adding changed files:  10% |###                                 | ETA:  0:08:13
Adding changed files:  10% |###                                 | ETA:  0:08:13
Adding changed files:  11% |###                                 | ETA:  0:08:14
Adding changed files:  11% |###                                 | ETA:  0:08:14
Adding changed files:  11% |####                                | ETA:  0:08:14
Adding changed files:  11% |####                                | ETA:  0:08:14
Adding changed files:  11% |####                                | ETA:  0:08:14
Adding changed files:  11% |####                                | ETA:  0:08:14
Adding changed files:  11% |####                                | ETA:  0:08:14
Adding changed files:  11% |####                                | ETA:  0:08:14
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.80.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "tests/rustdoc/doctest/doctest-crate-attributes-38129.rs" "tests/rustdoc/doctest/doctest-escape-boring-41783.codeblock.html" "tests/rustdoc/doctest/doctest-escape-boring-41783.rs" "tests/rustdoc/doctest/doctest-hide-empty-line-23106.rs" "tests/rustdoc/doctest/doctest-ignore-32556.rs" "tests/rustdoc/doctest/doctest-include-43153.rs" "tests/rustdoc/doctest/doctest-macro-38219.rs" "tests/rustdoc/doctest/doctest-manual-crate-name.rs" "tests/rustdoc/doctest/doctest-markdown-inline-parse-23744.rs" "tests/rustdoc/doctest/doctest-markdown-trailing-docblock-48377.rs" "tests/rustdoc/doctest/doctest-multi-line-string-literal-25944.rs" "tests/rustdoc/duplicated-glob-reexport-60522.rs" "tests/rustdoc/enum-variant-doc-hidden-field-88600.rs" "tests/rustdoc/enum-variant-fields-heading.rs" "tests/rustdoc/enum-variant-fields-heading.variants.html" "tests/rustdoc/enum-variant-private-46767.rs" "tests/rustdoc/enum-variant-reexport-35488.rs" "tests/rustdoc/footnote-defi
 nition-without-blank-line-100638.rs" "tests/rustdoc/foreign-implementors-js-43701.rs" "tests/rustdoc/glob-reexport-attribute-merge-120487.rs" "tests/rustdoc/glob-reexport-attribute-merge-doc-auto-cfg.rs" "tests/rustdoc/heading-levels-89309.rs" "tests/rustdoc/hide-mut-methods-if-no-derefmut-impl-74083.rs" "tests/rustdoc/impl-blanket-53689.rs" "tests/rustdoc/impl-on-ty-alias-issue-119015.rs" "tests/rustdoc/impl-trait-43869.rs" "tests/rustdoc/implementors-unstable-75588.rs" "tests/rustdoc/inline-rename-34473.rs" "tests/rustdoc/inline_cross/auxiliary/early-late-bound-lifetime-params.rs" "tests/rustdoc/inline_cross/auxiliary/issue-46727.rs" "tests/rustdoc/inline_cross/auxiliary/issue-57180.rs" "tests/rustdoc/inline_cross/auxiliary/issue-76736-1.rs" "tests/rustdoc/inline_cross/auxiliary/issue-76736-2.rs" "tests/rustdoc/inline_cross/auxiliary/issue-85454.rs" "tests/rustdoc/inline_cross/auxiliary/reexport-with-anonymous-lifetime-98697.rs" "tests/rustdoc/inline_cross/auxiliary/u_default_gene
 ric_args.rs" "tests/rustdoc/inline_cross/const-eval-46727.rs" "tests/rustdoc/inline_cross/early-late-bound-lifetime-params.rs" "tests/rustdoc/inline_cross/ice-import-crate-57180.rs" "tests/rustdoc/inline_cross/issue-76736-1.rs" "tests/rustdoc/inline_cross/issue-76736-2.rs" "tests/rustdoc/inline_cross/issue-76736-3.rs" "tests/rustdoc/inline_cross/issue-76736-4.rs" "tests/rustdoc/inline_cross/qpath-self-85454.rs" "tests/rustdoc/inline_cross/reexport-with-anonymous-lifetime-98697.rs" "tests/rustdoc/inline_local/blanket-impl-reexported-trait-94183.rs" "tests/rustdoc/inline_local/enum-variant-reexport-46766.rs" "tests/rustdoc/inline_local/private-reexport-in-public-api-81141-2.rs" "tests/rustdoc/inline_local/private-reexport-in-public-api-81141.rs" "tests/rustdoc/inline_local/private-reexport-in-public-api-generics-81141.rs" "tests/rustdoc/inline_local/private-reexport-in-public-api-hidden-81141.rs" "tests/rustdoc/inline_local/private-reexport-in-public-api-private-81141.rs" "tests/rustd
 oc/inline_local/reexported-macro-and-macro-export-sidebar-89852.rs" "tests/rustdoc/intra-doc-link-method-trait-impl-72340.rs" "tests/rustdoc/intra-doc/module-scope-name-resolution-55364.rs" "tests/rustdoc/invalid$crate$name.rs" "tests/rustdoc/issue-106421-not-internal.rs" "tests/rustdoc/issue-106421.rs" "tests/rustdoc/issue-118180-empty-tuple-struct.rs" "tests/rustdoc/jump-to-def-doc-links-calls.rs" "tests/rustdoc/jump-to-def-macro.rs" "tests/rustdoc/jump-to-non-local-method.rs" "tests/rustdoc/links-in-headings.rs" "tests/rustdoc/markdown-60482.rs" "tests/rustdoc/method-anchor-in-blanket-impl-86620.rs" "tests/rustdoc/multiple-macro-rules-w-same-name-submodule-99221.rs" "tests/rustdoc/multiple-mods-w-same-name-doc-inline-83375.rs" "tests/rustdoc/multiple-mods-w-same-name-doc-inline-last-item-83375.rs" "tests/rustdoc/notable-trait/doc-notable_trait-negative.negative.html" "tests/rustdoc/notable-trait/doc-notable_trait-negative.positive.html" "tests/rustdoc/notable-trait/doc-notable_tr
 ait-negative.rs" "tests/rustdoc/private-non-local-fields-2.rs" "tests/rustdoc/private-non-local-fields.rs" "tests/rustdoc/private-use-decl-macro-47038.rs" "tests/rustdoc/pub-reexport-of-pub-reexport-46506.rs" "tests/rustdoc/pub-use-root-path-95873.rs" "tests/rustdoc/public-impl-mention-private-generic-46380-2.rs" "tests/rustdoc/reexport-cfg.rs" "tests/rustdoc/resolve-ice-124363.rs" "tests/rustdoc/sidebar-trait-impl-disambiguate-78701.rs" "tests/rustdoc/sort-53812.rs" "tests/rustdoc/source-code-highlight.rs" "tests/rustdoc/src-links-implementor-43893.rs" "tests/rustdoc/summary-header-46377.rs" "tests/rustdoc/synthetic_auto/auto-trait-lifetimes-56822.rs" "tests/rustdoc/synthetic_auto/bounds.rs" "tests/rustdoc/synthetic_auto/normalize-auto-trait-80233.rs" "tests/rustdoc/synthetic_auto/send-impl-conditional-60726.rs" "tests/rustdoc/synthetic_auto/supertrait-bounds.rs" "tests/rustdoc/trait-implementations-duplicate-self-45584.rs" "tests/rustdoc/trait-item-info.rs" "tests/rustdoc/tuple-st
 ruct-where-clause-34928.rs" "tests/rustdoc/type-alias/primitive-local-link-121106.rs" "tests/rustdoc/underscore-import-61592.rs" "tests/rustdoc/underscore-type-in-trait-impl-96381.rs" "tests/ui-fulldeps/auxiliary/obtain-borrowck-input.rs" "tests/ui-fulldeps/obtain-borrowck.rs" "tests/ui-fulldeps/obtain-borrowck.run.stdout" "tests/ui-fulldeps/run-compiler-twice.rs" "tests/ui-fulldeps/stable-mir/check_abi.rs"' failed with exit code 128:
fatal: pathspec 'tests/rustdoc/invalid.rs' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4460148073758989712==--

