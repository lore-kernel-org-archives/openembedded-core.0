Return-Path: <rehsack@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7286D747FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 18:55:10 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id i14-v6so21655827wre.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 11:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=OpSZmSQ6DkY6/grGZrrHkkpWY0TcCY7SYeoNOHvjLm8=;
	b=TJVQ0ej2hal4/nfa0YwafP3qwvAtTe7pKwLdXnHAlZMecpgb09y10Q92wfnbcLzN3U
	QKA3704ONW9OiKkP8jbWMH9EaQGzwLIjCu2a1rP0HGoTvLSXxFXWy4POWUoTXclERFsY
	O3EHYgDEEA7tqq3A8mwCmRMcRTUPQziVg1dKSvZ/TTQ6OfE2ZHfIP3tL+uNAFyf5vi8k
	GYvXvZ6/VbqLSSnw4JADJs2VM9EWh/0mD95YrS6qjvOxiF8tj6pKJKHlevgDsiGEjejB
	G2MystVt4CduW3q8+jJo4jtYXVPsCCdTjx4BVQch9A3AFHO8CxUiymOZD+1Xk6R6Otpx
	ctOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=OpSZmSQ6DkY6/grGZrrHkkpWY0TcCY7SYeoNOHvjLm8=;
	b=Bf6UWkA6ygaLoeUqwYkmYJ2PLx4r90A6xeVLppwMShHdE8k9GwpaGMxvdgEKLleHaK
	y/1k6KAMABRRWdVoZqqUT5dO6z/LOLG50zyWAzaOfwbUKEnCHmzp1dE/lR8evJbbyay0
	FIhKaQMr8nKM0JB9oEYiSuQOe3oNFb08A2U8ED93aFQA29ve5XG77sA6htCbiq6Gy6wV
	kHujlLfYW3sz3BRd6UGNsaY8ZxdgGmp51nQ1wjwVZXV17oabagOGJ/jKAAsYunk12d0O
	pe2qFK7VV4r7vOs3nncgd40fe+8A9F1vIh8G0VmyMjPLDUNug0IJN2xRtVRXor3/dYxr
	tmxw==
X-Gm-Message-State: ALKqPwcKQzSnAtDF+YPtoOrkEh5Br7NREMA/1NZhjf/IkeluMNahXH+l
	77r7CuuHf78eC9O66HQtenQuEkl2
X-Google-Smtp-Source: AB8JxZqn5IVOXu0Frb4psLi3gqhhBZolVY0m2Pzyy/CZwgUdiCI9XmlAlnB8AkxqtknBu5fmCl6yxw==
X-Received: by 2002:adf:f74c:: with SMTP id
	z12-v6mr12171393wrp.165.1527533710746; 
	Mon, 28 May 2018 11:55:10 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	l10-v6sm9602156wrm.29.2018.05.28.11.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 11:55:09 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Message-Id: <0F505E4C-A06A-4217-B410-BA97EA827238@gmail.com>
Date: Mon, 28 May 2018 20:55:09 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.6.18)
Subject: [PATCH 2/2] cpan_build.bbclass: tell Module::Build the replacement
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
X-List-Received-Date: Mon, 28 May 2018 18:55:10 -0000
X-Groupsio-MsgNum: 111813
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4B250B72-10E4-48C7-97A7-88466C6F5D48";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_4B250B72-10E4-48C7-97A7-88466C6F5D48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Instead of patching Module::Build, maybe Module::Build::Tiny and all =
other
similar tools, use the official way to tell them which is the target =
perl
on target.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/cpan_build.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cpan_build.bbclass =
b/meta/classes/cpan_build.bbclass
index fac074d610..9a2ad895ef 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -30,7 +30,7 @@ cpan_build_do_configure () {
 }

 cpan_build_do_compile () {
-        perl Build verbose=3D1
+        perl Build --perl "${bindir}/perl" verbose=3D1
 }

 cpan_build_do_install () {
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_4B250B72-10E4-48C7-97A7-88466C6F5D48
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsMUI0ACgkQRJmWrtzl
Cp0R4w/+OWkLDeQUTmj8r1ZkJw02p9G4GGYLNS7JgLc4MqHEL14czP/RBwidIcgD
NzvzOPQ3e/lF51ere1hVlvRb7hTO/5+z8y+0+yr0S77/MsCAC3Iq1drY3bZg9A/D
fvzBm9hsCdk0T5TC+CmHpBBFpe0FPrd4iXROvI+nncGJX0AXDLjrTlUJqUIUE1UK
+dZDE9+bLqo9thu/zRDDfzltFNHHFr7B/NbvsvYmqjub9rFgOH6RDsZB3eTksKwN
RlVJfr4oPHH2fBiC/OnaJl+dtjv90z+INlvRhJ1fUlcmKCyE3wqWjxy3fn/N9aTD
BvupKgG3ycH+KYiXQKU5+4qox+9W+mekRLirtHvwy04qKAUOhvr2xFrsp86LN2k7
n3MSBqSYr46yim3zLpGOwkcU2zO3WxdCo9zJGCLmKsv8RxktRmde2pqJaIXaKQE7
YKxfdqmvPQs7f8m5235hx8qU7UME6+T1jQWLiWRd7+bME861hrui20gMsP0MLPEf
dDEZRVEBtna+wczUv7YodBVYYFPWF6D/o3Ixw/Dh8tzz1bAll7knWHR/6HFQ6j9y
AQfGR8lXwSjPnDJtANE019TYRY5RZb0DfD3uLSdzOrttk4yQY+YhH8hpUKPFnZwz
w7K09BoIDa7HmaI7TKLQ6HNdFYgnA7a9EXMtIHEgrmLg+BqraCg=
=d87p
-----END PGP SIGNATURE-----

--Apple-Mail=_4B250B72-10E4-48C7-97A7-88466C6F5D48--
