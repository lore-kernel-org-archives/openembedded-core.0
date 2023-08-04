Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D420C001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 15:37:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.452.1691163437104227054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 08:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=okm01eDk;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bba48b0bd2so15791645ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691163436; x=1691768236;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MpTunY3N0pMJROtKVIKbIH9BqF3snu2rLNBCdfL8J9k=;
        b=okm01eDkJwPiNkLay/1YDZa4jGMbXw2AMTLsrxS6zES2DY2sISsp8PoRpAq09K6Pk2
         Ptny2uvVLn3WjEOo8DD/1pkiBPRPJ0/jZM8zaBloEwbHxVZNZc4BUdctpfaTkOKmhV/T
         DoDsz6cxZVfc426g/C30IxvpTPxfZeEqig1PtMWpE8gOsOdUjf+p6YVZIDv1xOPl6Bj2
         XFTNlWV0xmDewn8cwSxCQyijbwgzSgDAt8QYDZcBiVpdrmI9m5oUxUa9/doz4Cimo9Fx
         Swco6Qeuhr+TaskemvkFxCMTqs8xkfXUFzADL7qQY1FEU55RpNmaA7ixy0I9XMTZ7Ts4
         2uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163436; x=1691768236;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpTunY3N0pMJROtKVIKbIH9BqF3snu2rLNBCdfL8J9k=;
        b=f0zUWWYh9VmjskV5qi9yUsAbFXaZvm+vgIIEqMS4RCyWmNwkSPWSjd1f2zYhEYFfOW
         QyHQLMYysPQLt/nHuk5c1jJDiq3sQUqhy5O/B4h84XUVW6sAKiKL0lFMzNKuLCxVo/wq
         bd2u5juwg0Cny9obKSI0ONArOvHAy6nA9nUTqqDMhxdTborNJatMWvLE5LJmNG34WA2I
         ecd1GxWBGYg+cELLJ/ZBGmErsc6t2X78k5kVYNi+grjQEIj9zexWyNH7CJ9nwtbb7O4i
         hYY6OUSVkR1QyQ5Dkx9XlsQEYqiNRFhFKYSrxH0Qu//VYIex6xt7e0cFQQC2Gxx8fwPg
         MRNA==
X-Gm-Message-State: AOJu0YyHhMcOooRbrsvoDqG0S/SV8Sxsr85K3YHO+zqDHLCCXl5QxR9N
	/oIkT7RsZwF+sWY/6L4Md1A=
X-Google-Smtp-Source: AGHT+IGswd5abV5YWn/4du/0n+PE+WmgeB0z6z8zlGyCSjFtw4A9kSvrgxIFsYhIUyIpwOTGwgkHFQ==
X-Received: by 2002:a17:903:249:b0:1bb:1e69:28be with SMTP id j9-20020a170903024900b001bb1e6928bemr2337115plh.42.1691163436390;
        Fri, 04 Aug 2023 08:37:16 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:e10f:1389:7a54:3ff7? ([2601:646:9100:2cb0:e10f:1389:7a54:3ff7])
        by smtp.gmail.com with ESMTPSA id b10-20020a170902a9ca00b001bbdf33b878sm1900578plr.272.2023.08.04.08.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 08:37:15 -0700 (PDT)
Message-ID: <fa0b7333-1d12-4522-b7c0-2b2c79046bac@gmail.com>
Date: Fri, 4 Aug 2023 08:37:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd: Point to target binary paths for
 loadkeys and setfont
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Luca Boccassi <luca.boccassi@microsoft.com>
References: <20230803043937.45082-1-raj.khem@gmail.com>
 <7496D22A-5DE7-44D7-8F2A-F2EFAA5354CA@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <7496D22A-5DE7-44D7-8F2A-F2EFAA5354CA@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J0PUZ1LIHoARINHEXdwqgKlE"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 15:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185528

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J0PUZ1LIHoARINHEXdwqgKlE
Content-Type: multipart/mixed; boundary="------------ejuc0Tb32PEpYjcL30BFNlor";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Luca Boccassi <luca.boccassi@microsoft.com>
Message-ID: <fa0b7333-1d12-4522-b7c0-2b2c79046bac@gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Point to target binary paths for
 loadkeys and setfont
References: <20230803043937.45082-1-raj.khem@gmail.com>
 <7496D22A-5DE7-44D7-8F2A-F2EFAA5354CA@arm.com>
In-Reply-To: <7496D22A-5DE7-44D7-8F2A-F2EFAA5354CA@arm.com>

--------------ejuc0Tb32PEpYjcL30BFNlor
Content-Type: multipart/mixed; boundary="------------rbeqyFziFee5cZfJuNvq02pt"

--------------rbeqyFziFee5cZfJuNvq02pt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC80LzIzIDg6MjcgQU0sIFJvc3MgQnVydG9uIHdyb3RlOg0KPiBPbiAzIEF1ZyAyMDIz
LCBhdCAwNTozOSwgS2hlbSBSYWogdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJhai5r
aGVtPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+ICsgICAg
ICAgICAgICAgICAgICAtRGxvYWRrZXlzLXBhdGg9JHtiYXNlX2JpbmRpcn0vbG9hZGtleXMg
XA0KPj4gKyAgICAgICAgICAgICAgICAgIC1Ec2V0Zm9udC1wYXRoPSR7YmFzZV9iaW5kaXJ9
L3NldGZvbnTigJ0NCj4gDQo+IA0KPiAgRnJvbSBzeXN0ZW1jdGwgc3RhdHVzIHN5c3RlbWQt
dmNvbnNvbGUtc2V0dXA6DQo+IA0KPiBBdWcgMDQgMTU6MTI6MjEgcWVtdS1nZW5lcmljLWFy
bTY0IHN5c3RlbWQtdmNvbnNvbGUtc2V0dXBbMjkwXTogL2Jpbi9sb2Fka2V5cyBmYWlsZWQg
d2l0aCBleGl0IHN0YXR1cyAxLg0KPiANCj4gcm9vdEBxZW11LWdlbmVyaWMtYXJtNjQ6fiMg
d2hpY2ggbG9hZGtleXMNCj4gL3Vzci9iaW4vbG9hZGtleXMNCj4gDQo+ICQgb2UtcGtnZGF0
YS11dGlsIGZpbmQtcGF0aCAqL2xvYWRrZXlzDQo+IGtiZDogL3Vzci9iaW4vbG9hZGtleXMN
Cg0KDQpIbW0sIG15IGRpc3RybyB1c2VzIHVzcm1lcmdlIGFuZCBiaW5kaXIgYW5kIGJhc2Vf
YmluZGlyIGFyZSBzYW1lLCBoZW5jZSANCkkgbWlzc2VkIGl0LiBhbGwgZGlzdHJvcyBoYXZl
IGRpZmZlcmVudCBsb2NhdGlvbiB0byBwdXQgdGhlc2UgYmluYXJpZXMgDQpzYWRseS4NCg0K
PiANCj4gUGF0Y2ggaW5jb21pbmcuDQo+IA0KDQpUaGFua3MNCi1LaGVtDQoNCj4gUm9zcw0K

--------------rbeqyFziFee5cZfJuNvq02pt
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------rbeqyFziFee5cZfJuNvq02pt--

--------------ejuc0Tb32PEpYjcL30BFNlor--

--------------J0PUZ1LIHoARINHEXdwqgKlE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZM0bKgUDAAAAAAAKCRC7BTNVkZ0zFMDp
AJ96jPGAL3ff1zCnyKI43uitXykOLwCfXPQ8GXHC16YMPwFkwxFOjtpG97E=
=2+cm
-----END PGP SIGNATURE-----

--------------J0PUZ1LIHoARINHEXdwqgKlE--

