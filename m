Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THrbg-0006uj-Dz
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 09:37:00 +0200
Received: by wgbdq11 with SMTP id dq11so2038356wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 00:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GJ3kaVLZSAkXMdLtKv+wak5B5GUFXp0vZ4vEdFggAxE=;
	b=Peaz9CZ8t91WfK5z+zZsP8D7amoVF2FjmYRMDUB0AGCMIh5l4vXu3di4R1XRdSa1ya
	iWR5ksI0piQKGCLpPh6VWdELLIj66deoj45A0bu4xFdeKdLPaLEW+4+ba0srtmg1ZCKA
	88lUBQcv0NRBYOwZQvqv/zTKXz+W8dwY9QX4p1PxbEdtJV6OM3cGRkOB/rpSCc7Jzc59
	zjE4Xm+Wj7n2UkAM3PMjxx3acULON7m86cWBqjxAoEWIcmqEos4KpkC5hIRumYL6cl/2
	l47aMPqOh5lS8SvVcZSW428/jZI48vVJK+pIdZq3tGY0YgPiS8uq6IOkph4z+o+EIJ9J
	3vwg==
Received: by 10.216.194.148 with SMTP id m20mr4931047wen.51.1348903446323;
	Sat, 29 Sep 2012 00:24:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm3924598wib.8.2012.09.29.00.23.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Sep 2012 00:23:52 -0700 (PDT)
Date: Sat, 29 Sep 2012 09:24:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20120929072405.GF3049@jama.jama.net>
References: <1347373349.2122.35.camel@ted>
	<1348679272.32611.4.camel@phil-desktop>
	<1348838588.15753.52.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A6B7ED0@039-SN1MPN1-001.039d.mgd.msft.net>
	<1348867217.15753.81.camel@ted>
	<E64B7127595B4AD8AA31B5C8C0FED741@intel.com>
MIME-Version: 1.0
In-Reply-To: <E64B7127595B4AD8AA31B5C8C0FED741@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Phil Blundell <philb@gnu.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
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
X-List-Received-Date: Sat, 29 Sep 2012 07:37:00 -0000
X-Groupsio-MsgNum: 30135
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Content-Disposition: inline

--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2012 at 07:42:48AM +0100, Ross Burton wrote:
> On Friday, 28 September 2012 at 22:20, Richard Purdie wrote:
> > Totally unrelated, likely a transient race we're meant to have fixed but
> > don't seem to have done so :/
> >=20
> > The supposed fix was:
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Da92ff3ad4212f896=
6bbd3f6defcb112737d81cda
>=20
> FWIW, I saw this yesterday too. :/

me too, few times over last week.

Removing WORKDIR completely before running -c cleansstate as work
around..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qftxBdZWiueWNAVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBmohUACgkQN1Ujt2V2gBySBwCbBsWQrEIqW4ISroU5c9EVuEaY
nnsAoIMylfsA+dz44g90ppG3s7AKvSKi
=RW0A
-----END PGP SIGNATURE-----

--qftxBdZWiueWNAVY--
