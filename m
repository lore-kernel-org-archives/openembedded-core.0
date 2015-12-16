Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 403B76FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 01:50:18 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id e66so3478329pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 17:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0JZ8M/6MnAS0ypHfaNlXAof9Gvnud0ks8tpHOAOQq9I=;
	b=ovxj9AxPR0zVhK7AdVag3TFRoJIVSLzEJfkb7EAzUGn0wCtRmd0NEIXw07BMx0/wSE
	ueh+dH5wQ+yfVTnveUVp23fv9b3Y3soL+k8sTs4T1fsYlqY5c/rRtqH0A8g0uW3pW2Vg
	7OWIzYM849LFVNJlJ1pdkXuk29DO3/2cpIGzFZEuC97MPgT/5RkVQhOaztWQCiITY9G1
	XDjKoLanRYAarWcVnSt5X3wK34KhHIKWOo3c+J3O7lRba9/2UKnjtoKDZZ00Ol45t69A
	rrPhYvd2NBRi7lGCPxrZhvUcr9IP+7J+R5sNLHwI6jLGhGMJbZAAHcFkvqmvqtS3+NWS
	Akmw==
X-Received: by 10.98.15.74 with SMTP id x71mr1588460pfi.125.1450230619627;
	Tue, 15 Dec 2015 17:50:19 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:3895:946d:2903:4be0?
	([2601:646:8802:5d5c:3895:946d:2903:4be0])
	by smtp.gmail.com with ESMTPSA id o2sm5022976pap.31.2015.12.15.17.50.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 17:50:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=VS6YFtG_aoC-4UXsqdaEJV=iAoSSgcXU-8CMthj=XErg@mail.gmail.com>
Date: Tue, 15 Dec 2015 17:50:16 -0800
Message-Id: <1D1960D0-C68B-4709-9A7B-AC761F8A0647@gmail.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<2403291.KqQCZxqk2K@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=XkgyYditMnijXxWbQxqFMT-XR_-EZUOyLL17i=DcuGJg@mail.gmail.com>
	<4098937.xBsQpXnxS0@peggleto-mobl.ger.corp.intel.com>
	<775EDF49-40CC-432D-861A-0A67CA0630CD@gmail.com>
	<CAJ86T=VS6YFtG_aoC-4UXsqdaEJV=iAoSSgcXU-8CMthj=XErg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Wed, 16 Dec 2015 01:50:19 -0000
X-Groupsio-MsgNum: 74816
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F285B19F-E44C-472F-8AF2-4DF33314DE43";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F285B19F-E44C-472F-8AF2-4DF33314DE43
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 15, 2015, at 2:27 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Tue, Dec 15, 2015 at 12:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Dec 15, 2015, at 12:16 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>>>=20
>>> On Tue, 15 Dec 2015 12:07:48 Andre McCurdy wrote:
>>>> On Tue, Dec 15, 2015 at 9:26 AM, Paul Eggleton
>>>>=20
>>>> <paul.eggleton@linux.intel.com> wrote:
>>>>> On Tue, 15 Dec 2015 17:28:59 Alexander Kanavin wrote:
>>>>>> On 12/15/2015 05:25 PM, Martin Jansa wrote:
>>>>>>>> +COMPATIBLE_HOST =3D =
'(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>>>>>>>> +COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>>>>>>=20
>>>>>>> Can you add armv7ve as well?
>>>>>>=20
>>>>>> Armv7ve support is not yet in master, so you'll have to add it =
later I'm
>>>>>> afraid.
>>>>>=20
>>>>> I think by policy we don't have any restrictions on =
architecture-specific
>>>>> flags in OE-Core (at least, assuming they're reasonable).
>>>>=20
>>>> If we're going to duplicate all _armv7a over-rides for _armv7ve =
then
>>>> I'd vote to do so in a single patch series which fixes up the whole =
of
>>>> oe-core rather than adding the over-rides one at a time amongst
>>>> version updates etc.
>>>=20
>>> Makes sense, but before doing that would it make sense to have a =
grouping
>>> override for all of them that can be used instead (where =
appropriate)?
>>>=20
>>=20
>> stepping back a step. What so different about armv7ve that it needs =
to be a separate arch
>> its just virtual extensions on top of armv7a, so any override =
pertaining to armv7a should
>> be valid for it well. Can you work towards making it so ?
>=20
> Trying to create a common over-ride for both might end up causing more
> trouble in the long run.

what problem do you foresee.?


> Perhaps it would instead make sense just to
> try to remove some the _armv7a over-rides currently used in oe-core
> (and meta-oe)? There aren't that many and some of them look a little
> dubious or at least out of date and in need of a review.
>=20
> For example for valgrind, we could blacklist armv4, armv5 and armv6
> rather than whitelisting armv7a. The pixman recipe is assuming armv7a
> is a reliable way to determine NEON support, which it isn't. The libav
> recipes are using _armv7a to force some dubious looking optimisations.
> Forcing the bfd linker in DirectFB doesn't need to be architecture
> specific, etc. The only genuinely valid looking usage of the armv7a
> over-ride seems to be gcc-configure-common.

This patch here =
https://www.sourceware.org/ml/binutils/2013-11/msg00103.html
tells me that armv7e should really be triggering on armv7a as well for =
all purposes


>=20
>>> Cheers,
>>> Paul
>>>=20
>>> --
>>>=20
>>> Paul Eggleton
>>> Intel Open Source Technology Centre
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_F285B19F-E44C-472F-8AF2-4DF33314DE43
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZww1sACgkQuwUzVZGdMxQjlACfa9aFluS79EcaSo9Di+ms/o1I
r1QAnRHYWlvWHYOyII4MJtFlIlIY+sg3
=pD1j
-----END PGP SIGNATURE-----

--Apple-Mail=_F285B19F-E44C-472F-8AF2-4DF33314DE43--
