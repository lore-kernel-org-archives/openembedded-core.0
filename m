Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9ED5C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 16:32:40 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.55070.1684341159017282163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 09:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DTurUgBR;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-76fe17da95fso22736039f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 09:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684341158; x=1686933158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umq78+MOhs/pCGqY6JtEVt5tTEp0tX2qdXGEJUR1XP4=;
        b=DTurUgBR5cMsuEvGH8SP0w5SZOl99fkVQcCg7IOS88Gb0kRMkntoBfDsQUGW2+c0o4
         iXeuB2mOgoVnVpemhacyMQndnphpGtQtIWWPmX9FadHNUqnP/VCk4kUKfVGMR5rR2Ds2
         YbzBQDDS+QfCzCrm1UIQHToWMqqXMQnY/7qOBujsTnodgUNwi5jzk4ydkYGy2LeKPJES
         EjV3qZTbRgdDDLpZ7SUt8+hHwxUu4IK51oTCWHYGlfvT5igP6RRmF5yEHftV6I6UURBl
         wGLMqRtXXnaJUwWH6TjuSxmEAZojI3N9YhPVlHDbgavOKySAsl5PD3WqvSVtSZ8y4BQt
         qJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684341158; x=1686933158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umq78+MOhs/pCGqY6JtEVt5tTEp0tX2qdXGEJUR1XP4=;
        b=Jz9WF2flN2I7HZbkft74K+TDsVrilnDOThqdJT/I44QWx5lLIUzPsbY9z7EC+0eOUL
         y4u3mg4XnurB2n2BGb2gaNLg/C2Z2rDT6fdXy0ZXaUGqFrZTY3lnHj8kceu7acz6qj5f
         I7SuCnscGE4wkikIKpBgi3x7lEZGDnyFEmbbh/z5+Dg3x55WIxnOIV9GwTT9SJQoIeNd
         bjKIknneOtEaKh2vVY+g4YcB6XRHTY6HcIRkxEAaVFiZcvuJYpipBWioaBdaPx4tLdy/
         oPhQklCz2lLvdGdtBH+b17V4aZ6JsgGVzSCLFf0NH8oy8ImfA5r0jJINR78bE4AFh605
         QTSQ==
X-Gm-Message-State: AC+VfDxUgvThY7VcsJ6lv+qVW9a3BE98wlkdXYYr/GbX/1eHzl4kVklw
	aKadMQXmzQSEHMZeRhDwABk10Lzkv/exdAYT5JU=
X-Google-Smtp-Source: ACHHUZ4mnpFRz4C15focJ+UBla4lf4bGIu806Ebl+8eXwINRMoGPYOwPE2F05ypgdH5Ia2x0yTURhcVUuJExpwozNHc=
X-Received: by 2002:a5d:9c98:0:b0:76f:e9ec:d62e with SMTP id
 p24-20020a5d9c98000000b0076fe9ecd62emr4499535iop.5.1684341158185; Wed, 17 May
 2023 09:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230517080639.9336-1-brgl@bgdev.pl> <20230517080639.9336-7-brgl@bgdev.pl>
In-Reply-To: <20230517080639.9336-7-brgl@bgdev.pl>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 17 May 2023 12:32:27 -0400
Message-ID: <CADkTA4M_vy+E_nqxMMHDVi4bmw7OdNyRTwBDiNvLRQ8ydP-2cQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 06/20] python3-libfdt: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 16:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181497

I'm not sure if you saw the old threads on this, but we went through this
binding in detail in february:

See the series from TrevorW:

[PATCH v3 1/4] dtc: version bump and add python wrapper

The pypi releases of libfdt bindings are not kept in sync with the dtc
releases and rarely update. Not that they change a lot, but that is
still the case.

The suggestion for the bindings is the same, they'd be better of built
from dtc, versus using pypi.

There may be some issues remaining with the build, as Trevor hasn't
updated his series in a while now.

Bruce


On Wed, May 17, 2023 at 4:06=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a recipe for python bindings for libfdt (spun out of upstream dtc)
> fetched from pypi.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../python/python3-libfdt_1.7.0.post1.bb      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-libfdt_1.7.0.pos=
t1.bb
>
> diff --git a/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb b=
/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
> new file mode 100644
> index 0000000000..1ff3decbb9
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Python bindings for libfdt."
> +LICENSE =3D "GPL-2.0-only | BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D " \
> +    file://BSD-2-Clause;md5=3D5d6306d1b08f8df623178dfd81880927 \
> +    file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE =3D "pylibfdt"
> +
> +SRC_URI[sha256sum] =3D "2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc=
5d5753771c1f9ba1"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +DEPENDS +=3D " \
> +    python3-pip-native \
> +    python3-setuptools-scm-native \
> +    swig-native \
> +"
> --
> 2.39.2
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

