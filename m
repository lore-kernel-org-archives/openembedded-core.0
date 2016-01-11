Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1757317F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 19:10:41 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id yy13so232981238pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 11:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=oLUkxA6eApWexrgemHOByfAHB4DMZbBQ6VGcQqtbPCg=;
	b=ZVIy64QgLMFFeTeWgDvlRzSwdLe8VeW9xbqXYX5HMTyfdh6zB2+rZjO0zXQ/h4jPum
	uicv/hKFmVdbvakW25l3loSwtBMfZLcQLGlArRGOZSNcgbNlUjMjI5oFgbWt1rJR1y4Q
	zGRHe/ObPwjaS0XVY8oHHydek5YgU2PrBBj8A0vNhDtWynEq52ogQcpPPiShmoWDsmON
	JbXPU4MQOGH6hGlEylhyO9r/omRj2qnM67JVwK3uoXVPMoJe6WF2kakpzKkSZECmdckg
	YXD2YtbcvS1SUWPrGT1xxB+qciB8gNKdK+fWt7niy5ENXcT41rSrfWhxvccIf2/HQW6Y
	3V+w==
X-Received: by 10.66.161.227 with SMTP id xv3mr10344226pab.117.1452539441862; 
	Mon, 11 Jan 2016 11:10:41 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	m87sm24962570pfi.47.2016.01.11.11.10.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 11:10:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=VQdAB9dRRb4c_XmFOO+BxH13ar=-Fi209Z59Ry6zVy1w@mail.gmail.com>
Date: Mon, 11 Jan 2016 11:10:36 -0800
Message-Id: <4A8643CE-5D1C-45E5-8E89-891B18CDE7A6@gmail.com>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
	<20160108170054.GB2573@jama>
	<CAJ86T=VQdAB9dRRb4c_XmFOO+BxH13ar=-Fi209Z59Ry6zVy1w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Mon, 11 Jan 2016 19:10:44 -0000
X-Groupsio-MsgNum: 75864
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C0FBCE4F-4A3D-422E-B067-4ED9973A986B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C0FBCE4F-4A3D-422E-B067-4ED9973A986B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 8, 2016, at 10:24 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Fri, Jan 8, 2016 at 9:00 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> On Fri, Jan 08, 2016 at 08:24:36AM -0800, Andre McCurdy wrote:
>>> On Fri, Jan 8, 2016 at 4:44 AM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>>>> * in all cases we currently have we consider armv7ve to be =
compatible with armv7a
>>>=20
>>> Is this a short term workaround or a long term solution?
>>=20
>> It's just RFC for discussion.
>>=20
>>> If it's a long term solution then how will armv7m and armv7r be
>>> handled? They are likely to need to duplicate a lot of the current
>>> armv7a over-rides too.
>>=20
>> armv7a and armv7ve are much closer than armv7a and armv7m or armv7r =
as
>> Khem said in earlier discussion.
>=20
> I'm not sure what the definition of "close" is here. An armv7a CPU can
> not run armv7ve binaries.
>=20
> Saying armv7a and armv7ve are close is like saying armv4 and armv5 are
> close. True in some respects, but they don't define each other's
> over-rides.

What I was trying to say is that code generated for ARMv7a would run =
just fine on armv7ve while
ISAs were not incremental between m and r variants.

So I was asking was what improvements do we get if we choose armv7ve as =
tune
and I did not get any definitive answers. Why shouldnt we keep using =
armv7-a
and tune the handful of apps to armv7ve where it is required. In this =
case it becomes
less attractive to add yet another tune. We should strive to reduce this =
tuning mayhem
on arm especially.


>=20
>> And maybe it's because fewer people use
>> armv7[rm], but currently these 2 aren't used anywhere as overrides =
(in
>> layers I've in world builds).
>>=20
>>> Maybe adding a generic "armv7" over-ride which can be enabled by all
>>> armv7 variants is a better option?
>>=20
>> Maybe, but that will change how armv7r and armv7m are currently =
built, I
>> cannot say if for better or worse, I don't use either.
>=20
> I doubt that armv7m or armv7r are buildable at all. Perhaps we should
> drop the tune-cortexm1.inc, tune-cortexm3.inc and tune-cortexr4.inc
> files completely and stop pretending that they might work?
>=20
>>> Either way, I'd like to continue cleaning up of the existing armv7a
>>> over-rides (e.g. the libav armv7a specific optimisation is likely
>>> bogus and should be removed, etc).
>>>=20
>>>=20
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> ---
>>>> meta/conf/machine/include/arm/arch-armv7ve.inc | 3 ++-
>>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc =
b/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>> index 79e1ef6..d0fdff7 100644
>>>> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>> @@ -3,7 +3,8 @@ DEFAULTTUNE ?=3D "armv7ve"
>>>> TUNEVALID[armv7ve] =3D "Enable instructions for ARMv7ve"
>>>> TUNECONFLICTS[armv7ve] =3D "armv4 armv5 armv6 armv7 armv7a"
>>>> TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', =
' -march=3Darmv7ve', '', d)}"
>>>> -MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', =
'armv7ve', 'armv7ve:', '' ,d)}"
>>>> +# In all cases we currently have we consider armv7ve to be =
compatible with armv7a
>>>> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', =
'armv7ve', 'armv7ve:armv7a:', '' ,d)}"
>>>>=20
>>>> require conf/machine/include/arm/arch-armv6.inc
>>>> require conf/machine/include/arm/feature-arm-neon.inc
>>>> --
>>>> 2.7.0
>>>>=20
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C0FBCE4F-4A3D-422E-B067-4ED9973A986B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaT/jAACgkQuwUzVZGdMxQHYQCeKgaN/N6U7fWYxNwX7Uw9CDUv
7K0An3bnI7dMhCXoXGPraZWGvIxwIkYw
=KEYq
-----END PGP SIGNATURE-----

--Apple-Mail=_C0FBCE4F-4A3D-422E-B067-4ED9973A986B--
