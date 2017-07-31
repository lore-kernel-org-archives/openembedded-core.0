Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6F9782EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:49:11 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id u207so94617847ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wXou8GSO+HStPTYDtKhPswktJdGXu0G/UVYCt04k5bs=;
	b=G0i5PrH9MytrktSdCTN6ZBfpmaFz8p4ZBeLYRgegBnxMJ+stRSxTC9DYm2UtG0Njwf
	XQiHoaK74dLOkbze/ak3WUaFHh6tmN0JYmBkxMs6gzBOvX2ndNFbRzUB7eIn13Y9zy+o
	PILsNt6PK7ospjYo6q5W/WvfV89P3UL61WTH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wXou8GSO+HStPTYDtKhPswktJdGXu0G/UVYCt04k5bs=;
	b=iB2eXC7BjRZCGrf/z1X3qHUvMR2f5Gbnq09hljhH520UQ3iec6nGgVF3mMdoexq+1Q
	umtGLECkBvPCdAp33ocEr7A6w5D5fEyP8/VrzoRm/eM4zHalbC1h6P2aCsLXG0I92IKJ
	IfP6VpmYAvNOLIE5/FnhYWYEH1hqSocmE3QF/7KIZh5B3Q0bCtGwEZrHXI9735fXuP6v
	kx9nyFszd0ksNrp2MAMhIfi80/0eaXbHudvwsKSz5TPBuaQZX2nO8aOPnuIXATL18y8C
	euxd6+Ahz1tMQ7tVhUJNHAHx+I6R9ISV21SfTXArPLWiHNn03MD3UlI9+WJpEB/l4Wz6
	1wCg==
X-Gm-Message-State: AIVw110Gu/vh+VhRx7MdeNQIzIeoAI+R6BUzCRD/zZxXBPDRlmpMnW1W
	qyVIryDkMZ/aT25V
X-Received: by 10.129.91.135 with SMTP id p129mr13668533ywb.209.1501505352548; 
	Mon, 31 Jul 2017 05:49:12 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:b42c:54f:27db:36c0])
	by smtp.gmail.com with ESMTPSA id
	r67sm10448456ywr.13.2017.07.31.05.49.11
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 05:49:11 -0700 (PDT)
Date: Mon, 31 Jul 2017 08:50:36 -0400
From: Tom Rini <trini@konsulko.com>
To: liu.ming50@gmail.com
Message-ID: <20170731125036.GG16135@bill-the-cat>
References: <1501491388-15182-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1501491388-15182-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] meta: drop do_bootdirectdisk do_vmimg references
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
X-List-Received-Date: Mon, 31 Jul 2017 12:49:11 -0000
X-Groupsio-MsgNum: 100917
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline

--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2017 at 10:56:28AM +0200, liu.ming50@gmail.com wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>=20
> do_bootdirectdisk and do_vmimg had been dropped by commit 929ba563:
> [ image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types ]
>=20
> Also drop the references to them and image-vm.
>=20
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>

And there's no references to image_type_uboot.bbclass left, either, yes?
If so:

Reviewed-by: Tom Rini <trini@konsulko.com>

Thanks!

--=20
Tom

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZfyecAAoJEIf59jXTHXZSn+EP/RQsPhIzdTKYFKkkH/oDSO6Q
l0lZqSiz1VvEYOPo2140reKAwFCC1piBP5+xl6VIU4oeoXryk0bb8wsqcnPlDoLn
fbzeeuKJMpWctWBsCK4pSXJxHhifJEEaN3elw01eWLKMySOXpcY3niNWopzP3Aj7
pxc8YSW64mTN6eAMdtD5EUG2X+usKVoPo3QsHKAbuJyWDfNXp6NkS/gHvyhNzz6y
6+FPzkt2cwvj2vRwMm7OwgKTfhma9mpe877iayB15amxudk2lCisX+ODNkqohkhA
/yDtvpkMVjxOVgoe78a/kpUzzg1x7j7eHSbFdX4KUmes70G6BhhDUl+py94ahH1L
GXcq3zhezWnMCTT9eSQhmZI/ZyZrFWCuYfoFUaTcyGLh5YwJ6kR3nO6DwMj9grVC
crOAAPzR5QI1gSW42fX0vR8cRqUBzlfp2vwMVUXvFaI0qUTbQx0zc7O1BBERpmBW
7F9yjK7IinpSDzxIuMqqU87gVeXXwmUQR3bEw4N5PyVR/t6YRWrR0C+OlOS8kL/b
/koKb3RarKqZZdYku5BXw9sUdmS9pIIeF1XYvUuFDBk6fFmTSaH1puLPd6nfL+pp
TpdDzUOewX+4Mfg8IQG6ygsIaN+K7dhrc7ga+agUW8BFZE4HTbwcW5t2Fm5g1kAL
8llGYRLKFBVp2pzJc5lr
=Kfa6
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
