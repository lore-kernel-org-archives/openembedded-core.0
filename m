Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGGBl-0001xl-9v
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 22:23:06 +0200
Received: by bkat8 with SMTP id t8so1364975bka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 13:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5RaITlbgvg8cNu5JHNbqPjdcKh6xwkLO0Wb7ifAoIa4=;
	b=Py1iJ3wmvQJXJqP18H0uSFag6kJ5LrV/bxd/OR0cHoLIyvtXGOXT2eGB5EhjsCbPeH
	RgzxYjJR39v+1mL6DR5/ee69yb16QgDQFKeUnPm2Z3VKEpFq/VEGwdCu1zh0msAW0b+x
	sUcPeL/x1c7UPO2xukEqG2fslLkjN2oVOLO6M=
Received: by 10.204.9.214 with SMTP id m22mr2974582bkm.4.1318969034745;
	Tue, 18 Oct 2011 13:17:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm3457629bka.0.2011.10.18.13.17.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 13:17:13 -0700 (PDT)
Date: Tue, 18 Oct 2011 22:17:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111018201708.GC556@jama.jama.net>
References: <20111018183520.GB556@jama.jama.net>
	<CAMKF1spkExdtaVSXxhVShSXR-UQUx-JML34tCPa6KaaUQb-2Rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spkExdtaVSXxhVShSXR-UQUx-JML34tCPa6KaaUQb-2Rw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Race condition or something when fetching local files?
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
X-List-Received-Date: Tue, 18 Oct 2011 20:23:06 -0000
X-Groupsio-MsgNum: 11175
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline

--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 01:09:43PM -0700, Khem Raj wrote:
> On Tue, Oct 18, 2011 at 11:35 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > I have noticed that even local patches are stored in downloads dir,
> > but today I've noticed that wrong file was used later in do_patch.
> > I have latest oe-core/meta-oe + latest bitbake.
> >
> > Pulseaudio was building here for first time
> >
> > downloads/buildfix.patch is from previous build of xf86-video-intel-2.1=
6.0
> > $ head downloads/buildfix.patch
>=20
> looking in bitbake lib/bb/fetch2/local.py it seems it searches DL_DIR
> before other

Which would be wrong for sure if I have
foo_1.0.bb with SRC_URI =3D "file://bar.patch"

foo-1.0/om-gta02/bar.patch
foo-1.0/nokia900/bar.patch

Then I don't want to use bar.patch from downloads/bar.patch where it's
=66rom om-gta02 build when I'm building nokia900 now.

Regards,

> search paths. cleansstate might not have information that the patch
> was downloaded
> and not applied from local metadata after the recipe is updated.


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6d3sQACgkQN1Ujt2V2gByi5wCfTImt3wmax8Md7eiulU5ODy2T
At4An0PqJrZK+FKUmz4ivMfVrTg+CQ7L
=fkjL
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
