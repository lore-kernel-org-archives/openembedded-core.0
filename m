Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC7CEEEC02
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 14:35:29 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.22208.1726583722525949040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 07:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ekhCZepJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.181, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ddd138e0d0so18484707b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726583721; x=1727188521; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD5JAm9/vIN+BOYk1AcEPAy0PmWfrhH9bxNRpYedSFA=;
        b=ekhCZepJIM8tbw+dt8jYoIAemODpwxJ2ygMcrDwkIm/B2SEXmbbfCQET9RvFsTcyWy
         3NJddGNEpc7uqseNv2j7VKQB4UTrbCiqUIMp1Sqy+0NtPLJKijglrnxLiwXrJlod6k6Q
         I6pNwQ4ugYS+BcVSuuPZqNrOU7J85YaZ5ggjw+SVnUBfV6z/kYWEXwpTciEKqEyC78JQ
         n6bzIbLMuaxlVYN8jDyGg26V+yQvgOCfFvu59BLEIEOIFE5D07sPJ3gjdizhlZmd9UhB
         ujmTc9liVGdChDBLUElH4DRouWxfY2NBvqynko6PEhh2NFmFgktLzrZ6X6iocvzdaSWY
         bC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726583721; x=1727188521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RD5JAm9/vIN+BOYk1AcEPAy0PmWfrhH9bxNRpYedSFA=;
        b=RAwDJ7R/OnAqHX+SfzQ1KufJ257mZ0Y//aIZBUfk4Yw1NPvLIV3R0yddaPTIL/EMMI
         +V8yKS1JRRCCy0kUwDgAuwxWsiV025pxZ1VvbfQvMZ+xQO++zHPy5DVY8LdT39NiNUJf
         ScNTkCIeKL/i2bvlOLjcXtWSVN+JeDuLGa2IkjhRvm0Ot4aTVQTEYkjiXh09othAJu2A
         WJi81qf/15FJ8dQ9WR8YiqAfTBAqVdgge51tHNjNO/08h8QWfwzqLEKIdG+f1SJfOBEY
         wnZQwO4xte8RDFSu6maFFpPDMK5Vh5fk/4KzKO17bWy1MatCnRpUxQ9VpVzlctT433lf
         k81g==
X-Gm-Message-State: AOJu0YxRYFQGBO+d5Tzt0Jw4zbMk9LlzopmiM6T5CAs/mvqF/5D2Hxll
	CWsrMplPuyn/DtYS6dOYQ4k1hiq4+rne0EeyxDd3v0WIxmCa/kXXzNxdkvkgWh4tRlPyF6hVA3r
	DwfARzDBv4/Ael965+DFHvaiQLXV73T5tqdRpxQ==
X-Google-Smtp-Source: AGHT+IGMCi6T+BVoxmkOBMDqkVY/Zt4VXOrHnoyJtMM7JLO4Z4SyZ3Lm1/zPYV2pRtIDOB3ySd+lgTiNwUuirHL7BQE=
X-Received: by 2002:a05:690c:1d:b0:6db:4809:ed57 with SMTP id
 00721157ae682-6dbb6b35d09mr171938747b3.22.1726583721590; Tue, 17 Sep 2024
 07:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240906132339.1721751-1-vanusuri@mvista.com>
In-Reply-To: <20240906132339.1721751-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 17 Sep 2024 07:35:10 -0700
Message-ID: <CAOSpxdbQ0wgTTbs-PB604CrvsKTxgiRGhy7x5PYUemUztk8iGg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] python3: upgrade 3.12.4 -> 3.12.5
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 14:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204623

Unfortunately this results in failures in core-image-ptest-python3:

https://errors.yoctoproject.org/Errors/Details/805686/

Steve

On Fri, Sep 6, 2024 at 6:23=E2=80=AFAM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html
>
> Include security fix
> CVE-2024-6923
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-6923
> https://github.com/python/cpython/pull/122233
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../python/{python3_3.12.4.bb =3D> python3_3.12.5.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3_3.12.4.bb =3D> python3_3.12=
.5.bb} (99%)
>
> diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipe=
s-devtools/python/python3_3.12.5.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python3_3.12.4.bb
> rename to meta/recipes-devtools/python/python3_3.12.5.bb
> index 3ac83166ac..5c3b7a92f8 100644
> --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.5.bb
> @@ -42,7 +42,7 @@ SRC_URI:append:class-native =3D " \
>             file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de=
31b32de2b0e79554"
> +SRC_URI[sha256sum] =3D "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba9=
91dcc55113876397"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204263): https://lists.openembedded.org/g/openembedde=
d-core/message/204263
> Mute This Topic: https://lists.openembedded.org/mt/108303922/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

