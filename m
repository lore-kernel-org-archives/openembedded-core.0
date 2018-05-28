Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D4E7C744F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 18:54:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f8-v6so34414083wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 11:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=VZSFvMmEtxIoKgknKX27jA9dtrOAZA43pIamJ0QcyWU=;
	b=Zl5gC45f0FwVdrUcqb5Fq5zHFFzpkFICKKYo9ymD1eafYYVF6HPISyXf/m/EkDq7HU
	IxwSdNSG5gM0ltx30uZOmjuB085Vk4ittYIFflG2iZ1mFQEiOf5NpgI6IvoIp4ohp69u
	68Lvhoe/8EwDg+Yd1I8lXs60/X2AHWZ53mb7eGOWK3kj6OqNWlicamFoYgCsCpN5Izg3
	4LYHqL9FiHLWenKmD2gipmGEd0IDZ9tohlHxEr7RsuLrHoyZclQqDhCG46MjMJ0AkMLG
	VDBjHI5yXQi/fD5C0TR0xI4KvW25cxWblChexdiIljMSmNodl0b5xUmD2uDnSdQrACxo
	0siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=VZSFvMmEtxIoKgknKX27jA9dtrOAZA43pIamJ0QcyWU=;
	b=jSaRod0bolGP8Eq+3KsoIdOj8tP3MG+niHl2dcSm6cbsq+A/1nuN1J6bzKw+pp58Uq
	ecJmVHWuhfpfouqM3pFfMRMnYjVgtkjn7TQQMgV9gkANSYCzeFpjJa/1DNPoCZn9wVh9
	D2KUxJAkiz7UmXCsbGPB9wTPpdAusRQOhB/yoJyJ0QnfXPZ+JFhEguF4S6xqpOKDTOrc
	c3owXwaWMTpkxHhNPzsx5+vuYab0MJLizr5ubfKTKlpF6uxuPfS/GXOIafGHA7GS9ppx
	BafUdWmtcDOSKUYeNBq41vMH2qC07zDgUuttKIuiirTnb4IuA8MWJf0NgSt2AM5/BHzX
	zivQ==
X-Gm-Message-State: ALKqPweCuH0fz+AioDdNfKQWuP9gu2R4KRikbbrdg9+PR7rCXp/6zDIL
	QskxkPhTYXIeyFFjQHsod23ujkfj
X-Google-Smtp-Source: ADUXVKK4u4you5ukiDgLwr8ftQJz4QhkbY1yhxX8rW/eI52EwLLwYcEgCE3RLbvq0WHoRKUSxtdDnw==
X-Received: by 2002:a1c:1f13:: with SMTP id
	f19-v6mr8381996wmf.73.1527533696170; 
	Mon, 28 May 2018 11:54:56 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	l10-v6sm9602156wrm.29.2018.05.28.11.54.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 11:54:55 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Message-Id: <9B78844C-EDB6-4AAD-A0A8-B261BED57059@gmail.com>
Date: Mon, 28 May 2018 20:54:53 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.6.18)
Subject: [PATCH 0/2] Update Perl5 handling
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
X-List-Received-Date: Mon, 28 May 2018 18:54:56 -0000
X-Groupsio-MsgNum: 111811
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C59E9626-B896-456B-8449-4022548ABDE0";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_C59E9626-B896-456B-8449-4022548ABDE0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Jens Rehsack (2):
  cpan_build.bbclass: adopt to recent EU::MM
  cpan_build.bbclass: tell Module::Build the replacement

 meta/classes/cpan.bbclass       | 3 +--
 meta/classes/cpan_build.bbclass | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_C59E9626-B896-456B-8449-4022548ABDE0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsMUH0ACgkQRJmWrtzl
Cp2YHQ/+JvDrH8ef+6yHjTIikJ1GmfVY/p23ggUNCJCVz8ZM9s+MDZPdHDWBc0oe
clZDAA3Gx5wYLXWBeKiZFm0X9qjgdVlhLTrJbRN0oQM1ByHyB44pYBU7kW/tog8/
pVXrMnSRqT3whzXyv9FtqwbfK0vx6IuI6MhgcJzF9QGBPq8O2xjYrZBDRbs6IzOU
Jl/EK4PGC0rEHEABQWRl9qCLLhqUEtbKbPIac22NRa7HQwNYuNXmYqg+iaQLC5jS
zA3Ic8onCHbctlfJHSMIjzG6I1SXUL5uIVUgPV6yp18NMcXVDTdVYVXxq4DWX6m6
fE0XiBFXAtMvsBqQRbh+jUPA1oOtyAQpJBMa7RyfWl9fSSVGIDYAJ24c9Cix88Hy
4Z/M1RAO6xqFYvzdh+BMndRemvZXRKzfoms6jLdKDft+YBjfVBaJY3ezHo1+lnP9
kg0jvQe8tmjxXnX9IbkMfZQZCcpMEC7Q7CqGvJbg14Jut5JMKJpUA0McHBDvHWsW
ark8KFpcSyVR90lK+KsjWRcomNvtLgOuF4CiVEyGvhEIFVpO8qq+NyFg1D4USY5B
orR10+D7rQ/ckZwZUPjYChMD/d4ZLLuSv2YYnnOxaE1lQgS6M2SFQe3/mM236kBG
ZMFEcPKY+iwcVFH7ZMTVwrBgrfv4i7MUtfXCYFOxmwzTwkAzDL4=
=7B/8
-----END PGP SIGNATURE-----

--Apple-Mail=_C59E9626-B896-456B-8449-4022548ABDE0--
