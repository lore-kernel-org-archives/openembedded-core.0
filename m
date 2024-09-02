Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A19CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 09:59:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.35260.1725271165492559138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 02:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZDlI3CVu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428e1915e18so33394925e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 02:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725271164; x=1725875964; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jfhb61+Njlak20TjXiXNYbnkoTIdGeeiRsehQ3+Rv0s=;
        b=ZDlI3CVu+GcXDTxB4cFWQjeHFmw4EmSNbHsLlwmQXh+zWclCYugDbzFkOGTAgxBA/F
         u4d+QBuxRVqAQwhrXUccKN8FFAqgWsfzdye3S/Grp+0QCy5Hb7fu8f12SCVR2eS/Z0XC
         qH43zRCfQfl9xGoOgnXSazqgzU6pmvVd2q5Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271164; x=1725875964;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jfhb61+Njlak20TjXiXNYbnkoTIdGeeiRsehQ3+Rv0s=;
        b=W+7QHAr/1zKd9+g0bBg3Y73D/FgN2FZz6AiYxl4IbO6urFtrx/nm7oiwB1gB02qITe
         Grl3CeZz6V2v4c8gcHHDsp4mCcOizh7M/jtdM8eifbaMhEGooXf6npPMwGgKEmK1Pitu
         6GNeeT3DWMhyib+LF8zRDvo6KAMWorml7BbXsg7jlOHVk24fcLKsGcplyZ68sP/phXqm
         McJG37A1VSHtnz3Vj32GJwKeSkJ4HgjNCyZDqLe5IuoufidcnhdKChL66lEzrBNV0D5y
         qQeO/EXhEJWhlBc44612gPGpj42cBaf8EWHa47nKHtfT6PB+uyBFDcB0R8eLU89nZIXb
         vVGg==
X-Forwarded-Encrypted: i=1; AJvYcCW+hPwSIsZQYrzNO1zPHUbd85zRM0CO73/u6vF3zx4a8fS0xtWPszK3V8a6yAGQ9LGDVP2QIzhb0AUK0yZZz2wZDw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqhgXztUYdOGPBrkgYhz8gA5JMO3+KbwFepU3GZMlJrrlbZlku
	BnKPXmRjpVPJ7vohgVl/XvGr5nBKOClWs1jPvbEQksBJzzRy1aqaYhoXnwt/8QQ=
X-Google-Smtp-Source: AGHT+IGQHE/ymvlJFAVC02dxPAKdap5glZeaYE+mghv/GeWMR/ejhtozlZAlTbTwGHcs8JMBQ9VR0Q==
X-Received: by 2002:a05:600c:3c9b:b0:426:5b21:97fa with SMTP id 5b1f17b1804b1-42c7b5d8ffamr38274945e9.29.1725271163663;
        Mon, 02 Sep 2024 02:59:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d? ([2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb9ff0acdsm113101415e9.38.2024.09.02.02.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:59:23 -0700 (PDT)
Message-ID: <99e13a8ab6cea2424298d97466ad48540cee1209.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] systemd-tools: add recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: Erik Schilling <erik.schilling@linaro.org>
Date: Mon, 02 Sep 2024 10:59:22 +0100
In-Reply-To: <20240902094117.31156-2-mikko.rapeli@linaro.org>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
	 <20240902094117.31156-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 09:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204068

On Mon, 2024-09-02 at 12:41 +0300, Mikko Rapeli via
lists.openembedded.org wrote:
> From: Erik Schilling <erik.schilling@linaro.org>
>=20
> Provides systemd-tools-native recipe for ukify.py tooling.
> Avoids full systemd native build which is not needed.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0.../systemd/systemd-tools_256.5.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 41
> +++++++++++++++++++
> =C2=A01 file changed, 41 insertions(+)
> =C2=A0create mode 100644 meta/recipes-core/systemd/systemd-tools_256.5.bb
>=20
> diff --git a/meta/recipes-core/systemd/systemd-tools_256.5.bb
> b/meta/recipes-core/systemd/systemd-tools_256.5.bb
> new file mode 100644
> index 0000000000..f2e419ffe0
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-tools_256.5.bb
> @@ -0,0 +1,41 @@
> +require systemd.inc
> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/systemd:"
> +
> +DEPENDS =3D " \
> +=C2=A0=C2=A0=C2=A0 intltool-native \
> +=C2=A0=C2=A0=C2=A0 libcap \
> +=C2=A0=C2=A0=C2=A0 util-linux \
> +=C2=A0=C2=A0=C2=A0 gperf-native \
> +=C2=A0=C2=A0=C2=A0 python3-jinja2-native \
> +=C2=A0=C2=A0=C2=A0 python3-pyelftools-native \
> +=C2=A0=C2=A0=C2=A0 python3-pefile \
> +"
> +
> +inherit meson pkgconfig gettext
> +
> +MESON_TARGET =3D "ukify"
> +
> +# Helper variables to clarify locations. This mirrors the logic in
> systemd's
> +# build system.
> +rootprefix ?=3D "${root_prefix}"
> +rootlibdir ?=3D "${base_libdir}"
> +rootlibexecdir =3D "${rootprefix}/lib"
> +
> +EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
> +=C2=A0=C2=A0=C2=A0 -Dnobody-group=3Dnogroup \
> +=C2=A0=C2=A0=C2=A0 -Drootlibdir=3D${rootlibdir} \
> +=C2=A0=C2=A0=C2=A0 -Drootprefix=3D${rootprefix} \
> +=C2=A0=C2=A0=C2=A0 -Ddefault-locale=3DC \
> +=C2=A0=C2=A0=C2=A0 -Dmode=3Drelease \
> +=C2=A0=C2=A0=C2=A0 -Dsystem-alloc-uid-min=3D101 \
> +=C2=A0=C2=A0=C2=A0 -Dsystem-uid-max=3D999 \
> +=C2=A0=C2=A0=C2=A0 -Dsystem-alloc-gid-min=3D101 \
> +=C2=A0=C2=A0=C2=A0 -Dsystem-gid-max=3D999 \
> +"
> +
> +do_install() {
> +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}/
> +=C2=A0=C2=A0=C2=A0 install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}=
/ukify
> +}
> +
> +BBCLASSEXTEND =3D "native"

This will fail in CI as there is now maintainers file entry...

Cheers,

Richard

