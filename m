Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.32608.1589759241771882057
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 16:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=clGdnUOW;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id v63so4086207pfb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 16:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=rPScP2tbljcXMm8Fn6jPrdNSTYouYRKEMlZHz7s0wk4=;
        b=clGdnUOW6ign0bX+PxY7ZiF9sYRL2BLdVmiGVpbgPt2bRDyl8A3VQIlqE7hC0fZ6fV
         wr8JWOUIImTyHdokTDilTKOO6lHZPwlC7vz1ZCUgcuJL79iDlCpBHbB87NByBK8lauiY
         NNEiAtEVmuODdyIH7qJJ1exF/NVf59JRAL1YSqV7VcnM3Z30QpRVwlarSX2Znsr8PdRl
         1DW9dgrHNvIZOvjhmrRIW+UUDLaYPYvKGG0GfUohpgo8RKR0ZZzJUUDBLUdK5h3M1rqe
         W+0UEvdVIOxmMgjbviT/AKtU23FC4raalJGkNT2KA1KTz5APJ3Ya5LNfBNako17tY8eF
         KcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=rPScP2tbljcXMm8Fn6jPrdNSTYouYRKEMlZHz7s0wk4=;
        b=GWJ6KOHq/T9aTmV+f+kxygTDkaS5fWpBfAlk7YcWvHXc73BwuAJp7R/CKRh+oHGpCb
         9RcbM5IH0+aVqT0DcCZxOg4EbEVp2Q/aQhgNs+7ILYS1eNn6M+cOjCSf8bjPQxXUwsJc
         oDv1tX61epm4UN2Gv455kj2gNKVqTkq6QMfitG0H57wgWw4K4UyKtV/rJYfJFQESF/nY
         sXxA5M/mdiPzDds3AdC812A1BQoS/OkDNnZSLAvsUQgXRVzJpsOq8NyB+Iw1NpF8VN5g
         prhYCvloZW49rw9Ts+uDFriQICmyuVqoziJnd33BoKZiOmnpPv6+dsbhPejrmMOjIXRr
         Alqg==
X-Gm-Message-State: AOAM533uRko0e1SH199OsAow2O2EHwjbhx9C1bNRbIXv0oGntYK847bK
	eYHZi1+WTZD5NTJBXdyxiHU=
X-Google-Smtp-Source: ABdhPJwZuHmId3ox0GokT2q2Nu7g6dByOaezRaDFBkpy9mJiE88S+x+nWyGYHQn/kvz7MqSzLXFTAw==
X-Received: by 2002:a63:2485:: with SMTP id k127mr12671397pgk.159.1589759240971;
        Sun, 17 May 2020 16:47:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2264? ([2601:646:9200:4e0::2264])
        by smtp.gmail.com with ESMTPSA id y3sm7060232pjb.41.2020.05.17.16.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 16:47:20 -0700 (PDT)
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
References: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
 <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost>
 <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost>
 <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
 <20200517161441.GB16162@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <5731941e-fe0c-e242-bea5-cd0d3c2ef772@gmail.com>
Date: Sun, 17 May 2020 16:47:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200517161441.GB16162@localhost>
X-Groupsio-MsgNum: 138390
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="tEmOY0m2ozWFSlFEYdtDCpZMt9UZ1c2mO"

--tEmOY0m2ozWFSlFEYdtDCpZMt9UZ1c2mO
Content-Type: multipart/mixed; boundary="QGL0zpEOl7KC8TuFXit12b36YrwNBQk2A";
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
Message-ID: <5731941e-fe0c-e242-bea5-cd0d3c2ef772@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
References: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
 <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost>
 <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost>
 <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
 <20200517161441.GB16162@localhost>
In-Reply-To: <20200517161441.GB16162@localhost>

--QGL0zpEOl7KC8TuFXit12b36YrwNBQk2A
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/17/20 9:14 AM, Adrian Bunk wrote:
> On Sun, May 17, 2020 at 06:00:58PM +0200, Martin Jansa wrote:
>> ...
>> But IMHO carrying duplicate recipes in oe-core and meta-oe, just becau=
se
>> some users aren't updating meta-oe, only adds more confusion.
>> ...
>=20
> IMHO moving recipes from meta-openembedded (or other layers) to oe-core=
=20
> in a released stable series is not a good idea.

I think in current form in this situation it certainly seems a bit
complex sadly, however, we also need to explore if there is some "good"
way of doing such changes without breaking distro builders.

>=20
>> Cheers,
>=20
> cu
> Adrian
>=20


--QGL0zpEOl7KC8TuFXit12b36YrwNBQk2A--

--tEmOY0m2ozWFSlFEYdtDCpZMt9UZ1c2mO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXsHNAQAKCRC7BTNVkZ0z
FNpkAJ9bJAhrvU5CqAjUVcYggalnFxed3QCfRtSSJfCKBRhiii2JjbCthToOwCs=
=6q7J
-----END PGP SIGNATURE-----

--tEmOY0m2ozWFSlFEYdtDCpZMt9UZ1c2mO--
