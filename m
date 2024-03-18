Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A26C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 11:18:04 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.40600.1710760681186067000
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 04:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tl6XrT60;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so53746541fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710760679; x=1711365479; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ssCsyyVnJyVeTDM1XQqAb6QGknJtG6OotUnOb/PqKk=;
        b=Tl6XrT60MWSP9QOu0xKb07qAja6LcLguHPVjq1OVq9fKXCiA0nZfV70+dIurh1OpKV
         mlrdna3BnmE0odOidWlIH39gx57uF+CUS3AVZDOFEakwj1KnAYqJ9IVkyONhIMyUr6qJ
         LogBezvX8tI3v0poMbVwMA8FIAHTFI1I9+IE2kgvd+/sxgY+8lVWnszG/39YA83kQWYC
         wWfB7TXi8YEo/sJWqkiUwn04cercgKobDvXHd6DK8s9Lvijtn5eeT3BBiZIE7Duju+BL
         p5hWIv/jj5aqPpkwJWZDlOiJa7MDgiGOzrz/crdKPC0dIW4SPF/c/OH6HZoWoVFRUDuw
         9q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710760679; x=1711365479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ssCsyyVnJyVeTDM1XQqAb6QGknJtG6OotUnOb/PqKk=;
        b=K4bZ8YheeT3RrUcD2EDr6J+/o1cCPYJNjGxmhyLeGOHtY8ALhRl/MnMHYb6UI+6R2L
         JuPMgJsg4wxy97vcrMVs3jBvLrLAIZJXBPEcgJQTQ1cFKfo8kfZ/QEUFlX7VHIJfea88
         pFxtaLPpdCNrJoQMSU1sfd5tK6tn3ixGr3LroxtiSFE0hgMEjmTfT5ycZaDma62Ikg9X
         AMgXfxQLQuWsbzrlV7rLcC/G8GadNgI34azSR+8D6JEhx5PKlGzJzFfReaHksM5nZ5uc
         ve+MD7IxU9qp76qR6InVCLqkvyNqwMEKCMghaAxT/GF3GtHUmwT4WvDFXIT/38ngmow8
         BP0w==
X-Gm-Message-State: AOJu0YwLNnCWPpOHVzceIEdj7yv8AW3wakBzNAaL++EZVYHT7FEi+yMi
	Lbatjy5T0dlgvxeo72wUAyhNOMiVfw0qX9B5LRqYhQ5MD02TpVhhGQqUoDoworWoJY5UrNqO9rv
	BZjI0yL+7nix6EPHizyFiPNxbFlw=
X-Google-Smtp-Source: AGHT+IHIV3kyMjvTfD4IXZt9FM9394VADKjq5tNEELaNssC09m7l6onr/YLQoJ4hP/sQ6d6udxlhDvRTS0bdRMMYq5s=
X-Received: by 2002:a2e:99c5:0:b0:2d4:ad34:85a5 with SMTP id
 l5-20020a2e99c5000000b002d4ad3485a5mr1227874ljj.37.1710760679034; Mon, 18 Mar
 2024 04:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <lysf0r7ahx.fsf@ensc-pc.intern.sigma-chemnitz.de>
 <lyjzm374a5.fsf@ensc-pc.intern.sigma-chemnitz.de> <ly4jd37qm3.fsf@ensc-pc.intern.sigma-chemnitz.de>
In-Reply-To: <ly4jd37qm3.fsf@ensc-pc.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Mar 2024 12:17:57 +0100
Message-ID: <CANNYZj8K=shN9pcDegARQ3RT8aqWFWKNTL3JXNo4a796eBhJ2g@mail.gmail.com>
Subject: Re: [OE-core] '.bashrc': Unknown file type; file ignored
To: enrico.scholz@sigma-chemnitz.de
Cc: openembedded-core@lists.openembedded.org, 
	"Yu, Mingli" <mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 11:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197303

On Mon, 18 Mar 2024 at 11:59, Enrico Scholz via lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
>
> Enrico Scholz <enrico.scholz@sigma-chemnitz.de> writes:
>
> > 4.14.2/shadow-4.14.2/lib/copydir.c
> >
> > | 443         if (fstatat(dst->dirfd, dst->name, &sb, AT_SYMLINK_NOFOLLOW) != -1) {
> > |                     return 0;
> > |             }
>
> Bug in shadow-utils; when fstatat() fails, content of 'sb' will still be
> used.
>
>   https://github.com/shadow-maint/shadow/blob/f4293f9fbc2b855878f549d9124bdd638fb08c60/lib/copydir.c#L439-L447
>
> pseudo might trigger it because it calls the __fxstatat64() with an
> uninitialized 64 bit buffer and copies its content to the 32 bit buffer.

Thanks for digging, this makes sense as the code and the issue only
appear from 4.14 onwards. We had erroneously ascribed the problem to
static linking.

Alex

