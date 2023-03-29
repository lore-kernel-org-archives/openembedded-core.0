Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04958C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 19:11:57 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.6333.1680117108946733936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 12:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ektwTjer;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id l184so819610pgd.11
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 12:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680117108;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cCGGK3WkHP8i0KTaY5Qx7DIYAdtbyX5MEe/pf8n7Biw=;
        b=ektwTjerLhXOkqhvK9SgGqG+uoaKEO9mHaX7a1Kh4/nB24ImZZL3rHLYGoP6xgJBxL
         5KyX08byS86CriabZ/H8VQI6NeOxg8r0BqtueeXWsuGhhQFNsMMvyPeDmagh/V2dBuxM
         WofSnCaPJNB+KHU7sZTkeQ4l+aD175hvJfglyHVaumL9zZjGbNwWMOK9mX/RVyddNVgV
         DXevSQ6EVXMsjWlcL6qzEM3mRcXVcAToyJHrI3NTo/iIHmdFT5XoAo/PemMHLVT5ct1q
         5j6On1jJ4I3eSTRVVPZFA6ZrecvPcodsc3n0lVNbFW4cyDcH1CcVFHieAfvS2pOhsrXF
         BxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680117108;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCGGK3WkHP8i0KTaY5Qx7DIYAdtbyX5MEe/pf8n7Biw=;
        b=5JKGmXwbY/BgPDi3QxH6E/WaHvcD8GkCku0fyCl/kghHHohC9eC63MaL/D4qZ50efA
         /45yxZs575RjmGB6eMrKPpM3O7sDoiekWJ+9BA5Bwa49S5aPlKKhB3Es4OpI9RFcWMfC
         62TFAsm+/t0tEJoHFKsWAahEz9U/ffHZpaBEs+/Nh9/gN0VMyDsABVafQ9CrtLb0LZFN
         A+Tb6CY29UzVG1vpquNMQzceaAoFviEUsSkJrUiXJQQ/H8JNRlubJA4VL0mdcxx2fw4E
         1kfxNwLINfg6uPJdLTwsOzYjEWWBZxvlKblmM/o7uFIQZ6+EGbHsbk/rtJ5XrhHtHSaQ
         R57A==
X-Gm-Message-State: AAQBX9dVj47DPnj8w3Qi4hIGiYxCN08ol5ZnRGDoVFjTpeB1YmBocmuG
	dpGQVXwqxmoK4U5J5D7MDwo=
X-Google-Smtp-Source: AKy350Z3S/r8a746j0CTyGAqXfYKwyD+a0ytsucAYviJdJcMp0agqO07ye+HEH/tWzxKeFvD1yMUGA==
X-Received: by 2002:aa7:8ec1:0:b0:622:7e20:71d with SMTP id b1-20020aa78ec1000000b006227e20071dmr17536464pfr.17.1680117108050;
        Wed, 29 Mar 2023 12:11:48 -0700 (PDT)
Received: from ?IPV6:2601:646:9181:d380:91ef:1a07:c0de:e30? ([2601:646:9181:d380:91ef:1a07:c0de:e30])
        by smtp.gmail.com with ESMTPSA id p16-20020aa78610000000b005a8a9950363sm16529103pfn.105.2023.03.29.12.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 12:11:47 -0700 (PDT)
Message-ID: <f0482727-b55f-3a79-7bf0-e3f61ec04c86@gmail.com>
Date: Wed, 29 Mar 2023 12:11:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [OE-core] [PATCH] webkitgtk: Fix build on 32bit platforms without
 64bit atomics
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230328214351.3666478-1-raj.khem@gmail.com>
 <CANNYZj8zb4PnnhFUpPKsmcWRHJjjv7ATWzi61EU+YuaJrNLGvg@mail.gmail.com>
 <CAMKF1spkAdAHgzRzKwsL_i6_a9NqsnP4Wybsw5=2zkpOmTq8PA@mail.gmail.com>
 <CANNYZj8PNKJLz+r9XTUbEan2c-MY3db7iiNzxeOpA0-ATtLUBw@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQoAIAIbAwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
 BQJTBC0aAAoJELsFM1WRnTMUul4An282FaN7oYXM2A8JzQt1ZWeUTlJZAJ0eOgup2Eqxx6gZ
 FOQE7EkRmOb6iM7DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
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
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
In-Reply-To: <CANNYZj8PNKJLz+r9XTUbEan2c-MY3db7iiNzxeOpA0-ATtLUBw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7oyihD7THaXYiwL6kVUUda0l"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 19:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179296

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7oyihD7THaXYiwL6kVUUda0l
Content-Type: multipart/mixed; boundary="------------ddpYD6NOIe7QW9QIQKhmzdSi";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <f0482727-b55f-3a79-7bf0-e3f61ec04c86@gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Fix build on 32bit platforms without
 64bit atomics
References: <20230328214351.3666478-1-raj.khem@gmail.com>
 <CANNYZj8zb4PnnhFUpPKsmcWRHJjjv7ATWzi61EU+YuaJrNLGvg@mail.gmail.com>
 <CAMKF1spkAdAHgzRzKwsL_i6_a9NqsnP4Wybsw5=2zkpOmTq8PA@mail.gmail.com>
 <CANNYZj8PNKJLz+r9XTUbEan2c-MY3db7iiNzxeOpA0-ATtLUBw@mail.gmail.com>
In-Reply-To: <CANNYZj8PNKJLz+r9XTUbEan2c-MY3db7iiNzxeOpA0-ATtLUBw@mail.gmail.com>

--------------ddpYD6NOIe7QW9QIQKhmzdSi
Content-Type: multipart/mixed; boundary="------------0Q609uwG9nBCm0PEf07QJ0ML"

--------------0Q609uwG9nBCm0PEf07QJ0ML
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8yOS8yMyAxMjowNCBQTSwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+IE9uIFdl
ZCwgMjkgTWFyIDIwMjMgYXQgMTc6MDcsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
IHdyb3RlOg0KPj4+IDMyLWJpdCBzcGVjaWZpY2l0eSBpcyBub3QgaW4gaXRzZWxmIGluYXBw
cm9wcmlhdGUgZm9yIHVwc3RyZWFtDQo+Pj4gc3VibWlzc2lvbiwgY2FuIHlvdSBwbGVhc2Ug
ZWl0aGVyIHN1Ym1pdCB1cHN0cmVhbSBvciBvcGVuIGEgdGlja2V0IGFuZA0KPj4+IHJlZmVy
IHRvIGl0IGluIHRoZSBwYXRjaD8NCj4+DQo+PiBkaWQgeW91IHJlYWQgdGhlIG1lc3NhZ2Ug
dHJhaWwgb24gdGhlIGdlcnJpdCByZXZpZXcgSSBhZGRlZCB0byBjb21taXQgPw0KPiANCj4g
SSBkaWQgLSB1cHN0cmVhbSBzdWdnZXN0ZWQgYSB3b3JrYXJvdW5kIHRoYXQgd2FzIHN1Ym1p
dHRlZCBoZXJlIChpbiBhbg0KPiBhbHJlYWR5IGNsb3NlZCBtZXJnZSByZXF1ZXN0KSwgYnV0
IHRoZXkgZGlkbid0IGRlZmluaXRpdmVseSBzYXkNCj4gd2hldGhlciB0aGV5IHdvdWxkIHJl
amVjdCBhIHRpY2tldCAob3IgYSBwYXRjaCkgdG8gc29sdmUgdGhlIHByb2JsZW0NCj4gcHJv
cGVybHksIHNvIEkgdGhpbmsgaXQncyB3b3J0aCB0byBhdCBsZWFzdCBvcGVuIGEgdGlja2V0
Lg0KPiANCg0KdGhhdCBpcyBzdGlsbCB1bmRlciBkaXNjdXNzaW9uLiBIb3BlZnVsbHkgdGhl
eSBhcmUgYW1lbmFibGUgZm9yIHN1Y2ggDQphY2NvbW1vZGF0aW9uDQoNCj4gQWxleA0K
--------------0Q609uwG9nBCm0PEf07QJ0ML
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------0Q609uwG9nBCm0PEf07QJ0ML--

--------------ddpYD6NOIe7QW9QIQKhmzdSi--

--------------7oyihD7THaXYiwL6kVUUda0l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZCSNcQUDAAAAAAAKCRC7BTNVkZ0zFDpL
AJwMWV4q4qcbIe1jaIYk6pUkZu6QVwCeL0QGcTnsbUBVouAq8mfo2R01W8M=
=73RN
-----END PGP SIGNATURE-----

--------------7oyihD7THaXYiwL6kVUUda0l--

