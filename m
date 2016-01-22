Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C83FC75CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 18:47:22 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id q63so47666071pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 10:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=23llFUubiQh5TVV7MZ4pwH3n22BBuynEg4yRvcp7drU=;
	b=c2/ZVU8YufDuOdAi8fuKgWC4OZfRQDxZ0aiIS8UoLLceDRAoDVneLvyhAjt2ZqzrEP
	6MsjKr9iRVNQmzwh2ov01nWnoBsEG62hEzpVbU2Y2oLEbaYmHFq+uTI1tdw6A/onKjz8
	MW35Oz3hX1rczc/Ndhqg0wHDsbQrxYs0IbW3b/NlfuJxJwT00sQugDI4gqcuDISbPzLu
	kA85bzWOiJKr+qyUaJb9osFDJLJRrJO0+dc65DfL405pstsLoy9nNvK0UjdOQDubpbmt
	XMiZfrI3S4qnQJKwSp4PxrlKNvK9rs0bcJYSdhWNqPlbnO2xy6ZE9ok7kpb+3Q4m/Xih
	y1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=23llFUubiQh5TVV7MZ4pwH3n22BBuynEg4yRvcp7drU=;
	b=RG4TM1EfHvAdxBeXPZWvLdsGf7x+Q+v20NDJ9uDs4NEvJZTW+XShEtSONnCQjLAbwq
	NvvicqhYzaXJ54dizGf+2OQUUxFMtusn7qVygz+SfCPiDD9sGUeNssZ9BEiNFBLAIEZD
	g7q4/cmjUKeH3HWaEZDFaW/J9Qcn6+BKosn+8+Nd1C2v/B+EtiP36Iw3X8DJDGvPiyWs
	CLcvS0AV5dneVoucVCEzwEx0vTUm+JfQT5dbWD954WyBNJvFN0sKaKY3RUjk56VQ2Rjf
	0n28Ix3VRNVecVXSLjHxGw5e7jSboi/IB9GnTMPQmbODYPsw+gBVO8FygkQJgvoDf9Jc
	UF3Q==
X-Gm-Message-State: AG10YOQ9UyxIzQIsD9AnShTft5iFEEV7245SUACnvGxBzGJv5m3jvWToLqZFH8q9IB7ADg==
X-Received: by 10.98.19.130 with SMTP id 2mr6625342pft.31.1453488443550;
	Fri, 22 Jan 2016 10:47:23 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	p20sm11284427pfi.86.2016.01.22.10.47.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jan 2016 10:47:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56A22767.7050000@linux.intel.com>
Date: Fri, 22 Jan 2016 10:47:18 -0800
Message-Id: <BE4534E5-7E2F-46DE-89AD-338879D98C8A@gmail.com>
References: <56A22767.7050000@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Fri, 22 Jan 2016 18:47:30 -0000
X-Groupsio-MsgNum: 76717
Content-Type: multipart/signed;
	boundary="Apple-Mail=_31DFA265-26BC-47A9-A580-C044E29165BE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_31DFA265-26BC-47A9-A580-C044E29165BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 22, 2016, at 4:58 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> Hello,
>=20
> DirectFB upstream project has been dead for several months, the =
website has completely disappeared, and no explanation or apology has =
ever surfaced. [1]
>=20
> So let's keep DirectFB in the forthcoming release, but drop it early =
in the next release cycle.
>=20
> [1] =
http://www.phoronix.com/scan.php?page=3Dnews_item&px=3DDirectFB-Is-It-Gone=

>=20
>=20

There is another followup from phoenix. Here

http://www.phoronix.com/scan.php?page=3Dnews_item&px=3DDirectFB-On-GitHub

github repo is here

https://github.com/deniskropp/DirectFB/commits/master


--Apple-Mail=_31DFA265-26BC-47A9-A580-C044E29165BE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaieTkACgkQuwUzVZGdMxQ4IgCgk9SZziGAfEZDR6m46EirgYuR
fzMAn3Sv2WV8dJfcY/jIf9bojDxD9om9
=Olbn
-----END PGP SIGNATURE-----

--Apple-Mail=_31DFA265-26BC-47A9-A580-C044E29165BE--
