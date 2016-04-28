Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE16731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 16:35:29 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 206so35846983pfu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=XSAjMd4DFXFqjWbCcvbnoEVeTnxIV26bhrCsxWbwdIo=;
	b=ajkdoTDkjLfQEPBN3KUTEfZg7O9gAYrJv+c6u6VerS0s5UPRI0ssQGuSDdOLiWAWxm
	jp+/zDxqXkhGng7rHkldlRVF/JA9V+s4QwuWK9GiO1qrpy7f57/nfiy8vyKxwwKhirbR
	aAeomNMyMi5NRkDu4mkmnzvDmGOOUiCxUSxMnmivaETHi5t8xFTusPktn+34IA7BG6Up
	nm97phLVQm4VOWD07Yth9khAFJ7ZyDtNmmRplkC/zxpiasfRWjdO0p0Lb+Ia5G3ik11g
	QTBZbeeyJ1hVJaFHJNn7orB5Jyt5OgTz7RBoQO+AGIlAhfnspB7vd5N+02OxOTNbuyBP
	S1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=XSAjMd4DFXFqjWbCcvbnoEVeTnxIV26bhrCsxWbwdIo=;
	b=ZtQt2fbVPAmZINoHJCSUyie7XpSNkMWagiQpuCVUijNAMcrPMhNCJ2mEssBiJXNp8D
	JvBQ8Fj3j9GfM4mkRhLLy5cnnNH4VeL4jJfDIJGwXPte2SwMwA8sit6EEh52qQyJiAai
	pk8Z/w5Ow5OjDuYynuVRoZeG93uMWkTdmtsHLcxDql13YuItLYG4ynpRf0Pl12cV86xp
	LiFi2QblDHiXgww8CswUPVZ6JRKJ6iAnqoUNUMCqSAQeZzq4qb3kc8+z10IJnH03f+ix
	v4qpotvEA+YOsAYkbTcRTg7YPAHHhsiPPps5FRlk3TFTN75Oe0qUa0OWsViyqP8CLbr7
	/4cA==
X-Gm-Message-State: AOPr4FW82xK9Sylh6NmvlNe+08m7zNdfXWAinWDGDOj4SxJxq1t2L27da8pvJY3QaRiUgQ==
X-Received: by 10.98.18.195 with SMTP id 64mr22038685pfs.152.1461861329865;
	Thu, 28 Apr 2016 09:35:29 -0700 (PDT)
Received: from 10.25.118.171-ra01.pleasanton.ca.sfba.comcast.net
	([69.241.124.150]) by smtp.gmail.com with ESMTPSA id
	hk7sm16588023pad.25.2016.04.28.09.35.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2016 09:35:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461860536.5465.59.camel@linuxfoundation.org>
Date: Thu, 28 Apr 2016 09:35:23 -0700
Message-Id: <E9C7C73B-7E2E-4330-B65C-8D9B555A2C57@gmail.com>
References: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
	<996BAFC5-CEC6-4296-A8BD-E7EA383A754F@gmail.com>
	<1461860536.5465.59.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] security_flags: turn potential string format security issues into an error
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
X-List-Received-Date: Thu, 28 Apr 2016 16:35:29 -0000
X-Groupsio-MsgNum: 81375
Content-Type: multipart/signed;
	boundary="Apple-Mail=_52B67EB9-94F4-4341-BA57-6BDAD33137C2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_52B67EB9-94F4-4341-BA57-6BDAD33137C2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 28, 2016, at 9:22 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Thu, 2016-04-28 at 08:58 -0700, Khem Raj wrote:
>>> On Apr 28, 2016, at 6:27 AM, Joshua Lock <joshua.g.lock@intel.com>
>>> wrote:
>>>=20
>>> -SECURITY_CFLAGS ?=3D "-fstack-protector-strong -pie -fpie
>>> ${lcl_maybe_fortify}"
>>> -SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong
>>> ${lcl_maybe_fortify}"
>>> +# Error on use of format strings that represent possible security
>>> problems
>>> +SECURITY_STRINGFORMAT ?=3D "-Wformat -Wformat-security
>>> -Werror=3Dformat-security"
>>> +
>>> +SECURITY_CFLAGS ?=3D "-fstack-protector-strong -pie -fpie
>>> ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>>> +SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong
>>> ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>>>=20
>>> SECURITY_LDFLAGS ?=3D "-fstack-protector-strong -Wl,-z,relro,-z,now"
>>> SECURITY_X_LDFLAGS ?=3D "-fstack-protector-strong -Wl,-z,relro"
>>> @@ -92,6 +95,23 @@ SECURITY_CFLAGS_pn-zlib =3D
>>> "${SECURITY_NO_PIE_CFLAGS}"
>>> SECURITY_CFLAGS_pn-ltp =3D "${SECURITY_NO_PIE_CFLAGS}"
>>> SECURITY_CFLAGS_pn-pulseaudio =3D "${SECURITY_NO_PIE_CFLAGS}"
>>>=20
>>> +# Recipes which fail to compile when elevating -Wformat-security
>>> to an error
>>> +SECURITY_STRINGFORMAT_pn-busybox =3D ""
>>> +SECURITY_STRINGFORMAT_pn-console-tools =3D ""
>>> +SECURITY_STRINGFORMAT_pn-cmake =3D ""
>>> +SECURITY_STRINGFORMAT_pn-expect =3D ""
>>> +SECURITY_STRINGFORMAT_pn-gcc =3D ""
>>> +SECURITY_STRINGFORMAT_pn-gettext =3D ""
>>> +SECURITY_STRINGFORMAT_pn-kexec-tools =3D ""
>>> +SECURITY_STRINGFORMAT_pn-leafpad =3D ""
>>> +SECURITY_STRINGFORMAT_pn-libuser =3D ""
>>> +SECURITY_STRINGFORMAT_pn-ltp =3D ""
>>> +SECURITY_STRINGFORMAT_pn-makedevs =3D ""
>>> +SECURITY_STRINGFORMAT_pn-oh-puzzles =3D ""
>>> +SECURITY_STRINGFORMAT_pn-stat =3D ""
>>> +SECURITY_STRINGFORMAT_pn-unzip =3D ""
>>> +SECURITY_STRINGFORMAT_pn-zip =3D ""
>>=20
>> Can we use _remove operation instead of introducing a new variable
>> and emptying it out here.
>=20
> I actually suggested we do the above. The reason is that this way, the
> user can configure which flags they actually want to use. "remove" =
also
> has the problem that its near impossible for the user to override
> further.
>=20

Thats right, and I was of the view that security flags should be one set
and not offered at combination of multiple options, we just end up =
increasing
the test matrix.

> I'm starting to believe that remove usage in OE-Core itself is =
actually
> symptomatic of a problem and that if we end up using it, it probably
> should be done differently.
>=20

I believe _remove has the potential to be abused yes

--Apple-Mail=_52B67EB9-94F4-4341-BA57-6BDAD33137C2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlciO88ACgkQuwUzVZGdMxSnMQCghHe5Uu1/gu01FpV+IxymIwFB
GcIAn0+77rBOqTWcIuOGUvnEwEAcqRxq
=quDh
-----END PGP SIGNATURE-----

--Apple-Mail=_52B67EB9-94F4-4341-BA57-6BDAD33137C2--
