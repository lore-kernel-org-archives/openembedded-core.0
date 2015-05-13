Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 86EDB74000
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 15:59:04 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so55765028pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2JimYinbhCC8DlCpFMtE6aEWJolMyVFcCv6xo6qH7GI=;
	b=fCaKqzKbKh1InrDLHROyI+D8CWKgUSDWQh1En8wqFp2Q5E8VhfGa3zyfFRNZCo4IfV
	XXnJKei8qWy8HzGtAGXsfAoT+fLwURJcHSuCk1Lj6XjmQVzcqalWWGGuSuUzC7NHX8lY
	Nf0/JFjWRcqCZzzKJNEFZrKsVl/wUOX98FtrJs4ZpVcOljKWEGf4MThjE/jcdtCjW2tS
	9shS6PTNQtRRpKIycqHLr21D3ZjD3SNf219hURAmBwkDvcfQgV1/EqALTIGw8DNNMeqy
	aYilQsiKjIDqBY/45zF6ctFz/LDqrvI0k4Zoz7iKK8saVzwyKGEAKEnqeGVaO7pSjwj0
	j6Uw==
X-Received: by 10.68.210.46 with SMTP id mr14mr38567432pbc.73.1431532746292;
	Wed, 13 May 2015 08:59:06 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	pj8sm19760743pdb.20.2015.05.13.08.59.05
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 May 2015 08:59:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2966110.d7Dh0pOibD@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 13 May 2015 08:59:00 -0700
Message-Id: <DC766CA9-69D5-467F-AA03-914478EEB140@gmail.com>
References: <cover.1431411478.git.Qi.Chen@windriver.com>
	<187E6A9D-C952-418F-81BE-76D2E08AFDC3@gmail.com>
	<5552B696.8010100@windriver.com>
	<2966110.d7Dh0pOibD@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/2] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 13 May 2015 15:59:07 -0000
X-Groupsio-MsgNum: 65502
Content-Type: multipart/signed;
	boundary="Apple-Mail=_69961351-D454-4BB4-9F9C-433807BF99D4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_69961351-D454-4BB4-9F9C-433807BF99D4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 13, 2015, at 4:03 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Wednesday 13 May 2015 10:27:34 ChenQi wrote:
>> On 05/13/2015 09:56 AM, Khem Raj wrote:
>>>> On May 12, 2015, at 6:45 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>>>>=20
>>>> On 05/13/2015 12:19 AM, Khem Raj wrote:
>>>>>> On May 11, 2015, at 11:19 PM, Chen Qi <Qi.Chen@windriver.com> =
wrote:
>>>>>>=20
>>>>>> -	install
>>>>>> =
${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUN
>>>>>> E_PKGARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh
>>>>>> ${SDK_OUTPUT}/${SDKPATH} +	# find latest buildtools-tarball =
and
>>>>>> install it
>>>>>> +	buildtools_path=3D`ls -t1
>>>>>> =
${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUN
>>>>>> E_PKGARCH}-buildtools-nativesdk-standalone-*.sh | head -n1` +
> install
>>>>>> $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
>>>>>=20
>>>>> why not create a symink instead of poking using wild chars
>>>>=20
>>>> Because it's simpler.
>>>=20
>>> what happens if I touch an older installer ?
>>=20
>> Hi Khem,
>>=20
>> I make this patch to avoid installing a non-existent =
buildools-tarball.
>> If we touch an old buildtools-tarball, the installation would still
>> succeed. The touched one is installed.
>> What would lead to a potential problem is the following situation.
>> The user built buildtools-tarball, after one day, he modified key =
part
>> of buildtools-tarball recipe, rebuilt it, and then he deliberately
>> touched the old one, and then he built an ext SDK.
>> I don't think that's a situation we need to take care of.
>> But if you insist that we should, you can suggest a reasonable =
symlink
>> name and I would make a new patch.
>=20
> Honestly I don't see this is as being a problem we need to handle - =
who is
> going to touch this file during normal usage? Builds failing under the
> conditions described is a much more pressing issue at this point.
>=20

It has caused issues when we used such an approach for other artifacts
and debugging it was hard since we lost trackability with wildcads I was =
just sharing the experience. Ofcource
the issue at hand is always pressing thats why we are fixing it.

> It could be that we should re-visit whether using buildtools-tarball =
rather
> than having its contents be part of the native portion of the SDK is =
the right
> approach. I'm not sure that we need to do that just at this moment =
though.
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_69961351-D454-4BB4-9F9C-433807BF99D4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVTdMgACgkQuwUzVZGdMxR0JwCfTMIY24yKo0ozlDCQCeSU2VRU
jGkAniU3XJFsz/o4Zoy/dtdLDTiBcP6n
=H/m7
-----END PGP SIGNATURE-----

--Apple-Mail=_69961351-D454-4BB4-9F9C-433807BF99D4--
