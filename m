Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AEEC54745
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1304.1721071146525341490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XRXIbITu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cO/ooiAC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010190b7d597dd-1ab8d8e8-4496-4f9d-96ab-c95b161055f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r8ym6gJTL+bs0g0J8PHNvajM7d0rgisefuI1NfumaCg=;
	b=XRXIbITuEtq/ik+DqxUoqBf2996RSUvXK0447PhFxt6j9RQfVMG1ciBaiPx/BkPk
	OAGGlc8BUD9optuuJh22lfvBYUtgAPNuc+dfP4GEtGU8iQu7/eEfDCKrwcvniQCi9fe
	k8mqC72TToNQ0t9mHwHkvMmaFu4oNoM+rIahtb78=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r8ym6gJTL+bs0g0J8PHNvajM7d0rgisefuI1NfumaCg=;
	b=cO/ooiACmFgXvI4cNvbpwxCICcbWf0B93jIlNKYzMyRv4eSnOzWCKWBThV1v90xO
	h5YFAWwGpbw19R8mgGEU1UMVlEgkb4/6/YqpuEOmd7EszoUEjonHWBMVzEAHWzTa71R
	CE86X+KDkakkYBSpZBvPVcRTOT9jyEJIBkCl89NY=
Content-Type: multipart/mixed; boundary="===============6792719780320462540=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs: upgrading to 1.79.0 FAILED
Message-ID: <01010190b7d597dd-1ab8d8e8-4496-4f9d-96ab-c95b161055f4-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201992

--===============6792719780320462540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libstd-rs* to *1.79.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libstd-rs -V 1.79.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-649978940db87ff462a89978ca3c5a05e947e92e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:649978940db87ff462a89978ca3c5a05e947e92e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 8 Local 8 Mirrors 0 Missed 0 Current 25 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1879 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-649978940db87ff462a89978ca3c5a05e947e92e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:649978940db87ff462a89978ca3c5a05e947e92e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 8 Mirrors 0 Missed 1 Current 19 (88% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ohipomso: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v26np3ra/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v26np3ra/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:18:07
Adding changed files:   0% |                                    | ETA:  0:13:34
Adding changed files:   0% |                                    | ETA:  0:12:04
Adding changed files:   0% |                                    | ETA:  0:11:23
Adding changed files:   0% |                                    | ETA:  0:10:58
Adding changed files:   0% |                                    | ETA:  0:10:23
Adding changed files:   0% |                                    | ETA:  0:10:06
Adding changed files:   0% |                                    | ETA:  0:09:56
Adding changed files:   0% |                                    | ETA:  0:09:38
Adding changed files:   0% |                                    | ETA:  0:09:26
Adding changed files:   0% |                                    | ETA:  0:09:19
Adding changed files:   0% |                                    | ETA:  0:09:13
Adding changed files:   0% |                                    | ETA:  0:09:04
Adding changed files:   0% |                                    | ETA:  0:09:03
Adding changed files:   1% |                                    | ETA:  0:08:56
Adding changed files:   1% |                                    | ETA:  0:08:54
Adding changed files:   1% |                                    | ETA:  0:08:52
Adding changed files:   1% |                                    | ETA:  0:08:48
Adding changed files:   1% |                                    | ETA:  0:08:45
Adding changed files:   1% |                                    | ETA:  0:08:44
Adding changed files:   1% |                                    | ETA:  0:08:41
Adding changed files:   1% |                                    | ETA:  0:08:37
Adding changed files:   1% |                                    | ETA:  0:08:36
Adding changed files:   1% |                                    | ETA:  0:08:35
Adding changed files:   1% |                                    | ETA:  0:08:34
Adding changed files:   1% |                                    | ETA:  0:08:33
Adding changed files:   1% |                                    | ETA:  0:08:30
Adding changed files:   1% |                                    | ETA:  0:08:27
Adding changed files:   2% |                                    | ETA:  0:08:24
Adding changed files:   2% |                                    | ETA:  0:08:22
Adding changed files:   2% |                                    | ETA:  0:08:23
Adding changed files:   2% |                                    | ETA:  0:08:25
Adding changed files:   2% |                                    | ETA:  0:08:24
Adding changed files:   2% |                                    | ETA:  0:08:22
Adding changed files:   2% |                                    | ETA:  0:08:21
Adding changed files:   2% |                                    | ETA:  0:08:23
Adding changed files:   2% |                                    | ETA:  0:08:20
Adding changed files:   2% |                                    | ETA:  0:08:19
Adding changed files:   2% |                                    | ETA:  0:08:17
Adding changed files:   2% |#                                   | ETA:  0:08:15
Adding changed files:   2% |#                                   | ETA:  0:08:14
Adding changed files:   2% |#                                   | ETA:  0:08:14
Adding changed files:   2% |#                                   | ETA:  0:08:15
Adding changed files:   3% |#                                   | ETA:  0:08:14
Adding changed files:   3% |#                                   | ETA:  0:08:15
Adding changed files:   3% |#                                   | ETA:  0:08:13
Adding changed files:   3% |#                                   | ETA:  0:08:13
Adding changed files:   3% |#                                   | ETA:  0:08:13
Adding changed files:   3% |#                                   | ETA:  0:08:14
Adding changed files:   3% |#                                   | ETA:  0:08:15
Adding changed files:   3% |#                                   | ETA:  0:08:15
Adding changed files:   3% |#                                   | ETA:  0:08:15
Adding changed files:   3% |#                                   | ETA:  0:08:14
Adding changed files:   3% |#                                   | ETA:  0:08:12
Adding changed files:   3% |#                                   | ETA:  0:08:12
Adding changed files:   3% |#                                   | ETA:  0:08:12
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
--===============6792719780320462540==--

