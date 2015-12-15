Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7B86FFEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 20:43:51 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id ur14so10767507pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=hDeY7Q81jyzGtrmMThadDRqnE3ffl/Rw+JYQsmXEEts=;
	b=j7iBL9057f/NI3VU7nQsUAcZt9fjS5eavkehS9eNkqki5de9rBsTMBsBElB4pauU67
	NphdErQfB3wfJq4zJA85aA/0aS5Qye28Z68reBYzRQnpoDV6SU25xgR4G+kB58m3xq61
	iweNOBZp+M01Le/3+vk8SRGpz5YUNR1HQZ2BhonuZAbVv0vBFyqC0ipb4WITiZLILAF5
	6gIb2IskNXRv2bvs0aB4nga0n7NiYE+YhFjj9bUa2V1hDxmhZC+QbS75GSK2IUd5dPcN
	Y+C1yW4FnAMjgoJ6OD/yZLK7m3QYVknB1ClbZvPeodq9BnXwyZbgZ7Qdum0vZ0cbezwX
	N/xQ==
X-Received: by 10.66.142.168 with SMTP id rx8mr57171677pab.16.1450212232509;
	Tue, 15 Dec 2015 12:43:52 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:64bc:1b2d:d1f1:3ede?
	([2601:646:8802:5d5c:64bc:1b2d:d1f1:3ede])
	by smtp.gmail.com with ESMTPSA id wi3sm4269024pab.2.2015.12.15.12.43.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 12:43:51 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <4098937.xBsQpXnxS0@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 15 Dec 2015 12:43:46 -0800
Message-Id: <775EDF49-40CC-432D-861A-0A67CA0630CD@gmail.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<2403291.KqQCZxqk2K@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=XkgyYditMnijXxWbQxqFMT-XR_-EZUOyLL17i=DcuGJg@mail.gmail.com>
	<4098937.xBsQpXnxS0@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 15 Dec 2015 20:43:54 -0000
X-Groupsio-MsgNum: 74808
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0D82BE6D-32E4-4CE2-B9A7-4F87BA49E07B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0D82BE6D-32E4-4CE2-B9A7-4F87BA49E07B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 15, 2015, at 12:16 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Tue, 15 Dec 2015 12:07:48 Andre McCurdy wrote:
>> On Tue, Dec 15, 2015 at 9:26 AM, Paul Eggleton
>>=20
>> <paul.eggleton@linux.intel.com> wrote:
>>> On Tue, 15 Dec 2015 17:28:59 Alexander Kanavin wrote:
>>>> On 12/15/2015 05:25 PM, Martin Jansa wrote:
>>>>>> +COMPATIBLE_HOST =3D =
'(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>>>>>> +COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>>>>=20
>>>>> Can you add armv7ve as well?
>>>>=20
>>>> Armv7ve support is not yet in master, so you'll have to add it =
later I'm
>>>> afraid.
>>>=20
>>> I think by policy we don't have any restrictions on =
architecture-specific
>>> flags in OE-Core (at least, assuming they're reasonable).
>>=20
>> If we're going to duplicate all _armv7a over-rides for _armv7ve then
>> I'd vote to do so in a single patch series which fixes up the whole =
of
>> oe-core rather than adding the over-rides one at a time amongst
>> version updates etc.
>=20
> Makes sense, but before doing that would it make sense to have a =
grouping
> override for all of them that can be used instead (where appropriate)?
>=20

stepping back a step. What so different about armv7ve that it needs to =
be a separate arch
its just virtual extensions on top of armv7a, so any override pertaining =
to armv7a should
be valid for it well. Can you work towards making it so ?

> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0D82BE6D-32E4-4CE2-B9A7-4F87BA49E07B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZwe4YACgkQuwUzVZGdMxSrOQCgjd8RfaCcutTitQ6V0fG4hzUK
CM4An2UeuENWGgep7S8Jl4HbDDjy7jVg
=/2os
-----END PGP SIGNATURE-----

--Apple-Mail=_0D82BE6D-32E4-4CE2-B9A7-4F87BA49E07B--
