Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 35BFD605F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:15:32 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id x10so9091372pdj.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 23:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=8Cxs1PPYt7qYX6QmmANPQXOBrYPEld8oxuVIoIr8voA=;
	b=hzi53COpg61RYKtakG3CZmwrkjHATurKdKM0fD3Y8nsJfHKKOaQxO8Z1E9+PhpTyI/
	GrRgnN6ypiy4G4X9rLzbE+F6YGaE4/S6QbIb6BJUVRntWGgyLrcatjgb3RmijqnbpLrg
	NrucB+A2wBcJ4jhHpxofKtyZfcOmZrPrnctoDKhKcHLlmb4AbUYKYR+eWwPu57uQgKOn
	Vk1CYt9BSMmvlHvX1HFvOs1L9G5embfiIeWZu0umaNfY4xbcbz3rrAfureyR4CnOi2d6
	QYfsWPIMoFvxW3t/BCQj4INRi+7i6H3gyJVQ01+Fus7R3viv4V81B6QIcLOO1owiz1rU
	PFlA==
X-Received: by 10.66.220.198 with SMTP id py6mr29253511pac.21.1396332933065;
	Mon, 31 Mar 2014 23:15:33 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	i10sm50986775pat.36.2014.03.31.23.15.31 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 23:15:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1396332774-31033-1-git-send-email-b40527@freescale.com>
Date: Mon, 31 Mar 2014 23:15:29 -0700
Message-Id: <64C886B8-D3BF-40FD-9D96-F46F37DB608F@gmail.com>
References: <1396332774-31033-1-git-send-email-b40527@freescale.com>
To: b40527@freescale.com
X-Mailer: Apple Mail (2.1874)
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool: Add depends on binutils-cross
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
X-List-Received-Date: Tue, 01 Apr 2014 06:15:37 -0000
X-Groupsio-MsgNum: 51981
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4C600985-0C28-4194-936F-0F7C4DAD9FB5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4C600985-0C28-4194-936F-0F7C4DAD9FB5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Mar 31, 2014, at 11:12 PM, <b40527@freescale.com> =
<b40527@freescale.com> wrote:

> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>=20
> When use command bitbake -c populate_sdk <target-rootfs> to
> generate toolchain. a race issue may occur. in this case need
> to add binutils-cross to depends.
>=20

can you explain the race a bit here.=20



--Apple-Mail=_4C600985-0C28-4194-936F-0F7C4DAD9FB5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlM6WYIACgkQuwUzVZGdMxQFTgCfUeDmBLvGWpxg65xRpTcEQOWE
UIYAn3r+Tcn/yI5atbO9hN06p97AcExz
=p+R7
-----END PGP SIGNATURE-----

--Apple-Mail=_4C600985-0C28-4194-936F-0F7C4DAD9FB5--
