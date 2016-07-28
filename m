Return-Path: <trini@konsulko.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 70DA06072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 13:47:24 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id 52so48417969qtq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3hGml5l8RhEYUfzPbyvlAsghRxEAiaixE7hvposr00Y=;
	b=I9fYzCFnRJsMXniDMuHuLi2DuIUFX3MX7k56Sf2XhfcJI477jDvqQBCON/bcdmwah+
	eG5OgLUiP07Rf8PgG506XyTryXfUvD/CfquBM+CqfSkqyBChHTn7CqaS9Wj4+559wIYK
	0exaWHc0YE4Uv0Kcy3I5cV/zYmRUftqMv5LuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3hGml5l8RhEYUfzPbyvlAsghRxEAiaixE7hvposr00Y=;
	b=PmY9+UJQsWybvacjcMAM1Dc7N0O6WtUSLdUiT7Y3LTxtInp1m4Ygn25u6XQr7dBJNi
	uOgn2BkrxyFbEU02Ot7mZRfvlBXLgjO3xqsuAYstdekuo4HH4zcpRIgL73dYPDHyz/uG
	l8TtMJUJROXLpt9TGBUm0liKMz1RBwOlPZEhFsPooMBkIRV88PrWDwtp/O4Gn59kUvnJ
	BYotXNQMYioqI3cpOm07fDms2KvncXPHtVEM68BFb+d7PMcGnfgGXHZerVWpg7CdJi5Y
	xYp4yb95gm2irTPdsw1m9uzBzixGvmBFtGgwzyPPrVd9jvZ7+o8qiwrxaHw4Ob7VRNhL
	sHsg==
X-Gm-Message-State: AEkoouvYdwxsn07gPCvYeHMLwQ981MnjxZdhlfx0USinT3nd1n22i4qSlrdttk+AUaSrJQ==
X-Received: by 10.200.37.111 with SMTP id 44mr56873736qtn.17.1469713644770;
	Thu, 28 Jul 2016 06:47:24 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1407-C0E8-3C46-B3D1-EDB5-DA82.dyn6.twc.com.
	[2606:a000:1407:c0e8:3c46:b3d1:edb5:da82])
	by smtp.gmail.com with ESMTPSA id j6sm7310618qke.26.2016.07.28.06.47.23
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Jul 2016 06:47:24 -0700 (PDT)
Date: Thu, 28 Jul 2016 09:47:32 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160728134732.GM5926@bill-the-cat>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
	<20160728132014.GH5926@bill-the-cat>
	<CAJTo0Lbdc8tOYB9u3ybdFwCXoOZU_M6x+tg_wUSbydnwtXbs+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbdc8tOYB9u3ybdFwCXoOZU_M6x+tg_wUSbydnwtXbs+A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Thu, 28 Jul 2016 13:47:27 -0000
X-Groupsio-MsgNum: 85055
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="um2V5WpqCyd73IVb"
Content-Disposition: inline

--um2V5WpqCyd73IVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2016 at 02:24:41PM +0100, Burton, Ross wrote:
> On 28 July 2016 at 14:20, Tom Rini <trini@konsulko.com> wrote:
>=20
> > So ARCH and a bunch of other stuff isn't set and things blow up.  Just
> > how large of a -j value are you using here as I would have sworn we had
> > gotten this problem fixed.
>=20
> 20.  Before applying the patch I did a build to verify that the patch
> introduced no changes, and that worked fine.

Can you do some O=3D builds outside of OE to see if it's an every time
thing?  Also, what version of make is being used?  Thanks!

--=20
Tom

--um2V5WpqCyd73IVb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmgz0AAoJEIf59jXTHXZSP0kP/RfltJG23FefUJaNR96Q6Ib5
7WdZnwK6OtYoVhEfp8MFi0Ri3eC2CEtuZaKo7kpgw5U/BiXR5R8P7k/poaF0VGOU
DPVnC3MYjYUKRIVPaYEopQPq4hO4l1EvSO5lThAFyTDqYfvfHSLqtKgnQNnh/CtN
wEu4QYQu6sRBRv+pTIAd1G55LC3WnrentVH7NaUCqhWbLgoccMy/doxzxl3eihKS
5e69hYl4KNyka2jPJH7sEghMul+pxKLsOvaCUDNqQVhvya68xpK4wFCEBFYqIjR2
+PZreV648KRJ9d2jsqIoR4dAIv284doiGKzUvcwodT6j94U2uB/ArZqbmMCeLM39
YTrZKkcg076bjfbqn6NU/KnmyehapltqVXAa0XmaFZLaSVZcE8kYIilOxucKTZrY
3TxxR112a9d30LkuHm9vYePOhGr9w/+zhQqzNMJVjBa32t9I2cZqNyrYVnEDQb1r
MZCWyjfr66j3sQic9kCVaVefyYyOdsahtY+pv8y9ACoacWE808F5fLFmQUUY+FwI
nJSt1HNuPUj0NTDb0a1l1t4/C9tFO+xBPWKLDqo3t5rNMDc8H9J5bA9cT0z349SM
zRpXLwwJ3oLv433ZbfEBSbHoeioDpufIheetvXrLHSEZPjFcdoxiJNN+hp1IUR++
kLVQLV61cEb5Sg3hqMfb
=mXUt
-----END PGP SIGNATURE-----

--um2V5WpqCyd73IVb--
