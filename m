Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B87ECDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 05:03:54 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.274955.1697605430546097214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 22:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IEMy6Jsn;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c5056059e0so73457411fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 22:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697605428; x=1698210228; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGOP74pogNRJtHJpAgpUm07/iL/p1FfQ8C+4VMzceaw=;
        b=IEMy6JsnNtalUWCSWTcexgY6zIB19CDQkw8xLYYbhso9ZN+jmufGG4sctkAdqc1NL4
         HbNOQ8a5YqI735wZYbE5VfJhN6c6rPkdipERemowdG5GfWrGYcGiUc8qUz7ASsqrml9H
         glAb59/DBW937o9zlqBW1Kq6awVANNLlH0rnXYDPcWk8niB3HaC/FlilO1evflkMt/LJ
         fum7b7Oqta+qI1fBXvSnsqy8knK2tqiYty4r32O5kdeMJcNTVt7g51w+gWWaDjlDG2ty
         tt7hbM2F3jUrMTyoQP17lHx4ZWv6zB9C9G0p5uWYFD/87yYyjn04xNtzvMF65GcPF/Qt
         FIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697605428; x=1698210228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGOP74pogNRJtHJpAgpUm07/iL/p1FfQ8C+4VMzceaw=;
        b=wCCqtKcecgm7Zw6p6cgp43YMmoBjf0fxlngZncdzjMqSQkPYTMZfg/dc/kXm9lXboc
         dWVSZyTCj7lzjUuutjbBeo6FM30Bl9W4niPAtLRUHR9q8YGGlEjv2ZueSwVutNLyLgyj
         8Lq49GIC4GM1Kv87rtI4EJJsMolI0VFNFqmf3tofD05hxYOAMnc6BlkpU8Th/WmloxGn
         YNIehpuiZIws7N/zY+RSr6R96F5wypmzZeS77gCNMTc440M2c86DZ9Pi1oFqjUT97Nwv
         PrSgJOpYRXbqIZidNkfk3jPCzMoZf3HUhlTm1IVdDyGqPRBfH18pmR03ujrpohgRO1sJ
         14Vg==
X-Gm-Message-State: AOJu0YxeKBPJd6GeKudbV4nvStOTomSmGHTt3qp4y3FbUVGQRjgWSEWK
	9fFZFZ9HA4WV/+wzXw9JUY72VdME0JmCXgvsfzI=
X-Google-Smtp-Source: AGHT+IFv822tjUDiI4Zl+xW5ZczKkAq54I5jZxrw8lda2X+K4X0NmuWx5Q7jhiLjRZ/m5e2VDAWIDEh5bwT8+eE0iuM=
X-Received: by 2002:a2e:880d:0:b0:2c0:2ef8:9716 with SMTP id
 x13-20020a2e880d000000b002c02ef89716mr2663745ljh.1.1697605427962; Tue, 17 Oct
 2023 22:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231017152517.26675-1-rybczynska@gmail.com> <c3e775b4b76cbedfa9a4b0cdaff70deb575bd293.camel@linuxfoundation.org>
In-Reply-To: <c3e775b4b76cbedfa9a4b0cdaff70deb575bd293.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 18 Oct 2023 07:03:35 +0200
Message-ID: <CAApg2=RbNM458cX23K-fc_j=bMoY7CERGbUy1s3Bmj2OP5S+Zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Add SECURITY.md
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 05:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189366

On Tue, Oct 17, 2023 at 11:50=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-10-17 at 17:25 +0200, Marta Rybczynska wrote:
> > Add a SECURITY.md filr with hints for security researchers and other
> > parties who might report potential security vulnerabilities.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> > ---
> >  SECURITY.md | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 SECURITY.md
> >
> > diff --git a/SECURITY.md b/SECURITY.md
> > new file mode 100644
> > index 0000000000..900da76e59
> > --- /dev/null
> > +++ b/SECURITY.md
> > @@ -0,0 +1,17 @@
> > +How to Report a Vulnerability?
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Please send a message to security AT yoctoproject DOT org, including a=
s many details
> > +as possible: the layer or software module affected, the recipe and its=
 version,
> > +and any example code, if available.
>
> Rather than send everyone to the security address, can we suggest
> bugzilla as the first port of call for anything public knowledge and
> less urgent and to only to use the security address for non-public or
> urgent issues?
>
> We do have the ability to mark bugs as security and private and then
> triage unlocks them too.
>

Absolutely. I will be sending a v2 to OE-core only. When we agree on this o=
ne,
I will send it also to other layers. As they might come in different
combinations,
a SECURITY.md for each layer (like README) gives us best visibility.

Regards,
Marta

