Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1CE74582
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:04:08 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 69-v6so20991953wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 08:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=P8DOOgE4Gxd56v/SfaHyn89FugvTBhak3eCW84HIQrQ=;
	b=MtCvvzvCuXdM1ccFtr949rS9tJz7oRTKApYH3lMrOj23MI1uu/IQBIgdinoRsCusUI
	kKP7wUf3dB2g4oT4vNgxMFhCS7LhISjHKrx9YfohEkfDhXhKMarUUIaVu6GUp+1wJK5g
	a9IS/aA7f0eOQ1VaLN9rGrvnUQ9O0maq0xuzVKo22OEuZ+hfH/PZ0ZnOkisUZD8ZzlRr
	yrYqdeN7bgUog8+E1w9sOiPf3h0s74pcmT1P4KkIJonIM+azOJhsXrNvDCrIKEsx82hX
	HwJqGOSuEwtpC2JSz4ri2AsEyn0m3zkuJqxshD6tnWYYfFQXeLr8wbF/bjDHmx2Cs7Aw
	myvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=P8DOOgE4Gxd56v/SfaHyn89FugvTBhak3eCW84HIQrQ=;
	b=E0HvNd6LyzLSAjpnGo00XK4uo7oLqndSCVNJfVNKVOYifTleCUKt1RCDDaeyX3qlVZ
	LBSwaZIyDJUJW0mxEC3E64jyNMoV0ZjxriiFOvslW5oA4pgOP9wZOjqm96D1Zia9+iV9
	OCMzHUr8WJi3nDGnDy28NNuexa3MFOPZtpMTxor+9cTiVs5/i//r/F4Aa6dyVWZHvLqV
	M+Iq1U6liA9qqYk5A2oz/H/70mo2V2lPUlKjKdCllzOe8OjgDE3REeoW7SGFnTxwmQgJ
	biesZ0poN0LudSxLlBjK/QCnmIwrGz6Z9NUqdQGHFZVvIuPw0A8Sp7nE13UJTfLOozOv
	gOhQ==
X-Gm-Message-State: APt69E0Q2Nhxn16CdL0HcBYWets3jhz80zxiCYE6zbwo3hIc/RshNcf0
	Oz9QIfrifD/iAYjDR8SRgEOKUg==
X-Google-Smtp-Source: AAOMgpfSPsPfPFqm/2xl+j2QyNjcWYab+QO4WhmzerI2bqBwItowtRV/kwd8rm55GhykOaqUYzwyrQ==
X-Received: by 2002:a1c:15ce:: with SMTP id
	197-v6mr11604947wmv.99.1531148649784; 
	Mon, 09 Jul 2018 08:04:09 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y13-v6sm14612707wrr.24.2018.07.09.08.04.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Jul 2018 08:04:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 Jul 2018 17:04:16 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180709150416.GA1825@jama>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704075924.24065-1-Martin.Jansa@gmail.com>
	<a333b452e931aba10c78abf179e81f55d9de4c49.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <a333b452e931aba10c78abf179e81f55d9de4c49.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 1/4] kernel-devicetree.bbclass: Use lowercase names for shell variables
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
X-List-Received-Date: Mon, 09 Jul 2018 15:04:09 -0000
X-Groupsio-MsgNum: 113292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2018 at 09:21:49AM +0100, Richard Purdie wrote:
> On Wed, 2018-07-04 at 07:59 +0000, Martin Jansa wrote:
> > * just to make it more clear what is local shell variable and what is
> >   replaced by bitbake from the metadata and also to prevent the
> > variable
> >   to be incorrectly expanded by bitbake if someone happens to define
> >   e.g. DTB_BASE_NAME
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel-devicetree.bbclass | 80 +++++++++++++-----------
> > --
> >  1 file changed, 40 insertions(+), 40 deletions(-)
>=20
> I think something in this series is breaking qemuppc automated testing:
>=20
> https://autobuilder.yocto.io/builders/nightly-ppc/builds/1129
> https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/1114

I've sent fix for meta-yocto-bsp here:
https://lists.yoctoproject.org/pipermail/poky/2018-July/011436.html
I don't have the device to test it in runtime, but the fix seems simple
enough that it should work.

Will sent v4 of all 4 oe-core patches, with just link to above added in
one commit message (otherwise it's the same as v2, rebased after the
revert of the other kernel-devicetree.bbclass change from last week).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW0N5bwAKCRA3VSO3ZXaA
HKOQAJ9nQXhJw0ZctTALyeVlJyzlAzVLvgCdHgygAPh+kA/OkX7a0OWiiDPp8WQ=
=MRy3
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
