Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 193606E89A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 21:15:21 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so38942eek.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=In2o6bo9q4sh9nH9jGUDWtOYSQaSJRBsyl577Dsc7mE=;
	b=MteBp0foJH4EXytzguU/ZbvDdDtoLjKzsV+OJYllrW0Z2QaJ1jQc82/i4IGI7urwQ7
	y1w4Ks1vVelyKiqL2YAoERsubumUI9rZ2XzDpwHiHxcdD8br8/5+bHagkEXY4kNlvBXB
	BtM79UTMpvSXCcXXRNKt/PwcpAWyXvlnxQNkE3vp69dmsbslAyAvu8R63hD1gc7RNunI
	yvh6JAkfnDGvon71Yls9RNfW5GDdYoN7bSj0L7DqIZCav33QXA8ppTiPq7+YNhxaiYn3
	tFHKX3fUvyBLTZc0sswhKcgtH0svTvx9lmRClsmczPyYkDIqADkJqmKb8Qa8ZnE/qIyt
	3hdw==
X-Received: by 10.14.182.5 with SMTP id n5mr5998621eem.68.1394658922200;
	Wed, 12 Mar 2014 14:15:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id s46sm404275ees.3.2014.03.12.14.15.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 14:15:20 -0700 (PDT)
Date: Wed, 12 Mar 2014 22:15:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Message-ID: <20140312211534.GB3759@jama>
References: <20140312125812.76E1A5039B@opal>
MIME-Version: 1.0
In-Reply-To: <20140312125812.76E1A5039B@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [oe-commits] Ross Burton : gnomebase: remove trailing whitespace
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
X-List-Received-Date: Wed, 12 Mar 2014 21:15:24 -0000
X-Groupsio-MsgNum: 51172
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline

--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2014 at 12:58:12PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 0c404fa1a0372c56f700eb93900abd83175199ef
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D0c404fa1a0372c56f700eb93900abd83175199ef
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Wed Mar 12 10:36:08 2014 +0000
>=20
> gnomebase: remove trailing whitespace
>=20
> It seems that the bitbake parser is incredibly forgiving of trailing whit=
espace
> in multi-line variables, but delete it to be sure.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/gnomebase.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbcl=
ass
> index b299500..739bf60 100644
> --- a/meta/classes/gnomebase.bbclass
> +++ b/meta/classes/gnomebase.bbclass
> @@ -10,7 +10,7 @@ DEPENDS +=3D "gnome-common-native"
> =20
>  FILES_${PN} +=3D "${datadir}/application-registry  \
>  	${datadir}/mime-info \
> -	${datadir}/mime/packages \=09
> +	${datadir}/mime/packages \
>  	${datadir}/mime/application \
>  	${datadir}/gnome-2.0 \
>  	${datadir}/polkit* \

Can you also please fix it to use spaces instead of tabs here?

>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMgznYACgkQN1Ujt2V2gBwMJQCfS1sI1QCuDuQE0mHU7T5mlL23
wsgAoIy1rH2ld2JR18xIAH2UQ+I16Cnw
=/6Vu
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
