Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJpCN-0007zt-FW
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 19:26:59 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so571917wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cDQ5WUEcLEtBKkHS1U82SsyP1yBNWxdYj7287vh3xI4=;
	b=bcfGEsBsSmXhm3/JgrM27DEIyt2jG3LK9mkDAdDIIWc7r1Ew0C5KD+EO6IxlnLBEmt
	Iw+1gCCypzuoJyusyoy/lueOPkr7SbiZ928dLBwriXAdpUbdrFhChFWQ0399LCavzwXW
	/bTivSIX0XqOUjh2pXB//wlp7nkQNpREQfqdnc3mgqC592tSoMJsaj3jQF9C+8w9LGZU
	q7feS1s0FB3vKroRqdgjxfpmJisUrIoWHcTFnI1nQ9C2BVVasR2XHdzpB57gO2VC+R6X
	EClB8Jo0E/ijMfOd89k5Q8UKbMcyZi2uJPi8GgBBCnzo9u+iSMhh+7r0qzxQyh4Wg1ln
	p64A==
Received: by 10.180.91.71 with SMTP id cc7mr14409669wib.2.1349370838308;
	Thu, 04 Oct 2012 10:13:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv8sm37735320wib.0.2012.10.04.10.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 10:13:56 -0700 (PDT)
Date: Thu, 4 Oct 2012 19:13:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20121004171359.GF3005@jama.jama.net>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
	<95933d4d0d8226614433d225f106dd3b8aedb3df.1349356755.git.Martin.Jansa@gmail.com>
	<CAMKF1sr=OnrzMec_NnM8OCr_vt1LZBTnUimWCcpJSHMrTUhxPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr=OnrzMec_NnM8OCr_vt1LZBTnUimWCcpJSHMrTUhxPw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] tune-xscale: replace TUNE_CCARGS for webkit-gtk and cairo only with xscale in TUNE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 17:26:59 -0000
X-Groupsio-MsgNum: 30386
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Content-Disposition: inline

--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 04, 2012 at 09:55:01AM -0700, Khem Raj wrote:
> On Thu, Oct 4, 2012 at 6:23 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >
> > -TUNE_CCARGS_pn-webkit-gtk =3D "-march=3Darmv4t"
> > -TUNE_CCARGS_pn-cairo =3D "-march=3Darmv4t"
> > +TUNE_CCARGS_pn-webkit-gtk =3D "${@bb.utils.contains("TUNE_FEATURES", "=
xscale", "-march=3Darmv4t", "", d)}"
> > +TUNE_CCARGS_pn-cairo =3D "${@bb.utils.contains("TUNE_FEATURES", "xscal=
e", "-march=3Darmv4t", "", d)}"
>=20
> I would rather try to remove this option completely if possible. I
> wonder if we still need to target armv4t when building on xscale
> may be the reason it was added is no more relevant ?

I think the same (as written in commit message). Now it won't be used by
default at least (only if someone asks for DEFAULTTUNE xscale for
webkit-gtk or cairo).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBtw9cACgkQN1Ujt2V2gBwPoACdE+SrmMD5PPmwxsDHrZQG0H4M
T7AAnAvVw2TufSUvWZCMLsCaUFt5OELv
=H9e0
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
