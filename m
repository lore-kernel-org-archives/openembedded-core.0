Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C403C001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 16:09:11 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.11537.1690474145943544718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 09:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ug3OPSEy;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-268030e1be7so665527a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 09:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690474145; x=1691078945;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fokcH7r3NgGZHlylMbCuY5/IghpYTKf5DfL35yPk0U8=;
        b=Ug3OPSEypeVC8mYbf8v/AJYKmatR5UEGNSgSxayJteT+UnFt9UDf6T0CNBGbMve1OL
         +TNJMzFrq2FpJg8MmWigd25HxmmRdn07hUxTiunjX8NB45aHoZtQ8kSqqLdJedAjKOjG
         q0hMDLEtDeeOaAaO4iAtjzZ7x38WZEWvZnWhjHTVIqOG3p4ChnY5/0tNPkImGLXoA/wY
         AV0pb6cD2qLpqq1rTbkn+63W+VHlkP92tY88GcEVLZHZhc5nUxwB9lgcRceh1uIsDbJy
         67OEVljUzQeuWzCQB6GERd53Zah61E/KY5Fi2/dZRPECNIZ4hE50I0LmraUdY62FLF8q
         s9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474145; x=1691078945;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fokcH7r3NgGZHlylMbCuY5/IghpYTKf5DfL35yPk0U8=;
        b=TYgpxSmmKZdT43OL0m6skpgdQgVrmBDWbeobPyqJctaxVLLQ+yFWTFQg5KhtQLOrs0
         pA0TFoBENtKOKbOhJMRHYHXgAuOhtD5/wkKP555wXq+iClBCkGTPp4ULOWJ+IKUE7v7d
         +a23gQdJZOuJmP5RNNinL8FQm1Ari+dJ2c61C/qvEU8RYCt1eb4MbpSh+iZRur4kIdty
         2FCkxN93Rl+QIunHetMyaBps7tuul2JxSOsXGexhk8DUDSFWeX16jJXmmHLwSQF07jDb
         gz9CqGBkJQymg4mhOVouDF9+i8M7I0P6WlQuA0VlXMXdRQ0cJZH6HRMbze+e/bdli/Nr
         5y0g==
X-Gm-Message-State: ABy/qLY0ZYVMfuJmWdUXXtOeHrnnQ+tqKTYfg4s6m0klRyvXdpk9c0v/
	Yqgh1Pc0SXEdaWbGyH58vRs=
X-Google-Smtp-Source: APBJJlGilA3es7NrX/vI2DcjAd0MyHXfiq6j/psuLPfl5C0h6GW4RByjnRoK7E/2TpDuAzYJcr5Ubg==
X-Received: by 2002:a17:90a:205:b0:263:43c6:69ac with SMTP id c5-20020a17090a020500b0026343c669acmr4435489pjc.44.1690474145080;
        Thu, 27 Jul 2023 09:09:05 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:6180:6115:a0f6:68be:ba00? ([2601:646:9100:6180:6115:a0f6:68be:ba00])
        by smtp.gmail.com with ESMTPSA id gk11-20020a17090b118b00b0024e4f169931sm3001660pjb.2.2023.07.27.09.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 09:09:04 -0700 (PDT)
Message-ID: <3365158d-96a0-3d0d-1129-337efb34f50b@gmail.com>
Date: Thu, 27 Jul 2023 09:09:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 08/21] gnu-efi: upgrade 3.0.15 -> 3.0.17
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
 <20230727143627.3718496-8-alex@linutronix.de>
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
In-Reply-To: <20230727143627.3718496-8-alex@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SPEVNx3hm12dPRZlOjm5X0PL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 16:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184966

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SPEVNx3hm12dPRZlOjm5X0PL
Content-Type: multipart/mixed; boundary="------------pWRqUgyJZyK40gNJ0TZTN0zF";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Message-ID: <3365158d-96a0-3d0d-1129-337efb34f50b@gmail.com>
Subject: Re: [OE-core] [PATCH 08/21] gnu-efi: upgrade 3.0.15 -> 3.0.17
References: <20230727143627.3718496-1-alex@linutronix.de>
 <20230727143627.3718496-8-alex@linutronix.de>
In-Reply-To: <20230727143627.3718496-8-alex@linutronix.de>

--------------pWRqUgyJZyK40gNJ0TZTN0zF
Content-Type: multipart/mixed; boundary="------------ya0mzO9Kgjzy7NsclCVf6B0e"

--------------ya0mzO9Kgjzy7NsclCVf6B0e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8yNy8yMyA3OjM2IEFNLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gVW5zZXQg
TERGTEFHUyBhcyB0aGUgc3RhbmRhcmQgb25lcyBkbyBub3Qgd29yayB3aGVuIGxpbmtpbmcg
RUZJIGJpbmFyaWVzDQo+ICh0aGUgbmV3IHZlcnNpb24gb2YgZ251LWVmaSBhZGRzIHZhcmlv
dXMgYXBwcykuDQo+IA0KDQpjdXJpb3VzIGFib3V0IHdoaWNoIGxkZmxhZ3MgYXJlIHByb2Js
ZW1hdGljIGZyb20gT0UgZW52Lg0KDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4QGxpbnV0cm9uaXguZGU+DQo+IC0tLQ0KPiAgIC4uLi9nbnUtZWZpL3tnbnUt
ZWZpXzMuMC4xNS5iYiA9PiBnbnUtZWZpXzMuMC4xNy5iYn0gICAgICB8IDggKysrKysrLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiAgIHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkve2dudS1lZmlfMy4wLjE1LmJi
ID0+IGdudS1lZmlfMy4wLjE3LmJifSAoOTMlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXzMuMC4xNS5iYiBiL21ldGEvcmVjaXBlcy1i
c3AvZ251LWVmaS9nbnUtZWZpXzMuMC4xNy5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDkzJQ0K
PiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkvZ251LWVmaV8zLjAuMTUu
YmINCj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXzMuMC4x
Ny5iYg0KPiBpbmRleCA1YWU2ZjM5MWFlOS4uNTQ3YzQ2OWQxOWYgMTAwNjQ0DQo+IC0tLSBh
L21ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXzMuMC4xNS5iYg0KPiArKysgYi9t
ZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkvZ251LWVmaV8zLjAuMTcuYmINCj4gQEAgLTE3LDcg
KzE3LDcgQEAgU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59L2ZpbGVz
LyR7QlB9LnRhci5iejIgXA0KPiAgICAgICAgICAgICAgZmlsZTovL2dudS1lZmktMy4wLjkt
Zml4LWNsYW5nLWJ1aWxkLnBhdGNoIFwNCj4gICAgICAgICAgICAgICINCj4gICANCj4gLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI5MzFhMjU3YjljNWMxYmE2NWZmNTE5ZjE4MzczYzQzOGEy
NjgyNWYyZGI3ODY2YjE2M2U5NmQxYjE2OGYyMGVhIg0KPiArU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjc4MDdlOTAzMzQ5MzQzYTdhMTQyZWJiOTM0NzAzYTI4NzIyMzVlODk2ODhjZjU4NmMw
MzJiMGExMDg3YmNhZjQiDQo+ICAgDQo+ICAgQ09NUEFUSUJMRV9IT1NUID0gIih4ODZfNjQu
KnxpLjg2Lip8YWFyY2g2NC4qfGFybS4qfHJpc2N2NjQuKiktbGludXgiDQo+ICAgQ09NUEFU
SUJMRV9IT1NUOmFybXY0ID0gJ251bGwnDQo+IEBAIC0zNCw2ICszNCwxMCBAQCBkZWYgZ251
X2VmaV9hcmNoKGQpOg0KPiAgICAgICAgICAgcmV0dXJuICJpYTMyIg0KPiAgICAgICByZXR1
cm4gdGFyY2gNCj4gICANCj4gK2RvX2NvbXBpbGU6cHJlcGVuZCgpIHsNCj4gKyAgICB1bnNl
dCBMREZMQUdTDQo+ICt9DQo+ICsNCj4gICBFWFRSQV9PRU1BS0UgPSAiJ0FSQ0g9JHtAZ251
X2VmaV9hcmNoKGQpfScgJ0NDPSR7Q0N9JyAnQVM9JHtBU30nICdMRD0ke0xEfScgJ0FSPSR7
QVJ9JyBcDQo+ICAgICAgICAgICAgICAgICAgICdSQU5MSUI9JHtSQU5MSUJ9JyAnT0JKQ09Q
WT0ke09CSkNPUFl9JyAnUFJFRklYPSR7cHJlZml4fScgJ0xJQkRJUj0ke2xpYmRpcn0nIFwN
Cj4gICAgICAgICAgICAgICAgICAgIg0KPiBAQCAtNDYsNyArNTAsNyBAQCBkb19pbnN0YWxs
KCkgew0KPiAgICAgICAgICAgb2VfcnVubWFrZSBpbnN0YWxsIElOU1RBTExST09UPSIke0R9
Ig0KPiAgIH0NCj4gICANCj4gLUZJTEVTOiR7UE59ICs9ICIke2xpYmRpcn0vKi5sZHMiDQo+
ICtGSUxFUzoke1BOfSArPSAiJHtsaWJkaXJ9LyoubGRzICR7bGliZGlyfS9nbnVlZmkvYXBw
cyINCg0KRG8geW91IHRoaW5rIGlmIHRoZXJlIGlzIGFueSBwb3NpdGl2ZXMgb2YgdGhlc2Ug
YmUgcGFja2FnZWQgc2VwYXJhdGVseT8NCg0KPiAgIA0KPiAgICMgNjQtYml0IGJpbmFyaWVz
IGFyZSBleHBlY3RlZCBmb3IgRUZJIHdoZW4gdGFyZ2V0aW5nIFgzMg0KPiAgIElOU0FORV9T
S0lQOiR7UE59LWRldjphcHBlbmQ6bGludXgtZ251eDMyID0gIiBhcmNoIg0KPiANCj4gDQo+
IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMx
ODQ5NDgpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzE4NDk0OA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC8xMDAzOTE2MDkvMTk5NzkxNA0KPiBHcm91cCBPd25lcjog
b3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gDQo=
--------------ya0mzO9Kgjzy7NsclCVf6B0e
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------ya0mzO9Kgjzy7NsclCVf6B0e--

--------------pWRqUgyJZyK40gNJ0TZTN0zF--

--------------SPEVNx3hm12dPRZlOjm5X0PL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZMKWnwUDAAAAAAAKCRC7BTNVkZ0zFAUT
AKCIP7nD9QoVN35jX+bzFI3Zrlo5EQCfTb5g8Qb0BjGwITx/UYlVFF/h8Pc=
=Curl
-----END PGP SIGNATURE-----

--------------SPEVNx3hm12dPRZlOjm5X0PL--

