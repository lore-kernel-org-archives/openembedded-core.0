Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF756AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 16:18:38 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so69723540wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 09:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FVqckDhMK7aSLzL3rGs7lu+WPf8JWenOzQz/K+JEJ5A=;
	b=rgOB2jUraC94VdsAU1DJ4di34fAzAT2RTtNQa5XkzRNvD+P2igcFjz556kJwLtq4+D
	Hup1LcIEpPHu9MHXZOzWdWVwjec82C9IEUTfWnzhFStFzJXrJAqkmwLZ3XrFNhMVVOvI
	Cu8YsQaiThg7uEqGnTpmsF8ce8vTQtf2meRJZvS98C4byjmYPnZe+kWBdI5eZcuIkBmZ
	p2RhWN4b8dgudRoF2VbOAjCipL3RWuQf11sRuP2qPP7hyGeZ4xhKDETz1Teegws3qilv
	kNRJFu6JAoetdXH+yU6IdILQVlJR6e9DTtIm5TanMSAIcNBsL4D+e4xKXf8S1cGS6s9u
	xzDQ==
X-Received: by 10.180.101.163 with SMTP id fh3mr2257787wib.94.1443629918420;
	Wed, 30 Sep 2015 09:18:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mx19sm1564844wic.0.2015.09.30.09.18.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Sep 2015 09:18:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Sep 2015 18:19:31 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150930161931.GD2405@jama>
References: <1443620833.5162.83.camel@linuxfoundation.org>
	<20150930142859.GB2405@jama>
	<1443628787.5162.122.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1443628787.5162.122.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-selftest: Add qemux86copy machine
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
X-List-Received-Date: Wed, 30 Sep 2015 16:18:44 -0000
X-Groupsio-MsgNum: 71823
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Content-Disposition: inline

--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 04:59:47PM +0100, Richard Purdie wrote:
> On Wed, 2015-09-30 at 16:28 +0200, Martin Jansa wrote:
> > On Wed, Sep 30, 2015 at 02:47:13PM +0100, Richard Purdie wrote:
> > > I know Martin finds something like this useful for testing sstate sig=
natures,
> > > this adds one to meta-selftest so we can use it from oe-selftest in t=
he sstate
> > > tests there too.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >=20
> > > diff --git a/meta-selftest/conf/machine/qemux86copy.conf b/meta-selft=
est/conf/machine/qemux86copy.conf
> > > new file mode 100644
> > > index 0000000..bcce2f5
> > > --- /dev/null
> > > +++ b/meta-selftest/conf/machine/qemux86copy.conf
> > > @@ -0,0 +1,3 @@
> > > +require conf/machine/qemux86.conf
> > > +
> > > +MACHINEOVERRIDES .=3D ":qemux86"
> >=20
> > I wasn't changing MACHINEOVERRIDES (in case this would hide some
> > possible sstate differences),
>=20
> I think this actually makes it more likely to highlight differences, but
> either way, the tests I ran did highlight a raft of issues and it seems
> to be good enough to find several problems. I've sent enough fixes to
> make the new selftest pass.
>=20
> >  instead I had to duplicate couple qemux86
> > overrides in linux-yocto, but this is still useful.
> >=20
> > I'll drop my version after testing with sstate-diff-machines.sh that
> > both return the same results.
>=20
> Sounds good.
>=20
> FWIW you can run the new test with:
>=20
> oe-selftest --run-tests sstatetests.SStateTests.test_sstate_sametune_same=
sigs
>=20
> in case that isn't clear. It doesn't rely on building anything so is
> comparatively fast.

same as ssstate-diff-machines.sh --analyze :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYMC5IACgkQN1Ujt2V2gBzTsACghOiyxu95JhVAnubylvEBKvZd
bO8AnRz44fkIK8t0sUJQLDOoKEIVne3f
=Bv2k
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--
