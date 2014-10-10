Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 263366AC7B;
	Fri, 10 Oct 2014 12:46:04 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so3777075wgh.22
	for <multiple recipients>; Fri, 10 Oct 2014 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3PK/FZ5blx2yl3WHzLe7TOG7SgmadRCIUHq6yDMRP2Y=;
	b=iUu4SAaMKi9QjdV9QVfJOS88sK/ONvfe55dokGkaNtN17H4jINlpWJR6CBQolRPD8W
	Kv3RBpZDetf3x6BLkbOlGQwd3R3oZCFRjpLK52cHyFFGdSA9Abp1HhxjuJAAGnngmB9A
	4bcKrg682nMxDz6h38dxAq7FbXJo6n/f2H8IkpS91Tm3GCt5s5Ctz1oo8JYEjYvYDJMv
	c0kV4+BCYhM5tlt28O1jMthY4ZQpcjDuGtJizrnmTbnRRSZoO6xy64N8pS3d6ppQawCH
	XdP77KksBpJbmb4gK84hDDHtEahBEvPkSXZ+dN1aUSQjORA0xGd2kXsxD5bxMZJThyOv
	KUJw==
X-Received: by 10.180.19.1 with SMTP id a1mr4693440wie.5.1412945163956;
	Fri, 10 Oct 2014 05:46:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ll20sm2533054wic.14.2014.10.10.05.46.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 05:46:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Oct 2014 14:47:09 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20141010124709.GN12322@jama>
References: <20141010103438.GI12322@jama>
	<CALbNGRTymU+trfTQGPiOi27cauA6T1nrKT+Npbhn4HTyVZj2NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTymU+trfTQGPiOi27cauA6T1nrKT+Npbhn4HTyVZj2NQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2014-10-10, QA issues
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
X-List-Received-Date: Fri, 10 Oct 2014 12:46:07 -0000
X-Groupsio-MsgNum: 58503
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rzq/nSLlHy1djmXS"
Content-Disposition: inline

--Rzq/nSLlHy1djmXS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2014 at 01:06:32PM +0200, Andreas M=FCller wrote:
> On Fri, Oct 10, 2014 at 12:34 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > lxdm-0.5.0+gitAUTOINC+07fb151a99: lxdm requires /bin/bash, but no
> > providers in its RDEPENDS [file-rdeps]
> >
>=20
> This is a false positive: I added bash to RDEPENDS in the last patch. Nee=
ds
> further investigation...

It's possible that your last patch wasn't yet included in this build.

The second question about QA warnings:

The world builds are using default set (distro-less config), you can
add/remove them by setting ERROR_QA, WARN_QA variables.

They are shown only when the recipe build isn't reused from sstate,
that's why I've included qa.log files from last 2 builds (the previous
one had some change which invalidated a lot of sstate).

The build-deps QA are even harder to reproduce, because you need to
build whatever was causing that floating dependency to be detected in
the sysroot before the build of the recipe with issue (that's why
test-dependencies builds first build "bitbake world" to populate
sysroot with as much as possible).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Rzq/nSLlHy1djmXS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ31U0ACgkQN1Ujt2V2gByKrACeKHDXLyiv1BEhfVT8KDEApxqQ
adEAoIZpL9bplyGN83N84RzkQdjrxU0+
=MNGR
-----END PGP SIGNATURE-----

--Rzq/nSLlHy1djmXS--
