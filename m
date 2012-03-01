Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S3ApY-0001eX-6E
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 19:34:20 +0100
Received: by eekc1 with SMTP id c1so288001eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 10:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.94.134 as permitted sender) client-ip=10.14.94.134; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.94.134 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.94.134])
	by 10.14.94.134 with SMTP id n6mr3709541eef.63.1330626350311 (num_hops
	= 1); Thu, 01 Mar 2012 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mR+ukKiCcclNI+zR0WAM5YGNG9tdIh7pRgk9JhQM7r4=;
	b=kyzeCtwbDkQkiwZc63rYmaah1cwCtaqmKM/ROd1mYZ7WpTXcDHuCkfgkgYPHQuMYXL
	AkuLYNVARIwpK8L9J/J0ICexwWALCBUcN/OBKvzhmwadQyOGFzqu/kjwzOAUOHvJ9+Am
	OVrSE21903halWzaUpb0mnA/X91KC4LhKmQMU=
Received: by 10.14.94.134 with SMTP id n6mr2835153eef.63.1330626350222;
	Thu, 01 Mar 2012 10:25:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm10051787eem.0.2012.03.01.10.25.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 10:25:49 -0800 (PST)
Date: Thu, 1 Mar 2012 19:25:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120301182546.GK3831@jama.jama.net>
References: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
	<f88bff815fdeb404bb9a51efbf1b03862ef6dda0.1330242184.git.Martin.Jansa@gmail.com>
	<4F4F4011.2080303@gmail.com> <20120301094052.GB3831@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120301094052.GB3831@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2 2/5] bitbake.conf: remove TARGET_ARCH from in SDKPATH
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
X-List-Received-Date: Thu, 01 Mar 2012 18:34:20 -0000
X-Groupsio-MsgNum: 18279
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgLLobvf7eP6VP5c"
Content-Disposition: inline

--bgLLobvf7eP6VP5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 01, 2012 at 10:40:52AM +0100, Martin Jansa wrote:
> On Thu, Mar 01, 2012 at 01:23:29AM -0800, Khem Raj wrote:
> > On 02/25/2012 11:49 PM, Martin Jansa wrote:
> > > +SDK_NAME_PREFIX =3D "oecore"
> >=20
> > should this be weak assignment
>=20
> Yeah, probably could be (I'm not overwritting this from my distro conf
> so I haven't tried), but SDK_NAME assignment also wasn't weak and distros
> were overwritting it.
>=20
> Someone with custom SDK_NAME(_PREFIX) please try and send patch.

And we should change TARGET_ARCH in SDK_NAME to
PACKAGE_ARCH or TUNE_PKGARCH

because meta-toolchain-gmae for armv7a ends in
oecore-i686-arm-toolchain-gmae-20120229.tar.bz2
and for armv4t with similar name (I was lucky that it took more then day to
build)
oecore-i686-arm-toolchain-gmae-20120301.tar.bz2

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bgLLobvf7eP6VP5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9PvyoACgkQN1Ujt2V2gBwKvQCfeyxnsY8sGYT3k0YTqOnrEC5i
2xsAn2iB7Z3OtpWxUDQ1EApXq0uzPxsa
=8GJ9
-----END PGP SIGNATURE-----

--bgLLobvf7eP6VP5c--
