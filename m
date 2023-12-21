Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24451C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:00:51 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.56164.1703178045507185891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 09:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TD7iQIDf;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so518085a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 09:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703178045; x=1703782845; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fikRcPN5WCrhIEbenKdRAtsQn7E1is0U/6XZz9YZJUA=;
        b=TD7iQIDfQdZ0bkgCbgxpEKR5W/8tkCK0e3N+p5/E7FZZG33D3GkitzbKt/b8Blma6S
         RrgGroRKyvsQZvvCDBxca3enfpECve6MZDNTzTdoxZjkO1NkGRYqy0lCDmsX6Rww3Pqr
         G6oopWFcGHsXfkEsWIzj9913RuarCKh9QMR4sIDJ7moLBDnPL/dbK+rtMIRTNyJE5fVA
         Nav9DO4HLyM2Pp4yT8nLl0AiepjDzAcbv3Uoldt8/vHkeq38QBndFrn0U36G1RjD0axC
         26Pi2X4NVd1aKazRyUIoy520XYKlzwoT+EQLnQ923ZqI1989G2kDQpVQ/WE91UoXDzUw
         wK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703178045; x=1703782845;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fikRcPN5WCrhIEbenKdRAtsQn7E1is0U/6XZz9YZJUA=;
        b=S2604Y+KIfTVgeVFaKa0ALKYzyk6qip03hUZrEPxPk8pHqYbbAJNVrsmlZRte6jHls
         F4F3fll++pIURR3GhKSu9hFTMNHSivan9J+gSvzLdF3iHzOnTiB4F2oo09Xt2tS/gt7D
         lxxNJ9vsgJDZ6o3vTRcE6TShaa84E6I7f3MhqfcUxKshhSeBtJ9meL0oiGT1/BmdGjXf
         JvHiWprHfZ6JoP0cLm+Ke+4uQq6dYjTlVmsKsXzpyj9XfCBXmJuakvLOCY1vaIPVqSVF
         YxUi/1nlSaniyteUNTFg1XYtzABrDlpN3x0feblmagJNEIJmlvic1fum/llqp1AIwxa8
         SIrg==
X-Gm-Message-State: AOJu0YxenSyfK6K9mPVUiYbfTPpPoNkgpR4wMgKsx6kJjQ1zrxzUC56b
	90YEPCTiUKHxOKarC+0MLBw=
X-Google-Smtp-Source: AGHT+IFKgu5KPngpt1I4ExItElAIzZ5Eli5Ghwhfu6oQCtfHSGeSzcZmrSCEfi3htO2ejSbvnb5Pug==
X-Received: by 2002:a05:6a20:4284:b0:188:290d:17dc with SMTP id o4-20020a056a20428400b00188290d17dcmr1163410pzj.60.1703178044769;
        Thu, 21 Dec 2023 09:00:44 -0800 (PST)
Received: from ?IPV6:2601:646:9d80:4380:19f6:1dc9:af9a:71f0? ([2601:646:9d80:4380:19f6:1dc9:af9a:71f0])
        by smtp.gmail.com with ESMTPSA id gu17-20020a056a004e5100b006d2646bd9fbsm1827032pfb.151.2023.12.21.09.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 09:00:44 -0800 (PST)
Message-ID: <98756707-1eeb-485d-841b-0ab997e2ee3a@gmail.com>
Date: Thu, 21 Dec 2023 09:00:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] weston/wayland: OpenGL vs GLES2
Content-Language: en-US
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <DM8PR12MB5430E9851E7C72F05623C0148B96A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CAMKF1srPC5Gch2s46kx8py6U=DJaYRro5eC4xPJWTT_2TE2pbw@mail.gmail.com>
 <DM8PR12MB54309DC335A6C453A18A21BD8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <DM8PR12MB54309DC335A6C453A18A21BD8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bb0CimMhXdpZul5IjmpNcmr6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 17:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192839

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Bb0CimMhXdpZul5IjmpNcmr6
Content-Type: multipart/mixed; boundary="------------Z08aKuVNrg0PsbHyCFoTSMg1";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
Message-ID: <98756707-1eeb-485d-841b-0ab997e2ee3a@gmail.com>
Subject: Re: [OE-core] weston/wayland: OpenGL vs GLES2
References: <DM8PR12MB5430E9851E7C72F05623C0148B96A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CAMKF1srPC5Gch2s46kx8py6U=DJaYRro5eC4xPJWTT_2TE2pbw@mail.gmail.com>
 <DM8PR12MB54309DC335A6C453A18A21BD8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB54309DC335A6C453A18A21BD8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>

--------------Z08aKuVNrg0PsbHyCFoTSMg1
Content-Type: multipart/mixed; boundary="------------p8TUsMoGF4jxGcslyPpbCUZe"

--------------p8TUsMoGF4jxGcslyPpbCUZe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMjEvMjMgODowNSBBTSwgY2hyaXMubGFwbGFudGVAYWdpbGVudC5jb20gd3JvdGU6
DQo+IEhpIEtoZW0sDQo+IA0KPj4gb3BlbmdsIGluIE9FIGNvbnRleHQgaXMgdXN1YWxseSBu
b3QgdGhlIHNhbWUgYXMgZGVza3RvcCBHTCwgaXQgbWVhbnMgdGhlIGRpc3Rybw0KPj4gbmVl
ZHMgT3BlbkdMIHN1cHBvcnRlZCBmcm9tIHRoZSBwbGF0Zm9ybS4NCj4+IEl0IGlzIHRoZW4g
YWNjZW50dWF0ZWQgYnkgb3RoZXIgdGhpbmdzIGxpa2UgZWdsIGdsZXN2MiwgZ2x4IGV0Yy4g
SSB0aGluayB3ZSBjb3VsZA0KPj4gbWFrZSBpdCBhIGJpdCBiZXR0ZXIgYnV0IHRoaXMgaXMg
c29tZXRoaW5nIHRoYXQgc2l0cyBpbiB0aGUgbWlkZGxlIG9mIGRpc3RybyBhbmQNCj4+IG1h
Y2hpbmUgZmVhdHVyZXMuDQo+IA0KPiBPSywgdGhhbmtzIGZvciBjbGFyaWZ5aW5nLiBTbyBt
eSB0YWtlYXdheSBpcyB0aGF0IGlmIEkgc2VlIGEgcmVjaXBlIHRoYXQgY29uZmxhdGVzIHRo
ZSAnb3BlbmdsJyBESVNUUk9fRkVBVFVSRSB3aXRoIGRlc2t0b3AgT3BlbkdMLCB0aGVuIGl0
IGlzIGEgYnVnLCByaWdodD8NCg0KSSB3b3VsZCB0aGluayBzbywgaXQgaGFzIHRvIGxvb2sg
Zm9yIHgxMSBiZWluZyBpbiBkaXN0cm8gZmVhdHVyZXMgDQpwZXJoYXBzIHRvIGNhbGwgaXQg
ZGVza3RvcCBHTA0KDQo+IA0KPiBUaGFua3MsDQo+IENocmlzDQo=
--------------p8TUsMoGF4jxGcslyPpbCUZe
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------p8TUsMoGF4jxGcslyPpbCUZe--

--------------Z08aKuVNrg0PsbHyCFoTSMg1--

--------------Bb0CimMhXdpZul5IjmpNcmr6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZYRvOwUDAAAAAAAKCRC7BTNVkZ0zFGEN
AJ9sOgIXPCkAGu07jn89yfWhjGbpqACfVQNNpoPFDrw62FJpSdk9AZD3GRM=
=tohL
-----END PGP SIGNATURE-----

--------------Bb0CimMhXdpZul5IjmpNcmr6--

