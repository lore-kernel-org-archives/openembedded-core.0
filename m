Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.11.1621699897222191932
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 09:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sviSeuy1;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id q8so3219429uap.5
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XJU+KiZFU83xG2QsA+2auOXrUEx8jTRT3SNXh8dcN3g=;
        b=sviSeuy1u+PQlTS2weirfrXnxlOuhI6BOPi76u784+UuJjbs5IlRbafe82K3zbdn3y
         PzY2gMhfVpUQASdD4VgHucj3nSvlzufbVOQ8gyKn2vKboL/nW4y8KE1hkYToUOC/h8+f
         KpfZIK8G/ijp0K1iGqnjFKg/eS+yoqfavHWV5hX2fP0ActCIOHRg1iQAkQafgMLGDApp
         uOTdQiPLdkbW/KVVA+lLw0DptJJHCShOL/hMcbDH/bFJqJrHcszk5RMyGLYIrsTLjOb/
         1f3mtK9r5468s8NjXIB9qe8ZIVIMOLWz6KsRFnqvv2v7WpxzAqlquLfAVsgrpx/NIHTV
         BgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XJU+KiZFU83xG2QsA+2auOXrUEx8jTRT3SNXh8dcN3g=;
        b=V4xb4VzB+LDNr3mfzQc0xP1UYDsPZas89Bd6WPkgKN74QBsiJ4WF4900/eJQm+6eUw
         wT/sVRIeM+zqLSOXq+l+R+571yex912LIBZWUrbDnjVmGUG+phQEIrjPtKyHR3QjB9f0
         f1nUbz98hV5JF2zBJaveWb+J9ko8MXQIio0YHLm6O3tcCyjEesr7m+CppUk4m0NS2Iof
         Amfg5lH9tYWGys22dDGG487zHKSLjM6xmVVvTfrTZUxTbzXx1XRY5LW3m2SuKdpdkTeo
         ZT+RMAkPFCmRvqRJ+8eMtijZ/nK5NqoglZsG204A/AdzNZUqDxRQU30ryztFq8sytcT3
         PNNw==
X-Gm-Message-State: AOAM530Mgo9dhLGcwBQ5cJmXRhWRgG+/JnaGzvmjiNXeDTm7xL+R5b1H
	Yp1SJCFYz90LbxQRldHd+Wc4W+xM9nLRFWZuBLk=
X-Google-Smtp-Source: ABdhPJw0Ihu2AQbskksJIdZBopm8F2fVRavxSAM4HofC82udt9nV6LmVz6mXNtU0ofOJ1f5+hUm27DrYv8Xvi2zy7IY=
X-Received: by 2002:ab0:2381:: with SMTP id b1mr15909968uan.93.1621699896341;
 Sat, 22 May 2021 09:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
 <20210521132914.140884-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210521132914.140884-1-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 22 May 2021 18:11:25 +0200
Message-ID: <CANNYZj9tTEg3pyy1-9QfaaQSP5=zsDNzjSKmWzhsdhO1EKRsrg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] rust-testsuite.inc : Rust cross testing.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="00000000000040f7cf05c2ed6e5e"

--00000000000040f7cf05c2ed6e5e
Content-Type: text/plain; charset="UTF-8"

Where is TARGET_SYS set? I cannot find it anywhere in your patchset.

Note that when using tap, the target ip address is unknown until qemu is
started, so you need to engineer the code in a way that everything that
needs to know the address is configured at that point.

Alex

On Fri, 21 May 2021 at 15:29, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Below list of functions are part of rust-testsuite.inc
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemutarget image.
> do_check(): To execute testing on qmutarget image.
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-testsuite.inc | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>
> diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc
> b/meta/recipes-devtools/rust/rust-testsuite.inc
> new file mode 100644
> index 0000000000..88fb4e70d9
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite.inc
> @@ -0,0 +1,163 @@
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
> +# We don't want to use bitbakes vendoring because the rust sources do
> their
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
> +    # Later stages are build for the native target (i.e.
> target.x86_64-linux)
> +    cargo_common_do_configure
> +
> +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
> +    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
> +}
> +
> +do_rust_setup_snapshot () {
> +    for installer in
> "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
> +        "${installer}" --prefix="${WORKDIR}/rust-snapshot"
> --disable-ldconfig
> +    done
> +
> +    # Some versions of rust (e.g. 1.18.0) tries to find cargo in
> stage0/bin/cargo
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
> +    # toml is rather similar to standard ini like format except it likes
> values
> +    # that look more JSON like. So for our purposes simply escaping all
> values
> +    # as JSON seem to work fine.
> +
> +    e = lambda s: json.dumps(s)
> +
> +    config = configparser.RawConfigParser()
> +
> +    # [target.ARCH-unknown-linux-gnu] in case of x86_64
> [target.ARCH-poky-linux]
> +    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
> +    config.add_section(target_section)
> +
> +    # Points to wrapper files which contain target specific compiler and
> linker commands.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> +    config.set(target_section, "linker",
> e(d.expand("${RUST_TARGET_CCLD}")))
> +
> +    # If we don't do this rust-native will compile it's own llvm for
> BUILD.
> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> +    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS',
> True))
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
> +    # Emits extraneous output from tests to ensure that failures of the
> test
> +    # harness are debuggable just from logfiles
> +    config.set("rust", "verbose-tests", e(True))
> +
> +    # Override default linker cc.
> +    config.set("rust", "default-linker",
> e(d.expand("${RUST_BUILD_CCLD}")))
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
> +    # We can't use BUILD_SYS since that is something the rust snapshot
> knows
> +    # nothing about when trying to build some stage0 tools (like
> fabricate)
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
> +    # wide range of targets (not just TARGET). Yocto's settings for them
> will
> +    # be inappropriate, avoid using.
> +    unset CFLAGS
> +    unset LDFLAGS
> +    unset CXXFLAGS
> +    unset CPPFLAGS
> +
> +    oe_cargo_fix_env
> +
> +    python3 src/bootstrap/bootstrap.py
> ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
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
> +
> +    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" >
> summary.txt 2> /dev/null
> +}
> +addtask do_check after do_compile
> --
> 2.17.1
>
>

--00000000000040f7cf05c2ed6e5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Where is TARGET_SYS set? I cannot find it anywhere in=
 your patchset.</div><div><br></div><div>Note that when using tap, the targ=
et ip address is unknown until qemu is started, so you need to engineer the=
 code in a way that everything that needs to know the address is configured=
 at that point.</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 21 May 2021 =
at 15:29, Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com">vinay.m=
.engg@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Below list of functions are part of rust-testsuite.inc<br>
setup_cargo_environment(): Build bootstrap and some early stage tools.<br>
do_rust_setup_snapshot(): Install the snapshot version of rust binaries.<br=
>
do_configure(): To generate config.toml<br>
do_compile(): To build &quot;remote-test-server&quot; for qemutarget image.=
<br>
do_check(): To execute testing on qmutarget image.<br>
<br>
Signed-off-by: Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com" ta=
rget=3D"_blank">vinay.m.engg@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rust/rust-testsuite.inc | 163 +++++++++++++++++=
+<br>
=C2=A01 file changed, 163 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc<br>
<br>
diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-d=
evtools/rust/rust-testsuite.inc<br>
new file mode 100644<br>
index 0000000000..88fb4e70d9<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc<br>
@@ -0,0 +1,163 @@<br>
+SUMMARY =3D &quot;Rust testing&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://rustc-dev-guide.rust-lang.org/tests/=
intro.html" rel=3D"noreferrer" target=3D"_blank">https://rustc-dev-guide.ru=
st-lang.org/tests/intro.html</a>&quot;<br>
+SECTION =3D &quot;test&quot;<br>
+LICENSE =3D &quot;MIT | Apache-2.0&quot;<br>
+<br>
+inherit rust<br>
+inherit cargo_common<br>
+<br>
+DEPENDS +=3D &quot;file-native python3-native&quot;<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
+<br>
+# Path of target specification file &quot;target-poky-linux.json&quot;<br>
+export RUST_TARGET_PATH=3D&quot;${STAGING_LIBDIR_NATIVE}/rustlib&quot;<br>
+<br>
+export FORCE_CRATE_HASH=3D&quot;${BB_TASKHASH}&quot;<br>
+<br>
+# We don&#39;t want to use bitbakes vendoring because the rust sources do =
their<br>
+# own vendoring.<br>
+CARGO_DISABLE_BITBAKE_VENDORING =3D &quot;1&quot;<br>
+<br>
+# We can&#39;t use RUST_BUILD_SYS here because that may be &quot;musl&quot=
; if<br>
+# TCLIBC=3D&quot;musl&quot;. Snapshots are always -unknown-linux-gnu<br>
+SNAPSHOT_BUILD_SYS =3D &quot;${BUILD_ARCH}-unknown-linux-gnu&quot;<br>
+setup_cargo_environment () {<br>
+=C2=A0 =C2=A0 # The first step is to build bootstrap and some early stage =
tools,<br>
+=C2=A0 =C2=A0 # these are build for the same target as the snapshot, e.g.<=
br>
+=C2=A0 =C2=A0 # x86_64-unknown-linux-gnu.<br>
+=C2=A0 =C2=A0 # Later stages are build for the native target (i.e. target.=
x86_64-linux)<br>
+=C2=A0 =C2=A0 cargo_common_do_configure<br>
+<br>
+=C2=A0 =C2=A0 printf &#39;[target.%s]\n&#39; &quot;${SNAPSHOT_BUILD_SYS}&q=
uot; &gt;&gt; ${CARGO_HOME}/config<br>
+=C2=A0 =C2=A0 printf &quot;linker =3D &#39;%s&#39;\n&quot; &quot;${RUST_BU=
ILD_CCLD}&quot; &gt;&gt; ${CARGO_HOME}/config<br>
+}<br>
+<br>
+do_rust_setup_snapshot () {<br>
+=C2=A0 =C2=A0 for installer in &quot;${WORKDIR}/rust-snapshot-components/&=
quot;*&quot;/install.sh&quot;; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${installer}&quot; --prefix=3D&quot;${WO=
RKDIR}/rust-snapshot&quot; --disable-ldconfig<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 # Some versions of rust (e.g. 1.18.0) tries to find cargo in=
 stage0/bin/cargo<br>
+=C2=A0 =C2=A0 # and fail without it there.<br>
+=C2=A0 =C2=A0 mkdir -p ${RUSTSRC}/build/${BUILD_SYS}<br>
+=C2=A0 =C2=A0 ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SY=
S}/stage0<br>
+}<br>
+addtask rust_setup_snapshot after do_unpack before do_configure<br>
+do_rust_setup_snapshot[dirs] +=3D &quot;${WORKDIR}/rust-snapshot&quot;<br>
+<br>
+python do_configure() {<br>
+=C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import configparser<br>
+=C2=A0 =C2=A0 except ImportError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import ConfigParser as configparser<br>
+<br>
+=C2=A0 =C2=A0 # toml is rather similar to standard ini like format except =
it likes values<br>
+=C2=A0 =C2=A0 # that look more JSON like. So for our purposes simply escap=
ing all values<br>
+=C2=A0 =C2=A0 # as JSON seem to work fine.<br>
+<br>
+=C2=A0 =C2=A0 e =3D lambda s: json.dumps(s)<br>
+<br>
+=C2=A0 =C2=A0 config =3D configparser.RawConfigParser()<br>
+<br>
+=C2=A0 =C2=A0 # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.=
ARCH-poky-linux] <br>
+=C2=A0 =C2=A0 target_section =3D &quot;target.{}&quot;.format(d.getVar(&#3=
9;TARGET_SYS&#39;, True))<br>
+=C2=A0 =C2=A0 config.add_section(target_section)<br>
+<br>
+=C2=A0 =C2=A0 # Points to wrapper files which contain target specific comp=
iler and linker commands. <br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;cxx&quot;, e(d.expand(&quot=
;${RUST_TARGET_CXX}&quot;)))<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;cc&quot;, e(d.expand(&quot;=
${RUST_TARGET_CC}&quot;)))<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;linker&quot;, e(d.expand(&q=
uot;${RUST_TARGET_CCLD}&quot;)))<br>
+<br>
+=C2=A0 =C2=A0 # If we don&#39;t do this rust-native will compile it&#39;s =
own llvm for BUILD.<br>
+=C2=A0 =C2=A0 # [target.${BUILD_ARCH}-unknown-linux-gnu]<br>
+=C2=A0 =C2=A0 target_section =3D &quot;target.{}&quot;.format(d.getVar(&#3=
9;SNAPSHOT_BUILD_SYS&#39;, True))<br>
+=C2=A0 =C2=A0 config.add_section(target_section)<br>
+<br>
+=C2=A0 =C2=A0 # Wrapper scripts of build system.<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;cxx&quot;, e(d.expand(&quot=
;${RUST_BUILD_CXX}&quot;)))<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;cc&quot;, e(d.expand(&quot;=
${RUST_BUILD_CC}&quot;)))<br>
+<br>
+=C2=A0 =C2=A0 # [llvm]<br>
+=C2=A0 =C2=A0 config.add_section(&quot;llvm&quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;llvm&quot;, &quot;targets&quot;, e(&quot;AR=
M;AArch64;Mips;PowerPC;RISCV;X86&quot;))<br>
+<br>
+=C2=A0 =C2=A0 # [rust]<br>
+=C2=A0 =C2=A0 config.add_section(&quot;rust&quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;rpath&quot;, e(True))<br>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;channel&quot;, e(&quot;st=
able&quot;))<br>
+<br>
+=C2=A0 =C2=A0 if LooseVersion(d.getVar(&quot;PV&quot;)) &lt; LooseVersion(=
&quot;1.32.0&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;use-jemallo=
c&quot;, e(False))<br>
+<br>
+=C2=A0 =C2=A0 # Whether or not to optimize the compiler and standard libra=
ry<br>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;optimize&quot;, e(True))<=
br>
+<br>
+=C2=A0 =C2=A0 # Emits extraneous output from tests to ensure that failures=
 of the test<br>
+=C2=A0 =C2=A0 # harness are debuggable just from logfiles<br>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;verbose-tests&quot;, e(Tr=
ue))=C2=A0 =C2=A0 <br>
+<br>
+=C2=A0 =C2=A0 # Override default linker cc.<br>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;default-linker&quot;, e(d=
.expand(&quot;${RUST_BUILD_CCLD}&quot;)))<br>
+<br>
+=C2=A0 =C2=A0 # [build]<br>
+=C2=A0 =C2=A0 config.add_section(&quot;build&quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;submodules&quot;, e(Fals=
e))<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;docs&quot;, e(False))<br=
>
+<br>
+=C2=A0 =C2=A0 rustc =3D d.expand(&quot;${WORKDIR}/rust-snapshot/bin/rustc&=
quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;rustc&quot;, e(rustc))<b=
r>
+<br>
+=C2=A0 =C2=A0 cargo =3D d.expand(&quot;${WORKDIR}/rust-snapshot/bin/cargo&=
quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;cargo&quot;, e(cargo))<b=
r>
+<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;vendor&quot;, e(True))<b=
r>
+<br>
+=C2=A0 =C2=A0 targets =3D [d.getVar(&quot;TARGET_SYS&quot;, True)]<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;target&quot;, e(targets)=
)<br>
+<br>
+=C2=A0 =C2=A0 hosts =3D [d.getVar(&quot;SNAPSHOT_BUILD_SYS&quot;, True)]<b=
r>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;host&quot;, e(hosts))<br=
>
+<br>
+=C2=A0 =C2=A0 # We can&#39;t use BUILD_SYS since that is something the rus=
t snapshot knows<br>
+=C2=A0 =C2=A0 # nothing about when trying to build some stage0 tools (like=
 fabricate)<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;build&quot;, e(d.getVar(=
&quot;SNAPSHOT_BUILD_SYS&quot;, True)))<br>
+<br>
+=C2=A0 =C2=A0 with open(&quot;config.toml&quot;, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config.write(f)<br>
+<br>
+=C2=A0 =C2=A0 # set up ${WORKDIR}/cargo_home<br>
+=C2=A0 =C2=A0 bb.build.exec_func(&quot;setup_cargo_environment&quot;, d)<b=
r>
+}<br>
+<br>
+<br>
+rust_runx () {<br>
+=C2=A0 =C2=A0 echo &quot;COMPILE ${PN}&quot; &quot;$@&quot;<br>
+<br>
+=C2=A0 =C2=A0 # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust&#39;s=
 build for a<br>
+=C2=A0 =C2=A0 # wide range of targets (not just TARGET). Yocto&#39;s setti=
ngs for them will<br>
+=C2=A0 =C2=A0 # be inappropriate, avoid using.<br>
+=C2=A0 =C2=A0 unset CFLAGS<br>
+=C2=A0 =C2=A0 unset LDFLAGS<br>
+=C2=A0 =C2=A0 unset CXXFLAGS<br>
+=C2=A0 =C2=A0 unset CPPFLAGS<br>
+<br>
+=C2=A0 =C2=A0 oe_cargo_fix_env<br>
+<br>
+=C2=A0 =C2=A0 python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make=
_argument(d, &#39;-j %d&#39;)} &quot;$@&quot; --verbose<br>
+}<br>
+rust_runx[vardepsexclude] +=3D &quot;PARALLEL_MAKE&quot;<br>
+<br>
+do_compile () {<br>
+<br>
+=C2=A0 =C2=A0 rust_runx build src/tools/remote-test-server --target &quot;=
${TARGET_SYS}&quot;<br>
+}<br>
+<br>
+do_check[dirs] +=3D &quot;${B}&quot;<br>
+do_check[nostamp] =3D &quot;1&quot;<br>
+do_check () {<br>
+<br>
+=C2=A0 =C2=A0 rust_runx test --no-fail-fast --bless --target &quot;${TARGE=
T_SYS}&quot; &gt; summary.txt 2&gt; /dev/null<br>
+}<br>
+addtask do_check after do_compile<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--00000000000040f7cf05c2ed6e5e--
