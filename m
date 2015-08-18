Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED4360043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 07:54:06 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so100449791wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nOP+8xJ3qazOrVBFWxdj1KkJxx5qH6mWz2zPu84gsAg=;
	b=L9us4juHYVqKQ/RT0dx2dWr5xln8o9MWI3+T+AHrcChqzMiFUhY9miRXn7fPhw4SUK
	/6HgkSBYT/sekXoaNr2Qse5iTrM1BaPjuFWgtFW4zqrowuzWIUbFAegSRwSHCmTwsBQp
	dCgr/fChe/S3Y4hA+gcWcks7HBszSePtu0LC50jICYaId7VV0zJmrmJ14c+H4O9H+lZu
	HpoYuWuBIp5NMNHX3lsx0spRdXkakUXW7Ko23lJKD/sZv1g3053xTjROWZ1PH4UfUfgD
	u9mGV5tKrG83vdOENa1SPHsVlHIKKZhTpu9ChvO8YZueuFP8/G+DRoJSmyxSNRHOFnpR
	QXiQ==
X-Received: by 10.180.73.13 with SMTP id h13mr40150164wiv.79.1439884446467;
	Tue, 18 Aug 2015 00:54:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c7sm25280215wjb.19.2015.08.18.00.54.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 00:54:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 09:54:09 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150818075409.GA2458@jama>
References: <CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <55C4A405.6050209@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Tue, 18 Aug 2015 07:54:08 -0000
X-Groupsio-MsgNum: 69551
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2015 at 03:26:45PM +0300, Alexander Kanavin wrote:
> On 08/07/2015 12:17 PM, Philip Balister wrote:
>=20
> > Thanks Khem. I also do not agree that we lack a self-sustaining
> > community. OpenEmbedded has functioned independently for far longer than
> > the Yocto Project has existed.
>=20
> By 'self-sustaining' I mean 'being able to continuously produce quality=
=20
> work'. Looking at layers in meta-openembedded, not all of them are of=20
> high quality. Meta-gnome in particular is badly out of date, because no=
=20
> one wants to maintain it properly. If oe-core starts taking a lot more=20
> volunteer contributions, and the same thing happens (a volunteer=20
> contributes a large set of recipes, then disappears), what is supposed=20
> to happen then?

Having latest version of all recipes is good thing, but it's not the
best quality indicator.

In meta-oe and oe-classic package upgrades were usually done by people
who were actively using those recipes and only when the new version
introduced something they really needed or wanted. Still it was causing
new issues, because nobody can test every combination how something can
be used.

Now we see a lot of upgrades in oe-core which are done by people just
because "package upgrade report" says it's possible and the upgrade is
tested mostly by autobuilder (which doesn't exersize any "extra" layers
and runtime-test coverage is very low) - so in the end many of these
"good to have" upgrades are breaking some other components which aren't
upgraded so often or breaking/changing runtime behavior and only couple
months later someone who is actually using them will report that.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXS5KAACgkQN1Ujt2V2gBzdQQCgtwY4KU4x8fl1BTt7ONJTeHEt
HvAAnjl685o6hRgv0v05VT/Bu5ls2tS1
=bhpO
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
