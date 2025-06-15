Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BB5C7115A
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8885.1749993276379478281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UwhclH3V;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EOoOBdq1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019773ba4ca0-f03fd00d-7a00-43a7-9934-50730c80c9f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=waCIu7pNIP77qpLRoHIzfHA9xKiyhjxrt3KCntw7UGY=;
	b=UwhclH3VkWRkz9U+tgPjeTihwS5QnfXFxJGVmlfIGYDo7j3hQa7NWqp2JCm7eJZe
	ebW2IeIqTKtHMOTYgsVgPXJuu3xjYPH6h/Cpjpmix2C8cJvWgBSytF226OOktxXC7Tp
	gkcRa5cNhZ8aVop8inVcv4/LSizwjdLxKPf+BZnI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=waCIu7pNIP77qpLRoHIzfHA9xKiyhjxrt3KCntw7UGY=;
	b=EOoOBdq1ljkNUZyZbpmJyYC4LufoSKEcKUsDXEFB/Ae89hSlhN7tWd3GvCtew4oi
	zP/1jsYH7H2l1Kps7vtdRQEUTkbCyl4kv5p/CcNjikd1Ajh2lCuCkKjvVuzMLn82FC2
	3zYO9wcyJzR15OYCXwu9AeokWn6XjYrE5C4GBgcM=
Content-Type: multipart/mixed; boundary="===============1933107749906015020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust,rust-llvm,cargo,libstd-rs: upgrading to
 1.87.0,1.87.0,1.87.0,1.87.0 FAILED
Message-ID: <0101019773ba4ca0-f03fd00d-7a00-43a7-9934-50730c80c9f6-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218653

--===============1933107749906015020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust,rust-llvm,cargo,libstd-rs* to *1.87.0,1.87.0,1.87.0,1.87.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust -V 1.87.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1910 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:d8d7986bfd0185b3ccfd8eba61fb7db3af831718"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (0 cached, 936 parsed). 1911 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:d8d7986bfd0185b3ccfd8eba61fb7db3af831718"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:04:29
Adding changed files:   0% |                                    | ETA:  0:03:17
Adding changed files:   0% |                                    | ETA:  0:02:50
Adding changed files:   0% |                                    | ETA:  0:02:39
Adding changed files:   1% |                                    | ETA:  0:02:32
Adding changed files:   1% |                                    | ETA:  0:02:26
Adding changed files:   1% |                                    | ETA:  0:02:23
Adding changed files:   1% |                                    | ETA:  0:02:19
Adding changed files:   2% |                                    | ETA:  0:02:15
Adding changed files:   2% |                                    | ETA:  0:02:12
Adding changed files:   2% |                                    | ETA:  0:02:10
Adding changed files:   2% |#                                   | ETA:  0:02:08
Adding changed files:   3% |#                                   | ETA:  0:02:06
Adding changed files:   3% |#                                   | ETA:  0:02:05
Adding changed files:   3% |#                                   | ETA:  0:02:04
Adding changed files:   3% |#                                   | ETA:  0:02:03
Adding changed files:   4% |#                                   | ETA:  0:02:03
Adding changed files:   4% |#                                   | ETA:  0:02:02
Adding changed files:   4% |#                                   | ETA:  0:02:02
Adding changed files:   4% |#                                   | ETA:  0:02:01
Adding changed files:   5% |#                                   | ETA:  0:02:00
Adding changed files:   5% |#                                   | ETA:  0:02:00
Adding changed files:   5% |##                                  | ETA:  0:01:59
Adding changed files:   5% |##                                  | ETA:  0:01:59
Adding changed files:   6% |##                                  | ETA:  0:01:58
Adding changed files:   6% |##                                  | ETA:  0:01:58
Adding changed files:   6% |##                                  | ETA:  0:01:57
Adding changed files:   6% |##                                  | ETA:  0:01:57
Adding changed files:   7% |##                                  | ETA:  0:01:56
Adding changed files:   7% |##                                  | ETA:  0:01:56
Adding changed files:   7% |##                                  | ETA:  0:01:56
Adding changed files:   7% |##                                  | ETA:  0:01:55
Adding changed files:   8% |##                                  | ETA:  0:01:55
Adding changed files:   8% |###                                 | ETA:  0:01:54
Adding changed files:   8% |###                                 | ETA:  0:01:54
Adding changed files:   8% |###                                 | ETA:  0:01:53
Adding changed files:   9% |###                                 | ETA:  0:01:53
Adding changed files:   9% |###                                 | ETA:  0:01:52
Adding changed files:   9% |###                                 | ETA:  0:01:52
Adding changed files:   9% |###                                 | ETA:  0:01:52
Adding changed files:  10% |###                                 | ETA:  0:01:52
Adding changed files:  10% |###                                 | ETA:  0:01:52
Adding changed files:  10% |###                                 | ETA:  0:01:51
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.87.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "tests/ui/feature-gates/feature-gate-ergonomic-clones.stderr" "tests/ui/feature-gates/feature-gate-generic-const-parameter-types.normal.stderr" "tests/ui/feature-gates/feature-gate-generic-const-parameter-types.rs" "tests/ui/feature-gates/feature-gate-naked_functions_target_feature.rs" "tests/ui/feature-gates/feature-gate-naked_functions_target_feature.stderr" "tests/ui/feature-gates/feature-gate-pattern-complexity-limit.rs" "tests/ui/feature-gates/feature-gate-pattern-complexity-limit.stderr" "tests/ui/feature-gates/feature-gate-raw-dylib-elf.rs" "tests/ui/feature-gates/feature-gate-raw-dylib-elf.stderr" "tests/ui/feature-gates/feature-gate-type_alias_impl_trait.stderr" "tests/ui/feature-gates/feature-gate-where_clause_attrs.a.stderr" "tests/ui/feature-gates/feature-gate-where_clause_attrs.b.stderr" "tests/ui/feature-gates/feature-gate-where_clause_attrs.rs" "tests/ui/feature-gates/feature-gate-yield-expr.rs" "tests/ui/feature-gates/feature-gate-yi
 eld-expr.stderr" "tests/ui/fn/trait-fn-generic-mismatch.rs" "tests/ui/fn/trait-fn-generic-mismatch.stderr" "tests/ui/generic-associated-types/issue-91883.current.stderr" "tests/ui/generic-associated-types/issue-91883.next.stderr" "tests/ui/impl-trait/define-via-const.rs" "tests/ui/impl-trait/define-via-extern.rs" "tests/ui/impl-trait/define-via-extern.stderr" "tests/ui/impl-trait/inside-item-nested-in-anon-const.rs" "tests/ui/invalid-compile-flags/need-crate-arg-ignore-tidy$x.rs" "tests/ui/invalid-compile-flags/need-crate-arg-ignore-tidy$x.stderr" "tests/ui/invalid-compile-flags/print-crate-name-request-malformed-crate-name.rs" "tests/ui/invalid-compile-flags/print-crate-name-request-malformed-crate-name.stderr" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name-1.rs" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name-1.stderr" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name-2.rs" "tests/ui/invalid-c
 ompile-flags/print-file-names-request-malformed-crate-name-2.stderr" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name.rs" "tests/ui/invalid-compile-flags/print-file-names-request-malformed-crate-name.stderr" "tests/ui/kindck/kindck-inherited-copy-bound.stderr" "tests/ui/layout/gce-rigid-const-in-array-len.rs" "tests/ui/layout/gce-rigid-const-in-array-len.stderr" "tests/ui/layout/normalization-failure.rs" "tests/ui/layout/normalization-failure.stderr" "tests/ui/layout/unconstrained-param-ice-137308.rs" "tests/ui/layout/unconstrained-param-ice-137308.stderr" "tests/ui/lifetimes/static-typos.rs" "tests/ui/lifetimes/static-typos.stderr" "tests/ui/linkage-attr/raw-dylib/elf/multiple-libraries.rs" "tests/ui/linkage-attr/raw-dylib/elf/single-symbol.rs" "tests/ui/linkage-attr/raw-dylib/elf/verbatim.rs" "tests/ui/linkage-attr/raw-dylib/windows/dlltool-failed.rs" "tests/ui/linkage-attr/raw-dylib/windows/dlltool-failed.stderr" "tests/ui/linkage-attr/raw-dylib/windo
 ws/import-name-type-invalid-format.rs" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-invalid-format.stderr" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-multiple.rs" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-multiple.stderr" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-unknown-value.rs" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-unknown-value.stderr" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-unsupported-link-kind.rs" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-unsupported-link-kind.stderr" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-x86-only.rs" "tests/ui/linkage-attr/raw-dylib/windows/import-name-type-x86-only.stderr" "tests/ui/linkage-attr/raw-dylib/windows/invalid-dlltool.rs" "tests/ui/linkage-attr/raw-dylib/windows/invalid-dlltool.stderr" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-and-name.rs" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-and-name.s
 tderr" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-invalid-format.rs" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-invalid-format.stderr" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-missing-argument.rs" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-missing-argument.stderr" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-multiple.rs" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-multiple.stderr" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-not-foreign-fn.rs" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-not-foreign-fn.stderr" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-too-large.rs" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-too-large.stderr" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-too-many-arguments.rs" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-too-many-arguments.stderr" "tests/ui/linkage-attr/raw-dylib/windows/link-ordinal-unsupported-link-kind.rs" "tests/ui/linkage-at
 tr/raw-dylib/windows/link-ordinal-unsupported-link-kind.stderr" "tests/ui/linkage-attr/raw-dylib/windows/multiple-declarations.rs" "tests/ui/linkage-attr/raw-dylib/windows/multiple-declarations.stderr" "tests/ui/linkage-attr/raw-dylib/windows/raw-dylib-windows-only.elf.stderr" "tests/ui/linkage-attr/raw-dylib/windows/raw-dylib-windows-only.notelf.stderr" "tests/ui/linkage-attr/raw-dylib/windows/raw-dylib-windows-only.rs" "tests/ui/linkage-attr/raw-dylib/windows/unsupported-abi.rs" "tests/ui/linkage-attr/raw-dylib/windows/unsupported-abi.stderr" "tests/ui/linking/cdylib-no-mangle.rs" "tests/ui/linking/executable-no-mangle-strip.rs" "tests/ui/linking/no-gc-encapsulation-symbols.rs" "tests/ui/lint/removed-lints/README.md" "tests/ui/lint/removed-lints/ptr_cast_add_auto_to_object.rs" "tests/ui/lint/removed-lints/ptr_cast_add_auto_to_object.stderr" "tests/ui/lint/unaligned_references_fake_borrow.rs" "tests/ui/lint/unused/lint-unused-imports-self-single.fixed" "tests/ui/lint/unused/lint-un
 used-imports-self-single.rs" "tests/ui/lint/unused/lint-unused-imports-self-single.stderr" "tests/ui/lint/unused/unused-field-in-pat-field.rs" "tests/ui/lint/wasm_c_abi_transition.rs" "tests/ui/lint/wasm_c_abi_transition.stderr" "tests/ui/loops/label-on-block-suggest-move.rs" "tests/ui/loops/label-on-block-suggest-move.stderr" "tests/ui/lowering/no-name-for-DefPath-issue-133426.rs" "tests/ui/lowering/no-name-for-DefPath-issue-133426.stderr" "tests/ui/macros/block-to-expr-metavar.rs"' failed with exit code 128:
fatal: pathspec 'tests/ui/invalid-compile-flags/need-crate-arg-ignore-tidy.rs' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1933107749906015020==--

