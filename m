Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D07BEB64D9
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 01:26:55 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.353.1689038805713584442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 18:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FWqWLSDm;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3460e9f2376so26096195ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 18:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689038805; x=1691630805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IN7fmxZdquCx2YRctbdST6p3ov+8rfGdB3fZKMHK0fk=;
        b=FWqWLSDmT2i0fP0CijVzT29KE2fuOkyUwEB6lyJndicCBh3izUUVITiymrmkEo+9hp
         Y+XGZQVxodQ0rQd4DexWrH+kw3dduqW3r5ymZepaTHTPZrKTl8Ow/J8JYBiwsqU/p9Dl
         gLIDxiN0k5yTroVaI+5qZqvF6TKuIcqu/q3nB8+C2kD0wpoub92WzY2KXclYr+ETRZNk
         Kzvlvtip502Hsks65YQjtom7S3xBwrAlrwb6yCC63QjI4gt7NNEfdzl9SQmNVCrVziYl
         BjJAj8hpA/cKT2WjX+O1rFciko2pnJVmWyKoeEMUluOjPV3kPQlAZIcNAEiQ4ep1pOoj
         u5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689038805; x=1691630805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IN7fmxZdquCx2YRctbdST6p3ov+8rfGdB3fZKMHK0fk=;
        b=f5EuQG9H/YEKgD1+wBKnNyUylIQwLisj+BpoCZK+bVJa8ekUjBJqfsuMW3amSfAKuF
         TsJ9YVRiQ1a1VrlxDY5uXCAgncZS2sOsIcC/0cC5CEaLDdEd00CJ/F8GZkQBhvZSLfLh
         6VnAufObMpdoQvlIp0FZ8eqxQ+TDmNYIsQc12MVlRs5M8vx76Ja9TLRneKh3qUgNq2QY
         ECDJ1QqUe2q1F5AJX6vytbh1Fjx8ZNiRHG7pRElKX9FpQkRueLTvBoKzg2Q9MtzxmGYQ
         qDxXnam7Hjer5oUg071DBECffeEwOElcPbYg7RIXff89w70J5aCtd343AZcX+QRMeFV2
         aT2Q==
X-Gm-Message-State: ABy/qLZkSgyWrlPsy6BFIZtCnfzljLIw90KeUQmZio36I4iwSTUP0KLz
	aTUnwXzeScgYxXzINaSsZN4frsbkI3BYWmEVaC0=
X-Google-Smtp-Source: APBJJlF/MXTZ9F+FmniiQSpbLMmNiCkzBRg5UfJds2woqQO0oS6zRINqQwJF1rlkEsF4Wtk9shC4UzcYoeXtbW/7iS0=
X-Received: by 2002:a92:d385:0:b0:345:ed70:9a7e with SMTP id
 o5-20020a92d385000000b00345ed709a7emr15119263ilo.13.1689038804889; Mon, 10
 Jul 2023 18:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230711011104.2807078-1-tgamblin@baylibre.com>
In-Reply-To: <20230711011104.2807078-1-tgamblin@baylibre.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2023 21:26:33 -0400
Message-ID: <CADkTA4O0K8jxWJb-_7-ijdCzPVc7KcCw75xUYtUxa+4HGjZkMw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/3] python3-pylibfdt: add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 01:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184112

On Mon, Jul 10, 2023 at 9:11=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:
>
> This is required by python3-dtschema (already in oe-core) and
> likely some other modules, so add the recipe.

We are now on the 3rd (or 4th) iteration of attempts to add this.

Rather than re-hashing the discussion, I suggest searching the mailing
list for libfdt.

The summary is:  the pypi version is not up to date, and this python
library should be built out of the dtc repository and provided that
way.

Bruce

>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../python/python3-pylibfdt_1.6.1.bb             | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pylibfdt_1.6.1.b=
b
>
> diff --git a/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb b/met=
a/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
> new file mode 100644
> index 0000000000..9dd01a1449
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Python binding for libfdt"
> +HOMEPAGE =3D "https://pypi.org/project/pylibfdt/"
> +LICENSE =3D "BSD-2-Clause & GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
> +                    file://BSD-2-Clause;md5=3D5d6306d1b08f8df623178dfd81=
880927"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +PYPI_PACKAGE =3D "pylibfdt"
> +
> +SRC_URI[sha256sum] =3D "90c667c5adf44c6ab2f13bdc566598897784c7b781bed910=
64e7373bd270b778"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +DEPENDS +=3D "python3-setuptools-scm-native swig-native"
> +
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184109): https://lists.openembedded.org/g/openembedde=
d-core/message/184109
> Mute This Topic: https://lists.openembedded.org/mt/100070604/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

