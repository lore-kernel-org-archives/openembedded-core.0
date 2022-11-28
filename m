Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8C2C4167D
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 11:46:09 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.115727.1669635968052102851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 03:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vxk4oUOS;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id j16so16873272lfe.12
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 03:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsC0SKrLYDclfKGfVhB2ddqUurRlIEZvm4CoAN42JkA=;
        b=Vxk4oUOSUZlzdH6ihIl9Cx8bqv0Hys55gzI/FfES6wCuqMSXgUJgy+HTOymvrpabAQ
         Ecw/JAt/xvkfQ0numoJhxfTlmjBJ47kWBwW8HjMT5fUucIqAAUanCggzlf7dyAYODuPK
         vI9MJnBpkEfWxm8Nfnwu1bz7XrHdgoZOl9ZSKdaIsa44nErhqnDCdPjh1bphIWIWhu8M
         xyJvy/Gm9gXHqY8LchnVfadV6bSSxEgNB1WV6Xk32LlQ+1A+3eIuKIT2Tp3+KbPGJMvp
         9i8IUQBv/YCjaQwgdhCZPNmcTGBujU5xhbTdsjAGvc8EMEEp9cyO4Kp6xxHnN/do5INz
         GGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsC0SKrLYDclfKGfVhB2ddqUurRlIEZvm4CoAN42JkA=;
        b=ZW6lCHL6dSWm1kZv6g/BRBFrHqYLjg4APLJksZHMML2I7tIUjm+NyY31TemL0iz3ox
         JGJxZRAe16EaR6Dm/7uowOoD0i1OpzdCizQNKF5XneNYYPmc+EA2BVcFpsy1Krk+lCnJ
         K10aJd+n8oB/FN4uaSDzuUQEow1olMlYPYuU5Y5YbZAJP1RsJufCOpRmlZz6jwwd7pF+
         cqrp54HMKLLUly0QKAtPe8bgBG/ORZaKG5j3LgoqpiADJm0VpJyOIB+h/N53h+x2F3jw
         D/4EtRjvfdF7s5cguo+pldRb9LCPMiV13EMblZsNbaT+5fFhIRWsGiQPPJN4Zf6XitF6
         x9oQ==
X-Gm-Message-State: ANoB5pm31UVnMNLK+iJm97ESwD7oWIsK3JfxbJXBzP9vYXosm6KhgKFC
	2XA2Ayis8xAuVqL+8Or4EwlURUmJOIiSH1Vfa6k=
X-Google-Smtp-Source: AA0mqf4bKNBkwRC3MoBdou5pqNDGnVgvYML9j/zZO+h2AkjKVHpcEAh9WkZYyriQjSC3ou/ZBn2IHCZIptWP2/0BFoM=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr16250086lfs.367.1669635966114; Mon, 28
 Nov 2022 03:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20221128112232.123025-1-f_l_k@t-online.de> <CANNYZj9OzcCqoC9=cDcMVPDc85KZbuWuksekUgg0YhDWsG+TrQ@mail.gmail.com>
 <2732MR.ANT1XFWZ05B13@t-online.de>
In-Reply-To: <2732MR.ANT1XFWZ05B13@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 12:45:54 +0100
Message-ID: <CANNYZj9nZc6U8ojtShu7DO8qBfzF0a15qUEHBQ1VmZDhe335_w@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173911

For gcr I suppose we can just disable the ssh stuff if it's not
strictly required.

Alex

On Mon, 28 Nov 2022 at 12:42, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Mo, 28. Nov 2022 um 12:28:31 +0100 schrieb Alexander Kanavin <alex.kan=
avin@gmail.com>:
>
> This needs to be explained. And we need to find a better way to do it, pr=
eferably one that is acceptable upstream.
>
>
> Now thats somehow problematic. I had this issue also with seahorse, that =
wants to know at build time what targets ssh-keygen path would be. We need =
a way to look for the targets ssh binary paths but since openssh for whatev=
er reason doesn't  support pkgconfig i guess we are forced to hack it.
> Another possibility would be to add an openssh-native recipe. I sent a pa=
tch for that but it was rejected for valid reasons.

