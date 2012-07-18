Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrIsI-0007Kq-Fa
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 03:16:22 +0200
Received: by weyr6 with SMTP id r6so607495wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Gk9v2R0woIeWpaaHHA5AQLUTEbN3iMQFX/F0gPy7Pdk=;
	b=BEU9V7VMJXShi1KNGkc1QjHv6eWaOZfor8mAOCGMURnT27qi/8LDM+sOGPMx5igcP2
	MSSQN0Kg1BrNigEtBv6xB/+ugmZ0nKsGFXm3a67fsMPCyuDQNk5ZaUea2g3GlesNvdT1
	ATj/l2lXM/SVDe6d7Kw6F7Vdy/lpuhgg3tXssj04UR5b9hHVbX2n/Ik5qzgxfX/D+2TV
	YKalqDFBBZw1u7Enw1BILhBWZ4m7jYbNxds8kgOEx1PJI8D2F60JSu6+ADd5YeEoodTr
	vpk4DJvECGS3XbKpO8366l/LHROb4LFCe/peJdJIgxBzMF7RXwJZVBdz4R3K4Ox0vI1Z
	lK3Q==
Received: by 10.216.220.82 with SMTP id n60mr594426wep.48.1342573502560;
	Tue, 17 Jul 2012 18:05:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm29852456wib.2.2012.07.17.18.05.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 18:05:01 -0700 (PDT)
Date: Wed, 18 Jul 2012 03:05:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Colin Walters <walters@verbum.org>
Message-ID: <20120718010511.GH22569@jama.jama.net>
References: <5005DFF1.3050304@linux.intel.com>
	<500602C8.6090805@linux.intel.com>
	<20120718003850.GF22569@jama.jama.net>
	<20120718005221.GG22569@jama.jama.net>
	<1342573300.2860.16.camel@lenny>
MIME-Version: 1.0
In-Reply-To: <1342573300.2860.16.camel@lenny>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"yocto-builds@yoctoproject.org" <yocto-builds@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: Glib-2.0 cross-compile issue Was: Master Failures
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
X-List-Received-Date: Wed, 18 Jul 2012 01:16:22 -0000
X-Groupsio-MsgNum: 25580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tSiBuZsJmMXpnp7T"
Content-Disposition: inline

--tSiBuZsJmMXpnp7T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2012 at 09:01:40PM -0400, Colin Walters wrote:
> On Wed, 2012-07-18 at 02:52 +0200, Martin Jansa wrote:
>=20
> > It's probably caused by this
> > http://permalink.gmane.org/gmane.comp.gnome.svn/604029
> >=20
> > which isn't very cross-compile friendly.. maybe we can just add patch
> > reverting this change in 2.32.4?
>=20
> I don't think it's a good idea to look at this module by module.  A
> *lot* of code out there uses AM_PATH_PYTHON, and then does something
> with the resulting value of @PYTHON@.  We should figure out the correct
> thing to do that fixes all of:
>=20
> 0) "Normal" self-hosting build where /usr/bin/python =3D python2, and
>    we can use both /usr/bin/env python or /usr/bin/python
> 1) OE-core cross compilation
> 2) Ubuntu's situation of /usr/bin/python =3D python 3, and we want
>    to use /usr/bin/python2
>=20
> Reverting the patch is going to break 2).

But we can apply it only for target recipe where we don't expect 2)
yet..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tSiBuZsJmMXpnp7T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAGC8cACgkQN1Ujt2V2gBxhgwCbBQNEDi7Q+au4rUbsTrKiwxJb
SmQAoIHDYimGZEg3gTCDMO5NAUYtdkUo
=UPrt
-----END PGP SIGNATURE-----

--tSiBuZsJmMXpnp7T--
