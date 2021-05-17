Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.271.1621289914752432953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PvO81siI;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id h7so3972052plt.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wV93LZrzXrnk8/UyrnvoL6633MhuLTTPK5u2GPSv1Cs=;
        b=PvO81siI5d8BoNB6q1owu2x55ZutsORSKAUnM1b2U60bPDRVSij45jg6QsZZc8vp8H
         R62bqtLzijlLCLbTQeH04QHpTfiIkT7DiosgkKprvFgoFJZzABuH95mzIndk8F3t9qj6
         TzGFQvfsW6hhbVQGhAcLE9fBPsNaR5tHbrukhi1SMt31BMIpPcjftSGSQsNiibOY3EYL
         keGC9GQTk7ACAZ1zU3B2BjV2ks0+1ngBq3GKYicZYFtsa9h2O5weP4kmOQKis9SDitPa
         TTduym3pZYaCjTHL6GWuf1yZGouh7VVdLPxtQ1hkU33sfYk8RS3MMVfpPQ4bRUD/6v7t
         Zw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wV93LZrzXrnk8/UyrnvoL6633MhuLTTPK5u2GPSv1Cs=;
        b=McfOv5uwgPcQgHCDZJm8iLhp8BOiMoyZTwV6VF20Zick0C6CovCB1L/H57tZsut3FY
         5UydqAGqdpN2XGUgCv8RBkFVTtPg/qVEwNK89Lnxp9b/9Ln6mOIpA8aENaSDSfTXFWv4
         qj5+Cyytxnv2jWIi4/HFJy+80Zahq+PfrDxlDSfbuQQ3Zd5szLsTfGSAFYXX2DQCCaqk
         ryQeTcVSJMAAatezoprtyv58mKRRDy8s8T6Ug/5GCtACBUHvPRLeG8RZvEGNgFQSTLXV
         rIpN5G2j4Z+GC3p80x99cKdXOdqxI7f9T+v1BCcEzI2m2gmkXhOYZAWwOptWNZtQBf+5
         mVGg==
X-Gm-Message-State: AOAM533zDg7bGM6hkPJcA8ASLlQ/S9IN3G5Grd2s5WnKtnlafwkcvE/M
	u6pXctDt0bF1zbaf3D6OOzE=
X-Google-Smtp-Source: ABdhPJxj7AfZ/1h49mQHCBPFZb+STsdZpMAMFrhVUX0qqEL2u47b2EOIfikqJMyoHl2h/2cfhfdXwg==
X-Received: by 2002:a17:902:6ac3:b029:e6:c6a3:a697 with SMTP id i3-20020a1709026ac3b02900e6c6a3a697mr773464plt.2.1621289912872;
        Mon, 17 May 2021 15:18:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:3413:1e4b:7a71:b5dc? ([2601:646:9200:a0f0:3413:1e4b:7a71:b5dc])
        by smtp.gmail.com with ESMTPSA id c9sm10316968pfl.169.2021.05.17.15.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 15:18:32 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2 1/7] rust-testsuite.inc : Rust cross testing.
To: Vinay Kumar <vinay.m.engg@gmail.com>,
 openembedded-core@lists.openembedded.org, richard.purdie@linuxfoundation.org
Cc: kweihmann@outlook.com, rwmacleod@gmail.com, umesh.kalappa0@gmail.com,
 vinay.kumar@blackfigtech.com, alex.kanavin@gmail.com
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8cff2d9b-51cc-e9f0-f1ac-b95b106e11ac@gmail.com>
Date: Mon, 17 May 2021 15:18:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517103528.24434-1-vinay.m.engg@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/17/21 3:35 AM, Vinay Kumar wrote:
> Below list of functions are part of rust-testsuite.inc
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemutarget image.
> do_check(): To execute testing by copying remote-test-server to qmutarget image.
> 


some part of these series should go to meta-rust

> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>   meta/recipes-devtools/rust/rust-testsuite.inc | 166 ++++++++++++++++++
>   1 file changed, 166 insertions(+)
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
> 
> diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
> new file mode 100644
> index 0000000000..d1c5496da4
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite.inc
> @@ -0,0 +1,166 @@
> +SUMMARY = "Rust testing"
> +HOMEPAGE = "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
> +SECTION = "test"
> +LICENSE = "MIT | Apache-2.0"
> +
> +inherit rust
> +inherit cargo_common
> +
> +DEPENDS += "file-native python3-native"
> +EXCLUDE_FROM_WORLD = "1"
> +
> +# Path of target specification file "target-poky-linux.json"
> +export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
> +
> +export FORCE_CRATE_HASH="${BB_TASKHASH}"
> +
> +# We don't want to use bitbakes vendoring because the rust sources do their
> +# own vendoring.
> +CARGO_DISABLE_BITBAKE_VENDORING = "1"
> +
> +# We can't use RUST_BUILD_SYS here because that may be "musl" if
> +# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
> +SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
> +setup_cargo_environment () {
> +    # The first step is to build bootstrap and some early stage tools,
> +    # these are build for the same target as the snapshot, e.g.
> +    # x86_64-unknown-linux-gnu.
> +    # Later stages are build for the native target (i.e. target.x86_64-linux)
> +    cargo_common_do_configure
> +
> +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
> +    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
> +}
> +
> +do_rust_setup_snapshot () {
> +    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
> +        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
> +    done
> +
> +    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
> +    # and fail without it there.
> +    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
> +    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
> +}
> +addtask rust_setup_snapshot after do_unpack before do_configure
> +do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
> +
> +python do_configure() {
> +    import json
> +    from distutils.version import LooseVersion
> +    try:
> +        import configparser
> +    except ImportError:
> +        import ConfigParser as configparser
> +
> +    # toml is rather similar to standard ini like format except it likes values
> +    # that look more JSON like. So for our purposes simply escaping all values
> +    # as JSON seem to work fine.
> +
> +    e = lambda s: json.dumps(s)
> +
> +    config = configparser.RawConfigParser()
> +
> +    # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.ARCH-poky-linux]
> +    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
> +    config.add_section(target_section)
> +
> +    # Points to wrapper files which contain target specific compiler and linker commands.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> +    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
> +
> +    # If we don't do this rust-native will compile it's own llvm for BUILD.
> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> +    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
> +    config.add_section(target_section)
> +
> +    # Wrapper scripts of build system.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> +
> +    # [llvm]
> +    config.add_section("llvm")
> +    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
> +
> +    # [rust]
> +    config.add_section("rust")
> +    config.set("rust", "rpath", e(True))
> +    config.set("rust", "channel", e("stable"))
> +
> +    if LooseVersion(d.getVar("PV")) < LooseVersion("1.32.0"):
> +        config.set("rust", "use-jemalloc", e(False))
> +
> +    # Whether or not to optimize the compiler and standard library
> +    config.set("rust", "optimize", e(True))
> +
> +    # Emits extraneous output from tests to ensure that failures of the test
> +    # harness are debuggable just from logfiles
> +    config.set("rust", "verbose-tests", e(True))
> +
> +    # Override default linker cc.
> +    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))
> +
> +    # [build]
> +    config.add_section("build")
> +    config.set("build", "submodules", e(False))
> +    config.set("build", "docs", e(False))
> +
> +    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
> +    config.set("build", "rustc", e(rustc))
> +
> +    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
> +    config.set("build", "cargo", e(cargo))
> +
> +    config.set("build", "vendor", e(True))
> +
> +    targets = [d.getVar("TARGET_SYS", True)]
> +    config.set("build", "target", e(targets))
> +
> +    hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
> +    config.set("build", "host", e(hosts))
> +
> +    # We can't use BUILD_SYS since that is something the rust snapshot knows
> +    # nothing about when trying to build some stage0 tools (like fabricate)
> +    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
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
> +    # wide range of targets (not just TARGET). Yocto's settings for them will
> +    # be inappropriate, avoid using.
> +    unset CFLAGS
> +    unset LDFLAGS
> +    unset CXXFLAGS
> +    unset CPPFLAGS
> +
> +    oe_cargo_fix_env
> +
> +    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
> +}
> +rust_runx[vardepsexclude] += "PARALLEL_MAKE"
> +
> +do_compile () {
> +
> +    rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
> +}
> +
> +do_check[dirs] += "${B}"
> +do_check[nostamp] = "1"
> +do_check () {
> +    scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
> +    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"
> +
> +    export TEST_DEVICE_ADDR="127.0.0.1:12345"
> +    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
> +}
> +addtask do_check after do_compile
> 
> 
> 
> 
> 
