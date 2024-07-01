Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6652DC3DA65
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2173.1719853075645059463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bahcyNji;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CmKk5kNZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101906f3b4d9a-0c6807d4-028f-4305-a937-1cfa26599aec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nSBR/KDDex1T5uD4UnEzr9To3jElDZVoy4lGbeFq23s=;
	b=bahcyNjibKKXpscX5nepNEmy65iub/m0qGd7hCXf1b5Wm7JQ+pxJQEQ3jHqrBys8
	EGWFNt5maHY6zf/jWFE8WhecaMPimQQFflkpu7ts39QQaALzvIEODMFtURi+gzwR2Uy
	bnUaC/JVK0zxqISupruDt6Zy3vpCcSK0Aw7vIxe8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nSBR/KDDex1T5uD4UnEzr9To3jElDZVoy4lGbeFq23s=;
	b=CmKk5kNZ76P/r4WYN9VJe8+0WSvH2IYywQkoyq4WMC1zKmJyccjo8vNMjNuS7VU4
	DWJI1Jj2uG278+o8tMt7AiqAE23f9aKZo8eQAh6kgFXy1rGlhXRYx5Uq+Fk73HiQlpE
	GaU3XKvYQ4AaBnS0JouyLBkFi7SPHvoLJAxUmUtw=
Content-Type: multipart/mixed; boundary="===============9014228927763822648=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.79.0 FAILED
Message-ID: <010101906f3b4d9a-0c6807d4-028f-4305-a937-1cfa26599aec-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201343

--===============9014228927763822648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.79.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo -V 1.79.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-2401868f49ce52c2dd2146cc0454bddbaa01b205"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2401868f49ce52c2dd2146cc0454bddbaa01b205"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-2401868f49ce52c2dd2146cc0454bddbaa01b205"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2401868f49ce52c2dd2146cc0454bddbaa01b205"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-b1iiyhio: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-r5yydosq/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-r5yydosq/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:18:00
Adding changed files:   0% |                                    | ETA:  0:13:29
Adding changed files:   0% |                                    | ETA:  0:11:58
Adding changed files:   0% |                                    | ETA:  0:11:17
Adding changed files:   0% |                                    | ETA:  0:10:55
Adding changed files:   0% |                                    | ETA:  0:10:23
Adding changed files:   0% |                                    | ETA:  0:10:07
Adding changed files:   0% |                                    | ETA:  0:09:56
Adding changed files:   0% |                                    | ETA:  0:09:41
Adding changed files:   0% |                                    | ETA:  0:09:31
Adding changed files:   0% |                                    | ETA:  0:09:24
Adding changed files:   0% |                                    | ETA:  0:09:19
Adding changed files:   0% |                                    | ETA:  0:09:09
Adding changed files:   0% |                                    | ETA:  0:09:11
Adding changed files:   1% |                                    | ETA:  0:09:05
Adding changed files:   1% |                                    | ETA:  0:09:07
Adding changed files:   1% |                                    | ETA:  0:09:07
Adding changed files:   1% |                                    | ETA:  0:09:05
Adding changed files:   1% |                                    | ETA:  0:09:01
Adding changed files:   1% |                                    | ETA:  0:08:59
Adding changed files:   1% |                                    | ETA:  0:08:54
Adding changed files:   1% |                                    | ETA:  0:08:50
Adding changed files:   1% |                                    | ETA:  0:08:48
Adding changed files:   1% |                                    | ETA:  0:08:46
Adding changed files:   1% |                                    | ETA:  0:08:44
Adding changed files:   1% |                                    | ETA:  0:08:42
Adding changed files:   1% |                                    | ETA:  0:08:40
Adding changed files:   1% |                                    | ETA:  0:08:36
Adding changed files:   2% |                                    | ETA:  0:08:33
Adding changed files:   2% |                                    | ETA:  0:08:31
Adding changed files:   2% |                                    | ETA:  0:08:31
Adding changed files:   2% |                                    | ETA:  0:08:32
Adding changed files:   2% |                                    | ETA:  0:08:31
Adding changed files:   2% |                                    | ETA:  0:08:29
Adding changed files:   2% |                                    | ETA:  0:08:27
Adding changed files:   2% |                                    | ETA:  0:08:29
Adding changed files:   2% |                                    | ETA:  0:08:26
Adding changed files:   2% |                                    | ETA:  0:08:24
Adding changed files:   2% |                                    | ETA:  0:08:22
Adding changed files:   2% |#                                   | ETA:  0:08:20
Adding changed files:   2% |#                                   | ETA:  0:08:19
Adding changed files:   2% |#                                   | ETA:  0:08:20
Adding changed files:   2% |#                                   | ETA:  0:08:20
Adding changed files:   3% |#                                   | ETA:  0:08:19
Adding changed files:   3% |#                                   | ETA:  0:08:20
Adding changed files:   3% |#                                   | ETA:  0:08:18
Adding changed files:   3% |#                                   | ETA:  0:08:18
Adding changed files:   3% |#                                   | ETA:  0:08:18
Adding changed files:   3% |#                                   | ETA:  0:08:18
Adding changed files:   3% |#                                   | ETA:  0:08:18
Adding changed files:   3% |#                                   | ETA:  0:08:19
Adding changed files:   3% |#                                   | ETA:  0:08:18
Adding changed files:   3% |#                                   | ETA:  0:08:17
Adding changed files:   3% |#                                   | ETA:  0:08:15
Adding changed files:   3% |#                                   | ETA:  0:08:15
Adding changed files:   3% |#                                   | ETA:  0:08:15
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.79.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "tests/rustdoc/doc-hidden-private-67851-private.rs" "tests/rustdoc/doctest/auxiliary/empty.rs" "tests/rustdoc/doctest/doctest-cfg-feature-30252.rs" "tests/rustdoc/doctest/doctest-crate-attributes-38129.rs" "tests/rustdoc/doctest/doctest-escape-boring-41783.codeblock.html" "tests/rustdoc/doctest/doctest-escape-boring-41783.rs" "tests/rustdoc/doctest/doctest-hide-empty-line-23106.rs" "tests/rustdoc/doctest/doctest-ignore-32556.rs" "tests/rustdoc/doctest/doctest-include-43153.rs" "tests/rustdoc/doctest/doctest-macro-38219.rs" "tests/rustdoc/doctest/doctest-manual-crate-name.rs" "tests/rustdoc/doctest/doctest-markdown-inline-parse-23744.rs" "tests/rustdoc/doctest/doctest-markdown-trailing-docblock-48377.rs" "tests/rustdoc/doctest/doctest-multi-line-string-literal-25944.rs" "tests/rustdoc/duplicated-glob-reexport-60522.rs" "tests/rustdoc/enum-variant-fields-heading.rs" "tests/rustdoc/enum-variant-fields-heading.variants.html" "tests/rustdoc/enum-variant-
 private-46767.rs" "tests/rustdoc/enum-variant-reexport-35488.rs" "tests/rustdoc/footnote-definition-without-blank-line-100638.rs" "tests/rustdoc/foreign-implementors-js-43701.rs" "tests/rustdoc/glob-reexport-attribute-merge-120487.rs" "tests/rustdoc/glob-reexport-attribute-merge-doc-auto-cfg.rs" "tests/rustdoc/hide-mut-methods-if-no-derefmut-impl-74083.rs" "tests/rustdoc/impl-blanket-53689.rs" "tests/rustdoc/impl-on-ty-alias-issue-119015.rs" "tests/rustdoc/impl-trait-43869.rs" "tests/rustdoc/implementors-unstable-75588.rs" "tests/rustdoc/inline-rename-34473.rs" "tests/rustdoc/inline_cross/auxiliary/early-late-bound-lifetime-params.rs" "tests/rustdoc/inline_cross/auxiliary/issue-46727.rs" "tests/rustdoc/inline_cross/auxiliary/issue-57180.rs" "tests/rustdoc/inline_cross/auxiliary/issue-76736-1.rs" "tests/rustdoc/inline_cross/auxiliary/issue-76736-2.rs" "tests/rustdoc/inline_cross/auxiliary/u_default_generic_args.rs" "tests/rustdoc/inline_cross/const-eval-46727.rs" "tests/rustdoc/inlin
 e_cross/early-late-bound-lifetime-params.rs" "tests/rustdoc/inline_cross/ice-import-crate-57180.rs" "tests/rustdoc/inline_cross/issue-76736-1.rs" "tests/rustdoc/inline_cross/issue-76736-2.rs" "tests/rustdoc/inline_cross/issue-76736-3.rs" "tests/rustdoc/inline_cross/issue-76736-4.rs" "tests/rustdoc/inline_local/enum-variant-reexport-46766.rs" "tests/rustdoc/intra-doc-link-method-trait-impl-72340.rs" "tests/rustdoc/intra-doc/module-scope-name-resolution-55364.rs" "tests/rustdoc/invalid$crate$name.rs" "tests/rustdoc/issue-106421-not-internal.rs" "tests/rustdoc/issue-106421.rs" "tests/rustdoc/issue-118180-empty-tuple-struct.rs" "tests/rustdoc/jump-to-def-doc-links-calls.rs" "tests/rustdoc/jump-to-def-macro.rs" "tests/rustdoc/jump-to-non-local-method.rs" "tests/rustdoc/links-in-headings.rs" "tests/rustdoc/markdown-60482.rs" "tests/rustdoc/private-use-decl-macro-47038.rs" "tests/rustdoc/pub-reexport-of-pub-reexport-46506.rs" "tests/rustdoc/public-impl-mention-private-generic-46380-2.rs" "
 tests/rustdoc/reexport-cfg.rs" "tests/rustdoc/sidebar-trait-impl-disambiguate-78701.rs" "tests/rustdoc/sort-53812.rs" "tests/rustdoc/source-code-highlight.rs" "tests/rustdoc/src-links-implementor-43893.rs" "tests/rustdoc/summary-header-46377.rs" "tests/rustdoc/synthetic_auto/auto-trait-lifetimes-56822.rs" "tests/rustdoc/synthetic_auto/bounds.rs" "tests/rustdoc/synthetic_auto/send-impl-conditional-60726.rs" "tests/rustdoc/synthetic_auto/supertrait-bounds.rs" "tests/rustdoc/trait-implementations-duplicate-self-45584.rs" "tests/rustdoc/trait-item-info.rs" "tests/rustdoc/tuple-struct-where-clause-34928.rs" "tests/rustdoc/type-alias/primitive-local-link-121106.rs" "tests/rustdoc/underscore-import-61592.rs" "tests/ui-fulldeps/stable-mir/check_abi.rs" "tests/ui-fulldeps/stable-mir/check_allocation.rs" "tests/ui-fulldeps/stable-mir/check_binop.rs" "tests/ui-fulldeps/stable-mir/check_defs.rs" "tests/ui-fulldeps/stable-mir/check_foreign.rs" "tests/ui-fulldeps/stable-mir/check_intrinsics.rs" "
 tests/ui-fulldeps/stable-mir/check_item_kind.rs" "tests/ui-fulldeps/stable-mir/check_normalization.rs" "tests/ui-fulldeps/stable-mir/check_trait_queries.rs" "tests/ui-fulldeps/stable-mir/check_transform.rs" "tests/ui-fulldeps/stable-mir/check_ty_fold.rs" "tests/ui-fulldeps/stable-mir/projections.rs" "tests/ui/README.md" "tests/ui/abi/arm-unadjusted-intrinsic.rs" "tests/ui/abi/extern/extern-pass-FiveU16s.rs" "tests/ui/abi/extern/extern-return-FiveU16s.rs" "tests/ui/abi/statics/static-mut-foreign.stderr" "tests/ui/abi/unsized-args-in-c-abi-issues-94223-115845.rs" "tests/ui/argfile/commandline-argfile-badutf8-windows.rs" "tests/ui/argfile/commandline-argfile-badutf8-windows.stderr" "tests/ui/argfile/commandline-argfile-badutf8.args" "tests/ui/argfile/commandline-argfile-badutf8.rs" "tests/ui/argfile/commandline-argfile-badutf8.stderr" "tests/ui/argfile/commandline-argfile-missing-windows.rs" "tests/ui/argfile/commandline-argfile-missing-windows.stderr" "tests/ui/argfile/commandline-arg
 file-missing.rs" "tests/ui/argfile/commandline-argfile-missing.stderr" "tests/ui/argfile/commandline-argfile-multiple-windows.rs"' failed with exit code 128:
fatal: pathspec 'tests/rustdoc/invalid.rs' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9014228927763822648==--

