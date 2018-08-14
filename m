Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5134F7900A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 12:45:28 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l2-v6so10368131wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 05:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=XPbJrj6xCH9jD3dyggRZTgomxN1VjPiQoJ4HYi/Bi9w=;
	b=EQGXfQHBCgsj3tMSN66U60bG507dhG1+QXKSavxRGcgFqhDg/xkHOUNtR5RceulJ0O
	StVKfFfpcHsNAjrNICMm6iK60CJRR/U8vnEG2Z6EVFxgjhXL2k5xcDINFBBPBoViUKRu
	t4cZiFoEHeGV4+CbZeJHRejKoD+iHgQzyDOn8LXhzJmMR4IcAz6r6d2nfL3OLvuzaMcv
	UsfyRidU9p/3Y9gn0uSWweAcV8g/RFprqTuB2gV3KtSAIfpbUuuslN5rCR8uUV+btIOd
	L3StKpVTMJKyDloFSPQ4fvGy2vV32U9EHSimW1UoWCXLk27dADCv63qUKGLwG/6/D/7g
	ey5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=XPbJrj6xCH9jD3dyggRZTgomxN1VjPiQoJ4HYi/Bi9w=;
	b=YB1HWYEXCm67Oko9Iudo7VBflohD+/pMNALJ6MEB/110tJuQa/HXo4iah1PRu+EcVO
	r+Yb2KURY9gvsnPXOgFFMMcT/v7ZZ9bzWlcPQZoGD8/fQvsvg+9R6Cid3sIdDbpA7/VY
	kPvbE82STxby4CiLFXx7Sl/ssAg4yHoiAoWNscOhZ+oJ5rCGt5B8gQMaO3kXgJJsIU0t
	qFFK70MSBBx3NMsBwaINUgM729sreRw1Dv0w4bRtaAw0JhXDKZlFcNwQawPWZtoJT3rv
	eTtrspKaWYdBf3gyqwEOsk/sOzkoZJBc3pqhbUbJsEmx1yPkAzos3q/lmHfb1Yy70CjW
	iKzA==
X-Gm-Message-State: AOUpUlG38EGIzQXnOUGHraKWskDXRrVJLRwiurRqZN9AQRIKimaamhEE
	LKhsGtMMbJvun2TDIiPPkZU=
X-Google-Smtp-Source: AA+uWPyDcFzP5dYzTf+6XWi8sFu7873ck9pA56VoLTyFlXW2zYCL7kRYt+XMkejvwNQB560LP6vrVg==
X-Received: by 2002:a1c:c241:: with SMTP id
	s62-v6mr11260506wmf.146.1534250728986; 
	Tue, 14 Aug 2018 05:45:28 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	u7-v6sm25179725wmd.46.2018.08.14.05.45.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 05:45:27 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <C8C6181D-96A4-4B3E-A3AA-2DD6A7F7DEBC@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Tue, 14 Aug 2018 14:45:26 +0200
In-Reply-To: <3f8b067d9a41667c7856388b819313761da9d03c.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <C4F20EE9-9435-4061-B634-871DE7DF369C@gmail.com>
	<CAJTo0Lam_z0M4oPwOoyPZMa=ZkWBj9qXKz8T1uMKFSiLS93Fgg@mail.gmail.com>
	<731A6113-251A-4CDB-9296-97E8BAF9619D@gmail.com>
	<3f8b067d9a41667c7856388b819313761da9d03c.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: Todd Rinaldo <toddr@cpanel.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cpan.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Tue, 14 Aug 2018 12:45:28 -0000
X-Groupsio-MsgNum: 114689
Content-Type: multipart/signed;
	boundary="Apple-Mail=_63418FED-9D4C-4AA4-B371-DBC9872904FF";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_63418FED-9D4C-4AA4-B371-DBC9872904FF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 14.08.2018 um 12:17 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>=20
> On Tue, 2018-08-14 at 12:02 +0200, Jens Rehsack wrote:
>> I did on August, 8th - but I don't see it in master-next or any issue
>> reported on that...
>> Did it arrive?
>=20
> I reported problems:
>=20
> =
http://lists.openembedded.org/pipermail/openembedded-core/2018-August/1537=
92.html
>=20
> Basically the -native version doesn't build due to the changes to make
> the target version work.

Unfortunately I didn't realize that ... Checking soon.

I expect some similar patch as the target version needed is required to =
the -native one - Devel::CheckLib is evil :/

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_63418FED-9D4C-4AA4-B371-DBC9872904FF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAltyzuYACgkQRJmWrtzl
Cp1+2Q/+Ordhxvawf/l+5MMLsaqxYB+Gpqvvht2HZBLXGdT1F4cvsa0bzLYz6Ew8
FRcRtZWSVjoPC5QOAL7H5U5fmw473xXB6X5veGTn0TFXZAEnF9JrbiyZ4P28+4O1
2bT862C35JWXBmQiuF5vhmF3h/ZPB+qcbopTQs88knX1t85xXPZXhPXs2uxyones
k/i7BR0+UN5CdSewxHGs+6Wv2ry6wnDqCp8y3JGRCfnu0fjG6BrE8LLVfI00b9Rs
k8erHdyC4Ua6yxxaFAKCBWGhYfx2/ebKLI4T36gw0JHkFJ2CrizrLM9MV/Sc1HnD
Z8eu8z7erKK2/++vbVr1o00pkpHCZzEZJOFvA2e8Z6xBJ1cSnoXHHEBnIgcbcKjt
+S7+LX3eHtcI42MmWwePoVgGZZX8C3SG0ff4IZOBvNxTkTwU7rF2gAxmY3+fai28
ViFKhxuEDNtMIwgfYruBBKLWnkMsxdwWaAvLVkzabB0zDTxH7cvX+ah16Fh3uL7A
iLu86/5s0EER4JuE1ZsOw6jROlUFwxjNCF/bQV/5kmmQsnajXZZXGQqel5wcKhfw
qJRE5W12hCfz3JjpNo4MCGlTh8WFH1OCBPydPL0ydZaX27htQM89oOkXPihO8K9d
JvNmUoRXOWI87xEnI8gbvG9UyxoaY0hufLgxra2ErAv0ZpqUhXU=
=LzRT
-----END PGP SIGNATURE-----

--Apple-Mail=_63418FED-9D4C-4AA4-B371-DBC9872904FF--
