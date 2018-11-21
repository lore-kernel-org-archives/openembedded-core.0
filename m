Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id D2DD36C1BE;
	Wed, 21 Nov 2018 21:22:46 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id s5-v6so7214785plq.11;
	Wed, 21 Nov 2018 13:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=IkInvBxK6CTTK0B5xqSBo03Ddhdb6h7L13Dwl8MqOrI=;
	b=j2UWQxAuH13z1h2Tb+BTAT4WvIJ2aZc7hjGsnpMCa+yhpnhHmUZyweuPtsHifntgSp
	QBo7K2eWHMPV/1qywupmzILOnrTQRhy6RL4DQWI8FdMNs1cfRNcGnI2yfmhuTTx51Mfi
	ztR5FyxxMF2HZsruY3Et2lY0XejAfSdFiw5EFBeejXX5VOICOaWkDQ0Z3rXnph1tyaKf
	mDs6iAUEdZ1oVNpuS1zzWg64aJLg6pMoG76ojb4/8ZmEwPEb8Bd/2PYlBBVhYgwRt8Oy
	8U8vRIxkjrsg3GvwmKfNZnS/oMB5v37mHhmnaMnjSCRIx83XcTs6SrmrrxHPdsSxQuoc
	R7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=IkInvBxK6CTTK0B5xqSBo03Ddhdb6h7L13Dwl8MqOrI=;
	b=LlFHEz5OA3cgDeJCzX/iGb7L6rTr/gUFWsjuiKESWmVrNd9zJAqjXWQf5gnC4xkwsc
	jOlzUYMUwj0Wjp1y+LX27oHDWSNuatT4lfKTppSbTIC+4nQZkZjku1yxWMe4QQECqwxi
	1NJGAToJdgoCVAVkkaWURplKQYZxWDqMCsGi+MEtl25pGhSxzt6R2dKV6D9RktEIblgN
	CaP2LdxvcwxqSbxovZg0QPftbcVo1VeBPe5MPRYazwfcAcdRI81tHBd1in1tkomovvGx
	CkLdIgXMm4V1ddcfQ8SICDWVabp6CE99zkUfZ27grl4OACiNeAc3wpQdgjq2x/yRdWVN
	8Umg==
X-Gm-Message-State: AA+aEWaJhepEThzVRc5+IX+i7veYOxgDfD8ElWmMo0EFzXtrYm2SxooC
	GN+VddTEW2c3i4/qxRhnkUd4YmHp
X-Google-Smtp-Source: AFSGD/WJytZX7NIdiG8yJ5QAKI/U4GSuOWI9rTnNiU6UasUUv5fYSixKohB+yaHLYw9yNeAVetRFkw==
X-Received: by 2002:a17:902:9004:: with SMTP id
	a4-v6mr8356655plp.334.1542835367494; 
	Wed, 21 Nov 2018 13:22:47 -0800 (PST)
Received: from [192.168.0.33] (97-121-174-158.clsp.qwest.net. [97.121.174.158])
	by smtp.gmail.com with ESMTPSA id
	x127sm39577528pfd.156.2018.11.21.13.22.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 13:22:46 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <154238601667.15427.9965417024860647033@git.openembedded.org>
	<20181116163337.4A962235D9B@git.openembedded.org>
	<20181120195642.GA1825@jama>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8302c796-5bcc-a51c-9336-4166172f4b9b@gmail.com>
Date: Wed, 21 Nov 2018 14:22:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181120195642.GA1825@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 10/35: tzcode: update to 2018f
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
X-List-Received-Date: Wed, 21 Nov 2018 21:22:48 -0000
X-Groupsio-MsgNum: 118463
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Hf6fnt5WVtEOjfY8QfcO8EyGDcbHvwpQS"

--Hf6fnt5WVtEOjfY8QfcO8EyGDcbHvwpQS
Content-Type: multipart/mixed; boundary="lUmPddHWg9Y0MsMA3ohrRHufjIGzMqzoK";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: openembedded-commits@lists.openembedded.org
Message-ID: <8302c796-5bcc-a51c-9336-4166172f4b9b@gmail.com>
Subject: Re: [oe-commits] [openembedded-core] 10/35: tzcode: update to 2018f
References: <154238601667.15427.9965417024860647033@git.openembedded.org>
 <20181116163337.4A962235D9B@git.openembedded.org>
 <20181120195642.GA1825@jama>
In-Reply-To: <20181120195642.GA1825@jama>

--lUmPddHWg9Y0MsMA3ohrRHufjIGzMqzoK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 11/20/18 12:56 PM, Martin Jansa wrote:
> On Fri, Nov 16, 2018 at 04:33:46PM +0000, git@git.openembedded.org wrot=
e:
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch sumo
>> in repository openembedded-core.
>>
>> commit 9702041a732ca062a9899543d05e585c930407f3
>> Author: Armin Kuster <akuster808@gmail.com>
>> AuthorDate: Mon Oct 22 15:05:11 2018 +0100
>>
>>     tzcode: update to 2018f
> This breaks postgresql build in sumo:
After review, updating postgresql to 9.4.20 ( bug fixes only) is the
preferred path in this case.

- armin
>
> | postgresql/9.4.17-r0/recipe-sysroot-native/usr/bin/zic -d 'postgresql=
/9.4.17-r0/image/usr/share/postgresql/timezone' -p 'US/Eastern' postgresq=
l/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tzdata.zi
> | "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tz=
data.zi", line 1595: Invalid rule name "+"
> | "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tz=
data.zi", line 1596: Invalid rule name "+"
> | "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tz=
data.zi", line 1597: Invalid rule name "+"
> | "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tz=
data.zi", line 1598: Invalid rule name "+"
> | "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tz=
data.zi", line 1599: Invalid rule name "+"
> | Makefile:52: recipe for target 'install' failed
> | make[2]: *** [install] Error 1
> | make[2]: Leaving directory 'postgresql/9.4.17-r0/build/src/timezone'
> | Makefile:35: recipe for target 'install-timezone-recurse' failed
> | make[1]: *** [install-timezone-recurse] Error 2
>
>
> Are you going to backport:
>
> commit 805e74d00cff3a7566335150f7e3b41972265cc1
> Author: Armin Kuster <akuster808@gmail.com>
> Date:   Mon Oct 22 16:47:55 2018 +0100
>
>     postgresql: Fix build issue with timezone 2018f update
>    =20
>     Sync our copy of the timezone library with IANA release tzcode2018f=
=2E
>
> to meta-oe/sumo?
>
> Thanks
>
>>    =20
>>      Changes to code
>>    =20
>>         zic now always generates TZif files where time type 0 is used =
for
>>         timestamps before the first transition.  This simplifies the
>>         reading of TZif files and should not affect behavior of existi=
ng
>>         TZif readers because the same set of time types is used; only
>>         their internal indexes may have changed.  This affects only th=
e
>>         legacy zones EST5EDT, CST6CDT, MST7MDT, PST8PDT, CET, MET, and=

>>         EET, which previously used nonzero types for these timestamps.=

>>    =20
>>         Because of the type 0 change, zic no longer outputs a dummy
>>         transition at time -2**59 (before the Big Bang), as clients sh=
ould
>>         no longer need this to handle historical timestamps correctly.=

>>         This reverts a change introduced in 2013d and shrinks most TZi=
f
>>         files by a few bytes.
>>    =20
>>         zic now supports negative time-of-day in Rule and Leap lines, =
e.g.,
>>         "Rule X min max - Apr lastSun -6:00 1:00 -" means the transiti=
on
>>         occurs at 18:00 on the Saturday before the last Sunday in Apri=
l.
>>         This behavior was documented in 2018a but the code did not
>>         entirely match the documentation.
>>    =20
>>         localtime.c no longer requires at least one time type in TZif
>>         files that lack transitions or have a POSIX-style TZ string.  =
This
>>         future-proofs the code against possible future extensions to t=
he
>>         format that would allow TZif files with POSIX-style TZ strings=
 and
>>         without transitions or time types.
>>    =20
>>         A read-access subscript error in localtime.c has been fixed.
>>         It could occur only in TZif files with timecnt =3D=3D 0, somet=
hing that
>>         does not happen in practice now but could happen in future ver=
sions.
>>    =20
>>         localtime.c no longer ignores TZif POSIX-style TZ strings that=

>>         specify only standard time.  Instead, these TZ strings now
>>         override the default time type for timestamps after the last
>>         transition (or for all time stamps if there are no transitions=
),
>>         just as DST strings specifying DST have always done.
>>    =20
>>         leapseconds.awk now outputs "#updated" and "#expires" comments=
,
>>         and supports leap seconds at the ends of months other than Jun=
e
>>         and December.  (Inspired by suggestions from Chris Woodbury.)
>>     (From OE-Core rev: 4670dcdb6e2504469c30ebed828d4702d8c0003c)
>>    =20
>>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>=

>>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../tzcode/{tzcode-native_2018e.bb =3D> tzcode-native_2018f.bb}     |=
 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018e.bb b/met=
a/recipes-extended/tzcode/tzcode-native_2018f.bb
>> similarity index 70%
>> rename from meta/recipes-extended/tzcode/tzcode-native_2018e.bb
>> rename to meta/recipes-extended/tzcode/tzcode-native_2018f.bb
>> index 9a4e465..816e34d 100644
>> --- a/meta/recipes-extended/tzcode/tzcode-native_2018e.bb
>> +++ b/meta/recipes-extended/tzcode/tzcode-native_2018f.bb
>> @@ -11,10 +11,10 @@ SRC_URI =3D" http://www.iana.org/time-zones/reposi=
tory/releases/tzcode${PV}.tar.gz
>> =20
>>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
>> =20
>> -SRC_URI[tzdata.md5sum] =3D "97d654f4d7253173b3eeb76a836dd65e"
>> -SRC_URI[tzdata.sha256sum] =3D "6b288e5926841a4cb490909fe822d85c36ae75=
538ad69baf20da9628b63b692e"
>> -SRC_URI[tzcode.md5sum] =3D "c4d7df0fff7ba5588b32c5f27e2caf97"
>> -SRC_URI[tzcode.sha256sum] =3D "ca340cf20e80b699d6e5c49b4ba47361b3aa68=
1f06f38a0c88a8e8308c00ebce"
>> +SRC_URI[tzdata.md5sum] =3D "e5e84f00f9d18bd6ebc8b1affec91b15"
>> +SRC_URI[tzdata.sha256sum] =3D "0af6a85fc4ea95832f76524f35696a61abb399=
2fd3f8db33e5a1f95653e043f2"
>> +SRC_URI[tzcode.md5sum] =3D "011d394b70e6ee3823fd77010b99737f"
>> +SRC_URI[tzcode.sha256sum] =3D "4ec74f8a84372570135ea4be16a042442fafe1=
00f5598cb1017bfd30af6aaa70"
>> =20
>>  S =3D "${WORKDIR}"
>> =20
>>
>> --=20
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --=20
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits



--lUmPddHWg9Y0MsMA3ohrRHufjIGzMqzoK--

--Hf6fnt5WVtEOjfY8QfcO8EyGDcbHvwpQS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJb9cykAAoJEO6LtJn0Vuf5i4EP/RN0BvBc8xTCgf7Yl/YuZvnD
0xsWvB9mx7rLze6zq2yZjfZiRUyG03NOBQWfF4UGofkFSjifVuiGIzWIuvJssR9c
Huv2finCHN+LnvL4SXJDYQi/T5fCjIKZlzQ/JpzWHIdm1z6Tyo3MFqXJkWZrAkNu
K6MHowdQU4q0uy9oo2mPocwoB/XtTXdoYS+WzsFf/KAdQDpf5zk2t0ChfFu4iOp3
BwbiNbNr+dobab62HU4tR9w0dC1cGzEIBSj4RyHvN2VaTnCEyPDWSy8w0HNWnzbo
MCOH0b3XYrZTmN4nt55RGa8FTFDdhT1TBhJqEkwI/GKHwERmVAdAYYy+S8mDJqy1
CVAGmEbL/3q0Uf9mtpSCQifl2EqXFnbb0e+Phcq8A0005u8+8hw3i1kHNDxvTyFv
mJ7YZOBl6NudVl5Hg+IPqi/6wWCa3MrqQ5YVzC19sFQs9LXFescO4oVA27rIHNsz
f3cInQfpB+VOqS0rPgbPUBt1pKayeg+cLTp4hIdNX7IFQ4m/w/vj5Z0tOPLIAJm7
8Wc3EtAVXmYvLe0OuCOOzshLaDMIyWvvjg2TPtXgDDIxoZpDvsWZ59gufUGm2kvu
pINCtC3cdgWY0KFzihH3SBFi9hLrXBOSh1NoyjJZdIlXWloJUEXwEmZLPh+5MyLX
tw2bd+LpXit4sG3+GJtk
=qYj+
-----END PGP SIGNATURE-----

--Hf6fnt5WVtEOjfY8QfcO8EyGDcbHvwpQS--
