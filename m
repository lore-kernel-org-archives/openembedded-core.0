Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D8AB877BFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 23:28:22 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id g2so27430694pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 16:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=IY8T5EIe8IMj6nX5mRwSUBgvAKNG3a8MGNQ34PxS3Pw=;
	b=HSehA1JK/6kbEmzPmrd2FESfTXiRytLE5lROi5m9Nm8B4AIHrNaDMcJEvhtyVwDTnl
	gIcrNXsWiN9hznWyMqs3ql8LsxzsOkCnqgg6gD0ssBROrOasF1RYNtaDW79YF+T318aY
	DnjbPSxEd9l5Jqo5WA0xFmBHVwjJn9EdiLBxEkBhoQlboaayNtpnVxkVyffHx93TJNdC
	hdwHMf1+n2q0wnVI9HaTlCDVSHf+pGotOzVHqWCUbWSLeFnYUM49khyX0o4KFpuX7qUm
	IhHMYj+t3nicAw9+LIS8gxaTY0+j4Cnf2Kvr8nl3mR9H0Ao3PgoY/XsG6s4m4eVR94rL
	2X8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=IY8T5EIe8IMj6nX5mRwSUBgvAKNG3a8MGNQ34PxS3Pw=;
	b=fBWB6hli0uWdFl2/gz6K60lKDaAL5ARgGj9ZfIOSzuri86XmJ5HcaXBpcMhA3UVrZE
	OWB61HM0MWMAYDo8ObTpCzR4AQRFsEa5JW2v3hBRszLCviN5+zU0uylOnjp3Hw3WNran
	ljzhKtaJiEFeuO+nyKAmV/Bee3pciM5ooHFqfVS+ebPM6THHSyhZCju4+Px5hQCnNCAB
	9OLuUwygDVzZbs1v8zpvk9U0c0mYxXiKF0NBZphJ0lswWmwwIhosyENxf1DIud8TxveW
	ZT/N7ykvjj0u0phZkeESphQZ67byhCZvvwEkjGp+Ojm5FzRXRVKYtsvop/BZjosVrYSN
	aVDw==
X-Gm-Message-State: AN3rC/5WREbHWBXw0ZoKYAQLOeU41zruepYM2axOZt8acHKv268s2eQI7sIplK8ShV13Ug==
X-Received: by 10.98.62.141 with SMTP id y13mr14146736pfj.93.1491866904139;
	Mon, 10 Apr 2017 16:28:24 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:a17b:c5eb:7ae1:32d8])
	by smtp.gmail.com with ESMTPSA id
	s3sm26639157pgn.29.2017.04.10.16.28.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 16:28:22 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>
	<4c539d8a-083f-b0d2-4343-ece7ae066991@gmail.com>
	<1491863493.4358.121.camel@linux.intel.com>
	<1491865755.12091.0.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c7db097e-df70-379d-b073-f31cd8d31fce@gmail.com>
Date: Mon, 10 Apr 2017 16:28:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491865755.12091.0.camel@linuxfoundation.org>
Subject: Re: [PATCH] gnu-efi: copy header files for x32 build
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
X-List-Received-Date: Mon, 10 Apr 2017 23:28:22 -0000
X-Groupsio-MsgNum: 96074
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="MrilLalf3gX1f2Gde5QA6i5xrcOVGLF9R"

--MrilLalf3gX1f2Gde5QA6i5xrcOVGLF9R
Content-Type: multipart/mixed; boundary="TQkls5edn9fFFEmXxu2WRTC6QuC41UqIL";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Message-ID: <c7db097e-df70-379d-b073-f31cd8d31fce@gmail.com>
Subject: Re: [OE-core] [PATCH] gnu-efi: copy header files for x32 build
References: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>
 <4c539d8a-083f-b0d2-4343-ece7ae066991@gmail.com>
 <1491863493.4358.121.camel@linux.intel.com>
 <1491865755.12091.0.camel@linuxfoundation.org>
In-Reply-To: <1491865755.12091.0.camel@linuxfoundation.org>

--TQkls5edn9fFFEmXxu2WRTC6QuC41UqIL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4/10/17 4:09 PM, Richard Purdie wrote:
> On Mon, 2017-04-10 at 15:31 -0700, Saul Wold wrote:
>> On Mon, 2017-04-10 at 12:57 -0700, Khem Raj wrote:
>>>
>>>
>>> On 4/10/17 8:58 AM, Saul Wold wrote:
>>>>
>>>>
>>>> Gnu-efi needs to be build for 64bit since it is a boot time tool.
>>>> It
>>>> needs these 2 headers to be in 64 bit versions, we can use the
>>>> existing
>>>> 32bit ones as there is not really any difference.
>>>>
>>>> [YOCTO #11051]
>>>>
>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>> ---
>>>>  meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
>>>> b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
>>>> index f46381d..6f235b7 100644
>>>> --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
>>>> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
>>>> @@ -24,6 +24,11 @@ SRC_URI[sha256sum] =3D
>>>> "bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef
>>>>  COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
>>>>  COMPATIBLE_HOST_armv4 =3D 'null'
>>>> =20
>>>> +do_configure_linux-gnux32_prepend() {
>>>> +	cp ${STAGING_INCDIR}/gnu/stubs-x32.h
>>>> ${STAGING_INCDIR}/gnu/stubs-64.h
>>>> +	cp ${STAGING_INCDIR}/bits/long-double-32.h
>>>> ${STAGING_INCDIR}/bits/long-double-64.h
>>>> +}
>>>> +
>>> making long-double-32.h pretend long-double-64.h seems wrong to me.
>>> but
>>> if you were to do that then symlinking might be better
>>>
>> I guess I could symlink it, as it turns out with glibc it's an empty
>> header file other than boilerplate, I did not check musl, which I
>> guess
>> I will do now!
>>
>> Even the stubs file is pretty much the same file.
>=20
> FWIW, the copy makes the task re-executable. If you make symlinks, the
> code gets a bit more ugly so the task can be re-executed.
>=20

ln -sf ?

> Cheers,
>=20
> Richard
>=20


--TQkls5edn9fFFEmXxu2WRTC6QuC41UqIL--

--MrilLalf3gX1f2Gde5QA6i5xrcOVGLF9R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljsFRUACgkQuwUzVZGdMxRjMACfVO9JjJGQq5WOJG/foCJ81GWh
sp0AoIGb+jW1E79snIQzyZ0wE1nNuwpW
=t+T+
-----END PGP SIGNATURE-----

--MrilLalf3gX1f2Gde5QA6i5xrcOVGLF9R--
