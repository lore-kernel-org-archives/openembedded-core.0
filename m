Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1612C6E64A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:27:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so1023417wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 16:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xq9XJNLNTZNjiEVwBCVxurYi4jMcUFcknpBTET3TinE=;
	b=ylqAGDOOiWQkX1ZJKfLnIuBvnZk9AsHNmdYW8xGwnKz70XBDVUe1yylrKZLvjrIkGA
	jeVro3v4UqmKsgqkePyEd+1Mcf/H+LXEhdxKMPCXmsWYuJNqyFWwAY7g06COokOr/ewl
	tbzeCp5V6UaUgYcsgjrT8uVBgyoHZr1cU5xlF6vBowscnwq1HS4TribSpffEVbQtL8Us
	n5ds5QOaFBSL05ubM85EvJm0Pgj2Mx2ahOPogNSX0/rmKx0Mm4TXyTpzQbYkM8GCFZx9
	0kaDXghTuprs0oR+mmvM7ZTnJ1Nx1VHVxegVbspC63ATG9hsDCR/JnNE1npE58NoIiKY
	SMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xq9XJNLNTZNjiEVwBCVxurYi4jMcUFcknpBTET3TinE=;
	b=WQf8FdOUA9YUaju/0M1fss23yclGAOU63RgRG+TFh/026Ls/P6SVhjzdoOzQSrfKbD
	c1ai2/20ZjDJG+3s8tAKyLIDwAH/5dAMmuUaaKxmGGaIyzv0Z0u7AiAjW73HjDZRGxHr
	5Azu72US9jqcgtrsd+X6r+4KomAlfh26o7CU3CeZHU3Cia2Qe23SZE0g6SP6DZ33m0ep
	4seoRFSd44+7RNKj94oUQcCPyqDxyru9ujGp8CTMlRypQJM1YyGOlm6l+j8IEpFeOYFB
	Mn2T+3V8vNwiU4906p92o+DMzTcfoJ3QPRHS3Ids2NZD0sNtGAmmh/p9WkxGAvtSc9G7
	RudQ==
X-Gm-Message-State: AD7BkJLjpFVvZ84wAnlACKE3YrCggiYztXdlb7IIs05/ESGPI28NCiNrhro6otGFt4xp2w==
X-Received: by 10.28.238.210 with SMTP id j79mr475210wmi.23.1457569671213;
	Wed, 09 Mar 2016 16:27:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id hm9sm902845wjb.34.2016.03.09.16.27.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 16:27:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 01:30:43 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160310003043.GQ2542@jama>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<c9d3e96135173503ef0e3730cc80c993b5bf951e.1457535622.git.alexander.kanavin@linux.intel.com>
	<56E0B734.4000607@opendreambox.org> <20160310000955.GP2542@jama>
	<1457568909.2804.209.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1457568909.2804.209.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/24] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Thu, 10 Mar 2016 00:27:53 -0000
X-Groupsio-MsgNum: 79361
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MdJ3p2aQbVp3YFXz"
Content-Disposition: inline

--MdJ3p2aQbVp3YFXz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 12:15:09AM +0000, Richard Purdie wrote:
> On Thu, 2016-03-10 at 01:09 +0100, Martin Jansa wrote:
> > On Thu, Mar 10, 2016 at 12:52:20AM +0100, Andreas Oberritter wrote:
> > > Hello Alexander,
> > >=20
> > > On 09.03.2016 16:01, Alexander Kanavin wrote:
> > > > Signed-off-by: Alexander Kanavin <
> > > > alexander.kanavin@linux.intel.com>
> > > > ---
> > > >  meta/classes/gobject-introspection.bbclass | 39
> > > > ++++++++++++++++++++++++++++++
> > > >  1 file changed, 39 insertions(+)
> > > >  create mode 100644 meta/classes/gobject-introspection.bbclass
> > > >=20
> > > > diff --git a/meta/classes/gobject-introspection.bbclass
> > > > b/meta/classes/gobject-introspection.bbclass
> > > > new file mode 100644
> > > > index 0000000..ef51629
> > > > --- /dev/null
> > > > +++ b/meta/classes/gobject-introspection.bbclass
> > > > @@ -0,0 +1,39 @@
> > > > +# Inherit this class in recipes to enable building their
> > > > introspection files
> > > > +
> > > > +# This allows disabling introspection support in recipes
> > > > +# (and therefore avoiding the use of qemu)
> > > > +# if gobject-introspection-data is omitted from DISTRO_FEATURES
> > > > and MACHINE_FEATURES.
> > > > +EXTRA_OECONF_prepend =3D "${@bb.utils.contains('COMBINED_FEATURES'
> > > > , 'gobject-introspection-data', '--enable-introspection', '-
> > > > -disable-introspection', d)} "
> > >=20
> > > testing only DISTRO_FEATURES would be better. If MACHINE_FEATURES
]> > > gets
> > > tested, even though indirectly, I'd expect every recipe inheriting
> > > this
> > > class to switch to MACHINE_ARCH implicitly.
> >=20
> > I think the idea was to prevent using qemu for MACHINEs without
> > support
> > in qemu. But I fully agree that causing all recipes which inherit
> > this
> > bbclass effectively MACHINE_ARCH is even worse.
> >=20
> > DISTRO needs to make sure that all supported MACHINEs have support in
> > qemu or disable introspection for all of them.
>=20
> Remember that bitbake has special knowledge of bb.utils.contains() and
> is clever enough to make the checksums depend on "gobject-introspection
> -data" being present or not and not the actual complete value.

But then the same TUNE_PKGARCH package created for 2 MACHINEs where one
has gobject-introspection-data in MACHINE_FEATURES and the second has
not, will still use different EXTRA_OECONF value.

So it will be overwriting the same package in same architecture with and
without introspection enabled, because on which MACHINE was built last.
Which is even worse than admitting that this is fscked combination and
turning such recipe and all depending on it to MACHINE_ARCH so that it
at leasts keeps the introspection enabled or disabled consistently.

On the other hand we can expect that if the DEFAULTTUNE has support in
qemu for MACHINE1, then MACHINE2 should be supported as well and this
combination is probably just overlook when setting MACHINE_FEATURES.

> So we can get the best of both worlds here, you can disable g-i on a
> per machine basis yet still enable at the distro level. Recipes don't
> become machine specific.
>=20
> Cheers,
>=20
> Richard
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MdJ3p2aQbVp3YFXz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgwDIACgkQN1Ujt2V2gBy5FACggYAkiARzc276uuDu2l+u3Utu
YKcAnRSgEzajebhs+S7cI0DCtgJNWnM0
=zIGI
-----END PGP SIGNATURE-----

--MdJ3p2aQbVp3YFXz--
