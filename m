Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FDAC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 16:59:45 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.46.1663088385095003346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 09:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=evK8js3p;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id e68so12366888pfe.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=8iiJgjoLL55rSh1YdsjJVJ8arI6EezW6eIay2xpPJ7Y=;
        b=evK8js3pfe8H7oJlKc4L7lSgZKobvRQG2AiNKzmGqzLLZz8KqzNmPL1flxNno8Grpy
         kVvtjzveyn+G1uwP2Ny/fmuqjZ/q8jJsqlbyiyBxp1fS7qeHeK2d5xz/vs7rGBB/v0GW
         9eghJqy8iJOe7OJjwzJPrji5fR197jhn2G99Wz//CE2+9P9vodcDn0qxu7vtVmJQWBKp
         l9T7gGGI6ssa0gw9PYt0QhIpJluymPomFlZ72y0ecnF7QMSDqFAnkUhJCQgpUwOeRFEE
         wlTYXzQepft+TZn9JcQO9VKgXq2xZgxJvskl/i9bIU7b4fGTlchz2twn6qWet/bzkl4r
         6AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=8iiJgjoLL55rSh1YdsjJVJ8arI6EezW6eIay2xpPJ7Y=;
        b=4k9m4+fKrjyQ3V4JMlTLUSV15UwMwSY7mIjE29UPclYI13jp2rjPTt+XjzbDLhX9fd
         vsoxy2gQ2yfxdHC5olXcWKnM/dInu8K9WrPcuRVAMfybe1yAdNXWsKrvgbKw0HQXDRcu
         p2+fjQvF3xGxiL97dyioUhhIqmTeEqEityEn/7KXnBgsPlTzGo5KZFH0PgkIghBwQuuB
         Ht1g9F/bxMx5uUi6mck4A11rrUU2sXxYgtiOvnB4J9VaAMkX9NQ4iNkNcpf6+iJiRr28
         rcA2tN7jazjzeZPmAQVHp3tWfEkpE9uPsrpQDxnGb2rboBM1Pc2FCQ3FnnKINQ4CAoEe
         jBFQ==
X-Gm-Message-State: ACgBeo3NogFaBINhkijbr0DPAgsX2brTYRXqpaCQqafxWOF6pgNs2qqg
	jNtqFjyBVp0kWuwJz4j8gAQ=
X-Google-Smtp-Source: 
 AA6agR5ssDYgpFZ65yq2U7ALuuqvt+XxmtTceifI0C1XFBx4hh5RQ5UNg6Sf32IKfyUQLFHOrQ0U3A==
X-Received: by 2002:a05:6a00:1353:b0:541:5258:4e43 with SMTP id
 k19-20020a056a00135300b0054152584e43mr17039807pfu.6.1663088384296;
        Tue, 13 Sep 2022 09:59:44 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:fc5f:c615:18d8:b0f2?
 ([2601:646:9200:a0f0:fc5f:c615:18d8:b0f2])
        by smtp.gmail.com with ESMTPSA id
 n16-20020a170902e55000b0016c1a1c1405sm8655143plf.222.2022.09.13.09.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 09:59:43 -0700 (PDT)
Message-ID: <d96f949e-99f9-82e9-088e-d351327adba9@gmail.com>
Date: Tue, 13 Sep 2022 09:59:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [OE-core] [kirkstone] binutils: stable 2.38 branch updates
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 openembedded-core@lists.openembedded.org
References: 
 <CAMKF1sqUOiZSP0+NV9LOZ+B4v6tZ_qKmA81XrKTsKqYRtcskig@mail.gmail.com>
 <28994.1663062196921833526@lists.openembedded.org>
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
In-Reply-To: <28994.1663062196921833526@lists.openembedded.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gEarIKdWeSRT3TZzQZ2nNndV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 16:59:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170603

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gEarIKdWeSRT3TZzQZ2nNndV
Content-Type: multipart/mixed; boundary="------------S2iKcINqORmkZCi9Z2FjVZfm";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <d96f949e-99f9-82e9-088e-d351327adba9@gmail.com>
Subject: Re: [OE-core] [kirkstone] binutils: stable 2.38 branch updates
References: <CAMKF1sqUOiZSP0+NV9LOZ+B4v6tZ_qKmA81XrKTsKqYRtcskig@mail.gmail.com>
 <28994.1663062196921833526@lists.openembedded.org>
In-Reply-To: <28994.1663062196921833526@lists.openembedded.org>

--------------S2iKcINqORmkZCi9Z2FjVZfm
Content-Type: multipart/mixed; boundary="------------0RqCxXKgrkvjKN6whsTR0F60"

--------------0RqCxXKgrkvjKN6whsTR0F60
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8xMy8yMiAyOjQzIEFNLCBTdW5kZWVwIEtPS0tPTkRBIHdyb3RlOg0KPiBIZWxsbywN
Cj4gSSBhbSBwbGFubmluZyB0byB0YWtlIHRoZSBnY2MsIGdsaWJjICYgYmludXRpbHMgdXBk
YXRlcyB0byBLaXJrc3RvbmUuIEkgDQo+IGZvdW5kIG9ubHkgdGhlIGdsaWJjLTIuMzUgYnJh
bmNoIGlzIGhhdmluZyBhIGZldyB1cGRhdGVzIChnaXZlbiBiZWxvdykuDQo+IC9mOGFkNjZh
NGNhIG5zY2Q6IEZpeCBuZXRsaW5rIGNhY2hlIGludmFsaWRhdGlvbiBpZiBlcG9sbCBpcyB1
c2VkIFtCWiANCj4gIzI5NDE1XS8NCj4gLzllOTYwNzE3ZTEgQXBwbHkgYXNtIHJlZGlyZWN0
aW9ucyBpbiB3Y2hhci5oIGJlZm9yZSBmaXJzdCB1c2UvDQo+IC81NzdjMmZjN2YzIGVsZjog
Q2FsbCBfX2xpYmNfZWFybHlfaW5pdCBmb3IgcmV1c2VkIG5hbWVzcGFjZXMgKGJ1ZyAyOTUy
OCkvDQo+IC84M2YxZDk4NTFlIE5FV1M6IEFkZCBlbnRyeSBmb3IgYnVnIDI4ODQ2Lw0KPiAv
Y2JkODY4NWU4MiBzb2NrZXQ6IENoZWNrIGxlbmd0aHMgYmVmb3JlIGFkdmFuY2luZyBwb2lu
dGVyIGluIENNU0dfTlhUSERSLw0KPiAvNGJhZmM0MDAxZCBhbHBoYTogRml4IGdlbmVyaWMg
YnJrIHN5c3RlbSBjYWxsIGVtdWxhdGlvbiBpbiBfX2Jya19jYWxsIA0KPiAoYnVnIDI5NDkw
KS8NCj4gLzM3ZmQyYWM2NjUgc3RkbGliOiBGaXh1cCBtYnN0b3djcyBOVUxMIF9fZHN0IGhh
bmRsaW5nLiBbQlogIzI5Mjc5XS8NCj4gL2ExZWM0MTU3YmMgc3RkbGliOiBSZW1vdmUgYXR0
cl93cml0ZSBmcm9tIG1ic3Rvd3MgaWYgZHN0IGlzIE5VTEwgW0JaOiANCj4gMjkyNjVdLw0K
PiAvODEzYThkMDE3MSBVcGRhdGUgc3lzY2FsbCBsaXN0cyBmb3IgTGludXggNS4xOS8NCj4g
L2UyMDAxMjdjNmMgcmlzY3Y6IFVwZGF0ZSBydjY0IGxpYm0gdGVzdCB1bHBzLw0KPiAvOGMx
NzJhNmNiMCBkbGZjbjogUGFzcyBjYWxsZXIgcG9pbnRlciB0byBzdGF0aWMgZGxvcGVuIGlt
cGxlbWVudGF0aW9uIA0KPiAoYnVnIDI5NDQ2KS8NCj4gVGhlIGJpbnV0aWxzLTIuMzggaGFz
IG5vIG5ldyBjb21taXRzLiBBbmQsIGdjYy0xMS54IGFsc28gbm90IGhhdmUgYW55IA0KPiBu
ZXcgcmVsZWFzZSBhZnRlciAxMS4zLg0KPiBJbiAvbWFzdGVyLyBicmFuY2ggZ2NjXzEyLjIs
IGdsaWJjXzIuMzYgJiBiaW51dGlsc18yLjM5IHZlcnNpb25zIGFyZSANCj4gdXNlZC4gS2ly
a3N0b25lIHdpbGwgY29udGludWUgdG8gdXNlIHRoZSBvbGQgdmVyc2lvbnM/DQo+IA0KDQp0
aGUgZ2xpYmMgZml4ZXMgYXJlIGdvb2Qgc28gZ28gYWhlYWQgYnVtcCB0aGUgU1JDUkVWIHRv
IGxhdGVzdCBvbiAyLjM1IA0KYnJhbmNoDQogIG1ham9yIHZlcnNpb24gYmFja3BvcnRzIGFy
ZSBleGNlcHRpb25zLiBXZSBjYW4gY29uc2lkZXIgZG9pbmcgbWl4aW4gDQpsYXllcnMgaWYg
bmVlZGVkIGZvciBzYXkgbmV3ZXIgY29tcGlsZXIuDQoNCj4gDQo+IA0KPiBUaGFua3MsDQo+
IFN1bmRlZXAgSy4NCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5r
czogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmll
dy9SZXBseSBPbmxpbmUgKCMxNzA1NjMpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3MDU2Mw0KPiBNdXRlIFRoaXMgVG9w
aWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85MjczOTU2MS8xOTk3OTE0
DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==
--------------0RqCxXKgrkvjKN6whsTR0F60
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------0RqCxXKgrkvjKN6whsTR0F60--

--------------S2iKcINqORmkZCi9Z2FjVZfm--

--------------gEarIKdWeSRT3TZzQZ2nNndV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCYyC2/gUDAAAAAAAKCRC7BTNVkZ0zFCNR
AJ9FXWFxeHlaTpwd5DIjV4EtAQRITACfVKGCV5xBNABUbVXysJcgxjCC9eo=
=EBST
-----END PGP SIGNATURE-----

--------------gEarIKdWeSRT3TZzQZ2nNndV--

