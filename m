Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id BEFE461219
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:58:26 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i14so2391093qtv.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7FvkGXotmD6R3MEbE76gewoVEcMNS52iJOfGe2loJgQ=;
	b=VHSBDP7v2kNC/fCMyPwc7tg5ChXBGOMpoKEJ5+2xJHR2oodNo8NRZJ9WLo/t6x/hLF
	V4pRyGJ2YkfADye7bD9IYudoh/BBmTVvJ1xcsBNZaql4lLyx3GXNt3mjKEXKzbBkpW4R
	5s/B9bGMG7xe629E08xlRjXneg4DgpVi2ZujsYgge0wrMZ/layayO3brM78KgeyUl4ar
	9qMeEPoW8hjCFZI0tb/ESY8P3li0UEyjSnJQyQVdMSMGc/RcxD0igQQA5Mlpb1EeZyT8
	vHUlxDgxo2exErjxlhAp5S/+MqLMfiUEnzPfxWZEz1mR+T2Us/2WPYKBPKLAJdgSpBf8
	fwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7FvkGXotmD6R3MEbE76gewoVEcMNS52iJOfGe2loJgQ=;
	b=qEdw+dMAGU1qjdBGxxcCh6gZ+FuP4TfyWpdJQeX4mOuGmLtZy4EVOfK+JQn3i8HiGE
	qPFVm2KciOMhKibUqA0CPptJyeSh9mr3J4f8wlMIaKmaIg63QPq0ff6ty7V4/yAwy5mT
	V50nuYgHIxw3NgEBX8aqy/ZmWS+3+61wCcAeW+b1N2rl5FvU8gogTdjownS10nH4/Fey
	ZqqNGUrmBaI6NW510oO9n9Uk+IUwtiXtPVpdNoe/eAycj2KRdqxnZnDKiZEh2ygN4YaJ
	R/7PCTg19VjKJm8OWg3ORxiDh0Dnj2Xxkta8ijkKLA01xEAPKAiGBGvWrvQ0q7T3lcTm
	Oyxg==
X-Gm-Message-State: APjAAAWe8u4ExC7H77zLWECCwdEceORdKvjCU7TvhPM4d95BrHeA3huW
	cl4onokqkI8s+Unu6PcPRZHhv48FfGiRfI+huQ4=
X-Google-Smtp-Source: APXvYqw+dpTDhaFgNnXRBHe5fhwCz3fkEvw4ZSj6+Z/O0WrFbl1DIp0AUXdT4Ju+3PHhUs2FXd39eWhRHU/V3I3INWY=
X-Received: by 2002:ac8:36dd:: with SMTP id b29mr5334932qtc.285.1582729107059; 
	Wed, 26 Feb 2020 06:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
In-Reply-To: <20200226135716.49255-2-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2020 06:58:00 -0800
Message-ID: <CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 14:58:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 6:05 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via
Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>
> The package name exploits sstate.bbclass so it's not added as
> implicit dependency to packages.
>

what is the use of this recipe and why should it be added to core ?

> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> ---
>  meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
>  meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>
> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc b/meta/recipes-g=
raphics/libva/libva-2.6.1.inc
> index ca1386d80b..5b1cdee7e3 100644
> --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
> @@ -17,10 +17,12 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef035378=
00f"
>
> -SRC_URI =3D "https://github.com/intel/${BPN}/releases/download/${PV}/${B=
P}.tar.bz2"
> +SRC_URI =3D "https://github.com/intel/libva/releases/download/${PV}/libv=
a-${PV}.tar.bz2"
>  SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
>  SRC_URI[sha256sum] =3D "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd=
62e48629401eaea5"
>
> +S =3D "${WORKDIR}/libva-${PV}"
> +
>  UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
>
>  DEPENDS =3D "libdrm"
> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta/re=
cipes-graphics/libva/libva-initial_2.6.1.bb
> new file mode 100644
> index 0000000000..828ef6fbca
> --- /dev/null
> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> @@ -0,0 +1,5 @@
> +require libva-${PV}.inc
> +
> +do_install_append () {
> +       rm -f ${D}${libdir}/*.so*
> +}
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

