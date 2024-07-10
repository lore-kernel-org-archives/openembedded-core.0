Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E832FC2BD09
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 00:05:55 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.2711.1720569953481273632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 17:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IxomdDSC;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso6799775e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 17:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720569952; x=1721174752; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIU7RJ+893VmrgKJbBf4hxSVZtRZQKamUFR/iWENAsI=;
        b=IxomdDSColU6rGXB23TAE7GxKfuZYx2U3+aPjdb7+yoyPxXdyUDT1u4XtsfZbxItsL
         5/YIg7nkssSVA1gQP1ibLDllTdhGhlKnqMEKhwSFs0Cx9I+CtANLEk3aB7DUTxhwx0F9
         +7MMmJahes3XrNU18onEjHYpEoTjcMPObWMn3EOkB+dVLSSemjyelF+Iaz95C/bCg0LO
         bEWqk1i7U+w6CrBS4EM0J8KhFH0lWM6qsgM49ZgZB1Kc5cY7KoxromCVBo+O072o6bq2
         Xe95MPYVg7cmM+pYI1PZMMd3eG5yrhvDMGCTdnNgS4ng7I0PQf6+aZND1Vtjg7ZxxZNp
         unBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720569952; x=1721174752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIU7RJ+893VmrgKJbBf4hxSVZtRZQKamUFR/iWENAsI=;
        b=Yz2rsL75SWXCda3KPQcHEt1urS2Dtju51g2XAIqPeSXzuXjKnF7RlpVpRDG2KZ4phF
         6uXnM+o8Wx6JADwI4gBfSvkiQNT71GSD9HAvvJds97lkfTfmtkxEYA12lBfVleGWhUxG
         /5zNuYPtFIYzjsCrk4Z+woTwgQ4JzOQQYs0Uu3yrwhCj189iIojC4rLrW6bsnr/RtAEB
         W7Tn8teKK0F5rUMo11cPA+Ya1xleSEBJU3MwIbTiWV+gna9F0Uc5MECZfW+MkN4nU/qC
         di40FY6LktK7WWpVMQtHu2JPtTwdgcGHnC7OnGLqyu8Lh3NX6Xd2ilLxq8O41KUtQYGm
         D4RQ==
X-Gm-Message-State: AOJu0Yxx5KYnZrW9pi3vLOgJrdSsK/YT9uwLhrzN3M6/0rZM377Kjnxx
	6xEsIafMK1WP3VvhD78Nm4sr0yUW7qmX4F1cAO+94K4zSKv3oXig+4rVDR7OyWIbuwauWOowi1S
	ieCgjo5A70D6oGmfV8gA25UY8TehmcM+R
X-Google-Smtp-Source: AGHT+IFaaKaiMVPFQfI/qJ9tflbbB21qAFmXiFDCg//RKBSxh300YpIzhVW9YE4taq3uiXUxaLSUPZ2MJNpINtu4DOo=
X-Received: by 2002:a05:6512:3b28:b0:52e:8475:7c2a with SMTP id
 2adb3069b0e04-52eb9996224mr2584797e87.15.1720569951314; Tue, 09 Jul 2024
 17:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240710000157.51922-1-denis@denix.org>
In-Reply-To: <20240710000157.51922-1-denis@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 10 Jul 2024 02:05:41 +0200
Message-ID: <CA+chaQfv0ygbgvuaYfE_dUNXu1JCNSm0G6D8MsyKeSXB=nhSQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] hdparm: drop NO_GENERIC_LICENSE
To: denis@denix.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 00:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201687

see:
https://lists.openembedded.org/g/openembedded-core/message/201631
which is already in master-next:
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D129d2df6bb963bf33da3656ceb6ca5b03cd80383

On Wed, Jul 10, 2024 at 2:02=E2=80=AFAM Denys Dmytriyenko via
lists.openembedded.org <denis=3Ddenix.org@lists.openembedded.org> wrote:
>
> Latest SPDX update[1] brought in a generic hdparm license, no need
> to set NO_GENERIC_LICENSE any more.
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3De9c1f48af=
10ccb58251ecc7e041babb99b94d6df
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  meta/recipes-extended/hdparm/hdparm_9.65.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recipes-e=
xtended/hdparm/hdparm_9.65.bb
> index d5e6ab6065a..1b6af566a29 100644
> --- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
> +++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
> @@ -8,7 +8,6 @@ LICENSE =3D "BSD-2-Clause & GPL-2.0-only & hdparm"
>  LICENSE:${PN} =3D "BSD-2-Clause & hdparm"
>  LICENSE:${PN}-dbg =3D "BSD-2-Clause & hdparm"
>  LICENSE:wiper =3D "GPL-2.0-only"
> -NO_GENERIC_LICENSE[hdparm] =3D "LICENSE.TXT"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D495d03e50dc6c89d6a30107ab=
0df5b03 \
>                      file://debian/copyright;md5=3Da82d7ba3ade9e8ec902749=
db98c592f3 \
> --
> 2.35.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201686): https://lists.openembedded.org/g/openembedde=
d-core/message/201686
> Mute This Topic: https://lists.openembedded.org/mt/107133678/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

