Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE060C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 10:24:15 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.19577.1701426246736449935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 02:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=U/NZ2P63;
 spf=pass (domain: snapchat.com, ip: 209.85.218.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a18ebac19efso262077766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 02:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701426245; x=1702031045; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sB5tXTVnXUXufjxh0olkP7Yalfm8H7fsSqYGubuxY7I=;
        b=U/NZ2P636BTURr1bz+IyPmdoc2UmYTM3bxi8CqBvDzDl2nmdD1YT5OE+y58qNzpPT/
         k54X+73NHEMj8FOPqaF2rE9YF71owmbkxbesEX/MaQ9vwYux8G0cMi61Ne9YveV1G6O3
         dJ7VdXspald6evMJrk4zO95uw6Qpsv5Ti3M9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426245; x=1702031045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sB5tXTVnXUXufjxh0olkP7Yalfm8H7fsSqYGubuxY7I=;
        b=cBBuYv2kFtg6IDd5joBq2vq7e0QjRJwZDK9topsk0wOH9LKkIEO9kvmKRwVUXyG7LC
         DfnuJOaySYn6ooXP9FFWWG6pUn5bCoyksXLoVELaXKk/rnCdw7/iSKAHWwFQvsEEAAhp
         pB6dC9tRB9EuLeZrDFtfQNZZHPbXVg0AtncCw5jx+8XFB0Sbt+Vd7DMVc7okzG9jlFR2
         ja1Q20sCtj4H34JNNJkE8ya9Vi9yjsySlUefsYVLy8c3xkGfGolqBHinndl98cmBOhc+
         oqrw7k+lt6GDXTPP/CKxomIrE1OEiKnlByPdLZgaiD1EtEDunIV59AdHUtDq7Uy1aDPF
         tWrw==
X-Gm-Message-State: AOJu0Yw9J2MsphT6Lamnb54ycySyNaHfN+32SCgTuY7RjOl/fk/yitGU
	4GMeJq2lzSkCORD5LPvf/aA9TGpoZzpHqnKs2H9GIQ==
X-Google-Smtp-Source: AGHT+IEsbZ//0evVwPo7AbvzrH/9KqJUQ0AGjKDqfLONdcUI4T9T1WF6uMUATZy051KfTkDaGNVagyqcVWYDtCS9Kqs=
X-Received: by 2002:a17:906:3392:b0:a16:471:bfea with SMTP id
 v18-20020a170906339200b00a160471bfeamr1155740eja.2.1701426245045; Fri, 01 Dec
 2023 02:24:05 -0800 (PST)
MIME-Version: 1.0
References: <179C617DA6240870.31732@lists.openembedded.org>
 <CAHUKmYZEOc+xkE2xCbMhUea2QDVZQ4u08sDoQPigD_pJYcFKDg@mail.gmail.com>
 <aebacb803aa1f3addc1c425a465ab75d3a415dc9.camel@linuxfoundation.org>
 <CAMKF1soGVJED8A7HO8Fdvwn4sMjF2ACORONqNPQxxvuSLg5KYQ@mail.gmail.com> <dec2276c23dfb65d60f759431d7f973b05c728a1.camel@linuxfoundation.org>
In-Reply-To: <dec2276c23dfb65d60f759431d7f973b05c728a1.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 1 Dec 2023 11:23:54 +0100
Message-ID: <CAHUKmYYLPgTarQ=BeJkvi9G8XkjO9C79VUVeAQatkKJWaKs53w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb/systemd: enable minidebuginfo support conditionally
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f302a8060b702ae8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191564

--000000000000f302a8060b702ae8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correct, gbd supports minidebuginfo and can print backtraces using it.

On Thu, Nov 30, 2023 at 6:38=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2023-11-30 at 09:32 -0800, Khem Raj wrote:
> > On Thu, Nov 30, 2023 at 3:21=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi,
> > >
> > > I saw some of this discussion on the systemd-devel list so I'm happy =
to
> > > see patches to sort out the configuration on our side, thanks!
> > >
> > > On Thu, 2023-11-30 at 12:15 +0100, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > > > Hi all, I sent this patch to start the conversation, but I guess
> > > > PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FEATURES
> > > > before this can be merged.
> > > > I tested this with core-image-sato after enabling systemd in
> > > > local.conf. I then started:
> > > > $ vi
> > > > In other terminal:
> > > > $ kill -SEGV $(pidof vi)
> > > > $ coredumpctl info
> > > >
> > > > Before the patch, I didn't get a call-stack with symbols. After the
> > > > patch, I get a call-stack including function names inside
> > > > busybox.nosuid ("read_key()").
> > > >
> > > > This is a very useful feature for debugging and/or bug reporting, s=
o
> > > > I think it would make sense to make it easy to enable via a
> > > > DISTRO_FEATURES. I was just not sure why MINIDEBUGINFO was not a
> > > > DISTRO_FEATURES in the first place, and whether you would be willin=
g
> > > > to enable systemd-coredump via the MINIDEBUGINFO DISTRO_FEATURES.
> > >
> > > I think we should make minidebuginfo a DISTRO_FEATURE and then key al=
l
> > > the tweaks off that.
> > >
> > > I was looking at your patches and thinking we might want to enable
> > > minidebuginfo in poky or perhaps OE-Core by default too.
> >
> > is it dependent on systemd for coredumpctl or can be use some other too=
l
> as well
> > for inspection.
>
> binutils and gdb know how to read them too, as long as the right
> configuration is in place (xz support generally) as I understand it.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191516):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_191516&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3Dk9bMfp0fSxT-LJc_NIOCkQtN_kNzYNgwa9-EUwL8RqQa3nsY3w3lbcehHgg1PuXf&s=3DRVE=
AeOWBvFtjM_HL4Sz_XZ0fSha_e6fUN1jYmfqD1Dc&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_102891486_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dk9bMfp0fSxT-L=
Jc_NIOCkQtN_kNzYNgwa9-EUwL8RqQa3nsY3w3lbcehHgg1PuXf&s=3DK07zlm6GIEMswXkGfhz=
Uug5wCrsA1WSb11mWIwd4-QE&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dk9bMfp=
0fSxT-LJc_NIOCkQtN_kNzYNgwa9-EUwL8RqQa3nsY3w3lbcehHgg1PuXf&s=3D-3laPxADPmKU=
Av7QhIDuXYYM1uo3Pl7SWjyAqgeGE7A&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f302a8060b702ae8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Correct, gbd supports minidebuginfo=C2=A0and can print bac=
ktraces using it.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Nov 30, 2023 at 6:38=E2=80=AFPM Richard Purdie &lt=
;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linux=
foundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Thu, 2023-11-30 at 09:32 -0800, Khem Raj wrote:<br>
&gt; On Thu, Nov 30, 2023 at 3:21=E2=80=AFAM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; Hi,<br>
&gt; &gt; <br>
&gt; &gt; I saw some of this discussion on the systemd-devel list so I&#39;=
m happy to<br>
&gt; &gt; see patches to sort out the configuration on our side, thanks!<br=
>
&gt; &gt; <br>
&gt; &gt; On Thu, 2023-11-30 at 12:15 +0100, Etienne Cordonnier via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; Hi all, I sent this patch to start the conversation, but I g=
uess<br>
&gt; &gt; &gt; PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FE=
ATURES<br>
&gt; &gt; &gt; before this can be merged.<br>
&gt; &gt; &gt; I tested this with core-image-sato after enabling systemd in=
<br>
&gt; &gt; &gt; local.conf. I then started:<br>
&gt; &gt; &gt; $ vi<br>
&gt; &gt; &gt; In other terminal:<br>
&gt; &gt; &gt; $ kill -SEGV $(pidof vi)<br>
&gt; &gt; &gt; $ coredumpctl info<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Before the patch, I didn&#39;t get a call-stack with symbols=
. After the<br>
&gt; &gt; &gt; patch, I get a call-stack including function names inside<br=
>
&gt; &gt; &gt; busybox.nosuid (&quot;read_key()&quot;).<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This is a very useful feature for debugging and/or bug repor=
ting, so<br>
&gt; &gt; &gt; I think it would make sense to make it easy to enable via a<=
br>
&gt; &gt; &gt; DISTRO_FEATURES. I was just not sure why MINIDEBUGINFO was n=
ot a<br>
&gt; &gt; &gt; DISTRO_FEATURES in the first place, and whether you would be=
 willing<br>
&gt; &gt; &gt; to enable systemd-coredump via the MINIDEBUGINFO DISTRO_FEAT=
URES.<br>
&gt; &gt; <br>
&gt; &gt; I think we should make minidebuginfo a DISTRO_FEATURE and then ke=
y all<br>
&gt; &gt; the tweaks off that.<br>
&gt; &gt; <br>
&gt; &gt; I was looking at your patches and thinking we might want to enabl=
e<br>
&gt; &gt; minidebuginfo in poky or perhaps OE-Core by default too.<br>
&gt; <br>
&gt; is it dependent on systemd for coredumpctl or can be use some other to=
ol as well<br>
&gt; for inspection.<br>
<br>
binutils and gdb know how to read them too, as long as the right<br>
configuration is in place (xz support generally) as I understand it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191516): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
1516&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dk9bMfp0fSxT-LJc_NI=
OCkQtN_kNzYNgwa9-EUwL8RqQa3nsY3w3lbcehHgg1PuXf&amp;s=3DRVEAeOWBvFtjM_HL4Sz_=
XZ0fSha_e6fUN1jYmfqD1Dc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_191516&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3Dk9bMfp0fSxT-LJc_NIOCkQtN_kNzYNgwa9-EUwL8RqQa3nsY3w3lbcehHgg1Pu=
Xf&amp;s=3DRVEAeOWBvFtjM_HL4Sz_XZ0fSha_e6fUN1jYmfqD1Dc&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_102891486_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3Dk9bMfp0fSxT-LJc_NIOCkQtN_kNzYNgwa9-EUwL8RqQa3n=
sY3w3lbcehHgg1PuXf&amp;s=3DK07zlm6GIEMswXkGfhzUug5wCrsA1WSb11mWIwd4-QE&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_102891486_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dk9bMfp0fSxT-LJc_NIOCkQtN_kNzYNg=
wa9-EUwL8RqQa3nsY3w3lbcehHgg1PuXf&amp;s=3DK07zlm6GIEMswXkGfhzUug5wCrsA1WSb1=
1mWIwd4-QE&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3Dk9bMfp0fSxT-LJc_NIOCkQtN_kNzYNgwa9-EUwL8RqQ=
a3nsY3w3lbcehHgg1PuXf&amp;s=3D-3laPxADPmKUAv7QhIDuXYYM1uo3Pl7SWjyAqgeGE7A&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dk9bMfp0fSxT-LJc_NIOC=
kQtN_kNzYNgwa9-EUwL8RqQa3nsY3w3lbcehHgg1PuXf&amp;s=3D-3laPxADPmKUAv7QhIDuXY=
YM1uo3Pl7SWjyAqgeGE7A&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f302a8060b702ae8--

