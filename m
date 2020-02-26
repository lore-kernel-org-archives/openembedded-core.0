Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id BDD5F615FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:13:54 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 77so3047459oty.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 06:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i0a/Nvmce/HviTHaLksrBeDCJVkUnhZsWFpHQQkvqLg=;
	b=RTc8AtyBMtkKDEkwuRrmKRp/bFjK4aEAR7BEttdKSakeQsLwU6RXwfKpiRHfAraeJj
	xZV+ZRrQJ5Cuc8wa0cdUKAIr9fGAM/9DQ4Qkgr0ht26pF0rz0n12mJ6FtxXaowJubewx
	zLKXt0UsXAv3GyKeZRcs9Km4j8NS8ar0E0q1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i0a/Nvmce/HviTHaLksrBeDCJVkUnhZsWFpHQQkvqLg=;
	b=qxWYDeCtfxWnSYnyI/WLmEWbXKn+g7C6TqtLSA9G6XtzvOt6YqlC3DQYC4P7KoVqjI
	AagecsQeZ6mqoQXwHJMAy7QEqjWjYcVmU7VPtU/PWZOAHffs9jzJAxel0suclvosSw//
	feA/UJcQ8aPoJbTJzlOAEGHX3w+jRiPexfCMSr45Wl7dw+xNUj/6PPt1cX+C/0oktZQT
	S5wetq59xnS89f25MeDgIVJ1L7lWcLMquXjE6ujjjr/ibdJ080btzT1U2nKTx/EC+fI9
	5k9y8NGLoN+GwtZOkzPZKMmugm8shIecarj1X0UD1Qn7pupLy/Gie2c80AM6hD6iLOJb
	mkJw==
X-Gm-Message-State: APjAAAXOM8XgFaIKX4Lpu5dpMXAAkrXMK0QV+KMNkB/nTbCE3iGqKO8V
	86QQI9M+Q61D5dOTcB0/dCLX+8FX7vts+IDRY/wmXQ==
X-Google-Smtp-Source: APXvYqwiKu7JfOBPO72YKm9eu9cJ1eIDLsv2Kwl8tBTMh+oW2DkqMMd0BKHB57+SOXsVcKVNIaRh8glxhwnCkmOdEPY=
X-Received: by 2002:a9d:6a06:: with SMTP id g6mr2980429otn.305.1582726435651; 
	Wed, 26 Feb 2020 06:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
In-Reply-To: <20200226135716.49255-2-zboszor@pr.hu>
From: Paul Barker <pbarker@konsulko.com>
Date: Wed, 26 Feb 2020 14:13:43 +0000
Message-ID: <CAM9ZRVs=goPupsqu4G0NqLqE60Oz+EpwbORT4eLVPRpNXWjmKg@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Feb 2020 14:13:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Feb 2020 at 14:04, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via Op=
enembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
> The package name exploits sstate.bbclass so it's not added as
> implicit dependency to packages.
>
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

Can you avoid building libva in the -initial recipe and still get the
headers and pkgconfig files?

