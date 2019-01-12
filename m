Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4EC7C0D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 16:53:49 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k15-v6so15502270ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=lxblLWS+Vc2inscNKLXRQpYcJrNaWbotFh54LQIdZrE=;
	b=oK8t2lDYGvDRrdIAFh++l5+RSLFS79h/5OLny577PL2iUWsl2PtWlWHiCR7BqsifYC
	6U+8vx4m+umvMskzilJVMGkk3ZwO9f7ERIPC72haUaxwv1hMU/QS2FLO2hUu+tY1dOqb
	siwuX0UHlEhmxsHHwidjhtlxqKeeaADfyBuaMXlFQaQAeIPZa5+2r0tk4PPRCriqY3Sp
	sgHn//IS32Iz0PrfxYyXYPIr8pELdnEgeLmar4BeL0Biezb5HoobssCmTakFMiV9fGmg
	Zj5P0vRCxtFyRIzaE2DSsvyDeNeEwnnNZzZoZd7Rk1heKNE4uyeIgwtcDQ38nsNhVCy2
	diag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=lxblLWS+Vc2inscNKLXRQpYcJrNaWbotFh54LQIdZrE=;
	b=RY9p0RuwFkfXi9JsJHdo4OUhJZrQC3RVdqpjGN0S6kjUl3+iE8gvDkgPlokUAqwg6y
	dLsb7/7s7RyuLmXYIrFrAEVMKzvyRS701Z4ObPCr0bDw6dfAuy3Enf2K014gjn/wUUl6
	tWI1YSU4Wln54EQtWx/hELwUOTKIHEvH6mhGodCWVaKKcL27y4lPjGCGytgzOTEIo+qP
	nXAvJ1QS6uzoiCB2Qz1mX5Z7NJPF1uo8YjpBdJXTC5Mzt3up7A/4EerldygVl0AUW/lS
	ruLjCAjEED4zDXkaaf5psChvWP+8lTVavbLo1DPNhKvtPVdaDz/xX4UwYkcEk4AtMvcu
	LqyQ==
X-Gm-Message-State: AJcUukcbaSo6nyWaD5M5C6Lg934FJ10bME0O3AIGdKjWd/zoJL1QFweU
	dnJOR2n7upVupcJg679f3LKNsZU0
X-Google-Smtp-Source: ALg8bN7E633ofasy1O8/FZjSVmZjlz2C2hemMUfMOcLXYmgPpvzFnL8aR87hHP7+B7d/l/K8EoLIwQ==
X-Received: by 2002:a2e:9107:: with SMTP id
	m7-v6mr10882591ljg.23.1547312029777; 
	Sat, 12 Jan 2019 08:53:49 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	q2sm16171958lfa.63.2019.01.12.08.53.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 08:53:49 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
	<1547284970-20783-5-git-send-email-serhe.popovych@gmail.com>
	<CAMKF1spcERO0rDuBS4ynFPRaNWa34dqTcYuxgzQ=+HQ=M6tmZg@mail.gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <005a80f5-312d-9fb4-4d94-1345d61a0115@gmail.com>
Date: Sat, 12 Jan 2019 18:53:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <CAMKF1spcERO0rDuBS4ynFPRaNWa34dqTcYuxgzQ=+HQ=M6tmZg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] valgrind: Mark powerpc64 with musl as incompatible
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
X-List-Received-Date: Sat, 12 Jan 2019 16:53:49 -0000
X-Groupsio-MsgNum: 120005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="uVU84EFo5RTRdQToM4OZVJU5zpAaov2I2"

--uVU84EFo5RTRdQToM4OZVJU5zpAaov2I2
Content-Type: multipart/mixed; boundary="NO0amY0oDTXwDqVHKHhhTAz9AVs26cTSw";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <005a80f5-312d-9fb4-4d94-1345d61a0115@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 4/4] valgrind: Mark powerpc64 with musl
 as incompatible
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
 <1547284970-20783-5-git-send-email-serhe.popovych@gmail.com>
 <CAMKF1spcERO0rDuBS4ynFPRaNWa34dqTcYuxgzQ=+HQ=M6tmZg@mail.gmail.com>
In-Reply-To: <CAMKF1spcERO0rDuBS4ynFPRaNWa34dqTcYuxgzQ=+HQ=M6tmZg@mail.gmail.com>

--NO0amY0oDTXwDqVHKHhhTAz9AVs26cTSw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote:
> On Sat, Jan 12, 2019 at 1:23 AM Serhey Popovych
> <serhe.popovych@gmail.com> wrote:
>>
>> Building musl for powerpc64 enforces elfv2 ABI since commit 68c9641855=
19
>> ("arch-powerpc64.inc: Use elfv2 ABI when building with musl") that is
>> not compatible with valgrind.
>>
>> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>> ---
>>  meta/recipes-devtools/valgrind/valgrind_3.14.0.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/=
recipes-devtools/valgrind/valgrind_3.14.0.bb
>> index 4d15a50..d882319 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
>> @@ -58,6 +58,9 @@ COMPATIBLE_HOST_linux-muslx32 =3D 'null'
>>  COMPATIBLE_HOST_mipsarchr6 =3D 'null'
>>  COMPATIBLE_HOST_linux-gnun32 =3D 'null'
>>
>> +# Disable for powerpc64 with musl
>> +COMPATIBLE_HOST_libc-musl_powerpc64 =3D 'null'
>=20
> lets do it for powerpc64el too

I guess powerpc64le is GNU standard target, not *el.

Support for powerpc64le is missing in OE. Before it is
added I'd prefer not to do this for powerpc64le.

>> +
>>  inherit autotools ptest multilib_header
>>
>>  EXTRA_OECONF =3D "--enable-tls --without-mpicc"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core





--NO0amY0oDTXwDqVHKHhhTAz9AVs26cTSw--

--uVU84EFo5RTRdQToM4OZVJU5zpAaov2I2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcOhubAAoJEBTawMmQ61bBFr4IAJolKmRLguwFefXhroRoV30P
huxfi4hsm0q2z8hzsAQwUxAS4H4LZBmcJKsYitWIFfFt5qjsv+UoTCuIltrqyKiF
RlR2IbIIL8cjkpnKJ3Z4RPGMlVO9kEKpzUhFXUWDAybdqv1q9tfe92k5jEIQ7GTC
8Py0SThRnd4cOpA0E3G1W2kw8FPnhQulakStJrU/t1TYMWI/FmIa4wor3gnCcZgL
Ooq9ZOsrstHqqjs2Rh+a9/R4f0x4VObFWufSQXkvtlGqFMnCsp0kdJWUGcpIErZg
lQ6Zjkg0ZV/a5090UeUVfCImdtgjsEQCsnp49ApKYn7tz2X4ICJzSGCxHgpN2C8=
=HFMk
-----END PGP SIGNATURE-----

--uVU84EFo5RTRdQToM4OZVJU5zpAaov2I2--
