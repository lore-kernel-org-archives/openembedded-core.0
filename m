Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E7CC001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 16:12:31 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.11632.1690474350751428816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 09:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kWbxiUp8;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso881724b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690474350; x=1691079150;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IF+oJMopxjxtn9+gm0LdD1+hLiuLZ3EX0SErhV0ZKag=;
        b=kWbxiUp8DkXLarAo1bAKq8pUZfJox1pNCr+yjI/C8tgmHKZipgbKg+70RUJ5pAUR5a
         ObEe4VLFf/1U4kRU6imOVqdgCPPlczKNbJyi/dZBfy2vK1lKXLU1tEkS/ISs7McLPBSw
         EGpS7LyXODXCC+hBno7NWXd0uxQl3dNctR1qgaaKhF3cQ6kofZUK5ZhWLFzv2fTou/YC
         ZpLhWikpLGhVFI1PXaoK7/F8AZ6JByfCYrpbaomLCzNi8bNGOnT9/KbOee/PZEc7rNDe
         4Iep6Mkkg9ndSR59jBNNqxnwCUAsSzmVe9n24vkCOJCSDXQXR3++wW9gB1h0iA+fPpio
         eYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474350; x=1691079150;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IF+oJMopxjxtn9+gm0LdD1+hLiuLZ3EX0SErhV0ZKag=;
        b=gMa18hI2q9bgMaVSlw2AD/9XOjCZ2TgmDTJuiRiVyvSV3WKp8PzOhv5H1w8NT/kxzd
         fos0rqmtx2nQRi8VKwZZvfBr46uvcYjvgsjXKUzTOBmfaz1CfrjwDaGnUDDrE+zHLqhC
         GUZtkM1xRn+kHHEyUZzQGt5CrilI6zW3zwhQdOIMGIKJMAxIS6i1EWMU3SlHfJ3JPUNI
         meQPSzig/WU7an3xw7z/UqHCjF2gPxdUEGZ4ddEM1qG5MHnljSdHBkeGHjL//RKYVi5f
         A+2QJBoC2jZRMynGT+cGndCCno9tjcNEpMRg/jwYD8Ytfi6VefCw3bmgrNmvnoJpZ7SX
         dNUQ==
X-Gm-Message-State: ABy/qLYTk4Ujnj2b9v6tH6qqbketebtzaOccDvXMW2tZfHsZ6NfV+oOl
	z7zGI3Xk3xg/VXjHyvAxXEE=
X-Google-Smtp-Source: APBJJlFK1c5eqGsRr9QakNci9PapCgm8jauDJwwM/mds4rwKcTVQI85asMDLVUwP3NCsTOuEoKOsXw==
X-Received: by 2002:a05:6a21:47c1:b0:132:d029:ed3d with SMTP id as1-20020a056a2147c100b00132d029ed3dmr4932555pzc.29.1690474349898;
        Thu, 27 Jul 2023 09:12:29 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:6180:6115:a0f6:68be:ba00? ([2601:646:9100:6180:6115:a0f6:68be:ba00])
        by smtp.gmail.com with ESMTPSA id j20-20020aa783d4000000b0062e0515f020sm1662993pfn.162.2023.07.27.09.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 09:12:29 -0700 (PDT)
Message-ID: <a88db32d-aea3-d125-72d3-5d25db427f36@gmail.com>
Date: Thu, 27 Jul 2023 09:12:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 16/21] libadwaita: add recipe from meta-gnome
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
 <20230727143627.3718496-16-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230727143627.3718496-16-alex@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0UKBTmC4XOP3BTyuYee0mGR2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 16:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184967

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0UKBTmC4XOP3BTyuYee0mGR2
Content-Type: multipart/mixed; boundary="------------K8OpQF6DDA3n8I0eDk2T82w0";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Message-ID: <a88db32d-aea3-d125-72d3-5d25db427f36@gmail.com>
Subject: Re: [OE-core] [PATCH 16/21] libadwaita: add recipe from meta-gnome
References: <20230727143627.3718496-1-alex@linutronix.de>
 <20230727143627.3718496-16-alex@linutronix.de>
In-Reply-To: <20230727143627.3718496-16-alex@linutronix.de>

--------------K8OpQF6DDA3n8I0eDk2T82w0
Content-Type: multipart/mixed; boundary="------------xxILkOIIZLW0YjbeKrhdF8yL"

--------------xxILkOIIZLW0YjbeKrhdF8yL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8yNy8yMyA3OjM2IEFNLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gVGhpcyBp
cyBhIHJlcXVpcmVtZW50IG9mIGxhdGVzdCBlcGlwaGFueSA0NC54Lg0KPiANCg0KVGhpcyBp
bXBvcnQgYnJlYWtzIGxheWVyIGNoZWNrIHRlc3RzIGZvciBtZXRhLW9lIGpvYiBiZWNhdXNl
IG5vdyB3ZSBoYXZlIA0KdGhpcyByZWNpcGUgaW4gdHdvIHBsYWNlcy4gV291bGQgYmUgZ29v
ZCB0byBzZW5kIGEgcmVtb3ZhbCB0byBtZXRhLWdub21lIA0Kc2ltdWx0YW5lb3VzbHkuDQoN
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4NCj4gLS0tDQo+ICAgbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmlu
YyAgICAgIHwgIDEgKw0KPiAgIC4uLi9saWJhZHdhaXRhL2xpYmFkd2FpdGFfMS4zLjMuYmIg
ICAgICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjMuMy5iYg0KPiANCj4gZGlmZiAt
LWdpdCBhL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9tYWludGFpbmVycy5pbmMgYi9tZXRh
L2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jDQo+IGluZGV4IDE3ZjAzOGM3
MWVmLi5kNDcyODQ5MjY1YiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNs
dWRlL21haW50YWluZXJzLmluYw0KPiArKysgYi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUv
bWFpbnRhaW5lcnMuaW5jDQo+IEBAIC0zMDUsNiArMzA1LDcgQEAgUkVDSVBFX01BSU5UQUlO
RVI6cG4tbGRjb25maWctbmF0aXZlID0gIktoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
Ig0KPiAgIFJFQ0lQRV9NQUlOVEFJTkVSOnBuLWxlc3MgPSAiWWkgWmhhbyA8eWkuemhhb0B3
aW5kcml2ZXIuY29tPiINCj4gICBSRUNJUEVfTUFJTlRBSU5FUjpwbi1saWJhNTIgPSAiVW5h
c3NpZ25lZCA8dW5hc3NpZ25lZEB5b2N0b3Byb2plY3Qub3JnPiINCj4gICBSRUNJUEVfTUFJ
TlRBSU5FUjpwbi1saWJhY3BpID0gIkFudWogTWl0dGFsIDxhbnVqLm1pdHRhbEBpbnRlbC5j
b20+Ig0KPiArUkVDSVBFX01BSU5UQUlORVI6cG4tbGliYWR3YWl0YSA9ICJBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4iDQo+ICAgUkVDSVBFX01BSU5UQUlO
RVI6cG4tbGliYWlvID0gIkFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPiINCj4gICBSRUNJUEVfTUFJTlRBSU5FUjpwbi1saWJhcmNoaXZlID0gIk90YXZpbyBT
YWx2YWRvciA8b3RhdmlvLnNhbHZhZG9yQG9zc3lzdGVtcy5jb20uYnI+Ig0KPiAgIFJFQ0lQ
RV9NQUlOVEFJTkVSOnBuLWxpYmFzc3VhbiA9ICJVbmFzc2lnbmVkIDx1bmFzc2lnbmVkQHlv
Y3RvcHJvamVjdC5vcmc+Ig0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xp
YmFkd2FpdGEvbGliYWR3YWl0YV8xLjMuMy5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS4zLjMuYmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXggMDAwMDAwMDAwMDAuLjhlYzUyNThjNzM2DQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjMuMy5iYg0K
PiBAQCAtMCwwICsxLDI1IEBADQo+ICtTVU1NQVJZID0gIkJ1aWxkaW5nIGJsb2NrcyBmb3Ig
bW9kZXJuIEdOT01FIGFwcGxpY2F0aW9ucyINCj4gK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0
bGFiLmdub21lLm9yZy9HTk9NRS9saWJhZHdhaXRhIg0KPiArTElDRU5TRT0iTEdQTC0yLjEt
b3ItbGF0ZXIiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT00
ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyINCj4gKw0KPiArR05PTUVCQVNFQlVJ
TERDTEFTUyA9ICJtZXNvbiINCj4gKw0KPiArREVQRU5EUyA9ICIgXA0KPiArICAgIGd0azQg
XA0KPiArIg0KPiArDQo+ICtpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rp
b24gZ2ktZG9jZ2VuIHZhbGEgZmVhdHVyZXNfY2hlY2sNCj4gKw0KPiArU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiM2ZiOWY2ZjhmNTcwZTU0M2FiMmRhZmI4YjRiOTRkOGIzNzZj
NTlhZDU2NWVmYWRmZWRlNDQ1NTdlM2YzYTllMSINCj4gKw0KPiArQU5ZX09GX0RJU1RST19G
RUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iDQo+ICtSRVFVSVJFRF9ESVNUUk9f
RkVBVFVSRVMgPSAib3BlbmdsIg0KPiArDQo+ICtHSVJfTUVTT05fRU5BQkxFX0ZMQUcgPSAn
ZW5hYmxlZCcNCj4gK0dJUl9NRVNPTl9ESVNBQkxFX0ZMQUcgPSAnZGlzYWJsZWQnDQo+ICtH
VEtET0NfTUVTT05fT1BUSU9OID0gJ2d0a19kb2MnDQo+ICsNCj4gK1BBQ0tBR0VDT05GSUdb
ZXhhbXBsZXNdID0gIi1EZXhhbXBsZXM9dHJ1ZSwtRGV4YW1wbGVzPWZhbHNlIg0KPiArDQo+
ICtGSUxFUzoke1BOfSArPSAiJHtkYXRhZGlyfS9tZXRhaW5mbyINCj4gDQo+IA0KPiANCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNz
YWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTg0OTU2
KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUv
bWVzc2FnZS8xODQ5NTYNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbXQvMTAwMzkxNjE5LzE5OTc5MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5l
bWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3Jp
YmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+IA0K
--------------xxILkOIIZLW0YjbeKrhdF8yL
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------xxILkOIIZLW0YjbeKrhdF8yL--

--------------K8OpQF6DDA3n8I0eDk2T82w0--

--------------0UKBTmC4XOP3BTyuYee0mGR2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZMKXbAUDAAAAAAAKCRC7BTNVkZ0zFAOQ
AJkB9ee/h+SM7VbRT83k+llguB9coQCfbMFshdJsCyDU1T1AqFSzmXEOAVI=
=U2t8
-----END PGP SIGNATURE-----

--------------0UKBTmC4XOP3BTyuYee0mGR2--

