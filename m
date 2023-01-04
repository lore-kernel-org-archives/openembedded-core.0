Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CD9C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 09:23:31 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.8057.1672824200311354358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 01:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jATXfj09;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id f20so34817698lja.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 01:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ8vRG3mQMyoC0CnW9iLJ0ntb4uPU7Tt9nqDj84rftk=;
        b=jATXfj09D2LUfjh4FeI0c2l7nZE97JbyO9LXmKXsX4I9smjhxp9xE2ApQUoJWpZjhR
         RZLRINIrJXBQR6a28Vj/SWcdS4M5XQhBEcdRLKgqL37VP3QTdVpuhCI7wf/FJycVktCt
         DZYYCJSx6d8EJeXslBU02Uqkepg0sdF5SfHOxHQT3JAWMADtTBygdZUP2cTn1PeKHOrd
         wTgdLTtezZax7/k/QztNroAyzhvPDfj4ddpY3ClXXdcHBzeT6FQSrx0VwPzs9Iudnv7u
         E725eXXJAbcOaxxz/L96nurbyUOt6uQ1HeDwYaz3IWI2f53J4EU5YmdJAYMf/bgQLOKj
         PJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ8vRG3mQMyoC0CnW9iLJ0ntb4uPU7Tt9nqDj84rftk=;
        b=AJUJRFNEbHB2ii4TkBgS5rOFFXA2gKmsMcxygFRDItjS2ockJhYYqEGPkr/UfVLI/6
         Jjj6yBZzbIpz8cHWJX9z4K+zGx9Ow9PqU5Bdj+U4Qnz1tHTEfRSpomeHOlATkrJyWHcb
         At8ukCWM+e4f9mWonIP87r9Ozo4TX9itCG91rPRlr4UB7ZlNRMS/u3CrJXw7g3V0sLNJ
         ljCHnOS21ZccwI3VG852oATMubBEZD+2y2VSQPuBm5TcWWhSlJW81/JREWlVMZzPU2EE
         9MKROePyhOmb6obD7H8PHwWLjgl1W37P3zeyPCC4h2r/EIL1g87FG/8u+VdcCO7PMXDD
         vYeg==
X-Gm-Message-State: AFqh2krPbjxNp460hD42XJje9uaGaqH6VXWpHVmyDHAAE5UlGu3b17yK
	bWhXLvxjgx9z//dPy/CS2mQyvqZgo3ZGJRWw7N4=
X-Google-Smtp-Source: AMrXdXt8bzXBiH+5oKqEuhHHlkxUWNu4C+TP4gNCPnsIgSxrgSncwG29cta8FP3YkZZ5rEABtz+miBhjpif/F8gliuo=
X-Received: by 2002:a2e:a813:0:b0:277:8759:bf65 with SMTP id
 l19-20020a2ea813000000b002778759bf65mr2051708ljq.108.1672824198443; Wed, 04
 Jan 2023 01:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20230104092139.9015-1-mares@2n.com>
In-Reply-To: <20230104092139.9015-1-mares@2n.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Jan 2023 10:23:07 +0100
Message-ID: <CANNYZj_b3D+UZ5qmNS-r7b-J7AdKJcgp1P8v_zd0f04bEP=ZSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wpa-supplicant: Enable native builds
To: =?UTF-8?Q?Miroslav_Mare=C5=A1?= <mares@2n.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 09:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175379

They can, but you should describe possible use cases too.

Alex

On Wed, 4 Jan 2023 at 10:22, Miroslav Mare=C5=A1 <mares@2n.com> wrote:
>
> Native builds for wpa-supplicant can be enabled
> without any further modifications.
>
> Signed-off-by: Miroslav Mare=C5=A1 <mares@2n.com>
> ---
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10=
.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> index 4e27b92bc6..ec20b8b32f 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> @@ -135,3 +135,5 @@ python split_wpa_supplicant_libs () {
>          d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_d=
bg_packages))
>  }
>  PACKAGESPLITFUNCS:prepend =3D "split_wpa_supplicant_libs "
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175378): https://lists.openembedded.org/g/openembedde=
d-core/message/175378
> Mute This Topic: https://lists.openembedded.org/mt/96047102/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

