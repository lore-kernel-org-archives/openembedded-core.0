Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.33047.1589759137552997483
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 16:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LQVEWsRE;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id j21so3959798pgb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 16:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=88Tj7AasrYIA9A0w1t0I0/HdmkQqEiLna+YMxstwLmI=;
        b=LQVEWsREv1Zze2y8QiaWiPKBbY/slSaPOMOujctVejv4Gw31o+bo/Atni8xqNzX3DT
         94pr19oLfe51dJbsB9LsaJExM+pjeM9swxpPD2K4PlKFztxP/Lapqt1EsvKUMZuDObBs
         lI8po5uz277ZFXjg5llHLCuFDF5fD6zo8Ug/BSkQRecC3b4Wu0MITDjEcj9GUCNDpFfU
         LSDnMPKE8zFr+y15oNtdjQ8DcUgzIugz2KiMO3IO2ac9QDXoPEV5RthAkSPobPghtpQY
         jQG+6zRpAkaoGUVExHFyI4loXuY7P2BXZPdaLyTivUveKJPoGCRDrzh+eMOpuxjziDGD
         h6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=88Tj7AasrYIA9A0w1t0I0/HdmkQqEiLna+YMxstwLmI=;
        b=mLgQoXmo6Gl/X4cUgPbH+E0SENIejg7vNq2Z+l5nFdTFYLRg4avFMZaAIueVNxnthZ
         p1WTVSzwPLB7Q+5CWq3uZD7TspH7+s+JiGHHspMg2lP31t6mJNfMdwSUr07dwhl1xF86
         CZVNcLFt+WP4dZ3PCHbyQtUhNf1/fLgqKcqLEJG1umS9au4d0LduA9PhsFq8Y50pUCys
         u8Zc4vF2X9gCeRBXrKyilaUmtirjYZ84H5jcpdpR+xnFCbgCtghyZ4f6cUaa7If6JtFw
         8waBd3ltlb8hDkr/5P3ziRYPTZXJenjPvQteztpBInO/g2Eukin6AZwLhYBltMQc0TTF
         pjKw==
X-Gm-Message-State: AOAM531Wn3Dv1JcdZwZtYwdSYC5BgZaoXihDLGQkrr857uc4yeMRW3dF
	BXM+Tb0xvOi8gRpTENA2PWE=
X-Google-Smtp-Source: ABdhPJxBFQWaIq/TGnzrMV/u8kvtFJvAMMHiehPFWGHH+Q1oDbYphHkFjFXdIng6j+7bnG7+v5hY7g==
X-Received: by 2002:a63:1a11:: with SMTP id a17mr9384267pga.227.1589759136969;
        Sun, 17 May 2020 16:45:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2264? ([2601:646:9200:4e0::2264])
        by smtp.gmail.com with ESMTPSA id l1sm6079298pgj.48.2020.05.17.16.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 16:45:36 -0700 (PDT)
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Adrian Bunk <bunk@stusta.de>, Martin Jansa <martin.jansa@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
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
 <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <1f6b0b65-8510-c16f-7cdc-15d32d135f9e@gmail.com>
Date: Sun, 17 May 2020 16:45:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200517154525.GA16162@localhost>
X-Groupsio-MsgNum: 138389
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="E08EjZ4vVtDjL5jJLjV3E9UA3J5mMr3k6"

--E08EjZ4vVtDjL5jJLjV3E9UA3J5mMr3k6
Content-Type: multipart/mixed; boundary="TKmvE2hdDi1SftyOBYYB6hkOahP4LGaIJ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Adrian Bunk <bunk@stusta.de>, Martin Jansa <martin.jansa@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Steve Sakoman <sakoman@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 "jdmason@kudzu.us" <jdmason@kudzu.us>
Message-ID: <1f6b0b65-8510-c16f-7cdc-15d32d135f9e@gmail.com>
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
 <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost>
In-Reply-To: <20200517154525.GA16162@localhost>

--TKmvE2hdDi1SftyOBYYB6hkOahP4LGaIJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/17/20 8:45 AM, Adrian Bunk wrote:
> On Sun, May 17, 2020 at 03:56:20PM +0200, Martin Jansa wrote:
>> ...
>> so upgrading
>> from e.g. initial release revision of dunfell to latest in oe-core tog=
ether
>> with all other layers,
>> ...
>=20
> Your "together" is an assumption that is not always true in my experien=
ce.
>=20
>> Point releases are nice, but people should really use whatever is late=
st
>> revisions in the branches they use and that's IMHO the recommendation =
from
>> Yocto Project itself as well (IIRC we discussed it in OE TSC when talk=
ing
>> about tags for point releases).
>=20
> What often strikes me about OE/Yocto is how far apart what developer=20
> think how things should be done is from what users are actually doing.

This intrigues me and I think we should pay attention to usecases and
try to address them as much as we can, so it would help in perhaps
creating a wiki document or some such on how end users are instrumenting
their distro policies and challenges. How good is layered structure
helping them and how far can it be taken etc.

>=20
> Yocto lacks novice level documentation how users should maintain
> a distribution they got from somewhere for building a product.
>=20
>> Regards,
>=20
> cu
> Adrian
>=20


--TKmvE2hdDi1SftyOBYYB6hkOahP4LGaIJ--

--E08EjZ4vVtDjL5jJLjV3E9UA3J5mMr3k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXsHMmQAKCRC7BTNVkZ0z
FBBJAKCPQfZRJEeGsKnyV34j/k4mt0/zjQCglCitQRHRSQV24VvllXTjfG3mCT4=
=g5Cu
-----END PGP SIGNATURE-----

--E08EjZ4vVtDjL5jJLjV3E9UA3J5mMr3k6--
