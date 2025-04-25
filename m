Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE7BC369AB
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 00:38:36 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.1307.1745541515500527864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 17:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ea5Wi392;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227b828de00so17677215ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 17:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745541515; x=1746146315; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HKGF42CyYFu69WTg2TDz7+2nlEYttwGVXo3X+utqxQw=;
        b=ea5Wi392l/CWLVLTaMIXU5xiVHr+f37v4HaZOlqU32+3eEZrNqde8bEFbJNZj1hDLM
         apJY8yruNPcBTongTtq7KrMS5GW6FGaIn48hmXAESMZP6N4sgfKF78fzg36ytezur6NT
         tgYMMapGlNN5aGYbDrstmBNwB14MpJLywWFqQj5RXicQUUs6T9nQDBJuI8+LsyzhPPMD
         W/CKx/cApgtNa5WQ79Rh7Bp6eEc+ZM5Izm2Uv3ZMUe7G6aPYnOrMX2hoZw4Qz3HK1T9f
         DdOwDfN6+0V5JwAvZ7uxc1/25Dw8RkDfxWZ5b87WTemqdHtmEBMbCvh28Kx5onhMpZe0
         PuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745541515; x=1746146315;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKGF42CyYFu69WTg2TDz7+2nlEYttwGVXo3X+utqxQw=;
        b=nQxqyrNpIMDwDZeu2k4/YxCgLcBl9ZKqLVLaimorji6SoMlda0hbq6YVdqblb7nL5z
         Tav9vNz7p++HzA+NMMQRwpDjmeCeHM8c7hCIvTRKJvSHUE41oWB/CYcA4Q9FsdjLXw0Y
         N++27LjUcPH3gKqSvESqOtV+vNoqhqQDZiegwsnZXDORVt9HBocEHMfdNzNjZ+aXAkM6
         skjUhMavMfO4CkxWoER20eeYd4rLGlGEXM1FQhCDlac59R0svmaXTQ9jLLEYMA4HIXgU
         ws6mBczJxwY/JL2omI0SRELj5UsWfuNwG8DN8y21nGBFBbDtcf9Dyyi8mr15Cck6vrDJ
         iyuQ==
X-Gm-Message-State: AOJu0YyUnDr14M6wKjl4161R9ofMSt0436NhRt/HuXpIr7RRFuAIrIC4
	QPeaWGwmYb2/NeUUdtV3glyBVluVEJcl3ulE/ZvjX6jZ4fP0VMH4
X-Gm-Gg: ASbGncuisjwfI02MUs0wEIF04I/Si8sVGQDI16iiTm/hPvFOu8wYMOrj+WV2WQ2sAEn
	6mSRMiLYz4mX3un+l90h69z+yxjsWZUEWfxsqKwFgRJeklpdKnbycoL9ebDWfcxk2HefUD5S7v6
	YtuylQQ674oeGMoJajCYo3URjnBisMeXOwe+29nr4uozO47PiIi1USZSFv3gdz6Qy3MlZMCR1vh
	q+LmQfbD+gYc2IRlsIN71M0MRCmgJASTrZz8FSkg65QXPTGzwHiIM0Xqm6z682nWK+JamZrDidS
	hGJkokW47o0Cr2xms/j8nRVS7ysCMIyY3vmvWEJp04mB/2SeLquwpNcjSWwSTDbskZs5gVDhRJZ
	/x92JEq8PSbs75kt480enA8p2O6lOfyvxiHpNRAtmrg==
X-Google-Smtp-Source: AGHT+IFRDQA4Lk4FD9vTHV8LG95fvxBDq2e5bRsi2OxrEYw+z4x16sWtAp3V0rtS0MzLKiW1INODIQ==
X-Received: by 2002:a17:903:2349:b0:220:ce37:e31f with SMTP id d9443c01a7336-22dbf5ea9e3mr5146885ad.17.1745541514827;
        Thu, 24 Apr 2025 17:38:34 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:4cdc:d44e:eaf:ca3b? ([2601:646:8201:fd20:4cdc:d44e:eaf:ca3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221a82sm19959555ad.257.2025.04.24.17.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 17:38:34 -0700 (PDT)
Message-ID: <cc7e84d0-3bcc-42e0-aeb1-0f8f713abfae@gmail.com>
Date: Thu, 24 Apr 2025 17:38:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 01/11] cmake-native.bbclass: Abstraction to use
 cmake with native toolchains
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-1-5a492a8461aa@gmail.com>
 <CANNYZj-_wX2XPBXZs4ZqVc7h85H=_KcK+5E4VH+VPNNZiyWYgQ@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CANNYZj-_wX2XPBXZs4ZqVc7h85H=_KcK+5E4VH+VPNNZiyWYgQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------u0lR10BIhaB9M0XdveAK3DWA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215410

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------u0lR10BIhaB9M0XdveAK3DWA
Content-Type: multipart/mixed; boundary="------------EBu9IyfLpQI0a3j0VIaBxy2C";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <cc7e84d0-3bcc-42e0-aeb1-0f8f713abfae@gmail.com>
Subject: Re: [OE-core] [PATCH 01/11] cmake-native.bbclass: Abstraction to use
 cmake with native toolchains
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-1-5a492a8461aa@gmail.com>
 <CANNYZj-_wX2XPBXZs4ZqVc7h85H=_KcK+5E4VH+VPNNZiyWYgQ@mail.gmail.com>
In-Reply-To: <CANNYZj-_wX2XPBXZs4ZqVc7h85H=_KcK+5E4VH+VPNNZiyWYgQ@mail.gmail.com>

--------------EBu9IyfLpQI0a3j0VIaBxy2C
Content-Type: multipart/mixed; boundary="------------sgKvJZWocoHgbqvJG1eFI02f"

--------------sgKvJZWocoHgbqvJG1eFI02f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yNC8yNSAzOjQ4IEFNLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gT24gVGh1
LCAyNCBBcHIgMjAyNSBhdCAwOToyMSwgS2hlbSBSYWogdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPHJhai5raGVtPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4+ICsjIE5hdGl2ZSBDL0MrKyBjb21waWxlciAod2l0aG91dCBjcHUgYXJjaC90
dW5lIGFyZ3VtZW50cykNCj4+ICtPRUNNQUtFX05BVElWRV9DX0NPTVBJTEVSID89ICJgZWNo
byAke0JVSUxEX0NDfSB8IHNlZCAncy9eXChbXiBdKlwpLiovXDEvJ2AiDQo+PiArT0VDTUFL
RV9OQVRJVkVfQ1hYX0NPTVBJTEVSID89ICJgZWNobyAke0JVSUxEX0NYWH0gfCBzZWQgJ3Mv
XlwoW14gXSpcKS4qL1wxLydgIg0KPj4gK3NldCggQ01BS0VfU1lTVEVNX05BTUUgYGVjaG8g
JHtCVUlMRF9PU30gfCBzZWQgLWUgJ3MvXi4vXHUmLycgLWUgJ3MvXlwoTGludXhcKS4qL1wx
LydgICkNCj4gDQo+IEkgdGhpbmsgd2UgbmVlZCB0byBzZXQgYSBoaWdoZXIgc3RhbmRhcmQg
Zm9yIGFkZGluZyBjcnlwdGljIHNlZA0KPiBleHByZXNzaW9uczogd2h5IGl0J3MgdXNlZCBh
bmQgZXhhbXBsZSB0cmFuc2Zvcm1hdGlvbnMgYm90aCBuZWVkIHRvIGJlDQo+IGdpdmVuIGlu
IGNvbW1lbnRzIGp1c3QgYWJvdmUgdGhlIHNlZCBsaW5lLg0KPiANCj4gQWxzbywgY2FuIHdl
IHJhdGhlciBkZWZpbmUgQlVJTERfQ0MgZnJvbSBwaWVjZXMgc3VjaCB0aGF0IG9uZSBvZiB0
aGVtDQo+IGNhbiBiZSB1c2VkIGhlcmUgZGlyZWN0bHk/DQoNCkluZmFjdCB0aGlzIGNhbiBi
ZSBnZW5lcmF0ZWQgdXNpbmcgZXhpc3RpbmcgY21ha2UgYmJjbGFzcyBpdHNlbGYuIEkgaGF2
ZSANCnJld29ya2VkIHRoZSBwYXRjaCB0byB1dGlsaXplIGNtYWtlIGJiY2xhc3MgdG8gZ2Vu
ZXJhdGUgdGhlIG5hdGl2ZSBjbWFrZSANCnRvb2xjaGFpbiBmaWxlLiBJdCB3aWxsIGJlIGlu
IHYyLg0KDQo+IA0KPiBBbGV4DQo=
--------------sgKvJZWocoHgbqvJG1eFI02f
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

--------------sgKvJZWocoHgbqvJG1eFI02f--

--------------EBu9IyfLpQI0a3j0VIaBxy2C--

--------------u0lR10BIhaB9M0XdveAK3DWA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaArZiQUDAAAAAAAKCRC7BTNVkZ0zFIW5
AJ9cir/Mvl3VBVTQg+BRQcHZVlq5wACdH/Ul+AJ3Htg4W8t8p9HIYcOb0tU=
=AbbF
-----END PGP SIGNATURE-----

--------------u0lR10BIhaB9M0XdveAK3DWA--

