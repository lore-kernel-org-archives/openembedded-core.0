Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD086E954;
	Mon,  3 Feb 2014 17:38:35 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so3961480eae.9
	for <multiple recipients>; Mon, 03 Feb 2014 09:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ClRYMfy7Wjot6FYP4MiBFjoXackFwZ/ouRMFNSPgw7M=;
	b=adw+kpJMd2glo6XjazIN0CeQTx9SFS1O7hDoqnGXeNkbndAecSgto/yIqQ/RBRHfgS
	RUxuTqEUfo4XsPjYdYZJtpwNfN0CP7FpwHVxikf/sBpvcSVNTySnz/zOTyzYYvTW+KzL
	ripXPbBSQ0D7Rah0GHh2Oo4nBS9O60/lK/lkcqVthv6i/F1G10GYoPrbPgJn3t/Hjrzm
	UiDNrHa+lRqF/x8+HRyecGshv4u6OhXqiI8tbzYm2p0jN5Majs3/MWNqRCbmSw+j9qGM
	V7S4FXSgo3r4qgtT0ALzlxN95J2kZ5gUgPZirLnNAm4PnDD8YoZl3J0mjUb/QEkUxHnJ
	wIXw==
X-Received: by 10.15.26.8 with SMTP id m8mr45471007eeu.25.1391449116057;
	Mon, 03 Feb 2014 09:38:36 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x6sm1070677eew.20.2014.02.03.09.38.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2014 09:38:34 -0800 (PST)
Date: Mon, 3 Feb 2014 18:38:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140203173845.GF3698@jama>
References: <20140202223258.8D272503AA@opal> <20140203143127.GD3698@jama>
	<CAMKF1sqMOgxUa2P4JQVJpTT1NeGNE7tSL-UqfjcMdPMVnQFKxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqMOgxUa2P4JQVJpTT1NeGNE7tSL-UqfjcMdPMVnQFKxA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : binutils: Upgrade to 2.24
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
X-List-Received-Date: Mon, 03 Feb 2014 17:38:36 -0000
X-Groupsio-MsgNum: 49798
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Content-Disposition: inline

--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2014 at 09:27:44AM -0800, Khem Raj wrote:
> On Mon, Feb 3, 2014 at 6:31 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > Hi Khem,
> >
> > can you please check following QA warning:
> >
> > NOTE: recipe binutils-2.24-r0: task do_package: Started
> > WARNING: QA Issue: binutils: Files/directories were installed but not s=
hipped
> >   /usr/bin/ld.bfd
> >   /usr/bin/dwp
> > NOTE: recipe binutils-2.24-r0: task do_package: Succeeded
> >
> > ld.bfd is there for very long time, but I think that dwp is new with
> > 2.24
> >
>=20
> It seems you see these warnings when you have ld-is-gold in your
> distro features right ?
> since I don't see them normally. I have a patch here, can you test it
> out and report back ?
> I do not have gold setup here and it will be quicker in your setup to ver=
ify it
>=20
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/bi=
nutils-2.24&id=3D33dd773b4b701dff8184a346d532b11f1bd5d327

Yes I have ld-is-gold and will test it, thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLv1CUACgkQN1Ujt2V2gBz7kwCeMKyguIaNRDmVCcHAQ6vjWsUI
L9kAniskjDI4NQAuEpwN0gY2JCxi9AjX
=SwBt
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--
