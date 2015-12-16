Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id AE54373173
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 05:03:09 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id 68so5861148pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 21:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Y5t33rT/6tiWdN/KWMJd5+pmYwJK4HysrXbAgPHY+qQ=;
	b=ZqqC+vug5dgqWxXwxDaTcDb6DUltpuy2jcdMYcO1j3c2w4qnGoMnpv4yQAC+n2ER0S
	/LaS0SLNGR9kIM4IrN5/3nm4aPDTO+QyzfZftu/RKrrMijwAL8Pr9F2O1X/zOhiK6UbG
	pW5Mpo6g5cx4mDQEQgq+WG5LZpX1kh71ZzdLSIv4OxeC1bPysYiEOzwWsLh8aQde67l6
	0yOeVbTm3x1VoLaaxE4sFNnlBv7WP5Q8ky3QvimrmJjxmFMiwrgJAfGErzExgAA48cIj
	q8SLtB2lZjblGl07wsw0dWgxV8HVGvy/VseCQGNjF4qHppMGs7Fh98QbAdEi5u3kteLe
	kg5w==
X-Received: by 10.98.15.74 with SMTP id x71mr2549689pfi.125.1450242190465;
	Tue, 15 Dec 2015 21:03:10 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:45c:343a:fa23:638a?
	([2601:646:8802:5d5c:45c:343a:fa23:638a])
	by smtp.gmail.com with ESMTPSA id 72sm1435105pfq.89.2015.12.15.21.03.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 21:03:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=XKOmkQLD5XLL_AffbnTMbyXMys1KTdAeA965RaAXL+TA@mail.gmail.com>
Date: Tue, 15 Dec 2015 21:03:04 -0800
Message-Id: <8403822D-2F63-44C1-A8E3-13BAA6B6E8BC@gmail.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<2403291.KqQCZxqk2K@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=XkgyYditMnijXxWbQxqFMT-XR_-EZUOyLL17i=DcuGJg@mail.gmail.com>
	<4098937.xBsQpXnxS0@peggleto-mobl.ger.corp.intel.com>
	<775EDF49-40CC-432D-861A-0A67CA0630CD@gmail.com>
	<CAJ86T=VS6YFtG_aoC-4UXsqdaEJV=iAoSSgcXU-8CMthj=XErg@mail.gmail.com>
	<1D1960D0-C68B-4709-9A7B-AC761F8A0647@gmail.com>
	<CAJ86T=XKOmkQLD5XLL_AffbnTMbyXMys1KTdAeA965RaAXL+TA@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Dec 2015 05:03:14 -0000
X-Groupsio-MsgNum: 74819
Content-Type: multipart/signed;
	boundary="Apple-Mail=_32045BC6-04C6-4C21-9875-6D126CE6B6F7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_32045BC6-04C6-4C21-9875-6D126CE6B6F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 15, 2015, at 7:11 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Tue, Dec 15, 2015 at 5:50 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Dec 15, 2015, at 2:27 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> On Tue, Dec 15, 2015 at 12:43 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>=20
>>>>> On Dec 15, 2015, at 12:16 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>>>>>=20
>>>>> On Tue, 15 Dec 2015 12:07:48 Andre McCurdy wrote:
>>>>>> On Tue, Dec 15, 2015 at 9:26 AM, Paul Eggleton
>>>>>>=20
>>>>>> <paul.eggleton@linux.intel.com> wrote:
>>>>>>> On Tue, 15 Dec 2015 17:28:59 Alexander Kanavin wrote:
>>>>>>>> On 12/15/2015 05:25 PM, Martin Jansa wrote:
>>>>>>>>>> +COMPATIBLE_HOST =3D =
'(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>>>>>>>>>> +COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>>>>>>>>=20
>>>>>>>>> Can you add armv7ve as well?
>>>>>>>>=20
>>>>>>>> Armv7ve support is not yet in master, so you'll have to add it =
later I'm
>>>>>>>> afraid.
>>>>>>>=20
>>>>>>> I think by policy we don't have any restrictions on =
architecture-specific
>>>>>>> flags in OE-Core (at least, assuming they're reasonable).
>>>>>>=20
>>>>>> If we're going to duplicate all _armv7a over-rides for _armv7ve =
then
>>>>>> I'd vote to do so in a single patch series which fixes up the =
whole of
>>>>>> oe-core rather than adding the over-rides one at a time amongst
>>>>>> version updates etc.
>>>>>=20
>>>>> Makes sense, but before doing that would it make sense to have a =
grouping
>>>>> override for all of them that can be used instead (where =
appropriate)?
>>>>>=20
>>>>=20
>>>> stepping back a step. What so different about armv7ve that it needs =
to be a separate arch
>>>> its just virtual extensions on top of armv7a, so any override =
pertaining to armv7a should
>>>> be valid for it well. Can you work towards making it so ?
>>>=20
>>> Trying to create a common over-ride for both might end up causing =
more
>>> trouble in the long run.
>>=20
>> what problem do you foresee.?
>=20
> Just the potential for confusion really. Also wondering what will
> happen if/when people start to seriously use armv7r and armv7m. Should
> they also try to share an over-ride with armv7a ?

=E2=80=98r' and =E2=80=98m=E2=80=99 are different at ISA level not the =
case with =E2=80=98ve'

>=20
>>> Perhaps it would instead make sense just to
>>> try to remove some the _armv7a over-rides currently used in oe-core
>>> (and meta-oe)? There aren't that many and some of them look a little
>>> dubious or at least out of date and in need of a review.
>>>=20
>>> For example for valgrind, we could blacklist armv4, armv5 and armv6
>>> rather than whitelisting armv7a. The pixman recipe is assuming =
armv7a
>>> is a reliable way to determine NEON support, which it isn't. The =
libav
>>> recipes are using _armv7a to force some dubious looking =
optimisations.
>>> Forcing the bfd linker in DirectFB doesn't need to be architecture
>>> specific, etc. The only genuinely valid looking usage of the armv7a
>>> over-ride seems to be gcc-configure-common.
>>=20
>> This patch here =
https://www.sourceware.org/ml/binutils/2013-11/msg00103.html
>> tells me that armv7e should really be triggering on armv7a as well =
for all purposes
>>=20
>>>=20
>>>>> Cheers,
>>>>> Paul
>>>>>=20
>>>>> --
>>>>>=20
>>>>> Paul Eggleton
>>>>> Intel Open Source Technology Centre
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_32045BC6-04C6-4C21-9875-6D126CE6B6F7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZw8IwACgkQuwUzVZGdMxRd4gCfYyGA3wdd4NRhP2gdJxJ1fnV6
oQAAnjMKh7jmnFEGTnpvSCp0JvjWRmL2
=IAC5
-----END PGP SIGNATURE-----

--Apple-Mail=_32045BC6-04C6-4C21-9875-6D126CE6B6F7--
