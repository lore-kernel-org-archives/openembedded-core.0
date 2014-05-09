Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f173.google.com (unknown [209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6557A60D8B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 22:28:51 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id pa12so6049623veb.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 15:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m2081uOtORy8YS4IYMYaaI+lrrOXzHYrbD35x8NOUcM=;
	b=crYKBDUaOrgib+/E8bZgpTKUR7PoxsjsRYdJ5E7ZgDN1UQOnY6r4Y3qMX+FWpJvseZ
	ch7qnjymatNmzC2+qCHrRfh27/wER9JjlCXOBG8VlPerdV+U/gNBngp4q+ooVEoVjmMR
	vGHCtXQdBRSnAV1mnX43Ttr1F6AANdho7nswtKdqTGINxYCwolYTLpoUrPGjM7IDh90h
	QgystfROrO43v/xzbDQQwMghG0z9rlamBCeVke8Cvj3FQT+NKzZTZLD5GWdDNDQeBwR0
	d9ZR4NucpmbZfcM67RTnW5rcj1bQ9Mev24AJXECA4YsfZSzrizJ2qw6rUbN8fRhoahiF
	o3KQ==
X-Received: by 10.221.20.199 with SMTP id qp7mr10203490vcb.24.1399674532858;
	Fri, 09 May 2014 15:28:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	un13sm9072791vdb.10.2014.05.09.15.28.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 15:28:52 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 10 May 2014 00:29:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140509222915.GC22774@jama>
References: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
	<CAJTo0LYCdUJMPN8+pZWXrvsRc9fyiq7gm2dOh0N3gRcqWFP1CA@mail.gmail.com>
	<20140509150721.GA22774@jama>
	<CAJTo0LYAv1e0ko7jK6mm9Uz1Hsqvd7rq8dYshogVAE8mCMa=Aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYAv1e0ko7jK6mm9Uz1Hsqvd7rq8dYshogVAE8mCMa=Aw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: add lcms, libpoppler-glib dependenies
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
X-List-Received-Date: Fri, 09 May 2014 22:28:54 -0000
X-Groupsio-MsgNum: 53041
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline

--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 04:18:36PM +0100, Burton, Ross wrote:
> On 9 May 2014 16:07, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> For a start libpoppler isn't in oe-core, so this causes a build
> >> failure for everyone not using meta-oe.
> >>
> >> These are for the basic test applications: I'd prefer to see a patch
> >> that either forcibly disabled the checks or added configure options so
> >> the dependencies can be controlled.
> >
> > FWIW: I've sent WIP patch a while ago, but never finished it
> > http://patchwork.openembedded.org/patch/57011/
> >
> > IIRC it doesn't apply to current version now.
>=20
> If definitely doesn't apply to master: weston doesn't check for
> poppler anymore as the PDF viewer was removed.

Something still links with it as shows in test-dependencies reports:

weston/weston/latest lost dependency on  lcms                              =
                                                                           =
       =20
weston/weston-examples/latest lost dependency on  libpoppler-glib          =
                                                                           =
       =20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNtVrsACgkQN1Ujt2V2gBxZhwCgi85tGrW+vL5myc8c2m7cT448
OZwAoKLzrtq7tns1fW5mCAVYp2W1//jY
=qCZl
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
