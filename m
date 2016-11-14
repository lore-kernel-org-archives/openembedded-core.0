Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 72BA4719D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 23:15:31 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id x23so10052471pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 15:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=WO4QkX9QwQqoWYycFj4n5HeEI2zG8aHG7CSX9ipRqGg=;
	b=U3mgnLMEXl5cI2RsY5+BiBCEdicka0g1inKFraBMy41CEB1pzFy29YtJ+ns40Lwgt8
	eRpUXz3TkHx+GYQi1yjnVqzeHGfSwXoJ/eC5KgP0pHrt0BHcWQdVZcJhz8NU4FecqDpr
	MKUYyVMoofOahfjDppb2VyH/7xIOl8F6olsF4+t4Z2azerwoxEZfDzuN5IjYPQsm+uQX
	S/kGlBerX8JB5jmH/2KTMcKHjVPeOpvAWF2TsSwJuwbVvyP8K4ZR2SyqGNX6uyCGoYQy
	AszFv1rjgQXYIlnQ27R74+QscAv9OL8yDMS+S1WJlLpYEh/f4jl0SSurkTBeJLK3IZ/Y
	nsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=WO4QkX9QwQqoWYycFj4n5HeEI2zG8aHG7CSX9ipRqGg=;
	b=fvKol3VzT7gJ/DBfks/vF+pi/ybYMq0At0AjbPnFfcLj+kBw2W4sc06s9jAuxvUrrz
	QB3HE7fRVgV0kHUqt2LOqvf4M1O5kqfDVjI5mW8lU/KjBIMoAnTfXEKAzGTLDvYTsXRZ
	esr3xbLD5Y44EqR56omPz4MeEquN8un1Fb5dBpf34YhbAh84t9++MbPG76ET5oBvd8ko
	QfvKcXpHtzh50sbXh+YOL8Lorm3tLRad5N4bAy/X1byF6RooFlTbV/eXnFLLJCg4QxCL
	aEcHJbPWeZOnHW5CzIqluuh+G3N3UcbvnfrKmpx495NrPDFbpwaQVIiJ9Yiacu1BwqKX
	HWbQ==
X-Gm-Message-State: ABUngvckS1NcAG6BOQrgzJJsXbstHpT4nIJGU8aEM3FeMC6HHpsKBNOaFxcD73o5sQeLQA==
X-Received: by 10.99.221.5 with SMTP id t5mr32777404pgg.122.1479165332603;
	Mon, 14 Nov 2016 15:15:32 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d8e8:a625:64a7:acd8])
	by smtp.gmail.com with ESMTPSA id
	d29sm21200173pfk.78.2016.11.14.15.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Nov 2016 15:15:32 -0800 (PST)
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>
References: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
	<41ae9aed-3c93-09dc-bdde-5553fe5d5fbc@gmail.com>
	<D48DD72C-50E1-4475-9976-65C59A0705D3@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <2bc87266-c328-e37a-29a5-6ba72ad186c3@gmail.com>
Date: Mon, 14 Nov 2016 15:15:25 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <D48DD72C-50E1-4475-9976-65C59A0705D3@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rmc: Fix compiling issue with musl
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
X-List-Received-Date: Mon, 14 Nov 2016 23:15:33 -0000
X-Groupsio-MsgNum: 89368
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="7j3WwJhgNKCJjPwVp9qsdvULJ3FCglUil"

--7j3WwJhgNKCJjPwVp9qsdvULJ3FCglUil
Content-Type: multipart/mixed; boundary="meSA5MF0or7TqUR4PtrNfnHasSeqkb6D5";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <2bc87266-c328-e37a-29a5-6ba72ad186c3@gmail.com>
Subject: Re: [OE-core] [PATCH] rmc: Fix compiling issue with musl
References: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
 <41ae9aed-3c93-09dc-bdde-5553fe5d5fbc@gmail.com>
 <D48DD72C-50E1-4475-9976-65C59A0705D3@linux.intel.com>
In-Reply-To: <D48DD72C-50E1-4475-9976-65C59A0705D3@linux.intel.com>

--meSA5MF0or7TqUR4PtrNfnHasSeqkb6D5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/14/16 3:08 PM, Jianxun Zhang wrote:
>=20
>> On Nov 14, 2016, at 2:50 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 11/14/16 2:10 PM, Jianxun Zhang wrote:
>>> | src/rmcl/rmcl.c: In function 'query_policy_from_db':
>>> | src/rmcl/rmcl.c:254:25: error: unknown type name 'ssize_t'
>>> | ssize_t cmd_name_len =3D strlen((char *)&rmc_db[policy_idx]) + 1;
>>> | ^~~~~~~~
>>>
>>> The musl C lib provides ssize_t but we need to enable it
>>> with a macro.
>>>
>>> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
>>> ---
>>> Before maintainer(s) push "merge" button, please read this short summ=
ary.
>>> I feel there could be a better syntax to do it. And We could need to =
get
>>> an ack from Hernandez, Alejandro who reported this issue and seems st=
ill
>>> have (other) compiling errors even with this patch.
>>>
>>> I submit this patch based on my thoughts and test out of tiny config.=

>>>
>>> Tests:
>>> () Specify TCLIBC =3D "musl" in local.conf in my build dir.
>>> () Build quark
>>> () I can see this issue happens without the fix
>>> () With this patch and do clean builds for quark and corei7-64,
>>> Compiling passes. Boot test passed on RMC targets quark and Broxton-m=
=2E
>>>
>>> Thanks
>>>
>>>
>>> common/recipes-bsp/rmc/rmc.bb | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/common/recipes-bsp/rmc/rmc.bb b/common/recipes-bsp/rmc/r=
mc.bb
>>> index aeaf12e..61a1bdb 100644
>>> --- a/common/recipes-bsp/rmc/rmc.bb
>>> +++ b/common/recipes-bsp/rmc/rmc.bb
>>> @@ -24,6 +24,8 @@ COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux*"
>>>
>>> EXTRA_OEMAKE=3D'RMC_CFLAGS=3D"-Wl,--hash-style=3Dboth"'
>>>
>>> +EXTRA_OEMAKE_append_libc-musl =3D '" -D__NEED_ssize_t"'
>>
>> this is not right way to handle it. you should be doing something like=

>> #include <sys/types.h> in your source file
> Khem,
> Thanks lot for your review even when I wrongly submit it here! I tried =
it first but didn=E2=80=99t succeed for some reason with the suggested ch=
ange.

mostly, it could be the makefiles not respecting the compiler options pas=
sed
from bitbake. You have to make sure that, all the -I<dir> options are use=
d
properly which are relative to sysroot.

>=20
> Let me try it again...
>=20
>>
>>
>>> +
>>> # from gnu-efi, we should align arch-mapping with it.
>>> def rmc_efi_arch(d):
>>>     import re
>=20


--meSA5MF0or7TqUR4PtrNfnHasSeqkb6D5--

--7j3WwJhgNKCJjPwVp9qsdvULJ3FCglUil
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgqRZIACgkQuwUzVZGdMxTZyACgjMWXxUJq4G+5RzKLwUIVu4Hz
c7IAn273OcbdIjxa8Qh7E1gtivmf9Plp
=KSm9
-----END PGP SIGNATURE-----

--7j3WwJhgNKCJjPwVp9qsdvULJ3FCglUil--
