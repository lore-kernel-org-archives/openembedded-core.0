Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA23C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 03:17:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.1864.1646968670061273586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 19:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bPSFCndW;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: ticotimo@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id q14so10995434wrc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 19:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VMbAZkrt9mR+mpypm76aKKdZZL3Ll3VGWg9Q09BbSs=;
        b=bPSFCndWwPa2/Ww1NZ+n3BPXZdP2kj8VULQfDMctQl1cNjhEOvwfMEqmISg52qIaz3
         J5fSf28MgLN5hxphBZkv4iZWA+/8sGMnVMzsqp0k1UCLblphLMCAVz3obDxDshWlJy/G
         OQDYIil6dX4EO7wuKdonqJN2iFfSMlK4mdBO27CVTxpUC3C7uRCQLKg23JWGBQyLkOtc
         vfofxiFdC7gnVs86frc46A6JFKoH7AkTZzzGEL19MDRv6Y/2DDkYuxCmCyeG6x0gLciI
         VacQrR2a8dz78ziKuQXsg7g0ZJtYREgQk8XdSvn+C17Z4nliK3qxLwE4Oel58BcMIwbx
         NtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VMbAZkrt9mR+mpypm76aKKdZZL3Ll3VGWg9Q09BbSs=;
        b=rH1ubg3Ju7tx0RWWN9vIVduA++tZZIellmNdzSOGiuUpVN6AyzUusWMWl9EzLmuQc4
         s0ehqSrVB1BQwqGqZymiWotPE4q2+ShVjbQSdlHv5ck/9XCkQ8m3xUnTsWpRGnPJbQNC
         WKGPDBV936ua9AFvPCDH1NfnaLomvucOoPOXl74Skj5S7s/A2gZqkoni/S5roo7PNLwD
         QarPB3SHx47dF9EZ30GxFyS99eLvs0fq45kcbmfkS22bU3iPB06Xh6VjllCG8SnWMmr2
         ixltUTuRai+eVyik1r0L73C6eH1LNY86B5cDiEw+YvBOfMNdKZvPDqcgAVooyTomVmm+
         dVbA==
X-Gm-Message-State: AOAM531fNHWZ/UM+dfT266YVTdSn17iECtEsn5yDiXzrey2jp9QIEINm
	Gn8srldhP8OHsiwWQRR5gcl8Ku6+5zqK/nehqRk=
X-Google-Smtp-Source: 
 ABdhPJyCRewoIpVTfgmc0WLSNslU6w41AloSDAknZxvGOfbFhgUn5xLlOT90JtL4cgIH++d3PVyMz5RcplWemvemRFg=
X-Received: by 2002:adf:f5c5:0:b0:1ed:bc44:63e4 with SMTP id
 k5-20020adff5c5000000b001edbc4463e4mr5788591wrp.236.1646968668232; Thu, 10
 Mar 2022 19:17:48 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAAnfSTsib1p5Vgkvqt52WB=4a5wBAF2R0Ei-Wygx0AsNchCiOg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTsib1p5Vgkvqt52WB=4a5wBAF2R0Ei-Wygx0AsNchCiOg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 10 Mar 2022 19:17:37 -0800
Message-ID: 
 <CANx9H-Dz-viiG=Yqs3-4K7gcdp0LpmbJgxyxrjiwsNU43_Pidw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] rename pip_install_wheel.bbclass to
 python_pep517.bbclass
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006d201505d9e8c608"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 03:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163045

--0000000000006d201505d9e8c608
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 11:38 AM Ross Burton <ross@burtonini.com> wrote:

> This is the last major change to the Python packaging before
> kirkstone, I promise!  I think we should release with future-proof
> names instead of renaming everything the moment the LTS Kirkstone is
> released.
>
> Basically, I want to send this:
>
> --- b/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/python_pep517.bbclass
> -PIP_INSTALL_DIST_PATH ?=3D "${WORKDIR}/dist"
> +PEP517_WHEEL_PATH ?=3D "${WORKDIR}/dist"
>
> -PIP_INSTALL_PYTHON =3D "python3"
> -PIP_INSTALL_PYTHON:class-native =3D "nativepython3"
> +PEP517_INSTALL_PYTHON =3D "python3"
> +PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
>
> -INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
> +PEP517_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
>
> The rationale being that pip_install_wheel doesn't have to use pip to
> install wheels (there is a patch to use installer, and the ability to
> change to something better would be nice), and in the future we plan
> to also cover the build stage (using python -mbuild).  As this class
> hasn't actually been in a release yet, now is the time to change any
> names before they're locked into a LTS release.
>

My original plan was to use python3-build and python3-installer, because
they are simple tools to do one thing. That wasn=E2=80=99t quite ready at t=
he
=E2=80=9Cfeature freeze=E2=80=9D. My more complex and naive approach =E2=80=
=9Cworked=E2=80=9D, so I
submitted it. RP and I worked extremely long hours to get oe-core to
stabilize. But I tend to prefer this change, because this is likely where
we will be going in 3.6. This is where we wanted to go for 3.5.

While upstream python3-installer is not yet under the pypa umbrella, it
might very well move there soon. During the time this new packaging was
developed, flit moved under the pypa umbrella, as an example. The fact that
python3-installer now has a CLI (0.5.0 release) is a big help. it must also
be noted that python3-installer has the knobs we are used to (platlib and
friends). We are very much at the mercy of pip install knobs. They are not
quite what we need. Installation of wheels has been the most frustrating
and brittle aspect of this packaging change.

I had previous iterations with a pyprojecttoml.bbclass and a
pypa_installer.bbclass. The first is too long, the second is no more
obvious than pep517 (and limits to install). The intent has always to have
a one-stop class to =E2=80=9Cbuild and install=E2=80=9D wheels in the way t=
hat we need that
to happen. It wasn=E2=80=99t until recently with a lot more experience that=
 this
path forward became obvious.

The refactoring Ross has been doing (in constant communication with me the
entire time) is exactly what we needed. We would have done this a month ago
if life permitted what we want.

In short, I am aligned with the proposal to make the wheel =E2=80=9Cinstall=
er=E2=80=9D
class more future proof. The naming of python_pep517 is as good as any.

=E2=80=94Tim


> I'm just building all of oe-core + meta-python with this to verify it
> works.  Konrad, any thoughts?
>
> Ross
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163040):
> https://lists.openembedded.org/g/openembedded-core/message/163040
> Mute This Topic: https://lists.openembedded.org/mt/89694693/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006d201505d9e8c608
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 10, 2022 at 11:38 AM Ross Burton &lt;<a href=3D=
"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">This is the last major change to the Python packaging before<b=
r>
kirkstone, I promise!=C2=A0 I think we should release with future-proof<br>
names instead of renaming everything the moment the LTS Kirkstone is<br>
released.<br>
<br>
Basically, I want to send this:<br>
<br>
--- b/meta/classes/pip_install_wheel.bbclass<br>
+++ b/meta/classes/python_pep517.bbclass<br>
-PIP_INSTALL_DIST_PATH ?=3D &quot;${WORKDIR}/dist&quot;<br>
+PEP517_WHEEL_PATH ?=3D &quot;${WORKDIR}/dist&quot;<br>
<br>
-PIP_INSTALL_PYTHON =3D &quot;python3&quot;<br>
-PIP_INSTALL_PYTHON:class-native =3D &quot;nativepython3&quot;<br>
+PEP517_INSTALL_PYTHON =3D &quot;python3&quot;<br>
+PEP517_INSTALL_PYTHON:class-native =3D &quot;nativepython3&quot;<br>
<br>
-INSTALL_WHEEL_COMPILE_BYTECODE ?=3D &quot;--compile-bytecode=3D0&quot;<br>
+PEP517_COMPILE_BYTECODE ?=3D &quot;--compile-bytecode=3D0&quot;<br>
<br>
The rationale being that pip_install_wheel doesn&#39;t have to use pip to<b=
r>
install wheels (there is a patch to use installer, and the ability to<br>
change to something better would be nice), and in the future we plan<br>
to also cover the build stage (using python -mbuild).=C2=A0 As this class<b=
r>
hasn&#39;t actually been in a release yet, now is the time to change any<br=
>
names before they&#39;re locked into a LTS release.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">My original plan=
 was to use python3-build and python3-installer, because they are simple to=
ols to do one thing. That wasn=E2=80=99t quite ready at the =E2=80=9Cfeatur=
e freeze=E2=80=9D. My more complex and naive approach =E2=80=9Cworked=E2=80=
=9D, so I submitted it. RP and I worked extremely long hours to get oe-core=
 to stabilize. But I tend to prefer this change, because this is likely whe=
re we will be going in 3.6. This is where we wanted to go for 3.5.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">While upstream python3-installer=
 is not yet under the pypa umbrella, it might very well move there soon. Du=
ring the time this new packaging was developed, flit moved under the pypa u=
mbrella, as an example. The fact that python3-installer now has a CLI (0.5.=
0 release) is a big help. it must also be noted that python3-installer has =
the knobs we are used to (platlib and friends). We are very much at the mer=
cy of pip install knobs. They are not quite what we need. Installation of w=
heels has been the most frustrating and brittle aspect of this packaging ch=
ange.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I had previo=
us iterations with a pyprojecttoml.bbclass and a pypa_installer.bbclass. Th=
e first is too long, the second is no more obvious than pep517 (and limits =
to install). The intent has always to have a one-stop class to =E2=80=9Cbui=
ld and install=E2=80=9D wheels in the way that we need that to happen. It w=
asn=E2=80=99t until recently with a lot more experience that this path forw=
ard became obvious.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><spa=
n style=3D"border-color:rgb(0,0,0);color:rgb(0,0,0)">The refactoring Ross h=
as been doing (in constant communication with me the entire time) is exactl=
y what we needed. We would have done this a month ago if life permitted wha=
t we want.</span><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">In=
 short, I am aligned with the proposal to make the wheel =E2=80=9Cinstaller=
=E2=80=9D class more future proof. The naming of python_pep517 is as good a=
s any.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=E2=80=94Tim</div=
><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)"><br>
I&#39;m just building all of oe-core + meta-python with this to verify it<b=
r>
works.=C2=A0 Konrad, any thoughts?<br>
<br>
Ross<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163040): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163040" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163040</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89694693/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89694693/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006d201505d9e8c608--

