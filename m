Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF24787B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 23:21:10 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id t129-v6so10101973lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j8ZoibB56HkQVMu+RXSCXYKxys30bGSJ+xTdMVZM/Z8=;
	b=ojJHwJBwKuQNQ1EkkR3WoPos0ltW1vmwFsasRaKDW2m2vGZNwXL2ijbWq7cq+hPS5T
	U5siZTeT1Y2wq9FJ5DRbyY0+CULSj0hsdSVd9ccN1rBQvFGgvdVdhNl5TIgkxj9b5+aS
	tMl1JoDE0JG2xCal7lHvWXAAJMPjPfsy5+29eoZtLj1rIU+9ss8DF5RayZJnQ8LG1cGt
	7LG/LHmNooZafbGJtuQ/wnEOZc0iSKWzm03qaDAR5JSxORnHpGTQ/przLHmKbgKJJdcC
	cv+n05gxOC7z49ZzMx5siv/7TC+VAAsRgO8rKzCDoP2RPflTtcNRB3pKFU2FAyT+dvXd
	a/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j8ZoibB56HkQVMu+RXSCXYKxys30bGSJ+xTdMVZM/Z8=;
	b=mg+so2oZJr4a/U2AWl5QiYCSDkRqmNxxZiaAMqLGP3xcxuQJBmmKbPBOZOGsDPXhg+
	af6z71blljkoCKGbiXi7pyfmX7i5RabcgjT43/qb+mbFh97KYr75vjt8gUmwDn6KVHtb
	hJxuniKCphLXLL86+SgI9rHPtuIXvyabgXcso4hhzObRdOvgnGFfVULvM3926HXT5FT6
	AxHgXzTpyP75YRG6WYcSYY24qt/ReXvvN+Bo9V4TlWJTywa2/D44BR14LDewsryl7kN+
	QrWdGRSZJRRzArAlq1Y/wxqW46/tURWyOGFrIj0IB11WQ0CTyB++jfpW+kiEO43S7OEr
	LMHA==
X-Gm-Message-State: ALKqPwevxXclN1scbYqbzlkZA2Kwquy6UCOh7xBebvWFqzdL1eVfaQPl
	H1WF+UmgOX0wq52z35jGgVDm8fvARbHiOfByj+wC9g==
X-Google-Smtp-Source: AB8JxZpr0tICECJb9DHr8PkpxGaI4YDI2dSQtbxaexaFh2t5oCst+FAk/qFeFGy5v+xSEXJsR8HRNOa2Kty/JfR+eL4=
X-Received: by 2002:a2e:300c:: with SMTP id
	w12-v6mr5533468ljw.98.1526080871542; 
	Fri, 11 May 2018 16:21:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.142 with HTTP; Fri, 11 May 2018 16:20:40 -0700 (PDT)
In-Reply-To: <20180511192103.7581-1-Martin.Jansa@gmail.com>
References: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
	<20180511192103.7581-1-Martin.Jansa@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 May 2018 16:20:40 -0700
Message-ID: <CAKmqyKPvj_GDZNcXLMbAFEReKc5JvirOF8YQaenv2nSy85DrkQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/5] libsdl2: allow to build native and nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2018 23:21:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 12:20 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * enable x11 in native builds
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> index c0cf70d7fd..c37f669321 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> @@ -37,6 +37,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
>  PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>
> +PACKAGECONFIG_class-native = "x11"
> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG ??= " \
>      ${PACKAGECONFIG_GL} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
> @@ -63,3 +65,5 @@ do_configure_prepend() {
>  }
>
>  FILES_${PN}-dev += "${libdir}/cmake"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

