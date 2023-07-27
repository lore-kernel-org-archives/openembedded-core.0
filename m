Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4852CC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 16:18:01 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.11657.1690474673153574568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 09:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ruTKEpl9;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b8ad356fe4so7158535ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 09:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690474672; x=1691079472;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+gYD/dcK0UbaePpRIWZ1xfd15G19HKU8m696gH/xi8=;
        b=ruTKEpl9zk+qvoNojNHtGMiBiooHO6hi/MHc4tgX42LYOEvxHJtFE2weZOARC3XgyD
         P13yiEQQwDysmNwcNbQECMpO3P9UeNTaRthcTfIOTAi5odrOhlKmTiaIAOvRCS9FGtU0
         qyKMd1aIWmT1LjJ8EVgOKWPiVd1QLn1wO4cxpr/s0azz1H7QvtiTicIH6fWLcjPgtCLH
         jTx90PAPCCV504qvugGxWXeoxbO01IDwiaFieOAGnLk8lALyLCNpMFQeZYdHnGeNtFfF
         v+WO4rmQVv0Nr13V5M6J3Yi95RVu7y21ZEznVPmVKIlMCR4t6IGR2nhvg5448L3oTV65
         GUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474672; x=1691079472;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q+gYD/dcK0UbaePpRIWZ1xfd15G19HKU8m696gH/xi8=;
        b=F0bS6ZTLB1BwL5r27bE47g333o1urqhzEqNvmBXlXkgUr1TPXElnZMmSHk5vuqOq5v
         V5UeSXfbMZK7Y7ZXYZsyiyV78A8+xnTBqIicKRkDv+aQo42XeE1s7hO7hNfSU3/7V/GJ
         cEGlAMrH8Ji6XmJUfaNRwsLxltNo5EAfBcRLyU2PkI3omgC5CyIcDc3FSbai812VC/Op
         T8FIhTh4SdxYvUqUH70h9JXnhJrEUKLqcjm5R5udqfLEbToEmeNVHBW3THvQtBwDXQl3
         iqqPva4sjRDQ1e9K2gPQdBW0ZtdiAL8+xufJqsDvrW4wUArbIFa+uoRZxTQt5xcUm+SI
         edNg==
X-Gm-Message-State: ABy/qLYd+almT/TmL03eWqI1DuK5GKItgifSsXokQwL0D0zy0SfK5o1N
	+7cAwUvfv0q+PbcINzeffNi76NQceBdJeA==
X-Google-Smtp-Source: APBJJlEuNrIRtbh9Z99osCuZwrHP+t39SKURj9uQen5X3O45U2+d794BD9k4mBW2e5AXKKlWnH132Q==
X-Received: by 2002:a17:902:9a4a:b0:1bb:1523:b2d7 with SMTP id x10-20020a1709029a4a00b001bb1523b2d7mr3997655plv.14.1690474672469;
        Thu, 27 Jul 2023 09:17:52 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:6180:6115:a0f6:68be:ba00? ([2601:646:9100:6180:6115:a0f6:68be:ba00])
        by smtp.gmail.com with ESMTPSA id o14-20020a170902d4ce00b001bb750189desm1819000plg.255.2023.07.27.09.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 09:17:52 -0700 (PDT)
Message-ID: <d106870a-120c-7c32-8a12-8bcd9ef52ddc@gmail.com>
Date: Thu, 27 Jul 2023 09:17:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] gcc : upgrade to v11.4
Content-Language: en-US
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
References: <20230727105315.97551-1-sundeep.kokkonda@windriver.com>
 <31108.1690455667025724912@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <31108.1690455667025724912@lists.openembedded.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------07FkGh30SwWK0eUtgVnQWr9o"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 16:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184968

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------07FkGh30SwWK0eUtgVnQWr9o
Content-Type: multipart/mixed; boundary="------------rDbY02bFIls0o5WaYFB5aGDS";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Message-ID: <d106870a-120c-7c32-8a12-8bcd9ef52ddc@gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gcc : upgrade to v11.4
References: <20230727105315.97551-1-sundeep.kokkonda@windriver.com>
 <31108.1690455667025724912@lists.openembedded.org>
In-Reply-To: <31108.1690455667025724912@lists.openembedded.org>

--------------rDbY02bFIls0o5WaYFB5aGDS
Content-Type: multipart/mixed; boundary="------------blm1V97AtXkn4iMFFLaEp2jr"

--------------blm1V97AtXkn4iMFFLaEp2jr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8yNy8yMyA0OjAxIEFNLCBTdW5kZWVwIEtPS0tPTkRBIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIHdyb3RlOg0KPiBSZWdyZXNzaW9uIHRlc3RpbmcgaXMgZG9uZSBhbmQgYmVs
b3cgYXJlIHRoZSByZXN1bHRzLg0KPiAqDQo+IGdjYyB0ZXN0IHN1bW1hcnk6wqAgwqAgwqAg
djExLjN2MTEuNCoNCj4gIyBvZiBleHBlY3RlZCBwYXNzZXPCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAxMjY1NTIxMjY4NDINCj4gIyBvZiB1bmV4cGVjdGVk
IGZhaWx1cmVzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMjQyOTXCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAyNDM4Mw0KDQpXZSBuZWVkIHRvIHJldmlldyB0aGVzZSBm
b3IgcmVncmVzc2lvbnMuIEkgYW0gd29ycmllZCBhYm91dCByZWdyZXNzaW5nLCANCm5ldyBm
YWlscyBhcmUgYWNjZXB0YWJsZS4NCg0KPiAjIG9mIHVuZXhwZWN0ZWQgc3VjY2Vzc2VzwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA3N8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIDc3DQo+ICMgb2YgZXhwZWN0ZWQgZmFpbHVyZXPCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA3ODLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCA3ODINCj4gIyBvZiB1bnJlc29sdmVkIHRlc3RjYXNlc8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgMTDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAxMA0KPiAj
IG9mIHVuc3VwcG9ydGVkIHRlc3RzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAyNzYwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMjc3Mw0KPiANCj4gDQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVz
c2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE4NDky
OCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L21lc3NhZ2UvMTg0OTI4DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL210LzEwMDM4Nzk0My8xOTk3OTE0DQo+IEdyb3VwIE93bmVyOiBvcGVu
ZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2Ny
aWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS91bnN1YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiANCg==
--------------blm1V97AtXkn4iMFFLaEp2jr
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------blm1V97AtXkn4iMFFLaEp2jr--

--------------rDbY02bFIls0o5WaYFB5aGDS--

--------------07FkGh30SwWK0eUtgVnQWr9o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZMKYrwUDAAAAAAAKCRC7BTNVkZ0zFLFw
AKCSNJPX95UDoNNjmxX8CktDabDXCwCeN/iVQGDYQHFOn3A18w8WOxXC4YM=
=K7Fb
-----END PGP SIGNATURE-----

--------------07FkGh30SwWK0eUtgVnQWr9o--

