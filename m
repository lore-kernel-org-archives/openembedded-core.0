Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D95A77112;
	Sun,  7 Aug 2016 08:39:19 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id hh10so22071016pac.1;
	Sun, 07 Aug 2016 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=xj2ZZSkQTH7jPcoNcbb1L9Xo0PHUIK/DVblgNOtlA7M=;
	b=I87eRIY1iiCLbQijcj4NwWsszDUhXZphZ5ztEyfCK0tdN3N0rd9iXnX1V5QPrtaVOS
	bvdjbXmMTDfwAnywNrS+DZSJC3Xffm7LwhhDN47MbF2xA1XLM2hqM/OlAgWhwsX7oWUD
	8EO2YrJTJZD6aI5maZPSbgNN6+bjNLOa6zxO+i8VCucsx0P7ohmNy4ud0Fb4RjvqVayp
	te2fvdBAVkMn6Ir60oB1RpX1zrXoTbd4WkwXxJQkjVsTvkZCOgXc6qDL+lt4O3WUTPW2
	QrV/1qW7ZwWUsyJ12k2MWBlAkoX0Hr3h433sX2UQznqUQsVe+76o2yLm741N5UHp4aM3
	G3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=xj2ZZSkQTH7jPcoNcbb1L9Xo0PHUIK/DVblgNOtlA7M=;
	b=hVhZEem0iTHTzNWshyZUV1xFrJD5EsbbqBMfpnRNYUU6R7GkSKnKCHn1qE6+dQzKQO
	ZWvdyNyVQsBN4z+JlUNyEQdOF8fy6yE277/Qxph0tBQ1Z03LAgkkv81D11snb66Dr++1
	wHrxNzxkG+RVs31gHDqqMUYHgLX9gFg0HQi8Y5lneDdfBLRg7pQAY74t/ViAHVknNpgQ
	3XY10bkxf+8QTWQDx+agg2dQHhxxZ13gxejJS7frcgOxHRuwH5BF+DPFfYpPRxtxm4lk
	/U8AvIwI+2hli53kCr7Pw4nHxmpzlvw9WztBn//OuV0BHjZ3VSBjFHaMrGMIDtfea1eN
	1hIQ==
X-Gm-Message-State: AEkoouvGQH7UsQiBSwaiK1byEewh0O3aG6h29C2AQ0jHEyTlSatWPbrQp6LQjKgYVHJKOw==
X-Received: by 10.66.135.40 with SMTP id pp8mr152972552pab.113.1470559160225; 
	Sun, 07 Aug 2016 01:39:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:a4e6:3f8b:d48:8537?
	([2601:646:8882:b8c:a4e6:3f8b:d48:8537])
	by smtp.gmail.com with ESMTPSA id
	q4sm39536146pfb.18.2016.08.07.01.39.19
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Aug 2016 01:39:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail
Date: Sun, 7 Aug 2016 01:39:43 -0700
Message-Id: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Yocto Discussion Mailing List <yocto@yoctoproject.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: [RFT] binutils 2.27
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
X-List-Received-Date: Sun, 07 Aug 2016 08:39:19 -0000
X-Groupsio-MsgNum: 85410
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D927C18B-EE77-4A58-B130-CA3F59AB55C7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D927C18B-EE77-4A58-B130-CA3F59AB55C7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi All

I have put together upgrade for binutils 2.27 here ( kraj/master branch =
)

=
https://github.com/kraj/openembedded-core/commit/b98f5761d2285ffd773ec6ecb=
901b799302ebd6b

I have started bunch of test builds. but I would appreciate any help in =
testing it out in your
environments and report any issues you see.

Thanks

-Khem


--Apple-Mail=_D927C18B-EE77-4A58-B130-CA3F59AB55C7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlem89MACgkQuwUzVZGdMxRBigCdHGzu5yt+9LlYgh0ajTioHRVZ
FIkAmwZFlOHaEWdr22vC8D7XaTzs1yhi
=Vdfw
-----END PGP SIGNATURE-----

--Apple-Mail=_D927C18B-EE77-4A58-B130-CA3F59AB55C7--
