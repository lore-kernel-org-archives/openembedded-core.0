Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB03C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 18:24:18 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.2172.1692987854448537993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 11:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=h0VN84Gt;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68a520dba33so1040511b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692987854; x=1693592654;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR38U6/b5pnFKo0Cpzrb7qctaG0ELkBGyYQj4el+ASk=;
        b=h0VN84Gtykam5qeWoQ6SCHcl8R8zoG9iAiUYFFo/tvhuOsPmuuNLR/PLA4TLobkRkY
         ntcszGzLMKdWrOJneTZsNW5fXmrZ4tgwUJEqstGPxEaXGL0aCgMOEeO6S2NQ6YyzURDz
         TWuTOOWcj43VQplg+tp1HK2e4+qT007sbcuv1FpG/TmW1UYOiIT/ha2nlSgd7xyYbTZo
         Qpajf5G9TEbDndw/iGQZqch8dU3DaZmur7whJ+18Tq2LIR7/HLe1Ir24xBWFEkXZHaL/
         8ok9DvkuYd7VqFNY3oqnxHoudZpNdxBg46dpbTSfvT2XUXSjFVaIYXgFu+dvI2H/aSwy
         Uivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987854; x=1693592654;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tR38U6/b5pnFKo0Cpzrb7qctaG0ELkBGyYQj4el+ASk=;
        b=j9yNnIBiJZctciMjXquFCfSqhNs6ajQPc3cZHfi9QO752eljGb2L1PwNt4o3t/h165
         YSZLRSH+2KfvtDwsz6Q1LALlZGc6OMsEyA16ZK+Hz70C1zMif8i2/j4dsuTp5gxUky3m
         4AaQinZOQ3VWVkH8sLuoZbytmRlAWJXA6Q2/rMiXadYimXOj7GP1OL2sjiibuEP2O7z4
         LaYQyvedVOaqhwpnBDQIh8BRtP07DyZoPq/IeCQapAj3u3G1Ih4AxVeyeRmYYwbWyD95
         fM96zhizowox+bpiG/8qdVGgxT2U2Bnu3+nLrX+WbkMdc7mgcQHJ9ehOb0SR/c/CNobe
         nMfA==
X-Gm-Message-State: AOJu0YwwbV4IbQo83hsL3I6iAP9YDmQMXLgTp6cm+7/0m0UksxL0wOZm
	LSLjrk7A9azWkvSEis5kg0g=
X-Google-Smtp-Source: AGHT+IFExL5XR62FscE11ITLbrCyBNySsYyM5iLQ50OS5+cU85poJTPfg5WhF/UQst1S9tTof4/l0g==
X-Received: by 2002:a05:6a20:5511:b0:140:cb66:73c0 with SMTP id ko17-20020a056a20551100b00140cb6673c0mr16661310pzb.58.1692987853586;
        Fri, 25 Aug 2023 11:24:13 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:7df6:4f02:3869:f6f5? ([2601:646:9100:2cb0:7df6:4f02:3869:f6f5])
        by smtp.gmail.com with ESMTPSA id i6-20020aa787c6000000b0067aea93af40sm1879084pfo.2.2023.08.25.11.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 11:24:13 -0700 (PDT)
Message-ID: <e76632dc-fb9d-457d-a3c2-974a51cf82dc@gmail.com>
Date: Fri, 25 Aug 2023 11:24:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3: Add packagegroup-core-buildessential
 rdep to ptests
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230825070914.525031-1-raj.khem@gmail.com>
 <eb751c1d50a2f34e79bd710e00c3b3e32ef26356.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <eb751c1d50a2f34e79bd710e00c3b3e32ef26356.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xRiVcSMc58gYULrslNAHwyUM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 18:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186723

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xRiVcSMc58gYULrslNAHwyUM
Content-Type: multipart/mixed; boundary="------------gxxQHQS9WLW11hZxdJfFd0dG";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <e76632dc-fb9d-457d-a3c2-974a51cf82dc@gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Add packagegroup-core-buildessential
 rdep to ptests
References: <20230825070914.525031-1-raj.khem@gmail.com>
 <eb751c1d50a2f34e79bd710e00c3b3e32ef26356.camel@linuxfoundation.org>
In-Reply-To: <eb751c1d50a2f34e79bd710e00c3b3e32ef26356.camel@linuxfoundation.org>

--------------gxxQHQS9WLW11hZxdJfFd0dG
Content-Type: multipart/mixed; boundary="------------XfOXZ8qP6cdZSakUs0natJ3H"

--------------XfOXZ8qP6cdZSakUs0natJ3H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8yNS8yMyAxMjo1NCBBTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+IE9uIEZyaSwg
MjAyMy0wOC0yNSBhdCAwMDowOSAtMDcwMCwgS2hlbSBSYWogd3JvdGU6DQo+PiBjcHBleHQg
dGVzdCBuZWVkcyBmdWxsIHRvb2xjaGFpbiBhcyBpdCB0cmllcyB0byBidWlsZCBhbiBleHRl
bnRpb24gd2l0aA0KPj4gQywgdXNpbmcgcGFja2FnZWdyb3VwLWNvcmUtYnVpbGRlc3NlbnRp
YWwgZW5zdXJlcyB0aGF0IGEgZnVuY3Rpb24NCj4+IHRvb2xjaGFpbiBiaXRzIGFyZSBwdWxs
ZWQgaW50byBwdGVzdCBpbWFnZSwgYXMgYW4gYXNpZGUgaXQgYWxzbw0KPj4gYWJzdHJhY3Rz
IGhhcmRjb2RpbmcgY29tcGlsZXIgdG8gYmUgZ2NjDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4+IC0tLQ0KPj4gICBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xMS40LmJiIHwgMiArLQ0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTEuNC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjExLjQuYmINCj4+
IGluZGV4IDhmZDEzODJjYWE0Li5lMzFjNGE4MWVmNiAxMDA2NDQNCj4+IC0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjExLjQuYmINCj4+ICsrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjExLjQuYmINCj4+IEBAIC00
MjQsNyArNDI0LDcgQEAgRklMRVM6JHtQTn0tbWFuID0gIiR7ZGF0YWRpcn0vbWFuIg0KPj4g
ICAjIFNlZSBodHRwczovL2J1Z3MucHl0aG9uLm9yZy9pc3N1ZTE4NzQ4IGFuZCBodHRwczov
L2J1Z3MucHl0aG9uLm9yZy9pc3N1ZTM3Mzk1DQo+PiAgIFJERVBFTkRTOmxpYnB5dGhvbjM6
YXBwZW5kOmxpYmMtZ2xpYmMgPSAiIGxpYmdjYyINCj4+ICAgUkRFUEVORFM6JHtQTn0tY3R5
cGVzOmFwcGVuZDpsaWJjLWdsaWJjID0gIiAke01MUFJFRklYfWxkY29uZmlnIg0KPj4gLVJE
RVBFTkRTOiR7UE59LXB0ZXN0ID0gIiR7UE59LW1vZHVsZXMgJHtQTn0tdGVzdHMgJHtQTn0t
ZGV2ICR7UE59LWNnaXRiICR7UE59LXppcGFwcCB1bnppcCBiemlwMiBsaWJnY2MgdHpkYXRh
IGNvcmV1dGlscyBzZWQgZ2NjIGcrKyBiaW51dGlscyINCj4+ICtSREVQRU5EUzoke1BOfS1w
dGVzdCA9ICIke1BOfS1tb2R1bGVzICR7UE59LXRlc3RzICR7UE59LWRldiAke1BOfS1jZ2l0
YiAke1BOfS16aXBhcHAgdW56aXAgYnppcDIgbGliZ2NjIHR6ZGF0YSBjb3JldXRpbHMgc2Vk
IHBhY2thZ2Vncm91cC1jb3JlLWJ1aWxkZXNzZW50aWFsIg0KPj4gICBSREVQRU5EUzoke1BO
fS1wdGVzdDphcHBlbmQ6bGliYy1nbGliYyA9ICIgbG9jYWxlLWJhc2UtZnItZnIgbG9jYWxl
LWJhc2UtZW4tdXMgbG9jYWxlLWJhc2UtdHItdHIgbG9jYWxlLWJhc2UtZGUtZGUiDQo+PiAg
IFJERVBFTkRTOiR7UE59LXRraW50ZXIgKz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNL
QUdFQ09ORklHJywgJ3RrJywgJyR7TUxQUkVGSVh9dGsgJHtNTFBSRUZJWH10ay1saWInLCAn
JywgZCl9Ig0KPj4gICBSREVQRU5EUzoke1BOfS1pZGxlICs9ICIke0BiYi51dGlscy5jb250
YWlucygnUEFDS0FHRUNPTkZJRycsICd0aycsICcke1BOfS10a2ludGVyICR7TUxQUkVGSVh9
dGNsJywgJycsIGQpfSINCj4gDQo+IFRoYXQgYWxzbyBpbmNyZWFzZXMgdGhlIGRlcGVuZGVu
Y2llcyBuZWVkZWQgdG8gY29tcGxldGUgYSBidWlsZCBvZg0KPiB0YXJnZXQgcHl0aG9uIGFu
ZCBJJ20gbm90IHN1cmUgdGhpcyBpcyBhIGdyZWF0IGlkZWEuIENvbXBpbGVyDQo+IGRlcGVu
ZGVuY2llcyBpbiBwdGVzdHMgYXJlIGEgcmVhbCBwcm9ibGVtIGluIHRoaXMgcmVnYXJkIGJ1
dCB0aGlzIHBhdGNoDQo+IG1ha2VzIHRoZSBzaXR1YXRpb24gYSBsb3Qgd29yc2UgOigNCj4g
DQoNCldlIGNhbiBkcm9wIGl0LCBJIGhhdmUgYWRkZWQgdGhlIG5lZWRlZCBiaXRzIGludG8g
bWV0YS1jbGFuZw0KSSB0aGluayBoYXJkY29kaW5nIGRlcGVuZGVuY2llcyBmb3IgdG9vbGNo
YWluIGNvbXBvbmVudHMgY291bGQgYmUgbWFkZSANCmJldHRlci4NCg0KZm9yIHBva3kgcHRl
c3RzIGlzIGluIGRlZmF1bHQgZGlzdHJvIGZlYXR1cmVzIHNvIEkgY2FuIHNlZSB5b3VyIGNv
bmNlcm4NCg0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo=
--------------XfOXZ8qP6cdZSakUs0natJ3H
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnm
DLpLSdfvZw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8
itwOoVR41DOBkftVmiO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXP
WndN1Ka4M/hzt7g+FmeyEssD/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e
1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/B
h0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuKER4Y8ycTq3gbIGJtVrIJjWPC
zWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6QjnIlzzcuMvRdZn2I
rnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN6g3vSlrR
JqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQII
AwQWAgMBAh4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0g
AJ9wRt36PqfjNe904evWolFf5cMmp8JgBBMRCgAgAhsDBgsJCAcDAgQVAggDBBYC
AwECHgECF4AFAlMELRoACgkQuwUzVZGdMxS6XgCfbzYVo3uhhczYDwnNC3VlZ5RO
UlkAnR46C6nYSrHHqBkU5ATsSRGY5vqIzsNNBEqXaJEQEACONtVDnlECi4B7SXSc
+wqRZ20y5QfAF0sGSkXesYz9/S4OU9pDNgYuMpPvEOjJGHzHa0XBa85+KqtkUCvF
fx7h+wAKYl0vSRqFNvEL/xKZJZUdeLXQlRfZ+Znm5/OVcCeXSK9eRaetR8tf0N03
AvoNHgN4Ur2oEWq0eYrlNBcy7zsb4wnCA0kjAIpBfiIj1gkgsy6oidXBrGDn8At0
p8TdA+a1p2cpv9y5SbiAgJ1ol7JB8jqp1gtxK7IFYJsAQwzXCaFECHDlGDMxFEiq
5mXE+3uVmRdeNqWzszqO6HztUZGggnBihCL3tDVkfM8GjcCUw97eFo2KGR3oPeXC
90HimaNgbgjpscKC0SESyzeEe+wFqpX2NXV0xRKz3lnFC1P2q2Q7HJ0eA6XBFfcI
b6vnzgn+zi9ab6I9C0u8NjW7hQXA4uMI4V7vT0Fwsl09HYZCI4+jJkXuVVjye792
1OsAS6JkWTgcPtp9SVyv8grA9YgPVX2REugOXN1s26hTL9d9USsrzByiIajB6sQx
53hqM2grELEHB4iSPGooy3wIqCnfSf1TGWOCURyB/79S6bBIfGplwI9VtZe12HL+
HAyTbuyE51S9qLKd6nw6xUaoDNKx4vipkgnlfMJzJXgokKbCZ1DO3n5nKVxWZ6rp
Hihv53wkgNTQQup3DHAgOJOPRwADBQ/+Kc3f+vwgUOaziDnFp8+sLDfWjaMhhqGQ
h83RZU9Yjkr+EUKjY9zM9K3MNxOxnHuY3arCkY57cvP3/SStl6SyvPVkgc2LktNq
y7NfIUls7Tlj56IeBXWtXtVUSKk6ulXXj3rDXXZj/RJn8WE58SYQDVN4N6PLaxmJ
M5RbiDLN7BscykTTt3bsXaozY18wyEpAJy/Ov43RUmYA54BMSK/E9Qef4Olf82eI
FY5xa/77AeXG/RevreCxEpK3rZ4UoaOAXnSEcPmUzfXOKrJxzjaxuByoBn6tgWVv
2TTclwrKrVd1VRKb7FwLYMxKy1MjqKoUwajoWcQ76DITlV1x5qNu5nUY6YlclQLJ
gh0a68LIigqNMT2VwhhIQQNlB6PnF2IaT15TPQw+ZkRTBJH+cuabCMcMmLSmtW+z
3Gp7lu9Ld108Cp6m9nlSuKyC1YP5MMjyS2S3lUuHdewb0W5dRUBpqE68UwaJm2yK
gNdOisvgB8x64D1/7IvCsJVA7fGYf9YDROB//mBgHe30qgc+MsE2u5U65BsCO5uL
Sm9EA5Rwx0F+Y+h+Swri5ZLXMa09ZLtS7Vyy6rsedvu+zOUVh1vN6qNjzUtLLEDS
RymAnF0u/2jtS4ISccNks9sd1Dzc+bLIEpIjfUAp7tFeVA2UHmCvAf2jq4209tXu
r+5GqYqrkSLCSQQYEQIACQUCSpdokQIbDAAKCRC7BTNVkZ0zFHVUAJ9IDpNFYVZL
U2T1aHmEmAcFBe5D5wCbBVUufOp45pebD9wGNMgoKf5XVr/CSQQYEQIACQUCSpdo
kQIbDAAKCRC7BTNVkZ0zFHVUAJwKR1o7etvz+BGmuV2YAfp5Hj16jgCeMPeHdpPC
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------XfOXZ8qP6cdZSakUs0natJ3H--

--------------gxxQHQS9WLW11hZxdJfFd0dG--

--------------xRiVcSMc58gYULrslNAHwyUM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZOjxywUDAAAAAAAKCRC7BTNVkZ0zFBSK
AJ9yvhhoag0PO9YEyvy9veqmOiViSQCbBGi5lSIHSiArexaiVKFNtrPgHYY=
=JwQt
-----END PGP SIGNATURE-----

--------------xRiVcSMc58gYULrslNAHwyUM--

