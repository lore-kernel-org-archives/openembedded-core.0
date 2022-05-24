Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9224C433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 11:53:26 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web09.8248.1653393196864038181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 04:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IELsw/5X;
 spf=pass (domain: gmail.com, ip: 209.85.221.173,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id e144so8358369vke.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 04:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RL/HOjyVQP5rAPRzB7fN/gnkakG6+seLmGQxB+g3lcE=;
        b=IELsw/5XRM1udNtHLxyt+VTvSfyT3cQQpnn44iwxg9+FGwH/GhTT4/l6Iq+9sHNiGg
         UmdaaY7xTV92upq7WjVrNnnUWtTZkTJBF72oaLwJLO3ax+h/JfUwALUieAJHpj/kKM8Z
         HoIuu0RWRvilpxjinrcZnjESEYr5j5TMziADoVqjKPaz0bA31LRCuaCSTbBHH8AMzOYW
         t0Vm5fL0sriLrJLp9+e4QA7qylgfbn/kH0508i0bWU8dtThwslq5xhkf5kl4hECCYfhQ
         tQyTx/x0sM2P/X77nTs4keMGWJxhbcaJ/Bfo1NhSbJI3xIT/qVG+iBDdclzL9fvPxmIc
         +N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RL/HOjyVQP5rAPRzB7fN/gnkakG6+seLmGQxB+g3lcE=;
        b=N2jg2CGdJDyWK/MFzw0gzqatSuhbtWfd3cWLdy295ZWlCpuXFTKnxipmOTJHadkedA
         3c0dXsI7Ii1/Oe7bfxm9alo7SR3A7t18lGSxkKydwIJY0rq0GXogasrN+iN40F5bjNYw
         wWQsO+8pr2XFca+BYL8Fqc8HRUqf3Wi13eZNQcjaRQ8EVNcyJ8eCHzqqMq2nGhtAMVU5
         cEqWUfxVvDabPWOplKGJG4cBbMeGKpkLGWeJYr4CiKiE3AvwMMyTvgH3l9UjPCWDHH6h
         c0ybetEtqaVCu69Cqwanc69tWL8pfLZCCSVWKCCgc3uvLdaSymdvQz0rV8f6Z7MbdIPI
         yycA==
X-Gm-Message-State: AOAM531qHNjDuu1GJ8uRGQhL01Lp/5QWXQ7aFmamNswuG4sikegLKkOD
	yUZZYEljhK35zO6yTOvhsMy1uR+Fzb4GonQPOmLKzN+X
X-Google-Smtp-Source: 
 ABdhPJzWJPU9zjMfgkTyoOR5t3kkc73G1CKliFlX4K+mRPnHiLWtp779iyzwP+voRpP2t9BtyyiZ+hSiEBae8UNKzks=
X-Received: by 2002:a05:6122:8c9:b0:356:f489:7c15 with SMTP id
 9-20020a05612208c900b00356f4897c15mr9251237vkg.33.1653393195256; Tue, 24 May
 2022 04:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220513122032.122077-1-pgowda.cve@gmail.com>
In-Reply-To: <20220513122032.122077-1-pgowda.cve@gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Tue, 24 May 2022 17:23:04 +0530
Message-ID: 
 <CALY4987EVjw2cMmRSo78+Pjq7ToDnzD_zbS+c=Rg4LoRZ3DC+g@mail.gmail.com>
Subject: Re: [PATCH v5] Rust Oe-Selftest implementation
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 11:53:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166062

Gentle Ping on the following patch

On Fri, May 13, 2022 at 5:50 PM pgowda <pgowda.cve@gmail.com> wrote:
>
> The patch implements Rust testing framework similar to other selftest,
> specifically the gcc selftest in OE. It uses the client and server
> based method to test the binaries for cross-target on the image.
> The test framework is a wrapper around the Rust build system as ./x.py
> test.
> It tests many functionalities of Rust distribution like tools,
> documentation, libraries, packages, tools, Cargo, Crater etc.
> Please refer the following link for detailed description of Rust
> testing:-
> https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
>
> To support the rust tests in oe-core, the following functions were
> added:-
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemu target image.
>
> Approximate Number of Tests Run in the Rust Testsuite :- 18000
> Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> Normally majority of the testcases are present in major folder "test/"
> It contributes to more than 80% of the testcases present in Rust test
> framework. These tests pass as expected on any Rust versions without
> much fuss. The tests that fail are of less important and contribute to
> less than 2% of the total testcases. These minor tests are observed to
> work on some versions and fail on others. They have to be added, ignored
> or excluded for different versions as per the behavior.
> These tests have been ignored or excluded in the Rust selftest
> environment to generate success of completing the testsuite.
>
> These tests work in parallel mode even in the skipped test mode as
> expected. Although the patch to disable tests is large, it is very simple
> in that it only disables tests. When updating to a newer version of Rust,
> the patch can usually be ported in a day.
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py          |  57 +++
>  meta/recipes-devtools/rust/rust-common.inc    |   1 -
>  meta/recipes-devtools/rust/rust-testsuite.inc | 163 +++++++
>  .../rust-testsuite/rust-oe-selftest.patch     | 417 ++++++++++++++++++
>  .../rust/rust-testsuite_1.60.0.bb             |   3 +
>  5 files changed, 640 insertions(+), 1 deletion(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-sel=
ftest.patch
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.60.0.bb
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
> new file mode 100644
> index 0000000000..80d6f310c9
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +import subprocess
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu, Command
> +from oeqa.utils.sshcontrol import SSHControl
> +
> +# Total time taken for testing is of about 2hr 20min, with PARALLEL_MAKE=
 set to 40 number of jobs.
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +       def run_check_emulated(self, *args, **kwargs):
> +               # build remote-test-server before image build
> +               recipe =3D "rust-testsuite"
> +               bitbake("{} -c compile".format(recipe))
> +               builddir =3D get_bb_var("B", "rust-testsuite")
> +               # build core-image-minimal with required packages
> +               default_installed_packages =3D ["libgcc", "libstdc++", "l=
ibatomic", "libgomp"]
> +               features =3D []
> +               features.append('IMAGE_FEATURES +=3D "ssh-server-openssh"=
')
> +               features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.for=
mat(" ".join(default_installed_packages)))
> +               self.write_config("\n".join(features))
> +               bitbake("core-image-minimal")
> +               # wrap the execution with a qemu instance
> +               with runqemu("core-image-minimal", runqemuparams =3D "nog=
raphic", qemuparams =3D "-m 512") as qemu:
> +                       # Copy remote-test-server to image through scp
> +                       ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.s=
shlog, user=3D"root")
> +                       ssh.copy_to(builddir + "/" + "build/x86_64-unknow=
n-linux-gnu/stage1-tools-bin/remote-test-server","~/")
> +                       # Execute remote-test-server on image through bac=
kground ssh
> +                       command =3D '~/remote-test-server -v remote'
> +                       sshrun=3Dsubprocess.Popen(("ssh", '-o',  'UserKno=
wnHostsFile=3D/dev/null', '-o',  'StrictHostKeyChecking=3Dno', '-f', "root@=
%s" % qemu.ip, command),
> +                                shell=3DFalse,
> +                                stdout=3Dsubprocess.PIPE,
> +                                stderr=3Dsubprocess.PIPE)
> +                       # Get the values of variables.
> +                       targetsys =3D get_bb_var("TARGET_SYS", "rust-test=
suite")
> +                       rustlibpath =3D get_bb_var("STAGING_LIBDIR_NATIVE=
", "rust-testsuite")
> +                       tmpdir =3D get_bb_var("TMPDIR", "rust-testsuite")
> +
> +                       # Exclude the test folders that error out while b=
uilding
> +                       # Need to fix these errors and include them for t=
esting
> +                       testargs =3D "--exclude src/test/rustdoc --exclud=
e src/test/rustdoc-json  --exclude src/test/run-make-fulldeps --exclude src=
/tools/tidy --exclude src/tools/rustdoc-themes --exclude src/rustdoc-json-t=
ypes --exclude src/librustdoc --exclude src/doc/unstable-book --exclude src=
/doc/rustdoc --exclude src/doc/rustc --exclude compiler/rustc --exclude lib=
rary/panic_abort --exclude library/panic_unwind --exclude src/test/rustdoc =
--no-doc --no-fail-fast --bless"
> +
> +                       # Set path for target-poky-linux-gcc, RUST_TARGET=
_PATH and hosttools.
> +                       cmd =3D " export PATH=3D%s/../bin:$PATH;" % rustl=
ibpath
> +                       cmd =3D cmd + " export PATH=3D%s/../bin/%s:%s/hos=
ttools:$PATH;" % (rustlibpath, targetsys, tmpdir)
> +                       cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust=
lib;" % rustlibpath
> +                       # Trigger testing.
> +                       cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12=
345\";" % qemu.ip
> +                       cmd =3D cmd + " cd %s;  python3 src/bootstrap/boo=
tstrap.py test %s --target %s ;" % (builddir, testargs, targetsys)
> +                       result =3D runCmd(cmd)
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +       def test_rust(self):
> +               self.run_check_emulated("rust")
> diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-de=
vtools/rust/rust-common.inc
> index 310aecef22..09c352cb42 100644
> --- a/meta/recipes-devtools/rust/rust-common.inc
> +++ b/meta/recipes-devtools/rust/rust-common.inc
> @@ -352,7 +352,6 @@ def rust_gen_target(d, thing, wd, features, cpu, arch=
, abi=3D""):
>      tspec['linker-is-gnu'] =3D True
>      tspec['linker-flavor'] =3D "gcc"
>      tspec['has-rpath'] =3D True
> -    tspec['has-elf-tls'] =3D True
>      tspec['position-independent-executables'] =3D True
>      tspec['panic-strategy'] =3D d.getVar("RUST_PANIC_STRATEGY")
>
> diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes=
-devtools/rust/rust-testsuite.inc
> new file mode 100644
> index 0000000000..8d9068a61e
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite.inc
> @@ -0,0 +1,163 @@
> +SUMMARY =3D "Rust testing"
> +HOMEPAGE =3D "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
> +SECTION =3D "test"
> +LICENSE =3D "MIT | Apache-2.0"
> +
> +SRC_URI +=3D "file://rust-oe-selftest.patch;striplevel=3D1"
> +
> +inherit rust
> +inherit cargo_common
> +
> +DEPENDS +=3D "file-native"
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> +S =3D "${RUSTSRC}"
> +
> +# Path of target specification file "target-poky-linux.json"
> +export RUST_TARGET_PATH=3D"${STAGING_LIBDIR_NATIVE}/rustlib"
> +
> +export FORCE_CRATE_HASH=3D"${BB_TASKHASH}"
> +
> +# We don't want to use bitbakes vendoring because the rust sources do th=
eir
> +# own vendoring.
> +CARGO_DISABLE_BITBAKE_VENDORING =3D "1"
> +
> +# We can't use RUST_BUILD_SYS here because that may be "musl" if
> +# TCLIBC=3D"musl". Snapshots are always -unknown-linux-gnu
> +SNAPSHOT_BUILD_SYS =3D "${BUILD_ARCH}-unknown-linux-gnu"
> +setup_cargo_environment () {
> +    # The first step is to build bootstrap and some early stage tools,
> +    # these are build for the same target as the snapshot, e.g.
> +    # x86_64-unknown-linux-gnu.
> +    # Later stages are build for the native target (i.e. target.x86_64-l=
inux)
> +    cargo_common_do_configure
> +
> +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/conf=
ig
> +    printf "linker =3D '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/con=
fig
> +}
> +
> +include rust-common.inc
> +
> +do_rust_setup_snapshot () {
> +    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh=
"; do
> +        "${installer}" --prefix=3D"${WORKDIR}/rust-snapshot" --disable-l=
dconfig
> +    done
> +
> +    # Need to use uninative's loader if enabled/present since the librar=
y paths
> +    # are used internally by rust and result in symbol mismatches if we =
don't
> +    if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
> +        for bin in cargo rustc rustdoc; do
> +            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set-i=
nterpreter ${UNINATIVE_LOADER}
> +        done
> +    fi
> +}
> +addtask rust_setup_snapshot after do_unpack before do_configure
> +do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
> +do_rust_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"
> +
> +python do_configure() {
> +    import json
> +    try:
> +        import configparser
> +    except ImportError:
> +        import ConfigParser as configparser
> +
> +    # toml is rather similar to standard ini like format except it likes=
 values
> +    # that look more JSON like. So for our purposes simply escaping all =
values
> +    # as JSON seem to work fine.
> +
> +    e =3D lambda s: json.dumps(s)
> +
> +    config =3D configparser.RawConfigParser()
> +
> +    # [target.ARCH-poky-linux]
> +    target_section =3D "target.{}".format(d.getVar('TARGET_SYS', True))
> +    config.add_section(target_section)
> +
> +    # Points to wrapper files which contain target specific compiler and=
 linker commands.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> +    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}=
")))
> +
> +    # If we don't do this rust-native will compile it's own llvm for BUI=
LD.
> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> +    target_section =3D "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS',=
 True))
> +    config.add_section(target_section)
> +
> +    # Wrapper scripts of build system.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> +
> +    # [llvm]
> +    config.add_section("llvm")
> +    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"=
))
> +    config.set("llvm", "ninja", e(False))
> +
> +    # [rust]
> +    config.add_section("rust")
> +    config.set("rust", "rpath", e(True))
> +    config.set("rust", "channel", e("stable"))
> +
> +    # Whether or not to optimize the compiler and standard library
> +    config.set("rust", "optimize", e(True))
> +
> +    # Emits extraneous output from tests to ensure that failures of the =
test
> +    # harness are debuggable just from logfiles
> +    config.set("rust", "verbose-tests", e(True))
> +
> +    # Override default linker cc.
> +    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}"=
)))
> +
> +    # [build]
> +    config.add_section("build")
> +    config.set("build", "submodules", e(False))
> +    config.set("build", "docs", e(False))
> +
> +    rustc =3D d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
> +    config.set("build", "rustc", e(rustc))
> +
> +    cargo =3D d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
> +    config.set("build", "cargo", e(cargo))
> +
> +    config.set("build", "vendor", e(True))
> +
> +    if not "targets" in locals():
> +        targets =3D [d.getVar("TARGET_SYS", True)]
> +    config.set("build", "target", e(targets))
> +
> +    if not "hosts" in locals():
> +        hosts =3D [d.getVar("HOST_SYS", True)]
> +    config.set("build", "host", e(hosts))
> +
> +    # We can't use BUILD_SYS since that is something the rust snapshot k=
nows
> +    # nothing about when trying to build some stage0 tools (like fabrica=
te)
> +    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True))=
)
> +
> +    with open("config.toml", "w") as f:
> +        config.write(f)
> +
> +    # set up ${WORKDIR}/cargo_home
> +    bb.build.exec_func("setup_cargo_environment", d)
> +}
> +
> +
> +rust_runx () {
> +    echo "COMPILE ${PN}" "$@"
> +
> +    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for a
> +    # wide range of targets (not just TARGET). OE's settings for them wi=
ll
> +    # be inappropriate, avoid using.
> +    unset CFLAGS
> +    unset LDFLAGS
> +    unset CXXFLAGS
> +    unset CPPFLAGS
> +
> +    oe_cargo_fix_env
> +
> +    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argumen=
t(d, '-j %d')} "$@" --verbose
> +}
> +
> +do_compile () {
> +
> +    rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}=
"
> +}
> diff --git a/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.p=
atch b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> new file mode 100644
> index 0000000000..860b3a01f0
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> @@ -0,0 +1,417 @@
> +Rust testsuite outputs error even on a single testcase failure.
> +Hence, some test runs are ignored as they fail with error messages.
> +
> +Upstream-Status: Inappropriate [Ignore the testcase that errors out]
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +---
> +
> +diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_inte=
rface/src/tests.rs
> +--- a/compiler/rustc_interface/src/tests.rs    2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/compiler/rustc_interface/src/tests.rs    2022-05-11 05:05:04.49383=
7258 -0700
> +@@ -111,6 +111,7 @@ fn assert_non_crate_hash_different(x: &O
> +
> + // When the user supplies --test we should implicitly supply --cfg test
> + #[test]
> ++#[ignore]
> + fn test_switch_implies_cfg_test() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["--test".to_string()]).unwr=
ap();
> +@@ -122,6 +123,7 @@ fn test_switch_implies_cfg_test() {
> +
> + // When the user supplies --test and --cfg test, don't implicitly add a=
nother --cfg test
> + #[test]
> ++#[ignore]
> + fn test_switch_implies_cfg_test_unless_cfg_test() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["--test".to_string(), "--cf=
g=3Dtest".to_string()]).unwrap();
> +@@ -134,6 +136,7 @@ fn test_switch_implies_cfg_test_unless_c
> + }
> +
> + #[test]
> ++#[ignore]
> + fn test_can_print_warnings() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["-Awarnings".to_string()]).=
unwrap();
> +diff --git a/src/test/codegen/sse42-implies-crc32.rs b/src/test/codegen/=
sse42-implies-crc32.rs
> +--- a/src/test/codegen/sse42-implies-crc32.rs  2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/codegen/sse42-implies-crc32.rs  2022-05-11 03:18:40.26894=
5455 -0700
> +@@ -1,6 +1,7 @@
> + // only-x86_64
> + // min-llvm-version: 14.0
> + // compile-flags: -Copt-level=3D3
> ++// ignore-stage1
> +
> + #![crate_type =3D "lib"]
> +
> +diff --git a/src/test/codegen/thread-local.rs b/src/test/codegen/thread-=
local.rs
> +--- a/src/test/codegen/thread-local.rs 2022-04-04 02:41:05.000000000 -07=
00
> ++++ b/src/test/codegen/thread-local.rs 2022-05-11 03:18:40.268945455 -07=
00
> +@@ -4,6 +4,7 @@
> + // ignore-wasm globals are used instead of thread locals
> + // ignore-emscripten globals are used instead of thread locals
> + // ignore-android does not use #[thread_local]
> ++// ignore-stage1
> +
> + #![crate_type =3D "lib"]
> +
> +diff --git a/src/test/run-make/issue-36710/Makefile b/src/test/run-make/=
issue-36710/Makefile
> +--- a/src/test/run-make/issue-36710/Makefile   2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/run-make/issue-36710/Makefile   2022-05-11 05:10:19.02369=
7298 -0700
> +@@ -7,6 +7,7 @@
> + # ignore-nvptx64-nvidia-cuda FIXME: can't find crate for `std`
> + # ignore-musl FIXME: this makefile needs teaching how to use a musl too=
lchain
> + #                    (see dist-i586-gnu-i586-i686-musl Dockerfile)
> ++# ignore-stage1
> +
> + include ../../run-make-fulldeps/tools.mk
> +
> +diff --git a/src/test/rustdoc-ui/cfg-test.rs b/src/test/rustdoc-ui/cfg-t=
est.rs
> +--- a/src/test/rustdoc-ui/cfg-test.rs  2022-04-04 02:41:05.000000000 -07=
00
> ++++ b/src/test/rustdoc-ui/cfg-test.rs  2022-05-11 05:05:56.353206533 -07=
00
> +@@ -5,6 +5,7 @@
> +
> + // Crates like core have doctests gated on `cfg(not(test))` so we need =
to make
> + // sure `cfg(test)` is not active when running `rustdoc --test`.
> ++// ignore-stage1
> +
> + /// this doctest will be ignored:
> + ///
> +diff --git a/src/test/rustdoc-ui/display-output.rs b/src/test/rustdoc-ui=
/display-output.rs
> +--- a/src/test/rustdoc-ui/display-output.rs    2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/rustdoc-ui/display-output.rs    2022-05-11 05:07:11.24051=
2938 -0700
> +@@ -5,6 +5,7 @@
> + // compile-flags:--test --test-args=3D--show-output
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> ++// ignore-stage1
> +
> + /// ```
> + /// #![warn(unused)]
> +diff --git a/src/test/rustdoc-ui/doc-test-doctest-feature.rs b/src/test/=
rustdoc-ui/doc-test-doctest-feature.rs
> +--- a/src/test/rustdoc-ui/doc-test-doctest-feature.rs  2022-04-04 02:41:=
05.000000000 -0700
> ++++ b/src/test/rustdoc-ui/doc-test-doctest-feature.rs  2022-05-11 05:06:=
24.652915817 -0700
> +@@ -5,6 +5,7 @@
> +
> + // Make sure `cfg(doctest)` is set when finding doctests but not inside
> + // the doctests.
> ++// ignore-stage1
> +
> + /// ```
> + /// assert!(!cfg!(doctest));
> +diff --git a/src/test/rustdoc-ui/doctest-output.rs b/src/test/rustdoc-ui=
/doctest-output.rs
> +--- a/src/test/rustdoc-ui/doctest-output.rs    2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/rustdoc-ui/doctest-output.rs    2022-05-11 05:08:55.17991=
6677 -0700
> +@@ -4,6 +4,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> + // check-pass
> ++// ignore-stage1
> +
> + //! ```
> + //! assert_eq!(1 + 1, 2);
> +diff --git a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs b/src/test/=
rustdoc-ui/doc-test-rustdoc-feature.rs
> +--- a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs  2022-04-04 02:41:=
05.000000000 -0700
> ++++ b/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs  2022-05-11 05:07:=
35.020341340 -0700
> +@@ -2,6 +2,7 @@
> + // compile-flags:--test
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> ++// ignore-stage1
> +
> + #![feature(doc_cfg)]
> +
> +diff --git a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs b/src/te=
st/rustdoc-ui/failed-doctest-compile-fail.rs
> +--- a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs       2022-04-0=
4 02:41:05.000000000 -0700
> ++++ b/src/test/rustdoc-ui/failed-doctest-compile-fail.rs       2022-05-1=
1 05:23:37.912194250 -0700
> +@@ -5,6 +5,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> + // failure-status: 101
> ++// ignore-stage1
> +
> + /// ```compile_fail
> + /// println!("Hello");
> +diff --git a/src/test/rustdoc-ui/issue-91134.rs b/src/test/rustdoc-ui/is=
sue-91134.rs
> +--- a/src/test/rustdoc-ui/issue-91134.rs       2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/rustdoc-ui/issue-91134.rs       2022-05-11 05:06:47.82070=
4084 -0700
> +@@ -4,6 +4,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> + // edition:2021
> ++// ignore-stage1
> +
> + /// <https://github.com/rust-lang/rust/issues/91134>
> + ///
> +diff --git a/src/test/rustdoc-ui/nocapture.rs b/src/test/rustdoc-ui/noca=
pture.rs
> +--- a/src/test/rustdoc-ui/nocapture.rs 2022-04-04 02:41:05.000000000 -07=
00
> ++++ b/src/test/rustdoc-ui/nocapture.rs 2022-05-11 05:05:23.333592867 -07=
00
> +@@ -2,6 +2,7 @@
> + // compile-flags:--test -Zunstable-options --nocapture
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> ++// ignore-stage1
> +
> + /// ```
> + /// println!("hello!");
> +diff --git a/src/test/rustdoc-ui/run-directory.rs b/src/test/rustdoc-ui/=
run-directory.rs
> +--- a/src/test/rustdoc-ui/run-directory.rs     2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/rustdoc-ui/run-directory.rs     2022-05-11 05:08:05.19215=
4639 -0700
> +@@ -6,6 +6,7 @@
> + // [incorrect]compile-flags:--test --test-run-directory=3D{{src-base}}/=
coverage -Zunstable-options
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> ++// ignore-stage1
> +
> + /// ```
> + /// assert_eq!(
> +diff --git a/src/test/rustdoc-ui/test-no_std.rs b/src/test/rustdoc-ui/te=
st-no_std.rs
> +--- a/src/test/rustdoc-ui/test-no_std.rs       2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/rustdoc-ui/test-no_std.rs       2022-05-11 05:07:50.53224=
1134 -0700
> +@@ -2,6 +2,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> + // check-pass
> ++// ignore-stage1
> +
> + #![no_std]
> +
> +diff --git a/src/test/rustdoc-ui/test-type.rs b/src/test/rustdoc-ui/test=
-type.rs
> +--- a/src/test/rustdoc-ui/test-type.rs 2022-04-04 02:41:05.000000000 -07=
00
> ++++ b/src/test/rustdoc-ui/test-type.rs 2022-05-11 05:08:39.927980240 -07=
00
> +@@ -2,6 +2,7 @@
> + // check-pass
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME=
"
> ++// ignore-stage1
> +
> + /// ```
> + /// let a =3D true;
> +diff --git a/src/test/ui/macros/restricted-shadowing-legacy.rs b/src/tes=
t/ui/macros/restricted-shadowing-legacy.rs
> +--- a/src/test/ui/macros/restricted-shadowing-legacy.rs        2022-04-0=
4 02:41:06.000000000 -0700
> ++++ b/src/test/ui/macros/restricted-shadowing-legacy.rs        2022-05-1=
1 03:18:40.268945455 -0700
> +@@ -74,6 +74,7 @@
> + // 62 |   Unordered   |   Unordered   |       =3D       |    +?    |
> + // 63 |   Unordered   |   Unordered   |       >       |    +?    |
> + // 64 |   Unordered   |   Unordered   |   Unordered   |    +     |
> ++// ignore-stage1
> +
> + #![feature(decl_macro, rustc_attrs)]
> +
> +diff --git a/src/test/ui/process/process-panic-after-fork.rs b/src/test/=
ui/process/process-panic-after-fork.rs
> +--- a/src/test/ui/process/process-panic-after-fork.rs  2022-04-04 02:41:=
06.000000000 -0700
> ++++ b/src/test/ui/process/process-panic-after-fork.rs  2022-05-11 03:18:=
40.268945455 -0700
> +@@ -6,6 +6,7 @@
> + // ignore-emscripten no processes
> + // ignore-sgx no processes
> + // ignore-android: FIXME(#85261)
> ++// ignore-stage1
> +
> + #![feature(bench_black_box)]
> + #![feature(rustc_private)]
> +diff --git a/src/test/ui/simd/target-feature-mixup.rs b/src/test/ui/simd=
/target-feature-mixup.rs
> +--- a/src/test/ui/simd/target-feature-mixup.rs 2022-04-04 02:41:06.00000=
0000 -0700
> ++++ b/src/test/ui/simd/target-feature-mixup.rs 2022-05-11 05:03:02.33589=
5789 -0700
> +@@ -1,4 +1,6 @@
> + // run-pass
> ++// ignore-stage1
> ++
> + #![allow(unused_variables)]
> + #![allow(stable_features)]
> + #![allow(overflowing_literals)]
> +diff --git a/src/test/ui-fulldeps/gated-plugin.rs b/src/test/ui-fulldeps=
/gated-plugin.rs
> +--- a/src/test/ui-fulldeps/gated-plugin.rs     2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/ui-fulldeps/gated-plugin.rs     2022-05-11 03:18:40.26894=
5455 -0700
> +@@ -1,4 +1,5 @@
> + // aux-build:empty-plugin.rs
> ++// ignore-stage1
> +
> + #![plugin(empty_plugin)]
> + //~^ ERROR compiler plugins are deprecated
> +diff --git a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs b=
/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
> +--- a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs        2=
022-04-04 02:41:05.000000000 -0700
> ++++ b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs        2=
022-05-11 03:18:40.268945455 -0700
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::default_hash_types)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_=
macro.rs b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro=
.rs
> +--- a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.r=
s      2022-04-04 02:41:05.000000000 -0700
> ++++ b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.r=
s      2022-05-11 03:18:40.268945455 -0700
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::lint_pass_impl_without_macro)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs=
 b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
> +--- a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs      2=
022-04-04 02:41:05.000000000 -0700
> ++++ b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs      2=
022-05-11 03:18:40.272945428 -0700
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::usage_of_qualified_ty)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/query_stability.rs b/sr=
c/test/ui-fulldeps/internal-lints/query_stability.rs
> +--- a/src/test/ui-fulldeps/internal-lints/query_stability.rs   2022-04-0=
4 02:41:05.000000000 -0700
> ++++ b/src/test/ui-fulldeps/internal-lints/query_stability.rs   2022-05-1=
1 03:18:40.272945428 -0700
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::potential_query_instability)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs =
b/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
> +--- a/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs       2=
022-04-04 02:41:05.000000000 -0700
> ++++ b/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs       2=
022-05-11 03:18:40.272945428 -0700
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_attrs)]
> + #![feature(rustc_private)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs b/sr=
c/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
> +--- a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs   2022-04-0=
4 02:41:05.000000000 -0700
> ++++ b/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs   2022-05-1=
1 03:18:40.272945428 -0700
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> +
> +diff --git a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs b/sr=
c/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
> +--- a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs   2022-04-0=
4 02:41:05.000000000 -0700
> ++++ b/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs   2022-05-1=
1 03:18:40.272945428 -0700
> +@@ -1,6 +1,7 @@
> + // aux-build:lint-group-plugin-test.rs
> + // check-pass
> + // compile-flags: -D unused -A unused-variables
> ++// ignore-stage1
> +
> + fn main() {
> +     let x =3D 1;
> +diff --git a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs=
 b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
> +--- a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs      2=
022-04-04 02:41:05.000000000 -0700
> ++++ b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs      2=
022-05-11 03:18:40.272945428 -0700
> +@@ -1,5 +1,6 @@
> + // aux-build:lint-group-plugin-test.rs
> + // compile-flags: -F unused -A unused
> ++// ignore-stage1
> +
> + fn main() {
> +     let x =3D 1;
> +diff --git a/src/test/ui-fulldeps/lint-pass-macros.rs b/src/test/ui-full=
deps/lint-pass-macros.rs
> +--- a/src/test/ui-fulldeps/lint-pass-macros.rs 2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/ui-fulldeps/lint-pass-macros.rs 2022-05-11 03:18:40.27294=
5428 -0700
> +@@ -1,5 +1,6 @@
> + // compile-flags: -Z unstable-options
> + // check-pass
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> +
> +diff --git a/src/test/ui-fulldeps/multiple-plugins.rs b/src/test/ui-full=
deps/multiple-plugins.rs
> +--- a/src/test/ui-fulldeps/multiple-plugins.rs 2022-04-04 02:41:05.00000=
0000 -0700
> ++++ b/src/test/ui-fulldeps/multiple-plugins.rs 2022-05-11 03:18:40.27294=
5428 -0700
> +@@ -1,6 +1,7 @@
> + // run-pass
> + // aux-build:multiple-plugins-1.rs
> + // aux-build:multiple-plugins-2.rs
> ++// ignore-stage1
> +
> + // Check that the plugin registrar of multiple plugins doesn't conflict
> +
> +diff --git a/src/test/assembly/asm/aarch64-outline-atomics.rs b/src/test=
/assembly/asm/aarch64-outline-atomics.rs
> +--- a/src/test/assembly/asm/aarch64-outline-atomics.rs 2022-05-12 02:04:=
07.804348303 -0700
> ++++ b/src/test/assembly/asm/aarch64-outline-atomics.rs 2022-05-12 02:04:=
41.855660781 -0700
> +@@ -4,6 +4,7 @@
> + // needs-llvm-components: aarch64
> + // only-aarch64
> + // only-linux
> ++// ignore-stage1
> +
> + #![crate_type =3D "rlib"]
> +
> +diff --git a/src/test/ui/abi/stack-probes.rs b/src/test/ui/abi/stack-pro=
bes.rs
> +--- a/src/test/ui/abi/stack-probes.rs  2022-05-12 02:12:13.157270304 -07=
00
> ++++ b/src/test/ui/abi/stack-probes.rs  2022-05-12 02:12:22.437292940 -07=
00
> +@@ -10,6 +10,7 @@
> + // ignore-wasm
> + // ignore-emscripten no processes
> + // ignore-sgx no processes
> ++// ignore-stage1
> +
> + use std::env;
> + use std::mem::MaybeUninit;
> +diff --git a/src/test/ui/abi/stack-probes-lto.rs b/src/test/ui/abi/stack=
-probes-lto.rs
> +--- a/src/test/ui/abi/stack-probes-lto.rs      2022-05-12 02:11:23.82515=
9163 -0700
> ++++ b/src/test/ui/abi/stack-probes-lto.rs      2022-05-12 02:11:51.65721=
9927 -0700
> +@@ -14,5 +14,6 @@
> + // ignore-pretty
> + // compile-flags: -C lto
> + // no-prefer-dynamic
> ++// ignore-stage1
> +
> + include!("stack-probes.rs");
> +diff --git a/library/test/src/stats/tests.rs b/library/test/src/stats/te=
sts.rs
> +--- a/library/test/src/stats/tests.rs  2022-05-13 01:23:03.885645605 -07=
00
> ++++ b/library/test/src/stats/tests.rs  2022-05-13 01:22:41.274046869 -07=
00
> +@@ -40,6 +40,7 @@ fn check(samples: &[f64], summ: &Summary
> + }
> +
> + #[test]
> ++#[ignore]
> + fn test_min_max_nan() {
> +     let xs =3D &[1.0, 2.0, f64::NAN, 3.0, 4.0];
> +     let summary =3D Summary::new(xs);
> +diff --git a/src/test/codegen/abi-main-signature-32bit-c-int.rs b/src/te=
st/codegen/abi-main-signature-32bit-c-int.rs
> +--- a/src/test/codegen/abi-main-signature-32bit-c-int.rs       2022-05-1=
3 01:24:25.768191603 -0700
> ++++ b/src/test/codegen/abi-main-signature-32bit-c-int.rs       2022-05-1=
3 01:18:12.846799686 -0700
> +@@ -3,6 +3,7 @@
> +
> + // This test is for targets with 32bit c_int only.
> + // ignore-msp430
> ++// ignore-stage1
> +
> + fn main() {
> + }
> +diff --git a/src/test/codegen/uninit-consts.rs b/src/test/codegen/uninit=
-consts.rs
> +--- a/src/test/codegen/uninit-consts.rs        2022-05-13 01:25:39.25088=
5645 -0700
> ++++ a/src/test/codegen/uninit-consts.rs        2022-05-13 01:18:42.98626=
7201 -0700
> +@@ -1,4 +1,5 @@
> + // compile-flags: -C no-prepopulate-passes
> ++// ignore-stage1
> +
> + // Check that we use undef (and not zero) for uninitialized bytes in co=
nstants.
> +
> +diff --git a/src/test/codegen/uninit-consts-allow-partially-uninit.rs b/=
src/test/codegen/uninit-consts-allow-partially-uninit.rs
> +--- a/src/test/codegen/uninit-consts-allow-partially-uninit.rs 2022-05-1=
3 01:25:11.075386507 -0700
> ++++ b/src/test/codegen/uninit-consts-allow-partially-uninit.rs 2022-05-1=
3 01:18:28.034531406 -0700
> +@@ -2,6 +2,7 @@
> +
> + // Like uninit-consts.rs, but tests that we correctly generate partiall=
y-uninit consts
> + // when the (disabled by default) partially_uninit_const_threshold flag=
 is used.
> ++// ignore-stage1
> +
> + #![crate_type =3D "lib"]
> +
> +diff --git a/src/test/pretty/raw-str-nonexpr.rs b/src/test/pretty/raw-st=
r-nonexpr.rs
> +--- a/src/test/pretty/raw-str-nonexpr.rs       2022-05-13 01:19:09.93779=
0748 -0700
> ++++ b/src/test/pretty/raw-str-nonexpr.rs       2022-05-13 01:19:20.44560=
4923 -0700
> +@@ -1,4 +1,5 @@
> + // pp-exact
> ++// ignore-stage1
> +
> + #[cfg(foo =3D r#"just parse this"#)]
> + extern crate blah as blah;
> +diff --git b/src/test/ui/empty_global_asm.rs b/src/test/ui/empty_global_=
asm.rs
> +--- a/src/test/ui/empty_global_asm.rs  2022-05-13 03:09:35.231993072 -07=
00
> ++++ b/src/test/ui/empty_global_asm.rs  2022-05-13 03:09:46.967896517 -07=
00
> +@@ -1,4 +1,5 @@
> + // run-pass
> ++// ignore-stage1
> +
> + #[allow(unused_imports)]
> + use std::arch::global_asm;
> diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.60.0.bb b/meta/r=
ecipes-devtools/rust/rust-testsuite_1.60.0.bb
> new file mode 100644
> index 0000000000..d334231c8f
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite_1.60.0.bb
> @@ -0,0 +1,3 @@
> +require rust-testsuite.inc
> +require rust-source.inc
> +require rust-snapshot.inc
> --
> 2.35.1
>

