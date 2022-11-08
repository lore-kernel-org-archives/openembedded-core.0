Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD981C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 11:51:09 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.7122.1667908262631867009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 03:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SISxgZ63;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id h12so20690697ljg.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 03:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jDTzGl1+9QkgMhnh8xHtYqwzQEe9ryNPN4SNGtuLBn0=;
        b=SISxgZ63YSrBUw9WXBRGjTvwjm5fyW7ybpWZXz8I7CUS+F37muUGfnHG4XFlWZGOHK
         qURBrWey3dX2LUu7ZDfBOw3oPnLgPIqRmTcq2cS1nJTiC1qBLSltg4U4WaEUbgQ3/4r3
         KwuJ/et7tgzklCZ69CMHAWmVQ4GC+FdRwebD6Dgzw+uFXlRw2Iwcf11hPkrwRGbQ+i9a
         YvNc0jtWekP+HNirEUxbYRM7AlmxiGrRfsGhi7YKtwnKsjNc5IbT7OFCtGkukfixeE0F
         W2DvOPCoehQf1R8Jc3PZ3egoOQLQ5AUBALCqSmB/o24xaoXyCrC5znQiatb8ysrinzzt
         9c8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDTzGl1+9QkgMhnh8xHtYqwzQEe9ryNPN4SNGtuLBn0=;
        b=aNgAXvx9dQOjgcCOnDpEEy0ALDX1rcaYoTTni8Zuudb0ltWSjZX2iGj9P3YAtj3gWG
         asRFDqIsNqLthqjLJbGvHTIncb7xPNFmvXWs/8eS0iHAqC8BBN2tZsS6AW7lxQqj0gez
         0KIBNnKo1of0jSSHjRTU7WnBTUH9rk8U971B1BDYu1nYGdZkyePIcoivmyVJBCGi23QE
         bRulT79lOVxjeI+rP4JeiHU+Th2saEQ4C5fG9EKDmueusqx05351MGI11hjBDNMl+113
         QEY813ChutKots+ieAzlXvrXY3qD+xLhkonpWBWH4OlCVTPVuEMi9cotHvKOKIX44xdy
         zw9g==
X-Gm-Message-State: ACrzQf2jhtP+B6GwDEZd0NWGGA5/p0fd2SC2qW1ZI5TK6IsVF65Rkk1U
	psZnfqvmc4eh/ug4o7vCRvZPuQgMVqQp/B23vlY=
X-Google-Smtp-Source: AMsMyM4wtgnhO6QJ3v1xhVpUsfvlyhyfEtcw6z7rTzCr1PWr/37kAIIdT5IsYdzZ7BYSGWPMZ8H3L971I8d4uruxZ0Q=
X-Received: by 2002:a05:651c:23a5:b0:26d:d196:d04 with SMTP id
 bk37-20020a05651c23a500b0026dd1960d04mr6968560ljb.403.1667908260735; Tue, 08
 Nov 2022 03:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com> <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
 <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com>
In-Reply-To: <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 12:50:49 +0100
Message-ID: <CANNYZj_EO7LRfzGb86D1s=YMB1Vz=1VYVropJo7VGPvsq5_FsA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit glibc
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000066321005ecf427e0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 11:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172962

--00000000000066321005ecf427e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So you need to set -D_TIME_BITS=3D64
-D_FILE_OFFSET_BITS=3D64 to get some error? But why set that, shouldn=E2=80=
=99t the
defaults work?

Alex

On Tue 8. Nov 2022 at 12.48, Niko Mauno <niko.mauno@vaisala.com> wrote:

> I have not studied the issue, but in order to reproduce this error I add
> 'MACHINE =3D "qemuarm"' to local.conf then issue 'bitbake kbd' against
> current master while TARGET_CPPFLAGS value is set to "-D_TIME_BITS=3D64
> -D_FILE_OFFSET_BITS=3D64".
>
> -Niko
>
> On 8.11.2022 11.14, Alexander Kanavin wrote:
> > We do build for 32 bit arm targets, so is this seen only in specific
> > circumstances? What are they?
> >
> > Alex
> >
> > On Tue, 8 Nov 2022 at 01:09, Niko Mauno via lists.openembedded.org
> > <niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
> >>
> >> For now add exemption in order to avoid following failure during
> >> do_compile()
> >>
> >>    |
> .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/rec=
ipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-li=
nux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswrap.ver:2:
> syntax error in VERSION script
> >>    | collect2: error: ld returned 1 exit status
> >>
> >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> >> ---
> >>   meta/recipes-core/kbd/kbd_2.5.1.bb | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb
> b/meta/recipes-core/kbd/kbd_2.5.1.bb
> >> index aa3ab6e121..b623aecd36 100644
> >> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> >> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> >> @@ -18,6 +18,9 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
> >>
> >>   SRC_URI[sha256sum] =3D
> "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
> >>
> >> +# Compiling 64 bit time for 32 bit host is broken
> >> +GLIBC_64BIT_TIME_CPPFLAGS =3D ""
> >> +
> >>   PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}=
 \
> >>                     "
> >>
> >> --
> >> 2.36.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#172940):
> https://lists.openembedded.org/g/openembedded-core/message/172940
> >> Mute This Topic: https://lists.openembedded.org/mt/94880633/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--00000000000066321005ecf427e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">So you need to set=C2=A0<span style=3D"word-spacing:1px;c=
olor:rgb(49,49,49)">-D_TIME_BITS=3D64</span><span style=3D"word-spacing:1px=
;color:rgb(49,49,49)">=C2=A0</span></div><span style=3D"word-spacing:1px;bo=
rder-color:rgb(49,49,49);color:rgb(49,49,49)">-D_FILE_OFFSET_BITS=3D64 to g=
et some error? But why set that, shouldn=E2=80=99t the defaults work?</span=
><div dir=3D"auto"><font style=3D"border-color:rgb(49,49,49);color:rgb(49,4=
9,49)"><span style=3D"word-spacing:1px"><br></span></font></div><div dir=3D=
"auto"><font style=3D"border-color:rgb(49,49,49);color:rgb(49,49,49)"><span=
 style=3D"word-spacing:1px">Alex<br></span></font><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 8. Nov 2022 at 12.4=
8, Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com">niko.mauno@vais=
ala.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">I have not studied the iss=
ue, but in order to reproduce this error I add <br>
&#39;MACHINE =3D &quot;qemuarm&quot;&#39; to local.conf then issue &#39;bit=
bake kbd&#39; against <br>
current master while TARGET_CPPFLAGS value is set to &quot;-D_TIME_BITS=3D6=
4 <br>
-D_FILE_OFFSET_BITS=3D64&quot;.<br>
<br>
-Niko<br>
<br>
On 8.11.2022 11.14, Alexander Kanavin wrote:<br>
&gt; We do build for 32 bit arm targets, so is this seen only in specific<b=
r>
&gt; circumstances? What are they?<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Tue, 8 Nov 2022 at 01:09, Niko Mauno via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a><br>
&gt; &lt;niko.mauno=3D<a href=3D"mailto:vaisala.com@lists.openembedded.org"=
 target=3D"_blank">vaisala.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; For now add exemption in order to avoid following failure during<b=
r>
&gt;&gt; do_compile()<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 | .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gn=
ueabi/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../=
../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.lib=
s/libtswrap.ver:2: syntax error in VERSION script<br>
&gt;&gt;=C2=A0 =C2=A0 | collect2: error: ld returned 1 exit status<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala=
.com" target=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-core/kbd/<a href=3D"http://kbd_2.5.1.bb" =
rel=3D"noreferrer" target=3D"_blank">kbd_2.5.1.bb</a> | 3 +++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/kbd/<a href=3D"http://kbd_2.5.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">kbd_2.5.1.bb</a> b/meta/recipes-core/=
kbd/<a href=3D"http://kbd_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">kb=
d_2.5.1.bb</a><br>
&gt;&gt; index aa3ab6e121..b623aecd36 100644<br>
&gt;&gt; --- a/meta/recipes-core/kbd/<a href=3D"http://kbd_2.5.1.bb" rel=3D=
"noreferrer" target=3D"_blank">kbd_2.5.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-core/kbd/<a href=3D"http://kbd_2.5.1.bb" rel=3D=
"noreferrer" target=3D"_blank">kbd_2.5.1.bb</a><br>
&gt;&gt; @@ -18,6 +18,9 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/util=
s/${BPN}/${BP}.tar.xz \<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;ccdf452387a6380973d292736=
3e9cbb939fa2068915a6f937ff9d24522024683&quot;<br>
&gt;&gt;<br>
&gt;&gt; +# Compiling 64 bit time for 32 bit host is broken<br>
&gt;&gt; +GLIBC_64BIT_TIME_CPPFLAGS =3D &quot;&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0PACKAGECONFIG ?=3D &quot;${@bb.utils.filter(&#39;DISTR=
O_FEATURES&#39;, &#39;pam&#39;, d)} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.36.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#172940): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/172940" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/172940</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9488=
0633/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/94880633/1686489</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a><br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div></div>

--00000000000066321005ecf427e0--

