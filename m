Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA17CC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 18:53:53 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.157847.1698692031948422357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 11:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXOoasAI;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7b9cd171d0dso2056923241.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698692031; x=1699296831; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WPn/RKGSu7ujliBdgRi9LT3UU7jTegT53DyPo1ftmN8=;
        b=jXOoasAIAVUgegO9TNacReQSwVIuV2h5JZ1ndWHxbAae2mi7N0f8znqpP7kzuQV6h0
         Dib/hBfnwrTEglP6RnFdFStScXNhbj+W2Br9pmKIPSMqC+yPeiTAFJi+CE/1bBoQunET
         O/yhvC7o64n936p1TomOBqxUjxu4xeB1pV2LDLr6ALCe7c8+SGP4LCHrWRlF5dd62/sW
         EO26y73m1R82Jh/uDqYFGuDxFdmHCfX7OK2ohYrlPCMVukb0YloU7YeBY/MuBrMul6N5
         xxC1DRTNdr4a1gkRVQbJhk8GcqubZ+lM35pILSLDvjGnRMLG8lTIY+cJsy8NodigqIAP
         BdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698692031; x=1699296831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPn/RKGSu7ujliBdgRi9LT3UU7jTegT53DyPo1ftmN8=;
        b=KrUEBIMSqJHOdHQ4MocAQIAuWO+HYo02uGfixqq2fZPEzEpJWcD9LxZDNcVCLtm9DH
         8YqTXZ5rwJgBzTt0eeCohCvfCwW1IDYQfiuhy6ohnGwvarQKcCc+Cw0yPiISAjENXKOE
         BRQWKpZFXSeA/IiWnAop1Y7hvNtAvvkQRWg/fKzkMpgg6KLekKDrYlfrOxjuZWDBabHa
         y5JOXcO43vVWoVgBzUYkQmmH8fgHMQwNH+1kGrrZv7s/jYf/5JVHYeniJcGFTVu/7rN8
         vkzkgztPsEnq5aOCJ2pbFhifSDhNKvUjF3gKx8mJmH12+0UPSfGI0hjF/3HMbBNRqvfp
         9a0g==
X-Gm-Message-State: AOJu0YwkCoWSvf4iypSVPsAsca/Wrm6V2n+YpixUgDsp2/d7SZpVoNLd
	PGA8gFygY7gBQwF6Nt7NQgL2+Y/jnCaXtfHbsHg=
X-Google-Smtp-Source: AGHT+IFkOPe4BGTGeU1fa/4KXQ9MdY4BbK4FzKlvYz1+TcCxEWnGdcTuNsN5HIcY2bsNEBduLNxooV9i5jbk2PxBwms=
X-Received: by 2002:a67:e1d4:0:b0:452:7748:4700 with SMTP id
 p20-20020a67e1d4000000b0045277484700mr8868043vsl.2.1698692030852; Mon, 30 Oct
 2023 11:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231030180413.553254-1-jose.quaresma@foundries.io> <CAMKF1srC-e=ZO95mF0ZUQkp70wKApBaArtVgcEysOEUkn+29Yg@mail.gmail.com>
In-Reply-To: <CAMKF1srC-e=ZO95mF0ZUQkp70wKApBaArtVgcEysOEUkn+29Yg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 30 Oct 2023 18:53:39 +0000
Message-ID: <CANPvuRnV4gL+K_A0mq4dGO2MJ_JvqQeO9HznTXfr4UXhJ3z6vA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] license.bbclass: prefere plus singnal over
 append on IMAGE_CLASSES
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000014fe3b0608f38f16"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 18:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189806

--00000000000014fe3b0608f38f16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia segunda, 30/10/2023 =C3=A0(s)
18:18:

> On Mon, Oct 30, 2023 at 11:04=E2=80=AFAM Jose Quaresma <quaresma.jose@gma=
il.com>
> wrote:
> >
> > The append override is much harder to remove so chnage that.
>
> typo in 'change'
> however, I think one can do :remove op to remove it intentionally,
> with this change it will
> need to be redefined by user who is using license bbclass explicitly,
> which is less intuitive.
>

The :remove is still possible to use and work as before.
One side effect of this patch is the order on IMAGE_CLASSES
where license_image can go from one of the last to one of the first
as well as what you pointed out of redefining the IMAGE_CLASSES.
However this change is not critical at all and can be discarded,
the main reason was because there has been some effort to use + instead of
the :append

Jose



>
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes-global/license.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-global/license.bbclass
> b/meta/classes-global/license.bbclass
> > index b2e0d3faba..b915d39acd 100644
> > --- a/meta/classes-global/license.bbclass
> > +++ b/meta/classes-global/license.bbclass
> > @@ -418,7 +418,7 @@ SSTATETASKS +=3D "do_populate_lic"
> >  do_populate_lic[sstate-inputdirs] =3D "${LICSSTATEDIR}"
> >  do_populate_lic[sstate-outputdirs] =3D "${LICENSE_DIRECTORY}/"
> >
> > -IMAGE_CLASSES:append =3D " license_image"
> > +IMAGE_CLASSES +=3D "license_image"
> >
> >  python do_populate_lic_setscene () {
> >      sstate_setscene(d)
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189804):
> https://lists.openembedded.org/g/openembedded-core/message/189804
> > Mute This Topic: https://lists.openembedded.org/mt/102281098/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000014fe3b0608f38f16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia segunda, 30/10/202=
3 =C3=A0(s) 18:18:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, Oct 30, 2023 at 11:04=E2=80=AFAM Jose Quaresma &lt;<a href=3D"ma=
ilto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; The append override is much harder to remove so chnage that.<br>
<br>
typo in &#39;change&#39;<br>
however, I think one can do :remove op to remove it intentionally,<br>
with this change it will<br>
need to be redefined by user who is using license bbclass explicitly,<br>
which is less intuitive.<br></blockquote><div><br></div><div>The :remove is=
 still possible to use and work as before.</div><div>One side effect of thi=
s patch is the order on IMAGE_CLASSES=C2=A0<br>where license_image=C2=A0can=
 go from one of the last to one of the first</div><div>as well as what you =
pointed out of redefining the IMAGE_CLASSES.</div><div>However this change =
is not critical at all and can be discarded,</div><div>the main reason was =
because there has been some effort to use + instead of the :append<br><br>J=
ose</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-global/license.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-global/license.bbclass b/meta/classes-global=
/license.bbclass<br>
&gt; index b2e0d3faba..b915d39acd 100644<br>
&gt; --- a/meta/classes-global/license.bbclass<br>
&gt; +++ b/meta/classes-global/license.bbclass<br>
&gt; @@ -418,7 +418,7 @@ SSTATETASKS +=3D &quot;do_populate_lic&quot;<br>
&gt;=C2=A0 do_populate_lic[sstate-inputdirs] =3D &quot;${LICSSTATEDIR}&quot=
;<br>
&gt;=C2=A0 do_populate_lic[sstate-outputdirs] =3D &quot;${LICENSE_DIRECTORY=
}/&quot;<br>
&gt;<br>
&gt; -IMAGE_CLASSES:append =3D &quot; license_image&quot;<br>
&gt; +IMAGE_CLASSES +=3D &quot;license_image&quot;<br>
&gt;<br>
&gt;=C2=A0 python do_populate_lic_setscene () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sstate_setscene(d)<br>
&gt; --<br>
&gt; 2.42.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#189804): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/189804" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/189804</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10228109=
8/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102281098/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000014fe3b0608f38f16--

