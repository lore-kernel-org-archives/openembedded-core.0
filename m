Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBUgm-0003qA-So
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 19:55:56 +0200
Received: by eekb57 with SMTP id b57so606146eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nyn2M8Z5dzJ1Biq9s+55OFfrliSk1P62C4IujMktbow=;
	b=uno4BVWdNilZIukcA+PmtvbtOvULN8s3W1pFXHNkfejJIvwyg0EDjWm5QncGDQ8lxQ
	V3vdBFs3vvL1rSlcw8DLpdeTujnMpeTYnA6FDO3EIicp7n66FdaMB4dETKNNzJy5zlnk
	raYdIucdywzjiPfDUWoIxRxoz8KeJIpNtJ+7tRQplGRnMnuPgS7BgiqR4ktWk/kFF0nY
	r2bsx3rQLjr7iEMSDRFFezkVZBljHu1Ng2fxALBauFgyqWgjq5oTJMrfZfnaQnBZyZMn
	2L0Dq/+4u9GHz4sI+GCdSxN1wTqP5B2lWW5HJ6gdEQTgv5Gm7UVdlc64wiAwuTbF5mKD
	i2dw==
Received: by 10.204.128.65 with SMTP id j1mr5011047bks.93.1347385405839;
	Tue, 11 Sep 2012 10:43:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c18sm10345424bkv.8.2012.09.11.10.43.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 10:43:24 -0700 (PDT)
Date: Tue, 11 Sep 2012 19:43:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120911174324.GM14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347381972.29443.15.camel@x121e.pbcl.net>
	<20120911165323.GJ14077@jama.jama.net>
	<1347383662.29443.21.camel@x121e.pbcl.net>
	<20120911172107.GK14077@jama.jama.net>
	<20120911173529.GL14077@jama.jama.net>
	<1347385043.29443.28.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1347385043.29443.28.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 17:55:57 -0000
X-Groupsio-MsgNum: 29079
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JvUS8mwutKMHKosv"
Content-Disposition: inline

--JvUS8mwutKMHKosv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 06:37:23PM +0100, Phil Blundell wrote:
> On Tue, 2012-09-11 at 19:35 +0200, Martin Jansa wrote:
> > If this works then DISTRO would have finer control of which DEFAULTTUNE
> > to use
> >=20
> > 1) default: don't use mtune, optimize only for march (don't mix mtune in
> > the same feed).
> >=20
> > 2) include optimized-tune.inc in distro.conf: use mtune only for some p=
ackages, but
> > with separate package feed for them
> >=20
> > 3) DEFAULTTUNE =3D ${OPTDEFAULTTUNE} in distro.conf: always use best mt=
une
> > available for MACHINE, but unlike current default, don't mix them in
> > same package feed
> >=20
> > DEFAULTTUNE =3D ${OPTDEFAULTTUNE} should also be used for PACKAGE_ARCH =
=3D=3D
> > MACHINE_ARCH
>=20
> Yeah, that all sounds fairly reasonable to me.  I'm not sure that
> optimized-tune.inc belongs in oe-core, since its contents is inherently
> distro-specific, but the general plan seems pretty good.

OK, thanks

I've put optimized-tune.inc to oe-core only to share knowledge of which
packages are worth using OPTDEFAULTTUNE, but I expect DISTRO maintainers
to add their own entries too (e.g. for stuff which is only in their own=20
layer), so I'm fine with optimized-tune.inc in meta-distro too.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JvUS8mwutKMHKosv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPeDwACgkQN1Ujt2V2gByZHACfXsuBAiuILZ+JEB5ur1TdXX7a
4dwAniMGwr4NBS6JH6ji/PmbwrzzkmoZ
=gwxc
-----END PGP SIGNATURE-----

--JvUS8mwutKMHKosv--
