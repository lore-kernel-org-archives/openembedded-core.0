Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EE9C25B7B
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1271.1715794337753463316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UESqwkm7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kD39zVwd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fe11c-f0668f90-f0b9-41bb-b3d3-211ef31d8758-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5gBRlNKofLkmrCrOp3XIZQIzZYiJAVtLP34+87Rf0JA=;
	b=UESqwkm7bY7Sy11P4GOQmJe2hyElGn/ZiRq55lw5UVNnKmY66+U2XUDr8V020ati
	IOFjb9PBZ5gcik5lQOk+ptrUJcUTNU4O0+0aVkozOJtwWhnPxOZPbLVBYnbZ4qbvAWJ
	QKQ0Ea89Af9liJUX8R7mW9Jj5OHPy9zYXvgmFjFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5gBRlNKofLkmrCrOp3XIZQIzZYiJAVtLP34+87Rf0JA=;
	b=kD39zVwdZG5eR87E+HAoxwTWBYE0thqRM14k6z2VYUqgPdA4cYceDeEluU1YRCY0
	Bv+Jvjn+PIXsUeB9Tj4onux28N6zZ/911ABKwEyEgEfqDY9VkwQtWmUDDB7TMeL9eRc
	GtvX0BHQquS3hqQVuvennaQGz+SwHvyKOb+SJM4c=
Content-Type: multipart/mixed; boundary="===============0443868187464264990=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs: upgrading to 1.78.0 FAILED
Message-ID: <0101018f7d4fe11c-f0668f90-f0b9-41bb-b3d3-211ef31d8758-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199336

--===============0443868187464264990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libstd-rs* to *1.78.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libstd-rs -V 1.78.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-399fc0f48b5602288c2436c04587398e6d478a6a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:399fc0f48b5602288c2436c04587398e6d478a6a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1880 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-399fc0f48b5602288c2436c04587398e6d478a6a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:399fc0f48b5602288c2436c04587398e6d478a6a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:10:18
Adding changed files:   0% |                                    | ETA:  0:07:42
Adding changed files:   0% |                                    | ETA:  0:06:57
Adding changed files:   0% |                                    | ETA:  0:06:30
Adding changed files:   0% |                                    | ETA:  0:06:02
Adding changed files:   0% |                                    | ETA:  0:05:51
Adding changed files:   0% |                                    | ETA:  0:05:44
Adding changed files:   0% |                                    | ETA:  0:05:31
Adding changed files:   1% |                                    | ETA:  0:05:24
Adding changed files:   1% |                                    | ETA:  0:05:20
Adding changed files:   1% |                                    | ETA:  0:05:15
Adding changed files:   1% |                                    | ETA:  0:05:10
Adding changed files:   1% |                                    | ETA:  0:05:08
Adding changed files:   1% |                                    | ETA:  0:05:05
Adding changed files:   1% |                                    | ETA:  0:05:04
Adding changed files:   1% |                                    | ETA:  0:05:02
Adding changed files:   2% |                                    | ETA:  0:05:00
Adding changed files:   2% |                                    | ETA:  0:04:58
Adding changed files:   2% |                                    | ETA:  0:04:57
Adding changed files:   2% |                                    | ETA:  0:04:55
Adding changed files:   2% |                                    | ETA:  0:04:52
Adding changed files:   2% |                                    | ETA:  0:04:51
Adding changed files:   2% |#                                   | ETA:  0:04:50
Adding changed files:   2% |#                                   | ETA:  0:04:50
Adding changed files:   3% |#                                   | ETA:  0:04:49
Adding changed files:   3% |#                                   | ETA:  0:04:48
Adding changed files:   3% |#                                   | ETA:  0:04:48
Adding changed files:   3% |#                                   | ETA:  0:04:49
Adding changed files:   3% |#                                   | ETA:  0:04:51
Adding changed files:   3% |#                                   | ETA:  0:04:52
Adding changed files:   3% |#                                   | ETA:  0:04:54
Adding changed files:   3% |#                                   | ETA:  0:04:56
Adding changed files:   4% |#                                   | ETA:  0:04:56
Adding changed files:   4% |#                                   | ETA:  0:04:57
Adding changed files:   4% |#                                   | ETA:  0:04:56
Adding changed files:   4% |#                                   | ETA:  0:04:54
Adding changed files:   4% |#                                   | ETA:  0:04:52
Adding changed files:   4% |#                                   | ETA:  0:04:51
Adding changed files:   4% |#                                   | ETA:  0:04:50
Adding changed files:   4% |#                                   | ETA:  0:04:49
Adding changed files:   4% |#                                   | ETA:  0:04:49
Adding changed files:   5% |#                                   | ETA:  0:04:48
Adding changed files:   5% |#                                   | ETA:  0:04:47
Adding changed files:   5% |#                                   | ETA:  0:04:47
Adding changed files:   5% |#                                   | ETA:  0:04:47
Adding changed files:   5% |##                                  | ETA:  0:04:47
Adding changed files:   5% |##                                  | ETA:  0:04:46
Adding changed files:   5% |##                                  | ETA:  0:04:45
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.78.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "tests/rustdoc-ui/argfile/commandline-argfile-missing-windows.stderr" "tests/rustdoc-ui/argfile/commandline-argfile-missing.rs" "tests/rustdoc-ui/argfile/commandline-argfile-missing.stderr" "tests/rustdoc-ui/argfile/commandline-argfile-multiple-windows.rs" "tests/rustdoc-ui/argfile/commandline-argfile-multiple-windows.stderr" "tests/rustdoc-ui/argfile/commandline-argfile-multiple.rs" "tests/rustdoc-ui/argfile/commandline-argfile-multiple.stderr" "tests/rustdoc-ui/argfile/commandline-argfile.args" "tests/rustdoc-ui/argfile/commandline-argfile.rs" "tests/rustdoc-ui/auxiliary/issue-36031.rs" "tests/rustdoc-ui/auxiliary/issue-40936.rs" "tests/rustdoc-ui/auxiliary/issue-48414.rs" "tests/rustdoc-ui/circular-intra-doc-link-48414.rs" "tests/rustdoc-ui/hidden-trait-method-34423.rs" "tests/rustdoc-ui/ice-blanket-impl-52873.rs" "tests/rustdoc-ui/ice-blanket-impl-selection-55001.rs" "tests/rustdoc-ui/inherent-assoc-consts-36031.rs" "tests/rustdoc-ui/issues/issu
 e-120444-1.rs" "tests/rustdoc-ui/issues/issue-120444-1.stderr" "tests/rustdoc-ui/issues/issue-120444-2.rs" "tests/rustdoc-ui/issues/issue-120444-2.stderr" "tests/rustdoc-ui/nested-extern-crate-46271.rs" "tests/rustdoc-ui/nested-macro-rules-47639.rs" "tests/rustdoc-ui/normalize-in-inlined-type-alias.rs" "tests/rustdoc-ui/redundant-explicit-links-123677.rs" "tests/rustdoc-ui/super-glob-40936.rs" "tests/rustdoc/auto-trait-bounds-by-associated-type-50159.rs" "tests/rustdoc/auto-trait-bounds-inference-variables-54705.rs" "tests/rustdoc/auto-trait-bounds-where-51236.rs" "tests/rustdoc/auto-trait-negative-impl-55321.rs" "tests/rustdoc/auxiliary/issue-106421-force-unstable.rs" "tests/rustdoc/auxiliary/jump-to-def-macro.rs" "tests/rustdoc/blank-line-in-doc-block-47197.rs" "tests/rustdoc/bounds.rs" "tests/rustdoc/demo-allocator-54478.rs" "tests/rustdoc/deref-mut-35169-2.rs" "tests/rustdoc/deref-mut-35169.rs" "tests/rustdoc/doc-attr-comment-mix-42760.rs" "tests/rustdoc/doctest/auxiliary/empty.
 rs" "tests/rustdoc/doctest/doctest-cfg-feature-30252.rs" "tests/rustdoc/doctest/doctest-crate-attributes-38129.rs" "tests/rustdoc/doctest/doctest-escape-boring-41783.codeblock.html" "tests/rustdoc/doctest/doctest-escape-boring-41783.rs" "tests/rustdoc/doctest/doctest-hide-empty-line-23106.rs" "tests/rustdoc/doctest/doctest-ignore-32556.rs" "tests/rustdoc/doctest/doctest-include-43153.rs" "tests/rustdoc/doctest/doctest-macro-38219.rs" "tests/rustdoc/doctest/doctest-manual-crate-name.rs" "tests/rustdoc/doctest/doctest-markdown-inline-parse-23744.rs" "tests/rustdoc/doctest/doctest-markdown-trailing-docblock-48377.rs" "tests/rustdoc/doctest/doctest-multi-line-string-literal-25944.rs" "tests/rustdoc/enum-variant-fields-heading.rs" "tests/rustdoc/enum-variant-fields-heading.variants.html" "tests/rustdoc/enum-variant-private-46767.rs" "tests/rustdoc/enum-variant-reexport-35488.rs" "tests/rustdoc/footnote-definition-without-blank-line-100638.rs" "tests/rustdoc/foreign-implementors-js-43701.
 rs" "tests/rustdoc/glob-reexport-attribute-merge-120487.rs" "tests/rustdoc/glob-reexport-attribute-merge-doc-auto-cfg.rs" "tests/rustdoc/impl-blanket-53689.rs" "tests/rustdoc/impl-on-ty-alias-issue-119015.rs" "tests/rustdoc/impl-trait-43869.rs" "tests/rustdoc/inline-rename-34473.rs" "tests/rustdoc/inline_cross/auxiliary/early-late-bound-lifetime-params.rs" "tests/rustdoc/inline_cross/auxiliary/issue-46727.rs" "tests/rustdoc/inline_cross/auxiliary/issue-76736-1.rs" "tests/rustdoc/inline_cross/auxiliary/issue-76736-2.rs" "tests/rustdoc/inline_cross/auxiliary/u_default_generic_args.rs" "tests/rustdoc/inline_cross/const-eval-46727.rs" "tests/rustdoc/inline_cross/early-late-bound-lifetime-params.rs" "tests/rustdoc/inline_cross/issue-76736-1.rs" "tests/rustdoc/inline_cross/issue-76736-2.rs" "tests/rustdoc/inline_cross/issue-76736-3.rs" "tests/rustdoc/inline_local/enum-variant-reexport-46766.rs" "tests/rustdoc/intra-doc/module-scope-name-resolution-55364.rs" "tests/rustdoc/invalid$crate$na
 me.rs" "tests/rustdoc/issue-106421-not-internal.rs" "tests/rustdoc/issue-106421.rs" "tests/rustdoc/issue-118180-empty-tuple-struct.rs" "tests/rustdoc/jump-to-def-doc-links-calls.rs" "tests/rustdoc/jump-to-def-macro.rs" "tests/rustdoc/jump-to-non-local-method.rs" "tests/rustdoc/links-in-headings.rs" "tests/rustdoc/private-use-decl-macro-47038.rs" "tests/rustdoc/pub-reexport-of-pub-reexport-46506.rs" "tests/rustdoc/public-impl-mention-private-generic-46380-2.rs" "tests/rustdoc/reexport-cfg.rs" "tests/rustdoc/sort-53812.rs" "tests/rustdoc/source-code-highlight.rs" "tests/rustdoc/src-links-implementor-43893.rs" "tests/rustdoc/summary-header-46377.rs" "tests/rustdoc/trait-implementations-duplicate-self-45584.rs" "tests/rustdoc/trait-item-info.rs" "tests/rustdoc/tuple-struct-where-clause-34928.rs" "tests/rustdoc/type-alias/primitive-local-link-121106.rs" "tests/ui-fulldeps/stable-mir/check_abi.rs" "tests/ui-fulldeps/stable-mir/check_allocation.rs" "tests/ui-fulldeps/stable-mir/check_defs.
 rs" "tests/ui-fulldeps/stable-mir/check_foreign.rs" "tests/ui-fulldeps/stable-mir/check_item_kind.rs"' failed with exit code 128:
fatal: pathspec 'tests/rustdoc/invalid.rs' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0443868187464264990==--

