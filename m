Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F740C61D90
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 21:31:49 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.5498.1700602302822756570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 13:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=II+mfYPy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32d9effe314so4274561f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700602301; x=1701207101; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B0vob1PUyn7ZZkoi/6PMFFd+wKnDnmB2oTXkIhjUigg=;
        b=II+mfYPymLMU5C4diXKTPJpZZoaNVws8pchCHeihOgGF4dvMYZaX7fcfuBX6ZXYAny
         ufjATcrXXJzEE3It0kLLzjyf12xO4oTjWkuQSYsfgZYHvGWmZHYGOkW1VCDMz6dqip4B
         0jYr/6GXsuqKxzW2WNxvwiySP3j28v7L44M34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700602301; x=1701207101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0vob1PUyn7ZZkoi/6PMFFd+wKnDnmB2oTXkIhjUigg=;
        b=E4I8NhQ3DKiwnTZrGO8AtOFRhpP7BTRzUTm1xkPNZzosres8GG1IaDq5kWEMTzegOQ
         9G+j9ioDdNgedwbigc4KEnnIEWCx1Ko+78F5zg1hGSLaVdK/IFhc4NFn/NbIJDcNfAja
         uKniXhGiCSZ1C3wrl42XQCJ7pJKL//oA7MqCLj1eUAPfXgrjDacpQ6hYB6sUYdoyzHmM
         ffm/zJgCzTygTQ3vysE6dbYz0AGNI1ZGJBwakFXVC6N8gEBkt+9e79boMOzvKrWJ6KpA
         Mx1DXATK8NT5jM0/+moHXFjlgwG8lS/pxZoMP19eGLz3UsU3/1xLJnpj0ql2WgjRiHqY
         e9BQ==
X-Gm-Message-State: AOJu0YzkANHEnUJu5whpVISxfK+uS4nAMjpiKvr7AyMHFHVaaNPe1PLw
	IyaieMjjYX4zdu32S11gMezY5Q==
X-Google-Smtp-Source: AGHT+IFeUSIoredZhFO4sKZG8kaTlrjpeyHX/sSNC4KaXW8UDu6tbe7plVIR2a5XkW6tpXAZ+xqT5Q==
X-Received: by 2002:a5d:5583:0:b0:332:ce0f:484d with SMTP id i3-20020a5d5583000000b00332ce0f484dmr192891wrv.37.1700602301105;
        Tue, 21 Nov 2023 13:31:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1718:e534:44cc:c75e? ([2001:8b0:aba:5f3c:1718:e534:44cc:c75e])
        by smtp.gmail.com with ESMTPSA id t17-20020adfe111000000b003232380ffd5sm15409774wrz.106.2023.11.21.13.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 13:31:40 -0800 (PST)
Message-ID: <c0942aeb1bec834661ef2d0911dd1bb334ae533b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-poetry-core: upgrade 1.7.0 -> 1.8.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Tue, 21 Nov 2023 21:31:40 +0000
In-Reply-To: <20231120210140.3203077-1-tim.orling@konsulko.com>
References: <20231120210140.3203077-1-tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 21:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190991

On Mon, 2023-11-20 at 13:01 -0800, Tim Orling wrote:
> https://github.com/python-poetry/poetry-core/blob/1.8.1/CHANGELOG.md#181-=
--2023-10-31
> https://github.com/python-poetry/poetry-core/blob/1.8.1/CHANGELOG.md#180-=
--2023-10-31
>=20
> License-Update: add vendored fastjsonschema (BSD-3-Clause)

Does this mean we need to add BSD-3-Clause to LICENSE?

> License-Update: drop vendored attr,attrs,jsonschema,pyrsistent

Does this mean anything should be removed from LICENSE?

Cheers,

Richard

>=20
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>=20
> Tested by building python3-rdflib and python3-iso8601 for qemux86-64
>=20
>  ...3-poetry-core_1.7.0.bb =3D> python3-poetry-core_1.8.1.bb} | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>  rename meta/recipes-devtools/python/{python3-poetry-core_1.7.0.bb =3D> p=
ython3-poetry-core_1.8.1.bb} (73%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb b/=
meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
> similarity index 73%
> rename from meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
> rename to meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
> index 40b6355f4b7..ccfa3312747 100644
> --- a/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
> +++ b/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
> @@ -7,18 +7,15 @@ CHANGELOG =3D "https://github.com/python-poetry/poetry-=
core/blob/master/CHANGELOG.
>  LICENSE =3D "Apache-2.0 & BSD-2-Clause & MIT"
>  LIC_FILES_CHKSUM =3D "\
>      file://LICENSE;md5=3D78c39cfd009863ae44237a7ab1f9cedc \
> -    file://src/poetry/core/_vendor/attr/_version_info.py;beginline=3D1;e=
ndline=3D1;md5=3Db2dccaa94b3629a08bfb4f983cad6f89 \
> -    file://src/poetry/core/_vendor/attrs/LICENSE;md5=3D5e55731824cf9205c=
fabeab9a0600887 \
> -    file://src/poetry/core/_vendor/jsonschema/COPYING;md5=3D7a60a81c146e=
c25599a3e1dabb8610a8 \
> +    file://src/poetry/core/_vendor/fastjsonschema/LICENSE;md5=3D18950e83=
62b69c0c617b42b8bd8e7532 \
>      file://src/poetry/core/_vendor/lark/LICENSE;md5=3Dfcfbf1e2ecc0f37acb=
b5871aa0267500 \
>      file://src/poetry/core/_vendor/packaging/LICENSE;md5=3Dfaadaedca9251=
a90b205c9167578ce91 \
>      file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=3D2ee411=
12a44fe7014dce33e26468ba93 \
>      file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=3D7bef9bf4a=
8e4263634d0597e7ba100b8 \
> -    file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=3Db695eb9c=
6e7a6fb1b1bc2d193c42776e \
>      file://src/poetry/core/_vendor/tomli/LICENSE;md5=3Daaaaf0879d17df011=
0d1aa8c8c9f46f5 \
>  "
> =20
> -SRC_URI[sha256sum] =3D "8f679b83bd9c820082637beca1204124d5d2a786e4818da4=
7ec8acefd0353b74"
> +SRC_URI[sha256sum] =3D "67a76c671da2a70e55047cddda83566035b701f7e463b32a=
2abfeac6e2a16376"
> =20
>  inherit python_poetry_core pypi
>  PYPI_ARCHIVE_NAME =3D "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"


