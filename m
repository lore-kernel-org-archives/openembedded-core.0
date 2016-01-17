Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id AB63A60232
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:15:07 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id yy13so325780274pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=53g/X0azf6HU++20ZSLU1bKVhMRWSWkDbTFP5z5TCRY=;
	b=EhKr1U1ox81LOOQ3Jm6izZA9MUKAgcaAXaus4VHNFd5kMMyjQVc/V2/Q9n/M/iLPh/
	Tubmp3aXIdoUdvjzEGskw8xZdLvW3qEdc8f6snMpUoguASsf9WB9XWdvLVMyEsyXbOnW
	G6CtHbBgIDJFfcnkTtgGVUiEW91ifr900hqIj0JWvwVKCLKa4t7TEQIZdi3nbjKOZrVj
	LLGWBWn6wLgLPCSl+kKP7WhwZ1qzAVFUMZdlXZLkXd45CHONBoiheQCQSu9ORJdtsNjO
	yrQidg8LFk+cKjRKHdbr6AYAPeqQBM4aIVH17+M4c2zyW4cEpN8L8yB5QR0OULiMeARF
	wPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=53g/X0azf6HU++20ZSLU1bKVhMRWSWkDbTFP5z5TCRY=;
	b=VWcLAFLnPS6/G9stB4I91TmQVwimKel+5iK7FOiRaTaaqZbjbdCZ4p1UM2AfmXk2B1
	5trbKotWrtNhM+CTtxdx5e0JqJSXKBAxUT3DcTDya52xUzQKjZUoCuwv/jgRqTeNXq/k
	wO9tYgKl0aGvn/2SFLagutdL5TBF5APtAu4fQJfTBEjPwRIngJNWgtmPuGpuSGU0eGNJ
	SVAC3txYm2QtpP4wdCsr63ZUyg/Axm77ULwF0hp42cGDt4jdvqwqj1Lo5nF/BwPwR2f5
	L3NfIGZw9SF5dweTY45Fmq6l+gmqKMVH8n3Xu2bhcYF5B4P9Am64fC6DZy5PK4a55IGc
	A4kA==
X-Gm-Message-State: ALoCoQmKBit6aiX0IO4bPWuXP2Lbs6GYtJNwHpr/4mmp4ajpb+YEldTcXbDlZ/xGWVguSbMc9FgNCdINbes/BBdgfom6pqzWzQ==
X-Received: by 10.66.100.163 with SMTP id ez3mr28586329pab.5.1453029308779;
	Sun, 17 Jan 2016 03:15:08 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:551e:cfd2:447c:a7d1?
	([2601:646:8802:5d5c:551e:cfd2:447c:a7d1])
	by smtp.gmail.com with ESMTPSA id
	d21sm26758278pfj.32.2016.01.17.03.15.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Jan 2016 03:15:07 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452806554.26165.0.camel@pbcl.net>
Date: Sun, 17 Jan 2016 03:15:02 -0800
Message-Id: <65E1A109-DA9E-4697-BEFC-64737585B0A5@gmail.com>
References: <1441975783-21782-1-git-send-email-clopez@igalia.com>
	<1441983077.31676.17.camel@pbcl.net>
	<E1DF44AB-9219-4848-9031-60846FC2BF7B@gmail.com>
	<55F751DA.1020903@igalia.com>
	<3FF112F9-6E3D-4A9E-9A1D-AA30AF596FD6@gmail.com>
	<1452806554.26165.0.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-keyboard: Fix build failure with ld-is-gold
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
X-List-Received-Date: Sun, 17 Jan 2016 11:15:09 -0000
X-Groupsio-MsgNum: 76180
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2E71D137-6417-4F0B-B716-F681ACE85EBC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2E71D137-6417-4F0B-B716-F681ACE85EBC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 14, 2016, at 1:22 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> How does that patch help with this issue?  It seems to be adding ifunc
> support which isn't obviously related to the problem at hand.

Its not obvious but its related because now that ifunc support is =
available
to gold, it marks =E2=80=98longjmp=E2=80=99 as STT_GNU_IFUNC and is able =
to add a runtime
RELATIVE relocation for this symbol.


>=20
> p.
>=20
> On Thu, 2016-01-14 at 10:27 -0800, Khem Raj wrote:
>> Carlos
>>=20
>> Can you try this fix
>>=20
>> =
https://github.com/kraj/openembedded-core/commit/0e35ad5a35262cfb7a6249ce1=
58f76d1399d6cb4
>>=20
>>=20
>> This should help with this issue.
>>=20
>>=20
>>> On Sep 14, 2015, at 4:01 PM, Carlos Alberto Lopez Perez =
<clopez@igalia.com> wrote:
>>>=20
>>> On 14/09/15 09:24, Khem Raj wrote:
>>>>=20
>>>>> On Sep 11, 2015, at 7:51 AM, Phil Blundell <pb@pbcl.net> wrote:
>>>>>=20
>>>>> On Fri, 2015-09-11 at 14:49 +0200, Carlos Alberto Lopez Perez =
wrote:
>>>>>> * When ld-is-gold is enabled in DISTRO_FEATURES, =
matchbox-keyboard
>>>>>>  will fail to build with this error:
>>>>>>=20
>>>>>>  ld: error: matchbox-keyboard-image.o: requires unsupported =
dynamic
>>>>>>             reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
>>>>>=20
>>>>> This is only an issue for ARM (and only for Thumb2 at that).  I =
don't
>>>>> think it's necessarily appropriate to force -fPIC on all targets.
>>>>>=20
>>>>> Also, before adding this sort of hack it would be worth verifying
>>>>> whether this is in fact a toolchain bug and, if it is, fixing it =
there.
>>>>>=20
>>>>=20
>>>> This may not be a toolchain bug if there is a MOVW_ABS relocation =
being emitted
>>>> into an object that is eventually linked into shared library. Using =
-fPIC seems to be right fix
>>>> I know bfd linker silently ignored these relocations and generated =
bad .so files but that was fixed
>>>> several years ago. So I think what needs to be looked at is why =
does same .o links ok with bfd linker
>>>> is it some linker trampoline code thats in question here which may =
be different between gold and ld
>>>>=20
>>>> Carlos
>>>>=20
>>>> Can you check the linker cmdline of failing link step and see if =
its generating a shared object there ?
>>>> if thats the case and I assume gcc is generating this relocation =
into both
>>>>=20
>>>=20
>>> It looks is generating an executable (matchbox-keyboard).
>>>=20
>>> Full log: http://sprunge.us/VPIN
>>>=20
>>=20
>=20
>=20


--Apple-Mail=_2E71D137-6417-4F0B-B716-F681ACE85EBC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlabd7sACgkQuwUzVZGdMxRmjACgkhA1lzWvfOC9Wr2lmjDCkbvE
ch0An3ZJ0TyKL4z3k+6j9ORPoN9+cWL/
=NnB1
-----END PGP SIGNATURE-----

--Apple-Mail=_2E71D137-6417-4F0B-B716-F681ACE85EBC--
