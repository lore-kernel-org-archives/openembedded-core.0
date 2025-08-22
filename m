Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C53FCA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 14:54:15 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.12019.1755874445687935308
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 07:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QnCmldjg;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e95246bd5e8so507796276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755874445; x=1756479245; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi+NSVYdu+Xt3EaS4qHQF6HPXdorJoj02Lg3YrOZY+Q=;
        b=QnCmldjgcqIfJnARsOc8nRuKwU2frjKKoqAY5MPLd+sXikUIO9+IEkj+heNky2LtC/
         J8Lpok/yFRWTlf6fkd6KYtEDut4IhcHlti1GUuQd8VGsWBxkZ258wYHO1wYGH9hwLgWk
         bM5FQoBU4vCry20P6myMcr2zLAOB12CfPA8fssaIvy6xQLzLN/XhX33ve/m3Z6N/L0xd
         1kHZ6bZEtEOsAn0NQIGhUrXkGmV55IvfdRs11RpPnh8ms8I9raPzLKUEpi05bW1rBdSw
         Gjwdja0FqsV8I/z3F0XQDO/sxO+JJOk53kex4bYiS/AWjNEi2FOM9t+YvjHH9BcACevy
         cCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755874445; x=1756479245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi+NSVYdu+Xt3EaS4qHQF6HPXdorJoj02Lg3YrOZY+Q=;
        b=qYFa5pgrKC+Tc+q0OGeRFAGfND2Co17kCG0DLFnScjlVscciDy+TKAy4XpKD3+6Yms
         DYDA0x8n6gKFPUcz8JFZzWoalC/faocb/XcqqOZiidxG42a7UQG1apvY5cvMr5TW31jS
         eNKP1/9OuyHKI3/lNofcYAGuS5pKd5k2FCsceDKZpoFFAXUgPfYMRyZOlqOKjqD44PxY
         MUECprTVimeJdk/bkffieWngARLOux+tFUK+pFROdt1rSxfZSI8Siq1hPoikXoTUZHfE
         z5/wMPXxXJ2L+YHVdiXUVlvTfYAK4QpiwESzGlBbdC0qXOgxfM5wuAQYWj51PRlqUUbt
         PGVA==
X-Gm-Message-State: AOJu0YynJ6XVcqZnbpbiqMDy8t3O+/v4vMbx2Ya8S2GvvILODvo9Ii3p
	ZFAX3kvCJWfHrIGNGHy47vuZ2nFtNc5zXPVxA/rFBu/oowdaYbuWvbx6YS15cqdcWPXX32xX+uQ
	wDsAXOnpFi2q9saoZjDMF6gsdlFsyPaF8VdT2
X-Gm-Gg: ASbGnctae9YMc4VjVfmVf3Gg+1p28zzTadlbS/xadGw3+RJxejHHPs0Uarhs89dLTS6
	0XLH+5D5oRQpDi32m8iLR0EpG2q3OlZlNllx7hHIx77FxD48StFSJVb3zPOsy+k87gQm3qUkx7M
	cCGzXqbHvwHu2dWqYOLICmTw6bySMaU3Lmmt1aZPQu4CngNDcBNI7jkLSEjOq9DT+h+pUBY4ArW
	32BJk5PbtTPYymVgCY6+Rz3V9GQvR1YESr8V0Ox0fEAppD5qCS3H5SHqy0F1fZHlDwm5APkpLTW
	Sjoz3jlKlX2H55j+ak6QiIg=
X-Google-Smtp-Source: AGHT+IHfSk0KIbWlVyGA7RfSHl+LZIfG4nBaKtZey4AJuA8/fT/1U0euj6LmmDN9+T5InnifAdz8PP4oAF9pJ5iv5SA=
X-Received: by 2002:a05:6902:70d:b0:e95:245e:47b2 with SMTP id
 3f1490d57ef6-e95245e55admr1396655276.7.1755874443283; Fri, 22 Aug 2025
 07:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250822051726.2429206-1-raj.khem@gmail.com> <20250822051726.2429206-2-raj.khem@gmail.com>
 <DC8W5II3V0GO.NM0SUO2KYRTW@bootlin.com>
In-Reply-To: <DC8W5II3V0GO.NM0SUO2KYRTW@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Aug 2025 07:53:37 -0700
X-Gm-Features: Ac12FXzHuQ69acxZAVc4hqJyb_UrQUnXFlt1ALy8E-Pavn1gcHe8qclLJZYel4M
Message-ID: <CAMKF1soMTcVXiPr6ko5xuD6gg5PoFMHUz+Pt78-0Hq63Ku5A_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] gettext: Skip test known to fail on musl
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222335

On Fri, Aug 22, 2025 at 3:40=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Fri Aug 22, 2025 at 7:17 AM CEST, Khem Raj via lists.openembedded.org =
wrote:
> > * Use posix thread on musl and cache
> > * Force using system posix complaint printf
> > * Add coreutils to ptest dependencies
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...-tests-needing-BIG5-encoding-on-musl.patch | 84 +++++++++++++++++++
> >  meta/recipes-core/gettext/gettext_0.23.1.bb   |  7 +-
> >  2 files changed, 90 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-core/gettext/gettext/0001-Ignore-faili=
ng-tests-needing-BIG5-encoding-on-musl.patch
> >
> > diff --git a/meta/recipes-core/gettext/gettext/0001-Ignore-failing-test=
s-needing-BIG5-encoding-on-musl.patch b/meta/recipes-core/gettext/gettext/0=
001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch
> > new file mode 100644
> > index 00000000000..481bcc0cb27
> > --- /dev/null
> > +++ b/meta/recipes-core/gettext/gettext/0001-Ignore-failing-tests-needi=
ng-BIG5-encoding-on-musl.patch
>
> Hi Khem,
>
> I had some patch fuzz with this patch, probably because of the unicode
> chars on the last line.

hmm, yeah I usually push patches into contrib yoe/mut branch too. Its
easier to cherry pick at times since ML may have issues with unicode
 etc.
>
> I did fix it manually on my branch, and it looks like the issue is gone.
> So as long as you are fine with this, no action required.
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathie=
u/master-next&id=3D1da6cc16bfe20e49007716511ea2d1cff0660006
>

looks good. Thanks for taking care of it.

> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

