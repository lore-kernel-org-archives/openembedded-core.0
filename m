Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 95B2261F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:27:48 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id u11so3899316pdi.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 02:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cowiglERt2Id9t2KEnZo/A7RVXm0rWn+DpPJi8kmkDM=;
	b=FWJJj5Ug7a93gKCTkoqqIRaRxt6iWC5xMj4ee48aRthpTe7Nqo1wZxQCsAV0laQ4Mp
	hSl5vyW4Axwe97TllebM8zZ/hJy0+2i9qNWv068OQiCpXJjRCEHsS6ufs4887Ry7k4wN
	OD5IcMvwBS11E6DNT2PTgmwW2IeNSGrmK+WhTOAIAMgBWncjuEuapdHcnyOob0/favRK
	eGkVaKRr9FKTfNV28lUxtsHmsAhVyli5d+EW7KfMZeDbsLF+WEwujelJ8U3c1QYwx+ma
	tLScUlPAaPHI648f4WAD5XhTvUXGsuy9wiXjR00qMUaxguT4UdG78FKSXNxnzl0SEXFC
	KEYQ==
X-Received: by 10.66.164.3 with SMTP id ym3mr17435165pab.106.1369387669871;
	Fri, 24 May 2013 02:27:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	fr1sm15495562pbb.26.2013.05.24.02.27.47 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 24 May 2013 02:27:49 -0700 (PDT)
Date: Fri, 24 May 2013 11:27:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
Message-ID: <20130524092747.GS32431@jama>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<bb45f98fdb02a8f24f3c09b885b0bf150d820274.1369386157.git.ionutx.radu@intel.com>
MIME-Version: 1.0
In-Reply-To: <bb45f98fdb02a8f24f3c09b885b0bf150d820274.1369386157.git.ionutx.radu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] matchbox-terminal: Updated to 0.0+gitAUTOINC+452bca253492a97a587f440289b9ab27d217353e
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
X-List-Received-Date: Fri, 24 May 2013 09:27:48 -0000
X-Groupsio-MsgNum: 39693
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="phbq2bkSb+hZnunM"
Content-Disposition: inline

--phbq2bkSb+hZnunM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2013 at 12:18:10PM +0300, Ionut Radu wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
> ---
>  meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb=
 b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
> index f4ad463..9d5e5d7 100644
> --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
> +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f \
> =20
>  DEPENDS =3D "gtk+ vte"
>  SECTION =3D "x11/utils"
> -SRCREV =3D "3fc25cb811a8ed306de897edf9b930f4402f3852"
> +SRCREV =3D "452bca253492a97a587f440289b9ab27d217353e"
>  PV =3D "0.0+git${SRCPV}"
>  PR =3D "r0"

The same about subject as in previous, but maybe you want to drop PR
here too.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--phbq2bkSb+hZnunM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGfMpMACgkQN1Ujt2V2gBxoNACfRoTUbXOGLkYn8o9AvynA3hh3
cUoAnjPAhtLlEgCOYEcgVNspsIUyYTi6
=QYzq
-----END PGP SIGNATURE-----

--phbq2bkSb+hZnunM--
