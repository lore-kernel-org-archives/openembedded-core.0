Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 04B6B6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:39:05 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id h186so29136746pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=qrkCH5AI6m26Q4cTNMWETQY17H5LYg2S2Sk5jGuO4YM=;
	b=ie7MgGxI+r+FNWOrzL30y3K16/SNghaG5iOFNhXOHd9D1YnBK4PdG5UhZwvdbZVIKI
	yjRFJF8nP63Nc7Y0aTPPQFNcd2R7bhA6lLuzSeY7FRm/W84WF0N6u1vpN8p9cBvM1hp8
	6NjqJ2OoYBqh+StJoFDMqAIvSAYxC1mRgxohNLfiqtr9MWpKg1hyZPgxdnhAUu7WHoWA
	IYkp4hO83l+kKcz8mQb/zijk6hgvokbAwPP5rYItALROPQf5RZQdAP5/jnGt6rpxGeW4
	RKirvmx+6T1RK/IHwb5gMCf9KdmfPDA0iLPET9ki31uG9HR8ac7IIzxo7I0S8CAn6C0/
	thGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qrkCH5AI6m26Q4cTNMWETQY17H5LYg2S2Sk5jGuO4YM=;
	b=B4KwYdR73kaTT8JqxTzGedTFXJnR2Az0NrblsafaPQFKWht08LAH/r5nY+vB73Cn2E
	011Qpi0F84pyoYAUBm72L/wIRLEfo00oe0tX8BlfRhpUusTXDd6y+GHPhToS3v/fPJF4
	vMGjnJDkLEFH6EVkPV4YzGacYIM6TyU165gRdAXzyGbFqYJyRRJy/sY//b2QDcRH6Q1S
	2tUPwySm7ez8SZSaTbm74tlJcYkAsAbAjEqrZo5S5fsQ2vFs0FbCUw25XY1JRx6CRY2X
	fDiBpQ4P02445kAd4oJ9R3yEmumVMaHbrD317GNCkXl68so4dC+8RLrQwOcGhUPD2/fR
	v1Cg==
X-Gm-Message-State: AEkoouslqa1/MDkV2yEvwlzzA79dBEkuCK5NlyjlujD1D0L/ztYHpRP7wCN4oklzNuKQ4g==
X-Received: by 10.98.14.72 with SMTP id w69mr7963849pfi.119.1471365546552;
	Tue, 16 Aug 2016 09:39:06 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8111:5203:81eb:cf56?
	([2601:647:4c00:3edf:8111:5203:81eb:cf56])
	by smtp.gmail.com with ESMTPSA id p9sm40596246pfj.3.2016.08.16.09.39.05
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 09:39:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAFkk2KSVc3rqAieBHzkayJQT7YHxJhYoD0PSqp-YFL0CYMLkvg@mail.gmail.com>
Date: Tue, 16 Aug 2016 09:39:05 -0700
Message-Id: <92B4EF25-FE41-4310-B78A-554EA37BF507@gmail.com>
References: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
	<CAFkk2KRY=fWTOSUbxV_gm-np9r=4JBrsQ+Zy0FZb0H4Gbhfd+A@mail.gmail.com>
	<alpine.LFD.2.20.1608161147270.9338@ca624034.mitel.com>
	<CAFkk2KSVc3rqAieBHzkayJQT7YHxJhYoD0PSqp-YFL0CYMLkvg@mail.gmail.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: subtle weirdness when you combine "_append" with "+="?
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
X-List-Received-Date: Tue, 16 Aug 2016 16:39:06 -0000
X-Groupsio-MsgNum: 85795
Content-Type: multipart/signed;
	boundary="Apple-Mail=_167DB251-6462-429E-881A-6BA89832BD62";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_167DB251-6462-429E-881A-6BA89832BD62
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 16, 2016, at 8:56 AM, Ulf Magnusson <ulfalizer@gmail.com> =
wrote:
>=20
> On Tue, Aug 16, 2016 at 5:49 PM, Robert P. J. Day =
<rpjday@crashcourse.ca> wrote:
>> On Tue, 16 Aug 2016, Ulf Magnusson wrote:
>>=20
>>> On Tue, Aug 16, 2016 at 4:02 PM, Robert P. J. Day =
<rpjday@crashcourse.ca> wrote:
>>>>=20
>>>>  was about to submit a small number of patches to clean up =
redundancy
>>>> when people combine "_append" with "+=3D" (because it offends my
>>>> delicate sensibilities), and ran across this in oe-core,
>>>> unfs3_0.9.22.r497.bb:
>>>>=20
>>>>  DEPENDS_append_class-nativesdk +=3D "flex-nativesdk"
>>>>=20
>>>> uh, what?
>>>>=20
>>>>  most of the time, i assume the above doesn't hurt, it's just ...
>>>> silly. but normally, with "_append", you *need* to add the leading
>>>> space explicitly, and that's not being done above. so does that =
mean
>>>> that combining "_append" with "+=3D" *does* generate a leading =
space?
>>>> that just makes my head hurt -- the possibility that "_append" is
>>>> being used in a way that normally makes it fail, only to have "+=3D"
>>>> step in and save the day. at which point "_append" saves processing
>>>> that until the end of parsing? yeesh.
>>>>=20
>>>>  thoughts?
>>>=20
>>> By the point the +=3D is handled, the override won't have been =
interpreted
>>> yet. My guess is that +=3D fetches the value of the variable
>>> "DEPENDS_append_class-nativesdk", gets back the empty string, and
>>> adds a space followed by "flex-nativesdk" to that.
>>>=20
>>> The resulting " flex-nativesdk" is then interpreted as usual when =
the
>>> overrides are handled.
>>>=20
>>> You might like the note I added to
>>> =
https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-man=
ual.html#override-style-operation-advantages
>>> by the way. :)
>>=20
>>  that note is pretty much what i've been whining about for a long
>> time. :-) in any event, when one sees something like the above:
>=20
> The intent of the note was to discourage use of '+=3D' together with =
_append,
> because it's redundant and potentially confusing. Do you think it =
fails
> (even in context)? :/

the _append/_prepend in conjunction with +=3D is a undocumented behavior
however, I do not see it as much a side effect. But in future bitbake =
may
silently change its behavior, so I agree its always good to stay in safe
waters.

>=20
>>=20
>>  DEPENDS_append_class-nativesdk +=3D "flex-nativesdk"
>>=20
>> what is the *proper* cleanup?
>=20
> I'd say the following:
>=20
> DEPENDS_append_class-nativesdk =3D " flex-nativesdk"
>=20
> Cheers,
> Ulf
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_167DB251-6462-429E-881A-6BA89832BD62
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlezQakACgkQuwUzVZGdMxTucwCeP9bG5WLwQcGL8IbqmECSXxGd
t3IAoI/RA8CD2vTsYbynTF+qxgJLdosq
=5gTn
-----END PGP SIGNATURE-----

--Apple-Mail=_167DB251-6462-429E-881A-6BA89832BD62--
