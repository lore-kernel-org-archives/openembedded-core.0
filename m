Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D48C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 20:33:53 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.2468.1638390832217027627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 12:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HRH/3HaS;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id p2so51576789uad.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 12:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BYXjrh2WEYQuvEQm6cftrDSz+cfGSXspG3bZS0aaol8=;
        b=HRH/3HaSM/ygHeDduvzb6y8NjaAhYdMkHctmEv0AQIR6ydq3l1D6FJeMf4VhVxsOjy
         JABCY7UeDVO/U1zVDx1D0S26hCcsvdms20MqFcrRxTB79TwokQGjVA2Y09tY8/zQedXt
         F6zsbyguixkdN4tO5itkz2z7UoXtWuuN5gzlgFHgybqreZV6kJ/mMxMQRaklWxSl6UYZ
         +tE13UoYheBucs0ED8YrWrLeFtmO1oVxvhzTh6Xm/FOvN3cTAu9EDHWQ8byY9suMxgUd
         KKg9hJu7ARV1BTcwipOc3u1aXqdvr3yo3GwqLEKM5nXW97wld0egzYTDA5l+sQ+xO3Uc
         1/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BYXjrh2WEYQuvEQm6cftrDSz+cfGSXspG3bZS0aaol8=;
        b=30LdurUOFWvD8V3OJ6HSMeCrURi8Rpo7hYW0EID8iZ51BIoSrZ2fXy3SN/6mxmBlx+
         M6oaeeK1olJ1B9l9PCBg7mHKBRe9Thpg9pAHKkWRvFBNrgBy7NQz/SInYRA3REAr1tTG
         eY8nos/OCAQrgLT4F7rvvVJC9aYBBMtWmQ/edSrCLpH1yJba2PTT6hskWvxZJmQ6AVTe
         PpIbCggCIRetbF5sEot6+JGmgzl6BisK2c8Krj/f5Vf1h5tu9JgjrpBrWKxc6iDS/Ued
         9jTQVvwWyJwoN4y9TY1sTz1ly9GmXJZseWuzDWpLTq1fir37N8QZTDAz2oXSfGTWQhKL
         Uo3w==
X-Gm-Message-State: AOAM5315uvIECPtzlk80V2P+KiNZDucbB4fGmSZchuTFXdNEBR3sE3fj
	5sN0NsY43YtcCPuLzi+IT+qkuNWVM4dSj58S1EU=
X-Google-Smtp-Source: 
 ABdhPJycUre9WVCydr9dGkva/lgnUGmbXFZGnE6xpmtUk38XnCCC++V3WY3o8KmaNS1BLZRNtsZrhwfHERPH7Yf0bPI=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr11014011uah.22.1638390831372;
 Wed, 01 Dec 2021 12:33:51 -0800 (PST)
MIME-Version: 1.0
References: <YaemRcD22hUhkQrq@mcrowe.com>
 <CANNYZj-7YLRwgbCDusZv98B0RSkzVbKPZWJm6r=akEXysLGT0g@mail.gmail.com>
 <Yae5h9EsXqA0ycqU@mcrowe.com>
In-Reply-To: <Yae5h9EsXqA0ycqU@mcrowe.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Dec 2021 21:33:39 +0100
Message-ID: 
 <CANNYZj81Yk2vB119MguwPmfY4s_S3G1KSVWQL8N8JQBe3xzx1g@mail.gmail.com>
Subject: Re: [OE-core] Correct way to set DRIDRIVERS and GALLIUMDRIVERS from
 mesa bbappend
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000081db8b05d21b978b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 20:33:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159059

--00000000000081db8b05d21b978b
Content-Type: text/plain; charset="UTF-8"

I'd like to see specifics though to understand the use case better. What
kind of target you're on, how much space will be saved by only building the
driver you need and which driver is that? If the drivers are in separate
.so objects, you can simply delete the ones you don't need from
do_install_append. The build time savings would be very minimal.

Alex


On Wed, 1 Dec 2021 at 19:06, Mike Crowe <mac@mcrowe.com> wrote:

> Hi Alex,
>
> Thanks for responding.
>
> Just to make sure I understand, you think that I should add something like:
>
>  PACKAGECONFIG[i915] = ""
>  PACKAGECONFIG[iris] = ""
>  PACKAGECONFIG[crocus] = ""
>  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'i915',
> ',i915', '', d)}"
>  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'iris',
> ',iris', '', d)}"
>  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'crocus',
> ',crocus', '', d)}"
>
> But then I need to find a way to get "i915 iris crocus" into PACKAGECONFIG
> for x86 and x86-64 whilst still letting others override that. The best I
> can come up with is to modify the existing default PACKAGECONFIG to be
> something like:
>
>  PACKAGECONFIG_DEFAULT_FOR_TARGET:x86 = "i915 iris crocus"
>  PACKAGECONFIG_DEFAULT_FOR_TARGET:x86-64 = "i915 iris crocus"
>  PACKAGECONFIG:class-target ??= "${@bb.utils.filter('DISTRO_FEATURES',
> 'wayland vulkan', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'opengl egl gles gbm dri gallium virgl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> 'x11 dri3', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan',
> 'dri3', '', d)} \
>                     elf-tls \
>                     ${PACKAGECONFIG_DEFAULT_FOR_TARGET} \
>                     "
>
> This will probably break anyone who currently sets their own PACKAGECONFIG
> for x86 and x86-64 until they add the drivers they require. This would seem
> to be worse than my GALLIUMDRIVERS_DEFAULT suggestion. :(
>
> Have I misunderstood you, or is there a better way?
>
> Thanks.
>
> Mike.
>
> On Wednesday 01 December 2021 at 18:21:44 +0100, Alexander Kanavin wrote:
> > I think you do need to modify oe-core unfortunately, like is done for
> other
> > drivers:
> >
> > PACKAGECONFIG[etnaviv] = ""
> > GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> > ',etnaviv', '', d)}"
> >
> > Alex
> >
> > On Wed, 1 Dec 2021 at 17:44, Mike Crowe via lists.openembedded.org <mac=
> > mcrowe.com@lists.openembedded.org> wrote:
> >
> > > I'm building for a specific chip and therefore don't wish to waste
> time and
> > > electricity building and disk space on the target installing unwanted
> mesa
> > > drivers. However, mesa.inc contains:
> > >
> > >  GALLIUMDRIVERS = "swrast"
> > >  GALLIUMDRIVERS:x86-x32 = ""
> > >  GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
> > >  GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
> > >
> > > and mesa_21.3.0.bb contains:
> > >
> > >  DRIDRIVERS ??= ""
> > >  DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
> > >  DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
> > >
> > > I'm unable to find a way to override these values. Using (for example):
> > >
> > >  DRIDRIVERS:forcevariable = ""
> > >  GALLIUMDRIVERS:forcevariable = "swrast"
> > >
> > > doesn't work because the append still happens after the forcevariable
> > > override takes effect. :(
> > >
> > > Is there a way that I can override GALLIUMDRIVERS and DRIDRIVERS with
> my
> > > own values for x86 and x86-64 without modifying oe-core itself?
> > >
> > > If not, should the oe-core recipe being using something like:
> > >
> > >  GALLIUMDRIVERS_DEFAULT = "swrast"
> > >  GALLIUMDRIVERS_DEFAULT:x86-x32 = ""
> > >  GALLIUMDRIVERS_DEFAULT:append:x86:class-target = ",i915,iris,crocus"
> > >  GALLIUMDRIVERS_DEFAULT:append:x86-64:class-target =
> ",i915,iris,crocus"
> > >  GALLIUMDRIVERS ?= "${GALLIUMDRIVERS_DEFAULT}"
> > >
> > > and similar for DRIDRIVERS to support this?
> > >
> > > Thanks.
> > >
> > > Mike.
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#159048):
> > > https://lists.openembedded.org/g/openembedded-core/message/159048
> > > Mute This Topic: https://lists.openembedded.org/mt/87432435/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [
> > > alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> > >
>

--00000000000081db8b05d21b978b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;d like to see specifics though to understand th=
e use case better. What kind of target you&#39;re on, how much space will b=
e saved by only building the driver you need and which driver is that? If t=
he drivers are in separate .so objects, you can simply delete the ones you =
don&#39;t need from do_install_append. The build time savings would be very=
 minimal.<br></div><div><br></div><div>Alex<br></div><br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 Dec 2021=
 at 19:06, Mike Crowe &lt;<a href=3D"mailto:mac@mcrowe.com">mac@mcrowe.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i Alex,<br>
<br>
Thanks for responding.<br>
<br>
Just to make sure I understand, you think that I should add something like:=
<br>
<br>
=C2=A0PACKAGECONFIG[i915] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[iris] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[crocus] =3D &quot;&quot;<br>
=C2=A0GALLIUMDRIVERS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;i915&#39;, &#39;,i915&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0GALLIUMDRIVERS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;iris&#39;, &#39;,iris&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0GALLIUMDRIVERS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;crocus&#39;, &#39;,crocus&#39;, &#39;&#39;, d)}&quot;<br>
<br>
But then I need to find a way to get &quot;i915 iris crocus&quot; into PACK=
AGECONFIG<br>
for x86 and x86-64 whilst still letting others override that. The best I<br=
>
can come up with is to modify the existing default PACKAGECONFIG to be<br>
something like:<br>
<br>
=C2=A0PACKAGECONFIG_DEFAULT_FOR_TARGET:x86 =3D &quot;i915 iris crocus&quot;=
<br>
=C2=A0PACKAGECONFIG_DEFAULT_FOR_TARGET:x86-64 =3D &quot;i915 iris crocus&qu=
ot;<br>
=C2=A0PACKAGECONFIG:class-target ??=3D &quot;${@bb.utils.filter(&#39;DISTRO=
_FEATURES&#39;, &#39;wayland vulkan&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;opengl eg=
l gles gbm dri gallium virgl&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;, &#39;x11 d=
ri3&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 vulkan&#39;, &#39;dri3&=
#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf-t=
ls \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PAC=
KAGECONFIG_DEFAULT_FOR_TARGET} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;<br>
<br>
This will probably break anyone who currently sets their own PACKAGECONFIG<=
br>
for x86 and x86-64 until they add the drivers they require. This would seem=
<br>
to be worse than my GALLIUMDRIVERS_DEFAULT suggestion. :(<br>
<br>
Have I misunderstood you, or is there a better way?<br>
<br>
Thanks.<br>
<br>
Mike.<br>
<br>
On Wednesday 01 December 2021 at 18:21:44 +0100, Alexander Kanavin wrote:<b=
r>
&gt; I think you do need to modify oe-core unfortunately, like is done for =
other<br>
&gt; drivers:<br>
&gt; <br>
&gt; PACKAGECONFIG[etnaviv] =3D &quot;&quot;<br>
&gt; GALLIUMDRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;etnaviv&#39;,<br>
&gt; &#39;,etnaviv&#39;, &#39;&#39;, d)}&quot;<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Wed, 1 Dec 2021 at 17:44, Mike Crowe via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> &lt;mac=3D<br>
&gt; <a href=3D"mailto:mcrowe.com@lists.openembedded.org" target=3D"_blank"=
>mcrowe.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; I&#39;m building for a specific chip and therefore don&#39;t wish=
 to waste time and<br>
&gt; &gt; electricity building and disk space on the target installing unwa=
nted mesa<br>
&gt; &gt; drivers. However, mesa.inc contains:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS =3D &quot;swrast&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS:x86-x32 =3D &quot;&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS:append:x86:class-target =3D &quot;,i915,iris=
,crocus&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS:append:x86-64:class-target =3D &quot;,i915,i=
ris,crocus&quot;<br>
&gt; &gt;<br>
&gt; &gt; and <a href=3D"http://mesa_21.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_21.3.0.bb</a> contains:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DRIDRIVERS ??=3D &quot;&quot;<br>
&gt; &gt;=C2=A0 DRIDRIVERS:append:x86:class-target =3D &quot;,r100,r200,nou=
veau,i965&quot;<br>
&gt; &gt;=C2=A0 DRIDRIVERS:append:x86-64:class-target =3D &quot;,r100,r200,=
nouveau,i965&quot;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m unable to find a way to override these values. Using (for=
 example):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DRIDRIVERS:forcevariable =3D &quot;&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS:forcevariable =3D &quot;swrast&quot;<br>
&gt; &gt;<br>
&gt; &gt; doesn&#39;t work because the append still happens after the force=
variable<br>
&gt; &gt; override takes effect. :(<br>
&gt; &gt;<br>
&gt; &gt; Is there a way that I can override GALLIUMDRIVERS and DRIDRIVERS =
with my<br>
&gt; &gt; own values for x86 and x86-64 without modifying oe-core itself?<b=
r>
&gt; &gt;<br>
&gt; &gt; If not, should the oe-core recipe being using something like:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS_DEFAULT =3D &quot;swrast&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS_DEFAULT:x86-x32 =3D &quot;&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS_DEFAULT:append:x86:class-target =3D &quot;,i=
915,iris,crocus&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS_DEFAULT:append:x86-64:class-target =3D &quot=
;,i915,iris,crocus&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS ?=3D &quot;${GALLIUMDRIVERS_DEFAULT}&quot;<b=
r>
&gt; &gt;<br>
&gt; &gt; and similar for DRIDRIVERS to support this?<br>
&gt; &gt;<br>
&gt; &gt; Thanks.<br>
&gt; &gt;<br>
&gt; &gt; Mike.<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#159048):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/159048" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/159048</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/874=
32435/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/87432435/1686489</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<br>
&gt; &gt; <a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div>

--00000000000081db8b05d21b978b--

