Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 33AC97680A;
	Thu,  4 Aug 2016 14:34:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so45115257wma.1;
	Thu, 04 Aug 2016 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aIlUig/9Uh+r9+fpuJRGQmLv3b1L7hBaosKHB1oI874=;
	b=OcW9D3t49cp31/cepGPFXmU5iUvgev7hmj3JPz+nE9X+XYI9Pktyx8YHvrX4U/nqLx
	lhiUzDH1BiscNn75Ds7UoI3NlF1yOLBfOb4LRpTDPJmA60I7uabuNFdetNTQI1qVcaMw
	hI2QM0D7wN658brZXmmfNXewSl45A93tfF8cA4yOwtIx2og+Ho+nYcf+/wNzFbXttmw0
	2muDGxiUiWlRthvVDJ3p0qJX91hqxV03dm6E22AsSOntoMUgcngUreWEqbugM60zUHj5
	dvUy3UENfMju10KlRQseTTjFcHVVwtu3WkhHgO2LY8lQDlIk+B98TIT4dQkyXBhSRP+S
	IqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aIlUig/9Uh+r9+fpuJRGQmLv3b1L7hBaosKHB1oI874=;
	b=TsVl9mRHtm5UVMJJc9F+0rJuUxmTBTuChvjcy3eGpUj6KjqLAhgO1iUTFN8I/yzTHV
	XhrG/AnZoD6EfyZxgPSkKxxvUfvh25ZvZA/Pmoq2ECLUriFR5VmHpU1fFnTJpKxw204u
	NDxdkR2YLOee3o7NY9J90xEMCw0YfngL8MN+1jMoGtpwHYrX5TEPutDpoPxhA7FPdvjq
	W9hYSeMYg1b9iWSALCve9ABAEMhrEe3Hp90TWcqvAvEfjGh2sPlAYVjJoq3beqdslePk
	+7ICfMgS6jSTroLDyf6EAzuRvq6Wns79lmUleLhx1DAWRoR/SSHrEPvL/wVqng8OqNJ6
	S7pw==
X-Gm-Message-State: AEkoouswn/HaSFPJdf+EVhSaScowDcOMudrFYF1Sb0wxHOPJtxtk8hHsWomB33bKoW7cEQ==
X-Received: by 10.194.127.163 with SMTP id nh3mr66840210wjb.74.1470321257268; 
	Thu, 04 Aug 2016 07:34:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	yz6sm13155015wjb.35.2016.08.04.07.34.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Aug 2016 07:34:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Aug 2016 16:34:23 +0200
To: openembedded-core@lists.openembedded.org,
	"Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160804143423.a6fyiopqmt6abcq7@jama>
References: <20160801104924.10815.18743@opal.openembedded.org>
	<20160801104927.C930350170@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160801104927.C930350170@opal.openembedded.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 11/43: libtasn1: upgrade to 4.9
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
X-List-Received-Date: Thu, 04 Aug 2016 14:34:19 -0000
X-Groupsio-MsgNum: 85314
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h2m4cgwbwqx6xbj6"
Content-Disposition: inline

--h2m4cgwbwqx6xbj6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2016 at 10:49:35AM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 7ad0009d9282bd2af15b8b5d26a20a321cab0a32
> Author: Maxin B. John <maxin.john@intel.com>
> AuthorDate: Wed Jul 27 16:02:51 2016 +0300
>=20
>     libtasn1: upgrade to 4.9
>    =20
>     4.8 -> 4.9

This fails to build:

| In file included from ../../libtasn1-4.9/lib/structure.c:32:0:
| ../../libtasn1-4.9/lib/parser_aux.h:97:1: error: inlining failed in
call to '_asn1_set_down': call is unlikely and code size would grow
[-Werror=3Dinline]
|  _asn1_set_down (asn1_node node, asn1_node down)
|  ^~~~~~~~~~~~~~


>     Signed-off-by: Maxin B. John <maxin.john@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/gnutls/{libtasn1_4.8.bb =3D> libtasn1_4.9.bb} | 4 +=
+--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/gnutls/libtasn1_4.8.bb b/meta/recipes-s=
upport/gnutls/libtasn1_4.9.bb
> similarity index 81%
> rename from meta/recipes-support/gnutls/libtasn1_4.8.bb
> rename to meta/recipes-support/gnutls/libtasn1_4.9.bb
> index 360d529..5ce06d8 100644
> --- a/meta/recipes-support/gnutls/libtasn1_4.8.bb
> +++ b/meta/recipes-support/gnutls/libtasn1_4.9.bb
> @@ -12,8 +12,8 @@ SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.=
gz \
>             file://dont-depend-on-help2man.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "9a6767705725544f2b86670dcfb34107"
> -SRC_URI[sha256sum] =3D "fa802fc94d79baa00e7397cedf29eb6827d4bd8b4dd77b57=
7373577c93a8c513"
> +SRC_URI[md5sum] =3D "3018d0f466a32b66dde41bb122e6cab6"
> +SRC_URI[sha256sum] =3D "4f6f7a8fd691ac2b8307c8ca365bad711db607d4ad5966f6=
938a9d2ecd65c920"
> =20
>  inherit autotools texinfo binconfig lib_package
> =20
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h2m4cgwbwqx6xbj6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlejUkgACgkQN1Ujt2V2gBzm5ACgr3hUsu2nf+KiC09GJLa5c6eU
8E8An0bNpR7mdWv+NpI438qKBcAVAGh7
=+3DE
-----END PGP SIGNATURE-----

--h2m4cgwbwqx6xbj6--
