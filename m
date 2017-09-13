Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD4E782D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:45:46 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id n64so653842wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Yr6Ua9lqkIDd2sYoJ7Gt2yURruZso9NVJBWrV4HEMuw=;
	b=Xww+PYCzrFhvrY5ZBfS4Pu4Rw+FBQLrvPZ5HtRho69S5yvRyP+5tjg7AxgOCSFw/FT
	X7sUpoSkLdyoDxUT7LaxKiFLTpHCz0RWQJLcddJ3U49EeQ9Et5+9T6AVF5hB1QZZip+b
	ERoEj1WaIGAmuiFiGCq2rkxwvNW2Pp29cR6YeEOVZA8dHiY6yxftC9OeNo3/VUpqHBIk
	ZWNbMi5yGbNqc4/0Ky5M89Swk3j5Z6Gfijp8cn3gA5Tp/zK1SIJcBwDmo6LXWbrfP2yp
	/5oaEFVQelvR6Bw44Os/dfEzJ53rzy+hK0Pzcntr60UIoh8n0dLtQW9qOFyIXcRiAzql
	rwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Yr6Ua9lqkIDd2sYoJ7Gt2yURruZso9NVJBWrV4HEMuw=;
	b=ubPrL73CMQ+k4vt7/Cpemz62SibiRk2FIn0DZFAthbuEu7f2l+c9MVLvjCkmDtfm6c
	qGEwDSNgekQdXAS0q/LgiuYxodJvKfzT/slDm/HLUjllsGDVesiHmsXU9D50zzZbNYk/
	hphBnw8OkNmndQ+A+omyUtbim46mMsgewJoLx+NDIQA/OkT32gEeA1IIHlL51xh3us+8
	CC+gtWDBUUqFLXsEYVZ+GvO0uh2oXmica25AfQ3347fr5dX8qcbu+KeZcgTFG9OVjihi
	MQWVWU4r91DiH6bnRNeVkdRQGtXB8NUU1ek7y5gE0zcsUmpqQ/AqgB0PCwrGe0tHmP2N
	Vp5w==
X-Gm-Message-State: AHPjjUgrwZ5/+AHc+zR9VplAIEo3idATjhTokg5qgJOQWE8bAYuebCO1
	BGi5C49YrmX6DGRR
X-Google-Smtp-Source: ADKCNb5RGwS2i/MsB1K9n1r16w0lk6pSEHmQ8Ym94P40Ku2XCDNrf8YNhyDEEi8lWR/9aZfS+JocTQ==
X-Received: by 10.223.180.82 with SMTP id v18mr18459337wrd.61.1505335546995;
	Wed, 13 Sep 2017 13:45:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b127sm1553174wmc.34.2017.09.13.13.45.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 13:45:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Sep 2017 22:48:05 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20170913204805.GC3288@jama>
References: <20170913204647.1660-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170913204647.1660-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
Subject: Re: [RFC][PATCH] WIP: qemu: enable sdl2 virglrenderer gtk+ spice
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
X-List-Received-Date: Wed, 13 Sep 2017 20:45:46 -0000
X-Groupsio-MsgNum: 102864
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline

--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2017 at 10:46:47PM +0200, Martin Jansa wrote:
> * this is only for test
> * it should be enabled in some distro layer which prefers extra
>   native dependencies for virglrenderer and enables meta-pyton
>   for spice
> * cannot enable gtk+ for native builds, because there is no gtk+3-native

ignore this one, sending last patch but from wrong branch.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index e0b8647e88..ddf4c63edd 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -75,10 +75,10 @@ do_install_append() {
>  # END of qemu-mips workaround
> =20
>  PACKAGECONFIG ??=3D " \
> -	fdt sdl kvm \
> +	fdt sdl sdl2 virglrenderer kvm \
>  	${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
>  	"
> -PACKAGECONFIG_class-native ??=3D "fdt alsa kvm"
> +PACKAGECONFIG_class-native ??=3D "fdt alsa kvm sdl sdl2 virglrenderer"
>  PACKAGECONFIG_class-nativesdk ??=3D "fdt sdl kvm"
> =20
>  # Handle distros such as CentOS 5 32-bit that do not have kvm support
> --=20
> 2.14.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbmZgQAKCRA3VSO3ZXaA
HP2VAJ4nvYmdI4dXTzZFxhwkHo6jjumuiwCgmZsLOyFhDXD2XUm3uRPPOlKbaLk=
=7/GI
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--
