Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA087C38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 19:58:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.53652.1674503930437745896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 11:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bThoNyiM;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id w11so16212730lfu.11
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 11:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wf9y8+1joEYb/HCyi+/8yV9gasgGjzuhziBWfrrMIJ0=;
        b=bThoNyiMAzuL6TaBthAFpFo5tPOhgRL3VGUped+MNP4bbe3B8nbv1fut1ddkukQwST
         LNP6EmWQBkJMtpeWHTsQ9ErN4Nt6qj73U/ZUfWfFi9Ii95mNnbFeUi2iyVeWq6n6Z7uX
         G0VQjulIZg/TjA5uGdpeTpo9azcAssBy2hw13152754YiW7KCp04OKb8ZCQj2ggDAoYs
         X9IV3YcVR8+VoxGv5m1m360AZH6OblBKWVHX/K2HPPBRQdC4/oL6PyjvMS61Z07Nt1fI
         FFqzf6A5TBy86rC+TgVNs5+5o14aFTufMERT7afZ/9FsusCXrnRaAbrqxZEKQz32PA/e
         hHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wf9y8+1joEYb/HCyi+/8yV9gasgGjzuhziBWfrrMIJ0=;
        b=d8ovHc/sM1nRPRL0LSQYC2Z0eBCC5TxeQ419zyY8/zlQ384R85WHsWrpVoq8rEqpD8
         JAO8uxZ7e2DuiHClP1QU74QIp2hEpdLRhVgWXQcrrJzqW5smW+R8q4jQSCfztTUnUqzz
         09A7DurARHVUs9w4mHZXLUtyCo4THVSszJVqaL4F4EZtcql5C6GHOcTFfKnt1Kk0RpEO
         BE0rybnQnMEiZjtIoYw/52uNeodGKWqpcYkJyU6WXid6fZaoemlJ5jVDuScyn77lpe+P
         3CIoBjuatnRa5wNUqa/KoRhwpj7he6pF6HShxhY5XBLXzKJc5WBeE0ONb1lI61emY/F3
         CoyQ==
X-Gm-Message-State: AFqh2kq11deTM1z427IE3rHy+7/HHELTbGbynEQm0vPQi2tXV8mWAmTt
	KOUin/WsASOkZgl1K4ATyJRNuotPlpm1smxVw9Y=
X-Google-Smtp-Source: AMrXdXuafHQL3GUTSsJIf/LiKWonuNpmNPh2RjDpJrIB0GkwZ9ViOqzHHzKUeRElFo/f7MCXvr4x0cSel6v/ye0aohw=
X-Received: by 2002:ac2:46ef:0:b0:4b5:62e4:bff2 with SMTP id
 q15-20020ac246ef000000b004b562e4bff2mr1212634lfo.492.1674503928206; Mon, 23
 Jan 2023 11:58:48 -0800 (PST)
MIME-Version: 1.0
References: <20230117164244.382243-1-Randy.MacLeod@windriver.com> <84E7BFCE-8C99-4216-86BE-9801D87E5AAC@zhengqiu.net>
In-Reply-To: <84E7BFCE-8C99-4216-86BE-9801D87E5AAC@zhengqiu.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Jan 2023 20:58:36 +0100
Message-ID: <CANNYZj9fOG8UMQNk5hTMcpAC5+bQHTnEoNmHUSFdfZe5G=iDLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: upgrade 9.0.0947 -> 9.0.1211
To: Zheng Qiu <contrib@zhengqiu.net>
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 19:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176317

vim is a 'special' upstream, because:

- they tag every commit with a 'release' tag
https://github.com/vim/vim/tags

- there is a never ending stream of CVE vulnerabilities coming from them

We tried to stick with major versions only and backport the CVEs, but
that quickly became unsustainable. So instead we just bump to the
latest commit, admittedly a random one, whenever new CVEs show up.

The comment in the recipe should be removed or rewritten.

Alex

On Mon, 23 Jan 2023 at 20:14, Zheng Qiu <contrib@zhengqiu.net> wrote:
>
> In the recipe it includes following:
> # Remove when 8.3 is out
> UPSTREAM_VERSION_UNKNOWN =3D =E2=80=9C1=E2=80=9D
>
> Should we attempt to remove it, given that this is now 9.0?
>
> > On Jan 17, 2023, at 11:42 AM, Randy MacLeod <Randy.MacLeod@windriver.co=
m> wrote:
> >
> > Includes fixes for:
> >   https://nvd.nist.gov/vuln/detail/CVE-2023-0049
> >   https://nvd.nist.gov/vuln/detail/CVE-2023-0051
> >   https://nvd.nist.gov/vuln/detail/CVE-2023-0054
> >   https://nvd.nist.gov/vuln/detail/CVE-2023-0288
> >
> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > ---
> > meta/recipes-support/vim/vim.inc | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vi=
m/vim.inc
> > index d86841efaa..9bc6881fce 100644
> > --- a/meta/recipes-support/vim/vim.inc
> > +++ b/meta/recipes-support/vim/vim.inc
> > @@ -20,8 +20,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dma=
ster;protocol=3Dhttps \
> >            file://no-path-adjust.patch \
> >            "
> >
> > -PV .=3D ".0947"
> > -SRCREV =3D "cc762a48d42b579fb7bdec2c614636b830342dd5"
> > +PV .=3D ".1211"
> > +SRCREV =3D "f7d1c6e1884c76680980571f1cf15e0928d247b5"
> >
> > # Remove when 8.3 is out
> > UPSTREAM_VERSION_UNKNOWN =3D "1"
> > --
> > 2.34.1
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176316): https://lists.openembedded.org/g/openembedde=
d-core/message/176316
> Mute This Topic: https://lists.openembedded.org/mt/96333742/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

