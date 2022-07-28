Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D8CC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 09:15:26 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.30566.1658999718035722633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 02:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F5Nhe8nB;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id w16so853758ljh.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=c7AcZXWGZyc0EANbjh3En5N9k31OHp/x/g/raPtEq1k=;
        b=F5Nhe8nBb9hTg+6CT3U+qcI6VafVtCkWAJp9zegxyviLX8ou1bLsN/9fx7pM5Fyy0c
         3ucNB8yEQD3xdco6ed9Mqv18idG4nfTS2kgpaulkooZQ7vIXn2HBITsaTgDhSOK2OIY/
         jQPwWGaHKkSQRAZGpYxQETny/6AOJ07cg3pbwXdCAbwl4kCHL/XbNvctk6O0qLtUc/Mw
         W7D+18H6GBkeYK+3HBi9gGUtda+d6aRAZTOLs6kzqNKWS9uEv7UhMhagZtf92Q++nk7D
         KOJlHXXn5Jv3AnvRU1egpSHqfJ9ijMNpcfjm/Pv3SHNsivKo0ttwolcDcbgiSnihbVlx
         7RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=c7AcZXWGZyc0EANbjh3En5N9k31OHp/x/g/raPtEq1k=;
        b=oNI4IrXm1x4TdzX5LU8fSraEt+p2NGV3c3vijgt6312kvMgeMU+bCrY43y85aj1Csl
         KeyXJAXeJSGNgXCHV1Q7nCmPx8PkAm6JtEaeK1a003bpYFm21rdyZAFw9Xg0Z+R9w7yr
         cOf0rtxAGychIKcLriNt3uQsVCLIRpuz0yL3bejmpIsr16G1rLFdsoDJSU00a+d1A+oe
         lpW2bkxHHNn0IuTvC4ZAZF2yAaGlnfbqdy2ERqEEREncqFT9gORfKLVrw/tGJ7VOw/ul
         uBmJdS1CIgzq/hjIl7hkUKBgdxbHCV9yTSpkI6ORa7wCnlKBZhybmpiBOhc8hvw59ROW
         QKXw==
X-Gm-Message-State: AJIora9Fj6MG8W8vIGLGs70hExX8F/xeJkFtc13svb5oonLcLgLam+qS
	T5OMCAQEtINaq0b4mLJwpusgOHw474loJLX9Tnc=
X-Google-Smtp-Source: 
 AGRyM1vKqvhykN3w/1Sui6f9drJcSYNe5693hkNovj+O4DTc48Mws140g5s2LQrTLHzX1PiWbFlKeTWszd79yFLUTSQ=
X-Received: by 2002:a2e:bc06:0:b0:25e:2021:18d7 with SMTP id
 b6-20020a2ebc06000000b0025e202118d7mr2844080ljf.151.1658999715999; Thu, 28
 Jul 2022 02:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <1705E3C5B18AD43E.21236@lists.openembedded.org>
 <CO1PR11MB50265B0B71DA4F44D252BCE1C4969@CO1PR11MB5026.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO1PR11MB50265B0B71DA4F44D252BCE1C4969@CO1PR11MB5026.namprd11.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 28 Jul 2022 10:14:54 +0100
Message-ID: 
 <CANPvuRkb5VPGFqWW=oCo67ZvxH=HOwvSO5DvEt1py0wusY-6GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG for
 onevpl
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c1356205e4d9f89c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 09:15:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168598

--000000000000c1356205e4d9f89c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Naveen,

PACKAGECONFIG[msdk] =3D "-Dmsdk=3Denabled,-Dmsdk=3Ddisabled,intel-mediasdk"
https://cgit.openembedded.org/openembedded-core/tree/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb#n64

The msdk knob is already there so what is missing is the -Dmfx_api that
will change the target dependency.

Jose

Naveen Saini <naveen.kumar.saini@intel.com> escreveu no dia quinta,
28/07/2022 =C3=A0(s) 07:48:

> Please ignore this patch. It needs some re-work !
>
> Regards,
> Naveen
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Naveen Saini
> > Sent: Thursday, July 28, 2022 12:47 PM
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG
> > for onevpl
> >
> > Allow user to build this plugin against MFX version 2.2+ (oneVPL)
> >
> > https://github.com/GStreamer/gst-plugins-
> > bad/commit/beda9a73339bef878e95798f629a868c647627ce
> >
> > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > ---
> >  .../gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb                 | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > bad_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > bad_1.20.3.bb
> > index 2dd42395f7..6048e17214 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > bad_1.20.3.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > bad_1.20.3.bb
> > @@ -97,6 +97,7 @@ PACKAGECONFIG[webrtcdsp]       =3D "-
> > Dwebrtcdsp=3Denabled,-Dwebrtcdsp=3Ddisabled,webrt
> >  PACKAGECONFIG[zbar]            =3D "-Dzbar=3Denabled,-Dzbar=3Ddisabled=
,zbar"
> >  PACKAGECONFIG[x11]             =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,l=
ibxcb
> > libxkbcommon"
> >  PACKAGECONFIG[x265]            =3D "-Dx265=3Denabled,-Dx265=3Ddisabled=
,x265"
> > +PACKAGECONFIG[onevpl]          =3D "-Dmsdk=3Denabled -Dmfx_api=3DoneVP=
L,-
> > Dmsdk=3Ddisabled,onevpl onevpl-intel-gpu"
> >
> >  GSTREAMER_GPL =3D "${@bb.utils.filter('PACKAGECONFIG', 'faad resindvd
> > x265', d)}"
> >
> > --
> > 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168595):
> https://lists.openembedded.org/g/openembedded-core/message/168595
> Mute This Topic: https://lists.openembedded.org/mt/92664604/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c1356205e4d9f89c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Naveen,</div><div><br>PACKAGECONFIG[msdk] =3D &quo=
t;-Dmsdk=3Denabled,-Dmsdk=3Ddisabled,intel-mediasdk&quot;<br></div><div><a =
href=3D"https://cgit.openembedded.org/openembedded-core/tree/meta/recipes-m=
ultimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb#n64">https://cgit.op=
enembedded.org/openembedded-core/tree/meta/recipes-multimedia/gstreamer/gst=
reamer1.0-plugins-bad_1.20.3.bb#n64</a></div><div><br><div>The msdk knob is=
 already=C2=A0there so what is missing is the -Dmfx_api that will change th=
e target dependency.</div></div><div><br></div><div>Jose</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Naveen Saini &lt;<a=
 href=3D"mailto:naveen.kumar.saini@intel.com" target=3D"_blank">naveen.kuma=
r.saini@intel.com</a>&gt; escreveu no dia quinta, 28/07/2022 =C3=A0(s) 07:4=
8:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Please ignore=
 this patch. It needs some re-work !<br>
<br>
Regards,<br>
Naveen<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Naveen Saini<br>
&gt; Sent: Thursday, July 28, 2022 12:47 PM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG=
<br>
&gt; for onevpl<br>
&gt; <br>
&gt; Allow user to build this plugin against MFX version 2.2+ (oneVPL)<br>
&gt; <br>
&gt; <a href=3D"https://github.com/GStreamer/gst-plugins-" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/GStreamer/gst-plugins-</a><br>
&gt; bad/commit/beda9a73339bef878e95798f629a868c647627ce<br>
&gt; <br>
&gt; Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@i=
ntel.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.20.3.=
bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.20.3.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-<b=
r>
&gt; <a href=3D"http://bad_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">=
bad_1.20.3.bb</a> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
<br>
&gt; <a href=3D"http://bad_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">=
bad_1.20.3.bb</a><br>
&gt; index 2dd42395f7..6048e17214 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-<br>
&gt; <a href=3D"http://bad_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">=
bad_1.20.3.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-<br>
&gt; <a href=3D"http://bad_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">=
bad_1.20.3.bb</a><br>
&gt; @@ -97,6 +97,7 @@ PACKAGECONFIG[webrtcdsp]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;-<br>
&gt; Dwebrtcdsp=3Denabled,-Dwebrtcdsp=3Ddisabled,webrt<br>
&gt;=C2=A0 PACKAGECONFIG[zbar]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 &quot;-Dzbar=3Denabled,-Dzbar=3Ddisabled,zbar&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;-Dx11=3Denabled,-Dx11=3Ddisabled,libxcb<br>
&gt; libxkbcommon&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x265]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 &quot;-Dx265=3Denabled,-Dx265=3Ddisabled,x265&quot;<br>
&gt; +PACKAGECONFIG[onevpl]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-Dm=
sdk=3Denabled -Dmfx_api=3DoneVPL,-<br>
&gt; Dmsdk=3Ddisabled,onevpl onevpl-intel-gpu&quot;<br>
&gt; <br>
&gt;=C2=A0 GSTREAMER_GPL =3D &quot;${@bb.utils.filter(&#39;PACKAGECONFIG&#3=
9;, &#39;faad resindvd<br>
&gt; x265&#39;, d)}&quot;<br>
&gt; <br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168595): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168595" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168595</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92664604/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92664604/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--000000000000c1356205e4d9f89c--

