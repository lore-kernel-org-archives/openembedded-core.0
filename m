Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f52.google.com (unknown [209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADF6605B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 15:06:57 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id gl10so527793lab.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H+6avpR+8pV8xVqCj2YPnqZKu99693LaOhGom9mYh7k=;
	b=VmqNJRtjkaPgRVMV9wSy6d9MZsZZYc4KdXsWqgjz1qpEdxMg2u6nUxPUdQ2MZEN+aY
	cYxyh1o1hwN1v9XZqPNYq/derm9I2OpL7ahqMiriKqv5J5B9E4pzqJRqsuYpGyp1DBLI
	hy2K5C44f2TLYj269wOSCGUuOJfWKeQPgEPS7a3VqaxEwr7wB4tah5HxxrooiKnW6xSQ
	EtQRXgD0M/XdUnnaMJUmvQdi3AUPrANUwN/UrDrd+3BvH0RSwort6cYzjhLqNxrE9efq
	p0HGlVU2V1YqUJuOYnLU7z0ywTNzo9ogLiFp8vMkZ8clA0+NeKwG+6K1Hym6BC69QhET
	ojmg==
X-Received: by 10.112.218.99 with SMTP id pf3mr11629792lbc.5.1399648018318;
	Fri, 09 May 2014 08:06:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g6sm1502912laa.10.2014.05.09.08.06.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 08:06:57 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 May 2014 17:07:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140509150721.GA22774@jama>
References: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
	<CAJTo0LYCdUJMPN8+pZWXrvsRc9fyiq7gm2dOh0N3gRcqWFP1CA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYCdUJMPN8+pZWXrvsRc9fyiq7gm2dOh0N3gRcqWFP1CA@mail.gmail.com>
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
X-List-Received-Date: Fri, 09 May 2014 15:07:00 -0000
X-Groupsio-MsgNum: 53028
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 03:42:37PM +0100, Burton, Ross wrote:
> On 9 May 2014 15:31, Tim Orling <ticotimo@gmail.com> wrote:
> > +DEPENDS +=3D "wayland virtual/egl pango lcms libpoppler-glib"
>=20
> For a start libpoppler isn't in oe-core, so this causes a build
> failure for everyone not using meta-oe.
>=20
> These are for the basic test applications: I'd prefer to see a patch
> that either forcibly disabled the checks or added configure options so
> the dependencies can be controlled.

FWIW: I've sent WIP patch a while ago, but never finished it
http://patchwork.openembedded.org/patch/57011/

IIRC it doesn't apply to current version now.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNs7ykACgkQN1Ujt2V2gByb3QCbBHBnvHJ7+y0oObQ2skxeiKYQ
CegAn2XnJ+D7ekWzCd3cEowAU8PMNb4V
=cH5V
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
