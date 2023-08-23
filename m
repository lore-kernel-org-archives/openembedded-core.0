Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5547BC79F71
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:48:29 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.1742.1692809301970821935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GhFp7fFz;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68a2e59cf85so3353349b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692809301; x=1693414101;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8YPqwW+jw/Oyi5x8jjzFbtGqxhoX2vph8o48Doz7Xg=;
        b=GhFp7fFzQlxIdwiF8R1T8fVML4vl5vSAVXgVxXTl8zKtd2E5WJUuipJTwAmB4ubjWY
         WJUgrLsoAWHeHYeIcBIpfc3u/fG6l4LvpbVhi/VTVCHGFKIBA1saMT9XcPOIv9KFb1Ym
         qz45y9TV3EWB2ah+5l6vD/xXGAqKR+DLzxdLgbwG9DQNF7+gOy5wdbdzy512Acc8AUfX
         wrlt2ZKWiAhi6a/l9AlRSn/hqtiWqTmU8Pu0BPL/wWfKCPztlMOcwMHtLJCWmm7B00pz
         dlXz3Q7P/Sosnng/NNwD5Csdn0Cj0spelvLyUBEAwT0F9fJZWc4HEs2Xm4gaDAI2xK+/
         ZQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692809301; x=1693414101;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q8YPqwW+jw/Oyi5x8jjzFbtGqxhoX2vph8o48Doz7Xg=;
        b=BqgURI+IsLyZ2c4QsiV39Bc4wtykHbQS8s87oFfNv3pIFtLEytcHhvB3iJonxZQVKd
         X7JgppvtkvfT+X/fq6sJuCqF/bVpfacs8HJwMD1jr15k6EsnoAHwrtJEkt0Haq5glqjJ
         NQynjeGuuy+AwcuFNWV+LT8BNJLVLcJp+rif/aH5HQhaA6U7ZprFEsCl5h2s1k/NsOmu
         OrjrDjfTWXkJDDcRFi6Hez73ek0NBrOf7cWynYpxO3pqTNr84Dxts4M76zL4PsFSoExY
         8ZRsczfG79YgUSqSw/El6awUpk044Q9vehqv8is/3Ssn0F/0TlVHaDWZ1NVha9IE5wX6
         BH+Q==
X-Gm-Message-State: AOJu0YxnuT3SgcgVOiYeO1CLUZppiyND7fC8WfqcR9Um059ruRW4OIcc
	vRkySw1A5mg56IU20tEdINg=
X-Google-Smtp-Source: AGHT+IFq7qC09DzvIprzR/a1azcwzqqrRFtOOVYd7qMGH9+Hi8Oe3q/Si18b5Uz0cDyqJXfdx3BGvQ==
X-Received: by 2002:a05:6a20:1398:b0:13d:c86b:d76d with SMTP id hn24-20020a056a20139800b0013dc86bd76dmr12703071pzc.60.1692809301100;
        Wed, 23 Aug 2023 09:48:21 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:866:771f:7919:23c5? ([2601:646:9100:2cb0:866:771f:7919:23c5])
        by smtp.gmail.com with ESMTPSA id s2-20020aa78d42000000b006878f50d071sm9614702pfe.203.2023.08.23.09.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 09:48:20 -0700 (PDT)
Message-ID: <cb6ee91b-f918-4918-868b-a192c45546d8@gmail.com>
Date: Wed, 23 Aug 2023 09:48:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] neatvnc: add new recipe
Content-Language: en-US
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-core@lists.openembedded.org
References: <20230823162404.457379-1-leon.anavi@konsulko.com>
 <20230823162404.457379-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230823162404.457379-2-leon.anavi@konsulko.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pbssrntueczffLuYqKyzaipj"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 16:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186623

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pbssrntueczffLuYqKyzaipj
Content-Type: multipart/mixed; boundary="------------WPhpvJAE5DS5mVOqfADaaH6P";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <cb6ee91b-f918-4918-868b-a192c45546d8@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] neatvnc: add new recipe
References: <20230823162404.457379-1-leon.anavi@konsulko.com>
 <20230823162404.457379-2-leon.anavi@konsulko.com>
In-Reply-To: <20230823162404.457379-2-leon.anavi@konsulko.com>

--------------WPhpvJAE5DS5mVOqfADaaH6P
Content-Type: multipart/mixed; boundary="------------SX3wV0Aab5kwNbidDEXhlBzP"

--------------SX3wV0Aab5kwNbidDEXhlBzP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8yMy8yMyA5OjI0IEFNLCBMZW9uIEFuYXZpIHdyb3RlOg0KPiBBZGQgYSBuZXcgcmVj
aXBlIGZvciBuZWF0dm5jIHYwLjYuMCwgYSBsaWJlcmFsbHkgbGljZW5zZWQgVk5DDQo+IHNl
cnZlciBsaWJyYXJ5IHdpdGggYSBjbGVhbiBpbnRlcmZhY2UuIEl0IGlzIHJlcXVpcmVkIGZv
ciBidWlsZGluZw0KPiBXZXN0b24gd2l0aCBWTkMgYmFja2VuZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IExlb24gQW5hdmkgPGxlb24uYW5hdmlAa29uc3Vsa28uY29tPg0KPiAtLS0NCj4g
ICBtZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jICAgICB8ICAxICsN
Cj4gICBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbmVhdHZuYy9uZWF0dm5jX2dpdC5iYiB8IDQw
ICsrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRp
b25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9u
ZWF0dm5jL25lYXR2bmNfZ2l0LmJiDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL2Rp
c3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYyBiL21ldGEvY29uZi9kaXN0cm8vaW5jbHVk
ZS9tYWludGFpbmVycy5pbmMNCj4gaW5kZXggMTFiNDdmZmU4NC4uZjY1OWUyNGE2NiAxMDA2
NDQNCj4gLS0tIGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYw0K
PiArKysgYi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jDQo+IEBA
IC04OTUsMyArODk1LDQgQEAgUkVDSVBFX01BSU5UQUlORVI6cG4temlwID0gIkRlbnlzIERt
eXRyaXllbmtvIDxkZW5pc0BkZW5peC5vcmc+Ig0KPiAgIFJFQ0lQRV9NQUlOVEFJTkVSOnBu
LXpsaWIgPSAiRGVueXMgRG15dHJpeWVua28gPGRlbmlzQGRlbml4Lm9yZz4iDQo+ICAgUkVD
SVBFX01BSU5UQUlORVI6cG4tenN0ZCA9ICJBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4iDQo+ICAgUkVDSVBFX01BSU5UQUlORVI6cG4tYW1sID0gIkxlb24g
QW5hdmkgPGxlb24uYW5hdmlAa29uc3Vsa28uY29tPiINCj4gK1JFQ0lQRV9NQUlOVEFJTkVS
OnBuLW5lYXR2bmMgPSAiTGVvbiBBbmF2aSA8bGVvbi5hbmF2aUBrb25zdWxrby5jb20+Ig0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL25lYXR2bmMvbmVhdHZuY19n
aXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbmVhdHZuYy9uZWF0dm5jX2dpdC5iYg0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5kYzQ2NzhmMDgy
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL25lYXR2
bmMvbmVhdHZuY19naXQuYmINCj4gQEAgLTAsMCArMSw0MCBAQA0KPiArU1VNTUFSWSA9ICJB
IGxpYmVyYWxseSBsaWNlbnNlZCBWTkMgc2VydmVyIGxpYnJhcnkiDQo+ICtERVNDUklQVElP
TiA9ICJUaGlzIGlzIGEgbGliZXJhbGx5IGxpY2Vuc2VkIFZOQyBzZXJ2ZXIgbGlicmFyeSB0
aGF0J3MgaW50ZW5kZWQgdG8gYmUgZmFzdCBhbmQgbmVhdC4iDQo+ICtIT01FUEFHRSA9ICJo
dHRwczovL2dpdGh1Yi5jb20vYW55MS9uZWF0dm5jIg0KPiArTElDRU5TRSA9ICJJU0MiDQo+
ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGZjMzc0ZTcxNzRm
NDFlM2FmZTBmMDI3ZWU1OWZmNyINCj4gKw0KPiArU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2FueTEvbmVhdHZuYzticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIg0KPiArDQo+
ICtTUkNSRVYgPSAiOGIzZGMxYWU2MDk5ZGNmYTczYWVjM2FlMTFkZjJmZGM1ODU0MGQxNCIN
Cj4gKw0KPiArUFYgPSAiMC42LjArZ2l0JHtTUkNQVn0iDQo+ICsNCj4gK1MgPSAiJHtXT1JL
RElSfS9naXQiDQo+ICsNCj4gK0RFUEVORFMgPSAibGliZHJtIHBpeG1hbiBhbWwgemxpYiIN
Cj4gKw0KPiArUEFDS0FHRUNPTkZJRyA/Pz0gInRscyINCg0KQ2FuIHlvdSBjaGVjayBpZiBp
dCBjYW4gc3VwcG9ydCB0bHMgd2l0aG91dCBnbnV0bHMvbmV0dGxlID8NCmlmIG5vdCB0aGVu
IGNhbiB3ZSBrZWVwIHRoZSBkZWZhdWx0IHRvIG5vdCBlbmFibGUgaXQuDQoNCj4gK1BBQ0tB
R0VDT05GSUdbdGxzXSA9ICItRHRscz1lbmFibGVkLC1EdGxzPWRpc2FibGVkLGdudXRscyIN
Cj4gK1BBQ0tBR0VDT05GSUdbanBlZ10gPSAiLURqcGVnPWVuYWJsZWQsLURqcGVnPWRpc2Fi
bGVkLGxpYmpwZWctdHVyYm8iDQo+ICtQQUNLQUdFQ09ORklHW2V4YW1wbGVzXSA9ICItRGV4
YW1wbGVzPXRydWUsLURleGFtcGxlcz1mYWxzZSxsaWJwbmciDQo+ICtQQUNLQUdFQ09ORklH
W2JlbmNobWFya3NdID0gIi1EYmVuY2htYXJrcz10cnVlLC1EYmVuY2htYXJrcz1mYWxzZSxs
aWJwbmciDQo+ICsNCj4gK1BBQ0tBR0VfQkVGT1JFX1BOICs9ICIke1BOfS1leGFtcGxlcyIN
Cj4gK0FMTE9XX0VNUFRZOiR7UE59LWV4YW1wbGVzID0gIjEiDQo+ICtGSUxFUzoke1BOfS1l
eGFtcGxlcyA9ICIke2JpbmRpcn0iDQo+ICsNCj4gK05FQVRWTkNfRVhBTVBMRVMgPSAiZHJh
dyBwbmctc2VydmVyIg0KPiArDQo+ICtpbmhlcml0IG1lc29uIHBrZ2NvbmZpZw0KPiArDQo+
ICtkb19pbnN0YWxsOmFwcGVuZCAoKSB7DQo+ICsJaWYgJHtAYmIudXRpbHMuY29udGFpbnMo
J1BBQ0tBR0VDT05GSUcnLCAnZXhhbXBsZXMnLCAndHJ1ZScsICdmYWxzZScsIGQpfTsgdGhl
bg0KPiArCQlpbnN0YWxsIC1kICR7RH0ke2JpbmRpcn0NCj4gKwkJZm9yIGJpbiBpbiAke05F
QVRWTkNfRVhBTVBMRVN9OyBkbw0KPiArCQkJaW5zdGFsbCAtbSAwNzU1ICR7Qn0vZXhhbXBs
ZXMvJGJpbiAke0R9JHtiaW5kaXJ9DQo+ICsJCWRvbmUNCj4gKwlmaQ0KPiArfQ0KPiArDQo+
ICtCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSINCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRv
IHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTg2NjIxKTogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xODY2
MjENCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bXQvMTAwOTE4MzIwLzE5OTc5MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3Jl
K293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyYWou
a2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
--------------SX3wV0Aab5kwNbidDEXhlBzP
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------SX3wV0Aab5kwNbidDEXhlBzP--

--------------WPhpvJAE5DS5mVOqfADaaH6P--

--------------pbssrntueczffLuYqKyzaipj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZOY4UwUDAAAAAAAKCRC7BTNVkZ0zFOv3
AJ4meiXqabUf2iCZ5N17A2a2Gx/6+QCeOy9fxNS8PKSeAtdXOgfmw3ePGPs=
=pcd4
-----END PGP SIGNATURE-----

--------------pbssrntueczffLuYqKyzaipj--

