Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7A7C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18365.1718475798471897618
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LWwnV5p/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oOdCwkxL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101901d23ba98-652adde8-c7f5-4e18-9c76-7537001f3506-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Thr/heXEUtoQk/0+McBB9EEW5nisb3DwkMwxO9tEiIc=;
	b=LWwnV5p/bULv8UnlcWG+Wf6cefH0t6kq3XjVBSmduga6vyikjZm9bW1O+EJ7wNc1
	IKAA2/PaZDR1lVzzkUNC+5cNKoQAEyBkLrzEsZmFHhhuh9Hs/seudZHNSSD2f44eQWQ
	HMpL5l9OFljHP/CBXDpWowjHuxu0I6pJWHZ+MJ4g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Thr/heXEUtoQk/0+McBB9EEW5nisb3DwkMwxO9tEiIc=;
	b=oOdCwkxLQpfHCp7MDLq8dXXrAgHPT/m2mZTq9MtO4M6tbROuVj52a2/IY2lANEMK
	WRwa0laDLgcdJrxWjf3nvNix2yR5KPyk8GwnMRinXMzXL8MTTQcFLJ0nOmBEvKS1aak
	j7Y0pZNHR3HuG3j+Rsr8zgeQcAS8RuwvDc1hECEo=
Content-Type: multipart/mixed; boundary="===============0967460499066052638=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust: upgrading to 1.79.0 FAILED
Message-ID: <010101901d23ba98-652adde8-c7f5-4e18-9c76-7537001f3506-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200714

--===============0967460499066052638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust* to *1.79.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust -V 1.79.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-3c36597549ea58d0c45cd062006ef734cd5b8cf9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3c36597549ea58d0c45cd062006ef734cd5b8cf9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1882 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-3c36597549ea58d0c45cd062006ef734cd5b8cf9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3c36597549ea58d0c45cd062006ef734cd5b8cf9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-mz6clf62: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-f11rcg5g/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-f11rcg5g/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:17:49
Adding changed files:   0% |                                    | ETA:  0:13:28
Adding changed files:   0% |                                    | ETA:  0:11:57
Adding changed files:   0% |                                    | ETA:  0:11:17
Adding changed files:   0% |                                    | ETA:  0:10:54
Adding changed files:   0% |                                    | ETA:  0:10:18
Adding changed files:   0% |                                    | ETA:  0:10:00
Adding changed files:   0% |                                    | ETA:  0:09:51
Adding changed files:   0% |                                    | ETA:  0:09:32
Adding changed files:   0% |                                    | ETA:  0:09:20
Adding changed files:   0% |                                    | ETA:  0:09:12
Adding changed files:   0% |                                    | ETA:  0:09:07
Adding changed files:   0% |                                    | ETA:  0:08:57
Adding changed files:   0% |                                    | ETA:  0:08:56
Adding changed files:   1% |                                    | ETA:  0:08:50
Adding changed files:   1% |                                    | ETA:  0:08:48
Adding changed files:   1% |                                    | ETA:  0:08:46
Adding changed files:   1% |                                    | ETA:  0:08:42
Adding changed files:   1% |                                    | ETA:  0:08:40
Adding changed files:   1% |                                    | ETA:  0:08:38
Adding changed files:   1% |                                    | ETA:  0:08:35
Adding changed files:   1% |                                    | ETA:  0:08:32
Adding changed files:   1% |                                    | ETA:  0:08:30
Adding changed files:   1% |                                    | ETA:  0:08:29
Adding changed files:   1% |                                    | ETA:  0:08:28
Adding changed files:   1% |                                    | ETA:  0:08:26
Adding changed files:   1% |                                    | ETA:  0:08:24
Adding changed files:   1% |                                    | ETA:  0:08:21
Adding changed files:   2% |                                    | ETA:  0:08:18
Adding changed files:   2% |                                    | ETA:  0:08:17
Adding changed files:   2% |                                    | ETA:  0:08:18
Adding changed files:   2% |                                    | ETA:  0:08:19
Adding changed files:   2% |                                    | ETA:  0:08:18
Adding changed files:   2% |                                    | ETA:  0:08:16
Adding changed files:   2% |                                    | ETA:  0:08:15
Adding changed files:   2% |                                    | ETA:  0:08:17
Adding changed files:   2% |                                    | ETA:  0:08:15
Adding changed files:   2% |                                    | ETA:  0:08:13
Adding changed files:   2% |                                    | ETA:  0:08:11
Adding changed files:   2% |#                                   | ETA:  0:08:09
Adding changed files:   2% |#                                   | ETA:  0:08:09
Adding changed files:   2% |#                                   | ETA:  0:08:09
Adding changed files:   2% |#                                   | ETA:  0:08:09
Adding changed files:   3% |#                                   | ETA:  0:08:08
Adding changed files:   3% |#                                   | ETA:  0:08:09
Adding changed files:   3% |#                                   | ETA:  0:08:08
Adding changed files:   3% |#                                   | ETA:  0:08:08
Adding changed files:   3% |#                                   | ETA:  0:08:07
Adding changed files:   3% |#                                   | ETA:  0:08:08
Adding changed files:   3% |#                                   | ETA:  0:08:08
Adding changed files:   3% |#                                   | ETA:  0:08:09
Adding changed files:   3% |#                                   | ETA:  0:08:09
Adding changed files:   3% |#                                   | ETA:  0:08:08
Adding changed files:   3% |#                                   | ETA:  0:08:06
Adding changed files:   3% |#                                   | ETA:  0:08:06
Adding changed files:   3% |#                                   | ETA:  0:08:07
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
--===============0967460499066052638==--

