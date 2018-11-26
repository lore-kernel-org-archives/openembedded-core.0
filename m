Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CBD856D13D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:48:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l9so19868506wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=zsmv3T6389AVxGqXnRFyFrRDpPifs5ERA+HMXidaPPE=;
	b=k7nXlizt8cO+qB99T5Uo8wQGly3ij+I9lzKHb5yUE+jCDsrtTlKroYTqEhex8JS1rM
	xW6sCrYuVdC2nYDoOhyfztSPe9JEwS5ruRxvPJgs9cPrFQ5QlCyheQyr7d4fW2nrVN8T
	9FFjH1rPGeWZmp3z5El86kr83yMnNSfnqVBkadDw3EL3zx9vBwaxELAqBoSR1KTEKgj+
	ljXGYSTU6QvqDI/cy7cTEVeP7JLN1Q93HZG5fygcNZKzB+emzNjoy/86673IIPbg4lNg
	IvkMtdkOfSn5WuEwLPPJtL4y6SV49HET4eSaaaspccI4RUJ4XI/t06EeYqP2ozGV3mLC
	c6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=zsmv3T6389AVxGqXnRFyFrRDpPifs5ERA+HMXidaPPE=;
	b=e1u8wAVhKPYW3CuRC7Z+Qau3P39b9droGoam5T/sO0/W2cHT0/03mq9cAzsKyrvDEu
	2RTej0RkKQO5FfGg/JuEBjIFM4Vt1T2y5FKJYznCT2UQgN8J9NcwN96hL+GlcrtL7Eq8
	CpSsMDRfQjUTEzdye+UNEsA0p3STlVyShtAgDj9/T0cmXNge325b1GvaDEx4CtSRJ/PE
	8inM20bnlyquWbiJvex8y3FljBKFwxP8KPZwgZfu+BgzU6mhxWNjeTewjyFdYZtrmXIE
	srZXdP7T1c7PhtOKnjAa/7JRdVYVBeqgNzWUNe/1sJVPS62DjTMrCem/rHw+POozi+dp
	aoMQ==
X-Gm-Message-State: AA+aEWbeYrJVmqRg7Dk+yXhV5acIQlFKgH0V+s8IAf6dyWie5Cl7Rf1h
	1cf01wyXqixu11G5NX7dH5Y=
X-Google-Smtp-Source: AFSGD/X+cuAIcRC/nEhrgSdS3JA24MFCjdNszbHepaMcBSCxjLGZtbcLO/+EIauwf23BoltHOeZntA==
X-Received: by 2002:a05:6000:100f:: with SMTP id
	a15mr19698894wrx.298.1543254503613; 
	Mon, 26 Nov 2018 09:48:23 -0800 (PST)
Received: from [10.42.8.217] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	h131sm2231615wmd.17.2018.11.26.09.48.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 09:48:22 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <E1CE49A9-1286-4333-AB21-C085CDA78853@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Date: Mon, 26 Nov 2018 18:48:22 +0100
In-Reply-To: <CANNYZj_6NPPkiS1FGNpnWq4AWrxSioyKSLofzXJH_-muJTbTug@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20181126144308.13862-1-sno@netbsd.org>
	<CANNYZj8gJiXCBBqFb-gLvV83RhO7StKxGiaTnjE_iuMK7ZGG-Q@mail.gmail.com>
	<F8563831-C398-42EA-87CD-9C1A50A1F5A8@netbsd.org>
	<CANNYZj_6NPPkiS1FGNpnWq4AWrxSioyKSLofzXJH_-muJTbTug@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.101.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl{,-native}: Update 5.24.4 -> 5.28.0
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
X-List-Received-Date: Mon, 26 Nov 2018 17:48:23 -0000
X-Groupsio-MsgNum: 118621
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F864FEA1-9B03-4423-A05B-9E95EA3C1A00";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_F864FEA1-9B03-4423-A05B-9E95EA3C1A00
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> Am 26.11.2018 um 16:22 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
> 
> On Mon, 26 Nov 2018 at 16:17, Jens Rehsack <sno@netbsd.org> wrote:
>> Even if I'm not a meta-perl maintainer - checking whether it works and
>> how it handles meta-cpan would nice to know.
>> 
>> That it's not submitted - does it means it has Q/A quirks or just unsure?
>> Maybe I find a tuit before next contract to finish then ...
> 
> Basically I only just got oe-core to build without issues with it. So
> nothing else is tested, and RDEPENDS generator is missing, but as you
> came out with the patch, I thought I'd bring mine forward as well,
> otherwise I'd let it cook some more time.

Nothing speaks against doing both ;)

When the "common way" works fine (I don't know - as I just build some
small tests and run tiny tasks for "Perl on embedded Devices" to
prepare updated information ...

But your patch isn't small either - I'd like to do the rewriting
to perl-cross maybe in a 2nd stage ...

But I really appreciate it and would like to do some tests as soon
as possible (unfortunately that means: not before end of next week).

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_F864FEA1-9B03-4423-A05B-9E95EA3C1A00
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlv8MeYACgkQRJmWrtzl
Cp3jZA//VnK1Pjxz1myT02ydmAvwWKJFVgBha0yZH1yi196yxVt3Oo8UhkUvKUKt
BUIgWnXygNw54/2914ymtHzS0cNawUXYk3je0dzmFnsFjyOjV8IOFsFy4CXjqOMM
pbAIeZ6skyOn5B9EfRN/Tej5B9KFH8x2VcMSycidN5azVDDXEmzcpjnr0Db4Bf4X
LM82X44pOCLmDaq+n5MXZHi+PS/4ksYfJVlvHNpudH53hUMzdaoDK4NmmcYcFCqV
ke27WRyVKhjKyCWCDcM03FCvYgnRlLY92TE+TeZEPuAlaJG2gzuLYERZAMW/p7Md
zAHNz+tiDyoXDrP2Cqdv/1DFXHy7oaDatATkmDOkEZHAlTZul9Pjl8Z7RZh6ISBt
M2HPwBkJdo3B/NqQYm30nzgBVnQFv1mdUz3ZFYNa4Nrv9cq1eXwyUgB8GJsqfSF+
9aTGTyz2wpW7A9JIgjD0OffqaT7XAz9vUK1uziOskIiB2/Tt6AQr1L7F8b+K0FlB
+y4GPrxbvV2NbFcpvht506CzvLc8qiuAYwJ93YPxitKjeJyFttFS3y2+dFwFRimS
zIm00joV5nKd4htITrTkGgfBtaUgjyEmACo1g7t/GIvS2aaKf9cShOu7oY3WNJtj
AujncIlfvlPvflnbG2xfIlh6yd1JLdh3ly65e9WrWrJ+MaG7V3k=
=7E1z
-----END PGP SIGNATURE-----

--Apple-Mail=_F864FEA1-9B03-4423-A05B-9E95EA3C1A00--
