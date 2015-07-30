Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC9D17638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:31:58 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so246770997wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NqYUm7eQcNuNwqsOL0K57VwFAGT3bmgytkFoYJJuWpw=;
	b=EdPlRfzbL9dVxeNaTlYmqTSxw28PvB6rup1pQwm2jCADLjmAqqRfMS6IQEJde6LsJ8
	QK4xC5MmGMNUKroZe0dhcwFMazTJjDMLC1Xd5U2koeDcEoGdylT9mdRTFUckuh8ajCb7
	4aVJjEkTDMUf4SXKyp/5NQDg2VGeE+x21OdV7NiSwwesn/966n3UjtO9eiWpOQXhCdPt
	wIROrmnttiRgo0YaRvwzJW4sfzLePHGKMGwfTRSb/7i7JSKt26JfflPOc4icotiRZ2Rx
	8GB952iTWEqJkkWao7OWVgItB7SiIO1fi6CUKCrzPpDUPVA7V0a28L3zeR5Tyiv5mDta
	AQ1Q==
X-Received: by 10.194.178.201 with SMTP id da9mr87570124wjc.139.1438266718570; 
	Thu, 30 Jul 2015 07:31:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id fs8sm2186460wjb.7.2015.07.30.07.31.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:31:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:32:13 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730143213.GF2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<e5437695391e1dd4fe0ecad10dec483cb0e3a8bc.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e5437695391e1dd4fe0ecad10dec483cb0e3a8bc.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/26] lsb: set PV to 1.4 to match upstream tarball version
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
X-List-Received-Date: Thu, 30 Jul 2015 14:31:59 -0000
X-Groupsio-MsgNum: 68736
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:38PM +0300, Alexander Kanavin wrote:
> This allows upstream version check to work
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-extended/lsb/lsb_4.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended=
/lsb/lsb_4.1.bb
> index 6215b62..171a6c8 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/lsb/lsb_rele=
ase/1.4/lsb-release-1.4.tar
>             file://lsb_pidofproc \
>             file://lsb_start_daemon \
>             "
> +PV =3D "1.4"

And isn't it confusing to say 4.1 in recipe name and 1.4 inside of the
recipe?

> =20
>  SRC_URI[md5sum] =3D "30537ef5a01e0ca94b7b8eb6a36bb1e4"
>  SRC_URI[sha256sum] =3D "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195=
806e4457fdf17172"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NWwACgkQN1Ujt2V2gBwmvgCePa4/IO5oHrbK7INyh3DfNASw
i74AmwU1aEO8KxaHQHk498lbT8ASQ+Yi
=0ROm
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
