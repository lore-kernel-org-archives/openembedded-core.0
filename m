Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B2BC54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 16:17:16 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.342.1710433029661586923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 09:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PwqAsCMC;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso857800a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710433029; x=1711037829; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTIPiTNCT4V/N64U70EhUbAt9HwM14jNL2IIt0ATKgM=;
        b=PwqAsCMCkgtYQNkpDnL8pVyuIGG35SWIThXKCfHIv5UuW35f0abCgssKbqaHonRSJ0
         n2r9H3CxhfBxcE8zcKvqSJY7h6+s1L5LEULxW1kZ7NPwTUk9n0RT/VvC1M1/KdCUZV5d
         hPpoyMc5z1FAqioVcRiXnvM5scYJsLTWMrrSbRxsVe/po26r6bJvu9xDJnSE/lAYc/2h
         J+Vzzk7vMyLv3D3OFzCU7nG9J4Cig3yLTFDezzkc2trFTB+1c3uqlnrBkIMRzjjNrEeq
         7QAAty5reGINDO/BxdlC7seAdfSU0xitzZAkWugtA5aOoqfbm/zLgGHQJ7nkLk/gbAgu
         0z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710433029; x=1711037829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTIPiTNCT4V/N64U70EhUbAt9HwM14jNL2IIt0ATKgM=;
        b=sOeqMZLWZvMOqWqWkuVxsqbGxNwmBE4fnHqxZ+q+48MSg6MtbAXdfoGYOJ23C+Sc2j
         9y+byauD3KCijFQII8b0NS8K73VYIwN43PeHzu3GVr97z1VJdxIEyKOHllttEgRnBdvL
         3jO4BHeg0WpZeDUfMfKxduLCyXZbKAQmt2kmA5qK7yRiBkfuhRlS95E+Llj5x3cmDgYn
         1egk8dfkR9EgEUjsFD1bo6oya6/i3ibNL6BdTp2PC/YEumltHoYXKNQGb/zf1TWurbVn
         aLidUjklNY2kjYwugXerL6PU9ENQBWAMCBmKvFO1ZqzJXoxu1PR0uphSOxS29boSoksx
         KzXw==
X-Gm-Message-State: AOJu0YykT/DjZyCthlrKOL+pSZOO7FUy4+dGL8rvu//PHoQjP0pJ3ub5
	99uQM7OYz6kvs2KLXvPc7ifHg+9G9wQSxuLuXsPjRDmfHT1EztjTZW4uzUaX2rEvsgIeCH/9Np2
	b5zTGGrAnr5t+3qn7WWAYTMl78r4=
X-Google-Smtp-Source: AGHT+IGwCzXFE2hLChiFs3PByhrFZZLi7tYNfH1cTW3dysI0sDCOM2pCg/y2BCWFupTpDEZ1rox9RqbMfLWJeUhXB+Q=
X-Received: by 2002:a17:90a:fb4b:b0:29b:f928:68fb with SMTP id
 iq11-20020a17090afb4b00b0029bf92868fbmr530698pjb.26.1710433028861; Thu, 14
 Mar 2024 09:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240314070903.83765-1-martin.jansa@gmail.com>
In-Reply-To: <20240314070903.83765-1-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Mar 2024 12:16:57 -0400
Message-ID: <CADkTA4MmFRrfw6d332buuv4z-MAjJFjvj=DYPpTXF2Jg7tKmuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane: add patch-status to default ERROR_QA
 for all layers
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 16:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197114

On Thu, Mar 14, 2024 at 3:09=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> * it's enabled for patches in oe-core for very long time and I was using
>   it for many other layers as well, so most layers should be in good
>   shape
>
> * it's also possible to disable it for individual layer as shown
>   by oe-core in:
>   https://git.openembedded.org/openembedded-core/commit/meta/classes-glob=
al/insane.bbclass?h=3Dscarthgap&id=3D61a881fdbe8b5a21c6276b8a5d06cc30486b1e=
b3

Most people have heard my opinions on tracking status
within files themselves (versus the revision control
system), but that's not the point of my reply (for once!)

Even with the QA error only enabled in oe-core at the
moment, it is effectively enabled / enforced in all layers
... since if someone is building a product and enables
the QA error .. all layers are going to have to comply
even if they don't agree (since removing it from
someone's  QA checklist in a layer would probably
fail yocto compat standards).

The summary of my rambling is: that I lost the debate
when the check was created and became an error
in OEcore.  So surprisingly, it doesn't really matter to
me, but I lean towards doing it post release as well.

Bruce


>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/classes-global/insane.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index e963001d09..9350bfa106 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -45,11 +45,10 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files=
 arch pkgconfig la \
>              already-stripped installed-vs-shipped ldflags compile-host-p=
ath \
>              install-host-path pn-overrides unknown-configure-option \
>              useless-rpaths rpaths staticdev empty-dirs \
> -            patch-fuzz \
> +            patch-fuzz patch-status \
>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=
 ' usrmerge', '', d)}"
> -ERROR_QA:append:layer-core =3D " patch-status"
>  WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
>
>  FAKEROOT_QA =3D "host-user-contaminated"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197098): https://lists.openembedded.org/g/openembedde=
d-core/message/197098
> Mute This Topic: https://lists.openembedded.org/mt/104922136/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

