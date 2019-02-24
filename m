Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0829F7C998
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 20:13:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id e74so6163232wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 12:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zzXKYsmvaRiacsXqJf7YFMNqC5eSND0v9VVDiOfR++U=;
	b=MU12ce+HMx1OwoCYn1SuTN6anrlpLUkGw2IpNheJ2pwJPSRHVfFkB0JCj2UvB/ZVrl
	gbalFtktA3yVqQ2q84FfYCjNaZ4R9yNt9PALv6WjCSJJb94yvamkGFVkI1RHz147aVfq
	O8hxFOANKOKdQLKEBUSQVAJw8O3odoFS1vk5CZS5LiXBpxyNnpw9Gyjd1J4dyNw/SxVL
	8C2eIAA09ZFVp0+GQt3lEQGP0viF65Autbcv9CeNYwmmvCHO59yKWcgW+Q9IXMdaSl2A
	00eNYtQS1qRqthvy1Tk6Xy73TuFejrY2spnO9TkhSlZHkjPgrPs3sSxhSGOE2Y2GBRty
	b40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zzXKYsmvaRiacsXqJf7YFMNqC5eSND0v9VVDiOfR++U=;
	b=GqO8WJuahuMzd6EQdQqIlPr6+S0EQoi74BZ1HUJ/pAQDStPlUy7VGgJKQLj7t2Himn
	RRPgoj/Nh0Jq1jercdKvxbhkEbyJPt+7hY1s5GQRzr4Ilh0SDwin3gRvB0Hr8qb7zH5X
	2SxCnrSpqVMJSSCBhGU30uyt3VFrCQwU5dmGOsB6k2/OPMPACfUiuD8Q7komFW+mUL68
	3Y3RYaacARGT+wxkBDiatmBfZt3TisWkPnnfMegiseuu477VpfqqRjdlBw3jMigFyx61
	iU4hu4X8NGmJVniSNbm8jmnToJhWQy5yy39nFE1Dolafs0ehfAcEt4dUwn3g6S71owq2
	CAJg==
X-Gm-Message-State: AHQUAubva+6JTwr5Pt41H1AKuLLTOSeO5w14TNRrsIBq5jU3ZSH48rU8
	KgpZZFQ8+Y/J8rw65Mn5Lj4=
X-Google-Smtp-Source: AHgI3Iav3vRY5+AT44Q9ampPjgEDRMBvOIT39h4fpdikHVyMToLc0u5QDCHsvFIsFyJ/WrFhYd5A3g==
X-Received: by 2002:a1c:7809:: with SMTP id t9mr8233658wmc.78.1551039229493;
	Sun, 24 Feb 2019 12:13:49 -0800 (PST)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y8sm4744974wrm.8.2019.02.24.12.13.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 Feb 2019 12:13:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Feb 2019 21:13:51 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190224201351.GA1260@jama>
References: <20190221221834.37807-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190221221834.37807-1-raj.khem@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+3: Fix build failure with gold linker
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
X-List-Received-Date: Sun, 24 Feb 2019 20:13:49 -0000
X-Groupsio-MsgNum: 121588
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2019 at 02:18:34PM -0800, Khem Raj wrote:
> Explicitly link in libfribidi
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gtk+/gtk+3/link_fribidi.patch             | 19 +++++++++++++++++++
>  meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb       |  1 +
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch

+1

Tested-by: Martin Jansa <Martin.Jansa@gmail.com>

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXHL6/gAKCRA3VSO3ZXaA
HLXBAKCFgtS1W4Va7ULmw/Eps8KX5TEf7wCgsBTlw+WTkE18w6B9KSRAsQn6SFU=
=4XbU
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
