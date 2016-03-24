Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 830F2605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 22:22:30 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id u190so68459811pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=D8VN/puSXkWPUwGMPx9TqAvkVk+ckzrB3oEJE+KzbWg=;
	b=QI2DUjeRfp3T/Piu5ghLYCvHbQkRIIGxFNFTlJCE7Vz4FEp/muQqPWOMkbBXYjvEW5
	hdNMOhsB4/BkpjdUGXRsrlJseo0KtFukRv5RupZqy2ubtl1pAEKVZbxY6/mjyMLqlDWI
	OqSv4+bipOTbn+ZemEdZHC/BLe7ckeU8UfBZTBRdoqXQ/dfG+jyCUJjsxcZ/ynKYK/o4
	f9qW5kzZxma1KiGSNeeJngiDwkunpmcKCxdU2NZ18jdYHZJs0V8cjxTC66tB9gdZ0yCa
	6S1z73P1i/N7A5wTDpvjYcSTf2iWmr2Cmshzqwr3PcYy/2TMBQBnxeb4rNcUEhz2L8oP
	/8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=D8VN/puSXkWPUwGMPx9TqAvkVk+ckzrB3oEJE+KzbWg=;
	b=KLzxUzZOUN4bcel3AcN8PudFngeDiWG5JFNi8qdw76NB+UBi4OhjdI9QfMK/Do90C3
	xF5bJSerdumoQpN5DjsIO6w6j8rVHXxIRTPaZEgeFk6pDVjq0qCLyaN3jcMXb/+ziDla
	waHN0mFtybk1t85zQp1floRfUJ98MH6qJ8o88MFWA5LmYTwtenVOI5thXzicmn6TcwiH
	maUTYfY9DNp4Uf2fIqySHNRBFRzycqZ1usTH4YZg5+ouLTo5FpMrcMi9NTCj09YkOasa
	0Q8sbqD6DX8iFHe8K+XcuW3aNtUmMR4uYOPbnYqUlU9rP+BTYgAGB5pJmgJOK96rMSBE
	I/Qw==
X-Gm-Message-State: AD7BkJJ2TolqKMg3k4PA/WgkWD51tGDUSdUF+ORaBvcDpt3pLROZrNRy94bPXIufe++lMA==
X-Received: by 10.98.10.20 with SMTP id s20mr16383424pfi.109.1458858151463;
	Thu, 24 Mar 2016 15:22:31 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:a4d9:b8b5:b926:f5b2?
	([2601:646:8800:5a9a:a4d9:b8b5:b926:f5b2])
	by smtp.gmail.com with ESMTPSA id
	w62sm12217498pfa.79.2016.03.24.15.22.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 15:22:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1458844322.3476.198.camel@pbcl.net>
Date: Thu, 24 Mar 2016 15:22:25 -0700
Message-Id: <93EB73B6-E9B5-4DAE-9CCE-3D87FAD794D3@gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
	<CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
	<CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
	<CAJ86T=VjwZD9qKnhyX6-0xHQVRph1e0FSkwR7OWWJPQsvnOnnQ@mail.gmail.com>
	<1458844322.3476.198.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 22:22:33 -0000
X-Groupsio-MsgNum: 80117
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A1AE5B61-5AF5-4628-99F5-FA14A97DE84F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A1AE5B61-5AF5-4628-99F5-FA14A97DE84F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 24, 2016, at 11:32 AM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Thu, 2016-03-24 at 10:37 -0700, Andre McCurdy wrote:
>>=20
>> Renaming armv8a -> aarch32 is going to affect almost every line in
>> the patch. We should probably drop the current patch from master-
>> next.
>=20
> "AArch32" applies retrospectively to all older versions of the ARM
> architecture as well,

not really. Arm refers to aarch32 specifically when we use 32-bit on =
ARMv8
so atleast we are speaking same terms.

> so it's not obvious to me that a straight rename
> of the existing "armv8a" override to "aarch32" would be the right =
thing
> either.
>=20
> I think the whole approach to ARMv8 and AArch64 in OE needs to be
> carefully thought through before we start landing any patches for that
> stuff.  We have a tangled enough maze of overrides right now and I
> think we should make all efforts to avoid it getting worse.

Totally agreed.
The current tunes we have are probably sufficient for 64bit case and it =
simple
and nice. However, the fact of people running 32bit userspace on a53 =
SOCs
is a reality due to porting reasons or resource reasons. So I think =
divorcing
legacy tunes and just having aarch64 and another one for aarch32 is =
going to suffice

--Apple-Mail=_A1AE5B61-5AF5-4628-99F5-FA14A97DE84F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb0aKUACgkQuwUzVZGdMxSAHgCdF7SL+HjSh1sOqtk+eJxnpair
YFwAn2xC7cWtUjQgQ2RlkfIx27K7PsjW
=55m0
-----END PGP SIGNATURE-----

--Apple-Mail=_A1AE5B61-5AF5-4628-99F5-FA14A97DE84F--
