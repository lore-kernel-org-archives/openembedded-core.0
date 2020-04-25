Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.1679.1587789796315451129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 21:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o2RRfyKJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id y25so5831346pfn.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 21:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:references:from:autocrypt:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=rOQhkmksJITU36wwoKjHnWE1ymOqbu3MGj/qUqHCaAg=;
        b=o2RRfyKJ1sNLoOTBagmhNFjYhO3FX+rP/o/5z218MtT092qdG5lyFd7IL4ov/NI7DO
         mrhp+TFNCpBVHJRAogII3uf0fYFjcD5AR3Vd7u819EsmWnjrnPADxVvGT84AQEyzp48h
         xGZEDUAFA/RgNIEct9uyqT/uCB8ZlBrNZlT0KjiRX/9gE2RShtO48wDPqOO01GhAT0zI
         hT6O6z3NikfKKZmPiFJBO0p0vIu8agYjZuWdfQCIgeUTZfSBhZt2ZB/rMq+Y9eUMN04e
         oIuzmPPv5oGTWhTd8kUYQshXhbp9e7eBwiK1W/G2/p9/mMbQKH0Fvae7DX/d/LviXtrn
         aI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:autocrypt:organization
         :subject:message-id:date:user-agent:mime-version:in-reply-to;
        bh=rOQhkmksJITU36wwoKjHnWE1ymOqbu3MGj/qUqHCaAg=;
        b=ouVDWD2yOJnrwqNwPumfUVCOI3LMecV0YyB1IlncaSw74ZjxbBGNCfEMgTQTKx5vd6
         QClszXSdvyVlbV4aUOMkYyMpoDHMkPVVpmVPE3rZVGkEYIdx7KqxH17ciMUDMrBdd4W+
         JttR/FjrkybtQosIh0VFV/jD1mXR9Sxt729vTb2YE+M4v2UAJ8TnGT0pNH+vwufedVKK
         QkQRRFR7sc2AD7omPZtECxD1X16B06LYjuIQ8tyIpAzqXByYogJKKRSPlWYh8W9iKYg8
         enmDK4OxktdG+VqZ17h1gT7/MMMQwuHqvjYTXM8PvKN1GaHi5+CNMFKec2hEnGBP/32H
         dfCg==
X-Gm-Message-State: AGi0PubV3gEPRwZbz3rq2Hqk2PPZOYMaZ7dOOCQ6Cc7UKrucNbmOiuPQ
	6Dkk7FfGIHYNXXH6v8ZxB4QX/bWVmuE=
X-Google-Smtp-Source: APiQypITWcYwYSIgp/6SU7REJeg2H7ZX9lMaFuNHSS+vTM0B5V1+olV6uLQlMEtlczsvCdOPfG9DyA==
X-Received: by 2002:aa7:946d:: with SMTP id t13mr5026976pfq.111.1587789795324;
        Fri, 24 Apr 2020 21:43:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ac76? ([2601:646:9200:4e0::ac76])
        by smtp.gmail.com with ESMTPSA id mn1sm5954369pjb.24.2020.04.24.21.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 21:43:14 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Changqing Li <changqing.li@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200424010941.191578-1-changqing.li@windriver.com>
 <6eb605a6c0ca7eb9a01a253da5ff1618a694da37.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH 1/3] python3-pbr: change shebang to python3
Message-ID: <fe0fde34-92fc-72b6-30f8-6f4c0d801cd9@gmail.com>
Date: Fri, 24 Apr 2020 21:43:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6eb605a6c0ca7eb9a01a253da5ff1618a694da37.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 137455
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="NEOylzg6U9rb79Sq1FwAT0Tl5ToaW1TEo"

--NEOylzg6U9rb79Sq1FwAT0Tl5ToaW1TEo
Content-Type: multipart/mixed; boundary="nrXVV8CIXCXQoIq4uZVdBDqMLExpc2ENr";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Changqing Li <changqing.li@windriver.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <fe0fde34-92fc-72b6-30f8-6f4c0d801cd9@gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] python3-pbr: change shebang to python3
References: <20200424010941.191578-1-changqing.li@windriver.com>
 <6eb605a6c0ca7eb9a01a253da5ff1618a694da37.camel@linuxfoundation.org>
In-Reply-To: <6eb605a6c0ca7eb9a01a253da5ff1618a694da37.camel@linuxfoundation.org>

--nrXVV8CIXCXQoIq4uZVdBDqMLExpc2ENr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/24/20 5:40 AM, Richard Purdie wrote:
> On Fri, 2020-04-24 at 09:09 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> we have offcially dropped python2, so it is possible
>> that our code run on python3 only host, so change
>> shebang to python3 to avoid error like:
>> python: command not found
>=20
> I worry this is going to be the start of a huge pile or unstreamable
> patches. We may have to provide "python" on target but that probably is
> a policy decision we should discuss.
>=20

I think python as python3 is used by some distros, but it sets up for
same py2->py3 problem when python4 comes out, so perhaps calling out
version specific python is a good approach but I think such patches
should be accepted upstream first. OE should not define its own policy
without upstream python's decision to move forward.

> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20


--nrXVV8CIXCXQoIq4uZVdBDqMLExpc2ENr--

--NEOylzg6U9rb79Sq1FwAT0Tl5ToaW1TEo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXqO/2gAKCRC7BTNVkZ0z
FARnAJ4tgnQD633mgxm/Xh/KBzcpKFDoYgCgjdu73NXPqn8wHEBHoavjGKRj7G4=
=xgJ1
-----END PGP SIGNATURE-----

--NEOylzg6U9rb79Sq1FwAT0Tl5ToaW1TEo--
