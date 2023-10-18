Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB0FCDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:30:16 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.279400.1697628612328797370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 04:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XtAvRRoR;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7b625ed7208so2845606241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697628611; x=1698233411; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ys4U9BvuzaYYl9FXM7oTerlsfn8Ogu4HvxyHnaMcfsM=;
        b=XtAvRRoRgWzUXLIovDj0R3o9tdm4TCy64v9pa6ZPs2xLwWSFRedgKpnVBM3ZGVx2B9
         zfctnGuD3Ur2cG3K6T15gOt1kTFPRwUITnFm3UnuY73SbtKJiCvY9ub2IvmcKxG2eXxn
         fAzAqBRFAR61JeGrAVMWEyc7Fd1jGt8x0G0mFCHpUWtn33HmZo6TiMN2xHVGhThMq6hj
         ZCPrxjs4xjaJxswerlUB/4enNWy3j5Qk2CDuXvOgx66SPnkg5CTpYpw2wtvm41pub9iu
         IuK08BCAC7mqX3Z+MH0EVrKMz4/8+kMkLLWfaQnP4xjsmKK9imGr4ZBqMBwRc+GOh8oA
         Yikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628611; x=1698233411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ys4U9BvuzaYYl9FXM7oTerlsfn8Ogu4HvxyHnaMcfsM=;
        b=UF4zf57YzxKdvTrFx0QeFJHrW1gpX4VCFNIWWeKX1tJNpCpqe4iJ/BlhiIU1gxqUfx
         PrOjf9jieFkjsE4Yd4agoYbOMTuTgpJO0VV15jwCLAF2VED0phVcPmnI+6myI5y3CaH1
         mE1lvPRfosyQOOoMEdcL12WOYWvtqhbfPM6b//cNJJ0pi8i7p3yQq2BgVsLiZeZ5XbvX
         UI5NVBOO0l3gGjhQm7H+fj0ieO6+zPpXf+KYxBnYevHCemnAKbMfNScSrwACQL7UM9rw
         Gs/vnz1Xrb/So1WFkd45V1xpy4V7f4J793GZLFbZ4t/joR8n0itrSB/4EonaAg4Ks5WP
         42sQ==
X-Gm-Message-State: AOJu0YxH08/PBqw/sy2BQ9lJomzkUttA7KAZ6UaoZfnzu3jLuW8jTrrD
	AkoethlRHcoBn+PqR26bYMQgJrLBEetLyaAzZbI=
X-Google-Smtp-Source: AGHT+IE/PM17ax5l/LvQxGmTbUr4F/+USe0Upcz6dp/CwRZXSCmDFriemRB9X0jLZvkKPcj2hv4h98WH/ChaZcH/Blo=
X-Received: by 2002:a67:c10b:0:b0:452:82ff:e76 with SMTP id
 d11-20020a67c10b000000b0045282ff0e76mr5257072vsj.13.1697628611231; Wed, 18
 Oct 2023 04:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231017091900.114311-1-jose.quaresma@foundries.io>
 <20231017091900.114311-2-jose.quaresma@foundries.io> <CWBHZFPISD4K.3RO0WCE8T7OII@ablu-work>
In-Reply-To: <CWBHZFPISD4K.3RO0WCE8T7OII@ablu-work>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 18 Oct 2023 12:30:00 +0100
Message-ID: <CANPvuRmncANq93HGouYMi+tWL2sgUR+typSRC9uCBtgib6sXoQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/4] systemd: add systemd-crypt package
To: Erik Schilling <erik.schilling@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000005548d20607fbf6fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 11:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189378

--0000000000005548d20607fbf6fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Erik Schilling <erik.schilling@linaro.org> escreveu no dia quarta,
18/10/2023 =C3=A0(s) 11:36:

> On Tue Oct 17, 2023 at 11:18 AM CEST, Jose Quaresma wrote:
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/recipes-core/systemd/systemd_254.4.bb | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> b/meta/recipes-core/systemd/systemd_254.4.bb
> > index d24bf0cb06..2146c130d5 100644
> > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> > @@ -387,6 +387,7 @@ PACKAGE_BEFORE_PN =3D "\
> >      ${PN}-analyze \
> >      ${PN}-binfmt \
> >      ${PN}-container \
> > +    ${PN}-crypt \
> >      ${PN}-extra-utils \
> >      ${PN}-gui \
> >      ${PN}-initramfs \
> > @@ -446,6 +447,11 @@ USERADD_PARAM:${PN}-journal-upload =3D "--system -=
d /
> -M --shell /sbin/nologin sys
> >
> >  FILES:${PN}-analyze =3D "${bindir}/systemd-analyze"
> >
> > +FILES:${PN}-crypt =3D "${bindir}/systemd-cryptenroll \
> > +                     ${nonarch_libdir}/cryptsetup \
>
> Won't there be .so plugin files in this folder that are arch-specific?
> I assumed ${nonarch_libdir} should only be used for non-architecture
> specific files?
>

yeah you are right, the plugins are arch specific and nonarch_libdir will
break multilib.
I will change it to just ${libdir} and send a v2.
Thanks for your time.


>
> - Erik
>
> > +                    "
> > +RRECOMMENDS:${PN} +=3D "${PN}-crypt"
> > +
> >  FILES:${PN}-initramfs =3D "/init"
> >  RDEPENDS:${PN}-initramfs =3D "${PN}"
> >
> > @@ -552,7 +558,6 @@ FILES:${PN}-extra-utils =3D "\
> >                          ${bindir}/systemd-run \
> >                          ${bindir}/systemd-cat \
> >                          ${bindir}/systemd-creds \
> > -                        ${bindir}/systemd-cryptenroll \
> >                          ${bindir}/systemd-delta \
> >                          ${bindir}/systemd-cgls \
> >                          ${bindir}/systemd-cgtop \
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005548d20607fbf6fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Erik Schilling &lt;<a href=3D"mailto:=
erik.schilling@linaro.org">erik.schilling@linaro.org</a>&gt; escreveu no di=
a quarta, 18/10/2023 =C3=A0(s) 11:36:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Tue Oct 17, 2023 at 11:18 AM CEST, Jose Quaresma w=
rote:<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> | 7 ++++++-<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> b/meta/recip=
es-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">systemd_254.4.bb</a><br>
&gt; index d24bf0cb06..2146c130d5 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; @@ -387,6 +387,7 @@ PACKAGE_BEFORE_PN =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PN}-analyze \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PN}-binfmt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PN}-container \<br>
&gt; +=C2=A0 =C2=A0 ${PN}-crypt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PN}-extra-utils \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PN}-gui \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PN}-initramfs \<br>
&gt; @@ -446,6 +447,11 @@ USERADD_PARAM:${PN}-journal-upload =3D &quot;--sy=
stem -d / -M --shell /sbin/nologin sys<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES:${PN}-analyze =3D &quot;${bindir}/systemd-analyze&quot;<br=
>
&gt;=C2=A0 <br>
&gt; +FILES:${PN}-crypt =3D &quot;${bindir}/systemd-cryptenroll \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0${nonarch_libdir}/cryptsetup \<br>
<br>
Won&#39;t there be .so plugin files in this folder that are arch-specific?<=
br>
I assumed ${nonarch_libdir} should only be used for non-architecture<br>
specific files?<br></blockquote><div><br></div><div>yeah you are right, the=
 plugins=C2=A0are arch specific and nonarch_libdir will break multilib.</di=
v><div>I will change=C2=A0it to just ${libdir} and send a v2.<br>Thanks for=
 your time.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
- Erik<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;<br>
&gt; +RRECOMMENDS:${PN} +=3D &quot;${PN}-crypt&quot;<br>
&gt; +<br>
&gt;=C2=A0 FILES:${PN}-initramfs =3D &quot;/init&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN}-initramfs =3D &quot;${PN}&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -552,7 +558,6 @@ FILES:${PN}-extra-utils =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${bindir}/systemd-run \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${bindir}/systemd-cat \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${bindir}/systemd-creds \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ${bindir}/systemd-cryptenroll \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${bindir}/systemd-delta \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${bindir}/systemd-cgls \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${bindir}/systemd-cgtop \<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000005548d20607fbf6fe--

