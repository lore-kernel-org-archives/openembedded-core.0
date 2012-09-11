Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBUZ7-0003eO-OV
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 19:48:01 +0200
Received: by eaad12 with SMTP id d12so368086eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1gMS9zcq2zWgzUoWidj8Yjam3ofR3bjet3DgnmK4G5g=;
	b=WWQLakf4teCG4iMXn2crNHaVnkLYIQXNWeSqXXxEawwqIxYO7/el2di3sd0vgUqEV6
	VrNVoGYUvhxFCJMkJ0aNlc/JsnlGWJWF4Qid9Z97soIUfYa/3YVQvWs+GabOafKJAt4X
	2CDhboA+WxHlVG0Nvs1m+74wCJy2ECWQmO7+RvcWCeEpaD+QJSbZDdsZH2fh21OOLhB1
	SLHxukCaSyraj0qLEW620qx4KkmWBXQrJlouruRE5E2ILMhgWPvwuoUCb7ikpYCA/zMa
	fuKDbLMQ2648qGqSfIMmE/oVwUmNPKHp7KEr6aKJm9ESJXNKqefN9QzrLt7YZFXVCotz
	ashQ==
Received: by 10.204.128.196 with SMTP id l4mr5247343bks.21.1347384930754;
	Tue, 11 Sep 2012 10:35:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm10333293bkv.14.2012.09.11.10.35.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 10:35:29 -0700 (PDT)
Date: Tue, 11 Sep 2012 19:35:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120911173529.GL14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347381972.29443.15.camel@x121e.pbcl.net>
	<20120911165323.GJ14077@jama.jama.net>
	<1347383662.29443.21.camel@x121e.pbcl.net>
	<20120911172107.GK14077@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120911172107.GK14077@jama.jama.net>
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
X-List-Received-Date: Tue, 11 Sep 2012 17:48:01 -0000
X-Groupsio-MsgNum: 29077
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ai3I8gwHc37+ASRI"
Content-Disposition: inline

--ai3I8gwHc37+ASRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 07:21:07PM +0200, Martin Jansa wrote:
> On Tue, Sep 11, 2012 at 06:14:22PM +0100, Phil Blundell wrote:
> > On Tue, 2012-09-11 at 18:53 +0200, Martin Jansa wrote:
> > > If we drop DEFAULTTUNE from tune-xscale and tune-arm926ejs then
> > > PACKAGE_ARCH=3Darmv5te would be the same and the same feed will be bu=
ilt
> > > only once.
> >=20
> > Well, that would also make those two tune files rather useless.  It
> > seems like it would be better to just refrain from including them if you
> > don't want the corresponding tunings.
>=20
> But that does not allow me to still use it for few packages if my DISTRO
> decides it's worth it.
>=20
> I'll test tomorrow, something like top 3 patches here:
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune

If this works then DISTRO would have finer control of which DEFAULTTUNE
to use

1) default: don't use mtune, optimize only for march (don't mix mtune in
the same feed).

2) include optimized-tune.inc in distro.conf: use mtune only for some packa=
ges, but
with separate package feed for them

3) DEFAULTTUNE =3D ${OPTDEFAULTTUNE} in distro.conf: always use best mtune
available for MACHINE, but unlike current default, don't mix them in
same package feed

DEFAULTTUNE =3D ${OPTDEFAULTTUNE} should also be used for PACKAGE_ARCH =3D=
=3D
MACHINE_ARCH

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ai3I8gwHc37+ASRI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPdmEACgkQN1Ujt2V2gBzhGACfZJ9OYhmStWKv9SGgYMcUaech
1VkAoJ/YI8B2C8qAyCo1l2smkhcydvyC
=rmBt
-----END PGP SIGNATURE-----

--ai3I8gwHc37+ASRI--
