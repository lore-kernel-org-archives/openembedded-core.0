Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8404FC00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 12:05:58 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.13156.1690977957099418202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 05:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HmRU/07Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so10957921fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 05:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690977955; x=1691582755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zdJSHP+EDROVXKTgotUz27ZzampbcDXdBeEu9QWvyUg=;
        b=HmRU/07Y9M3tD1WyeWDFnwVc4J1Xjj1eBA8C6gz4iH5rnqpg7w8LKPHQJVR5zh4bT2
         Y0koPiwYKco/sxai8ICZCl404AkY/Xt5Q/v7hpemyaD9xzbPSnCU8mc/24/DcGMRd7xE
         RdMV5ERfD0tKDZsyjJ81oxW64Yf2bPyz+t8J/JRi3R1NcE49CIB7K8pheV8EssDhRJD3
         Hr33Rt772Zms3avH3EeaMGFPNyWUvuJk7x8Xl5NoLFHOQTn/5E6p+ohxxii6njFlbM2J
         nBIsidNVE/NIF3gEmizFy/zHBBD4r4VYPTbhxsqX2O8QwzrlbR2vPZyEzKxNssmWAsK6
         YB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690977955; x=1691582755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdJSHP+EDROVXKTgotUz27ZzampbcDXdBeEu9QWvyUg=;
        b=DTy9JkvK8aqPZ0RpWhBj7Ef2jym19Q7HDxMcnqaH+hR906ECwP1Wn9KqColfdKt9ol
         sQ3NmLjBd6iuaK1eu0MlqX0Icps0uOOa+E/2zMiSBZ+rmXKZBlVh8RRL4ui4GoVpcMyC
         oimllE+0o6PEOXSpVgu+xnAC6+4sq9xh98wdUjD/UL2gXs2GAByvP/Ar654rIIwv+Dq5
         dvPsl1UkRuCmD8XwL7Qt+4IQqLEpK8gPJPujxWHw0BhkjlR+DnjUmqDgGj0B00GRY1Qt
         uJwqVp8JnbkY5W0GuouVX4Kgm6Pe4Qt+kyGcnH8F2NASHNt7MYnUEuSDHsCa5UqGNNi1
         sfww==
X-Gm-Message-State: ABy/qLYbsgI4rtbQhwwZ4qmthgck5vPmE8X3fla0YWMzIai445Lk4+k/
	SDXRjuaSVlJN9wivu4f6zhjDPykLceeY2QommpKEC7xM
X-Google-Smtp-Source: APBJJlHh4mgz/Ja3rOGwxb8XzvwB+a9fQG0OFgwwVLN88kTV6P+GxhgPq1nMiilxbh7IydICPYXNbObSTkR09d4F7Fo=
X-Received: by 2002:a05:651c:10b6:b0:2b6:b30f:5bf with SMTP id
 k22-20020a05651c10b600b002b6b30f05bfmr2384124ljn.13.1690977955082; Wed, 02
 Aug 2023 05:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687446532.git.steve@sakoman.com>
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 2 Aug 2023 14:05:41 +0200
Message-ID: <CAApg2=S9kC2xNNDuzM-WDjeJiNOdY6KKMK1jJ=dPBm0fMZgk3Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/14] Patch review
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000055f5940601ef7c67"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 12:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185388

--00000000000055f5940601ef7c67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 5:31=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> Please review this set of changes for dunfell and have comments back by
> end of day Monday.
>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5493
>
> The following changes since commit
> 77f6fbfa18b4ad77c3756cfdc45d441a20210781:
>
>   build-appliance-image: Update to dunfell head revision (2023-06-17
> 09:47:49 -1000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/dunfell-nut
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/du=
nfell-nut
>
> Abdellatif El Khlifi (1):
>   kernel-fitimage: adding support for Initramfs bundle and u-boot script
>
> Andrej Valek (1):
>   kernel-fitimage: use correct kernel image
>
> Hitendra Prajapati (1):
>   openssl: CVE-2023-2650 Possible DoS translating ASN.1 object
>     identifiers
>
> Ian Ray (1):
>   systemd-systemctl: support instance expansion in WantedBy
>
> Jan Vermaete (1):
>   cve-update-nvd2-native: added the missing http import
>
> Marta Rybczynska (1):
>   cve-update-nvd2-native: new CVE database fetcher
>
> Martin Siegumfeldt (1):
>   systemd-systemctl: fix instance template WantedBy symlink construction
>
> Michael Halstead (4):
>   uninative: Upgrade to 3.8.1 to include libgcc
>   uninative: Upgrade to 3.9 to include glibc 2.37
>   uninative: Upgrade to 3.10 to support gcc 13
>   uninative: Upgrade to 4.0 to include latest gcc 13.1.1
>
> Richard Purdie (1):
>   uninative: Ensure uninative is enabled in all cases for BuildStarted
>     event
>
> Sanjay Chitroda (1):
>   cups: Fix CVE-2023-32324
>
> Steve Sakoman (1):
>   uninative.bbclass: handle read only files outside of patchelf
>
>  meta/classes/cve-check.bbclass                |   4 +-
>  meta/classes/kernel-fitimage.bbclass          | 142 ++++++--
>  meta/classes/uninative.bbclass                |   4 +
>  meta/conf/distro/include/yocto-uninative.inc  |  10 +-
>  .../openssl/openssl/CVE-2023-2650.patch       | 122 +++++++
>  .../openssl/openssl_1.1.1t.bb                 |   1 +
>  .../meta/cve-update-nvd2-native.bb            | 334 ++++++++++++++++++
>  .../systemd/systemd-systemctl/systemctl       |   8 +-
>  meta/recipes-extended/cups/cups.inc           |   1 +
>  .../cups/cups/CVE-2023-32324.patch            |  36 ++
>  10 files changed, 629 insertions(+), 33 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch
>  create mode 100644 meta/recipes-core/meta/cve-update-nvd2-native.bb
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch
>
>
Tested this version for the CVE fetcher backport to dunfell, no unexpected
issues seen.

Kind regards,
Marta

--00000000000055f5940601ef7c67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 22, 2023 at 5:31=E2=80=AF=
PM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Please review this set of changes for dunfell and have comments back by<br>
end of day Monday.<br>
<br>
Passed a-full on autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/5493" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/5493</a><br>
<br>
The following changes since commit 77f6fbfa18b4ad77c3756cfdc45d441a20210781=
:<br>
<br>
=C2=A0 build-appliance-image: Update to dunfell head revision (2023-06-17 0=
9:47:49 -1000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/dunfell-nut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/dunfell-nut" rel=3D"noreferrer" target=3D"_blank">http://cgit=
.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dunfell-nut</a>=
<br>
<br>
Abdellatif El Khlifi (1):<br>
=C2=A0 kernel-fitimage: adding support for Initramfs bundle and u-boot scri=
pt<br>
<br>
Andrej Valek (1):<br>
=C2=A0 kernel-fitimage: use correct kernel image<br>
<br>
Hitendra Prajapati (1):<br>
=C2=A0 openssl: CVE-2023-2650 Possible DoS translating ASN.1 object<br>
=C2=A0 =C2=A0 identifiers<br>
<br>
Ian Ray (1):<br>
=C2=A0 systemd-systemctl: support instance expansion in WantedBy<br>
<br>
Jan Vermaete (1):<br>
=C2=A0 cve-update-nvd2-native: added the missing http import<br>
<br>
Marta Rybczynska (1):<br>
=C2=A0 cve-update-nvd2-native: new CVE database fetcher<br>
<br>
Martin Siegumfeldt (1):<br>
=C2=A0 systemd-systemctl: fix instance template WantedBy symlink constructi=
on<br>
<br>
Michael Halstead (4):<br>
=C2=A0 uninative: Upgrade to 3.8.1 to include libgcc<br>
=C2=A0 uninative: Upgrade to 3.9 to include glibc 2.37<br>
=C2=A0 uninative: Upgrade to 3.10 to support gcc 13<br>
=C2=A0 uninative: Upgrade to 4.0 to include latest gcc 13.1.1<br>
<br>
Richard Purdie (1):<br>
=C2=A0 uninative: Ensure uninative is enabled in all cases for BuildStarted=
<br>
=C2=A0 =C2=A0 event<br>
<br>
Sanjay Chitroda (1):<br>
=C2=A0 cups: Fix CVE-2023-32324<br>
<br>
Steve Sakoman (1):<br>
=C2=A0 uninative.bbclass: handle read only files outside of patchelf<br>
<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 142 ++++++--<br>
=C2=A0meta/classes/uninative.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0meta/conf/distro/include/yocto-uninative.inc=C2=A0 |=C2=A0 10 +-<br>
=C2=A0.../openssl/openssl/CVE-2023-2650.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
22 +++++++<br>
=C2=A0.../openssl/<a href=3D"http://openssl_1.1.1t.bb" rel=3D"noreferrer" t=
arget=3D"_blank">openssl_1.1.1t.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"noreferr=
er" target=3D"_blank">cve-update-nvd2-native.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 334 ++++++++++++++++++<br>
=C2=A0.../systemd/systemd-systemctl/systemctl=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A08 +-<br>
=C2=A0meta/recipes-extended/cups/cups.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../cups/cups/CVE-2023-32324.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 36 ++<br>
=C2=A010 files changed, 629 insertions(+), 33 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023=
-2650.patch<br>
=C2=A0create mode 100644 meta/recipes-core/meta/<a href=3D"http://cve-updat=
e-nvd2-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-nati=
ve.bb</a><br>
=C2=A0create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.pat=
ch<br>
<br></blockquote><div><br></div><div>Tested this version for the CVE fetche=
r backport to dunfell, no unexpected issues seen.</div><div><br></div><div>=
Kind regards,</div><div>Marta <br></div></div></div>

--00000000000055f5940601ef7c67--

