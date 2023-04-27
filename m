Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8934FC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 15:04:43 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.23235.1682607875864740695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 08:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OFN41oWZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4efd6e26585so7139713e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 08:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682607874; x=1685199874;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cri13Rroy1B7PNw/LVOC3WyeODCXzNnIHtGk4rGad40=;
        b=OFN41oWZiBEuTJW3Q4wEk4NCNBROeXBF+DCmIneV1J9S8eJRIDheRwxkX2brnEgn7k
         7EjLzWNJUE0x82HvUq/CA0Qs9k5WNUgWJ28v+1lU+yXNX0sp1ao2rdSpHvTk8C1GCHUG
         dG5WpGClhzR5iPitGSk9Tc7AY6LOrTRZAS/VMw7XRhP4Um+2XEPpxYHBXGzzlV66IXCn
         Z66GTIbQkevCljYQcspFi4tKj0qrlZfsxKsm1mD47hBIsrHRyO0GTyAJ5uy8VEvH2ewZ
         4uxSRUl4NFCNMNtbPq5WO7qQEX/NyhYLah6arofO6fULUPoypr/ggn2SZ41sqLHjvyqL
         zE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682607874; x=1685199874;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cri13Rroy1B7PNw/LVOC3WyeODCXzNnIHtGk4rGad40=;
        b=lUgYEbSoH5DYwyyDfUY6wx7q8SFX5XHt5AesB3O9mLi47F7FTilzbBaLwh8cCv3m3e
         gZAvClvbb3axKhlro70BrzIOyWatWlCMNPYVAahEQ9RxzUXFlxfgs7iSyYg/VXc/esFW
         5p3afShWIpJ29E60Gspk8rkcleUp5skkk3tfD0frLkOey5mj9whA4tPfuIdxCKrwgEl4
         l5fniCMZgeZ6Rp0Bwc7RcCS2xoatJWUESpraNOCevdmlzMhkcbhOMsydqrii8ozU0TRk
         93DigYjnbDr7ZvNCxo+hGDP63z44OYPKb/gaKgxVsZ1j1gKJ9QEVgQBo3SFa3VBcj5bk
         ZqWQ==
X-Gm-Message-State: AC+VfDy949i2LLd4IymxpmhbO/P2B3rJo7Efut1qTkpLfd+FkdKWGnCh
	2JZadxNQvnpv6GbruQFIPkPIzo+GkEsevCGwybBPx0gx
X-Google-Smtp-Source: ACHHUZ7dhkKyUP5+yw/KAqlxtMcH2qwFdKHO46ob8T2vyIWjeLpTIIYeeig7Cw9IOMotJg6MODI80NoMfwzMptoQ3Sk=
X-Received: by 2002:a05:6512:2188:b0:4ec:883a:6664 with SMTP id
 b8-20020a056512218800b004ec883a6664mr630980lft.16.1682607873389; Thu, 27 Apr
 2023 08:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682572703.git.frederic.martinsons@gmail.com> <55d311e26e8c3eff765d71f4c1aa439459708812.1682572703.git.frederic.martinsons@gmail.com>
In-Reply-To: <55d311e26e8c3eff765d71f4c1aa439459708812.1682572703.git.frederic.martinsons@gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 27 Apr 2023 17:04:21 +0200
Message-ID: <CA+cAkeq5M=43x5b_4Cr5ecJWn2pGBN8APHqrcJ208=gDuHvZzA@mail.gmail.com>
Subject: Re: [PATCHV3 1/3] ptest-cargo.bbclass: create class
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096fb2c05fa52ac0d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 15:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180492

--00000000000096fb2c05fa52ac0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 27 avr. 2023, 07:21, <frederic.martinsons@gmail.com> a =C3=A9crit :

> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>
> This new class offer the capbility to build rust tests and
> find them correctly.
> Due to non deterministic name of generated binaries, a custom
> parsing of build result must be performed.
> See https://github.com/rust-lang/cargo/issues/1924
>
> All rust project will generate a test binary even if there are
> not test defined in source code (the binary will just output
> that it ran 0 tests)
>
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes-recipe/ptest-cargo.bbclass | 129 ++++++++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 meta/classes-recipe/ptest-cargo.bbclass
>
> diff --git a/meta/classes-recipe/ptest-cargo.bbclass
> b/meta/classes-recipe/ptest-cargo.bbclass
> new file mode 100644
> index 0000000000..f26d4225d3
> --- /dev/null
> +++ b/meta/classes-recipe/ptest-cargo.bbclass
> @@ -0,0 +1,129 @@
> +inherit cargo ptest
> +
> +CARGO_TEST_BINARIES_FILES ?=3D "${B}/test_binaries_list"
> +
> +# sadly generated test binary have no deterministic names (
> https://github.com/rust-lang/cargo/issues/1924)
> +# which force us to parse the cargo output in json format to find those
> test binaries
> +python do_compile_ptest_cargo() {
> +    import subprocess
> +    import json
> +
> +    cargo =3D bb.utils.which(d.getVar("PATH"), d.getVar("CARGO", True))
> +    cargo_build_flags =3D d.getVar("CARGO_BUILD_FLAGS", True)
> +    rust_flags =3D d.getVar("RUSTFLAGS", True)
> +    manifest_path =3D d.getVar("MANIFEST_PATH", True)
> +
> +    env =3D os.environ.copy()
> +    env['RUSTFLAGS'] =3D rust_flags
> +    cmd =3D f"{cargo} build --tests --message-format json
> {cargo_build_flags}"
> +    bb.note(f"Building tests with cargo ({cmd})")
> +
> +    try:
> +        proc =3D subprocess.Popen(cmd, shell=3DTrue, env=3Denv,
> stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal(f"Cannot build test with cargo: {e}")
> +
> +    lines =3D []
> +    for line in proc.stdout:
> +        data =3D line.decode('utf-8').strip('\n')
> +        lines.append(data)
> +        bb.note(data)
> +    proc.communicate()
> +    if proc.returncode !=3D 0:
> +        bb.fatal(f"Unable to compile test with cargo, '{cmd}' failed")
> +
> +    # Definition of the format:
> https://doc.rust-lang.org/cargo/reference/external-tools.html#json-messag=
es
> +    test_bins =3D []
> +    for line in lines:
> +        try:
> +            data =3D json.loads(line)
> +        except json.JSONDecodeError:
> +            # skip lines that are not a json
> +            pass
> +        else:
> +            try:
> +                # Filter the test packages coming from the current
> manifest
> +                current_manifest_path =3D
> os.path.normpath(data['manifest_path'])
> +                project_manifest_path =3D os.path.normpath(manifest_path=
)
> +                if current_manifest_path =3D=3D project_manifest_path:
> +                    if data['target']['test'] or
> data['target']['doctest'] and data['executable']:
> +                        test_bins.append(data['executable'])
> +            except KeyError as e:
> +                # skip lines that do not meet the requirements
> +                pass
> +
> +    # All rust project will genrate at least one unit test binary
> +    # It will just run a test suite with 0 tests if the project didn't
> define some
> +    # So it is not expected to have an empty list here
> +    if not test_bins:
> +        bb.fatal("Unable to find any test binaries")
> +
> +    cargo_test_binaries_file =3D d.getVar('CARGO_TEST_BINARIES_FILES', T=
rue)
> +    bb.note(f"Found {len(test_bins)} tests, write their path into
> {cargo_test_binaries_file}")
> +    with open(cargo_test_binaries_file, "w") as f:
> +        for test_bin in test_bins:
> +            f.write(f"{test_bin}\n")
> +
> +}
> +
> +python do_install_ptest_cargo() {
> +    import shutil
> +
> +    dest_dir =3D d.getVar("D", True)
> +    pn =3D d.getVar("PN", True)
> +    ptest_path =3D d.getVar("PTEST_PATH", True)
> +    cargo_test_binaries_file =3D d.getVar('CARGO_TEST_BINARIES_FILES', T=
rue)
> +
> +    ptest_dir =3D os.path.join(dest_dir, ptest_path.lstrip('/'))
> +    os.makedirs(ptest_dir, exist_ok=3DTrue)
> +
> +    test_bins =3D []
> +    with open(cargo_test_binaries_file, "r") as f:
> +        for line in f.readlines():
> +            test_bins.append(line.strip('\n'))
> +
> +    test_paths =3D []
> +    for test_bin in test_bins:
> +        shutil.copy2(test_bin, ptest_dir)
> +        test_paths.append(os.path.join(ptest_path,
> os.path.basename(test_bin)))
> +
> +    ptest_script =3D os.path.join(ptest_dir, "run-ptest")
> +    if os.path.exists(ptest_script):
> +        with open(ptest_script, "a") as f:
> +            f.write(f"\necho \"\"\n")
> +            f.write(f"echo \"## starting to run rust tests ##\"\n")
> +            for test_path in test_paths:
> +                f.write(f"{test_path}\n")
> +    else:
> +        with open(ptest_script, "a") as f:
> +            f.write("#!/bin/sh\n")
> +            for test_path in test_paths:
> +                f.write(f"{test_path}\n")
> +        os.chmod(ptest_script, 0o755)
> +
> +    # this is chown -R root:root ${D}${PTEST_PATH}
> +    for root, dirs, files in os.walk(ptest_dir):
> +        for d in dirs:
> +            shutil.chown(os.path.join(root, d), "root", "root")
> +        for f in files:
> +            shutil.chown(os.path.join(root, f), "root", "root")
> +}
> +
> +do_install_ptest_cargo[dirs] =3D "${B}"
> +do_install_ptest_cargo[doc] =3D "Create or update the run-ptest script w=
ith
> rust test binaries generated"
> +do_compile_ptest_cargo[dirs] =3D "${B}"
> +do_compile_ptest_cargo[doc] =3D "Generate rust test binaries through car=
go"
> +
> +addtask compile_ptest_cargo after do_compile            before
> do_compile_ptest_base
> +addtask install_ptest_cargo after do_install_ptest_base before do_packag=
e
> +
> +python () {
> +    if not bb.data.inherits_class('native', d) and not
> bb.data.inherits_class('cross', d):
> +        d.setVarFlag('do_install_ptest_cargo', 'fakeroot', '1')
> +        d.setVarFlag('do_install_ptest_cargp', 'umask', '022')
>

Auto reader on: "You have a typo on the task name"
Me: "argh, thanks, will correct that in a V4"

:>)

+    # Remove all '*ptest_cargo' tasks when ptest is not enabled
> +    if not(d.getVar('PTEST_ENABLED') =3D=3D "1"):
> +        for i in ['do_compile_ptest_cargo', 'do_install_ptest_cargo']:
> +            bb.build.deltask(i, d)
> +}
> --
> 2.34.1
>
>

--00000000000096fb2c05fa52ac0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le jeu. 27 avr. 2023, 07:21,  &lt;<a href=3D"mailto:fr=
ederic.martinsons@gmail.com">frederic.martinsons@gmail.com</a>&gt; a =C3=A9=
crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Frederic Martinso=
ns &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt;<br>
<br>
This new class offer the capbility to build rust tests and<br>
find them correctly.<br>
Due to non deterministic name of generated binaries, a custom<br>
parsing of build result must be performed.<br>
See <a href=3D"https://github.com/rust-lang/cargo/issues/1924" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://github.com/rust-lang/cargo/issu=
es/1924</a><br>
<br>
All rust project will generate a test binary even if there are<br>
not test defined in source code (the binary will just output<br>
that it ran 0 tests)<br>
<br>
Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinson=
s@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail=
.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/ptest-cargo.bbclass | 129 +++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 129 insertions(+)<br>
=C2=A0create mode 100644 meta/classes-recipe/ptest-cargo.bbclass<br>
<br>
diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/=
ptest-cargo.bbclass<br>
new file mode 100644<br>
index 0000000000..f26d4225d3<br>
--- /dev/null<br>
+++ b/meta/classes-recipe/ptest-cargo.bbclass<br>
@@ -0,0 +1,129 @@<br>
+inherit cargo ptest<br>
+<br>
+CARGO_TEST_BINARIES_FILES ?=3D &quot;${B}/test_binaries_list&quot;<br>
+<br>
+# sadly generated test binary have no deterministic names (<a href=3D"http=
s://github.com/rust-lang/cargo/issues/1924" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://github.com/rust-lang/cargo/issues/1924</a>)<br>
+# which force us to parse the cargo output in json format to find those te=
st binaries<br>
+python do_compile_ptest_cargo() {<br>
+=C2=A0 =C2=A0 import subprocess<br>
+=C2=A0 =C2=A0 import json<br>
+<br>
+=C2=A0 =C2=A0 cargo =3D bb.utils.which(d.getVar(&quot;PATH&quot;), d.getVa=
r(&quot;CARGO&quot;, True))<br>
+=C2=A0 =C2=A0 cargo_build_flags =3D d.getVar(&quot;CARGO_BUILD_FLAGS&quot;=
, True)<br>
+=C2=A0 =C2=A0 rust_flags =3D d.getVar(&quot;RUSTFLAGS&quot;, True)<br>
+=C2=A0 =C2=A0 manifest_path =3D d.getVar(&quot;MANIFEST_PATH&quot;, True)<=
br>
+<br>
+=C2=A0 =C2=A0 env =3D os.environ.copy()<br>
+=C2=A0 =C2=A0 env[&#39;RUSTFLAGS&#39;] =3D rust_flags<br>
+=C2=A0 =C2=A0 cmd =3D f&quot;{cargo} build --tests --message-format json {=
cargo_build_flags}&quot;<br>
+=C2=A0 =C2=A0 bb.note(f&quot;Building tests with cargo ({cmd})&quot;)<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc =3D subprocess.Popen(cmd, shell=3DTrue, e=
nv=3Denv, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&quot;Cannot build test with cargo: =
{e}&quot;)<br>
+<br>
+=C2=A0 =C2=A0 lines =3D []<br>
+=C2=A0 =C2=A0 for line in proc.stdout:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D line.decode(&#39;utf-8&#39;).strip(&#=
39;\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines.append(data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(data)<br>
+=C2=A0 =C2=A0 proc.communicate()<br>
+=C2=A0 =C2=A0 if proc.returncode !=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&quot;Unable to compile test with ca=
rgo, &#39;{cmd}&#39; failed&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # Definition of the format: <a href=3D"https://doc.rust-lang=
.org/cargo/reference/external-tools.html#json-messages" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://doc.rust-lang.org/cargo/reference/exte=
rnal-tools.html#json-messages</a><br>
+=C2=A0 =C2=A0 test_bins =3D []<br>
+=C2=A0 =C2=A0 for line in lines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D json.loads(line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except json.JSONDecodeError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # skip lines that are not a json=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Filter the test =
packages coming from the current manifest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current_manifest_p=
ath =3D os.path.normpath(data[&#39;manifest_path&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 project_manifest_p=
ath =3D os.path.normpath(manifest_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if current_manifes=
t_path =3D=3D project_manifest_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d=
ata[&#39;target&#39;][&#39;test&#39;] or data[&#39;target&#39;][&#39;doctes=
t&#39;] and data[&#39;executable&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test_bins.append(data[&#39;executable&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # skip lines that =
do not meet the requirements<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 # All rust project will genrate at least one unit test binar=
y<br>
+=C2=A0 =C2=A0 # It will just run a test suite with 0 tests if the project =
didn&#39;t define some<br>
+=C2=A0 =C2=A0 # So it is not expected to have an empty list here<br>
+=C2=A0 =C2=A0 if not test_bins:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Unable to find any test binarie=
s&quot;)<br>
+<br>
+=C2=A0 =C2=A0 cargo_test_binaries_file =3D d.getVar(&#39;CARGO_TEST_BINARI=
ES_FILES&#39;, True)<br>
+=C2=A0 =C2=A0 bb.note(f&quot;Found {len(test_bins)} tests, write their pat=
h into {cargo_test_binaries_file}&quot;)<br>
+=C2=A0 =C2=A0 with open(cargo_test_binaries_file, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for test_bin in test_bins:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;{test_bin}\n&quot=
;)<br>
+<br>
+}<br>
+<br>
+python do_install_ptest_cargo() {<br>
+=C2=A0 =C2=A0 import shutil<br>
+<br>
+=C2=A0 =C2=A0 dest_dir =3D d.getVar(&quot;D&quot;, True)<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&quot;PN&quot;, True)<br>
+=C2=A0 =C2=A0 ptest_path =3D d.getVar(&quot;PTEST_PATH&quot;, True)<br>
+=C2=A0 =C2=A0 cargo_test_binaries_file =3D d.getVar(&#39;CARGO_TEST_BINARI=
ES_FILES&#39;, True)<br>
+<br>
+=C2=A0 =C2=A0 ptest_dir =3D os.path.join(dest_dir, ptest_path.lstrip(&#39;=
/&#39;))<br>
+=C2=A0 =C2=A0 os.makedirs(ptest_dir, exist_ok=3DTrue)<br>
+<br>
+=C2=A0 =C2=A0 test_bins =3D []<br>
+=C2=A0 =C2=A0 with open(cargo_test_binaries_file, &quot;r&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f.readlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_bins.append(line.strip(&#39=
;\n&#39;))<br>
+<br>
+=C2=A0 =C2=A0 test_paths =3D []<br>
+=C2=A0 =C2=A0 for test_bin in test_bins:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(test_bin, ptest_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_paths.append(os.path.join(ptest_path, os.=
path.basename(test_bin)))<br>
+<br>
+=C2=A0 =C2=A0 ptest_script =3D os.path.join(ptest_dir, &quot;run-ptest&quo=
t;)<br>
+=C2=A0 =C2=A0 if os.path.exists(ptest_script):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(ptest_script, &quot;a&quot;) as f:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;\necho \&quot;\&q=
uot;\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;echo \&quot;## st=
arting to run rust tests ##\&quot;\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for test_path in test_paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;{te=
st_path}\n&quot;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(ptest_script, &quot;a&quot;) as f:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;#!/bin/sh\n&quot;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for test_path in test_paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;{te=
st_path}\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(ptest_script, 0o755)<br>
+<br>
+=C2=A0 =C2=A0 # this is chown -R root:root ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 for root, dirs, files in os.walk(ptest_dir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in dirs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.chown(os.path.join(root, =
d), &quot;root&quot;, &quot;root&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.chown(os.path.join(root, =
f), &quot;root&quot;, &quot;root&quot;)<br>
+}<br>
+<br>
+do_install_ptest_cargo[dirs] =3D &quot;${B}&quot;<br>
+do_install_ptest_cargo[doc] =3D &quot;Create or update the run-ptest scrip=
t with rust test binaries generated&quot;<br>
+do_compile_ptest_cargo[dirs] =3D &quot;${B}&quot;<br>
+do_compile_ptest_cargo[doc] =3D &quot;Generate rust test binaries through =
cargo&quot;<br>
+<br>
+addtask compile_ptest_cargo after do_compile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 before do_compile_ptest_base<br>
+addtask install_ptest_cargo after do_install_ptest_base before do_package<=
br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if not bb.data.inherits_class(&#39;native&#39;, d) and not b=
b.data.inherits_class(&#39;cross&#39;, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_install_ptest_cargo&#39;,=
 &#39;fakeroot&#39;, &#39;1&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_install_ptest_cargp&#39;,=
 &#39;umask&#39;, &#39;022&#39;)<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Auto reader on: &quot;You have a typo on th=
e task name&quot;=C2=A0</div><div dir=3D"auto">Me: &quot;argh, thanks, will=
 correct that in a V4&quot;=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">:&gt;)=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 # Remove all &#39;*ptest_cargo&#39; tasks when ptest is not =
enabled<br>
+=C2=A0 =C2=A0 if not(d.getVar(&#39;PTEST_ENABLED&#39;) =3D=3D &quot;1&quot=
;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in [&#39;do_compile_ptest_cargo&#39;, &#=
39;do_install_ptest_cargo&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.deltask(i, d)<br>
+}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div></div>

--00000000000096fb2c05fa52ac0d--

