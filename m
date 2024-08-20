Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1E3C531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 15:18:42 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.21900.1724167117605793360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 08:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FDluaFde;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f1a7faa4d4so13771181fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724167116; x=1724771916; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J6pAwl6hjcibLsnsTDka1r/AJM5CKChaXAlu61KD2Jg=;
        b=FDluaFdeyDt6rVGJ2FqqFr8F3vmdNrdCWyHVrTf+a3MSJ8z//ldOHpWRZiJJBgsSd+
         aURB9rP1EssCYWrILAypxRHckYsQbqaRwlF6bTePu+3nRu5Qn3VJMC01+Ev33S2kzyk0
         E5CWsDEsEiz3zWkRgnJ9pngMiaFT/wUDbrnTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167116; x=1724771916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6pAwl6hjcibLsnsTDka1r/AJM5CKChaXAlu61KD2Jg=;
        b=lnuKR1tY/qwx4Y5GxudKhAdK8ItlAzvVsGPUQsCQiU6fgceXv8+AJmViwIgXzRLhQY
         cnXFB76c/W2gWY3t2hWmvDveXDRtEu8iQVVuKZvaNo6Vn7AUfFwL0QA1Bn//gvryzwUX
         S4T7nY6oJB1vJDHi2/j7quqgVxDoPe94SDM/CYtWrxdfIWoDl1Iwv+RzJ4fn22bhjXvl
         AA2sJXfu2+WyS1WqOHfXL/pOtxTmU12Ptc2z1xGnkike9AbsOh1+HtEbh/mXtaCnsnaW
         UuvMjhM8wN7rkDspxqyUM4NGvfwHIMLrZNBSmCS/ikWkyFMb3H1wb8PotcNL0frCh3sX
         teCA==
X-Forwarded-Encrypted: i=1; AJvYcCUHyKawszze+wHPoYDtUhbPlJjHmkR4JuqJ/AvDFtpGEyg7JIH/8ecs2ZyXhGK5LzEfqxbIMSmQfRalplp73Ih/w6yFVaY8hviLVQztfCrmVnvzWIm84gWu
X-Gm-Message-State: AOJu0YyOrvJUM+69K2UOeG4Wpoah3NoKYMks3BziwEsfpg2OtuZLCBO9
	5ZFsdxT1i+LfmptDD6FfbZ/PFaXGLXFUF/SZbzPU+iIXlsdU91V2n6EJN+13rV01uQLb2BSjzmZ
	47tw11FeuexmXx29wHlh7E6dp56uXS51CrJaPCQ==
X-Google-Smtp-Source: AGHT+IHtLUvKzWSgJJUVnDW9lC8pJKWWzyjkINAe1gFaAPqt/0j6Vuy+ve65B80bwpQatdft128ipLkdIWkKkzdeI4A=
X-Received: by 2002:a2e:a99f:0:b0:2ef:2bea:69a with SMTP id
 38308e7fff4ca-2f3e5569e46mr13577101fa.2.1724167115500; Tue, 20 Aug 2024
 08:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <327ef345-67fa-4567-960b-0e3f44203683@skyrain.eu>
In-Reply-To: <327ef345-67fa-4567-960b-0e3f44203683@skyrain.eu>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 20 Aug 2024 08:18:23 -0700
Message-ID: <CADfgfoZSBQJF05Ow-css7HDyaibi52i+PbqBWEovPftki-y5OA@mail.gmail.com>
Subject: Re: [OE-core] Expired certificate https://git.openembedded.org/
To: andrej.v@skyrain.eu
Cc: peter.marko@siemens.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000740b7506201ef01f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203558

--000000000000740b7506201ef01f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The server is available again. We transitioned from hosting DNS with AWS to
DNSimple. The CNAME records related to git were corrupted during the move.
I fixed them about 30 minutes after this email went out.

On Mon, Aug 19, 2024 at 11:45=E2=80=AFPM Andrej Valek via lists.openembedde=
d.org
<andrej.v=3Dskyrain.eu@lists.openembedded.org> wrote:

> Now is even worst, server is completely down.
>
> Andy
>
> On 05.08.2024 15:15, Peter Marko via lists.openembedded.org wrote:
>
> In case no one noticed yet, the certificate expired an hour ago, so the
> repositories can=E2=80=99t be viewed in a browser=E2=80=A6
>
> Peter
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203522):
> https://lists.openembedded.org/g/openembedded-core/message/203522
> Mute This Topic: https://lists.openembedded.org/mt/107731343/1003190
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> mhalstead@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000740b7506201ef01f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The server is available again. We transitioned=C2=A0f=
rom hosting DNS with AWS to DNSimple. The CNAME records related to git were=
 corrupted during the move. I fixed them about=C2=A030 minutes=C2=A0after t=
his email went out.</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Aug 19, 2024 at 11:45=E2=80=AFPM Andrej Va=
lek via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;andrej.v=3D<a href=3D"mailto:skyrain.eu@lists.openembedded.org">skyra=
in.eu@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <font face=3D"monospace">Now is even worst, server is completely down.<=
br>
      <br>
      Andy<br>
    </font><br>
    <div>On 05.08.2024 15:15, Peter Marko via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
     =20
      <div>
        <p class=3D"MsoNormal">In case no one noticed yet, the certificate
          expired an hour ago, so the repositories can=E2=80=99t be viewed =
in a
          browser=E2=80=A6<u></u><u></u></p>
        <p class=3D"MsoNormal">Peter<u></u><u></u></p>
      </div>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
    <br>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203522): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203522" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203522</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107731343/100=
3190" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107731343/1003190</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:mhalstead@linuxfoundation.=
org" target=3D"_blank">mhalstead@linuxfoundation.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</div><=
div>Systems Operations Engineer</div></div></div>

--000000000000740b7506201ef01f--

