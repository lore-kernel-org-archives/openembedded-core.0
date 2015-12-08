Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 421626FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 14:01:56 +0000 (UTC)
Received: by wmww144 with SMTP id w144so30883141wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 06:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8XJiC1hW9uV0cgGU9xtazqzT+yeNCkQC/mHPrEcFBaI=;
	b=Z5/nBJtujFFq+cmArHtWOnvjF5xXlzCiQk2uNO7JH7YnOJ9Ua0tut55TAX1aHOqa8I
	JJUxXTEyNWOyS3QVcUa0/7douQ7ZDNcZMfkko8P9Lk3uzasBpYfk1L297CsbG8lb6o4W
	JRbLwijoyqbvWdDoZnqaZre8p5EDhHmks0kv7E2gpIw7I6M1nBqMgXqGobbU5HojdOum
	j7RyBvzr25uEfyt65S36IQUq6kumpPvNKY6zdX2BBMe3Jdr5iZ3LN5u0ateggOx4Nr1T
	Fxe1Hl2tqKXn09BKtZvYtq6FkfSKgYQ+AV6peu6aEEzGVzz2YV/nOlvZaaxYth1mHap6
	QP2w==
X-Received: by 10.28.61.213 with SMTP id k204mr29379777wma.5.1449583316583;
	Tue, 08 Dec 2015 06:01:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id bh6sm3180633wjb.0.2015.12.08.06.01.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Dec 2015 06:01:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Dec 2015 15:03:33 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20151208140333.GB2238@jama>
References: <1447864860.1472.56.camel@pbcl.net>
	<1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
	<1447871842-30347-5-git-send-email-Martin.Jansa@gmail.com>
	<20151207223502.GC2249@jama>
	<1449570887.19730.47.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1449570887.19730.47.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 5/6] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and ARMPKGSFX_EABI
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
X-List-Received-Date: Tue, 08 Dec 2015 14:01:59 -0000
X-Groupsio-MsgNum: 74479
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline

--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2015 at 10:34:47AM +0000, Richard Purdie wrote:
> On Mon, 2015-12-07 at 23:35 +0100, Martin Jansa wrote:
> > It's highly recommended to use the script together with memres bitbake,
> > the execution time is at least 10 times shorted, but the changes aren't
> > picked between runs, so make sure to restart bitbake after changing the
> > tunes.
>=20
> That sounds like something it should detect. Could you file a bug
> please, preferably with a simpler test case that shows the problem?

Once I finish the tune testing I'll try to get simpler test case.

FWIW: yesterday I've changed the test to set the DEFAULTTUNE directly in
MACHINE.conf instead of using DEFAULTTUNE_MACHINE =3D "foo" overrides in
=2Einc file included in local.conf and since then even with memres bitbake
it's terribly slow, because each combination causes all metadata to be
reparsed.

So after 12 hours, I'm not even in half:
Testing DEFAULTTUNE armv5te (18/82) for fake MACHINE fake-cortexa9 (14/44)

I haven't confirmed it, but I think it weren't re-parsing anything
yesterday, that's probably why it was so fast, but IIRC it was
generating different output (with bitbake -e) so it was noticing
something (but maybe it was only for different MACHINEs not different
DEFAULTTUNEs.. I need to reproduce that and confirm).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZm4zQACgkQN1Ujt2V2gBx3dwCgrcK2A073gJfA4PmSrZ5QbbGK
2AcAoJpf98/biKFQLChVcLw9e4+fN2eV
=mZQw
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
