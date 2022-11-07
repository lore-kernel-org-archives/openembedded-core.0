Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6ADC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:55:30 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.1649.1667814928619909086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 01:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=h3aNBHif;
 spf=pass (domain: snapchat.com, ip: 209.85.167.169, mailfrom: ecordonnier@snapchat.com)
Received: by mail-oi1-f169.google.com with SMTP id p127so11545915oih.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 01:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7C482Ttkp0x1D56TD0dSxH9jmPA2787hqFgPmPVhVR4=;
        b=h3aNBHifI+xY/LiRa0xc/wVFIfGwbyuVSYsfDB6SvqMU529bX3ubvjwh0J1NDrRiRS
         wSGDh0kaZw+zeVhWSCq6U1/6nr6TSn4Q9IpEMgNrk7azPl7fqO1QvJAHLlXiVW4AuW8s
         vk6FckA5kSJ0UW9MroWb+JhvUHa1Cbp/60Qm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7C482Ttkp0x1D56TD0dSxH9jmPA2787hqFgPmPVhVR4=;
        b=hWK+/SBWUdQ/+YZJDDQoodux/uEE28VP7HsAJUmfJd375+x+UL06UrGSibCGKcywEU
         ssVrnatHtb4D1vATSytXkTiW0eL6AaIfdVC8aYNci0BIg9ZAVuSQzO2IOaQcdTwtWqeG
         MTksaM1ilcK3IeV1qLfPXbuZbBvTynCGkbJMV2tuUIQaZK16sCGohDwWQNTsOfvoezY9
         jc9JiWC+Je3QeQCm0zqU1tf6NPdTNyIun19VemWOuaIQvkWzzNO+Bc1dZu4/P4fJlrG3
         UahdBtausafJI1bvG4VfQg8584GJBs52FDEnUekIOteMS2U54HIGNFDrLOyHQtZogiJ8
         fIfQ==
X-Gm-Message-State: ACrzQf3kv2J4Y4pUuUZFnqyukCB1N5dmSHeC0sry+L2i5tuitped+bxb
	GLifeyIIZ9NGnXZ+lY/9xd57lmfmUNh/FJ42gba5Pg==
X-Google-Smtp-Source: AMsMyM7GrvP8QLRMk4pK+mlLB40eWRfk7HZYOldjDKawmxZ2vH04tnj8d5mol2havdgmJqboGK0RqEgAmFrfcONkZQ4=
X-Received: by 2002:a05:6808:1206:b0:359:54a3:b6ba with SMTP id
 a6-20020a056808120600b0035954a3b6bamr540492oil.111.1667814927678; Mon, 07 Nov
 2022 01:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20221104142443.1728589-1-ecordonnier@snap.com> <Y2fadQvhPh/wHFRK@mail.local>
In-Reply-To: <Y2fadQvhPh/wHFRK@mail.local>
From: Etienne Cordonnier <ecordonnier@snapchat.com>
Date: Mon, 7 Nov 2022 10:55:16 +0100
Message-ID: <CAHUKmYY9NggaZo-3n9Yq9BTu-v5kdJtVLtoyQ=LzCPbZ49cadg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mirrors.bbclass: use shallow tarball for nativesdk-binutils
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: multipart/alternative; boundary="00000000000050e81205ecde6c1a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 09:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172832

--00000000000050e81205ecde6c1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've resent the patch and changed git's sendemail.envelopesender option so
that the From field matches the email used in the SOB field.

On Sun, Nov 6, 2022 at 5:02 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 04/11/2022 15:24:43+0100, Etienne Cordonnier via lists.openembedded.or=
g
> wrote:
> > This is useful e.g. when using meta-clang, which introduces a dependenc=
y
> to nativesdk-binutils when
> > populating the SDK, and then a full tarball of binutils is fetched
> additionally to a shallow tarball.
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>
> The SoB needs to match the author and sender. You are using two
> different addresses here.
>
> > ---
> >  meta/classes-global/mirrors.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes-global/mirrors.bbclass
> b/meta/classes-global/mirrors.bbclass
> > index 81fef7f660..8b984de3bf 100644
> > --- a/meta/classes-global/mirrors.bbclass
> > +++ b/meta/classes-global/mirrors.bbclass
> > @@ -91,6 +91,8 @@
> BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
1"
> >  BB_GIT_SHALLOW:pn-binutils-cross-testsuite =3D "1"
> >  BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} =3D "1"
> >  BB_GIT_SHALLOW:pn-binutils-native =3D "1"
> > +BB_GIT_SHALLOW:pn-nativesdk-binutils =3D "1"
> > +
> >  BB_GIT_SHALLOW:pn-glibc =3D "1"
> >  PREMIRRORS +=3D "git://sourceware.org/git/glibc.git
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__downloads.yoctopro=
ject.org_mirror_sources_&d=3DDwIBAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DItIZIiBFvPUc7h=
a-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&s=3Dhk4_w8STTvGIN0VNAn2u=
zyYG_oOrycryBPA5-pYHAPg&e=3D
> \
> >                git://sourceware.org/git/binutils-gdb.git
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__downloads.yoctopro=
ject.org_mirror_sources_&d=3DDwIBAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DItIZIiBFvPUc7h=
a-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&s=3Dhk4_w8STTvGIN0VNAn2u=
zyYG_oOrycryBPA5-pYHAPg&e=3D
> "
> > --
> > 2.36.1.vfs.0.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172714):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_172714&d=3DDwIBAg&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&s=3DC08=
MKSdkpczwMDUBLU0lDwc6-divmgE89AHm-eHFcy0&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_94806491_3617179&d=3DDwIBAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DItIZIiBFvPUc7h=
a-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&s=3DaWDi_0FtVYrz0eG_bPJO=
0tqup8a5jLutsSoTa3Pynwk&e=3D
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIBAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DItIZIi=
BFvPUc7ha-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&s=3DFpYs9M88TVaC=
f1Ibbm3mKpHzyHV_ihvwGydOexSfF2s&e=3D
> [alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&d=3DDw=
IBAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNoIiQdZKZO=
Hxwxi75uwo6Hol3J3TA&s=3DLu5F2iWAYyxz6ynKWLlP56TD2uUQTBZBQSCOpzaMaRI&e=3D
>

--00000000000050e81205ecde6c1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve resent the patch and changed git&#39;s sendemail.=
envelopesender=C2=A0option so that the From field matches the email used in=
 the SOB field.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Nov 6, 2022 at 5:02 PM Alexandre Belloni &lt;<a hre=
f=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">alexandre.bell=
oni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On 04/11/2022 15:24:43+0100, Etienne Cordonnier via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; This is useful e.g. when using meta-clang, which introduces a dependen=
cy to nativesdk-binutils when<br>
&gt; populating the SDK, and then a full tarball of binutils is fetched add=
itionally to a shallow tarball.<br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
The SoB needs to match the author and sender. You are using two<br>
different addresses here.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-global/mirrors.bbclass | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global=
/mirrors.bbclass<br>
&gt; index 81fef7f660..8b984de3bf 100644<br>
&gt; --- a/meta/classes-global/mirrors.bbclass<br>
&gt; +++ b/meta/classes-global/mirrors.bbclass<br>
&gt; @@ -91,6 +91,8 @@ BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLAT=
ED_TARGET_ARCH} =3D &quot;1&quot;<br>
&gt;=C2=A0 BB_GIT_SHALLOW:pn-binutils-cross-testsuite =3D &quot;1&quot;<br>
&gt;=C2=A0 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} =3D &quot;1&quot;=
<br>
&gt;=C2=A0 BB_GIT_SHALLOW:pn-binutils-native =3D &quot;1&quot;<br>
&gt; +BB_GIT_SHALLOW:pn-nativesdk-binutils =3D &quot;1&quot;<br>
&gt; +<br>
&gt;=C2=A0 BB_GIT_SHALLOW:pn-glibc =3D &quot;1&quot;<br>
&gt;=C2=A0 PREMIRRORS +=3D &quot;git://<a href=3D"http://sourceware.org/git=
/glibc.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/glibc.g=
it</a> <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__do=
wnloads.yoctoproject.org_mirror_sources_&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6H=
ol3J3TA&amp;s=3Dhk4_w8STTvGIN0VNAn2uzyYG_oOrycryBPA5-pYHAPg&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__downloads.yoctoproject.org_mirror_sources_&amp;d=3DDwIBAg&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNoIiQd=
ZKZOHxwxi75uwo6Hol3J3TA&amp;s=3Dhk4_w8STTvGIN0VNAn2uzyYG_oOrycryBPA5-pYHAPg=
&amp;e=3D</a>=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=
=3D"http://sourceware.org/git/binutils-gdb.git" rel=3D"noreferrer" target=
=3D"_blank">sourceware.org/git/binutils-gdb.git</a> <a href=3D"https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__downloads.yoctoproject.org_mirro=
r_sources_&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc=
7ha-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&amp;s=3Dhk4_w8STTvGIN0=
VNAn2uzyYG_oOrycryBPA5-pYHAPg&amp;e=3D" rel=3D"noreferrer" target=3D"_blank=
">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__downloads.yoctopro=
ject.org_mirror_sources_&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&amp;s=
=3Dhk4_w8STTvGIN0VNAn2uzyYG_oOrycryBPA5-pYHAPg&amp;e=3D</a> &quot;<br>
&gt; -- <br>
&gt; 2.36.1.vfs.0.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#172714): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_172714&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc7=
ha-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&amp;s=3DC08MKSdkpczwMDU=
BLU0lDwc6-divmgE89AHm-eHFcy0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_172714&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6H=
ol3J3TA&amp;s=3DC08MKSdkpczwMDUBLU0lDwc6-divmgE89AHm-eHFcy0&amp;e=3D</a> <b=
r>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_94806491_3617179&amp;d=3DDwIBAg&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNoIiQdZ=
KZOHxwxi75uwo6Hol3J3TA&amp;s=3DaWDi_0FtVYrz0eG_bPJO0tqup8a5jLutsSoTa3Pynwk&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_94806491_3617179&amp;d=
=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc7ha-blv_xFb0FMnb=
2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&amp;s=3DaWDi_0FtVYrz0eG_bPJO0tqup8a5jL=
utsSoTa3Pynwk&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIBAg&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNoI=
iQdZKZOHxwxi75uwo6Hol3J3TA&amp;s=3DFpYs9M88TVaCf1Ibbm3mKpHzyHV_ihvwGydOexSf=
F2s&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc7ha-=
blv_xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&amp;s=3DFpYs9M88TVaCf1Ibbm=
3mKpHzyHV_ihvwGydOexSfF2s&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:alexandre.b=
elloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.c=
om&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc7ha-blv_=
xFb0FMnb2T_GL7CNoIiQdZKZOHxwxi75uwo6Hol3J3TA&amp;s=3DLu5F2iWAYyxz6ynKWLlP56=
TD2uUQTBZBQSCOpzaMaRI&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&amp;d=3DDwIBAg=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DItIZIiBFvPUc7ha-blv_xFb0FMnb2T_GL7CNo=
IiQdZKZOHxwxi75uwo6Hol3J3TA&amp;s=3DLu5F2iWAYyxz6ynKWLlP56TD2uUQTBZBQSCOpza=
MaRI&amp;e=3D</a> <br>
</blockquote></div>

--00000000000050e81205ecde6c1a--

