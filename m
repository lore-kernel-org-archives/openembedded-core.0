Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id F04406FDEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:13:52 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id ex7so2070825wid.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 10:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Iseq+kVW3v0dtW+JzNp5ghKyeNmX3FyPQ4mdKBALj5I=;
	b=pNwIgGHT8gHt0F/SAxg5HzZ8Xy3RNLRdS3OvkRSLho1EXj5F4BpdmNZlnP775wuxBz
	Ix3GCt/lc6O2aKYE1aR4bUyotniTU7ExJw/wF1X7TE+lYgs/u5qnU9GtbxMY49Uw79pE
	4QMo4Cjal1TTaTb1rSZgG+dBt7lmutY4nv0dOZtDqpRq6cSuz7P96HrhY/6+0w70lAj/
	ZZwpwkW5WP7gW8R1hdjp7J+5YtuTn9UxvtWBvr79kFrphSJW4Y7BGRlO83363Auao/rA
	sSmvTfuCf8xRi9a4XilzmoDhJKiczGlHRvCRtzqhWww8eaLR2cpEs2vmnp00iZ5DMFWH
	2g0w==
X-Received: by 10.194.80.2 with SMTP id n2mr46731973wjx.29.1412010833859;
	Mon, 29 Sep 2014 10:13:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	am1sm16353533wjc.29.2014.09.29.10.13.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 10:13:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Sep 2014 19:14:45 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140929171445.GT25706@jama>
References: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
	<201722111.zmNURQEFnj@comp-006-thk>
	<CAJTo0LZ4RCk5eqdXb2MxchvQkZgiT3+4+yUnNuNwQZcX+0Vm4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ4RCk5eqdXb2MxchvQkZgiT3+4+yUnNuNwQZcX+0Vm4w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add SRCREV to do_fetch() hash
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
X-List-Received-Date: Mon, 29 Sep 2014 17:13:55 -0000
X-Groupsio-MsgNum: 58224
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GAoked8QSizNecZ5"
Content-Disposition: inline

--GAoked8QSizNecZ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2014 at 03:56:44PM +0100, Burton, Ross wrote:
> On 29 September 2014 15:52, Maciej Borzecki <maciej.borzecki@open-rnd.pl>=
 wrote:
> > So a trick like this will not be needed anymore to automatically rebuild
> > whenever sources in SCM change?
> >
> > SRCREV =3D "${AUTOREV}"
> > PVBASE :=3D "${PV}"
> > PV =3D "${PVBASE}.${SRCPV}"
>=20
> That's right, you don't need to embed SRCREV in PV to get a rebuild.
> For many recipes it's still a sensible thing to do, but it won't be
> mandatory.

It will be still mandatory for recipes with multiple SRCREVs (and
SRCREV_FORMAT).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GAoked8QSizNecZ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQpk4UACgkQN1Ujt2V2gByrvgCfX3SseKfBDnzsYVFf8YJ4e4Nx
6KwAoLuIh5O5rvpQ6vzLNPj9xXVRJklH
=VQeT
-----END PGP SIGNATURE-----

--GAoked8QSizNecZ5--
