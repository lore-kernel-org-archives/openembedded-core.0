Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F5EC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 16:22:26 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.1529.1692894139031504788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 09:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZOGv2LuF;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6b9a2416b1cso26568a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692894138; x=1693498938;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Jp0Mo0+ZX7c/fCqFRpH6Te9wmGQ50IOhXyWo8uqavk=;
        b=ZOGv2LuFgJH3zictnvf4GSS6JduqaaFLY2Apn1DULaEpNJaSedkiGpA6DBbxWOoLv1
         OTVA1yWA2YTTfXfnaJyKxLwL2s8BKfQ/8Gdhb7tBxD2bOXHJfOZ7VRQ73LK4zUjWuoB6
         TfVb1IuT5nmmYMXMXdJQwy79oBDsXHV4Heb4pukFyUVDmgmqLIhFT6VuAmsaLRLIqmgF
         DG18OGuPAIOp27kfNiq2Jj3zpqKOoWzboPLFj50fHaCFLx8DTVr0mBSyuP9SWw8GpDaC
         Vpp4rkwxkVF+IUctA09Z9eP7CY+sqMQ5ORWClZYEPoC4weptwJxt5LeoOP6ch64ybxSt
         T1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692894138; x=1693498938;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Jp0Mo0+ZX7c/fCqFRpH6Te9wmGQ50IOhXyWo8uqavk=;
        b=fzlBHPgOul5zXz0qw7ZUsd2SgKEVT5egJ1EoEnmbxfdc9hWRtAlCxtRARFDObvviM2
         cYuWBZXn3SmLJSA1Qr0c98XhJvFnTjc8/+ASMT2WSyfYhmTT/f1j/NEvYBmwCCKxgeA1
         KS9jkELoVMuTNtQuQlvwXTPV3bHANyNyic7Jl2SjDiBzttqnQobpJMxyVTUPKBjSt95F
         24z+UCXuwJz3ph86ltFo/ekNpDvNr5ua0W3ZHxaKvwCgsViAVTiL1Bz2Qj11jLn8EHub
         +Wo1EYsXDepUgnB2swTqT2GHdV67FPxdiwRwd4Wjn7AthIGLdcLkYcMQfOSwicCWONm3
         vypA==
X-Gm-Message-State: AOJu0Yy0CESeWYcVKaxEYnpMDsSZ+SQcM6kRWrodoOC6/cwox/CRV/We
	TCqEg1Ui1kuZQHYxcCmZBGE=
X-Google-Smtp-Source: AGHT+IG4pmrU3UfSZJ66Fy4aOwI6LjYXrtX8vq2pz2AT4q1HDeQaWfHbYoNAVCQAJjglIIoo9mGd7Q==
X-Received: by 2002:a9d:6c18:0:b0:6bc:bc3e:f40b with SMTP id f24-20020a9d6c18000000b006bcbc3ef40bmr3121059otq.19.1692894138126;
        Thu, 24 Aug 2023 09:22:18 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:6913:fff9:a0c5:98b5? ([2601:646:9100:2cb0:6913:fff9:a0c5:98b5])
        by smtp.gmail.com with ESMTPSA id r15-20020a056830134f00b006b8c6eb962esm6744032otq.52.2023.08.24.09.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 09:22:16 -0700 (PDT)
Message-ID: <308ab36b-5095-4584-a3ba-89e583b4a4f6@gmail.com>
Date: Thu, 24 Aug 2023 09:22:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] init-manager-systemd.inc: update
 KERNEL_FEATURES
To: Kai Kang <kai.kang@eng.windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20230824090714.2911613-1-kai.kang@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230824090714.2911613-1-kai.kang@windriver.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------COKcg5BPIZATbk2gHe1GwMor"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 16:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186670

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------COKcg5BPIZATbk2gHe1GwMor
Content-Type: multipart/mixed; boundary="------------2uugnzQ7JEEzkrBkPYkcyhOX";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Kai Kang <kai.kang@eng.windriver.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <308ab36b-5095-4584-a3ba-89e583b4a4f6@gmail.com>
Subject: Re: [OE-core] [PATCH] init-manager-systemd.inc: update
 KERNEL_FEATURES
References: <20230824090714.2911613-1-kai.kang@windriver.com>
In-Reply-To: <20230824090714.2911613-1-kai.kang@windriver.com>

--------------2uugnzQ7JEEzkrBkPYkcyhOX
Content-Type: multipart/mixed; boundary="------------f30MXzXi6e0dGhTbMnvSU09N"

--------------f30MXzXi6e0dGhTbMnvSU09N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8yNC8yMyAyOjA3IEFNLCBLYWkgS2FuZyB3cm90ZToNCj4gRnJvbTogS2FpIEthbmcg
PGthaS5rYW5nQHdpbmRyaXZlci5jb20+DQo+IA0KPiBBcHBlbmQgY2ZnL3N5c3RlbWQuc2Nj
IHRvIGluaXQtbWFuYWdlci1zeXN0ZW1kLmluYyB3aGljaCBlbmFibGVzIGtlcm5lbA0KPiBj
b25maWcgQ09ORklHX0ZIQU5ETEUuIFRoZSBjb25maWcgaXMgcmVxdWlyZWQgYnkgc3lzdGVt
ZCA+PSAyMDkgWzFdOg0KPiANCj4gICAgeW91IGhhdmUgdG8gZW5hYmxlIENPTkZJR19GSEFO
RExFIGluIHlvdXIga2VybmVsIHRvIHVzZSBzeXN0ZW1kID49IDIwOQ0KPiAgICBzdWNjZXNz
ZnVsbHksIG90aGVyd2lzZSB1ZGV2IHdvbid0IGZpbmQgYW55IGRldmljZXMuDQo+IA0KPiBb
MV06IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL3N5c3RlbWQtZGV2
ZWwvMjAxNC1GZWJydWFyeS8wMTczNjIuaHRtbA0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2Fp
IEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgIG1ldGEvY29uZi9k
aXN0cm8vaW5jbHVkZS9pbml0LW1hbmFnZXItc3lzdGVtZC5pbmMgfCAxICsNCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2Nv
bmYvZGlzdHJvL2luY2x1ZGUvaW5pdC1tYW5hZ2VyLXN5c3RlbWQuaW5jIGIvbWV0YS9jb25m
L2Rpc3Ryby9pbmNsdWRlL2luaXQtbWFuYWdlci1zeXN0ZW1kLmluYw0KPiBpbmRleCA1OTVk
MWYyNjQ0Li44ZjQ1YTg3YjUwIDEwMDY0NA0KPiAtLS0gYS9tZXRhL2NvbmYvZGlzdHJvL2lu
Y2x1ZGUvaW5pdC1tYW5hZ2VyLXN5c3RlbWQuaW5jDQo+ICsrKyBiL21ldGEvY29uZi9kaXN0
cm8vaW5jbHVkZS9pbml0LW1hbmFnZXItc3lzdGVtZC5pbmMNCj4gQEAgLTUsMyArNSw0IEBA
IFZJUlRVQUwtUlVOVElNRV9pbml0X21hbmFnZXIgPz89ICJzeXN0ZW1kIg0KPiAgIFZJUlRV
QUwtUlVOVElNRV9pbml0c2NyaXB0cyA/Pz0gInN5c3RlbWQtY29tcGF0LXVuaXRzIg0KPiAg
IFZJUlRVQUwtUlVOVElNRV9sb2dpbl9tYW5hZ2VyID8/PSAic2hhZG93LWJhc2UiDQo+ICAg
VklSVFVBTC1SVU5USU1FX2Rldl9tYW5hZ2VyID8/PSAic3lzdGVtZCINCj4gK0tFUk5FTF9G
RUFUVVJFUzphcHBlbmQgPSAiIGNmZy9zeXN0ZW1kLnNjYyINCj4gDQoNCkNhbiB0aGlzIGJl
IGFsd2F5cyBlbmFibGVkID8gdWRldiBpcyB1c2VkIHdpdGggc3lzdmluaXQgdG9vLg0KPiAN
Cj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBh
bGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAo
IzE4NjY1MCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL21lc3NhZ2UvMTg2NjUwDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMDkzMjA1NC8xOTk3OTE0DQo+IEdyb3VwIE93bmVy
OiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVu
c3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS91bnN1YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09
LT0tPS09LQ0KPiANCg==
--------------f30MXzXi6e0dGhTbMnvSU09N
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------f30MXzXi6e0dGhTbMnvSU09N--

--------------2uugnzQ7JEEzkrBkPYkcyhOX--

--------------COKcg5BPIZATbk2gHe1GwMor
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZOeDtwUDAAAAAAAKCRC7BTNVkZ0zFFuP
AJ0Yr8hOtZP1N00lYhdgBbdyNL76oACfdm8lorfvIwC+4Pw9yydHr4mMxMk=
=Q5y+
-----END PGP SIGNATURE-----

--------------COKcg5BPIZATbk2gHe1GwMor--

