Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1019EC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 08:08:50 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web12.28862.1641802128621907960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 00:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HKaIiC+q;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id l15so10498684uai.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 00:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9lZeHuxwwUCwLlyZ68HT/QpVd+mBm7mXDHEeWAmIm4A=;
        b=HKaIiC+q9SFW7ZLjI+aG5u1SwU6v0aGbIxsC+eiNyqkK+5MTrOKQTGJawW8hTqNETn
         OqFWAQ9GCvTdWE5XxOFn3Awo+KMX0XCWy6p0w3hc7xEl3Fr+kkKFRELdhWMqPu/ReaZP
         4WU8c1EX64g84UZdbpasrzVvTenPUiOG9zZXtoG4Orc0B7RoD/IkdJlooqf3lYC++16c
         zzGpQQ5U0AubjLOTYqE+E1oLAgXwZ93+QMaSlZ80cyeQ+ljS9VxvH2x4jpX7nYjl9Cs2
         Kf5QDTT/0KbBRZ9rOPdXNZ6KGO0ctQsI5uJEjF1fS7eeDVyjzSlnHeLrm7griISe3WHa
         qxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9lZeHuxwwUCwLlyZ68HT/QpVd+mBm7mXDHEeWAmIm4A=;
        b=e/qHuV8Zhxr9Q5ZnlWVKRh/ei9i8aG5zta6qrDJ5xMnhBIF5R30l7jJXii/NvLOq5M
         OYU0Hu+HNq1XVQXFzaKaC/XIOVt9RuO2uG7O+hRbZdnwXzJubWagPXxqyM3ztS9qxOKd
         WoIivmahnq7vZhdGVX5I8cUrkZWb5vd7jj35wJVFBbBOJcH1ihzfnnVNPCEBX4jlcKi/
         GRuiCAwZXLhUX/y+TCiTI30GTvcGq03oqdqNSczIun/zDfPf8rIcja0+j01lYqF7CDm0
         kmgFoa6oGDxupaTnpNYUxf2D++nb7REy+if7kGfN5fxO+5AWLWZ6o4VcXXxtBqd6Jlwc
         sNgw==
X-Gm-Message-State: AOAM532MRwIXJZhEp3aIziMauvKq7R9G9QfnrHG0YKTdyGpL4Cvl7GNP
	6FylGmzBRDFvQqG8axOy5tzSGXOwOhbi4DHFkww=
X-Google-Smtp-Source: 
 ABdhPJzJ6W7nQjQXi/E8+yZhtcoA2V+IX4ih8dizNtzb65P3w35S0hdYAOZKyNHf4wctJAVYD+9/4a57j6ttaU2Mc2k=
X-Received: by 2002:a05:6102:f0e:: with SMTP id
 v14mr25303590vss.45.1641802127633;
 Mon, 10 Jan 2022 00:08:47 -0800 (PST)
MIME-Version: 1.0
References: <20220101112959.1866747-1-alex@linutronix.de>
 <20220101112959.1866747-3-alex@linutronix.de>
 <CALT56yMfCmtcbzxs+j=R0NJZZLAMtVenZgbj0rzR0+gzXnpLvw@mail.gmail.com>
In-Reply-To: 
 <CALT56yMfCmtcbzxs+j=R0NJZZLAMtVenZgbj0rzR0+gzXnpLvw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jan 2022 09:08:36 +0100
Message-ID: 
 <CANNYZj9rFvsK-tBr+0_H_69=1peh4HkH9nqwj6o168x0G5u23w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] go: correctly set debug-prefix-map and
 build directory
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000009bf1a905d535d886"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 08:08:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160339

--0000000000009bf1a905d535d886
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

aarch64-linaro-linux-gcc: error: ${SECURITY_LDFLAGS}: No such file or
directory

You need to find out why the variable isn't expanded. 'bitbake -e
go-runtime' may help.

Alex

On Mon, 10 Jan 2022 at 05:34, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote=
:

> =D1=81=D0=B1, 1 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 14:30, Alexander =
Kanavin <alex.kanavin@gmail.com>:
> >
> > Go has its own system for creating temporary build
> > sub-directories with randomized names, and setting
> > up debug-prefix-map on the fly to prevent those
> > directories leaking into target binaries. OE's own
> > settings were clashing with it, so this change
> > carefully avoids the two stepping on each other.
> >
> > Additionally, the top level build directory cannot
> > be named 'go-something'.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
> This patch breaks the build here, with the following error messages
> (full log attached):
>
> | HASH[build go/importer]
> | HASH[build go/importer]: "go1.17.5"
> | HASH[build go/importer]: "compile\n"
> | HASH[build go/importer]: "goos linux goarch arm64\n"
> | HASH[build go/importer]: "import \"go/importer\"\n"
> | HASH[build go/importer]: "omitdebug false standard true local false
> prefix \"\"\n"
> | HASH[build go/importer]: "modinfo \"\"\n"
> | HASH[build go/importer]: "compile compile version go1.17.5 [] []\n"
> | HASH[build go/importer]: "=3D\n"
> | HASH
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/go/src/go/importer/importer.go:
> 030536f1a71bcd0c3615684f4b94373b4136a282de9e6cd9d283e454704be386
> | HASH[build go/importer]: "file importer.go AwU28acbzQw2FWhPS5Q3\n"
> | HASH[build go/importer]: "import go/build XGXQDTt1BQjYRjE7nFi7\n"
> | HASH[build go/importer]: "import go/internal/gccgoimporter
> MqGIqtLxk8pkuc9XENIo\n"
> | HASH[build go/importer]: "import go/internal/gcimporter
> U16uHUOXrDggYRgVMENf\n"
> | HASH[build go/importer]: "import go/internal/srcimporter
> vtV3UGYK55GaAj4JI8MN\n"
> | HASH[build go/importer]: "import go/token 36MC7EMX8CqyCcPmrSmS\n"
> | HASH[build go/importer]: "import go/types EyjwGzDrQ1CtOXxe_UYb\n"
> | HASH[build go/importer]: "import io A3HnNVYVSU1F06BuLR5o\n"
> | HASH[build go/importer]: "import runtime TtpuHdFJwA5GfsHmM2LT\n"
> | HASH[build go/importer]:
> b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d
> | HASH subkey
> b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d
> "srcfiles" =3D
> e6f8fcd87c2dd28b3381ad27b9938048b5b3bde6a19db4a4837e184ef9cef82a
> | HASH subkey
> b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d
> "stdout" =3D 3cb42089ec7038a91addcc400ee71ea90feee998a35e992b699729f04ae8=
5c1a
> | go tool dist: FAILED:
>
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/go/pkg/tool/native_native/go_bootstrap
> install -gcflags=3Dall=3D -ldflags=3Dall=3D std: exit status 2
> | WARNING:
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/temp/run.do_compile.2219939:175
> exit 2 from './make.bash --target-only --no-banner std'
> | WARNING: Backtrace (BB generated script):
> | #1: do_compile,
>
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,
> line 175
> | #2: main,
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,
> line 185
>
>
> > ---
> >  meta/classes/go.bbclass                 |  2 +-
> >  meta/recipes-devtools/go/go-common.inc  |  2 +-
> >  meta/recipes-devtools/go/go-runtime.inc |  7 ++++++-
> >  meta/recipes-devtools/go/go-target.inc  | 10 ++++++++++
> >  4 files changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > index 5c1fdd7d5f..9c4c92bffd 100644
> > --- a/meta/classes/go.bbclass
> > +++ b/meta/classes/go.bbclass
> > @@ -67,7 +67,7 @@ GO_INSTALL_FILTEROUT ?=3D "${GO_IMPORT}/vendor/"
> >
> >  B =3D "${WORKDIR}/build"
> >  export GOPATH =3D "${B}"
> > -export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> > +export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
> >  GOTMPDIR[vardepvalue] =3D ""
> >
> >  python go_do_unpack() {
> > diff --git a/meta/recipes-devtools/go/go-common.inc
> b/meta/recipes-devtools/go/go-common.inc
> > index 5bbf35b787..83f8db7b39 100644
> > --- a/meta/recipes-devtools/go/go-common.inc
> > +++ b/meta/recipes-devtools/go/go-common.inc
> > @@ -23,7 +23,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> >  SSTATE_SCAN_CMD =3D "true"
> >
> >  export GOROOT_OVERRIDE =3D "1"
> > -export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> > +export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
> >  GOTMPDIR[vardepvalue] =3D ""
> >  export CGO_ENABLED =3D "1"
> >
> > diff --git a/meta/recipes-devtools/go/go-runtime.inc
> b/meta/recipes-devtools/go/go-runtime.inc
> > index 617e6b5414..a08d44dd3a 100644
> > --- a/meta/recipes-devtools/go/go-runtime.inc
> > +++ b/meta/recipes-devtools/go/go-runtime.inc
> > @@ -2,10 +2,15 @@ DEPENDS =3D "virtual/${TUNE_PKGARCH}-go go-native"
> >  DEPENDS:class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk"
> >  PROVIDES =3D "virtual/${TARGET_PREFIX}go-runtime"
> >
> > +DEBUG_PREFIX_MAP =3D "\
> > +                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > +                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > +"
> > +
> >  export CGO_CFLAGS =3D "${CFLAGS}"
> >  export CGO_CPPFLAGS =3D "${CPPFLAGS}"
> >  export CGO_CXXFLAGS =3D "${CXXFLAGS}"
> > -export CGO_LDFLAGS =3D "${LDFLAGS}"
> > +export CGO_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
> ${SECURITY_LDFLAGS}"
> >  export GOCACHE =3D "${B}/.cache"
> >
> >  GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
> > diff --git a/meta/recipes-devtools/go/go-target.inc
> b/meta/recipes-devtools/go/go-target.inc
> > index 47b4411d54..51f1b79cc3 100644
> > --- a/meta/recipes-devtools/go/go-target.inc
> > +++ b/meta/recipes-devtools/go/go-target.inc
> > @@ -1,6 +1,16 @@
> >  DEPENDS =3D "virtual/${TUNE_PKGARCH}-go go-native"
> >  DEPENDS:class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk
> go-native"
> >
> > +DEBUG_PREFIX_MAP =3D "\
> > +                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > +                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > +"
> > +
> > +export CGO_CFLAGS =3D "${CFLAGS}"
> > +export CGO_CPPFLAGS =3D "${CPPFLAGS}"
> > +export CGO_CXXFLAGS =3D "${CXXFLAGS}"
> > +export CGO_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
> ${SECURITY_LDFLAGS}"
> > +
> >  export GOCACHE =3D "${B}/.cache"
> >  GO_LDFLAGS =3D ""
> >  GO_LDFLAGS:class-nativesdk =3D "-linkmode external"
> > --
> > 2.20.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#160096):
> https://lists.openembedded.org/g/openembedded-core/message/160096
> > Mute This Topic: https://lists.openembedded.org/mt/88071320/3618183
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> dbaryshkov@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> With best wishes
> Dmitry
>

--0000000000009bf1a905d535d886
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>aarch64-linaro-linux-gcc: error: ${SECURITY_LDFLAGS}:=
 No such file or directory</div><div><br></div><div>You need to find out wh=
y the variable isn&#39;t expanded. &#39;bitbake -e go-runtime&#39; may help=
.<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 10 Jan 2022 at 05:34, =
Dmitry Baryshkov &lt;<a href=3D"mailto:dbaryshkov@gmail.com">dbaryshkov@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">=D1=81=D0=B1, 1 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 14:30, Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank"=
>alex.kanavin@gmail.com</a>&gt;:<br>
&gt;<br>
&gt; Go has its own system for creating temporary build<br>
&gt; sub-directories with randomized names, and setting<br>
&gt; up debug-prefix-map on the fly to prevent those<br>
&gt; directories leaking into target binaries. OE&#39;s own<br>
&gt; settings were clashing with it, so this change<br>
&gt; carefully avoids the two stepping on each other.<br>
&gt;<br>
&gt; Additionally, the top level build directory cannot<br>
&gt; be named &#39;go-something&#39;.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
<br>
This patch breaks the build here, with the following error messages<br>
(full log attached):<br>
<br>
| HASH[build go/importer]<br>
| HASH[build go/importer]: &quot;go1.17.5&quot;<br>
| HASH[build go/importer]: &quot;compile\n&quot;<br>
| HASH[build go/importer]: &quot;goos linux goarch arm64\n&quot;<br>
| HASH[build go/importer]: &quot;import \&quot;go/importer\&quot;\n&quot;<b=
r>
| HASH[build go/importer]: &quot;omitdebug false standard true local false<=
br>
prefix \&quot;\&quot;\n&quot;<br>
| HASH[build go/importer]: &quot;modinfo \&quot;\&quot;\n&quot;<br>
| HASH[build go/importer]: &quot;compile compile version go1.17.5 [] []\n&q=
uot;<br>
| HASH[build go/importer]: &quot;=3D\n&quot;<br>
| HASH /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-=
linux/go-runtime/1.17.5-r0/go/src/go/importer/importer.go:<br>
030536f1a71bcd0c3615684f4b94373b4136a282de9e6cd9d283e454704be386<br>
| HASH[build go/importer]: &quot;file importer.go AwU28acbzQw2FWhPS5Q3\n&qu=
ot;<br>
| HASH[build go/importer]: &quot;import go/build XGXQDTt1BQjYRjE7nFi7\n&quo=
t;<br>
| HASH[build go/importer]: &quot;import go/internal/gccgoimporter<br>
MqGIqtLxk8pkuc9XENIo\n&quot;<br>
| HASH[build go/importer]: &quot;import go/internal/gcimporter<br>
U16uHUOXrDggYRgVMENf\n&quot;<br>
| HASH[build go/importer]: &quot;import go/internal/srcimporter<br>
vtV3UGYK55GaAj4JI8MN\n&quot;<br>
| HASH[build go/importer]: &quot;import go/token 36MC7EMX8CqyCcPmrSmS\n&quo=
t;<br>
| HASH[build go/importer]: &quot;import go/types EyjwGzDrQ1CtOXxe_UYb\n&quo=
t;<br>
| HASH[build go/importer]: &quot;import io A3HnNVYVSU1F06BuLR5o\n&quot;<br>
| HASH[build go/importer]: &quot;import runtime TtpuHdFJwA5GfsHmM2LT\n&quot=
;<br>
| HASH[build go/importer]:<br>
b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d<br>
| HASH subkey b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86=
a7d<br>
&quot;srcfiles&quot; =3D e6f8fcd87c2dd28b3381ad27b9938048b5b3bde6a19db4a483=
7e184ef9cef82a<br>
| HASH subkey b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86=
a7d<br>
&quot;stdout&quot; =3D 3cb42089ec7038a91addcc400ee71ea90feee998a35e992b6997=
29f04ae85c1a<br>
| go tool dist: FAILED:<br>
/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux/g=
o-runtime/1.17.5-r0/go/pkg/tool/native_native/go_bootstrap<br>
install -gcflags=3Dall=3D -ldflags=3Dall=3D std: exit status 2<br>
| WARNING: /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-lin=
aro-linux/go-runtime/1.17.5-r0/temp/run.do_compile.2219939:175<br>
exit 2 from &#39;./make.bash --target-only --no-banner std&#39;<br>
| WARNING: Backtrace (BB generated script):<br>
| #1: do_compile,<br>
/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux/g=
o-runtime/1.17.5-r0/temp/run.do_compile.2219939,<br>
line 175<br>
| #2: main, /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-li=
naro-linux/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,<br>
line 185<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-common.inc=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-runtime.inc |=C2=A0 7 ++++++-<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-target.inc=C2=A0 | 10 ++++++++++<br>
&gt;=C2=A0 4 files changed, 18 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br>
&gt; index 5c1fdd7d5f..9c4c92bffd 100644<br>
&gt; --- a/meta/classes/go.bbclass<br>
&gt; +++ b/meta/classes/go.bbclass<br>
&gt; @@ -67,7 +67,7 @@ GO_INSTALL_FILTEROUT ?=3D &quot;${GO_IMPORT}/vendor/=
&quot;<br>
&gt;<br>
&gt;=C2=A0 B =3D &quot;${WORKDIR}/build&quot;<br>
&gt;=C2=A0 export GOPATH =3D &quot;${B}&quot;<br>
&gt; -export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
&gt; +export GOTMPDIR ?=3D &quot;${WORKDIR}/build-tmp&quot;<br>
&gt;=C2=A0 GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 python go_do_unpack() {<br>
&gt; diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-dev=
tools/go/go-common.inc<br>
&gt; index 5bbf35b787..83f8db7b39 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-common.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-common.inc<br>
&gt; @@ -23,7 +23,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&gt;=C2=A0 SSTATE_SCAN_CMD =3D &quot;true&quot;<br>
&gt;<br>
&gt;=C2=A0 export GOROOT_OVERRIDE =3D &quot;1&quot;<br>
&gt; -export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
&gt; +export GOTMPDIR ?=3D &quot;${WORKDIR}/build-tmp&quot;<br>
&gt;=C2=A0 GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
&gt;=C2=A0 export CGO_ENABLED =3D &quot;1&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-de=
vtools/go/go-runtime.inc<br>
&gt; index 617e6b5414..a08d44dd3a 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-runtime.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-runtime.inc<br>
&gt; @@ -2,10 +2,15 @@ DEPENDS =3D &quot;virtual/${TUNE_PKGARCH}-go go-nati=
ve&quot;<br>
&gt;=C2=A0 DEPENDS:class-nativesdk =3D &quot;virtual/${TARGET_PREFIX}go-cro=
sssdk&quot;<br>
&gt;=C2=A0 PROVIDES =3D &quot;virtual/${TARGET_PREFIX}go-runtime&quot;<br>
&gt;<br>
&gt; +DEBUG_PREFIX_MAP =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 export CGO_CFLAGS =3D &quot;${CFLAGS}&quot;<br>
&gt;=C2=A0 export CGO_CPPFLAGS =3D &quot;${CPPFLAGS}&quot;<br>
&gt;=C2=A0 export CGO_CXXFLAGS =3D &quot;${CXXFLAGS}&quot;<br>
&gt; -export CGO_LDFLAGS =3D &quot;${LDFLAGS}&quot;<br>
&gt; +export CGO_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNE=
EDED} ${SECURITY_LDFLAGS}&quot;<br>
&gt;=C2=A0 export GOCACHE =3D &quot;${B}/.cache&quot;<br>
&gt;<br>
&gt;=C2=A0 GO_EXTLDFLAGS ?=3D &quot;${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${L=
DFLAGS}&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-dev=
tools/go/go-target.inc<br>
&gt; index 47b4411d54..51f1b79cc3 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-target.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-target.inc<br>
&gt; @@ -1,6 +1,16 @@<br>
&gt;=C2=A0 DEPENDS =3D &quot;virtual/${TUNE_PKGARCH}-go go-native&quot;<br>
&gt;=C2=A0 DEPENDS:class-nativesdk =3D &quot;virtual/${TARGET_PREFIX}go-cro=
sssdk go-native&quot;<br>
&gt;<br>
&gt; +DEBUG_PREFIX_MAP =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +export CGO_CFLAGS =3D &quot;${CFLAGS}&quot;<br>
&gt; +export CGO_CPPFLAGS =3D &quot;${CPPFLAGS}&quot;<br>
&gt; +export CGO_CXXFLAGS =3D &quot;${CXXFLAGS}&quot;<br>
&gt; +export CGO_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNE=
EDED} ${SECURITY_LDFLAGS}&quot;<br>
&gt; +<br>
&gt;=C2=A0 export GOCACHE =3D &quot;${B}/.cache&quot;<br>
&gt;=C2=A0 GO_LDFLAGS =3D &quot;&quot;<br>
&gt;=C2=A0 GO_LDFLAGS:class-nativesdk =3D &quot;-linkmode external&quot;<br=
>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#160096): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/160096" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/160096</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88071320=
/3618183" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88071320/3618183</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:dbaryshkov@gmail.com"=
 target=3D"_blank">dbaryshkov@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--0000000000009bf1a905d535d886--

