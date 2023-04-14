Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DE4C77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 10:07:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.5601.1681466815146519811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 03:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=LgP28lTg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id n42-20020a05600c3baa00b003f0b12814aaso719248wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 03:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681466813; x=1684058813;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1E3/TbTfXx2SQAoSRiFJFGJJ4Gs7ywf9AN0M5ZW6TpA=;
        b=LgP28lTgkrmfPT6uvihOe7ZjrtiYEYVZhX7/nJZUQUei/gHRKlYWKErIkmCxkiIDKz
         Bp9qdf+QXojJX2VAt1euq/6DFApytNTsA/TSKEYFYviUGajZEOxzhgIsOPj51uEgJVDG
         Kg/ulJ/vT9vXUo/LBGiZoaRb73fXr+6MOrgVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681466813; x=1684058813;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1E3/TbTfXx2SQAoSRiFJFGJJ4Gs7ywf9AN0M5ZW6TpA=;
        b=R590I/23M1Y93kWfTdEvCzs9Mzlsglb17fWEuessj4cz/eBSG5rJxp542WooFmOrf9
         l9mZgUD1ZAL6Vc3S4ZQuJsNvuNnnzv99AUw3kgs52XQtO8+QLs6LWEyxrQGnkCc1nDTe
         jWlsKrH4s6C7ZhK2XecqjxrWIZ+5IMb15shXt6kVGR/BhC3w8+RnPM2BNETTouCiQuCC
         Eoxvfiit6DsQdRFwYZ1f8z/oEbUuHBBAYJS7Ye8I/ArdLmkOSrIR3LGVRZnIlBRMWZk8
         pBKyTqYvJfgpfLgkWfd1l556v0TW6Jd2H36ORYIdgn74oEr12yLq2NgMMpoz8MRajpXl
         kjiA==
X-Gm-Message-State: AAQBX9fYm1iFv3N1cEQ+IdJSTcrXl9VcCjFKGGNI+ZdnTvMK1QqbZKGN
	oNGfL4fqPjf6/bPFIfwfgk8tNg==
X-Google-Smtp-Source: AKy350a/LiOSVilvJZeuDq8/eSnYH9mlE57J6BWBs55t3AnrA7HeX5nZt4D4IP0jisLWas+SjBF0xw==
X-Received: by 2002:a7b:c386:0:b0:3f0:a798:2758 with SMTP id s6-20020a7bc386000000b003f0a7982758mr3849377wmj.1.1681466813442;
        Fri, 14 Apr 2023 03:06:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4676:d773:dc86:c4a1? ([2001:8b0:aba:5f3c:4676:d773:dc86:c4a1])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c155000b003f0a1c18128sm4921760wmg.29.2023.04.14.03.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 03:06:53 -0700 (PDT)
Message-ID: <1efe32dfbfba7491c672f81571bd950c629f1d79.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Cc: fnstml-fujitsuten@fujitsu.com
Date: Fri, 14 Apr 2023 11:06:52 +0100
In-Reply-To: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com>
References: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 10:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179996

On Fri, 2023-04-14 at 16:53 +0800, qiutt@fujitsu.com wrote:
> From: Qiu Tingting <qiutt@fujitsu.com>
>=20
> If gcc is installed in image, ptest result has 4 ERROR.
>   ERROR: tests/rm/r-root.sh
>   ERROR: tests/rm/rm-readdir-fail.sh
>   ERROR: tests/cp/nfs-removal-race.sh
>   ERROR: tests/ls/getxattr-speedup.sh
>=20
> r-root.log as an example:
>   --------------------------
>   k.c:1:10: fatal error: stdio.h: No such file or directory
>       1 | #include <stdio.h>
>         |          ^~~~~~~~~
>   compilation terminated.
>   r-root.sh: set-up failure: failed to build shared library
>   ERROR tests/rm/r-root.sh (exit status: 99)
>   --------------------------
>=20
> reason:
>   In these cases, k.c file is created and compiled by gcc before run.
>   There is a stdio.h file in /usr/include/ directory,
>   but gcc parameter is not set it.
>=20
> solution:
>   Add "-l /usr/include/" in gcc parameter.
>=20
> other:
>   If gcc is not installed in image, these cases will be skipped.
>=20
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  meta/recipes-core/coreutils/coreutils_9.1.bb | 1 +
>  1 file changed, 1 insertion(+)


I'm a bit puzzled by this. Wouldn't on target gcc have /usr/include as
part of it's default search path? Why isn't the default search path
working?

Cheers,

Richard


>=20
> diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipes-=
core/coreutils/coreutils_9.1.bb
> index 4807eefd04..fe785b673d 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.1.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
> @@ -184,6 +184,7 @@ do_install_ptest () {
>      install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
>      cp ${B}/Makefile ${D}${PTEST_PATH}/
>      cp ${S}/init.cfg ${D}${PTEST_PATH}/
> +    sed -i 's/CC -Wall -shared/CC -Wall -shared -l \/usr\/include\//g' $=
{D}${PTEST_PATH}/init.cfg
>      cp -r ${B}/src ${D}${PTEST_PATH}/
>      cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
>      sed -i '/^VPATH/s/=3D .*$/=3D ./g' ${D}${PTEST_PATH}/Makefile
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179993): https://lists.openembedded.org/g/openembedde=
d-core/message/179993
> Mute This Topic: https://lists.openembedded.org/mt/98258324/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
chard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


