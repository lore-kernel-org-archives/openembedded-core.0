Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDLxI-0008Vc-FB
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 22:28:24 +0200
Received: by wera1 with SMTP id a1so1285937wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PmOEue6Z1NTAmwUh9PEfLsgm/vl/s3MWe4MjMeePoRI=;
	b=GmqRof4e6gTlUqSFccFZ1P9pa8d797ZNsEict/TRjCRLDcVWfM63GXJFvWwz2Ijx29
	fjB5z+Efx69Pr8LQYXK9UZKfhJHLONri5XtFHsMY3cfJvSUcu6H6/SCAoigetkc6Uhu5
	zFnHiPRlUCDKJa+Ns/YMlIgN64FZdcw8e/1qbTGUiNUXOcc1v3pGd19I/cIE9QiZfkHz
	/hPNsh6Iwc4nkBROhJQrKQP6ashcwshk+Uj0dEMUZgisSC6+Az3lcIFSEGuR0vNvMlgl
	zDrcIBhgDsaAgBoXowvenJTQMuT1JLy5Soufm4ul00zlOu4ad+EZ9ppqC+PSbylejtc8
	Gv5A==
Received: by 10.180.91.165 with SMTP id cf5mr9045707wib.2.1333052360798;
	Thu, 29 Mar 2012 13:19:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm33059095wiw.1.2012.03.29.13.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 13:19:19 -0700 (PDT)
Date: Thu, 29 Mar 2012 22:19:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120329201921.GF25815@jama.jama.net>
References: <CALbNGRTX6A08bv_sc8VKs9Kv7k8UT1fgMOz_yhhVTMK7DKBsjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTX6A08bv_sc8VKs9Kv7k8UT1fgMOz_yhhVTMK7DKBsjQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: DEPENDS not extended to -native for BBCLASSEXTENDS when added by PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 20:28:24 -0000
X-Groupsio-MsgNum: 19982
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline

--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 06:10:46PM +0200, Andreas M=FCller wrote:
> Hi,
>=20
> on my colleagues's build machine ( Ubuntu 11.04 / Angstrom based /
> target overo / pullled all layers yesterday ) image building fails for
> gtk+native with
>=20
> | configure: error: *** libX11 not found. Check 'config.log' for more det=
ails.
>=20
> and in config.log
>=20
> | /usr/bin/ld: cannot find -lXrender

Yes it does fail like this since PACKAGECONFIG was added to gtk+..

> After manually building libxrender-native build continues without issues.
>=20
> Seems this issue is same as mentioned in [1] without result.
>=20
> Martin: how did you fix that on your environment?

by this patchset for oe-core
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019619.ht=
ml
and this for meta-oe
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/038711.h=
tml

both regulary updated in shr branches in oe-core-contrib/meta-oe-contrib

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk90w8kACgkQN1Ujt2V2gBya6QCgg6Tinov/2BmTkgmejxwJbkhZ
WB4An3ewFcARmunUBt9K4BqlZjFx9uNl
=nRxE
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--
