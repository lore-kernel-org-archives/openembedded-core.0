Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A9D69605BA;
	Thu, 28 Apr 2016 07:08:52 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id zm5so32091702pac.0;
	Thu, 28 Apr 2016 00:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=3hY132L/JAGNlvSpFaj0RAV4Ep4qsBHsw00XTskuFMU=;
	b=eAty2ICHuwlpDpq7Lqrxj+RdRJvqnEoJ/WSlqIOtm7B7OYAF+11fGJP/d/Zsq8O5MT
	QysjpEhqdkCYZIjwy4WWujBVcydQ/DFSjS3MD73k77gWf8+j5zN2yLgWD4IBOo3vEcnL
	NlFJVhP9JgDeeJO5DP1uUrJt0mja47AeSwKNpZK3R1vc0gopUn1TD+3mZ2br/90fYeN8
	ID6aGq1Bic57/sp6QUlDqOEWmRHMHE0c5pqMEiOsFmBiNQrJ7cr+k2UtJs1rI3o+VdKn
	A9cFUXODd8sogCzkuRKOabMfmTR6E8qX4/qTgIbri9hnUZbb1Zzb8Su7qSf1SFUXBag8
	Ws0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3hY132L/JAGNlvSpFaj0RAV4Ep4qsBHsw00XTskuFMU=;
	b=nL1L3OvOKLBwZ5FUb/WqQ2EszsvqgSc37U88Jia0X09j4wnh5DD1mIYkfrz0FP8oIS
	h719wo2f5iBsFZLbQ6nW3oXfoa+Z6oEb9OFqsBrRh5doMjl7CpZkvuDoCDk33Trko01d
	U2RURNJT+6x014d4Y5mdvHh++R9HcGAiY0FAT0J6LLbZAlqxJSyugZjppN0mwH0BpYBl
	0AT8qFOrRZAyA15pJTzK3X2sxJWFe5UQMqs9rA5yyWNR0L8fyuxX9Phq3CQjoyILHlss
	r8dt39hOlT/xfCTeIW0xPDUry/dvN6T+za6/6HKNwl13sOUSZiERgqADQlh129giYq/h
	yjAw==
X-Gm-Message-State: AOPr4FX5m2+BkyYRXGFQ7W/pwZRWv17iWK3UbE6Ovmd6/XUOxlRc6KidS+Hw9Yw0k2TEww==
X-Received: by 10.66.153.209 with SMTP id vi17mr18187357pab.0.1461827333100;
	Thu, 28 Apr 2016 00:08:53 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:7c73:e571:eae0:530b?
	([2601:646:8800:5a9a:7c73:e571:eae0:530b])
	by smtp.gmail.com with ESMTPSA id
	71sm11995560pfy.32.2016.04.28.00.08.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2016 00:08:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160427221005.GA19598@bill-the-cat>
Date: Thu, 28 Apr 2016 00:08:46 -0700
Message-Id: <403123E7-85F1-4CBF-9D6C-E6377B89D5EA@gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
	<20160427221005.GA19598@bill-the-cat>
To: Tom Rini <trini@konsulko.com>
X-Mailer: Apple Mail (2.3124)
Cc: Yocto Project <yocto@yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 07:08:54 -0000
X-Groupsio-MsgNum: 81344
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9996E5F6-1EC4-4693-8A7D-3882C063CFF0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9996E5F6-1EC4-4693-8A7D-3882C063CFF0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 27, 2016, at 3:10 PM, Tom Rini <trini@konsulko.com> wrote:
>=20
> On Wed, Apr 27, 2016 at 10:53:52AM -0700, Khem Raj wrote:
>> thanks I think most of them come to these categories. So any help in
>> fixing them is welcome.
>>=20
>> 1. kernel older than 4.4, backport needed fixed into these branches =
or
>> move to newer kernels.
>> 2. uboot dont have gcc6 compiler header files, backport the needed =
fixes
>=20
> 9b2c282b348dfe966bbba967dc7a45ce817cce50 from mainline.
>=20
>> 2. meta-qt4 needs to use gnu++98
>> 3. gcc6 providing its own stdlib.h in libstdc++
>> 4. gcc6 swtiching to gnu++14 for C++ as default.
>> 5. GPLv2-only versions of recipes are simply old will need fixing
>>=20
>> I will take a stab at fixing the nativesdk recipes which is mostly =
due
>> to stdlib.h issue.
>=20
> Please do, I'd like to see some SDKs so I can get more U-Boot testing
> done with gcc-6 :)
>=20

I have pushed couple of more fixes which should now fix the nativesdk =
issues and SDKs should be building

Tree is here. Let me know how it goes.

http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-6

and also to github

https://github.com/kraj/openembedded-core/tree/kraj/master

--Apple-Mail=_9996E5F6-1EC4-4693-8A7D-3882C063CFF0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlchtwMACgkQuwUzVZGdMxTRxQCeJQqXvEq4+19tUZJ8JEjL3DLH
v6QAn199pD+6ApzCiIfMu52I9ZSK8Ypm
=uR5z
-----END PGP SIGNATURE-----

--Apple-Mail=_9996E5F6-1EC4-4693-8A7D-3882C063CFF0--
