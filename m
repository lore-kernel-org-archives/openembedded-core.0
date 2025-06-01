Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336A4C71144
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.27768.1748786126246727473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QOoKcPSb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YYKvkpV+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc69b54-c4b865ab-4214-4f49-bfa7-752cc4093896-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gvb18ag61aLe72QlghvzzeFEq2tcywj2UMnWGHUvU8g=;
	b=QOoKcPSbj88i+mherRUnw5G4Pi/huMENZnK5MgmH8k3yTBgwy1jQfrSGZ6HDGrFN
	knieT+oksc8m3BsP/Z+6l7+v7Bzekg1RHnk+Zvhs1x99L/7S/PFx0jYF54NLiV4KZUR
	Cn+zHf/oF3sI+rIVS3U0L5V4ubqmoIYcmVnBG0AU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gvb18ag61aLe72QlghvzzeFEq2tcywj2UMnWGHUvU8g=;
	b=YYKvkpV+wLpLpY823FAyOfTp9El9ZTb/Xmajr5RdVB28LpeGAbyBcgERB/FWvKdw
	qlIEtuoz28sw/jrpfcoE8Ann/+oPRsTJqfbjeLpv8owO4ricsH0AE2/q+BzTzLdzM0V
	Rd0BALoRvk2KUKVaApf9/0DkGfQLvzxgWVqYP9no=
Content-Type: multipart/mixed; boundary="===============3729595890253098447=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs,cargo,rust-llvm,rust: upgrading to
 1.87.0,1.87.0,1.87.0,1.87.0 FAILED
Message-ID: <010101972bc69b54-c4b865ab-4214-4f49-bfa7-752cc4093896-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217567

--===============3729595890253098447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libstd-rs,cargo,rust-llvm,rust* to *1.87.0,1.87.0,1.87.0,1.87.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libstd-rs -V 1.87.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:deb9c3e041dfcf82d9ea54e062ed832493fb16af"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:deb9c3e041dfcf82d9ea54e062ed832493fb16af"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-lkht9pf0: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-f8tomh1b/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-f8tomh1b/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:08:40
Adding changed files:   0% |                                    | ETA:  0:06:26
Adding changed files:   0% |                                    | ETA:  0:05:46
Adding changed files:   0% |                                    | ETA:  0:05:26
Adding changed files:   0% |                                    | ETA:  0:05:12
Adding changed files:   0% |                                    | ETA:  0:04:55
Adding changed files:   0% |                                    | ETA:  0:04:48
Adding changed files:   0% |                                    | ETA:  0:04:43
Adding changed files:   1% |                                    | ETA:  0:04:38
Adding changed files:   1% |                                    | ETA:  0:04:33
Adding changed files:   1% |                                    | ETA:  0:04:30
Adding changed files:   1% |                                    | ETA:  0:04:26
Adding changed files:   1% |                                    | ETA:  0:04:22
Adding changed files:   1% |                                    | ETA:  0:04:19
Adding changed files:   1% |                                    | ETA:  0:04:15
Adding changed files:   1% |                                    | ETA:  0:04:12
Adding changed files:   2% |                                    | ETA:  0:04:10
Adding changed files:   2% |                                    | ETA:  0:04:09
Adding changed files:   2% |                                    | ETA:  0:04:08
Adding changed files:   2% |                                    | ETA:  0:04:07
Adding changed files:   2% |                                    | ETA:  0:04:06
Adding changed files:   2% |                                    | ETA:  0:04:05
Adding changed files:   2% |#                                   | ETA:  0:04:04
Adding changed files:   2% |#                                   | ETA:  0:04:03
Adding changed files:   3% |#                                   | ETA:  0:04:02
Adding changed files:   3% |#                                   | ETA:  0:04:01
Adding changed files:   3% |#                                   | ETA:  0:04:00
Adding changed files:   3% |#                                   | ETA:  0:04:00
Adding changed files:   3% |#                                   | ETA:  0:03:59
Adding changed files:   3% |#                                   | ETA:  0:03:58
Adding changed files:   3% |#                                   | ETA:  0:03:57
Adding changed files:   3% |#                                   | ETA:  0:03:57
Adding changed files:   4% |#                                   | ETA:  0:03:56
Adding changed files:   4% |#                                   | ETA:  0:03:56
Adding changed files:   4% |#                                   | ETA:  0:03:55
Adding changed files:   4% |#                                   | ETA:  0:03:55
Adding changed files:   4% |#                                   | ETA:  0:03:54
Adding changed files:   4% |#                                   | ETA:  0:03:53
Adding changed files:   4% |#                                   | ETA:  0:03:53
Adding changed files:   4% |#                                   | ETA:  0:03:52
Adding changed files:   5% |#                                   | ETA:  0:03:52
Adding changed files:   5% |#                                   | ETA:  0:03:51
Adding changed files:   5% |#                                   | ETA:  0:03:51
Adding changed files:   5% |#                                   | ETA:  0:03:50
Adding changed files:   5% |##                                  | ETA:  0:03:50
Adding changed files:   5% |##                                  | ETA:  0:03:49
Adding changed files:   5% |##                                  | ETA:  0:03:49
Adding changed files:   5% |##                                  | ETA:  0:03:49
Adding changed files:   6% |##                                  | ETA:  0:03:48
Adding changed files:   6% |##                                  | ETA:  0:03:48
Adding changed files:   6% |##                                  | ETA:  0:03:48
Adding changed files:   6% |##                                  | ETA:  0:03:48
Adding changed files:   6% |##                                  | ETA:  0:03:48
Adding changed files:   6% |##                                  | ETA:  0:03:48
Adding changed files:   6% |##                                  | ETA:  0:03:47
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.87.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "tests/ui/feature-gates/feature-gate-where_clause_attrs.a.stderr" "tests/ui/feature-gates/feature-gate-where_clause_attrs.b.stderr" "tests/ui/feature-gates/feature-gate-where_clause_attrs.rs" "tests/ui/feature-gates/feature-gate-yield-expr.rs" "tests/ui/feature-gates/feature-gate-yield-expr.stderr" "tests/ui/fn/error-recovery-mismatch.rs" "tests/ui/fn/error-recovery-mismatch.stderr" "tests/ui/fn/mut-arg-of-borrowed-type-meant-to-be-arg-of-mut-borrow.fixed" "tests/ui/fn/mut-arg-of-borrowed-type-meant-to-be-arg-of-mut-borrow.rs" "tests/ui/fn/mut-arg-of-borrowed-type-meant-to-be-arg-of-mut-borrow.stderr" "tests/ui/fn/param-mismatch-foreign.rs" "tests/ui/fn/param-mismatch-foreign.stderr" "tests/ui/fn/param-mismatch-trait-fn.rs" "tests/ui/fn/param-mismatch-trait-fn.stderr" "tests/ui/fn/trait-fn-generic-mismatch.rs" "tests/ui/fn/trait-fn-generic-mismatch.stderr" "tests/ui/force-inlining/asm.rs" "tests/ui/force-inlining/asm.stderr" "tests/ui/force-inlining
 /auxiliary/callees.rs" "tests/ui/force-inlining/cast.rs" "tests/ui/force-inlining/cast.stderr" "tests/ui/force-inlining/cross-crate.rs" "tests/ui/force-inlining/deny-async.rs" "tests/ui/force-inlining/deny-async.stderr" "tests/ui/force-inlining/deny-closure.rs" "tests/ui/force-inlining/deny-closure.stderr" "tests/ui/force-inlining/deny.rs" "tests/ui/force-inlining/deny.stderr" "tests/ui/force-inlining/early-deny.rs" "tests/ui/force-inlining/early-deny.stderr" "tests/ui/force-inlining/gate.rs" "tests/ui/force-inlining/gate.stderr" "tests/ui/force-inlining/invalid.rs" "tests/ui/force-inlining/invalid.stderr" "tests/ui/force-inlining/shims.rs" "tests/ui/generic-associated-types/issue-91883.current.stderr" "tests/ui/generic-associated-types/issue-91883.next.stderr" "tests/ui/generic-const-items/def-site-eval.fail.stderr" "tests/ui/generic-const-items/def-site-eval.rs" "tests/ui/generic-const-items/def-site-mono.rs" "tests/ui/generic-const-items/recursive.stderr" "tests/ui/impl-trait/def
 ine-via-const.rs" "tests/ui/impl-trait/define-via-extern.rs" "tests/ui/impl-trait/define-via-extern.stderr" "tests/ui/impl-trait/ice-unexpected-param-type-whensubstituting-in-region-112823.current.stderr" "tests/ui/impl-trait/ice-unexpected-param-type-whensubstituting-in-region-112823.next.stderr" "tests/ui/impl-trait/impl-fn-rpit-opaque-107883.rs" "tests/ui/impl-trait/in-trait/dont-consider-unconstrained-rpitits.rs" "tests/ui/impl-trait/in-trait/dont-consider-unconstrained-rpitits.stderr" "tests/ui/impl-trait/in-trait/dump.rs" "tests/ui/impl-trait/in-trait/dump.stderr" "tests/ui/impl-trait/in-trait/mismatched-where-clauses.rs" "tests/ui/impl-trait/in-trait/mismatched-where-clauses.stderr" "tests/ui/impl-trait/inside-item-nested-in-anon-const.rs" "tests/ui/impl-trait/opt-out-bound-not-satisfied.rs" "tests/ui/impl-trait/opt-out-bound-not-satisfied.stderr" "tests/ui/impl-trait/precise-capturing/rpitit-outlives-2.rs" "tests/ui/impl-trait/precise-capturing/rpitit-outlives.rs" "tests/ui/
 inference/really-long-type-in-let-binding-without-sufficient-type-info.rs" "tests/ui/inference/really-long-type-in-let-binding-without-sufficient-type-info.stderr" "tests/ui/infinite/infinite-instantiation-struct-tail-ice-114484.rs" "tests/ui/infinite/infinite-instantiation-struct-tail-ice-114484.stderr" "tests/ui/inline-const/collect-scopes-in-pat.rs" "tests/ui/invalid-compile-flags/need-crate-arg-ignore-tidy$x.rs" "tests/ui/invalid-compile-flags/need-crate-arg-ignore-tidy$x.stderr" "tests/ui/invalid-compile-flags/print-crate-name-request-malformed-crate-name.rs" "tests/ui/invalid-compile-flags/print-crate-name-request-malformed-crate-name.stderr" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name-1.rs" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name-1.stderr" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name-2.rs" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name-2.stde
 rr" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name.rs" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name.stderr" "tests/ui/issues/issue-33941.current.stderr" "tests/ui/issues/issue-33941.next.stderr" "tests/ui/kindck/kindck-inherited-copy-bound.stderr" "tests/ui/lang-items/missing-copy-lang-item-issue-19660.rs" "tests/ui/lang-items/missing-copy-lang-item-issue-19660.stderr" "tests/ui/layout/gce-rigid-const-in-array-len.rs" "tests/ui/layout/gce-rigid-const-in-array-len.stderr" "tests/ui/layout/normalization-failure.rs" "tests/ui/layout/normalization-failure.stderr" "tests/ui/layout/randomize.rs" "tests/ui/layout/reprc-power-alignment.rs" "tests/ui/layout/reprc-power-alignment.stderr" "tests/ui/layout/uncomputable-due-to-trivial-bounds-ice-135138.rs" "tests/ui/layout/uncomputable-due-to-trivial-bounds-ice-135138.stderr" "tests/ui/layout/unconstrained-param-ice-137308.rs" "tests/ui/layout/unconstrained-param-ice-137308.stderr" 
 "tests/ui/layout/unexpected-unsized-field-issue-135020.rs" "tests/ui/layout/unknown-when-no-type-parameter.rs" "tests/ui/layout/unknown-when-no-type-parameter.stderr" "tests/ui/layout/unknown-when-ptr-metadata-is-DST.rs" "tests/ui/layout/unknown-when-ptr-metadata-is-DST.stderr" "tests/ui/lazy-type-alias/def-site-param-defaults-wf.rs" "tests/ui/lazy-type-alias/def-site-param-defaults-wf.stderr" "tests/ui/lazy-type-alias/def-site-predicates-wf.rs" "tests/ui/lazy-type-alias/def-site-predicates-wf.stderr" "tests/ui/lexer/floating-point-0e10-issue-40408.rs" "tests/ui/lifetimes/static-typos.rs"' failed with exit code 128:
fatal: pathspec 'tests/ui/invalid-compile-flags/need-crate-arg-ignore-tidy.rs' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3729595890253098447==--

