Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2325C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:57:08 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.21155.1666627019331866277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hg0vNl70;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id z24so3365491ljn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Myi6ypJmgFyaclT/FWsyiCfnD9KLMixZ9Jn9qU0nSwA=;
        b=hg0vNl707ITwdSRVRoAAnilk+Fu1BFpqmSY7qkK+Az4uoVetyiPIz/O7GMeBmS0ZA/
         nq5QlHvAFnVQ56Dp2f2KQGdu9k2o7Ez3ipzoB4MGi+RXX0h+pMv3TpZH1I20yTRsQSn5
         UaHZSvOwR1hh+eni8LDAJHH/hBO7f3CZTnleN1cZ0KCzE70g95JeRKwqZL6gdTkME3B9
         Lgj66SGRfvmCOAuhhwrbgGTb25m/b9uU950jCYCGjw+hTaA4lRS3+mCbghxGYcRkTLCM
         BLBK4U1wYmGFXg8RzO6KDzue7w05akvZnRwc+tykZVfiCpBAy0RfP/ertfzcdqiFuUBn
         zbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Myi6ypJmgFyaclT/FWsyiCfnD9KLMixZ9Jn9qU0nSwA=;
        b=woPZ6uk2vImTGFfrpqThdM+lS65X/45l3gNtm3SIA2gF8odgLEfon+UEY2I55BNDPF
         ak+U1ntKSiWi6ML6/ChGlUgszZdfxT3b6bH6isLedflhiEpJ5fN/aohLX2Lvqen7ZLQ2
         0QGCpAqbxE9fMEZ9MJxVQ3WIHldzTcDCP9lrwMhMTQltWa+/XgFR9vOjL9++dyQ5XfWx
         F7u3rHNW30aFP5fiw8x5lf6UZH7iHfOSVKt0V59J4Okk6QT1U9JBcXCjVZhoewJA9i+d
         8TaXmLo7RorXkZiaF/8pjRnV0vpWlhZDCZsBaaH7PsJ6bMgpfIVmubFS0vy/wR8sdU2b
         s3gQ==
X-Gm-Message-State: ACrzQf3NE/tV9Sb7kQMEYFoGMAz31/kY9nsjBCxiaKpD8dxtTiSPI8md
	JByhVyTBlm3XJN0kqnVOhpWOozAqg8ydM3yOuFI=
X-Google-Smtp-Source: AMsMyM7M0k8gzcAFpq7goVrGMOmGhjPneBd19E2BOPnuVylhmts8KTfvd1zOb1GbYz/85diy/xCxNeuqtCAOa1/FB4o=
X-Received: by 2002:a2e:8e28:0:b0:277:11fe:f9b5 with SMTP id
 r8-20020a2e8e28000000b0027711fef9b5mr758874ljk.463.1666627017334; Mon, 24 Oct
 2022 08:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221024113215.2116725-1-jose.quaresma@foundries.io> <A56DD420-A07E-4586-B2C0-4C132C969410@arm.com>
In-Reply-To: <A56DD420-A07E-4586-B2C0-4C132C969410@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 24 Oct 2022 16:56:46 +0100
Message-ID: <CANPvuRmBE34tU6Nxa_fXpijK6rLMa+x0UaOtJTLjCA4+vGuzsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel-yocto: improve fatal error messages
 of symbol_why.py
To: Ross Burton <Ross.Burton@arm.com>
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005762cd05ebc9d70e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172109

--0000000000005762cd05ebc9d70e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton <Ross.Burton@arm.com> escreveu no dia segunda, 24/10/2022 =C3=
=A0(s)
16:20:

> On 24 Oct 2022, at 12:32, Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Improve the fatal error message of the yocto-kernel-tools symbol_why.py
> > and shows the command that generate the error as it can help understand
> > the root cause of the error.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>
> $ git am -s
> v2_20221024_quaresma_jose_kernel_yocto_improve_fatal_error_messages_of_sy=
mbol_why_py.mbx
> Applying: kernel-yocto: improve fatal error messages of symbol_why.py
> error: meta/classes/kernel-yocto.bbclass: does not exist in index
>
> Can you rebase this to current master? That file hasn=E2=80=99t existed s=
ince
> August.
>

I sent it from kirstone, fixed in v3. Sorry for that.

Jose


>
> Ross
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005762cd05ebc9d70e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ros=
s.Burton@arm.com">Ross.Burton@arm.com</a>&gt; escreveu no dia segunda, 24/1=
0/2022 =C3=A0(s) 16:20:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 24 Oct 2022, at 12:32, Jose Quaresma via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Improve the fatal error message of the yocto-kernel-tools symbol_why.p=
y<br>
&gt; and shows the command that generate the error as it can help understan=
d<br>
&gt; the root cause of the error.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
<br>
$ git am -s v2_20221024_quaresma_jose_kernel_yocto_improve_fatal_error_mess=
ages_of_symbol_why_py.mbx<br>
Applying: kernel-yocto: improve fatal error messages of symbol_why.py<br>
error: meta/classes/kernel-yocto.bbclass: does not exist in index<br>
<br>
Can you rebase this to current master? That file hasn=E2=80=99t existed sin=
ce August.<br></blockquote><div><br></div><div>I sent it from kirstone, fix=
ed in v3. Sorry for that.</div><div><br></div><div>Jose</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Ross<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000005762cd05ebc9d70e--

