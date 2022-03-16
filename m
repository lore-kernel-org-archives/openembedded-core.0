Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6538C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 16:36:27 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web09.27659.1647448586414060225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 09:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout01.t-online.de (Postfix) with SMTP id 7E58F7CF2
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:36:24 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.155]) by fwd87.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUWdK-1DxtgX0; Wed, 16 Mar 2022 17:36:22 +0100
Content-Type: multipart/alternative;
 boundary="------------TxOuPh1e6i1pFusCgGE2dt7K"
Message-ID: <7ba06982-c8e5-df3b-fc4a-042d482ca202@t-online.de>
Date: Wed, 16 Mar 2022 17:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] nativesdk-mesa fails to build since upgrade to version
 22.0.0
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: 
 <AM0PR10MB3107FFA113179C9A717C03A199119@AM0PR10MB3107.EURPRD10.PROD.OUTLOOK.COM>
 <16DCCE8EC93DCD97.17060@lists.openembedded.org>
 <33fa836d-4905-b46a-4a72-31ccef03693e@t-online.de>
 <16DCD0A1D561F84D.17060@lists.openembedded.org>
 <AM0PR10MB3107BD5AA37CDF8EBF972CA099119@AM0PR10MB3107.EURPRD10.PROD.OUTLOOK.COM>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <AM0PR10MB3107BD5AA37CDF8EBF972CA099119@AM0PR10MB3107.EURPRD10.PROD.OUTLOOK.COM>
X-TOI-EXPURGATEID: 150726::1647448582-00000271-B23C824A/0/0 CLEAN NORMAL
X-TOI-MSGID: 1baa51aa-d876-4a89-9a56-f6e8e1fad0ac
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 16:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163341

This is a multi-part message in MIME format.
--------------TxOuPh1e6i1pFusCgGE2dt7K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks for testing

Markus

Am 16.03.22 um 17:19 schrieb Matthias Klein:
>
> Hello Markus,
>
> both variants work. I then used the latter one:
>
> PACKAGECONFIG:append:class-native =3D " dri3"
>
> PACKAGECONFIG:append:class-nativesdk =3D " dri3"
>
> I have successfully built small QML (Qt 6.2.4) test programs with the=20
> SDK, which also run nicely on the hardware (i.MX6 DualLite with kernel=20
> 5.10 / etnaviv).
>
> Many greetings,
>
> Matthias
>
> *Von:* openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org> *Im Auftrag von *Matthias=20
> Klein via lists.openembedded.org
> *Gesendet:* Mittwoch, 16. M=C3=A4rz 2022 09:56
> *An:* f_l_k@t-online.de; openembedded-core@lists.openembedded.org
> *Betreff:* Re: [OE-core] nativesdk-mesa fails to build since upgrade=20
> to version 22.0.0
>
> Hello Markus,
>
> Thanks for the quick help!
>
> The variant " to remove x11 " seems to build (incrementally). However,=20
> the SDK is still building.
>
> After that I will test the variant regarding dri3. After that I will=20
> also do a full/clean build.
>
> Afterwards I will report. But it will take a few hours ...
>
> Many greetings,
>
> Matthias
>
> *Von:* openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org> *Im Auftrag von *Markus=20
> Volk via lists.openembedded.org
> *Gesendet:* Mittwoch, 16. M=C3=A4rz 2022 09:35
> *An:* openembedded-core@lists.openembedded.org
> *Betreff:* Re: [OE-core] nativesdk-mesa fails to build since upgrade=20
> to version 22.0.0
>
> What does happen, if adding dri3 like this?
>
> PACKAGECONFIG:append:class-native =3D " dri3"
> PACKAGECONFIG:append:class-nativesdk =3D "dri3"
>
> Am 16.03.22 um 09:17 schrieb Markus Volk:
>
>     Hi Matthias,
>
>     since you have disabled x11 for target ... does it help to also
>     remove it from native and nativesdk ?
>
>     PACKAGECONFIG:remove:class-native =3D " x11"
>
>     PACKAGECONFIG:remove:class-nativesdk =3D " x11"
>
>     Regards,
>
>     Markus
>
>     Am 16.03.22 um 08:40 schrieb Matthias Klein:
>
>         Hello,
>
>         I am using mesa in conjunction with meta-qt6 without
>         X11/wayland on an iMX6 with etnaviv.
>
>         So in a bbappend I have: PACKAGECONFIG:append =3D " etnaviv".
>
>         I use poky with the following DISTRO_FEATURES:
>         DISTRO_FEATURES:remove =3D "x11 wayland vulkan 3g nfc nfs zeroc=
onf"
>         DISTRO_FEATURES:append =3D " directfb opengl"
>
>         Unfortunately, nativesdk-mesa now no longer builds on build
>         via "-c populate_sdk". However, the package for the target
>         still builds.
>
>         | ../mesa-22.0.0/meson.build:520: WARNING: cannot auto-detect
>         -mtls-dialect when cross-compiling, using compiler default
>         |
>         | ../mesa-22.0.0/meson.build:614:2: ERROR: Problem
>         encountered: kmsro requires dri3 for X11 support
>
>         I compared the meson calls on the target and SDK builds:
>         NOTE: Executing meson -Dshared-glapi=3Denabled
>         -Dgallium-opencl=3Ddisabled -Dglx-read-only-text=3Dtrue
>         -Dplatforms=3D -Ddri3=3Ddisabled -Degl=3Denabled -Delf-tls=3Dtr=
ue
>         -Dgallium-drivers=3Dswrast,etnaviv, virgl -Dllvm=3Ddisabled
>         -Dgbm=3Denabled -Dgles1=3Denabled -Dgles2=3Denabled
>         -Dlmsensors=3Ddisabled -Dopengl=3Dtrue -
>         Dosmesa=3Dfalse -Dlibunwind=3Ddisabled -Dgallium-va=3Ddisabled
>         -Dgallium-vdpau=3Ddisabled -Dvulkan-drivers=3D -Dglx=3Ddisabled
>         -Dgallium-xa=3Ddisabled -Dgallium-xvmc=3Ddisabled. ..
>
>         NOTE: Executing meson -Dshared-glapi=3Denabled
>         -Dgallium-opencl=3Ddisabled -Dglx-read-only-text=3Dtrue
>         -Dplatforms=3Dx11 -Ddri3=3Ddisabled -Degl=3Denabled -Delf-tls=3D=
true
>         -Dgallium-drivers=3Dswrast, etnaviv -Dllvm=3Ddisabled
>         -Dgbm=3Denabled -Dgles1=3Ddisabled -Dgles2=3Ddisabled
>         -Dlmsensors=3Ddisabled -Dopengl=3Dtrue -Dosmesa=3Dfalse
>         -Dlibunwind=3Ddisabled -Dgallium-va=3Ddisabled
>         -Dgallium-vdpau=3Ddisabled -Dvulkan-drivers=3D
>         -Dgallium-xa=3Ddisabled -Dgallium-xvmc=3Ddisabled. ..
>
>         Does anyone have any idea what I could do to get the SDK built?
>
>         Many greetings,
>         Matthias
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163339):https://lists.openembedded.org/g/openembedd=
ed-core/message/163339
> Mute This Topic:https://lists.openembedded.org/mt/89817006/3618223
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------TxOuPh1e6i1pFusCgGE2dt7K
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Thanks for testing<br>
    </p>
    <p>Markus<br>
    </p>
    <div class=3D"moz-cite-prefix">Am 16.03.22 um 17:19 schrieb Matthias
      Klein:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:AM0PR10MB3107BD5AA37CDF8EBF972CA099119@AM0PR10MB3107.EURPRD10=
.PROD.OUTLOOK.COM">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Vorformatiert Zchn";
	margin:0cm;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLVorformatiertZchn
	{mso-style-name:"HTML Vorformatiert Zchn";
	mso-style-priority:99;
	mso-style-link:"HTML Vorformatiert";
	font-family:Consolas;}span.n
	{mso-style-name:n;}span.err
	{mso-style-name:err;}span.o
	{mso-style-name:o;}span.E-MailFormatvorlage26
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>Hello
            Markus,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>both
            variants work. I then used the latter one:<o:p></o:p></span><=
/p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>PACKAGECONFIG:append:class-native
            =3D " dri3"<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>PACKAGECONFIG:append:class-nativesdk
            =3D " dri3"<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>I
            have successfully built small QML (Qt 6.2.4) test programs
            with the SDK, which also run nicely on the hardware (i.MX6
            DualLite with kernel 5.10 / etnaviv).
            <o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>Many
            greetings,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>Matthias<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <div>
          <div style=3D"border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class=3D"MsoNormal"><b>Von:</b>
              <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openem=
bedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.=
org</a>
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembed=
ded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded=
.org&gt;</a>
              <b>Im Auftrag von </b>Matthias Klein via
              lists.openembedded.org<br>
              <b>Gesendet:</b> Mittwoch, 16. M=C3=A4rz 2022 09:56<br>
              <b>An:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"ma=
ilto:f_l_k@t-online.de">f_l_k@t-online.de</a>;
              <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openem=
bedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.=
org</a><br>
              <b>Betreff:</b> Re: [OE-core] nativesdk-mesa fails to
              build since upgrade to version 22.0.0<o:p></o:p></p>
          </div>
        </div>
        <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>Hello
            Markus,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>Thanks
            for the quick help!<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>The
            variant " to remove x11 " seems to build (incrementally).
            However, the SDK is still building.<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>After
            that I will test the variant regarding dri3. After that I
            will also do a full/clean build.<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>Afterwards
            I will report. But it will take a few hours ...<o:p></o:p></s=
pan></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>Many
            greetings,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
>Matthias<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"=
><o:p>=C2=A0</o:p></span></p>
        <div>
          <div style=3D"border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class=3D"MsoNormal"><b>Von:</b> <a
                href=3D"mailto:openembedded-core@lists.openembedded.org"
                moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
                openembedded-core@lists.openembedded.org</a> &lt;<a
                href=3D"mailto:openembedded-core@lists.openembedded.org"
                moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
openembedded-core@lists.openembedded.org</a>&gt;
              <b>Im Auftrag von </b>Markus Volk via
              lists.openembedded.org<br>
              <b>Gesendet:</b> Mittwoch, 16. M=C3=A4rz 2022 09:35<br>
              <b>An:</b> <a
                href=3D"mailto:openembedded-core@lists.openembedded.org"
                moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
openembedded-core@lists.openembedded.org</a><br>
              <b>Betreff:</b> Re: [OE-core] nativesdk-mesa fails to
              build since upgrade to version 22.0.0<o:p></o:p></p>
          </div>
        </div>
        <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
        <p>What does happen, if adding dri3 like this?<o:p></o:p></p>
        <pre><span class=3D"n">PACKAGECONFIG</span><span class=3D"err">:<=
/span><span class=3D"n">append:class</span><span class=3D"o">-</span><spa=
n class=3D"n">native =3D " dri3"<o:p></o:p></span></pre>
        <pre><span class=3D"n">PACKAGECONFIG</span><span class=3D"err">:a=
ppend:</span><span class=3D"n">class</span><span class=3D"o">-</span><spa=
n class=3D"n">nativesdk =3D "dri3"</span><o:p></o:p></pre>
        <pre><o:p>=C2=A0</o:p></pre>
        <pre><o:p>=C2=A0</o:p></pre>
        <div>
          <p class=3D"MsoNormal">Am 16.03.22 um 09:17 schrieb Markus Volk=
:<o:p></o:p></p>
        </div>
        <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
          <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hi Matthi=
as,
            <br>
            <br>
            since you have disabled x11 for target ... does it help to
            also remove it from native and nativesdk ?
            <br>
            <br>
            PACKAGECONFIG:remove:class-native =3D " x11" <br>
            <br>
            PACKAGECONFIG:remove:class-nativesdk =3D " x11" <br>
            <br>
            Regards, <br>
            <br>
            Markus <br>
            <br>
            Am 16.03.22 um 08:40 schrieb Matthias Klein: <o:p></o:p></p>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hello, =
<br>
              <br>
              I am using mesa in conjunction with meta-qt6 without
              X11/wayland on an iMX6 with etnaviv.
              <br>
              <br>
              So in a bbappend I have: PACKAGECONFIG:append =3D "
              etnaviv". <br>
              <br>
              I use poky with the following DISTRO_FEATURES: <br>
              DISTRO_FEATURES:remove =3D "x11 wayland vulkan 3g nfc nfs
              zeroconf" <br>
              DISTRO_FEATURES:append =3D " directfb opengl" <br>
              <br>
              Unfortunately, nativesdk-mesa now no longer builds on
              build via "-c populate_sdk". However, the package for the
              target still builds.
              <br>
              <br>
              | ../mesa-22.0.0/meson.build:520: WARNING: cannot
              auto-detect -mtls-dialect when cross-compiling, using
              compiler default
              <br>
              | <br>
              | ../mesa-22.0.0/meson.build:614:2: ERROR: Problem
              encountered: kmsro requires dri3 for X11 support
              <br>
              <br>
              I compared the meson calls on the target and SDK builds: <b=
r>
              NOTE: Executing meson -Dshared-glapi=3Denabled
              -Dgallium-opencl=3Ddisabled -Dglx-read-only-text=3Dtrue
              -Dplatforms=3D -Ddri3=3Ddisabled -Degl=3Denabled -Delf-tls=3D=
true
              -Dgallium-drivers=3Dswrast,etnaviv, virgl -Dllvm=3Ddisabled
              -Dgbm=3Denabled -Dgles1=3Denabled -Dgles2=3Denabled
              -Dlmsensors=3Ddisabled -Dopengl=3Dtrue - <br>
              Dosmesa=3Dfalse -Dlibunwind=3Ddisabled -Dgallium-va=3Ddisab=
led
              -Dgallium-vdpau=3Ddisabled -Dvulkan-drivers=3D -Dglx=3Ddisa=
bled
              -Dgallium-xa=3Ddisabled -Dgallium-xvmc=3Ddisabled. ..
              <br>
              <br>
              NOTE: Executing meson -Dshared-glapi=3Denabled
              -Dgallium-opencl=3Ddisabled -Dglx-read-only-text=3Dtrue
              -Dplatforms=3Dx11 -Ddri3=3Ddisabled -Degl=3Denabled
              -Delf-tls=3Dtrue -Dgallium-drivers=3Dswrast, etnaviv
              -Dllvm=3Ddisabled -Dgbm=3Denabled -Dgles1=3Ddisabled
              -Dgles2=3Ddisabled -Dlmsensors=3Ddisabled -Dopengl=3Dtrue
              -Dosmesa=3Dfalse -Dlibunwind=3Ddisabled -Dgallium-va=3Ddisa=
bled
              -Dgallium-vdpau=3Ddisabled -Dvulkan-drivers=3D
              -Dgallium-xa=3Ddisabled -Dgallium-xvmc=3Ddisabled. ..
              <br>
              <br>
              Does anyone have any idea what I could do to get the SDK
              built? <br>
              <br>
              Many greetings, <br>
              Matthias <o:p></o:p></p>
          </blockquote>
          <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>=C2=A0=
</o:p></p>
          <pre><o:p>=C2=A0</o:p></pre>
          <pre><o:p>=C2=A0</o:p></pre>
          <pre><o:p>=C2=A0</o:p></pre>
        </blockquote>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#163339): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/163339">https:/=
/lists.openembedded.org/g/openembedded-core/message/163339</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/89817006/3618223">https://lists.openembedded.org/mt/=
89817006/3618223</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------TxOuPh1e6i1pFusCgGE2dt7K--

