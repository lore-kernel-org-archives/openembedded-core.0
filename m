Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37976C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:59:40 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.11004.1677160770928722161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j1K6ZzKd;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id g8so10135744lfj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 05:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lLm7d3REuhXZIUgB2s4+d9yTMfdSuBaoIAH+r9SWWM=;
        b=j1K6ZzKdgq5ctMDp/7UDO5K1kq3uan3SM6K2W1UJBq1uaGTle8YZyyO3e6JbVblv/O
         S9GrHEpwMK17zM8weL06uxetuX77E1FbpmhytImc8EAvOOYEIYu53EtpRzH03bDyP1eQ
         igYkbzGh0VESTzpAtsjH77KuLZl23RyRjjq2xrcemn8fGw1tDrWYfRQHiCpjRatWNU/L
         lRJ7q9Pq0F6ueuQq95sCpMVKtOyG8u0iHXcBVb3lhUF9use6OJPy3Soyi8HD5lZwWxHJ
         eY5nHOY5AOqMz+jtJklwirU5YGIzMIkFyyLnGqsSEbMPSev67wI2Hz+/ogdAjB/L1xi0
         iJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lLm7d3REuhXZIUgB2s4+d9yTMfdSuBaoIAH+r9SWWM=;
        b=xE5z3PvfNnGE9D7gQWUhKY9PRBP4VhB0PgQ8wAZfY7C1g05VL3oAGkojA05hlCZePm
         SKiQ6oxUasDMB7biOi3rQXUpbDn60XlxDeGJIZzqdgu6EEhZrQh7XVWOaHwJGBVBPmFM
         awLXuPxFZQbJplYQEjro97CyrGiv14vn7IJw4TTR0ln90ki06vQM//ybfqgnLuC/XSAj
         XciSJjbo5Bgud71b+1RKKoMocY9VM3DWt0rzmtOejTGxH7/gG5Owquh44fE+HeaAoxUY
         dwIJyi0DQ1c3vBYHPXUUnc35UrBg9IZ6bcKvH912uAykv9C9ze3uPPbsityku9TGzfOf
         izow==
X-Gm-Message-State: AO0yUKUFQbdLFAXqBqCaNlJfHv9eee7OtbSNN/0elEBbc4h5/DRkfqbv
	vGjnyg/LV/2VdJNRt3LvVNIXNmDvMbIu4i+FdRY=
X-Google-Smtp-Source: AK7set+VXLAItPRDn95bZKYhq68Qd0sn7S/U2kGP2AblWbE2acXXDmDZqT3OB0Ya/M6z5rQHIsL7tmcOTrvphHPUsI8=
X-Received: by 2002:ac2:5095:0:b0:4d5:ca32:6aed with SMTP id
 f21-20020ac25095000000b004d5ca326aedmr3756077lfm.13.1677160768998; Thu, 23
 Feb 2023 05:59:28 -0800 (PST)
MIME-Version: 1.0
References: <28c8d9aa-27f3-4427-93aa-670bfa05e564@gmail.com>
In-Reply-To: <28c8d9aa-27f3-4427-93aa-670bfa05e564@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Feb 2023 14:59:17 +0100
Message-ID: <CANNYZj8NrGFYxsoG1PhX=iTUANJJQ7q2jZR=Y5zOWCXaXTBrLQ@mail.gmail.com>
Subject: Re: [OE-core] bindgen missing?
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177610

I suspect there isn't. You need to write a recipe.

Alex

On Thu, 23 Feb 2023 at 14:56, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> Hi,
>
> I have tried to upgrade the Mesa recipe to use 23.0.0
> and tried to enable Rusticl by adding these:
>
> inherit rust
> PACKAGECONFIG[rusticl] =3D "-Dgallium-rusticl=3Dtrue
> -Drust_std=3D2021,-Dgallium-rusticl=3Dfalse,libclc spirv-tools spirv-llvm=
-translator,libclc
> spirv-tools spirv-llvm-translator"
> PACKAGECONFIG:append:x86-64:class-target =3D " rusticl"
>
> To do that on Kirkstone, meson 1.0.0 needs to be backported, which is not=
 an issue.
>
> Configure stage fails with:
>
> Program bindgen found: NO
>
> Where is bindgen in Yocto?
>
> Thanks in advance,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177609): https://lists.openembedded.org/g/openembedde=
d-core/message/177609
> Mute This Topic: https://lists.openembedded.org/mt/97182761/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

