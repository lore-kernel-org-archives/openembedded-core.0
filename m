Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C09C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:35:39 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.2269.1686029735068104249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HKQkza0E;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b1a3fa2cd2so67346191fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 22:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686029733; x=1688621733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WQvHn/1UcJwS7X8RMde8/6EPF+x0KYFyaGFgen1mdqA=;
        b=HKQkza0EW8dC0s+ca9JkaRqKb+OGBZNDDefvOsGK7zZeNNgb6zqfzy7akp0fDn3u3O
         lRCCS3cydC4HD0vgldcx68Cx9SeDMyMRFsXDgUOvIZ/TshzYHeIz1VuVa36kAxAjRh/N
         jKgfEpPv0ywxEPsMf4ykvQRRHYIG5n12lKNEwmwpGfmENsZauMqZNMWfMryrfmC+Lkb0
         bX98MEPE98NxbD8YBRdAfex7UWaoKsaJGwHaJ5Ezfhspn0GZ6X8Rf0wFP8O7WpV0NhrC
         ksYFc/PGULnBgoGTVkbc1155N+2rI1I1fclzFjZIQztJBLNCaSHj08HH/rewWqSSAhzY
         OQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686029733; x=1688621733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQvHn/1UcJwS7X8RMde8/6EPF+x0KYFyaGFgen1mdqA=;
        b=BBpoxLSE2oH4q29YtyLfBsctghKOVpJsnYZq6DrgJAjA+zaJmaEtPWyaNmSIlQiAG5
         9tOmdjBM4BaQsh3/YfOW0PQ6GCcXqfUHfCf3uwAONwOa+W7mhLHYiSE8FSdZmzB3oJKq
         hVVzdu+fKEhNuizU4ip5sdn92XOo2ZXrM3En1p8NDxLnDudBgEtk7ij8VLzFM5oERLFQ
         E3wkVm5XaWl7I+Y9ElQTdeoOeXt1jumm89L3q3jCPPU4IkP2nUlO47QYrzP4ieaU+H4A
         KoHpLP/2e2Wm2Wtry7VZMseFRlXx6czY9psdPoEq7e5q9mmACebT8bA6JxAa4SRhQziu
         9oiA==
X-Gm-Message-State: AC+VfDz+VfHYeay4iILxqxyyN1nlXwpwb0wS8FX7/FCGkvFcDehxKxW5
	eOtuE9rbb7IiX830J/loVHyJVa41cU2wBRACGsC9va8F74c=
X-Google-Smtp-Source: ACHHUZ6bnXkJgT5QT/wczbscpiky0XdeHLjc/5tVLp2n1Olt938eTBDfXlC8XAGd0qVyS8AAzp/4RrphqHV4w/1/mIQ=
X-Received: by 2002:a2e:b045:0:b0:2a8:c858:fb9 with SMTP id
 d5-20020a2eb045000000b002a8c8580fb9mr707362ljl.29.1686029732975; Mon, 05 Jun
 2023 22:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230605162546.3012555-1-ross.burton@arm.com> <06AF5F15-5FB7-45E9-A1AD-8544D7EE7092@arm.com>
 <02525eece93945f219d18572151b08d0ff1691fa.camel@linuxfoundation.org>
In-Reply-To: <02525eece93945f219d18572151b08d0ff1691fa.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 6 Jun 2023 07:35:21 +0200
Message-ID: <CAApg2=QvWRZdafoHJw7g7_i6Br8MeATgBUiNJGkAOdG1QMhtRQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] cve-extra-exclusions: add more linux-yocto
 CVE ignores
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000509adb05fd6f6302"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 05:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182411

--000000000000509adb05fd6f6302
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 5, 2023 at 6:48=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2023-06-05 at 16:31 +0000, Ross Burton wrote:
> > I did some triage of the CVEs in this list but realised that this
> > file is a bad location for them: whilst we don=E2=80=99t expect people =
to
> > switch out most recipes, we do have to expect BSPs to switch the
> > kernel, so by accumulating a list of exclusions in this recipe that
> > are based on the current version of linux-yocto we may negatively
> > impact on people using a BSP which, for example, uses a 5.10 kernel.
> >
> > Should we move the kernel-specific exclusions, where they=E2=80=99re be=
ing
> > done because they=E2=80=99re fixed in a release we ship, to the linux-y=
octo
> > recipe?
>
> A specific include with "6.1" in the name might be a good way to do it
> so that others who follow the same stable series updates could reuse
> it?
>
>
This is definitely better to have a specific file. However, I know some BSP=
s
that stay at x.0 version of the kernel and if they include such a file,
they will
have a false sense of security...

Kind regards,
Marta

--000000000000509adb05fd6f6302
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 5, 2023 at 6:48=E2=80=AFP=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Mon, 2023-06-05 at 16:31 +0000, Ross B=
urton wrote:<br>
&gt; I did some triage of the CVEs in this list but realised that this<br>
&gt; file is a bad location for them: whilst we don=E2=80=99t expect people=
 to<br>
&gt; switch out most recipes, we do have to expect BSPs to switch the<br>
&gt; kernel, so by accumulating a list of exclusions in this recipe that<br=
>
&gt; are based on the current version of linux-yocto we may negatively<br>
&gt; impact on people using a BSP which, for example, uses a 5.10 kernel.<b=
r>
&gt; <br>
&gt; Should we move the kernel-specific exclusions, where they=E2=80=99re b=
eing<br>
&gt; done because they=E2=80=99re fixed in a release we ship, to the linux-=
yocto<br>
&gt; recipe?<br>
<br>
A specific include with &quot;6.1&quot; in the name might be a good way to =
do it<br>
so that others who follow the same stable series updates could reuse<br>
it?<br>
<br></blockquote><div><br></div><div>This is definitely better to have a sp=
ecific file. However, I know some BSPs</div><div>that stay at x.0 version o=
f the kernel and if they include such a file, they will</div><div>have a fa=
lse sense of security...</div><div><br></div><div>Kind regards,</div><div>M=
arta <br></div></div></div>

--000000000000509adb05fd6f6302--

