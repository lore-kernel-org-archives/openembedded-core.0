Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD817F7AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 12:56:05 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id p128so8587632ywc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 04:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zyMw3ywnttZuQmDr2R9jVJaCVaUBJCnfXVt7yG3MnuI=;
	b=ogZM54Z5P329K/5bWKnNH4fa+aBedISQWXZevK6MuePo54kgFCZSIVmQce2mIugNGx
	Zeya8PZeamu7UstSQfDDAksos/z8celhtUKEn9wWNBPIFhzWH1GssgJyHvc+D6HzkBov
	9IIgipnxqoOqqCsP7XLzDK6XgeZbfGhOSacLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zyMw3ywnttZuQmDr2R9jVJaCVaUBJCnfXVt7yG3MnuI=;
	b=IyVxVEaRI+Z9yyDiRiASPXKvwWJS649yLfgaNNGSTfR5OilQQq6Zx16GzHb1aUWMbK
	1RMPmk0p/1zZ1JMKFHeQUL6EC/zcY4PlD3fTfSplVwOXIIZPGZcW9XFzHHyqgo9toz4c
	Fz5GSdvDQsYobE8d++BcOaEzqT6WfWn9V0ZCkiyBrLeF6zI2xyKldL+1ODe4FisadZHJ
	zcsZCFF7IjKCQt3eoOA434ixjcPxP3PJMUE+bkXQY/7L0G9gQUM4ldbkUY4WLWrGBkGu
	2flThlIlJNQRL/W6sIwhF9lN+6vIZ8+MGfdvXUFZ1lkpvzViXaCaFy7VbJvMDN+Yhm8m
	nrvw==
X-Gm-Message-State: APjAAAVfw2Fq6/4geyQQpO8p5vLrxecCC4yCehCKMwaCUF/BhcxSTnO2
	ABlbB2xQUuArN/PGpRsIEj5VpA==
X-Google-Smtp-Source: APXvYqzJt1Et1JvqfxpByW7Z63hLjnKYqBrAFAw2mD8NjZTTqarmT+nqLv6eFQYUzxmNOE1SyoV4Ig==
X-Received: by 2002:a81:47c3:: with SMTP id u186mr1473756ywa.91.1574254565818; 
	Wed, 20 Nov 2019 04:56:05 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-4822-cbc9-ba3d-ee00.inf6.spectrum.com.
	[2606:a000:1401:86dd:4822:cbc9:ba3d:ee00])
	by smtp.gmail.com with ESMTPSA id
	v124sm11460782ywc.2.2019.11.20.04.56.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Nov 2019 04:56:04 -0800 (PST)
Date: Wed, 20 Nov 2019 07:56:02 -0500
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191120125602.GZ19317@bill-the-cat>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Wed, 20 Nov 2019 12:56:05 -0000
X-Groupsio-MsgNum: 131604
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fvyamX9r+zPbOLwf"
Content-Disposition: inline

--fvyamX9r+zPbOLwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 02:07:49PM +0100, Alexander Kanavin wrote:

> Drop backports, rebase a couple of patches.
>=20
> This is the second last release of py 2.x; upstream support ends on
> 1 January 2020, there will be one final 2.x afterwards.
>=20
> Note that the only thing that still needs python 2.x in oe-core is
> u-boot; when the next u-boot update arrives, we should find out
> where the py3 migration is for that component before merging the
> update.
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

I would _really_ like to see someone move master to using v2020.01-rc3
or so for U-Boot as that should not have any Python 2 dependencies left.

--=20
Tom

--fvyamX9r+zPbOLwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3VN9gACgkQh/n2NdMd
dlKikg//YxqlfGCt6EJUvpjk8Sgc77nbcaCEGnODPCaV4pHWwFED2lOt22jFWTNv
7MX5bhOZS0H0sZt/JDFYVTZrOmXC7NTlTskv25Bz6fFEbhRQlgG+dPnmsDtagNA4
g27hBdm94i1a2tA+B40Ukr98AMArOsqcvF92g1U9fDlQiBRxHL8lpGkomgFa9wCG
+6N6AbG8Pf+zmrIBorC9AC42PTOQfA7wf6aHZ8JtAdD/ym6bWqg/aTqwDfrJB0tS
zJpQsmtjnPMdacPZetU0PhWPWpZcragfoeKAoX2PvzrtrUvrQ0Emv1bSDfNLhHnl
+MnzweG5h0mPMqTOmGimKoLZS6496DLmaVAjze5kQ6qQBHQ39rd4FQzdc/2x/516
mvHfyj/E1NQpY+FU0J9MO/7gbIjFbUIrDsvPBxZwbv51Rb3h0OcM5aXa3lzS8SPZ
raTfnWr1KktiRL0Lz216pof4vnnfbCUJCsx74WrjMCd7uLcVzxzi015n8Hk6nK1z
8M3f8AygHGyVa0yBSs7EBf2k3e7KoNbhhQhBONFdlwY7ZHzs4B4N5g8VrY/tWOX/
DIRfNnKGGnDYRuS9reEmBQeaxuKweXKWvIIPNennjzUJFi9LUgpcmg482LF+yH78
NxIoPuSUSzTYlYHBbooK/UF6LTvM1a2in9HbUXWu2/BiWaPWQ0E=
=rixe
-----END PGP SIGNATURE-----

--fvyamX9r+zPbOLwf--
