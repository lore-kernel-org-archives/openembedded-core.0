Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAFFC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:06:44 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.9828.1699362397029409852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 05:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=goJi4hUN;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35937f2fadeso22032855ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 05:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699362396; x=1699967196; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Fvh3ISMYZ3rh2R6Hmnf1Q0RrrhUuynGKxrpIEqmnRg=;
        b=goJi4hUNiufANi0GJ5vK9dUIfbNyhc5wQJCfkBp8qkllFrxOgxoBa00YTLI2MX7wLN
         VTm6g3qtsSJ/A4zVdkDe4AwUp0JJOYLsbgaPpjPdSFA2bi9jyffmJFTr6x9G59jK8k24
         a11MFAWDoUsaURja5fi0Gdu3fJBbM0m9q2rEHEmw9nHpmNyLX3Ax/g/gywzkncDoaLqY
         7N1i+702IVrbi2ccYYsadbsM16p6IqkENS0LCKjw9127lNXLEg2kI89VfsBJ2/yfj4mu
         yu1EYo1daD4Khw8AQHWG9eo594pxRBoFxU+Uyyr9urOtRJt/tzbNgtKKKgcZGnP/1L2H
         Vwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362396; x=1699967196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Fvh3ISMYZ3rh2R6Hmnf1Q0RrrhUuynGKxrpIEqmnRg=;
        b=nw2q93uu3vejQDhXbnT2zseYkjCSjocBBI/K2zrfwe6WubdQwZHs4yGPXtHD0vWlh3
         XFvKsQmIoSRCxYlfrIpiPEkX7FNs5lrQJe6A7EcSBmXbMpN8cEYfxVki3EK8c6Wid7iF
         sp28wYgd8UrTczyL9yOm+1kQoSVxwrTmeFZOVAY5+a49GcG9OKmLdzlLx+K0LOfWWima
         APbXu52f3CON8UOVIyxvRh+7uztu8lJVkMFzwrW8KspZm6V3q7lZPiAM+15YlzCrEjO/
         1a25sAjIrwnlpMzARNzgAwX5n9cQS+OhefX7auGZzdfRqgNCqMTXJK2fsk+MHOkzWuLd
         Mw5Q==
X-Gm-Message-State: AOJu0YyZmaKr/QTyD0603cVqOrNpJGsEA0o/p1pOgZhDgJ+U6eK+4Odw
	cc3pt14/7nh1kBe1zaW1TwCYigBMvBiMGeQxC9U=
X-Google-Smtp-Source: AGHT+IHsQIpz6Wi6PqXw+Ei1ydCxYmBN2HfVzft2tapsZe85HOtFTzyQK9L4TgCL+S7IEPXro3U3OgsspYOVoKACFIg=
X-Received: by 2002:a05:6602:1646:b0:79f:dbec:ac4d with SMTP id
 y6-20020a056602164600b0079fdbecac4dmr34544577iow.19.1699362396090; Tue, 07
 Nov 2023 05:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20231107092557.3843789-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20231107092557.3843789-1-rasmus.villemoes@prevas.dk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Nov 2023 08:06:25 -0500
Message-ID: <CADkTA4N1F2VN8SZP+Lhwx-ujpqBUNhr-6VeV+kXj5r-i79Ph2Q@mail.gmail.com>
Subject: Re: [PATCH v2] perf: add jevents PACKAGECONFIG item
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
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 13:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190282

On Tue, Nov 7, 2023 at 4:26=E2=80=AFAM Rasmus Villemoes
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
> v2: add comment on (non-)relationship to 'python' PC item.
>

v2 looks good to me.

Bruce

>  meta/recipes-kernel/perf/perf.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index a392166e73..5672f7d338 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -28,6 +28,9 @@ PACKAGECONFIG[audit] =3D ",NO_LIBAUDIT=3D1,audit"
>  PACKAGECONFIG[manpages] =3D ",,xmlto-native asciidoc-native"
>  PACKAGECONFIG[cap] =3D ",,libcap"
>  PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1,libtraceevent"
> +# jevents requires host python for generating a .c file, but is
> +# unrelated to the python item.
> +PACKAGECONFIG[jevents] =3D ",NO_JEVENTS=3D1,python3-native"
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

