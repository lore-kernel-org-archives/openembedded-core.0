Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.32965.1589758879555050531
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 16:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AUHqYoC5;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id nu7so1654146pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 16:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=kmPO/gprGS4vTgYd7Z0L+RnN1Bx3OkD5zdk/QSE93rU=;
        b=AUHqYoC57wrqphoG1kem7MWVvGR2SemM1h6SLccUQlr6xF4OFAPieHSxgAM/xbj18Z
         nMtlHSXjRfwJ0OelwPLF+X/O9WWhpUQCqflaLmAbcmMUPwFprV3OK/7KtyfSezFOxxoL
         NZJ72CvFEWSAyTM/+dfonMIdtOe0vS4pI/X3614ta+6V+J6C69AfGQyDTq1VouRS3ws5
         cgGowul7l8oxMz1e9GZKqlqa5bIY5Sb4OvdJOOYvZjJhe1ZPp2m4I+z93ybXqXeB6cOS
         V1CVJxXdn1UZon+9hsyCRCpnT4oLBHxAwxQYVgV7i8cvoRwrrftTk/kQulsPSjKsHMH4
         L1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=kmPO/gprGS4vTgYd7Z0L+RnN1Bx3OkD5zdk/QSE93rU=;
        b=PgPh77fG5TdDIZJGFKZ+Qzw7dY9TJltw371JNH0pDjwsmRi5G3nlzIemJpN2wSuM/L
         dYUZudXYrSBsYjZcM2cDySuGB/+Yy3cwRcKvRDVOsxEpl2IGoYKoI3AdtPk+bhEO2bEN
         XFTX7V9Qx8ux+3dst+JoxkimkLYYpqEYetn008Wk4FN1S6kj5C/Ywa2sszRvmQ3ED/7W
         hQJ4UtMIsvKILjuwIHAGlmZb9hBlg1F/FLVuPOwgYiL7HOhhbjEJUhOu4IyjLphHXPhd
         YKu7yXQJpUdTA4nB07cC4WkA+S8XkwQWcuyk1M8kt4QM3mRZvoL/9gLYOsfT67+0kme5
         4HdA==
X-Gm-Message-State: AOAM53357RaLDyQFCpDNFkMeiErP4Dw2rAWliqqV5UDWJ8wc7dtABbtT
	SvEbTNrg5T0A9lN3KmmjACY=
X-Google-Smtp-Source: ABdhPJzLer8OsYJuYojZZ3bIKLmmlA1jgqFlesuLWtL3XnZmluDRS8G1ns2/NwfJHTRAlXqOoX05ig==
X-Received: by 2002:a17:90a:9f95:: with SMTP id o21mr4137884pjp.91.1589758878922;
        Sun, 17 May 2020 16:41:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2264? ([2601:646:9200:4e0::2264])
        by smtp.gmail.com with ESMTPSA id mw10sm7043135pjb.47.2020.05.17.16.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 16:41:18 -0700 (PDT)
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Adrian Bunk <bunk@stusta.de>, Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Steve Sakoman <sakoman@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 "jdmason@kudzu.us" <jdmason@kudzu.us>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
 <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <f528668e-4273-2070-3ff9-9fa0b1030ee9@gmail.com>
Date: Sun, 17 May 2020 16:41:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200517132245.GA9940@localhost>
X-Groupsio-MsgNum: 138388
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="8Q9rmxkgpqnJwQWNVh2MWO5reKDHRc8xL"

--8Q9rmxkgpqnJwQWNVh2MWO5reKDHRc8xL
Content-Type: multipart/mixed; boundary="dKvmYHstWPKLaI2tRJyPLZMdLSNNC7yN7";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Adrian Bunk <bunk@stusta.de>, Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Steve Sakoman <sakoman@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 "jdmason@kudzu.us" <jdmason@kudzu.us>
Message-ID: <f528668e-4273-2070-3ff9-9fa0b1030ee9@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
 <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost>
In-Reply-To: <20200517132245.GA9940@localhost>

--dKvmYHstWPKLaI2tRJyPLZMdLSNNC7yN7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/17/20 6:22 AM, Adrian Bunk wrote:
> On Sat, May 16, 2020 at 10:24:04PM +0200, Andrey Zhizhikin wrote:
>> On Sat, May 16, 2020 at 10:10 PM Adrian Bunk <bunk@stusta.de> wrote:
>>>
>>> On Sat, May 16, 2020 at 07:54:32PM +0000, Peter Kjellerstedt wrote:
>>>>>
>>>>> meta-openembedded/meta-python has a higher layer priority than OE-c=
ore.
>>>>>
>>>>> Adding higher upstream versions of these recipes to a lower-priorit=
y
>>>>> layer in a stable series is a potential source for weird problems.
>>>>
>>>> I would assume they'd be removed from meta-python at the same time
>>>> they are added to meta.
>>>
>>> "at the same time" is complicated since OE-core has releases,
>>> but meta-openembedded is just a branch.
>>>
>>> I would also assume that not all users of stable series are updating
>>> meta-openembedded to the latest on the dunfell branch at the same
>>> time as OE-core, some users might end up updating one but never
>>> updating the other one.
>>
>> That I believe would be a terrible mistake when people opt-in to take
>> a layer, but never care about updating it... :(
>=20
> The typical Yocto user starts with whatever prehistoric Yocto release=20
> came with the BSP distribution for the reference hardware, and then=20
> develops a new product on top of that.
>=20
> I would not be surprised if someone will have the initial Yocto 2.7
> release, but uses the latest from the corresponding  meta-openembedded =

> branch on top

To be honest, we should not consider supporting such usecases IMO,
somewhere we have to draw a line, mixing layer releases is not something
upstream can even test those combos.


>=20
>> On the contrary, a quick run of "bitbake-layers show-overlayed"
>> exhibits the following on the [master] of both OE-Core and
>=20
> Thanks a lot for this.
>=20
>> meta-openembedded:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> python3-cython:
>>   meta-python          0.29.14
>>   meta                 0.29.16
>> python3-dbusmock:
>>   meta-python          0.16.7
>>   meta                 0.19
>> python3-docutils:
>>   meta-python          0.15.2
>>   meta                 0.16
>> python3-pyparsing:
>>   meta-python          2.4.6
>>   meta                 2.4.7
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> I'll take care of getting these removed from meta-openembedded.
>=20
>> Judging be versions, it looks like OE-Core recipes are maintained, but=

>> in meta-openembedded they are left on the side...
>=20
> python3-docutils is ouch, since this problem is also in dunfell.
>=20
> On a more positive note 0.16 is already in OE-core in the initial
> Yocto 3.1 release, so removing it from meta-openembedded will only
> be like a 0.15.2 -> 0.16 upgrade for some users but cannot result
> in losing the recipe in weird layer combinations.
>=20
>> Regards,
>> Andrey.
>=20
> cu
> Adrian
>=20


--dKvmYHstWPKLaI2tRJyPLZMdLSNNC7yN7--

--8Q9rmxkgpqnJwQWNVh2MWO5reKDHRc8xL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXsHLlgAKCRC7BTNVkZ0z
FJg/AJ99hnyaqICIvvTjE1zPoMEEcqxEgQCfQtl1YGOu5Iz+UCCdJudTo2sagrE=
=0z4u
-----END PGP SIGNATURE-----

--8Q9rmxkgpqnJwQWNVh2MWO5reKDHRc8xL--
