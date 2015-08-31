Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 08A7874197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 15:27:59 +0000 (UTC)
Received: by pabpg12 with SMTP id pg12so10080595pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=kLWuxe/2rhcbMcZsE0jP3sAJRt3lzoBsSPhexNfLoIs=;
	b=RhQJoh5uL8RFS3EITRjHqf346g0O7wgT+Gdllfv4Tzt0tuazPugj/x65p28IUG6DyZ
	EoNj9RuXJi5PZNW/D68Q0Y6WDLsyxf4xBn69eF55cS+PNzK3aohWszXmcUZQNpEeID/8
	LLN8w+2caLsZBt7pwSz6drsS/x2IwgWKg24l2bmyucRQC8dbBFS8vmt0r/juNYtRYHaV
	HI6saIoiCqpMudbXZ6sINSDrgH1Z7ik2fovOgXI3lvYi782qtrSGUqBFFFclZTJGn0P5
	0yfVPeek+f2vQoFvonlm4JNb7qIMPlUKTvOGXG4bIeWw9nxLwn1TUrX7+1J8ednqrphP
	EGpg==
X-Received: by 10.66.122.4 with SMTP id lo4mr38351700pab.1.1441034879463;
	Mon, 31 Aug 2015 08:27:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:8df8:418f:7121:2bf1?
	([2601:646:8601:4580:8df8:418f:7121:2bf1])
	by smtp.gmail.com with ESMTPSA id
	hv3sm14934726pbb.83.2015.08.31.08.27.58
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Aug 2015 08:27:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150831152103.GB2465@jama>
Date: Mon, 31 Aug 2015 08:27:54 -0700
Message-Id: <BC8B1BD5-224C-480C-BFC9-F2BA6B0254E9@gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
	<20150831152103.GB2465@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Mon, 31 Aug 2015 15:28:02 -0000
X-Groupsio-MsgNum: 70356
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DA861378-25CA-48A8-82DF-DF4634ECD2F2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DA861378-25CA-48A8-82DF-DF4634ECD2F2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 31, 2015, at 8:21 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Mon, Aug 31, 2015 at 10:22:31AM -0300, Otavio Salvador wrote:
>> On Sat, Aug 29, 2015 at 7:18 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Sat, 2015-08-29 at 10:43 +0200, Martin Jansa wrote:
>>>> Did you enable thumb in that qemuarm build?
>>>>=20
>>>>=20
>>>> It's disabled by default and multiple components are broken when =
you
>>>> enable it, see:
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717
>>>=20
>>> I'm going to draw a line here. People are asking that the old =
version of
>>> gmp be brought back due license issues, fine. It doesn't mean that =
all
>>> the bugs in said old release should be fixed.
>>>=20
>>> If thumb on arm with old gmp is an issue for people, I'd suggest =
that
>>> those people figure out which patches are needed and send the =
patches.
>>> Asking Jussi to deal with this isn't right/fair though.
>>=20
>> I disagree. If it will be merged it ought to support what we are
>> testing nowadays otherwise the backlog will be kept growing =
forever...
>=20
> FWIW: I don't mind getting it merged as is.
>=20
> It improves situation for non-GPLv3 builds and if there is issue with
> thumb, then it was there before as well, so returning it doesn't make
> things worse.
>=20
> My previous reply was just to show that building default qemuarm =
doesn't
> show anything, because thumb isn't enabled and gmp even isn't one of =
the
> recipes which are failing with thumb-1, maybe Khem meant some issues =
in
> runtime I don't know about.

It has issues working with thumb2 as well. Another problem it creates is =
building on-device toolchain
since gcc also depends on gmp and when you pin to older version of GMP, =
it starts to fail
Thats why I suggested to use mini-gmp ( same but reduced gmp ) can clear =
of this situation since it
will be a mini-gmp recipe and won=E2=80=99t interfere with toolchain.


--Apple-Mail=_DA861378-25CA-48A8-82DF-DF4634ECD2F2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXkcn0ACgkQuwUzVZGdMxREiACeMx7IAkhF2GH2U3E1cU2WjqcX
bUIAnRJMMG66nmBMTo16I88TqXZpFhRF
=zdtp
-----END PGP SIGNATURE-----

--Apple-Mail=_DA861378-25CA-48A8-82DF-DF4634ECD2F2--
