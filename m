Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12BEEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 11:05:39 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.19387.1688641532459563192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 04:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VG3Jale3;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-44357f34e2dso192296137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688641531; x=1691233531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sQ/C7ixfvajVHCmCp9bSA8AJyZGLDsooYufP/LWkNdo=;
        b=VG3Jale3lPnp1BdLHcJMC76jUR3Ixp2oUbKICoOFMxyaVmkRvlv5QkmE/xAEVH6Lno
         vn2EEf23dOAdkQ3fzU1xnedBAJaqrixTtb546TP+BjLRzqeRek1u9Bn/XhSC2x3uBeOG
         VZV17Pt5UW/Cgm63Sa8IBvIcxXk5sBTR0Yk6GHVU8ibMT5ojqOHvCZ68Exma+IkyYDYr
         82J+EzBDnHU1b45klmldwkVaPqPvcKxPF1PxHe8ICIK+5fF4mRzrFSiZvetbbvR9D2Y6
         fmPLGppUWV4nWxEuVid6Al8nVsEisj5fREj+23tgm2cWazDPghVCJJuksUaOZ+zE0f/K
         OVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641531; x=1691233531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQ/C7ixfvajVHCmCp9bSA8AJyZGLDsooYufP/LWkNdo=;
        b=TZPLeyYgUOTK3VBk1XECV8Bml3lvoXFjd7ngVW7lDf+7GfvC1tRgnumEi2XQ+yH5MT
         Tdm1EF28oRTGDpxHg/HlireqJwYrTciUPyEk+NzcIuZ7yNmRyRJ5LuAGhW3zPn9Bg8EU
         gtmei0dwZ8IN+S3YuqtYsyIb428q607qnWcZOB/sBXYVjxve5Gl+WmhXt65i0U2i3QPK
         KHOS2xU47xvsfxiiTO6kzf6EEhbSW2K960lkyx/66uD4TkFDuBEcJhAwBh/551X3Uc6R
         xI1x+f0Y6TXrafCL8T21MVaUYMGPiBYddnwuSC1wIS1eqJ4nwTkDKYAtJ2oa9e42HDa0
         qxew==
X-Gm-Message-State: ABy/qLatSU2z5BWhbPquDZnu15ltU76VRa7/0lqoN2F5hvgZwVPA5h2R
	lB2s4x2BVPYVKeK2SH9erVyTYbb4w9MppIItSVk=
X-Google-Smtp-Source: APBJJlFlDDH4OrseDTYNrym8yHePe1h7waPcUOeM5Rct7ZJBEZv7aWDW4nc2jq0MNIX+mnuV7p7ciO+W704xy0wQPdM=
X-Received: by 2002:a67:ed57:0:b0:444:5e9c:f5d4 with SMTP id
 m23-20020a67ed57000000b004445e9cf5d4mr969406vsp.16.1688641531352; Thu, 06 Jul
 2023 04:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230705184847.587503-1-jose.quaresma@foundries.io>
 <20230705184847.587503-2-jose.quaresma@foundries.io> <87A4E629-0501-4F73-B327-3B20BC734FD5@arm.com>
In-Reply-To: <87A4E629-0501-4F73-B327-3B20BC734FD5@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 6 Jul 2023 12:05:20 +0100
Message-ID: <CANPvuRkLdc51KN4v9F7jNXWr+yPCFq1FQNDz4LkPVoJqZknY5g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] openssl: fix the PERLEXTERNAL path
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a11af705ffcf7e48"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 11:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183927

--000000000000a11af705ffcf7e48
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton <Ross.Burton@arm.com> escreveu no dia quinta, 6/07/2023 =C3=A0(=
s)
11:38:

> On 5 Jul 2023, at 19:48, Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > The Text-Template was updated from 1.46 to 1.56
> >
> > | ERROR: openssl-native-3.1.1-r0 do_configure: PERLEXTERNAL
> '/build/tmp/work/x86_64-linux/openssl-native/3.1.1-r0/openssl-3.1.1/exter=
nal/perl/Text-Template-1.46/lib'
> not found!
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> > meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> > index b849f9ca79..5f30a37c8a 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> > @@ -137,7 +137,7 @@ do_configure () {
> > fi
> > # WARNING: do not set compiler/linker flags (-I/-D etc.) in
> EXTRA_OECONF, as they will fully replace the
> > # environment variables set by bitbake. Adjust the environment variable=
s
> instead.
> > - PERLEXTERNAL=3D"${S}/external/perl/Text-Template-1.46/lib"
> > + PERLEXTERNAL=3D"${S}/external/perl/Text-Template-1.56/lib"
>
> As you=E2=80=99ve demonstrated that is very fragile, can=E2=80=99t we jus=
t use a glob to
> get the right path?
>

I don't know the best way to do this but this way works, so I will send a v=
3

-       PERLEXTERNAL=3D"${S}/external/perl/Text-Template-1.56/lib"
+       PERLEXTERNAL=3D"$(realpath ${S}/external/perl/Text-Template-*/lib)"

Jose


>
> Ross
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a11af705ffcf7e48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ros=
s.Burton@arm.com">Ross.Burton@arm.com</a>&gt; escreveu no dia quinta, 6/07/=
2023 =C3=A0(s) 11:38:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 5 Jul 2023, at 19:48, Jose Quaresma via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; The Text-Template was updated from 1.46 to 1.56<br>
&gt; <br>
&gt; | ERROR: openssl-native-3.1.1-r0 do_configure: PERLEXTERNAL &#39;/buil=
d/tmp/work/x86_64-linux/openssl-native/3.1.1-r0/openssl-3.1.1/external/perl=
/Text-Template-1.46/lib&#39; not found!<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.1.1.bb" =
rel=3D"noreferrer" target=3D"_blank">openssl_3.1.1.bb</a> | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://opens=
sl_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.1.1.bb</a> b/me=
ta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.1.1.bb" rel=3D"=
noreferrer" target=3D"_blank">openssl_3.1.1.bb</a><br>
&gt; index b849f9ca79..5f30a37c8a 100644<br>
&gt; --- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.1.1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.1.1.bb</a><br>
&gt; @@ -137,7 +137,7 @@ do_configure () {<br>
&gt; fi<br>
&gt; # WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECO=
NF, as they will fully replace the<br>
&gt; # environment variables set by bitbake. Adjust the environment variabl=
es instead.<br>
&gt; - PERLEXTERNAL=3D&quot;${S}/external/perl/Text-Template-1.46/lib&quot;=
<br>
&gt; + PERLEXTERNAL=3D&quot;${S}/external/perl/Text-Template-1.56/lib&quot;=
<br>
<br>
As you=E2=80=99ve demonstrated that is very fragile, can=E2=80=99t we just =
use a glob to get the right path?<br></blockquote><div><br>I don&#39;t know=
 the best way to do this but this way works, so I will send a v3<br><br></d=
iv><div>- =C2=A0 =C2=A0 =C2=A0 PERLEXTERNAL=3D&quot;${S}/external/perl/Text=
-Template-1.56/lib&quot;<br>+ =C2=A0 =C2=A0 =C2=A0 PERLEXTERNAL=3D&quot;$(r=
ealpath ${S}/external/perl/Text-Template-*/lib)&quot;<br></div><div><br>Jos=
e<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Ross<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000a11af705ffcf7e48--

