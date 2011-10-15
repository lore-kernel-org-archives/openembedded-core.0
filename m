Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF5Pi-0003zT-1l
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 16:40:38 +0200
Received: by bkat8 with SMTP id t8so3319156bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9WJewBsxYd404mypeeIcvkST4NND1LKWyTSbZRavDsg=;
	b=aitTqamMvgi/rBbMAynj6Kr+EFV+DQ60AcmKnkVn81llj5Xka9nT/f+7r3t8ngVfJP
	9EgdLS+E0LH9PzpPEgA307h6zcq9IZNUVTByhfs+QEhtPXyJzu8Y/yOqq3akNCgkDCTQ
	HIHtmyLrDf4C+A+0Ui+w7+tW+QAMaVNGYUSp4=
Received: by 10.223.76.201 with SMTP id d9mr6164753fak.12.1318689291657;
	Sat, 15 Oct 2011 07:34:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m26sm10709737fac.6.2011.10.15.07.34.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 07:34:50 -0700 (PDT)
Date: Sat, 15 Oct 2011 16:34:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111015143444.GD12684@jama.jama.net>
References: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
	<1318674260-8320-2-git-send-email-Martin.Jansa@gmail.com>
	<1318689013.3158.7.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1318689013.3158.7.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Sat, 15 Oct 2011 14:40:38 -0000
X-Groupsio-MsgNum: 11075
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Content-Disposition: inline

--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2011 at 03:30:13PM +0100, Phil Blundell wrote:
> On Sat, 2011-10-15 at 12:24 +0200, Martin Jansa wrote:
> > * this way we can use
> >   EXTRA_DRIMODULES_armv4t +=3D ",glamo" in meta-openmoko layer and
> >   EXTRA_DRIMODULES_armv4t +=3D ",foo" in meta-bar layer without knowled=
ge
> >   of other modules in other layers in stack
>=20
> Is this really better than using "DRIMODULES_append_armv4t =3D ..."? =20

the point is that you don't need to know who is setting swrast there for
armv4t...

>=20
> It's not really true that you can do it without any knowledge of what
> other layers are doing since if you end up with two competing
> EXTRA_DRIMODULES_foo overrides then one of them will get lost.
>=20

so EXTRA_DRIMODULES_append_armv4t should be fine, right?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6ZmgQACgkQN1Ujt2V2gByYXQCfXS5lhUlbg2Dr0qxxZYoEpDs7
ANkAni6/92BwLgL9WtKE1ogy8k7sFidJ
=1Cj4
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--
