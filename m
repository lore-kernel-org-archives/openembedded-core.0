Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S32da-0005Su-78
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 10:49:28 +0100
Received: by eaae1 with SMTP id e1so89188eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 01:40:54 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.127.76 as permitted sender) client-ip=10.14.127.76; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.127.76 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.127.76])
	by 10.14.127.76 with SMTP id c52mr2668625eei.37.1330594854791 (num_hops
	= 1); Thu, 01 Mar 2012 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Lj9QIOWCACbZeRX2GOXzaL8/SaV8EprrhdFmy+y9N2w=;
	b=rJ63sLvHNJePXENvzJ4uomXIr+Ae4V73Nidk4mFXeh6UqcuF6LMz5xlNCTj8qt5O4M
	3G52C880llXFbelCfl4pIq1IkBVOpkWiaK89YHVITwOiA7TC6+qz3EFigOgTL6j6HZle
	Wge41KAS9PBg95TRwEIuAXtW62/2+hYNhxEe8=
Received: by 10.14.127.76 with SMTP id c52mr2055461eei.37.1330594854722;
	Thu, 01 Mar 2012 01:40:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm5352777eeb.4.2012.03.01.01.40.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 01:40:53 -0800 (PST)
Date: Thu, 1 Mar 2012 10:40:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120301094052.GB3831@jama.jama.net>
References: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
	<f88bff815fdeb404bb9a51efbf1b03862ef6dda0.1330242184.git.Martin.Jansa@gmail.com>
	<4F4F4011.2080303@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4F4F4011.2080303@gmail.com>
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
X-List-Received-Date: Thu, 01 Mar 2012 09:49:28 -0000
X-Groupsio-MsgNum: 18245
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 01, 2012 at 01:23:29AM -0800, Khem Raj wrote:
> On 02/25/2012 11:49 PM, Martin Jansa wrote:
> > +SDK_NAME_PREFIX =3D "oecore"
>=20
> should this be weak assignment

Yeah, probably could be (I'm not overwritting this from my distro conf
so I haven't tried), but SDK_NAME assignment also wasn't weak and distros
were overwritting it.

Someone with custom SDK_NAME(_PREFIX) please try and send patch.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9PRCQACgkQN1Ujt2V2gBwbhQCgl4q8kWQKgWnujD15+syeHLXy
wHUAn3D8nJvLWsRggHFSCAhrtNVD+DHu
=O93v
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
