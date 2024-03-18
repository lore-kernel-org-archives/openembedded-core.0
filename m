Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39F8C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 16:48:35 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.50051.1710780511295023870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 09:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AXuIxiGz;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-221816e3ab9so2615696fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710780510; x=1711385310; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ucvflr8QAspfQ+BqZ0aRrDn33IGOlxeJVaocw8vysHM=;
        b=AXuIxiGzTVxSqelp2kSdlyLMLdgj1Vrc/Wg0+iGBVg7i3VbN/wbISoqg5ecKx7PAAq
         Yc6GvHztCIcuJxa1nEqDDuT/iPLyJBU/3VL+KKeFsy95hiNyyCDINB8MSHjvr6EV0Tcb
         W74URVKVnnOfrSiFtwtVn2BqpR9blqiX+QPJ3MgTuWex3i01647fyTz+3k1hwo6aI/3/
         jDVpR+SOiqDIRHDzmJrIAnoHnDDXudoCSJDv95UtgAth+p30sCuyI4n8Y10mnyAj0JaW
         S3b0KqE2em58dYFbd2Hlii4V1MEJ5Pj9Fz5y4L5Euea44VadF0btodxQRd5WJQgY7Vlb
         aDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780510; x=1711385310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ucvflr8QAspfQ+BqZ0aRrDn33IGOlxeJVaocw8vysHM=;
        b=DP9Ltc4NQQJv4jVJIztXL9XT+tWzwsayeBlvHoG584WQDNZXpvSrXb2OM3S0Csicjp
         OJoe/IV6BI/4T+o7pyOOFlbapCbthfMOnkzlBaL3itOjtaJm7v0QbpeSJnD6v9nSPYPg
         FIUzlSFnkntMD83g8tpBNN/Zx3AXAHbxowzX0NwovJNOm0NzkzS2Z+debEhV2NvNKfa0
         7JJyqbVZv57nnHQXqQk09rQvoHVb9Eq32ytxO84XymOHJqb9UxOaqBgkwPVe17Oc7xbh
         HbHlPOF5BnG7//cPJw85v3zSRcISuTu60N7ZmmHfRWzR/jl2Bvyo3mAmFdJ8v5HpjR9N
         S7Fg==
X-Gm-Message-State: AOJu0YzEh+BnkLlsuRAKroM0ARiEt4dKQf0laygIIHZRUBb2jBaNPey4
	Z3j6qhyUi5FreQ4atNZ2TWTSYf+2wudOhHMMknjMJwdtPF6rAATKFlozjip3FhH2A+HHPVZzR59
	WqmT4l745t08U3h3geCW1PR7gz/vW5M6a
X-Google-Smtp-Source: AGHT+IF5tRbi15RZxKpARXZsQMKkLX4CyuaGR93mmahEN8jolQA6BRe+HAyV9MdP1tOyjIFVpOsZvjdF35mN3Kqz7ts=
X-Received: by 2002:a05:6870:40c4:b0:222:619f:950f with SMTP id
 l4-20020a05687040c400b00222619f950fmr15217047oal.41.1710780510513; Mon, 18
 Mar 2024 09:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093554.2521527-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20240318093554.2521527-1-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Mar 2024 09:48:04 -0700
Message-ID: <CAMKF1soSYOdq0C7LnLdC6OKAFdkJW00caBUFks5kaaoXKo_=gA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3-gpiod: add recipe
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 16:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197309

its already available in meta-python and has a more recent version
2.1.3, is there anything needing it in such a way that
we need to move it to the core layer ?

On Mon, Mar 18, 2024 at 1:56=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> python3-gpiod is a python library for interacting with the linux GPIO
> character device, it provides a simple way to control a GPIO in less code=
.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/recipes-devtools/python/python3-gpiod_1.5.4.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-gpiod_1.5.4.bb
>
> diff --git a/meta/recipes-devtools/python/python3-gpiod_1.5.4.bb b/meta/r=
ecipes-devtools/python/python3-gpiod_1.5.4.bb
> new file mode 100644
> index 0000000000..21f0f35cbb
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-gpiod_1.5.4.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Python library for interacting with GPIO"
> +DESCRIPTION =3D "Python library for interacting with the linux GPIO \
> +character device. It is a pure Python library and has no dependencies on=
 \
> +other packages."
> +HOMEPAGE =3D "https://github.com/hhk7734/python3-gpiod"
> +BUGTRACKER =3D "https://github.com/hhk7734/python3-gpiod/issues"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfc4e57275d8c245894e576844=
466f725"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +SRC_URI[sha256sum] =3D "d8e4daa655dee75c33a49f5859b2e36c72385021c06c5552=
968294b1ad5c2dd0"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197296): https://lists.openembedded.org/g/openembedde=
d-core/message/197296
> Mute This Topic: https://lists.openembedded.org/mt/104999059/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

