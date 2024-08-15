Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D62C5B558
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:08 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.131414.1723748333533077769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ig+VLox/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TJYVTDfA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019157683503-4e00b79a-46bc-4d8f-88d3-fc7e1e08288d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1mFPutjYg4sIyP1J4AigiHNn2OBgzz8kRWpqRec4qIc=;
	b=ig+VLox/evT0EuTI40Gz+yf5Q+Y8NztHNz/66iXDA1jMXZD4rllMg1zcho09jNz3
	tNOl5JZn+6gd9t1HFknY0Oj0w4S0Yk6yL9Qamr6F0m7cHrWVXTOgThHIr39MHoblNEU
	KRJOS+OL/SWUaJhrcjUGyAI59r37nO6uF1FSnmmw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1mFPutjYg4sIyP1J4AigiHNn2OBgzz8kRWpqRec4qIc=;
	b=TJYVTDfAEl7EHWGPn/8IZTlAd9h9p057tqz1hXpH4n963h0qEdrn9eUJKXRWOJfb
	LDApRGJuIhwGtMXdvJ3Kc9fpmg25o0sECo3vGu3slQPkTlsxBlEqdLNmOAkpfCL/GF0
	2SX9tzkHXkOxU8SfLx7z0AhtfD3T1+v7DjAk711Y=
Content-Type: multipart/mixed; boundary="===============0148627449837203505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs,rust,rust-llvm,cargo: upgrading to
 1.80.1,1.80.1,1.80.1,1.80.1 FAILED
Message-ID: <0101019157683503-4e00b79a-46bc-4d8f-88d3-fc7e1e08288d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203342

--===============0148627449837203505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libstd-rs,rust,rust-llvm,cargo* to *1.80.1,1.80.1,1.80.1,1.80.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libstd-rs -V 1.80.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-77b938f89d6a9bfdd692a4b4aa9d967948f420ad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:77b938f89d6a9bfdd692a4b4aa9d967948f420ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-77b938f89d6a9bfdd692a4b4aa9d967948f420ad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:77b938f89d6a9bfdd692a4b4aa9d967948f420ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-n23v1k4i: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-1a6k5c_c/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-1a6k5c_c/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:49:05
Adding changed files:   0% |                                    | ETA:  0:34:49
Adding changed files:   0% |                                    | ETA:  0:30:09
Adding changed files:   0% |                                    | ETA:  0:27:18
Adding changed files:   0% |                                    | ETA:  0:25:51
Adding changed files:   0% |                                    | ETA:  0:24:33
Adding changed files:   0% |                                    | ETA:  0:24:15
Adding changed files:   0% |                                    | ETA:  0:24:13
Adding changed files:   0% |                                    | ETA:  0:23:55
Adding changed files:   0% |                                    | ETA:  0:23:22
Adding changed files:   0% |                                    | ETA:  0:22:46
Adding changed files:   0% |                                    | ETA:  0:22:26
Adding changed files:   0% |                                    | ETA:  0:22:05
Adding changed files:   0% |                                    | ETA:  0:21:48
Adding changed files:   0% |                                    | ETA:  0:21:35
Adding changed files:   1% |                                    | ETA:  0:21:18
Adding changed files:   1% |                                    | ETA:  0:21:10
Adding changed files:   1% |                                    | ETA:  0:21:35
Adding changed files:   1% |                                    | ETA:  0:21:14
Adding changed files:   1% |                                    | ETA:  0:21:05
Adding changed files:   1% |                                    | ETA:  0:21:00
Adding changed files:   1% |                                    | ETA:  0:20:53
Adding changed files:   1% |                                    | ETA:  0:20:42
Adding changed files:   1% |                                    | ETA:  0:20:32
Adding changed files:   1% |                                    | ETA:  0:20:26
Adding changed files:   1% |                                    | ETA:  0:20:19
Adding changed files:   1% |                                    | ETA:  0:20:27
Adding changed files:   1% |                                    | ETA:  0:20:43
Adding changed files:   1% |                                    | ETA:  0:20:58
Adding changed files:   1% |                                    | ETA:  0:20:56
Adding changed files:   1% |                                    | ETA:  0:20:58
Adding changed files:   2% |                                    | ETA:  0:20:51
Adding changed files:   2% |                                    | ETA:  0:20:50
Adding changed files:   2% |                                    | ETA:  0:20:42
Adding changed files:   2% |                                    | ETA:  0:20:32
Adding changed files:   2% |                                    | ETA:  0:20:26
Adding changed files:   2% |                                    | ETA:  0:20:21
Adding changed files:   2% |                                    | ETA:  0:20:16
Adding changed files:   2% |                                    | ETA:  0:20:15
Adding changed files:   2% |                                    | ETA:  0:20:07
Adding changed files:   2% |                                    | ETA:  0:20:03
Adding changed files:   2% |                                    | ETA:  0:20:01
Adding changed files:   2% |                                    | ETA:  0:19:58
Adding changed files:   2% |#                                   | ETA:  0:19:52
Adding changed files:   2% |#                                   | ETA:  0:19:49
Adding changed files:   2% |#                                   | ETA:  0:19:43
Adding changed files:   2% |#                                   | ETA:  0:19:41
Adding changed files:   3% |#                                   | ETA:  0:19:37
Adding changed files:   3% |#                                   | ETA:  0:19:34
Adding changed files:   3% |#                                   | ETA:  0:19:33
Adding changed files:   3% |#                                   | ETA:  0:19:34
Adding changed files:   3% |#                                   | ETA:  0:19:28
Adding changed files:   3% |#                                   | ETA:  0:19:23
Adding changed files:   3% |#                                   | ETA:  0:19:24
Adding changed files:   3% |#                                   | ETA:  0:19:21
Adding changed files:   3% |#                                   | ETA:  0:19:17
Adding changed files:   3% |#                                   | ETA:  0:19:14
Adding changed files:   3% |#                                   | ETA:  0:19:15
Adding changed files:   3% |#                                   | ETA:  0:19:15
Adding changed files:   3% |#                                   | ETA:  0:19:14
Adding changed files:   3% |#                                   | ETA:  0:19:10
Adding changed files:   3% |#                                   | ETA:  0:19:07
Adding changed files:   4% |#                                   | ETA:  0:19:05
Adding changed files:   4% |#                                   | ETA:  0:19:02
Adding changed files:   4% |#                                   | ETA:  0:18:59
Adding changed files:   4% |#                                   | ETA:  0:18:55
Adding changed files:   4% |#                                   | ETA:  0:18:52
Adding changed files:   4% |#                                   | ETA:  0:18:51
Adding changed files:   4% |#                                   | ETA:  0:18:47
Adding changed files:   4% |#                                   | ETA:  0:18:44
Adding changed files:   4% |#                                   | ETA:  0:18:41
Adding changed files:   4% |#                                   | ETA:  0:18:38
Adding changed files:   4% |#                                   | ETA:  0:18:35
Adding changed files:   4% |#                                   | ETA:  0:18:33
Adding changed files:   4% |#                                   | ETA:  0:18:31
Adding changed files:   4% |#                                   | ETA:  0:18:28
Adding changed files:   4% |#                                   | ETA:  0:18:25
Adding changed files:   4% |#                                   | ETA:  0:18:24
Adding changed files:   5% |#                                   | ETA:  0:18:20
Adding changed files:   5% |#                                   | ETA:  0:18:17
Adding changed files:   5% |#                                   | ETA:  0:18:13
Adding changed files:   5% |#                                   | ETA:  0:18:11
Adding changed files:   5% |#                                   | ETA:  0:18:08
Adding changed files:   5% |#                                   | ETA:  0:18:05
Adding changed files:   5% |#                                   | ETA:  0:18:02
Adding changed files:   5% |#                                   | ETA:  0:17:59
Adding changed files:   5% |#                                   | ETA:  0:17:56
Adding changed files:   5% |##                                  | ETA:  0:17:54
Adding changed files:   5% |##                                  | ETA:  0:17:54
Adding changed files:   5% |##                                  | ETA:  0:17:51
Adding changed files:   5% |##                                  | ETA:  0:17:49
Adding changed files:   5% |##                                  | ETA:  0:17:46
Adding changed files:   5% |##                                  | ETA:  0:17:44
Adding changed files:   5% |##                                  | ETA:  0:17:42
Adding changed files:   6% |##                                  | ETA:  0:17:40
Adding changed files:   6% |##                                  | ETA:  0:17:38
Adding changed files:   6% |##                                  | ETA:  0:17:36
Adding changed files:   6% |##                                  | ETA:  0:17:34
Adding changed files:   6% |##                                  | ETA:  0:17:32
Adding changed files:   6% |##                                  | ETA:  0:17:31
Adding changed files:   6% |##                                  | ETA:  0:17:29
Adding changed files:   6% |##                                  | ETA:  0:17:27
Adding changed files:   6% |##                                  | ETA:  0:17:25
Adding changed files:   6% |##                                  | ETA:  0:17:22
Adding changed files:   6% |##                                  | ETA:  0:17:20
Adding changed files:   6% |##                                  | ETA:  0:17:18
Adding changed files:   6% |##                                  | ETA:  0:17:16
Adding changed files:   6% |##                                  | ETA:  0:17:13
Adding changed files:   6% |##                                  | ETA:  0:17:11
Adding changed files:   6% |##                                  | ETA:  0:17:09
Adding changed files:   7% |##                                  | ETA:  0:17:07
Adding changed files:   7% |##                                  | ETA:  0:17:05
Adding changed files:   7% |##                                  | ETA:  0:17:03
Adding changed files:   7% |##                                  | ETA:  0:17:02
Adding changed files:   7% |##                                  | ETA:  0:17:00
Adding changed files:   7% |##                                  | ETA:  0:16:58
Adding changed files:   7% |##                                  | ETA:  0:16:56
Adding changed files:   7% |##                                  | ETA:  0:16:54
Adding changed files:   7% |##                                  | ETA:  0:16:52
Adding changed files:   7% |##                                  | ETA:  0:16:50
Adding changed files:   7% |##                                  | ETA:  0:16:48
Adding changed files:   7% |##                                  | ETA:  0:16:46
Adding changed files:   7% |##                                  | ETA:  0:16:44
Adding changed files:   7% |##                                  | ETA:  0:16:42
Adding changed files:   7% |##                                  | ETA:  0:16:43
Adding changed files:   8% |##                                  | ETA:  0:16:42
Adding changed files:   8% |##                                  | ETA:  0:16:41
Adding changed files:   8% |##                                  | ETA:  0:16:39
Adding changed files:   8% |##                                  | ETA:  0:16:38
Adding changed files:   8% |##                                  | ETA:  0:16:35
Adding changed files:   8% |###                                 | ETA:  0:16:34
Adding changed files:   8% |###                                 | ETA:  0:16:33
Adding changed files:   8% |###                                 | ETA:  0:16:31
Adding changed files:   8% |###                                 | ETA:  0:16:29
Adding changed files:   8% |###                                 | ETA:  0:16:27
Adding changed files:   8% |###                                 | ETA:  0:16:25
Adding changed files:   8% |###                                 | ETA:  0:16:24
Adding changed files:   8% |###                                 | ETA:  0:16:22
Adding changed files:   8% |###                                 | ETA:  0:16:20
Adding changed files:   8% |###                                 | ETA:  0:16:20
Adding changed files:   8% |###                                 | ETA:  0:16:20
Adding changed files:   9% |###                                 | ETA:  0:16:19
Adding changed files:   9% |###                                 | ETA:  0:16:18
Adding changed files:   9% |###                                 | ETA:  0:16:17
Adding changed files:   9% |###                                 | ETA:  0:16:16
Adding changed files:   9% |###                                 | ETA:  0:16:14
Adding changed files:   9% |###                                 | ETA:  0:16:13
Adding changed files:   9% |###                                 | ETA:  0:16:12
Adding changed files:   9% |###                                 | ETA:  0:16:11
Adding changed files:   9% |###                                 | ETA:  0:16:11
Adding changed files:   9% |###                                 | ETA:  0:16:10
Adding changed files:   9% |###                                 | ETA:  0:16:09
Adding changed files:   9% |###                                 | ETA:  0:16:09
Adding changed files:   9% |###                                 | ETA:  0:16:09
Adding changed files:   9% |###                                 | ETA:  0:16:08
Adding changed files:   9% |###                                 | ETA:  0:16:07
Adding changed files:   9% |###                                 | ETA:  0:16:08
Adding changed files:  10% |###                                 | ETA:  0:16:07
Adding changed files:  10% |###                                 | ETA:  0:16:06
Adding changed files:  10% |###                                 | ETA:  0:16:04
Adding changed files:  10% |###                                 | ETA:  0:16:03
Adding changed files:  10% |###                                 | ETA:  0:16:01
Adding changed files:  10% |###                                 | ETA:  0:16:01
Adding changed files:  10% |###                                 | ETA:  0:16:00
Adding changed files:  10% |###                                 | ETA:  0:15:59
Adding changed files:  10% |###                                 | ETA:  0:15:58
Adding changed files:  10% |###                                 | ETA:  0:15:59
Adding changed files:  10% |###                                 | ETA:  0:16:00
Adding changed files:  10% |###                                 | ETA:  0:16:03
Adding changed files:  10% |###                                 | ETA:  0:16:07
Adding changed files:  10% |###                                 | ETA:  0:16:07
Adding changed files:  10% |###                                 | ETA:  0:16:06
Adding changed files:  11% |###                                 | ETA:  0:16:07
Adding changed files:  11% |###                                 | ETA:  0:16:07
Adding changed files:  11% |####                                | ETA:  0:16:06
Adding changed files:  11% |####                                | ETA:  0:16:05
Adding changed files:  11% |####                                | ETA:  0:16:04
Adding changed files:  11% |####                                | ETA:  0:16:04
Adding changed files:  11% |####                                | ETA:  0:16:04
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.80.1-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "tests/rustdoc/inline_local/private-reexport-in-public-api-81141.rs" "tests/rustdoc/inline_local/private-reexport-in-public-api-generics-81141.rs" "tests/rustdoc/inline_local/private-reexport-in-public-api-hidden-81141.rs" "tests/rustdoc/inline_local/private-reexport-in-public-api-private-81141.rs" "tests/rustdoc/inline_local/reexported-macro-and-macro-export-sidebar-89852.rs" "tests/rustdoc/intra-doc-link-method-trait-impl-72340.rs" "tests/rustdoc/invalid$crate$name.rs" "tests/rustdoc/issue-106421-not-internal.rs" "tests/rustdoc/issue-106421.rs" "tests/rustdoc/jump-to-def-macro.rs" "tests/rustdoc/jump-to-non-local-method.rs" "tests/rustdoc/markdown-60482.rs" "tests/rustdoc/method-anchor-in-blanket-impl-86620.rs" "tests/rustdoc/multiple-macro-rules-w-same-name-submodule-99221.rs" "tests/rustdoc/multiple-mods-w-same-name-doc-inline-83375.rs" "tests/rustdoc/multiple-mods-w-same-name-doc-inline-last-item-83375.rs" "tests/rustdoc/notable-trait/doc-notab
 le_trait-negative.negative.html" "tests/rustdoc/notable-trait/doc-notable_trait-negative.positive.html" "tests/rustdoc/notable-trait/doc-notable_trait-negative.rs" "tests/rustdoc/private-non-local-fields-2.rs" "tests/rustdoc/private-non-local-fields.rs" "tests/rustdoc/pub-use-root-path-95873.rs" "tests/rustdoc/resolve-ice-124363.rs" "tests/rustdoc/sidebar-trait-impl-disambiguate-78701.rs" "tests/rustdoc/source-code-highlight.rs" "tests/rustdoc/synthetic_auto/auto-trait-lifetimes-56822.rs" "tests/rustdoc/synthetic_auto/bounds.rs" "tests/rustdoc/synthetic_auto/normalize-auto-trait-80233.rs" "tests/rustdoc/synthetic_auto/send-impl-conditional-60726.rs" "tests/rustdoc/synthetic_auto/supertrait-bounds.rs" "tests/rustdoc/trait-item-info.rs" "tests/rustdoc/type-alias/primitive-local-link-121106.rs" "tests/rustdoc/underscore-import-61592.rs" "tests/rustdoc/underscore-type-in-trait-impl-96381.rs" "tests/ui-fulldeps/auxiliary/obtain-borrowck-input.rs" "tests/ui-fulldeps/obtain-borrowck.rs" "t
 ests/ui-fulldeps/obtain-borrowck.run.stdout" "tests/ui-fulldeps/run-compiler-twice.rs" "tests/ui-fulldeps/stable-mir/check_binop.rs" "tests/ui-fulldeps/stable-mir/check_foreign.rs" "tests/ui-fulldeps/stable-mir/check_intrinsics.rs" "tests/ui-fulldeps/stable-mir/check_normalization.rs" "tests/ui-fulldeps/stable-mir/check_transform.rs" "tests/ui/README.md" "tests/ui/abi/extern/extern-pass-FiveU16s.rs" "tests/ui/abi/extern/extern-return-FiveU16s.rs" "tests/ui/abi/fixed_x18.rs" "tests/ui/argfile/commandline-argfile-badutf8-windows.rs" "tests/ui/argfile/commandline-argfile-badutf8-windows.stderr" "tests/ui/argfile/commandline-argfile-badutf8.args" "tests/ui/argfile/commandline-argfile-badutf8.rs" "tests/ui/argfile/commandline-argfile-badutf8.stderr" "tests/ui/argfile/commandline-argfile-missing-windows.rs" "tests/ui/argfile/commandline-argfile-missing-windows.stderr" "tests/ui/argfile/commandline-argfile-missing.rs" "tests/ui/argfile/commandline-argfile-missing.stderr" "tests/ui/argfile/
 commandline-argfile-multiple-windows.rs" "tests/ui/argfile/commandline-argfile-multiple-windows.stderr" "tests/ui/argfile/commandline-argfile-multiple.rs" "tests/ui/argfile/commandline-argfile-multiple.stderr" "tests/ui/argfile/commandline-argfile.args" "tests/ui/argfile/commandline-argfile.rs" "tests/ui/asm/empty_global_asm.rs" "tests/ui/asm/fail-const-eval-issue-121099.rs" "tests/ui/asm/fail-const-eval-issue-121099.stderr" "tests/ui/asm/simple_global_asm.rs" "tests/ui/asm/x86_64/evex512-implicit-feature.rs" "tests/ui/asm/x86_64/goto.rs" "tests/ui/asm/x86_64/goto.stderr" "tests/ui/associated-consts/assoc-const-eq-bound-var-in-ty-not-wf.rs" "tests/ui/associated-consts/assoc-const-eq-bound-var-in-ty-not-wf.stderr" "tests/ui/associated-consts/assoc-const-eq-bound-var-in-ty.rs" "tests/ui/associated-consts/assoc-const-eq-esc-bound-var-in-ty.rs" "tests/ui/associated-consts/assoc-const-eq-esc-bound-var-in-ty.stderr" "tests/ui/associated-consts/assoc-const-eq-param-in-ty.rs" "tests/ui/asso
 ciated-consts/assoc-const-eq-param-in-ty.stderr" "tests/ui/associated-consts/assoc-const-eq-supertraits.rs" "tests/ui/associated-consts/associated-const-type-parameters.stderr" "tests/ui/associated-consts/freeze.rs" "tests/ui/associated-inherent-types/bugs/wf-check-skipped.next.stderr" "tests/ui/associated-inherent-types/constrain_opaque_types_during_projection.rs" "tests/ui/associated-inherent-types/variance-computation-requires-equality.rs" "tests/ui/associated-inherent-types/variance-computation-requires-equality.stderr" "tests/ui/associated-type-bounds/auxiliary/implied-predicates.rs" "tests/ui/associated-type-bounds/cant-see-copy-bound-from-child-rigid-2.rs" "tests/ui/associated-type-bounds/cant-see-copy-bound-from-child-rigid-2.stderr" "tests/ui/associated-type-bounds/cant-see-copy-bound-from-child-rigid.rs" "tests/ui/associated-type-bounds/cant-see-copy-bound-from-child-rigid.stderr" "tests/ui/associated-type-bounds/dedup-normalized-1.rs" "tests/ui/associated-type-bounds/dedu
 p-normalized-2-higher-ranked.rs" "tests/ui/associated-type-bounds/dedup-normalized-2-higher-ranked.stderr" "tests/ui/associated-type-bounds/dont-imply-atb-in-closure-inference.rs" "tests/ui/associated-type-bounds/higher-ranked.rs" "tests/ui/associated-type-bounds/implied-bounds-cycle.rs" "tests/ui/associated-type-bounds/implied-bounds-cycle.stderr" "tests/ui/associated-type-bounds/implied-predicates.rs" "tests/ui/associated-type-bounds/nested-bounds-dont-eliminate-alias-bounds.rs" "tests/ui/associated-type-bounds/no-gat-position.rs" "tests/ui/associated-type-bounds/no-gat-position.stderr" "tests/ui/associated-type-bounds/resolution-failure-building-vtable-representation-ice-90691.rs"' failed with exit code 128:
fatal: pathspec 'tests/rustdoc/invalid.rs' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0148627449837203505==--

