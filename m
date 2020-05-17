Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.32950.1589758740932012715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 16:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X10ImzkH;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id f4so3952936pgi.10
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 16:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:autocrypt:organization:subject:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=6KU7qC1+paaHwTsu5yX/xybG/gkGzA5jA0yL+cIkkIw=;
        b=X10ImzkHkH7x2ewqn1Ypi1E1F0ZUVy91TaVoYQU9lzxf7FyVdS7gD7Go+KqITAeDe6
         0Pm4IHJ5vQz950HCg1IQfXUvODpKNITaBlqm2uMZ9Rq7NY0qfVYuV0Oxz709Swtr3A3N
         6pWY9JmhX4netWqgSCfO0pK0XIXooBa9e1k1RKTYCY/1kbxl0IFlEPTxG+Ve0YS9bjnD
         4sdZlAj0U9Hjcr4NGa8g/tirSme3i/sPMeE7T63pmG/HkViUPI/2wA8V5SstKd0gStVW
         jrhFmRtzwP3693vtCCX/B8wfMei9ItUFgw7TNIA6HhQ0iagi+lLzDaR7S8fQ6cHiRvg3
         3vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:autocrypt:organization
         :subject:message-id:date:user-agent:mime-version:in-reply-to;
        bh=6KU7qC1+paaHwTsu5yX/xybG/gkGzA5jA0yL+cIkkIw=;
        b=B+SaYF7D6Q+VWmz+uInogb06JphS6jc+kfXjLFOoQJXvDK4trNhF+gZ7EjZm6QUQzO
         QK5aF7s8o9/9rtSqWSdkqzME5VvP8i08KvGBMskFQ/So1QoR5++4lA0EbOHMVFX85yGd
         ErogwvdqiLxixYryJKDJV2oExsfm6Tt8BBDNgiX84yeVhOtKlSBrxdpf5P0PtpbkiFbI
         3J8JLc9MlGro+q9BuzqylEmFCDgSCKU7/NMd0S+I58NLW7ynDco2KIenv56eoNyoar7C
         Gs646lENv56U4PeJF1FDSKGenu85+FOIOiaEyuAMhxmqpzjyAFT/w/t1wSzwLCyM+1ZB
         DPpg==
X-Gm-Message-State: AOAM533GADadvWSr2KphG1AoKBfnzZWXT5o8pD3BM7Z7SmNZCSRUHUXj
	LeBzbz5BMKp5yz2dFbrkO2k=
X-Google-Smtp-Source: ABdhPJzaRGqkw8imMx+nTfCJABrj3/CUW4KfInFqpW3WnEVfLP7BqcbMLZTq0ghIS3qr4a1yu2fs/g==
X-Received: by 2002:a63:d650:: with SMTP id d16mr12453435pgj.90.1589758740353;
        Sun, 17 May 2020 16:39:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2264? ([2601:646:9200:4e0::2264])
        by smtp.gmail.com with ESMTPSA id x13sm1570217pjr.20.2020.05.17.16.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 16:38:59 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Steve Sakoman <sakoman@gmail.com>,
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
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 mQGiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdLQdS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT6IYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
 Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
 4evWolFf5cMmp7kEDQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
 DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
 2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
 I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
 RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
 6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
 584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
 HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
 KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
 seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
 3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
 9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
 EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
 X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
 3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
 jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
 UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
 mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
 suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiiEkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Organization: HIMVIS LLC
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
Message-ID: <37d4502f-bd17-38cd-6abc-c327fe295def@gmail.com>
Date: Sun, 17 May 2020 16:38:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200516200957.GA8056@localhost>
X-Groupsio-MsgNum: 138387
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="4P8h4yTBgODdZvLZfxtbYikTOzKuMNq1k"

--4P8h4yTBgODdZvLZfxtbYikTOzKuMNq1k
Content-Type: multipart/mixed; boundary="LoQvwJHpVScQIICxRGvJ8rSGuW8Mqjkdh";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Adrian Bunk <bunk@stusta.de>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Steve Sakoman <sakoman@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 "jdmason@kudzu.us" <jdmason@kudzu.us>
Message-ID: <37d4502f-bd17-38cd-6abc-c327fe295def@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
In-Reply-To: <20200516200957.GA8056@localhost>

--LoQvwJHpVScQIICxRGvJ8rSGuW8Mqjkdh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/16/20 1:09 PM, Adrian Bunk wrote:
> On Sat, May 16, 2020 at 07:54:32PM +0000, Peter Kjellerstedt wrote:
>>>
>>> meta-openembedded/meta-python has a higher layer priority than OE-cor=
e.
>>>
>>> Adding higher upstream versions of these recipes to a lower-priority
>>> layer in a stable series is a potential source for weird problems.
>>
>> I would assume they'd be removed from meta-python at the same time=20
>> they are added to meta.
>=20
> "at the same time" is complicated since OE-core has releases,
> but meta-openembedded is just a branch.
>=20

You bring an interesting point. while the oe-core release tags are
driven by Yocto release cadence which has point release schedules,
OE-Core in itself does not have its release mechanism besides creating
and maintaining the branch. because oe-core independently is just a repo
you will need bitbake repo atleast to build something and bitbake has
its own release cadence.

> I would also assume that not all users of stable series are updating
> meta-openembedded to the latest on the dunfell branch at the same
> time as OE-core, some users might end up updating one but never
> updating the other one.

Thats very likely, although not preferred, most of products just freeze
these layers and do tweaking in their own layers because they have
control over them, where as they dont have much control over the
upstream layers. Its common with all third party and OSS projects.

So, if someone is basing their distro on oe-core + bitbake + meta-oe and
more then I would think they should be aware of these kind of changes
but I also think this could create some unexpected behaviour. Ideally
these recipes should be updated in meta-python to latest and same moved
to oe-core, then the move does not have to be atomic.

>=20
>> //Peter
>=20
> cu
> Adrian
>=20


--LoQvwJHpVScQIICxRGvJ8rSGuW8Mqjkdh--

--4P8h4yTBgODdZvLZfxtbYikTOzKuMNq1k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXsHLCwAKCRC7BTNVkZ0z
FKUPAKCPU/0qf+lK3sqRHgGK7beK1VI24wCfXZOjF77K0ccU3jqsLSHI8kQzx+o=
=FX8i
-----END PGP SIGNATURE-----

--4P8h4yTBgODdZvLZfxtbYikTOzKuMNq1k--
