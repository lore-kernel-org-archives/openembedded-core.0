Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47ED2C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 07:49:08 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.25504.1685605741545491458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 00:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fN4dxg4f;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f4e71a09a7so767766e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 00:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685605739; x=1688197739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPWSBKlcMZk7yo6YctEGlpA1dFuX6tSttXQec4mOdg4=;
        b=fN4dxg4fweMiaGh/CeQGMhyG7fLpUyCI6TMgyjIhBZZ+VW7xuiSQukZHbZiCJs5G+3
         gqZFRgXyNg5K+J21txvOBFTJMqkjqKHVN4jYxGh3dsAYdhPoUKm17iYQuxoWY6pcXhgQ
         7Tz1ada3nrcBDcys7/esbhnEiyw4oP4jqnesVXWBAhb9Dvsm+FapXIN8wvfqDuVLrk1g
         WDzdw24OHlNxWos6rvWWwjwL7lXgc08lQ8ErueLIQd7JtAqLaYcGMrdzpMNBhtCyidlr
         3xfkRre3kj6pUOroRvMARvfnXyjvBwS7k90CkRUXoA8YCXFq78Yop+Q3xEwbmHd3C/Em
         lLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605739; x=1688197739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPWSBKlcMZk7yo6YctEGlpA1dFuX6tSttXQec4mOdg4=;
        b=FTUZNVeXvMsIH1+8aAYJvDuO7F66Mk3YcmhHUeuwmokz75xKtXYPZjUfsLBmN1dqvH
         ZGOeHywE2Cy2M+47aY1Uawvg7PO+mSIP95iuj9vjW32yuX3jRUkys5bYlqNBsRH4J+v6
         1SCbQiGNgoSwdj1XwFcl2aGs1vFT/dhAgQzz3DX9sDet3rBVEDyp1HKtd2LzUzxEhe1N
         sPKF7JTAIxR05emS7YwOVCQCpfLrITNYEaTnck4yOcZk1rnWlPBqOsH4HBq/mcNqvc0o
         0/ZD1r6gpyPhuvQM9hFx3+aXrumeez4CGAFBldfLJ/ApDPITCwh1n45H37N/Q5ordE4r
         B63g==
X-Gm-Message-State: AC+VfDwkOqAntDO7yUQNzMOmXJJGZBk3CxeAXI0+REuFRSrCEC8xTck0
	34iOgXm34sw8MYUqJfA5Us/CecLtBLz1dM5oIGw=
X-Google-Smtp-Source: ACHHUZ4eDVMtisn8j+o/wIZ0LiY+mjJ9TPnYD2k55iBr2+0efQHcmypCvIRFWM2wFR34KmNiUxJv/eTpKlrOTnqc6fo=
X-Received: by 2002:ac2:5928:0:b0:4f4:d756:479c with SMTP id
 v8-20020ac25928000000b004f4d756479cmr292104lfi.29.1685605739226; Thu, 01 Jun
 2023 00:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230601074721.1985397-1-zboszor@gmail.com> <20230601074721.1985397-2-zboszor@gmail.com>
In-Reply-To: <20230601074721.1985397-2-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Jun 2023 09:48:47 +0200
Message-ID: <CANNYZj81eqM4Sp7kXdUgcE1Y8rGuBQByFQA29e26HsyJukUOkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-meson-python: New recipe
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 07:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182052

maintainers.inc entry is needed as well.

I hope my test for its presence merges soon :)

Alex

On Thu, 1 Jun 2023 at 09:47, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> This python module adds support for a new PEP517 build backend
> used by recent versions of scikit-image, scipy and others.
>
> The previously added python_mesonpy.bbclass uses it
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../python/python3-meson-python_0.13.1.bb     | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.1=
3.1.bb
>
> diff --git a/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb =
b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
> new file mode 100644
> index 0000000000..828a1652fa
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Meson Python build backend (PEP 517)"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd580b27e67cc0892a5b005b0be114=
b60"
> +
> +DEPENDS =3D " \
> +       meson-native ninja-native patchelf-native \
> +       python3-pyproject-metadata-native \
> +"
> +
> +PYPI_PACKAGE =3D "meson_python"
> +
> +inherit pypi python_mesonpy
> +SRC_URI[sha256sum] =3D "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40=
d36ba0099e3c7618"
> +
> +DEPENDS:remove:class-native =3D "python3-meson-python-native"
> +
> +RDEPENDS:${PN} =3D " \
> +       meson ninja patchelf \
> +       python3-pyproject-metadata \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.40.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182051): https://lists.openembedded.org/g/openembedde=
d-core/message/182051
> Mute This Topic: https://lists.openembedded.org/mt/99259412/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

