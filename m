Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D1DC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 20:08:59 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.24176.1745266138061771218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 13:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MLuoTQCm;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-603ff8e915aso778036eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 13:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745266137; x=1745870937; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FOBHsDeA0x0lCNtpveKGnvqF4OMQhVFz+dTP1/ng5eQ=;
        b=MLuoTQCm0QMMDBUkUcIFCFiLxmtxgF9OKIrj/udTseGHwamg8T8f2YGKclP4t3DaL0
         D9VA1UUJa+9yGobFx4G4CLQTe/N4sUJE+y1bOxYx+cgUSVn6eBdsTBjyxi84W3GbZ18d
         Dsv7tGgARgCwORO3MGlFycxThXAMrN/3rOtTejYvwhdf7u93e7p7oJY8T+hn8D0qv882
         HoPXmrwNlcB7kxkeF2Ps8Q5voekCghpFH0z+LY5l+J5e1lBlcIrOXRodWU5oGbOmnTBU
         tFpa1y8ZaO27oi/uWvv3YnSwtJ+MctelzljZGORG3q7zoaPwAdY1GSupK2oObozUQBYp
         HatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745266137; x=1745870937;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOBHsDeA0x0lCNtpveKGnvqF4OMQhVFz+dTP1/ng5eQ=;
        b=K81f0IoweTbQGVyybO3OPzHpGNYC50WgmNLzVzM9a3bFkMTIKbqSU17eV9XTlpA4bM
         yweYRVIqt8QHXsZM60t5Z4CRxUWCJum0h4lyIjHIYpMBqRNAp0lsAlNbuBRlaxaXCrsS
         yh7IzH04oBHI28pVqTF4H8DCJxf8FS6Y8DY4LRJnrr8Rbx+1Y6NlJIoexrqVG+1E8MZJ
         yp+vciOt9pg7ESE8C4p8isigfZpITg0YuY1uny5N4WCceOTLgjvIRKZXQdsoOLxo7RK8
         Pcrl+1Dvz5KPrcl1CS30ZN8uYY/QJUBT9fmSLHOonXJ/iHmajL+q3f9zOpThkm6A1l/D
         ODHw==
X-Gm-Message-State: AOJu0Yy+zxcHE4GhYT7Io1I1oi0U9lDCrCNYgnJrR8Rq4AWAQUtgPowT
	EsD7D8hoDOrwbDZPX+KfpWMAiJ/wilIW/XeFD9jXr48JmZZ8JIso
X-Gm-Gg: ASbGncvDNi6FawnBgaZnLZHyxJto00cpVenGPPQKmipHLGTp7zlGAgK9gMO5nsKkypm
	C0P3JHaX0w5j6/A3wFf5a/jC8qSAxLkgiQFXuau4D+58o0x41Pf2czjniLdWklYl/pyBku+HKJi
	r3JWbgIWEAUOfumCELKiGQ0c2KxgSD01FjxpRrYt8qQ0X6X1IIWgf+q87ISDnEBoiPtaCW8K8su
	XST78dvogBE1boiPhSc68lzwqdLVvS5a31WwLwcwErHHBjT47BlU5O+AEusTZblVVDscEmtENSs
	9fzqsDk4HkBtlq4NhyE+oeEyWnJ2FThul5Xi+NIVw/089Wk1QlAhTcyJqWzneakR8ruOifz3FTM
	QwM8PpCUcBIXfCI+BEkSF3LQ3zsDj
X-Google-Smtp-Source: AGHT+IHeI5BkSDCggagKNPOlOTgT+Fw2oFfXhrcFzLPb8lg8BkyESdLm5p0hV4hHX+Z7QMTbI06FDw==
X-Received: by 2002:a05:6820:2226:b0:603:f903:c85a with SMTP id 006d021491bc7-606005462acmr6816917eaf.4.1745266137061;
        Mon, 21 Apr 2025 13:08:57 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:5165:5b01:68ad:eb5f? ([2601:646:8201:fd20:5165:5b01:68ad:eb5f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff5fcd49sm1736782eaf.24.2025.04.21.13.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 13:08:56 -0700 (PDT)
Message-ID: <8fb27f46-31b1-4840-8889-92cf59bf22d9@gmail.com>
Date: Mon, 21 Apr 2025 13:08:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250417151813.2295435-1-ross.burton@arm.com>
 <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ov1AbnB7EhjCnfoQqMQ8crxu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 20:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215184

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ov1AbnB7EhjCnfoQqMQ8crxu
Content-Type: multipart/mixed; boundary="------------SIy3DNUpCC8Nus5MGwuQSys1";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <8fb27f46-31b1-4840-8889-92cf59bf22d9@gmail.com>
Subject: Re: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
References: <20250417151813.2295435-1-ross.burton@arm.com>
 <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
In-Reply-To: <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>

--------------SIy3DNUpCC8Nus5MGwuQSys1
Content-Type: multipart/mixed; boundary="------------hPZqlnC0OFEYQcYedVI5OJjj"

--------------hPZqlnC0OFEYQcYedVI5OJjj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xNy8yNSA4OjE5IEFNLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyB3cm90ZToNCj4gSeKAmWQgYWN0dWFsbHkgbGlrZSB0byBzZWUgdGhpcyBtZXJnZWQg
aW50byB3YWxuYXNjYXI6IHRoZSBjaGFuZ2VzIGFyZSBtaW5pbWFsIGFuZCBzaGlwcGluZyBh
IHJlbGVhc2UgYW5kIG5vdCBhIFJDIGlzIGEgZ29vZCB0aGluZy4NCj4gDQoNClllYWguIFRo
ZSBjaGFuZ2VzIGFyZSBub3QgdG9vIGludHJ1c2l2ZSBhcyBpdCBzZWVtcy4NCg0KPiBSb3Nz
DQo+IA0KPj4gT24gMTcgQXByIDIwMjUsIGF0IDE2OjE4LCBSb3NzIEJ1cnRvbiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4+DQo+PiBhdXRvY29uZiAyLjcyZSB3YXMgdGhlIGZpZnRo
IHJlbGVhc2UgY2FuZGlkYXRlIGJ1aWxkLCBhbmQgd2hpbHN0IHdlIGhhZA0KPj4gZ29vZCBy
ZWFzb24gdG8gdXNlIFJDcyBkdXJpbmcgZGV2ZWxvcG1lbnQgd2UgZmFpbGVkIHRvIG5vdGlj
ZSB0aGF0IHRoZQ0KPj4gZmluYWwgcmVsZWFzZSB3YXMgbWFkZSBiZWNhdXNlIGFscGhhLmdu
dS5vcmcgX29ubHlfIGNvbnRhaW5zIHRoZSByZWxlYXNlDQo+PiBjYW5kaWRhdGVzLg0KPj4N
Cj4+IFRoZXJlIGFyZSBtaW5pbWFsIGNoYW5nZXMgaW4gdGhlIGZpbmFsIHJlbGVhc2UgY29t
cGFyZWQgdG8gMi43MmU6DQo+Pg0KPj4gNjE5OWNmZjIgKHRhZzogdjIuNzIpIEZpbmFsaXpl
IE5FV1MgZm9yIHJlbGVhc2UgMi43Mi4NCj4+DQo+PiAgIFRoaXMgaXMgdGhlIGZpbmFsaXNh
dGlvbiBvZiB0aGUgcmVsZWFzZSwgdXBkYXRpbmcgZG9jdW1lbnRhdGlvbiBhbmQNCj4+ICAg
dmVyc2lvbiBudW1iZXJzLg0KPj4NCj4+IGU1NDRhMzIzIFNhdmUvcmVzdG9yZSBBQ19MQU5H
IHNldHRpbmcgaW4gQUNfUFJPR19DQ19DX08uDQo+Pg0KPj4gICBUaGlzIGlzIGEgYnVnIGZp
eCwgYWxpZ25pbmcgYmVoYXZpb3VyIG9mIEFDX1BST0dfQ0NfQ19PLg0KPj4NCj4+IDYzNGZi
M2U3IFJlbW92ZSBiYXNoaXNtIGZyb20gdGVzdHMvbG9jYWwuYXQuDQo+PiA0ZmJlNjQzNiBS
ZXZlcnQgZGVidWdnaW5nIGNoYW5nZSBjb21taXR0ZWQgYnkgbWlzdGFrZQ0KPj4gODc5NGNk
MWMgQWRkcmVzcyDigJxhdXRvbTR0ZSBwcmVzZWxlY3Rpb25z4oCdIHRlc3RzdWl0ZSBmYWls
dXJlDQo+PiBlNWQ5OGY0YyBBdm9pZCBhIHNwdXJpb3VzIHRlc3QgZmFpbHVyZSB3aXRoIHNo
ZWxscyB0aGF0IGlnbm9yZSB3cml0ZSBlcnJvcnMuDQo+PiAzZmJmYjEzZSBBZGRyZXNzIOKA
nGF1dG9jb25mOiBmb3JiaWRkZW4gdG9rZW5zLCBiYXNpY+KAnSB0ZXN0c3VpdGUgZmFpbHVy
ZQ0KPj4gZmRiNThkZjYgdGVzdHN1aXRlOiBTa2lwIHRlc3RzIHRoYXQgdXNlIGFjbG9jYWwg
b3IgYXV0b21ha2UgaWYgdGhleeKAmXJlIHRvbyBvbGQuDQo+Pg0KPj4gICBUaGVzZSBhcmUg
Zml4ZXMgZm9yIHRoZSB0ZXN0IHN1aXRlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPj4gLS0tDQo+PiAuLi4vYXV0b2NvbmYv
e2F1dG9jb25mXzIuNzJlLmJiID0+IGF1dG9jb25mXzIuNzIuYmJ9ICAgICAgICAgIHwgNCAr
Ky0tDQo+PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPj4gcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi97YXV0b2NvbmZf
Mi43MmUuYmIgPT4gYXV0b2NvbmZfMi43Mi5iYn0gKDk0JSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9jb25mL2F1dG9jb25mXzIuNzJlLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9jb25mL2F1dG9jb25mXzIuNzIuYmINCj4+IHNp
bWlsYXJpdHkgaW5kZXggOTQlDQo+PiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXV0b2NvbmYvYXV0b2NvbmZfMi43MmUuYmINCj4+IHJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYXV0b2NvbmYvYXV0b2NvbmZfMi43Mi5iYg0KPj4gaW5kZXggZGIzNzQz
NzNjZmYuLmYyZDI3ODFmZWM5IDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2F1dG9jb25mL2F1dG9jb25mXzIuNzJlLmJiDQo+PiArKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYXV0b2NvbmYvYXV0b2NvbmZfMi43Mi5iYg0KPj4gQEAgLTEyLDcgKzEyLDcg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Y2MzZjNhNzU5NmNi
NTU4YmJkOWViN2ZiYWEzZWYxNmMgXA0KPj4gICAgIGZpbGU6Ly9DT1BZSU5HdjM7bWQ1PTFl
YmJkM2UzNDIzN2FmMjZkYTVkYzA4YTRlNDQwNDY0Ig0KPj4NCj4+IFNSQ19VUkkgPSAiIFwN
Cj4+IC0gICAgICAgICAgIGh0dHBzOi8vYWxwaGEuZ251Lm9yZy9nbnUvYXV0b2NvbmYvJHtC
UH0udGFyLmd6IFwNCj4+ICsgICAgICAgICAgICR7R05VX01JUlJPUn0vYXV0b2NvbmYvJHtC
UH0udGFyLmd6IFwNCj4+ICAgICAgICAgICAgIGZpbGU6Ly9wcm9ncmFtX3ByZWZpeC5wYXRj
aCBcDQo+PiAgICAgICAgICAgICBmaWxlOi8vYXV0b3JlY29uZi1leGNsdWRlLnBhdGNoIFwN
Cj4+ICAgICAgICAgICAgIGZpbGU6Ly9yZW1vdmUtdXNyLWxvY2FsLWxpYi1mcm9tLW00LnBh
dGNoIFwNCj4+IEBAIC0yMiw3ICsyMiw3IEBAIFNSQ19VUkkgPSAiIFwNCj4+ICINCj4+IFNS
Q19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovL25vLW1hbi5wYXRjaCINCj4+
DQo+PiAtU1JDX1VSSVtzaGEyNTZzdW1dID0gImYzNDc4ZDNiNTk3ZDUxZjVkNjE1OTZmYjJm
NmY2YWJhNDljZGQ5NzRiNGIwNWZmMGJhYzU3ZjU2YjVjZmRiMzkiDQo+PiArU1JDX1VSSVtz
aGEyNTZzdW1dID0gImFmYjE4MWE3NmUxZWU3MjgzMmY2NTgxYzBlZGRmOGRmMDMyYjgzZTJl
MDIzOWVmNzllYmVkYzQ0NjdkOTJkNmUiDQo+Pg0KPj4gUkRFUEVORFM6JHtQTn0gPSAibTQg
Z251LWNvbmZpZyBcDQo+PiAgIHBlcmwgXA0KPj4gLS0gDQo+PiAyLjQzLjANCj4+DQo+Pg0K
Pj4NCj4+DQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3
L1JlcGx5IE9ubGluZSAoIzIxNTEwMCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjE1MTAwDQo+IE11dGUgVGhpcyBUb3Bp
YzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjMxNTE0Ni8xOTk3OTE0
DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==
--------------hPZqlnC0OFEYQcYedVI5OJjj
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------hPZqlnC0OFEYQcYedVI5OJjj--

--------------SIy3DNUpCC8Nus5MGwuQSys1--

--------------ov1AbnB7EhjCnfoQqMQ8crxu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAal1wUDAAAAAAAKCRC7BTNVkZ0zFAjL
AJ0bBBYL1GZBNk5eprHvj4sye12IMACePlfQKChzHXZd5ZdKwzyMPy0cvfU=
=kB1e
-----END PGP SIGNATURE-----

--------------ov1AbnB7EhjCnfoQqMQ8crxu--

