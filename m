Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF70C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:21:11 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.9293.1667323264287326246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dNEdw8RI;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so19464493pji.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PfAvp8k2fyiIpWrQ64PamdvsmMheO0jw+eIRgBU6x9g=;
        b=dNEdw8RIgj/L4fPlLUMiwsniGucx7qTpnl2jPtupONZqnV6dbaY+k19eCk1uLidWUQ
         KKZ9hEys/kmJ0GkUmtahzplYrzS3SPhsXrpbZoA4srOMOowH1dUUBKpc1AzwUjYZYPNP
         cY44OTXWCA9isVr5lu7kpGL29XzWwZNLH7/Qxok0EJHjKl/95dNAMqiR6nG9Vvof4mC/
         p5ARSR1snIIn0cGv9d5ci20qmANadiZ8qRD5q492ZnZHFeJwKZ981idXqsWINZPzpZZ7
         oUlIPv+GLaP8VX5672AAOGl1dhmfLhOnKP4UMfwGXqQ9pk4Asso1f0U7g7s6B9RRqiqP
         /Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfAvp8k2fyiIpWrQ64PamdvsmMheO0jw+eIRgBU6x9g=;
        b=3S97EQce6HhUFjPMIsoolucZMoru33DJNDsTAY23xgDegZklDcotUa1LwGxkuM34/H
         EWdsVojFWoJhNp0by+qUF5pYs0cRdKzmw9NgV2btifMOOARe0/MK8mF28l7ETc7IlR3/
         fG3inKtEsqzmK3kgGU7ZT9IIS2dZijc1XMCbyae41sRVYwqjGWGcxKR7jTRDlo9fwUWm
         UTkmVrgXwfG6sQfC4vGbBMlBctZm0jbfzewa0HLCeMQR3nnKN2tfV2D9lvwHoVNkloIR
         xHfVTHWCaRmJVotPJ2TbhvY8WK4aw58S4aPEm+d8yaGT/XU09k7ihVH4CI12VvQ0d+Og
         GceQ==
X-Gm-Message-State: ACrzQf003C00jAX/ldwTq8k0dsFOzHRh1Np8zSISrCUnE59HpOWA/sH+
	//F5o5qDOpSWcWocDJtZVJ8=
X-Google-Smtp-Source: AMsMyM4R74Nfv4WYM0vlUJG5rHzLKeEac/JU5wRobdTfsIlNqo6NFQczKO89MCLAU8+IYvZNFts1dw==
X-Received: by 2002:a17:902:8205:b0:185:33e:2a0e with SMTP id x5-20020a170902820500b00185033e2a0emr20412737pln.92.1667323263530;
        Tue, 01 Nov 2022 10:21:03 -0700 (PDT)
Received: from ?IPV6:2601:646:9181:1cf0:5578:475c:27e4:6168? ([2601:646:9181:1cf0:5578:475c:27e4:6168])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902ecc300b00186e34524e3sm6642345plh.136.2022.11.01.10.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 10:21:02 -0700 (PDT)
Message-ID: <0d990cdc-e424-f4c9-007d-8a31c9149353@gmail.com>
Date: Tue, 1 Nov 2022 10:21:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [OE-core] [PATCH] perf: Depend on native setuptools3
To: Fabio Estevam <festevam@gmail.com>, akuster808@gmail.com,
 Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20221011030216.3874881-1-raj.khem@gmail.com>
 <CAOMZO5BZQFHDYgA99ymw_zL12Qsmg9yzkLwqYRDUh5x53b9ZKg@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CAOMZO5BZQFHDYgA99ymw_zL12Qsmg9yzkLwqYRDUh5x53b9ZKg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sUs2m7ZO1dhXrvX6evZu5mLV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172371

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sUs2m7ZO1dhXrvX6evZu5mLV
Content-Type: multipart/mixed; boundary="------------aY2ci0z0bDxOpifdg42OCDjI";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Fabio Estevam <festevam@gmail.com>, akuster808@gmail.com,
 Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <0d990cdc-e424-f4c9-007d-8a31c9149353@gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Depend on native setuptools3
References: <20221011030216.3874881-1-raj.khem@gmail.com>
 <CAOMZO5BZQFHDYgA99ymw_zL12Qsmg9yzkLwqYRDUh5x53b9ZKg@mail.gmail.com>
In-Reply-To: <CAOMZO5BZQFHDYgA99ymw_zL12Qsmg9yzkLwqYRDUh5x53b9ZKg@mail.gmail.com>

--------------aY2ci0z0bDxOpifdg42OCDjI
Content-Type: multipart/mixed; boundary="------------PLtgw3dXBB8W53tOFWgC2el9"

--------------PLtgw3dXBB8W53tOFWgC2el9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMS8yMiAxMDoxMSBBTSwgRmFiaW8gRXN0ZXZhbSB3cm90ZToNCj4gSGkgQXJtaW4s
DQo+IA0KPiBPbiBUdWUsIE9jdCAxMSwgMjAyMiBhdCAxMjowMiBBTSBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPiB3cm90ZToNCj4+DQo+PiBwZXJmIGhhcyBuZWVkIGZvciBweXRo
b24gc2V0dXB0b29scyB3aGVuIHNjcmlwdGluZyBpcyBlbmFibGVkDQo+PiBmcm9tIDYuMC4w
IG9ud2FyZHMgaXQgc2VlbXMgdG8gdGhyb3cgYW4gZXhwbGljaXQgZXJyb3INCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPj4gQ2M6IEJy
dWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQo+IA0KPiBUaGlzIG9u
ZSBsYW5kZWQgaW4gbWFzdGVyOg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVk
L29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC9kYTNkMDAxNzg4MDliYmY3Y2M0NTM0MDFlMGM1
OTM3Nzk2ZWJjMmMxDQo+IA0KPiBDb3VsZCBpdCBiZSBiYWNrcG9ydGVkIHRvIGtpcmtzdG9u
ZSB0b28/DQo+IA0KPiBJIGFtIGZhY2luZyBhbiBlcnJvciB3aGVuIGJ1aWxkaW5nIGEgNi4w
IGtlcm5lbCBhbmQgdGhpcyBjb21taXQgaW4NCj4gbWFzdGVyIGZpeGVzIGl0Lg0KPiANCj4g
VGhhbmtzDQoNCitTdGV2ZQ0KDQo=
--------------PLtgw3dXBB8W53tOFWgC2el9
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------PLtgw3dXBB8W53tOFWgC2el9--

--------------aY2ci0z0bDxOpifdg42OCDjI--

--------------sUs2m7ZO1dhXrvX6evZu5mLV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCY2FVfQUDAAAAAAAKCRC7BTNVkZ0zFA20
AKCHE38k2OJsGFPp7SOV+k6FAZxjQACeOB5FIFC8b9FN3FgvBoNi1r67KD8=
=3K12
-----END PGP SIGNATURE-----

--------------sUs2m7ZO1dhXrvX6evZu5mLV--

