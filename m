Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1289C79FA1
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 05:28:10 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8533.1788672481969422256
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 22:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bzquLSMM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pO7LVD0/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0753016d5-279e0afb-a98f-44d9-baad-dfc72066b45e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788672481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cByGGTa0XmlbU1zF0B0fVCSm1AIBmsdScE3PapNhunc=;
	b=bzquLSMMfofNYTUAAf0PjEOAwweAN6GapvpaizP/c3Wu1WhLAJC6wTEcZUaysUEm
	NyAwFPp3BOdUOIOHSmuuF2SSJIEojkKBTeOaSEi40Q5tcOQk2ePEj9baaV0KnDWuRd2
	fV2muyukOGj+asmLLJ++UyOkDU1F4VdpcTPiHUnE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788672481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cByGGTa0XmlbU1zF0B0fVCSm1AIBmsdScE3PapNhunc=;
	b=pO7LVD0/kB3DdlFKg/im0NvVMPhsmWoZryM/JXIqiA4zZizpLY32wayQ9Ste4kx3
	/vyl2aYVIi3hlK99dfN+Ot9b6BcGZuQaYoLJF6RmfShErGc/YcyFeW3HVCoFhxBjC14
	36S5trzT7O5XAazxmRcwHaaOF8mnb+hSMcyk4gqY=
Content-Type: multipart/mixed; boundary="===============6136305330158188665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bindgen-cli: upgrading to 0.73.1 FAILED
Message-ID: <010101a0753016d5-279e0afb-a98f-44d9-baad-dfc72066b45e-000000@us-west-2.amazonses.com>
Date: Sun, 6 Sep 2026 05:28:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.06-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 05:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245200

--===============6136305330158188665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bindgen-cli* to *0.73.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe bindgen-cli failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1988 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-db870417bcc5f3df38a588e82fd8b0a48ffee918"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:db870417bcc5f3df38a588e82fd8b0a48ffee918"
meta-yocto-bsp       
meta-poky            = "master:3bb1295755628c4facec3a0a2800a9c12345ce00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-db870417bcc5f3df38a588e82fd8b0a48ffee918"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:db870417bcc5f3df38a588e82fd8b0a48ffee918"
meta-yocto-bsp       
meta-poky            = "master:3bb1295755628c4facec3a0a2800a9c12345ce00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 31 Local 31 Mirrors 0 Missed 0 Current 56 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 292 tasks of which 291 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 66a1e2aa3a4829c831d618d9ce6861419e097781
WARNING: Command 'git rebase 66a1e2aa3a4829c831d618d9ce6861419e097781' failed:
Auto-merging CHANGELOG.md
CONFLICT (content): Merge conflict in CHANGELOG.md
Auto-merging Cargo.lock
CONFLICT (content): Merge conflict in Cargo.lock
Auto-merging Cargo.toml
CONFLICT (content): Merge conflict in Cargo.toml
Auto-merging bindgen-cli/Cargo.toml
CONFLICT (content): Merge conflict in bindgen-cli/Cargo.toml
Auto-merging bindgen/Cargo.toml
CONFLICT (content): Merge conflict in bindgen/Cargo.toml

You will need to resolve conflicts in order to complete the upgrade.
INFO: Running extra recipe upgrade task: do_update_crates
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/bindgen-cli
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/bindgen-cli/bindgen-cli_0.73.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/bindgen-cli.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6136305330158188665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bindgen-cli-changelog.txt"

Changelog for bindgen-cli: 0.72.1 -> 0.73.1
Source: CHANGELOG.md

- [0.73.1 (2026-09-05)](#0731-2026-09-05)
- [0.73.0 (2026-09-05)](#0730-2026-09-05)
  - [Security](#security-2)
- [0.72.1 (2025-08-31)](#0721-2025-08-31)
- [0.72.0 (2025-06-08)](#0720-2025-06-08)
- [v0.71.1 (2024-12-09)](#v0711-2024-12-09)
  - [Fixed](#fixed-5)
- [0.71.0 (2024-12-06)](#0710-2024-12-06)
  - [Fixed](#fixed-6)
- [0.70.1 (2024-08-20)](#0701-2024-08-20)
  - [Fixed](#fixed-7)
- [0.70.0 (2024-08-16)](#0700-2024-08-16)
  - [Fixed](#fixed-8)
- [0.69.4 (2024-02-04)](#0694-2024-02-04)
  - [Fixed](#fixed-9)
- [0.69.3 (2024-02-04)](#0693-2024-02-04)
  - [Security](#security-6)
- [0.69.2 (2024-01-13)](#0692-2024-01-13)
- [0.69.1 (2023-11-02)](#0691-2023-11-02)
- [0.69.0 (2023-11-01)](#0690-2023-11-01)
  - [Security](#security-8)
- [0.68.1](#0681)
  - [Fixed](#fixed-14)
- [0.68.0](#0680)
  - [Removed](#removed-11)
  - [Fixed](#fixed-15)
- [0.67.0](#0670)
- [0.66.1](#0661)
- [0.66.0](#0660)
- [0.65.1](#0651)
  - [Fixed](#fixed-16)
- [0.65.0](#0650)
  - [Removed](#removed-14)
- [0.64.0](#0640)
- [0.63.0](#0630)
  - [Removed](#removed-15)
- [0.62.0](#0620)
- [0.61.0](#0610)
  - [Fixed](#fixed-18)
- [0.60.1](#0601)
- [0.60.0](#0600)
- [0.59.2](#0592)
- [0.59.1](#0591)
  - [Fixed](#fixed-21)
- [0.59.0](#0590)
  - [Added](#added-19)
  - [Changed](#changed-19)
- [0.58.1](#0581)
  - [Added](#added-20)
- [0.58.0](#0580)
  - [Deprecated](#deprecated)
  - [Removed](#removed-17)
  - [Security](#security-9)
- [0.57.0](#0570)
  - [Added](#added-22)
- [0.56.0](#0560)
- [0.55.1](#0551)
  - [Fixed](#fixed-27)
- [0.55.0](#0550)
  - [Removed](#removed-18)
  - [Fixed](#fixed-28)
- [0.54.1](#0541)
- [0.54.0](#0540)
  - [Added](#added-26)
  - [Fixed](#fixed-30)
- [0.53.3](#0533)
  - [Fixed](#fixed-31)
- [0.53.2](#0532)
- [0.53.1](#0531)
  - [Added](#added-28)
- [0.53.0](#0530)
- [0.52.0](#0520)
  - [Added](#added-30)
- [0.51.1](#0511)
  - [Fixed](#fixed-34)
- [0.51.0](#0510)
  - [Fixed](#fixed-35)
  - [Changed](#changed-29)
- [0.50.0](#0500)
- [0.49.3](#0493)
  - [Added](#added-33)
- [0.49.1](#0491)
  - [Fixed](#fixed-36)
- [0.49.0](#0490)
  - [Added](#added-34)
  - [Fixed](#fixed-37)
  - [Changed](#changed-32)
  - [Fixed](#fixed-38)
  - [Changed](#changed-33)
  - [Fixed](#fixed-39)
  - [Added](#added-35)
  - [Changed](#changed-34)
  - [Fixed](#fixed-40)
- [0.47.0](#0470)
  - [Changed](#changed-36)
- [0.33.1 .. 0.46.0](#0331--0460)
  - [Added](#added-36)
  - [Removed](#removed-19)
  - [Changed](#changed-37)
  - [Fixed](#fixed-43)
- [0.33.1](#0331)
  - [Fixed](#fixed-44)
  - [Fixed](#fixed-45)
  - [Fixed](#fixed-46)
  - [Fixed](#fixed-47)
- [0.31.0](#0310)
  - [Deprecated](#deprecated-1)
  - [Removed](#removed-20)
  - [Fixed](#fixed-48)
- [0.30.0](#0300)
  - [Deprecated](#deprecated-2)
  - [Fixed](#fixed-49)
- [0.29.0](#0290)
  - [Added](#added-40)
  - [Changed](#changed-41)
  - [Fixed](#fixed-50)
# 0.73.1 (2026-09-05)
- Widened acceptable prettyplease / syn dependency versions (#3447).
# 0.73.0 (2026-09-05)
## Added
- Add `Debug`, `Clone` and `Eq` traits to `ParseCallbacks` info types (#3233).
- Include the source location in discovery `ParseCallbacks` (#3244).
- Report constants and variables in `ParseCallbacks::new_item_found` (#3249).
- Allow adding custom attributes to `extern` function blocks (#3257).
- Support new-type-alias constants (#3288, #3390).
- Support nested flexible array members (#3306).
- Add support for custom per-field attributes (#3307).
- Add const-generic bitfield accessors for compile-time optimization (#3325,
  #3374).
- Allow renaming struct and union fields (#3358).
- Add a `libcpp` feature to link `libclang` against `libc++` (#3375).
- Prebuilt binaries for aarch64 Linux (#3217).
## Changed
- Guarantee opaque type layout across all architectures (#3280).
- Use `NonNull` for C++ references (#3292).
- `Bindings::write` now takes `impl Write` instead of `Box<dyn Write>`
  (#3317, #3324).
- Optimize bitfield unit get/set with byte-wise operations (#3325).
- Emit `const` `__BindgenUnionField` accessors and comply with Rust 2024
  `unsafe_op_in_unsafe_fn` (#3337).
- Generate a doc comment pointing at the aliased type when a type alias is
  hidden (#3122).
- dyngen: convert the library path to `OsStr` before opening it (#3315).
- Return a `NoHeadersProvided` error instead of generating empty bindings
  when no input headers are provided (#3391).
- Bump the MSRV to 1.71 (#3401).
- Bump `syn` to v3 (#3401) and `shlex` to v2 (#3380).
## Removed
- Removed support for generating code for rustc versions < 1.51, along with
  the corresponding `RustTarget` constants (#3281).
- Removed the dependency on `itertools` (#3408).
## Fixed
- Fix a typo in the handling of `--rustified-non-exhaustive-enums` (#3266).
- Apply the same mangling rule to `C` and `C-unwind` function types (#3156).
- Fix alignment of bitfields in some edge cases (#3247).
- Fix typedefs inside constified modules (#3284).
- Fix generation of `f32` `NAN`, `INFINITY` and `NEG_INFINITY` constants
  (#3300).
- Allow constant expressions that don't fit in `i64` (#3301).
- Deduplicate derive traits added by the `add_derives` callback (#3296).
- Fix packed structs with flexible array members (#3305).
- Remove incorrect `size_t_is_usize` check (#3313).
- Prevent default derives for forward-declared types (#3110).
- Handle rustc version strings like `1.71.1-beta` and `1.71.1-nightly`
  (#3329).
- Centralize comment generation checks so comment options are respected
  everywhere (#445, #3330).
- Fix unnecessary transmute and unsafe warnings in bitfield codegen (#3335,
  #3388).
- Do not use the canonical declaration for enum type building (#3346).
- Allow zero-sized unions to be defined (#3348).
- Consolidate the `extern` block for functions and statics so shared symbols
  are only declared once (#3367, #3371).
- Propagate the implicit target to the macro fallback (#3382).
- Avoid an IR cycle for compiler-builtin ObjC typedefs shadowing themselves
  (#3387).
- Generate a `Debug` impl for new-type alias wrappers when the inner type
  only has a manual impl (#3411).
- Do not insert dummy fields into bitfields in cases where this would cause
  misalignment (#3431).
- Newtype aliases to c_void don't derive traits now (#3432).
## Security

# 0.72.1 (2025-08-31)

## Fixed

 * Fixed a bad interaction with upcoming clang 22 (#3278).

- Add the `--rust-edition` flag which allows to select which Rust edition to target. (#3002, #3013)
- Use `unsafe extern` instead of `extern` in blocks for any Rust target after 1.82. (#3015)
* Add the `ParseCallbacks::field_visibility` method to modify field visibility.
  actual visibility of the bitfields within the unit.

--===============6136305330158188665==--

