Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508D1C7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 16:19:10 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.13841.1686241141531659714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 09:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KqsJ841A;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso1454915a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 09:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686241140; x=1688833140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDZQniwLtkSSo6gD2C8bNnh+PNgJJZG2K+U4mZ2RZd0=;
        b=KqsJ841ATNrwiIV57qphZ4STIgmILQl7IPLpk75KmjaSFuD6TeLXRp7iqUhjibZ+zR
         p6TpM2AAwN2s1LuBSwEPw3KX8V1qjmpJIeqi5BcJGutYpWttAIc5XV1+BfY9xv1vrhiy
         9fkLF0IEzlPvQJcZU/Wl+uvvuKkbZXYYpgA0UBZ8+mwyU7i6ftq+f6wdL2wSo4jeHXaL
         dV5QMK3q32YozzKJCApi8MfPgCSKWKC2Ks2uiiIJR8LVftDNzMLS/9EioRWtTgpixU1J
         JJBRYIPXB8lXBsT5oNFl4tJ52vmHnBe1aKhVt53GlysugLXOxf2XAOrSOQDC7+mRUapQ
         zg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241140; x=1688833140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDZQniwLtkSSo6gD2C8bNnh+PNgJJZG2K+U4mZ2RZd0=;
        b=Vr9Ppo5h9zc1fwZPKdrQfuWsEXYbWtFKRh+Eue+VBPv0fRRFJKgTIsCO3HDe9OKc6r
         9DxnHQhTygZSed0mByZNJxTSmyoNdKK35P/2k/sK8LxY6sThUdYPC32BHE5qmuhc+ANO
         9obpkdXSiz01PVHZJ+UK4AWK8G7IW1Ouob/s+8S4r1sQ75oqJcMCbvKcPlIx1YzcYmdm
         xj1MJbe838TYETwVGz+9OCFXfBZcjL6u+u4m3O6zpXnt50nUEQh2bropAzytGWLytzuR
         1FO3+1V3PJuMMkTK34h9T75OsGFGk1q9AmPn/9lpUwoUrmRlHGP0hEoCE7qnLSZXAZI2
         6qjg==
X-Gm-Message-State: AC+VfDwnGug+fJaokyHcWbwDUsBj9Ysj7uFw1+y0c+9BpJ0bEnY255JY
	1LKOiX69vjbDXuWHOxYvBS7guaL4Y9XkUHOiVVVwbTIVnE0fRCLG
X-Google-Smtp-Source: ACHHUZ6BO9ih3zwZvLHiAHBk9PzoUMwAFCj88bpmGeRN/horCH4DUmu+MesEzU+rilnsURKQeCBpIe6CARoSl6CDDMQ=
X-Received: by 2002:a17:907:961c:b0:973:946d:36b2 with SMTP id
 gb28-20020a170907961c00b00973946d36b2mr231123ejc.56.1686241139650; Thu, 08
 Jun 2023 09:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230608063048.3826472-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230608063048.3826472-1-mingli.yu@eng.windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 8 Jun 2023 06:18:49 -1000
Message-ID: <CAOSpxdYn4H=dOyoa8Eoi-LKLZYo+6bzi_7x2Y9Dy-ORNZXAajw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH 1/2] curl: Update from 8.0.1 to 8.1.0
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 16:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182515

On Wed, Jun 7, 2023 at 8:30=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriver.=
com> wrote:
>
> From: Robert Joslyn <robert.joslyn@redrectangle.org>
>
> This is a feature and bugfix release. Release notes are available at:
> https://curl.se/changes.html#8_1_0

Since this is a feature/bugfix update (and not bugfix only) it is not
allowed for a stable branch.

Steve

>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-support/curl/{curl_8.0.1.bb =3D> curl_8.1.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/curl/{curl_8.0.1.bb =3D> curl_8.1.0.bb} (98%=
)
>
> diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.1.0.bb
> similarity index 98%
> rename from meta/recipes-support/curl/curl_8.0.1.bb
> rename to meta/recipes-support/curl/curl_8.1.0.bb
> index 5cf044615f..0efd0de5c2 100644
> --- a/meta/recipes-support/curl/curl_8.0.1.bb
> +++ b/meta/recipes-support/curl/curl_8.1.0.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D " \
>      file://run-ptest \
>      file://disable-tests \
>  "
> -SRC_URI[sha256sum] =3D "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025=
f2bf118e79e0b5f0"
> +SRC_URI[sha256sum] =3D "6bd80ad4f07187015911216ee7185b90d285ac5162aed1bd=
ed144f9f93232a3c"
>
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182495): https://lists.openembedded.org/g/openembedde=
d-core/message/182495
> Mute This Topic: https://lists.openembedded.org/mt/99401642/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

