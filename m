Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352F1C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:42:47 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web08.8056.1642171366571353661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n4fM4uxe;
 spf=pass (domain: gmail.com, ip: 209.85.166.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id f24so6691257ioc.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2RMBuhypo2gEXLbf++R6n/gzrsLCSdKojm8f5kflohg=;
        b=n4fM4uxe5S2y3WOAarqylO15Nsk+OvEUJfPd+iEj5Br3wA+7NWarbkgM9JKGt3ir9p
         QbFGJgED3YOwLlnaJMkACj4wzqbY/R7bRpZqTyccXdPgKm2l1XOahH/i+nKQHBVCsZZy
         RCylQSyj6H/ej5c9AeINDZCIVRPUc7Bx4/alGfC0KUsj53AjLHPjzoxPWnLjZeWCzWhA
         CRB1FBZMaNdmAruzaUTCNxJZTP+9BdDAwbFjLXVCXwAS7/IEdRgXUfvxZMpsNDFNXkJR
         +r0+SBG8smPFR6bRZH0Uno4QO0FiDLbr4yT8aocJESlvkiVvAv8NDTgJm2jPtnRzDn7X
         N88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2RMBuhypo2gEXLbf++R6n/gzrsLCSdKojm8f5kflohg=;
        b=Sq4BvKOBF1XHyW8dUpaDuJNLYiSPww/RmnYX0f7fUtV/NAvG7BHIzTf24UsWN5BKO3
         nEKmLSCWuk8SgdY971Y91IN5ASoFRuOQ7LbeJL9QpHxj5wgyGkak/xXBjb0J1+KmiUq9
         gj1XVSoufaPaNdmSeSf5Bn6ZiC+M0Az70ocsZ2uJPYaM57lNtmSK1R5T7hLbQfOnniQa
         X3gId03UkxQE3+hGZcQYQl9Xzvt+Sl0/MeEkE16WjhIk8H3Tf+t50XPNMBmi8fTbCIYL
         AgcwP9/62ru5YiGS+QzdyfUIQ0WZhdJSIx1v4Pqc4ZHKWVsbps2rKxKcHd0GjXdyzIv1
         vcWQ==
X-Gm-Message-State: AOAM530Q8tnP031nP8Nnv7kNxzQcanuVrhkJBCay39f+ZhpurEggDJ+V
	Wm8Lj2lP3MZaZwk6UthvvvYsRyxZubLbxd5rMIU=
X-Google-Smtp-Source: 
 ABdhPJzLD5b9SbwwH3ZBYawKSWV6TIoZV3QYdvQU4PGH+Y0SfWg2kqYPfKY32E5TgtETtwusVnqku5f7av5qyXR2bMk=
X-Received: by 2002:a5d:91c7:: with SMTP id k7mr4466290ior.151.1642171365887;
 Fri, 14 Jan 2022 06:42:45 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAL1ChxrincK92a9tFxq=O6j8wNpccdebywqoeYMS+He1ED4tTA@mail.gmail.com>
In-Reply-To: 
 <CAL1ChxrincK92a9tFxq=O6j8wNpccdebywqoeYMS+He1ED4tTA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jan 2022 15:42:34 +0100
Message-ID: 
 <CANNYZj_z2RsfGLaAaJHEBb+P5JT3CNikobgrq00FW9fkGH6UgQ@mail.gmail.com>
Subject: Re: [OE-core] [rust] error: the crate panic_abort does not have the
 panic strategy abort
To: Francesco Pham <pham.francesco@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ec916105d58bd00e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 14:42:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160570

--000000000000ec916105d58bd00e
Content-Type: text/plain; charset="UTF-8"

Perhaps you could look at how this is handled in mozjs recipe in meta-oe, I
vaguely remember it forces panic strategy to something incompatible and I
patched it to match..

Alex

On Fri, 14 Jan 2022 at 15:21, Francesco Pham <pham.francesco@gmail.com>
wrote:

> Hi,
> the following error appears when trying to build a simple rust hello
> world that uses panic set to abort mode.
>
> > | DEBUG: Executing shell function do_compile
> > | NOTE: cargo =
> /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/recipe-sysroot-native/usr/bin/cargo
> > | NOTE: rustc =
> > | NOTE: cargo build -v --target x86_64-poky-linux --release
> --manifest-path=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/git//Cargo.toml
> > |    Compiling rust-hello-world v0.0.1
> (/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/git)
> > |     Building [                             ] 0/1: rust-hello-world(bin)
> > |      Running `rustc --crate-name rust_hello_world --edition=2018 src/
> main.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C opt-level=3 -C panic=abort -C lto -C
> metadata=38cc6f415494c65c -C extra-filename=-38cc6f415494c65c --out-dir
> /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps
> --target x86_64-poky-linux -C
> linker=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps
> -L
> dependency=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/build/target/release/deps
> -L
> /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0=/usr/src/debug/rust-panic-test/git-r0`
> > | error: the crate `panic_abort` does not have the panic strategy `abort`
> > |
> > | error: aborting due to previous error
> > |
> > | error: could not compile `rust-hello-world`
> > |
> > | Caused by:
> > |   process didn't exit successfully: `rustc --crate-name
> rust_hello_world --edition=2018 src/main.rs --error-format=json
> --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C
> opt-level=3 -C panic=abort -C lto -C metadata=38cc6f415494c65c -C
> extra-filename=-38cc6f415494c65c --out-dir
> /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps
> --target x86_64-poky-linux -C
> linker=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps
> -L
> dependency=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/build/target/release/deps
> -L
> /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0=/usr/src/debug/rust-panic-test/git-r0`
> (exit status: 1)
> > | WARNING: exit code 101 from a shell command.
>
> A similar error also appears when the panic strategy is set to unwind
> The recipe, generated using cargo bitbake, is as follows:
>
> > inherit cargo
> > SRC_URI += "git://
> git@github.com/frankplus/rust-hello-world.git;protocol=https;branch=master
> "
> > SRCREV = "68b7f7ee7df6e08a0411ba7157761145c43baf5d"
> > S = "${WORKDIR}/git"
> > SUMMARY = "rust-hello-world"
> > HOMEPAGE = "https://github.com/frankplus/rust-hello-world"
> > LICENSE = "MIT | Apache-2.0"
> > LIC_FILES_CHKSUM =
> "file://COPYRIGHT;md5=e6b2207ac3740d2d01141c49208c2147"
>
> Version: honister @ f286eef, master @ f9f3e1
> Component: meta/recipes-devtools/rust
> Relate-to: https://github.com/meta-rust/meta-rust/issues/343
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160568):
> https://lists.openembedded.org/g/openembedded-core/message/160568
> Mute This Topic: https://lists.openembedded.org/mt/88421290/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ec916105d58bd00e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Perhaps you could look at how this is handled in mozj=
s recipe in meta-oe, I vaguely remember it forces panic strategy to somethi=
ng incompatible and I patched it to match..</div><div><br></div><div>Alex<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, 14 Jan 2022 at 15:21, Francesco Pham &lt;<a href=3D"mailto:=
pham.francesco@gmail.com">pham.francesco@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
the following error appears when trying to build a simple rust hello<br>
world that uses panic set to abort mode.<br>
<br>
&gt; | DEBUG: Executing shell function do_compile<br>
&gt; | NOTE: cargo =3D /home/francesco/Desktop/poky/build/tmp/work/core2-64=
-poky-linux/rust-panic-test/git-r0/recipe-sysroot-native/usr/bin/cargo<br>
&gt; | NOTE: rustc =3D<br>
&gt; | NOTE: cargo build -v --target x86_64-poky-linux --release --manifest=
-path=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rus=
t-panic-test/git-r0/git//Cargo.toml<br>
&gt; |=C2=A0 =C2=A0 Compiling rust-hello-world v0.0.1 (/home/francesco/Desk=
top/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/git)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 0/1: ru=
st-hello-world(bin)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rust_hello_world --e=
dition=3D2018 src/<a href=3D"http://main.rs" rel=3D"noreferrer" target=3D"_=
blank">main.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi =
--crate-type bin --emit=3Ddep-info,link -C opt-level=3D3 -C panic=3Dabort -=
C lto -C metadata=3D38cc6f415494c65c -C extra-filename=3D-38cc6f415494c65c =
--out-dir /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/r=
ust-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps --target =
x86_64-poky-linux -C linker=3D/home/francesco/Desktop/poky/build/tmp/work/c=
ore2-64-poky-linux/rust-panic-test/git-r0/wrapper/target-rust-ccld -L depen=
dency=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rus=
t-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps -L dependen=
cy=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-p=
anic-test/git-r0/build/target/release/deps -L /home/francesco/Desktop/poky/=
build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/recipe-sysroot/us=
r/lib/rust --remap-path-prefix=3D/home/francesco/Desktop/poky/build/tmp/wor=
k/core2-64-poky-linux/rust-panic-test/git-r0=3D/usr/src/debug/rust-panic-te=
st/git-r0`<br>
&gt; | error: the crate `panic_abort` does not have the panic strategy `abo=
rt`<br>
&gt; |<br>
&gt; | error: aborting due to previous error<br>
&gt; |<br>
&gt; | error: could not compile `rust-hello-world`<br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 =C2=A0process didn&#39;t exit successfully: `rustc --crate-nam=
e rust_hello_world --edition=3D2018 src/<a href=3D"http://main.rs" rel=3D"n=
oreferrer" target=3D"_blank">main.rs</a> --error-format=3Djson --json=3Ddia=
gnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link -C opt-level=
=3D3 -C panic=3Dabort -C lto -C metadata=3D38cc6f415494c65c -C extra-filena=
me=3D-38cc6f415494c65c --out-dir /home/francesco/Desktop/poky/build/tmp/wor=
k/core2-64-poky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux=
/release/deps --target x86_64-poky-linux -C linker=3D/home/francesco/Deskto=
p/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/wrapper/ta=
rget-rust-ccld -L dependency=3D/home/francesco/Desktop/poky/build/tmp/work/=
core2-64-poky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/r=
elease/deps -L dependency=3D/home/francesco/Desktop/poky/build/tmp/work/cor=
e2-64-poky-linux/rust-panic-test/git-r0/build/target/release/deps -L /home/=
francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/g=
it-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/francesco/Des=
ktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0=3D/usr/=
src/debug/rust-panic-test/git-r0` (exit status: 1)<br>
&gt; | WARNING: exit code 101 from a shell command.<br>
<br>
A similar error also appears when the panic strategy is set to unwind<br>
The recipe, generated using cargo bitbake, is as follows:<br>
<br>
&gt; inherit cargo<br>
&gt; SRC_URI +=3D &quot;git://<a href=3D"http://git@github.com/frankplus/ru=
st-hello-world.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" tar=
get=3D"_blank">git@github.com/frankplus/rust-hello-world.git;protocol=3Dhtt=
ps;branch=3Dmaster</a>&quot;<br>
&gt; SRCREV =3D &quot;68b7f7ee7df6e08a0411ba7157761145c43baf5d&quot;<br>
&gt; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; SUMMARY =3D &quot;rust-hello-world&quot;<br>
&gt; HOMEPAGE =3D &quot;<a href=3D"https://github.com/frankplus/rust-hello-=
world" rel=3D"noreferrer" target=3D"_blank">https://github.com/frankplus/ru=
st-hello-world</a>&quot;<br>
&gt; LICENSE =3D &quot;MIT | Apache-2.0&quot;<br>
&gt; LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3De6b2207ac3740d2d0114=
1c49208c2147&quot;<br>
<br>
Version: honister @ f286eef, master @ f9f3e1<br>
Component: meta/recipes-devtools/rust<br>
Relate-to: <a href=3D"https://github.com/meta-rust/meta-rust/issues/343" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/meta-rust/meta-rust/i=
ssues/343</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160568): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160568" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160568</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88421290/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88421290/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ec916105d58bd00e--

