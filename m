Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A13BB782F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 18:57:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id t86so5223849pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 11:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Ilbx/oRumLB10XJpMN5ERj+w3GhlS647UVWRufnYcEY=;
	b=dJLLNB2N48mmIX/5l4Jt5qF8PuB2ZjCwerLGy+qDgzOm+c1T9RBOAaCnDVlcNEEU/Z
	mwCuBBWrylM/6md95z6rZs5kAp1ZZMP0B0CSqcY04PMsFe2gVrodV9TICtFvxPALMNyH
	XjMWgiFtveFWFntwdXV2sFBLo3GOcKhwmlsc917b604TumcpZvK+f1/hPumt+0zweclO
	kcMUisD6BgWOjSe2nmILZAqhsRUd+C5ke+JoIdyU4iqAQr0zhHMJgoZ8MRiJk+906w65
	qy1OVP7uw/Miq3G64S7B/NvkvnlE9IY4FIyNWStctNO7YC+mLXWt7d6G7RWxhxQYqMma
	WVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Ilbx/oRumLB10XJpMN5ERj+w3GhlS647UVWRufnYcEY=;
	b=D1I4nOfLMa5plpGAblxGLENPkoUTlGnNL9q8PHAhRAHlavFnRmyt9S4quxpqZ1uA0L
	LTxB0Kn1vCRkpAeoFooLKU4ObZ2bML0GWgee1Uy/ngz5B6dudvbXibWyrPo2D2uLHAs/
	yKsEf2/g/vhdOAYZJdFRsUkbqLKPlwwV86jKiaKjVUGsh5pD+YoqnUq4MIdjmI0FvB5S
	zWNgsesH74cQ8g5VLlc3os3YMB3jrfzO5RiSHFJCk5jMLr9Ag7KUoht/XqEexw2NVPte
	gqgMJZyW+TPEJcnVc1fDdOIuD31QVG5nHmKzZ09dVj2WS/aGwj1FeCVef6AwY0DvAGu3
	xbgg==
X-Gm-Message-State: AIVw1100yTVg8CBQZOBVSCl0KEDt4ORX5IACmBD3K1MGbXWaHbEWpbfA
	mQgCjvz68u7kt9TFbG4=
X-Received: by 10.98.58.210 with SMTP id v79mr16718645pfj.162.1501527432341;
	Mon, 31 Jul 2017 11:57:12 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:30be:1361:6ee4:77cc])
	by smtp.gmail.com with ESMTPSA id
	b16sm57677683pfm.84.2017.07.31.11.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 11:57:11 -0700 (PDT)
To: rpjday@crashcourse.ca, Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
	<ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
	<1501498850.18633.1.camel@linuxfoundation.org>
	<20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <37a603ae-32a7-3126-680a-cf5f6bf4a575@gmail.com>
Date: Mon, 31 Jul 2017 11:57:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:55.0)
	Gecko/20100101 Thunderbird/55.0
MIME-Version: 1.0
In-Reply-To: <20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: worth adding a "git"-versioned of i2c-tools to oe-core?
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
X-List-Received-Date: Mon, 31 Jul 2017 18:57:11 -0000
X-Groupsio-MsgNum: 100949
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="v2mHIMBeRTN2LToPlmt3HbmwDEBJGNmm2"

--v2mHIMBeRTN2LToPlmt3HbmwDEBJGNmm2
Content-Type: multipart/mixed; boundary="o3KGDIacabbFBeWc7Hj763RUk2TsQ3Ck4";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: rpjday@crashcourse.ca, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <37a603ae-32a7-3126-680a-cf5f6bf4a575@gmail.com>
Subject: Re: [OE-core] worth adding a "git"-versioned of i2c-tools to oe-core?
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
 <ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
 <1501498850.18633.1.camel@linuxfoundation.org>
 <20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
In-Reply-To: <20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>

--o3KGDIacabbFBeWc7Hj763RUk2TsQ3Ck4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/31/17 4:15 AM, rpjday@crashcourse.ca wrote:
>=20
> Quoting Richard Purdie <richard.purdie@linuxfoundation.org>:
>=20
>> On Mon, 2017-07-31 at 13:41 +0300, Alexander Kanavin wrote:
>>> On 07/31/2017 01:41 PM, rpjday@crashcourse.ca wrote:
>>> >
>>> >
>>> > =C2=A0=C2=A0=C2=A0given that some significant changes have been mad=
e to i2c-tools
>>> > since
>>> > version 3.1.2, is it worth adding a git-versioned recipe of that
>>> > to=C2=A0
>>> > oe-core,
>>> > and using DEFAULT_PREFERENCE to force people to select it if they
>>> > want it?
>>> > in particular, the code base has been restructured, and a new
>>> > utility,
>>> > "i2ctransfer", has been added.
>>> It's better to ask the upstream to make a new release.
>>>
>>> We've had dual git/release recipes in the past, and they were all an=C2=
=A0
>>> utter failure. In the sense, that only one version of the recipe was=C2=
=A0
>>> maintained, and the other was completely neglected.
>>
>> Going forward we may accept patches using this instead:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/devupstrea=
m.bbclass
>>
>>
>> Cheers,
>>
>> Richard
>=20
> =C2=A0 well, here's a possible conundrum ... in that same package (i2c-=
tools),
> there appears to be an *obvious* flaw in that the "eeprog" utility uses=
 a
> sleep that is far too short for proper operation, as described here:
>=20
> https://www.toradex.com/community/questions/10243/write-issue-with-eepr=
og-in-eeprom.html
>=20
>=20
> there is a link to a patch on that page that simply cranks up a few sle=
ep
> calls from 10usec to 5msec, which apparently solves the problem. i've b=
een
> involved in a discussion on the i2c-tools mailing list about this very
> issue after i tripped over it, but there seems to be little enthusiasm =
on
> that list for "fixing" this -- i was told that people use the kernel dr=
iver
> instead and access via /sys rather than calling "eeprog"
>=20
> =C2=A0 so, from my perspective, this should definitely be fixed so that=
 "eeprog"
> functions properly, but it's not clear upstream is all that interested
> in it.
> what would the protocol be here?

usually, sending it upstream at same time when its proposed here for OE
is best. Then you can discuss it with upstream on sides, if upstream
does not want a patch, that creates some maintenance debt for future
upgrades but such is life.

>=20
> rday
>=20
>=20


--o3KGDIacabbFBeWc7Hj763RUk2TsQ3Ck4--

--v2mHIMBeRTN2LToPlmt3HbmwDEBJGNmm2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAll/fYUACgkQuwUzVZGdMxR7qACgjK12J7Z2i/Mv9ABnazulUN5s
X+4AnRyJ5vghlErY02EMffQ9CSeKuq6y
=75rb
-----END PGP SIGNATURE-----

--v2mHIMBeRTN2LToPlmt3HbmwDEBJGNmm2--
