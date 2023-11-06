Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444A4C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 14:49:51 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.56426.1699282183083950898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 06:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gbZHEFKJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7a93df91813so168703239f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 06:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699282182; x=1699886982; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeEKIqx5OrS6jrKuRfuavVjgrzWHmCKREtCwgCKlWXY=;
        b=gbZHEFKJdvo8X8C+91RmJAwWclTTm14MsvFG9ASyQPikMqCyD15m0W8v1IchkWtEGq
         vKtYFqV3EGY1KwQvkn3fDZ6O/7NrQdIDUcGvX2krmjwLBEXhrvBdUFmlbNHWJXw8iS+t
         ZloM8cSY/GovaBgI3aOY1+2oSJln5bfJ7fCYkkxCYJItU4SYCqvyIGGq7TjbQAaU6C3+
         3c4cM+jvyczD0fqLPbSOZWk8aKJigBcBl5ecsgALTJJDvkeJHe+gK+WtP4gyW6Pr0xme
         O9pzJ9VeFM3qoEh3FDpQdbs8pEAnGTWjQohg/SQUturP7ATrVC7JyqjdyjpPWfYWgRFY
         NO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699282182; x=1699886982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeEKIqx5OrS6jrKuRfuavVjgrzWHmCKREtCwgCKlWXY=;
        b=tLUmMZd7vNpmSHXZ3nG/PL8oXofsRUasL9NuOZg2r3kOl9D1bKZgjQM4ejfL3L1BGs
         92MHQpE4qmaHuCtzNMxi5iIcZ/QdoyO+SP2iVq9FIOkEcsPPTeGRGbruR2wAbJLUU3aP
         NWA7LPmA9z79VtXy0LaqximUXAB05ORtIZ+dA5sMD4aYw7UcSfkaU5XXOHLb/BlFZ8nW
         +muLj9gBPDLVNz1gHjfIKYEmEGJaJdPPj+U02wGRQ9c8R65gB/CD97kYJ/2ekAhlSHRE
         fgEEL1JZ6O7ffV5hm+orIkW3IMAR2E22Di8gQFU/FJNuxXTBxgIPHR2jXVDpWOM8JX/N
         HJuA==
X-Gm-Message-State: AOJu0YzyypX35OmhE0LPtvhg535k3Bsk6kEncTRWVI/trafkMkB87HW2
	1+WodzfhMe2yzzYG3w77I5Q0oH38gWiwaPq5SJw=
X-Google-Smtp-Source: AGHT+IFu87pFp0XzLw8Wucorx5keVny+LlMtAzlCm+qgzpw+0LU8Nzro1DBxvTrEsZ43sHi4mkjzjSuJqmUOpaXMgg4=
X-Received: by 2002:a05:6e02:1d8a:b0:359:58ee:f925 with SMTP id
 h10-20020a056e021d8a00b0035958eef925mr14555493ila.12.1699282182118; Mon, 06
 Nov 2023 06:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2023 09:49:30 -0500
Message-ID: <CADkTA4OsEXpRsULAkvx0cbFvdH2xVPW3JGuG2FcJ43OZyakBzQ@mail.gmail.com>
Subject: Re: [PATCH] perf: add jevents PACKAGECONFIG item
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 14:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190221

On Mon, Nov 6, 2023 at 9:22=E2=80=AFAM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>
> Building for an arm64 target, e.g. qemuarm64 or a raspberrypi3,
> without "python" in PACKAGECONFIG, results in
>
> | Makefile.config:892: *** ERROR: No python interpreter needed for jevent=
s generation. Install python or build with NO_JEVENTS=3D1..  Stop.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index a392166e73..37b53ee7df 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -28,6 +28,7 @@ PACKAGECONFIG[audit] =3D ",NO_LIBAUDIT=3D1,audit"
>  PACKAGECONFIG[manpages] =3D ",,xmlto-native asciidoc-native"
>  PACKAGECONFIG[cap] =3D ",,libcap"
>  PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1,libtraceevent"
> +PACKAGECONFIG[jevents] =3D ",NO_JEVENTS=3D1,python3-native"

Since we already have a python packageconfig and it takes care of
the dependencies that we need, we shouldn't be repeating the python3-native
in this one. We'll end up having to maintain that dependency in
two locations.

i.e. we don't have python3-native as a dependency of our main python
packageconfig .. is that an error (the python packageconfig) or should
this be depending on python3 python3-setuptools-native, just like the
python one ?

Since there's no way to make packageconfig 'a' depend on
packageconfig 'b' that I know of (RP will correct me if I'm missing
or forgetting something here), we could always add a test on the
final PACKAGECONFIG and error/warn if jevents was enabled and
python wasn't.

It is always a bit annoying that perf turns these on, and we have
to explicitly opt-out .. but that is out of our control :)

Bruce

>  # Arm CoreSight
>  PACKAGECONFIG[coresight] =3D "CORESIGHT=3D1,,opencsd"
>  PACKAGECONFIG[pfm4] =3D ",NO_LIBPFM4=3D1,libpfm4"
> --
> 2.40.1.1.g1c60b9335d
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

