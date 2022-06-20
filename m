Return-Path: <kristian.amlie@northern.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44776C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 11:56:37 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.18873.1655726172282212971
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 04:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@northern.tech header.s=google header.b=m2BItIeP;
 spf=pass (domain: northern.tech, ip: 209.85.167.50,
 mailfrom: kristian.amlie@northern.tech)
Received: by mail-lf1-f50.google.com with SMTP id f39so1238565lfv.3
        for <Openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northern.tech; s=google;
        h=message-id:date:mime-version:user-agent:content-language:from:to
         :references:subject:in-reply-to;
        bh=GAnsRy750/9xTDOHXlYNWDfujMIeH7PObogCyQXKEbg=;
        b=m2BItIeP9rUlOtOB3ol4yK6d1XCXRRY+QZj49sJy7zFr1VbbN7mBOV1Y3OiiUouZQw
         y+hkHjQeeE+V0N3czrkc9ot1GvXTIMyjUkek9+T4TlJS3RVMjCCt7lK8d6LAQS5U3rs8
         Vkrklm9Aj4i5zc87N2frCVY9y6sEP+VENVOh5LJgBLjkN4qim/E7sU23KjLohPAVU4mB
         ORCeLdYw4/zC1Cii/qVIrLJvCsVy4k91b8mq6vE0SN01Olm5syzq5LA6p88nXe6Yg/Fp
         1a7yGIFvWHViuVgK5L1gFpCpvFY2IzDkqSu1kv1pwFPljaM6HJShEDzKuB4teDbBfYuf
         NI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:from:to:references:subject:in-reply-to;
        bh=GAnsRy750/9xTDOHXlYNWDfujMIeH7PObogCyQXKEbg=;
        b=wCUrLk79DIQJkdavM9espOrA1Dm6Kl4ziI5bmS53MbnwHi2nE311GKzpIj+px8IRbE
         mMvftjHv1SU5gD7M81lXmJnfI3TnLJwV2HMdHTtFNshRXFr9yShaAsxfoo3VeMxffWVH
         RxPCLWu3fr/9o9W0CMcEm9WW0sU8SyGjgO7o8ZIb/X4e1wLpZzkpDbNovX/rrmnZFqfX
         dha17wvfGXGiFDW23VldHch7nenkjw5Y2Pr4t3HSteNZVb/vgvhc+zjR+c/oIHnzi6N6
         HNXMvl4si8F2gSSBZU9rg0jZEk3469F85YmiQ0PuQABKOMzGaK2SsJsH3pHdIJHtjNkw
         BGpw==
X-Gm-Message-State: AJIora9TQhnTknZLRDTDz9FSAPct+owFLj8SkKXffdkXYRS7SiGOcLcm
	FV9jEfNbhomFZA/KZlLblZ8jUg==
X-Google-Smtp-Source: 
 AGRyM1sAFfjQu4tLtPEDuZ/4fj/7a1Q8+bQ+WmYslg0kSSSTkKW3cuV1vyXhc9GHJlrajvEiECpCfA==
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id
 y15-20020a0565123f0f00b0047f6f890326mr2670163lfa.124.1655726169885;
        Mon, 20 Jun 2022 04:56:09 -0700 (PDT)
Received: from [10.180.37.33] ([91.232.32.6])
        by smtp.googlemail.com with ESMTPSA id
 g7-20020a05651c044700b0025a70f7ea3asm264844ljg.138.2022.06.20.04.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:56:08 -0700 (PDT)
Message-ID: <27095ef6-ad42-58d2-5242-60584bd6d139@northern.tech>
Date: Mon, 20 Jun 2022 13:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
From: Kristian Amlie <kristian.amlie@northern.tech>
To: richard.purdie@linuxfoundation.org,
 OE-core <Openembedded-core@lists.openembedded.org>
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
 <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
 <b5c562b9ef7f999b4c655cc45e8c50a9d472c81f.camel@linuxfoundation.org>
 <ef9a8546-e0a0-b346-cd3b-1a955088c11d@northern.tech>
Subject: Re: [OE-core] externalsrc wiping out external source directory
In-Reply-To: <ef9a8546-e0a0-b346-cd3b-1a955088c11d@northern.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z0Rt4lavSJ4YYSv02yJaT2Ra"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 11:56:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167094

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z0Rt4lavSJ4YYSv02yJaT2Ra
Content-Type: multipart/mixed; boundary="------------zkc40H3y2gG0YQe663NdeSwG";
 protected-headers="v1"
From: Kristian Amlie <kristian.amlie@northern.tech>
To: richard.purdie@linuxfoundation.org,
 OE-core <Openembedded-core@lists.openembedded.org>
Message-ID: <27095ef6-ad42-58d2-5242-60584bd6d139@northern.tech>
Subject: Re: [OE-core] externalsrc wiping out external source directory
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
 <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
 <b5c562b9ef7f999b4c655cc45e8c50a9d472c81f.camel@linuxfoundation.org>
 <ef9a8546-e0a0-b346-cd3b-1a955088c11d@northern.tech>
In-Reply-To: <ef9a8546-e0a0-b346-cd3b-1a955088c11d@northern.tech>

--------------zkc40H3y2gG0YQe663NdeSwG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAvMDUvMjAyMiAxNDozMiwgS3Jpc3RpYW4gQW1saWUgd3JvdGU6DQo+IE9uIDMwLzA1
LzIwMjIgMTM6NDgsIHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcgd3JvdGU6
DQo+PiBPbiBNb24sIDIwMjItMDUtMzAgYXQgMTM6NDYgKzAyMDAsIEtyaXN0aWFuIEFtbGll
IHdyb3RlOg0KPj4+IE9uIDI3LzA1LzIwMjIgMTY6MTksIHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmcgd3JvdGU6DQo+Pj4+IE9uIEZyaSwgMjAyMi0wNS0yNyBhdCAxNDow
NyArMDIwMCwgS3Jpc3RpYW4gQW1saWUgdmlhDQo+Pj4+IGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgd3JvdGU6DQo+Pj4+PiBIZXkgYWxsLA0KPj4+Pj4NCj4+Pj4+IEkgaGF2ZSBhIHByb2Js
ZW0gb24ga2lya3N0b25lIHdoZXJlIHVzaW5nIHRoZSAiZXh0ZXJuYWxzcmMiIGNsYXNzIA0K
Pj4+Pj4gd2lwZXMNCj4+Pj4+IG91dCB0aGUgZGlyZWN0b3J5IG1lbnRpb25lZCBpbiBFWFRF
Uk5BTFNSQywgaW4gb3RoZXIgd29yZHMgbXkgcGVyc29uYWwNCj4+Pj4+IGRldmVsb3BtZW50
IHJlcG9zaXRvcnkuDQo+Pj4+Pg0KPj4+Pj4gSSBoYXZlIHRyYWNlZCBpdCBkb3duIHRvIHRo
ZSAiZG9fdW5wYWNrW2NsZWFuZGlyc10iIHZhcmlhYmxlIGZsYWcuIA0KPj4+Pj4gVGhpcw0K
Pj4+Pj4gZmxhZyBpcyBzdXBwb3NlZCB0byBiZSByZW1vdmVkIGhlcmUgWzFdIHdoZW4gdXNp
bmcgImV4dGVybmFsc3JjIiwgYW5kDQo+Pj4+PiBpbmRlZWQgSSBoYXZlIHZlcmlmaWVkIHRo
YXQgdGhpcyBpcyB0aGUgY2FzZS4gQnV0IHdoZW4gdGhlIGZ1bmN0aW9uIGlzDQo+Pj4+PiBh
Ym91dCB0byBiZSBleGVjdXRlZCwgdGhlICJjbGVhbmRpcnMiIHZhcmlhYmxlIGZsYWcgaGFz
IHNvbWVob3cgYmVlbg0KPj4+Pj4gcmVzdG9yZWQgWzJdLiBUaGlzIGNhdXNlcyB0aGUgZGly
ZWN0b3J5IHRvIGJlIHJlbW92ZWQgYWZ0ZXIgYWxsLCANCj4+Pj4+IGRlc3BpdGUNCj4+Pj4+
IHRoZSBhdHRlbXB0IGF0IGF2b2lkaW5nIGl0Lg0KPj4+Pj4NCj4+Pj4+IEF0IHRoaXMgcG9p
bnQgSSdtIGEgYml0IGxvc3QsIEkgZG9uJ3QgcmVhbGx5IGtub3cgd2hhdCBoYXBwZW5zIGJl
dHdlZW4NCj4+Pj4+IHRob3NlIHR3byBzdGVwcy4gRG9lcyBhbnlvbmUgaGF2ZSBhbnkgaWRl
YSB3aGF0IG1pZ2h0IGJlIGhhcHBlbmluZz8gSXQNCj4+Pj4+IHNvdW5kcyBsaWtlIGEgcHJl
dHR5IHNlcmlvdXMgYnVnIHRvIG1lLCB3aXBpbmcgb3V0IHRoaW5ncyBpbiB0aGUgaG9tZQ0K
Pj4+Pj4gZGlyZWN0b3J5IG9mIHRoZSB1c2VyLg0KPj4+Pj4NCj4+Pj4+IFsxXQ0KPj4+Pj4g
aHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5L3RyZWUvbWV0YS9jbGFzc2VzL2V4
dGVybmFsc3JjLmJiY2xhc3M/aD1raXJrc3RvbmUjbjkzIA0KPj4+Pj4NCj4+Pj4+IFsyXQ0K
Pj4+Pj4gaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5L3RyZWUvYml0YmFrZS9s
aWIvYmIvYnVpbGQucHk/aD1raXJrc3RvbmUjbjE5MSANCj4+Pj4+DQo+Pj4+DQo+Pj4+IFRo
YXQgY2VydGFpbmx5IGlzbid0IHN1cHBvc2VkIHRvIGhhcHBlbi4gQXMgeW91IHNheSwgdGhl
IGNvZGUgaXMNCj4+Pj4gc3VwcG9zZWQgdG8gZGlzYWJsZSB0aGF0IGFuZCBpc24ndCBiZWhh
dmluZyBhcyBpbnRlbmRlZC4gSXQgaXMgaGFyZCB0bw0KPj4+PiBzYXkgbW9yZSB0aG91Z2gu
DQo+Pj4+DQo+Pj4+IElzIHRoZXJlIGEgdGVzdCBjYXNlIHlvdSBjYW4gc2hhcmUgd2l0aCB1
cyBzbyB3ZSBjYW4gcmVwcm9kdWNlIHRoZQ0KPj4+PiBpc3N1ZT8gV2l0aG91dCBzb21lIHdh
eSB0byByZXBsaWNhdGUgb2YgbW9yZSBkZXRhaWxzIG9mIHRoZSBlbnZpcm9ubWVudA0KPj4+
PiB0aGlzIG9jY3VycmVkIGluLCBkZWJ1Z2dpbmcgaXQgd2lsbCBiZSB2ZXJ5IGhhcmQuDQo+
Pj4NCj4+PiBIZXJlJ3MgYSB3YXkgdG8gcmVwcm9kdWNlIGl0Og0KPj4+DQo+Pj4gMS4gVGFr
ZSBhbnkgcmVjaXBlLCBsZXQncyBzYXkgcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveF8x
LjM1LjAuYmINCj4+Pg0KPj4+IDIuIEFkZCAiaW5oZXJpdCBnbyIgdG8gdGhhdCByZWNpcGUu
DQo+Pj4NCj4+PiAzLiBBZGQgJ0lOSEVSSVQgKz0gImV4dGVybmFsc3JjIicgdG8gbG9jYWwu
Y29uZi4NCj4+Pg0KPj4+IDQuIEFkZCAnRVhURVJOQUxTUkM6cG4tYnVzeWJveCA9ICIvdG1w
L2J1c3lib3giJyB0byBsb2NhbC5jb25mLg0KPj4+DQo+Pj4gNS4gUnVuICJta2RpciAtcCAv
dG1wL2J1c3lib3gva2VlcCIuDQo+Pj4NCj4+PiA2LiBSdW4gImJpdGJha2UgLWZjIHVucGFj
ayBidXN5Ym94Ii4NCj4+Pg0KPj4+IDcuIEFmdGVyd2FyZHMsIG9ic2VydmUgdGhhdCAiL3Rt
cC9idXN5Ym94L2tlZXAiIGhhcyB2YW5pc2hlZC4NCj4+Pg0KPj4+IFRoZSBrZXkgcGFydCBo
ZXJlIGFwcGVhcnMgdG8gYmUgdGhlICJFWFBPUlRfRlVOQ1RJT05TIiBzdGF0ZW1lbnQgaW5z
aWRlDQo+Pj4gZ28uYmJjbGFzcy4gSWYgImRvX3VucGFjayIgaXMgcmVtb3ZlZCBmcm9tIHRo
ZXJlLCB0aGVuIHRoZSBtZWNoYW5pc20NCj4+PiB3b3JrcyBjb3JyZWN0bHkgYWdhaW4uDQo+
Pg0KPj4gVGhhbmtzLCBhIHJlcHJvZHVjZXIgaGVscHMgYSBsb3QuIFRoaXMgd2FzIGFsbW9z
dCBjZXJ0YWlubHkgYSByZXN1bHQNCj4+IG9mOg0KPj4NCj4+IGh0dHBzOi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcvcG9reS9jb21taXQvP2lkPTczZmE4NTVmNmFmNWVmOWMzYTc4NjU2YWE1
NmYwOWQyMTM2MDFiZTIgDQo+Pg0KPiANCj4gSW5kZWVkLCBidXQgdGhhdCBzZWVtcyB0byBv
bmx5IGhhdmUgcmV2ZWFsZWQgdGhlIHByb2JsZW0uIFRoZSBkZXNpcmVkIA0KPiBiZWhhdmlv
ciBpcyBmb3IgY2xlYW5kaXJzIHRvIHdvcmssIGJ1dCAqYWxzbyogZm9yIGV4dGVybmFsc3Jj
IHRvIGJlIGFibGUgDQo+IHRvIGRlbGV0ZSBpdCwgcmlnaHQ/DQoNCkp1c3QgZm9yIHRoZSBy
ZWNvcmQsIGFuZCBmb3IgYW55IHBlb3BsZSBnb29nbGluZyB0aGlzOiBVbnRpbCB0aGlzIGlz
IA0KZml4ZWQsIGp1c3QgcmV2ZXJ0aW5nIHRoZSBhYm92ZSBjb21taXQgd29ya3MgdG8gZml4
IHRoaXMgcHJvYmxlbS4NCg0KUmljaGFyZCwgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGJ1
dCBJIGhhdmUgbm90IHlldCBzZWVuIGFueSBmaXhlcyBmb3IgDQp0aGlzLiBBbmQgdW5mb3J0
dW5hdGVseSB0aGlzIGlzIHRvbyBkZWVwIGluIEJpdGJha2UgZm9yIG1lIHRvIGZpeCBpdCAN
Cm15c2VsZi4gRG8geW91IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIHJldmVydCB0aGF0IGNv
bW1pdCBpbiB0aGUgDQpvZmZpY2lhbCBwb2t5IGJyYW5jaGVzPyBJIG1lYW4sIHRoZSBjb25z
ZXF1ZW5jZXMgb2YgdGhpcyBidWcgYXJlIA0KdW51c3VhbGx5IGRpcmUuIEVzcGVjaWFsbHkg
aW4gY29tYmluYXRpb24gd2l0aCBnbydzIGNvbW1vbiBwYXR0ZXJuIG9mIA0KcHV0dGluZyBh
bGwgc291cmNlIGNvZGUgaW4gb25lIGRpcmVjdG9yeSwgZXh0ZXJuYWxzcmMgY2FuIHdpcGUg
b3V0IG1vc3QgDQpvZiB0aGUgc291cmNlIGNvZGUgaW4gdGhlIHVzZXIncyBob21lIGRpcmVj
dG9yeS4NCg0KLS0gDQpLcmlzdGlhbg0K

--------------zkc40H3y2gG0YQe663NdeSwG--

--------------Z0Rt4lavSJ4YYSv02yJaT2Ra
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENCehelwanxwH18S/9GRAfJlq8D8FAmKwYFcACgkQ9GRAfJlq
8D+p4gf/SwI/JzUmoNR5Wke+DsO6oOJnk5P5xlrDDZ630v3SOs4trjWYubAuO5l6
W2DDb61dEhh10nBkqVL6IB52sTEfYUsOf/FJG87WwxLn473T34qRYQ2ULWmXKg5H
evjQdWXY30RqJO73LV5v38Jkym8CwMQwAgVDAP6ni23e1Hx/lXJ/sU2cNYHjDA0j
oHlW7zEcG8O3uOVEOblDHqNqSnUaABPlYKBjhfCFg+VaF1xRv9dRJtRdZHdM1t7z
rizLOccFy4UKrsmjNpc3RtX0hktXfBi5PW0FD4iVmF/59M1yqdfoWS6/WXxEH08d
9eCWxXMdrSeUqH0qNCFXMyT9ZjnPxQ==
=+x2a
-----END PGP SIGNATURE-----

--------------Z0Rt4lavSJ4YYSv02yJaT2Ra--

