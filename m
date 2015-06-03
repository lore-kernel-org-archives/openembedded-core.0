Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7B87B65C9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 21:21:13 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so15653298pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PS06B/ai7M3jYyqH4LEdckhaLJuMd+V5Ad1sfoQh+oI=;
	b=hCITUODP/b0Oh5aPyk2r3YuI12xfLQAA/Ug5+7sivReqIXyQO2vjob8vQC8q1RwYRQ
	uz25/mFPgaU0t0fLGh1jQUHz+Q8RZowaReNoBuLnEZDA94Jop8zS96dT/FPEZYu0I8A4
	ZuenPXzGnI1g1GOnhdc9FdtfyKrreFPt4/DRYPFTn0TL8VS6VpjjcNUt1sgUP6qpd+pv
	LCYB985ozCouR0H8sOXVjBrElxdcAEQR35RpKSD2XRhl65DMaYOqROzHFPNK8dgxh7IL
	L0iRHbxfaWAFY4pd9jKr65sT8MXqHXqCJ1Clv31+28OLAYM0wkGrvghZUU2Elsz6tesl
	U6fQ==
X-Received: by 10.70.54.103 with SMTP id i7mr63580442pdp.134.1433366475042;
	Wed, 03 Jun 2015 14:21:15 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:d1e4:9e90:3fdd:134b?
	([2601:9:500:ece:d1e4:9e90:3fdd:134b])
	by mx.google.com with ESMTPSA id fk4sm1623004pbb.80.2015.06.03.14.21.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 14:21:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
Date: Wed, 3 Jun 2015 14:21:08 -0700
Message-Id: <5E0378F8-62E0-4A7F-AB07-0209CD229BF3@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 03 Jun 2015 21:21:14 -0000
X-Groupsio-MsgNum: 66289
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DC67F0D0-93D0-4237-B63D-4560E698C629";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DC67F0D0-93D0-4237-B63D-4560E698C629
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 3, 2015, at 1:18 PM, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>=20
>> Use git for repo for SRC_URI
>=20
> Can you explain why? The revision looks like 0.16.0 release.

its easy to develop libinput and prepare/test upstream patches since all =
upstreams want the patches against their latest master and its easy to =
switch to AUTOREV locally and do it.

yes its pointing to 0.16.0 release

--Apple-Mail=_DC67F0D0-93D0-4237-B63D-4560E698C629
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVvb8gACgkQuwUzVZGdMxQubACfcrf14QPvn1kuxIX4BMLfrR53
LP0AniiwdXOTSix40yvT4Ci2xM/3tJXd
=/TdS
-----END PGP SIGNATURE-----

--Apple-Mail=_DC67F0D0-93D0-4237-B63D-4560E698C629--
