Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.17339.1621249506954910885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qORC0lKY;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id q7so6830836lfr.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T57MT6zVWvwp0Z4zcsEC85bJkaJarnuF2nonsy5Yn4s=;
        b=qORC0lKYbqXnNIglK7RM41stzwKnOASF+Hu7ytdWCN+wc24jfcHsz4ClRV0eqK1ONI
         FawYxZyXn+8VHLB/ezO55KREo7kl5E0AslA+74dy1J2Z8TgrqGHYjrKuXXef3BHXLH+8
         1nU8M1nWZSH5DQMO//YvD2iqWbzmX1URyL/1in23RjhtiqcBpmcJjlO2St8IDj8Gsibt
         9dI+mjhQW8R7v7xZ8SnEEz2IH1wY6N0uMvpsqLsYVqWdYSYeHXjN0z3a/fn11zVWMnhv
         H8gwjbKu3V2UFP+hAhRRc5hvjYg6MfU3n3muDOmC+1unf9/ER+k8QaYK0nNNQ6D1GRPs
         BweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T57MT6zVWvwp0Z4zcsEC85bJkaJarnuF2nonsy5Yn4s=;
        b=tjgiktfwJZDK6iryi6pWU34/BzhbYi+MYZkRhbqkoVrh3/HzPjoEsAA1jK8McPpi1C
         eJH1Ej4WiN9zwY4ID8xAv4AC0p1dlSqAy2VJmDpygePb+oYTUcETYpXaBC24t/jC71eX
         KXYmPSJQgf10oGcb2zEOe6rNPDxoSPLYG1Jmq8R5NTDXUVlHUVnKiUxHCwcIiIrMOMfo
         eAnAsf4jxPBOSxqVMJuwENGAF4mhv2jxNO/eM6gpsW0ZngS1KuPmbibrpXUOIigbWpKc
         SWmPLyIJo7WShyP3EUMs4FvBqznyRd0TTijcN6+KFszTA1j9qjRnGFJofbLc+TTQ6aB1
         zjig==
X-Gm-Message-State: AOAM532QYZULAUpxLullQCCYaBvKGumEhng2QSCrZy1XWrSbPAcSpe3K
	KTmI2wZZCOb/P3pmuOt7B8j2dBeSkaS4qZ4hdPU=
X-Google-Smtp-Source: ABdhPJxIQQkGhBZfsHwt2zx5z0PTGXW+gAhZBWlYXIoMInoSyU4Eo6N9iw4Ok0k9fKB0WFbpJkT8/mCfI5wLyrim1kQ=
X-Received: by 2002:ac2:5f72:: with SMTP id c18mr42731789lfc.233.1621249504967;
 Mon, 17 May 2021 04:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <CANNYZj-tvw9UFbUXksbdofaT1ceLerrJuHR2RE3+sJo=Zus5Rw@mail.gmail.com>
In-Reply-To: <CANNYZj-tvw9UFbUXksbdofaT1ceLerrJuHR2RE3+sJo=Zus5Rw@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 17 May 2021 16:34:53 +0530
Message-ID: <CANUMPcUyfD=PgNyRH6tzx0FtDR6m6zyvW0fh1k58R9UAB3nmjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust-testsuite.inc : Rust cross testing.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

The patchset is based on below rust branch,
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-wip-2021-02-02

Regards,
Vinay

On Mon, May 17, 2021 at 4:27 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I believe rust itself is not yet in oe-core? Which patchset is this based on?
>
> Alex
>
> On Mon, 17 May 2021 at 12:35, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Below list of functions are part of rust-testsuite.inc
>> setup_cargo_environment(): Build bootstrap and some early stage tools.
>> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
>> do_configure(): To generate config.toml
>> do_compile(): To build "remote-test-server" for qemutarget image.
>> do_check(): To execute testing by copying remote-test-server to qmutarget image.
>>
>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ---
>>  meta/recipes-devtools/rust/rust-testsuite.inc | 166 ++++++++++++++++++
>>  1 file changed, 166 insertions(+)
>>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>>
>> diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
>> new file mode 100644
>> index 0000000000..d1c5496da4
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rust/rust-testsuite.inc
>> @@ -0,0 +1,166 @@
>> +SUMMARY = "Rust testing"
>> +HOMEPAGE = "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
>> +SECTION = "test"
>> +LICENSE = "MIT | Apache-2.0"
>> +
>> +inherit rust
>> +inherit cargo_common
>> +
>> +DEPENDS += "file-native python3-native"
>> +EXCLUDE_FROM_WORLD = "1"
>> +
>> +# Path of target specification file "target-poky-linux.json"
>> +export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
>> +
>> +export FORCE_CRATE_HASH="${BB_TASKHASH}"
>> +
>> +# We don't want to use bitbakes vendoring because the rust sources do their
>> +# own vendoring.
>> +CARGO_DISABLE_BITBAKE_VENDORING = "1"
>> +
>> +# We can't use RUST_BUILD_SYS here because that may be "musl" if
>> +# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
>> +SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
>> +setup_cargo_environment () {
>> +    # The first step is to build bootstrap and some early stage tools,
>> +    # these are build for the same target as the snapshot, e.g.
>> +    # x86_64-unknown-linux-gnu.
>> +    # Later stages are build for the native target (i.e. target.x86_64-linux)
>> +    cargo_common_do_configure
>> +
>> +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
>> +    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
>> +}
>> +
>> +do_rust_setup_snapshot () {
>> +    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
>> +        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
>> +    done
>> +
>> +    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
>> +    # and fail without it there.
>> +    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
>> +    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
>> +}
>> +addtask rust_setup_snapshot after do_unpack before do_configure
>> +do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
>> +
>> +python do_configure() {
>> +    import json
>> +    from distutils.version import LooseVersion
>> +    try:
>> +        import configparser
>> +    except ImportError:
>> +        import ConfigParser as configparser
>> +
>> +    # toml is rather similar to standard ini like format except it likes values
>> +    # that look more JSON like. So for our purposes simply escaping all values
>> +    # as JSON seem to work fine.
>> +
>> +    e = lambda s: json.dumps(s)
>> +
>> +    config = configparser.RawConfigParser()
>> +
>> +    # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.ARCH-poky-linux]
>> +    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
>> +    config.add_section(target_section)
>> +
>> +    # Points to wrapper files which contain target specific compiler and linker commands.
>> +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
>> +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
>> +    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
>> +
>> +    # If we don't do this rust-native will compile it's own llvm for BUILD.
>> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
>> +    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
>> +    config.add_section(target_section)
>> +
>> +    # Wrapper scripts of build system.
>> +    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
>> +    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
>> +
>> +    # [llvm]
>> +    config.add_section("llvm")
>> +    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
>> +
>> +    # [rust]
>> +    config.add_section("rust")
>> +    config.set("rust", "rpath", e(True))
>> +    config.set("rust", "channel", e("stable"))
>> +
>> +    if LooseVersion(d.getVar("PV")) < LooseVersion("1.32.0"):
>> +        config.set("rust", "use-jemalloc", e(False))
>> +
>> +    # Whether or not to optimize the compiler and standard library
>> +    config.set("rust", "optimize", e(True))
>> +
>> +    # Emits extraneous output from tests to ensure that failures of the test
>> +    # harness are debuggable just from logfiles
>> +    config.set("rust", "verbose-tests", e(True))
>> +
>> +    # Override default linker cc.
>> +    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))
>> +
>> +    # [build]
>> +    config.add_section("build")
>> +    config.set("build", "submodules", e(False))
>> +    config.set("build", "docs", e(False))
>> +
>> +    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
>> +    config.set("build", "rustc", e(rustc))
>> +
>> +    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
>> +    config.set("build", "cargo", e(cargo))
>> +
>> +    config.set("build", "vendor", e(True))
>> +
>> +    targets = [d.getVar("TARGET_SYS", True)]
>> +    config.set("build", "target", e(targets))
>> +
>> +    hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
>> +    config.set("build", "host", e(hosts))
>> +
>> +    # We can't use BUILD_SYS since that is something the rust snapshot knows
>> +    # nothing about when trying to build some stage0 tools (like fabricate)
>> +    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
>> +
>> +    with open("config.toml", "w") as f:
>> +        config.write(f)
>> +
>> +    # set up ${WORKDIR}/cargo_home
>> +    bb.build.exec_func("setup_cargo_environment", d)
>> +}
>> +
>> +
>> +rust_runx () {
>> +    echo "COMPILE ${PN}" "$@"
>> +
>> +    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for a
>> +    # wide range of targets (not just TARGET). Yocto's settings for them will
>> +    # be inappropriate, avoid using.
>> +    unset CFLAGS
>> +    unset LDFLAGS
>> +    unset CXXFLAGS
>> +    unset CPPFLAGS
>> +
>> +    oe_cargo_fix_env
>> +
>> +    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
>> +}
>> +rust_runx[vardepsexclude] += "PARALLEL_MAKE"
>> +
>> +do_compile () {
>> +
>> +    rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
>> +}
>> +
>> +do_check[dirs] += "${B}"
>> +do_check[nostamp] = "1"
>> +do_check () {
>> +    scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
>> +    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"
>> +
>> +    export TEST_DEVICE_ADDR="127.0.0.1:12345"
>> +    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
>> +}
>> +addtask do_check after do_compile
>> --
>> 2.17.1
>>
