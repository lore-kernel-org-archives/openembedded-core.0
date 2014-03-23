Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id A98486FA82;
	Sun, 23 Mar 2014 08:35:22 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so4152019pbb.19
	for <multiple recipients>; Sun, 23 Mar 2014 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:message-id:date:to:mime-version;
	bh=TrAtByhXX63jsVdpOGp3Wa5fpzrSkTOfkzYIjmTWJC4=;
	b=ZpJyG88d7FQg96ni4Vg9MtMM9kjYiwcgWAO2YOn1ZvCeBlolz9IezHAh/2JijH+gwx
	S1AHptfJ4M2c5T9SXeqwvEGgAizzepF9htU4r3jMUf48mFdDzDwTPxkV+ojWiNszr4Vg
	zwrYPxezseLHFgIhsYk2B9oBzTv9KW3XBBI26RmhK/fc6QXttgvPjRPgODfTBk98+XDe
	DWGOWj/lrb4S4LvkXgLwVdbrKa4BEc1IT5/q7yn4LUIkY/cwAgiqsHcQW3zq5fGsmY15
	FhgwTZiVzBTUxIM32yWmoqiYLpeDfPKiv3FJiDyZOlwPlaO6czKfgm/jF0CLGGo63/Ns
	FlLQ==
X-Received: by 10.68.4.8 with SMTP id g8mr1359123pbg.133.1395563723175;
	Sun, 23 Mar 2014 01:35:23 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ix2sm20560772pbc.45.2014.03.23.01.35.21 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Mar 2014 01:35:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <E7466334-BD13-4847-948A-0885F4B4F987@gmail.com>
Date: Sun, 23 Mar 2014 01:35:18 -0700
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
X-Mailer: Apple Mail (2.1874)
Subject: [RFT] gcc 4.9
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
X-List-Received-Date: Sun, 23 Mar 2014 08:35:24 -0000
X-Groupsio-MsgNum: 51489
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9BF578BE-AA5B-4B03-B1B7-E02D90E99D70";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9BF578BE-AA5B-4B03-B1B7-E02D90E99D70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi

gcc 4.9 release is coming in summer therefore I have put together the =
recipes here

=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-4.=
9

So far my testing has been booting angstrom/systemd-image on all =
supported
qemu machines (except qemumips64 where there is a know kernel issue) =
both eglibc/uclibc
images

we would like to target them for 1.7 release so if you have cycles to =
test out
your image/machine combos please do so I would be interested in feedback =
and would accumulate fixes in this branch

If you run into some issues with some packages then its recommended to =
go through

http://gcc.gnu.org/gcc-4.9/changes.html

and especially http://gcc.gnu.org/gcc-4.9/porting_to.html

Which could help in cooking patches

Thanks

-Khem

--Apple-Mail=_9BF578BE-AA5B-4B03-B1B7-E02D90E99D70
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMunMYACgkQuwUzVZGdMxTeuACfbutTrBxLZzGI7wk3M5DW5jWh
OXEAnj1goor8FwlOOyvrq4P+7UI8521J
=PiO2
-----END PGP SIGNATURE-----

--Apple-Mail=_9BF578BE-AA5B-4B03-B1B7-E02D90E99D70--
