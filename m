Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.17850.1605154501520960215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 20:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dYywAlUB;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id r10so3051210pgb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 20:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Yl5+YcXsq8MkWzAWYUWh3OWmaaw06EDqa17XbpWyLJI=;
        b=dYywAlUB/BqVt51X9bGxcediyVnCndIAQaaLaYkV7GXOCXQ4MNyUzZw00RiKnRK7ra
         Ry48MGkWg4Xvf8PM2EM4VOTZQDj4IZYfqcRaCj1pQEauPgk9NH2vAwXJYv5VgibOaZQL
         /hvncXP/wqfrBK0h4RrclILy+7T13YojcxCa5DYuLu5gv9DvOzcQwj1KMuEJfyNiwnxy
         5hlzrvYYt7kxBAfgdrf4YFNm64jm/UytPBy5NmlXgbz+2w+808jEnLWwIDcgrl33jawt
         cAFtEJK2TW2BHPjm7OXAAtvl8ui9d4k5oYE+vmR16Ng1rKa1/JL4UQ9p1sHZukkBjamf
         /vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=Yl5+YcXsq8MkWzAWYUWh3OWmaaw06EDqa17XbpWyLJI=;
        b=QQzUk06FP07gig5rW8R7HpkXuX0zhwwrrxeO2bO7DOmejp/LaSWMhD7uwO2IL6yFqb
         GNPl+H8sKBDntSj6kNIq+gTgPhmJl356/5mvPv3ccHVhBsdY1Qr7pHn6zdzJPbRK3jFj
         Bp3nohK3Ri5JKkuRY0W1b7BhkiTHFD7awdlP78M1cgsC/cGUZfHa6ApBrnGn0v+Y8nZT
         7GcJbtcoNkiDJLR3ZPZPgRUAkaR02KhthE8s8TmgVF/vn7y76Qr29T9VyBMBzpOlUPpi
         4Xrklc6h+c34ADA3LDiHa1Ty9XY5+1jorkb3/c7iR6lp6f6WzfaQfWWkFein9NE3W9h+
         VzdA==
X-Gm-Message-State: AOAM531Y0PMDF7CI+9k0H9c3sou9DRVdjF4rVxk0R4IPY6Jm0ZJeuWyH
	74liQ/cQUUYAfaBKJfX7dtUB3GGUcOGV2w==
X-Google-Smtp-Source: ABdhPJwXiQpDudCJhwvuwF9JeG+QJhkI8cEMqFn955GIF9W9tbMlmzJOkNvndS97oZzXt29z1NT2bw==
X-Received: by 2002:aa7:953c:0:b029:18b:bfb:9fa1 with SMTP id c28-20020aa7953c0000b029018b0bfb9fa1mr26126823pfp.14.1605154500499;
        Wed, 11 Nov 2020 20:15:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::e75c? ([2601:646:9200:4e0::e75c])
        by smtp.gmail.com with ESMTPSA id v19sm4138599pgi.2.2020.11.11.20.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 20:14:59 -0800 (PST)
Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
To: zangrc <zangrc.fnst@cn.fujitsu.com>, Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <1604893131-60530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAAnfSTvGf5YJaXF=sPrf_3HH1EoxznD+2F-==jaPrJVUJ1xV4g@mail.gmail.com>
 <bbdb2694c9f04c0481ca6b9c77a0cd11@G08CNEXMBPEKD04.g08.fujitsu.local>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <6f631420-d617-2a76-f2c1-9ff7633180d6@gmail.com>
Date: Wed, 11 Nov 2020 20:14:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bbdb2694c9f04c0481ca6b9c77a0cd11@G08CNEXMBPEKD04.g08.fujitsu.local>
X-Groupsio-MsgNum: 144488
Content-Type: multipart/mixed;
 boundary="------------E60E83E3C38C66FC9D5AC4C2"
Content-Language: en-US

--------------E60E83E3C38C66FC9D5AC4C2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/11/20 6:45 PM, zangrc wrote:
> Sorry, we will improve in the future, but we don=E2=80=99t know how to d=
etermine which recipes need to be tested during the upgrade. Is there any w=
ay you can provide us?
>=20

one way would be to do bitbake -k world,

> Zang Ruochen
>=20
>> -----Original Message-----
>> From: Ross Burton <ross@burtonini.com>
>> Sent: Wednesday, November 11, 2020 6:49 PM
>> To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 <zangrc.fnst@cn.fujitsu.=
com>
>> Cc: OE-core <openembedded-core@lists.openembedded.org>
>> Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
>>
>> Please remember to build more than just a single recipe when testing, i=
n
>> particular dependents.  This upgrade broke libical and webkitgtk, which
>> resulted in three iterations though the autobuilder and me
>> finding/backporting fixes as appropriate.
>>
>> Ross
>>
>> On Mon, 9 Nov 2020 at 03:39, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>>>
>>> -License-Update:The address changes are as follows:
>>>   # Project: http://code.google.com/p/lao-dictionary/
>>>   # Dictionary: http://lao-dictionary.googlecode.com/git/Lao-Dictionar=
y.txt
>>>   # License:
>>> http://lao-dictionary.googlecode.com/git/Lao-Dictionary-LICENSE.txt
>>>
>>> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>>> ---
>>>  meta/recipes-support/icu/{icu_67.1.bb =3D> icu_68.1.bb} | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)  rename
>>> meta/recipes-support/icu/{icu_67.1.bb =3D> icu_68.1.bb} (95%)
>>>
>>> diff --git a/meta/recipes-support/icu/icu_67.1.bb
>>> b/meta/recipes-support/icu/icu_68.1.bb
>>> similarity index 95%
>>> rename from meta/recipes-support/icu/icu_67.1.bb
>>> rename to meta/recipes-support/icu/icu_68.1.bb
>>> index 9e8091ba01..98aa6b7be6 100644
>>> --- a/meta/recipes-support/icu/icu_67.1.bb
>>> +++ b/meta/recipes-support/icu/icu_68.1.bb
>>> @@ -83,7 +83,7 @@ FILES_libicuio =3D "${libdir}/libicuio.so.*"
>>>
>>>  BBCLASSEXTEND =3D "native nativesdk"
>>>
>>> -LIC_FILES_CHKSUM =3D
>> "file://../LICENSE;md5=3Da3808a5b70071b07f87ff2205e4d75a0"
>>> +LIC_FILES_CHKSUM =3D
>> "file://../LICENSE;md5=3D002d2fdc32d17f0ec06e9a47f2c0c8d0"
>>>
>>>  def icu_download_version(d):
>>>      pvsplit =3D d.getVar('PV').split('.') @@ -112,8 +112,8 @@ SRC_URI=
 =3D
>>> "${BASE_SRC_URI};name=3Dcode \  SRC_URI_append_class-target =3D "\
>>>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>>>            "
>>> -SRC_URI[code.sha256sum] =3D
>> "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5
>> dc"
>>> -SRC_URI[data.sha256sum] =3D
>> "7c16a59cc8c06128b7ecc1dc4fc056b36b17349312829b17408b9e67b05c4
>> a7e"
>>> +SRC_URI[code.sha256sum] =3D
>> "a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb2
>> 9f2d"
>>> +SRC_URI[data.sha256sum] =3D
>> "03ea8b4694155620548c8c0ba20444f1e7db246cc79e3b9c4fc7a960b160d
>> 510"
>>>
>>>  UPSTREAM_CHECK_REGEX =3D "icu4c-(?P<pver>\d+(_\d+)+)-src"
>>>  UPSTREAM_CHECK_URI =3D "https://github.com/unicode-org/icu/releases"
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>>>
>>>
>>
>=20
>=20
>=20
>=20
>=20
>=20
>=20

--------------E60E83E3C38C66FC9D5AC4C2
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------E60E83E3C38C66FC9D5AC4C2--
