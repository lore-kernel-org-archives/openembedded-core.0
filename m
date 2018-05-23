Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 68E6771E4C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 09:55:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m129-v6so7408478wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=U4YOOp7THLhxjrYCX2LkSLbYHPoiZLfFuhgz1yc+evU=;
	b=PZRNcYLEmRq48CTfpfbpcr6njVeHgyOh3FSPjK+KPHsc2gBZ6xXDQgirXDNQOqlV8+
	QZK5zHOpIcGTzdaPAkcnG4gqa3leIk5lXp7Gip5lN0xrOpnzrTxf5PQap30UDFAXi/UF
	l6Bzz9HyD8pUMKEhmYh5lrvs2/svcVYVa1QL8RiPzyl8Gk/+lC4odvWJnseOtzSSY9DY
	79XzBR2/qmddgEW8oO78Y+RF+zwX+M+vn+HHtEG3DIeoHqJLySX4sJ+eM0N8fs9ROuSE
	FubTJ0fqtafyIrTX5iZroBJOwhvnkfe/EGlEIzp6nm1hjQAryEFxwZruDqHvfTOXepIm
	8pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=U4YOOp7THLhxjrYCX2LkSLbYHPoiZLfFuhgz1yc+evU=;
	b=FjQYaWvGxxFwprdAgkBOKeqnBqvIUQGegeJ0LkChQmgL+S0Gg1Tw0nmkocSOe3I/8l
	6PERTul/IO96qHKwvjHvGdZ23kJxsdatapDiyNXvmKTjH1UXnd+hvThz+swyJhI2R54h
	HoCWJqWUYgZ1V/zKM4SgdOGDvc2yXxz5UX0+UsIO8GfrdOBlY9Z0BY5nea54INL38a5U
	3ikSvjEgYnDfuXkqm1y4/ovgSWfoOeRdGWgAbclUg2aq7fgQmK/U6/ApRHinjxenFTXI
	zikGjI6F9FGgS0u8fL6BttAHGGUdPI2RkyVHHIp/I1WEfV+n014D+srtbuL8dsAHorZ+
	HvRQ==
X-Gm-Message-State: ALKqPwcHmSc81ifMB13cxYkNxbB9b3pH017sg95pYmPnroofIw1+nSgF
	VyWq0q8saaLT/LTtqP7xx8U=
X-Google-Smtp-Source: AB8JxZq+nj2S+bRi27hkgB+LJW45Z4iZZQH6vX0l0IpOIamNsDeO55gJwSKR2ExoV6l+z8ifwknkCg==
X-Received: by 2002:a1c:3bd4:: with SMTP id
	i203-v6mr4126797wma.41.1527069358795; 
	Wed, 23 May 2018 02:55:58 -0700 (PDT)
Received: from [10.42.8.249] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm1319073wmh.18.2018.05.23.02.55.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 May 2018 02:55:57 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <B0257360-7FCD-4417-8C83-DEF00E2A59C3@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Date: Wed, 23 May 2018 11:55:56 +0200
In-Reply-To: <5720d757-4ef0-ea64-bcc7-7b6dad9a6615@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <D39B1597-8BFC-437F-A9B6-008A41846063@gmail.com>
	<5720d757-4ef0-ea64-bcc7-7b6dad9a6615@linux.intel.com>
X-Mailer: Apple Mail (2.3445.6.18)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Update Perl5 handling
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
X-List-Received-Date: Wed, 23 May 2018 09:55:58 -0000
X-Groupsio-MsgNum: 111640
Content-Type: multipart/signed;
	boundary="Apple-Mail=_751D694F-D098-4B5B-9700-A884A0C8BC7C";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_751D694F-D098-4B5B-9700-A884A0C8BC7C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 21.05.2018 um 20:57 schrieb Alexander Kanavin =
<alexander.kanavin@linux.intel.com>:
>=20
> On 05/21/2018 06:49 PM, Jens Rehsack wrote:
>>   cpan_build.bbclass: adopt to recent EU::MM
>>   cpan_build.bbclass: tell Module::Build the replacement
>=20
> Would you be interested in taking over the maintenance of the core =
perl recipe? We have a few issues that need to be taken care of, such as =
update to 5.26, and a move to perl-cross from the current horrible (and =
slow) hack.

I'm unreliable - depending on my contract load.

I have "updating perl5 and build recipes for perl6" on my project plan =
for open-embedded, but ... let's say summer ;)
Things currently went better than the months before - but load is much =
to high.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_751D694F-D098-4B5B-9700-A884A0C8BC7C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsFOqwACgkQRJmWrtzl
Cp0wrA//coHxBPVCXrVOENX7WSZSB54/XKWspp9KgweOiw8gqH457OLLWiktE/TZ
Lpde+5liy5r5o9NEPTSmcyIhdzG2Xc8JOHjFFInvZMdVpVBzIUYW4/oPLVKWkiAh
qWsNTx76pO9+w2vCc+/h5YBjNIAi9rX1SCdS0yfmjxk+B8+3yGxvRpBOeZXyRoK9
mFcq5fX6ZumyRF8L9ZyDSXELJV9t0H8Hm2OfLKieHpeTqIxq+8t6qUQJ+q6YIsoV
D/XeX/6qlg86w6eW2K+GlcRw5zu/OrRCCfpFH2C/5rSlp0i/p6Q+3NtKTxG58fRO
U+Xl+XclTAU1CUAGJWTwBPIHxnQuBeznKOjInHpvhr7ebEjsYtDt/+51Rx1JcaGa
GNUsJ17/en66LueDB/4m6G5upp/rR6eIDCN5Oo+Tkwq+UeMmPsn7879NUbI0gLnN
T0I2o2O0fFSWrCjqraND9QQN1JRGptKohjFO+7AkO7zsp2YKQtPIKxoEKIvA3Nx4
UPL1PAi3ELXXAOKiRRgi+yPI3z7MTMi6B/gU2fd3v9OG8ZN+tu/HfEgc+uJDV3fY
1AZlYjAr1DQnVugUiWOzmUR07LmhpQzUA7z/cE5LGpXPQKogu895HKxxAYgLp+zH
MuPV0FsiiZiUhbmE5mm7NFZllvQJWN4Q5zVRk0HGBAVkxNlYSao=
=IYMF
-----END PGP SIGNATURE-----

--Apple-Mail=_751D694F-D098-4B5B-9700-A884A0C8BC7C--
