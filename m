Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.6927.1621509881143974856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 04:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IkKOU+HZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id j6so21284421lfr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 04:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+OyhK4Z+WR79q4+hnoQE1N5lMs5B4pAHe0yCkmrPfVU=;
        b=IkKOU+HZ24lOWfO4svMFXF+0Q5AF/UiycKGdBys6DO6UyQsK40vj3PtKuJy6Y02yC7
         H4TwCcMKxzFPmChXv1L8hAbmAw5KiD4UxWvYLdX0VlM5vtAAvUo+GLrZpXIFjkAgM66t
         x4fQg4epm4DouImuB6LqbfJT4G0OK6sl5h7YxeUtqwm1eHWOfQCkUQ8R5vOfhrqUBU8c
         d7BpuwpryXk7f/GHbiVUQl5O4zQYO9iyip04c33tHaFwQUNDW3DQjvRIz9NvbgL7ogKt
         va3OojSiVLWCfrDq8t5SBg6sjT1/Sbbd2st09hQ6A0CqDh4VKRpbdLsxU3YMAMCi39m0
         QPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+OyhK4Z+WR79q4+hnoQE1N5lMs5B4pAHe0yCkmrPfVU=;
        b=UOzkbsmfR7b8bBnUhuyPwBe1lTbLU95K/cTeCFtuHNJVu6S9lVpu91w3L3K9IoDtpO
         eOHDLFscO5U9EfHJSTfrVrjtb5OqVzvyPLI99i1PDDDEdUSy0h7X6VEB2hRdW/gFBdHs
         2cRZ0J17QO63eAdqkGm3N0ENAEJSoVhp4bfWgmViCHmzU5TB8gp+T7DW/PEpqK67PBkz
         QIit3pM2kdFbzi20PBYCtEOnf+5lxp3C7Sx3I2i0YkLlOQUIW+xlp7/Jh4J7lV6356zZ
         G5CLXmGPFN8uUX8xPusZrD1DYJFCJiu7NPbSPw5+16XuSHoRPRxSx9phzsbd2jo2Hq1h
         nHiA==
X-Gm-Message-State: AOAM532EymKL442y0TnO0BzRL1nu2DUMxr5bvfecxb/LzIZq4dN7q+Fc
	cu+kL70XHVpSPq7GQyjpqmG0rc8G6e/1ju02GlE=
X-Google-Smtp-Source: ABdhPJzGVeH7lBusGq0UEBeVpRpHvieflJugjgE4g3Yr5KsoW0D7VYp9WaOJIXQ5BUwopo9EK33qTuq3Rz3GumS3Ya4=
X-Received: by 2002:a05:6512:108a:: with SMTP id j10mr2069002lfg.242.1621509878862;
 Thu, 20 May 2021 04:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <8cff2d9b-51cc-e9f0-f1ac-b95b106e11ac@gmail.com>
In-Reply-To: <8cff2d9b-51cc-e9f0-f1ac-b95b106e11ac@gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Thu, 20 May 2021 16:54:26 +0530
Message-ID: <CANUMPcUWam9qK2KoD4uY1D4P9rLWxSSVpAwCmeCx788-uV03wQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/7] rust-testsuite.inc : Rust cross testing.
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Khem Raj,

Once the patches get approved will work on adding in meta-rust.

Regards,
Vinay

On Tue, May 18, 2021 at 3:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 5/17/21 3:35 AM, Vinay Kumar wrote:
> > Below list of functions are part of rust-testsuite.inc
> > setup_cargo_environment(): Build bootstrap and some early stage tools.
> > do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> > do_configure(): To generate config.toml
> > do_compile(): To build "remote-test-server" for qemutarget image.
> > do_check(): To execute testing by copying remote-test-server to qmutarget image.
> >
>
>
> some part of these series should go to meta-rust
>
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > ---
> >   meta/recipes-devtools/rust/rust-testsuite.inc | 166 ++++++++++++++++++
> >   1 file changed, 166 insertions(+)
> >   create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
> >
> > diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
> > new file mode 100644
> > index 0000000000..d1c5496da4
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rust/rust-testsuite.inc
> > @@ -0,0 +1,166 @@
> > +SUMMARY = "Rust testing"
> > +HOMEPAGE = "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
> > +SECTION = "test"
> > +LICENSE = "MIT | Apache-2.0"
> > +
> > +inherit rust
> > +inherit cargo_common
> > +
> > +DEPENDS += "file-native python3-native"
> > +EXCLUDE_FROM_WORLD = "1"
> > +
> > +# Path of target specification file "target-poky-linux.json"
> > +export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
> > +
> > +export FORCE_CRATE_HASH="${BB_TASKHASH}"
> > +
> > +# We don't want to use bitbakes vendoring because the rust sources do their
> > +# own vendoring.
> > +CARGO_DISABLE_BITBAKE_VENDORING = "1"
> > +
> > +# We can't use RUST_BUILD_SYS here because that may be "musl" if
> > +# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
> > +SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
> > +setup_cargo_environment () {
> > +    # The first step is to build bootstrap and some early stage tools,
> > +    # these are build for the same target as the snapshot, e.g.
> > +    # x86_64-unknown-linux-gnu.
> > +    # Later stages are build for the native target (i.e. target.x86_64-linux)
> > +    cargo_common_do_configure
> > +
> > +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
> > +    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
> > +}
> > +
> > +do_rust_setup_snapshot () {
> > +    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
> > +        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
> > +    done
> > +
> > +    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
> > +    # and fail without it there.
> > +    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
> > +    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
> > +}
> > +addtask rust_setup_snapshot after do_unpack before do_configure
> > +do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
> > +
> > +python do_configure() {
> > +    import json
> > +    from distutils.version import LooseVersion
> > +    try:
> > +        import configparser
> > +    except ImportError:
> > +        import ConfigParser as configparser
> > +
> > +    # toml is rather similar to standard ini like format except it likes values
> > +    # that look more JSON like. So for our purposes simply escaping all values
> > +    # as JSON seem to work fine.
> > +
> > +    e = lambda s: json.dumps(s)
> > +
> > +    config = configparser.RawConfigParser()
> > +
> > +    # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.ARCH-poky-linux]
> > +    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
> > +    config.add_section(target_section)
> > +
> > +    # Points to wrapper files which contain target specific compiler and linker commands.
> > +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
> > +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> > +    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
> > +
> > +    # If we don't do this rust-native will compile it's own llvm for BUILD.
> > +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> > +    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
> > +    config.add_section(target_section)
> > +
> > +    # Wrapper scripts of build system.
> > +    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
> > +    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> > +
> > +    # [llvm]
> > +    config.add_section("llvm")
> > +    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
> > +
> > +    # [rust]
> > +    config.add_section("rust")
> > +    config.set("rust", "rpath", e(True))
> > +    config.set("rust", "channel", e("stable"))
> > +
> > +    if LooseVersion(d.getVar("PV")) < LooseVersion("1.32.0"):
> > +        config.set("rust", "use-jemalloc", e(False))
> > +
> > +    # Whether or not to optimize the compiler and standard library
> > +    config.set("rust", "optimize", e(True))
> > +
> > +    # Emits extraneous output from tests to ensure that failures of the test
> > +    # harness are debuggable just from logfiles
> > +    config.set("rust", "verbose-tests", e(True))
> > +
> > +    # Override default linker cc.
> > +    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))
> > +
> > +    # [build]
> > +    config.add_section("build")
> > +    config.set("build", "submodules", e(False))
> > +    config.set("build", "docs", e(False))
> > +
> > +    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
> > +    config.set("build", "rustc", e(rustc))
> > +
> > +    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
> > +    config.set("build", "cargo", e(cargo))
> > +
> > +    config.set("build", "vendor", e(True))
> > +
> > +    targets = [d.getVar("TARGET_SYS", True)]
> > +    config.set("build", "target", e(targets))
> > +
> > +    hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
> > +    config.set("build", "host", e(hosts))
> > +
> > +    # We can't use BUILD_SYS since that is something the rust snapshot knows
> > +    # nothing about when trying to build some stage0 tools (like fabricate)
> > +    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
> > +
> > +    with open("config.toml", "w") as f:
> > +        config.write(f)
> > +
> > +    # set up ${WORKDIR}/cargo_home
> > +    bb.build.exec_func("setup_cargo_environment", d)
> > +}
> > +
> > +
> > +rust_runx () {
> > +    echo "COMPILE ${PN}" "$@"
> > +
> > +    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for a
> > +    # wide range of targets (not just TARGET). Yocto's settings for them will
> > +    # be inappropriate, avoid using.
> > +    unset CFLAGS
> > +    unset LDFLAGS
> > +    unset CXXFLAGS
> > +    unset CPPFLAGS
> > +
> > +    oe_cargo_fix_env
> > +
> > +    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
> > +}
> > +rust_runx[vardepsexclude] += "PARALLEL_MAKE"
> > +
> > +do_compile () {
> > +
> > +    rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
> > +}
> > +
> > +do_check[dirs] += "${B}"
> > +do_check[nostamp] = "1"
> > +do_check () {
> > +    scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
> > +    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"
> > +
> > +    export TEST_DEVICE_ADDR="127.0.0.1:12345"
> > +    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
> > +}
> > +addtask do_check after do_compile
> >
> >
> >
> > 
> >
