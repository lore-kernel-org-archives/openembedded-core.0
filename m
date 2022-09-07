Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494C8C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 07:26:53 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.5083.1662535604809787771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 00:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jWuzkF+m;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id s15so14925360ljp.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=MXQIbOUD/PJOFT5h4hS3viRkKNohjrtiy2rOx85yMdM=;
        b=jWuzkF+maLgzSXFHui6E7q/Cr0GGO4WSFnUNKn5JKwBaG6Jh6kDLrOclTMecDjl5lz
         S1A9gctp57kHV5g+nWyGfY3XIVKGxszXsT/A7Av8F9g8o6t1F6LwAyNg7C5kDvnpjbNc
         g5EckG9cDZ7OFDvjqD38HoL4yTkURzGryK4fEGLECAqMJte9FM+eIqw6tsAUV8Od4I+K
         wiaWrKbSwsyn49ZqqqTrgVovFSSBtX/0yVdTymbBaN3+nIuuzQA3V0ftyTq+Ln5PkSRo
         ZyrosavRTwgZkbkeImSgCXTmf2kBnYwXeBUOQ4QhtIYO2pu1MYNqQp5Kbho7NARQfM4/
         vY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MXQIbOUD/PJOFT5h4hS3viRkKNohjrtiy2rOx85yMdM=;
        b=khtZQt4CIuEAwYYi5RzQv7HXuIVEaUOXD08HCLkFh3PEc/e8qESMWJ79L75gTOtsch
         V0lLMDCFUkWtTxBDGWmr6e78bMgkiBhjw3hhvMrCQ+2lqMLAaEjtKdM482BICbQcmbjX
         ik2Yfex/vDs/eStOb5/oEmKyJnYI6kkqMi/SgqvbSLuv51j6WuxW4ASWOH8pBwEbszfR
         3I/1xBrXUpjwCR1D5B4MdhoQUREEVimZ4pWgwoY+XwzzjjB3NluUxy1XGOW8BPLcPYyc
         Q6lJdjDsRAFoNcrQPXOu002swwpKw9GxgaAzkGb6T4GpHNZ1GGm0brhLiC0qJwXbNacG
         MYkw==
X-Gm-Message-State: ACgBeo2y7ot8pWw4Ml9f3h52F1HQ9sqcEUU1N5WDuN/riWya081e/vDW
	/RMdlUtOZLlXMff/iw5wzlKkWqFNF3civ7BrVBU=
X-Google-Smtp-Source: 
 AA6agR7a0Htkx+Mj5269eXnODBVrWheFE1G4a99hhlkytw1WrHH61IxS2OM0QmBX0BspMM29VplzACr03yqIRHPpN38=
X-Received: by 2002:a2e:9415:0:b0:25e:477b:adc9 with SMTP id
 i21-20020a2e9415000000b0025e477badc9mr538003ljh.109.1662535602858; Wed, 07
 Sep 2022 00:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220907071155.2807336-1-niko.mauno@vaisala.com>
In-Reply-To: <20220907071155.2807336-1-niko.mauno@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Sep 2022 09:26:31 +0200
Message-ID: 
 <CANNYZj-8LsBC3B0ubeGXfKY4bVS8==-x=SQc60DhXY3N13u-Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Add 'default-dns-fallback'
 PACKAGECONFIG option
To: niko.mauno@vaisala.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 07:26:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170371

I would rather invert this, and define 'no-dns-fallback', off by default.

Alex

On Wed, 7 Sept 2022 at 09:12, niko.mauno@vaisala.com via
lists.openembedded.org <niko.mauno=3Dvaisala.com@lists.openembedded.org>
wrote:
>
> systemd defines a default set of fallback DNS servers in
> https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L330
>
> By adding a PACKAGECONFIG knob providing a convenient way to opt out,
> and then removing that value from systemd's PACKAGECONFIG, the output
> from runtime 'resolvectl status' command no longer contains the
> following line:
>
>   Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0=
.0.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-=
dns.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns=
.com 2001:4860:4860::8844#dns.google
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-core/systemd/systemd_251.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-co=
re/systemd/systemd_251.4.bb
> index 8497e24af9..0f30b7dbb3 100644
> --- a/meta/recipes-core/systemd/systemd_251.4.bb
> +++ b/meta/recipes-core/systemd/systemd_251.4.bb
> @@ -64,6 +64,7 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-s=
hared', d)} \
>      backlight \
>      binfmt \
> +    default-dns-fallback \
>      gshadow \
>      hibernate \
>      hostnamed \
> @@ -129,6 +130,7 @@ PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dcore=
dump=3Dfalse"
>  PACKAGECONFIG[cryptsetup] =3D "-Dlibcryptsetup=3Dtrue,-Dlibcryptsetup=3D=
false,cryptsetup,,cryptsetup"
>  PACKAGECONFIG[tpm2] =3D "-Dtpm2=3Dtrue,-Dtpm2=3Dfalse,tpm2-tss,tpm2-tss =
libtss2 libtss2-tcti-device"
>  PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
> +PACKAGECONFIG[default-dns-fallback] =3D ",-Ddns-servers=3D"
>  PACKAGECONFIG[efi] =3D "-Defi=3Dtrue,-Defi=3Dfalse"
>  PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-libdir=3D${STAGING_LI=
BDIR} -Defi-includedir=3D${STAGING_INCDIR}/efi,-Dgnu-efi=3Dfalse,gnu-efi"
>  PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfuti=
ls"
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170370): https://lists.openembedded.org/g/openembedde=
d-core/message/170370
> Mute This Topic: https://lists.openembedded.org/mt/93520181/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

