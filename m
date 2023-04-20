Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFB2C77B7C
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 15:00:19 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.10506.1682002811358014658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 08:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RAsezSib;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b52ad6311so1425300b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682002811; x=1684594811;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5WARgZ3hgPaIzBzNhlCBoJhspegFigvqw3lVQpUkWko=;
        b=RAsezSib8BYaUHhTK82zTevc1Bk9O9asYFQJO7DKFYYHtphhGQJErPGoNo1BviAuMh
         3PY2bk/ExACS7/htmELk7bAt3kJ50UGFyrD7HTqCieFsv/4dzQBWLUqGAwItjnd8uOsH
         jK02UIkBS3L33aRJVxJ1PJ7V+71at1HZoAg3Nly+fOjF4VfKw1bN5UIcAB9LmsUEEnPa
         x7peqagpaci2VU2ptn7RhsWyNbp55zQNrm/Foz7DZlFobyx2oJ6OGE83HfQer4bCgDnX
         rtlV05QYnutFrd29bLclkdBxeIE9HP3NFcsA2IFDZa1Kj8tZ2503guG8bqJI49FrP3b1
         i9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002811; x=1684594811;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WARgZ3hgPaIzBzNhlCBoJhspegFigvqw3lVQpUkWko=;
        b=lgB0VbolehEUEQNtGCT4w3G24u4n/LSN5ZvYq28YWXkbT+EmKH8eiYLtqxhKith5b8
         P7kUhdQ6yU0m2vqtPrRGBCIlwmZoLIUh3Bvmg6kMzh7Go1OdGnRW7qNSRPQns++WjdIg
         +OKVg+seZ2npM9EkVWRm5CzKLeutLiEbVO8uCwX7PDJ7wOaVI6aBJicqhykNIcKe51BF
         IF7x/K/SFNMUFSwqf9K6zFO3NDaS7MFMn5OjpfeQZ3KYHE7UR9vqgp28VwuccQD1QZuy
         j8i9qKYajSgRnceC02/g/yw0+PtxGk11sr0gv5WD3LAwhtM/7plOY8cFP5Y0Ft9GSZES
         9a1Q==
X-Gm-Message-State: AAQBX9fbAJya2Kc+05mm7rXAFbAeKdbnKdf713WaUkLC+gvVzHHFHxfK
	BxeLKbc0OgCig1dP7Wiev48=
X-Google-Smtp-Source: AKy350bVPFLT6grHk5sDSCn8fA3a2Zo1tbY3fl5E/ejpswtLHLUxbOS1ahLn132MVaC4BOKXF1dF2Q==
X-Received: by 2002:a05:6a21:32a8:b0:f0:a282:a343 with SMTP id yt40-20020a056a2132a800b000f0a282a343mr2617859pzb.16.1682002810210;
        Thu, 20 Apr 2023 08:00:10 -0700 (PDT)
Received: from ?IPV6:2601:646:9181:d380:3895:4735:307e:d168? ([2601:646:9181:d380:3895:4735:307e:d168])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a00078100b0063b675f01a2sm1359181pfu.26.2023.04.20.08.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:00:09 -0700 (PDT)
Message-ID: <f0057a72-aebd-230e-f247-ca47f3ac025a@gmail.com>
Date: Thu, 20 Apr 2023 08:00:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [OE-core] Cargo and ptest
To: Frederic Martinsons <frederic.martinsons@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
 <b8187209629974cf50110a5690a14360e7c02026.camel@linuxfoundation.org>
 <CA+cAkeqwkQRFzEYVC0jm0xdby9RrGqYtVOenc85+J-nMiGwtoA@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CA+cAkeqwkQRFzEYVC0jm0xdby9RrGqYtVOenc85+J-nMiGwtoA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Qzm9GUNP60tKvmPuzeUEud8V"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 15:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180254

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Qzm9GUNP60tKvmPuzeUEud8V
Content-Type: multipart/mixed; boundary="------------avDFEDo8kRggAU0xMlNiHSv9";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Frederic Martinsons <frederic.martinsons@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <f0057a72-aebd-230e-f247-ca47f3ac025a@gmail.com>
Subject: Re: [OE-core] Cargo and ptest
References: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
 <b8187209629974cf50110a5690a14360e7c02026.camel@linuxfoundation.org>
 <CA+cAkeqwkQRFzEYVC0jm0xdby9RrGqYtVOenc85+J-nMiGwtoA@mail.gmail.com>
In-Reply-To: <CA+cAkeqwkQRFzEYVC0jm0xdby9RrGqYtVOenc85+J-nMiGwtoA@mail.gmail.com>

--------------avDFEDo8kRggAU0xMlNiHSv9
Content-Type: multipart/mixed; boundary="------------Btu1ZaOjgvYMrcq01srnFa0Z"

--------------Btu1ZaOjgvYMrcq01srnFa0Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMC8yMyAyOjU3IEFNLCBGcmVkZXJpYyBNYXJ0aW5zb25zIHdyb3RlOg0KPiANCj4g
DQo+IExlIGpldS4gMjAgYXZyLiAyMDIzLCAxMTo0MSwgUmljaGFyZCBQdXJkaWUgDQo+IDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnIA0KPiA8bWFpbHRvOnJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+PiBhIMOpY3JpdMKgOg0KPiANCj4gICAgIE9u
IFRodSwgMjAyMy0wNC0yMCBhdCAwOToyNyArMDIwMCwgRnJlZGVyaWMgTWFydGluc29ucyB3
cm90ZToNCj4gICAgICA+IEhlbGxvLA0KPiAgICAgID4NCj4gICAgICA+IEkgd291bGQgbGlr
ZSB0byBidWlsZCBhbmQgc2hpcCB0ZXN0cyBmb3IgcmVjaXBlcyB3aGljaCB1c2VzIGNhcmdv
IGFuZA0KPiAgICAgID4gaW4gdGhlIHByb2Nlc3MsIHRocmVlIHF1ZXN0aW9ucyBhcm9zZSAo
bWF5YmUgbW9yZSB3aGVuIEkgd2lsbA0KPiAgICAgID4gcHJvZ3Jlc3MpLg0KPiAgICAgID4g
SSB3b3VsZCBsaWtlIHRvIGhhdmUgeW91ciBvcGluaW9ucyBvbiB0aGVtLg0KPiAgICAgID4N
Cj4gICAgICA+IDEpIHNob3VsZCB3ZSBzaGlwIGNhcmdvLW5hdGl2ZSBpbiBwdGVzdCBpbWFn
ZXMgb3Igc2hvdWxkIHdlIGp1c3QNCj4gICAgICA+IGJ1aWxkIGFuZCBzaGlwIHRlc3QgYmlu
YXJpZXMgYWxvbmUgPw0KPiANCj4gICAgIHB0ZXN0cyBydW4gaW4gdGFyZ2V0IGltYWdlcyBz
byB0aGV5J2QgZGVwZW5kIG9uICJjYXJnbyIgYW5kIGNhcmdvLQ0KPiAgICAgbmF0aXZlIHdv
dWxkbid0IGJlIGFwcHJvcHJpYXRlLg0KPiANCj4gDQo+IE9mIGNvdXJzZSwgSSBtZWFudCBj
YXJnbywgbm90IGNhcmdvLW5hdGl2ZS4NCj4gSSdtIGFza2luZyBmb3IgdGhhdCBiZWNhdXNl
IHJ1bm5pbmcgImNhcmdvIHRlc3QiIHRvIGV4ZWN1dGUgdGhlIHdob2xlIA0KPiB0ZXN0IHN1
aXRlIGlzIHRoZSBzdGFuZGFyZCBmb3IgcnVzdCBwcm9qZWN0IGJ1dCBpdCB3aWxsIGZvcmNl
IHVzIHRvIA0KPiBlbWJlZCBjYXJnbyAocGx1cyBhbGwgaXQncyBkZXBzKSBhbmQgc291cmNl
IGNvZGUgZm9yIGRvaW5nIHRoYXQuIEkgdGhpbmsgDQo+IEkgd2lsbCBnbyBmb3IgdGhlIHRl
c3QgYmluYXJpZXMgb25seSBmb3IgdGhlIG1vbWVudC4gTm90ZSB0aGF0IEkgd2lsbCANCj4g
bmVlZCB0byBkbyBzb21lICJjbGV2ZXIiIHNlYXJjaCBvZiB0aGVtIGJlY2F1c2UgdGhleSBk
byBub3QgaGF2ZSBhIA0KPiBkZXRlcm1pbmlzdGljIG5hbWUgKGh0dHBzOi8vZ2l0aHViLmNv
bS9ydXN0LWxhbmcvY2FyZ28vaXNzdWVzLzE5MjQgDQo+IDxodHRwczovL2dpdGh1Yi5jb20v
cnVzdC1sYW5nL2NhcmdvL2lzc3Vlcy8xOTI0PikNCg0KVXN1YWxseSBwdGVzdHMgYXJlIGNy
b3NzIGNvbXBpbGVkIGR1cmluZyBidWlsZCBhbmQgcmVzdWx0cyBhcmUgcGFja2FnZWQNCmlu
dG8gUE4tcHRlc3QgcGFja2FnZS4gQSBydW4tcHRlc3Qgc2NyaXB0IGlzIGFkZGVkIHRvIHRo
aXMgcGFja2FnZSB3aGljaA0KaXMgdXNlZCB0byBleGVjdXRlIHRoZSB0ZXN0cyBvbiBkZXZp
Y2UuIFRoaXMgYWxzbyBpbnRlZ3JhdGVzIHdpdGggDQpwdGVzdC1ydW5uZXIgYW5kIGxhcmdl
ciBzeXN0ZW0gdGVzdGluZyBpZiB5b3Ugd2lzaCB0byBkbyBzby4gaW4gc29tZSANCmNhc2Vz
IHdlDQptaWdodCBwYWNrYWdlIHRvb2xzIG5lZWRlZCB0byBydW4gdGhlIHRlc3RzIG9uIHRh
cmdldCBidXQgc2VsZG9tIGRvIHdlDQpjb21waWxlIHRoZSB0ZXN0cyBvbiB0YXJnZXQgYW5k
IHRoZW4gcnVuIHRoZW0gYmVjYXVzZSBlbWJlZGRlZCB0YXJnZXRzIA0KbWF5IG5vdCBoYXZl
IGVub3VnaCBtdXNsZSB0byBkbyB0aGF0LiBTbyBpZiBjYXJnbyBiaW5hcnkgaXMgbmVlZGVk
IHRvIA0KcnVuIHRoZSBwcmUtY29tcGlsZWQgdGVzdHMgdGhlbiBJIHRoaW5rIGFkZGluZyB0
aGF0IHRvIHJkZXBzIG9mIFBOLXB0ZXN0IA0KbWlnaHQgYmUgZmluZS4NCg0KPiANCj4gDQo+
ICAgICAgPiAyKSBzaG91bGQgd2UgcGxhY2UgdGhlIGNhcmdvIHB0ZXN0IHNwZWNpZmljcyBp
biBhIGRlZGljYXRlZCBjbGFzcw0KPiAgICAgID4gKGUuZyBwdGVzdC1jYXJnby5iYmNsYXNz
LCBsaWtlIGFscmVhZHkgZXhpc3RpbmcgcHRlc3QtZ25vbWUgb3IgcHRlc3QtDQo+ICAgICAg
PiBwZXJsKSBvciBwdXQgdGhpcyBpbiBjYXJnby5iYmNsYXNzIGl0c2VsZiA/DQo+IA0KPiAg
ICAgSWYgcHRlc3RzIGZvciBjYXJnbyBhbGwgZm9sbG93IGEgY29tbW9uIGZvcm1hdCBhbmQg
YSBjbGFzcyBjYW4gZW5hYmxlDQo+ICAgICB0aGVtIGZvciBhIGxhcmdlIHNldCBvZiByZWNp
cGVzLCBhIGNsYXNzIGlzIGFwcHJvcHJpYXRlLg0KPiANCj4gICAgIElmIHdvdWxkIG9ubHkg
YmUgaW4gY2FyZ28uYmJjbGFzcyBpdHNlbGYgaWYgYWxsIGNhcmdvIHJlY2lwZXMgaGFkDQo+
ICAgICBzdGFuZGFyZCBwdGVzdHMuDQo+IA0KPiANCj4gWWVzIHRoZXkgZG8gZm9sbG93IGEg
Y29tbW9uIGZvcm1hdCBmb3IgYWxsIHJ1c3QgcHJvamVjdHMgKGV4Y2VwdCBmb3IgdGhlIA0K
PiBnZW5lcmF0ZWQgYmluYXJ5IG5hbWUsIHNlZSBhYm92ZSkuIEJ1dCBhIHJlY2lwZSBjYW4g
cGVyZmVjdGx5IGNob29zZSB0byANCj4gbm90IGltcGxlbWVudGluZyBhbnkgdGVzdHMgaWYg
dGhleSB3YW50IHRvLg0KPiBJJ2xsIGdvIGZvciBhIHNlcGFyYXRlIGNsYXNzIHRvIGNsZWFy
bHkgZGlzdGluZ3Vpc2ggdGVzdCB0aGluZ3MgaW4gYSANCj4gZmlyc3QgdGltZS4NCj4gDQo+
IA0KPiAgICAgID4gMykgc2hvdWxkIHdlIGVtYmVkIGFsbCBraW5kIG9mIHRlc3RzICh1bml0
LCBpbnRlZ3JhdGlvbiBhbmQgZG9jDQo+ICAgICAgPiB0ZXN0cywgc2VlDQo+ICAgICAgPiBo
dHRwczovL2RvYy5ydXN0LWxhbmcub3JnL2Jvb2svY2gxMS0wMy10ZXN0LW9yZ2FuaXphdGlv
bi5odG1sDQo+ICAgICA8aHR0cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9ib29rL2NoMTEtMDMt
dGVzdC1vcmdhbml6YXRpb24uaHRtbD4pIG9yDQo+ICAgICAgPiBqdXN0IHRoZSB1bml0IHRl
c3RzID8NCj4gDQo+ICAgICBJIGRvbid0IGtub3cgYWJvdXQgdGhlIHJ1c3Qgc3BlY2lmaWMg
ZGV0YWlscyBidXQgdW5pdCBhbmQgaW50ZWdyYXRpb24NCj4gICAgIHRlc3RzIGFyZSBib3Ro
IGFwcHJvcHJpYXRlLiBJJ3ZlIG5vIHN0cm9uZyBvcGluaW9uIG9uIGRvYyB0ZXN0cy4NCj4g
ICAgIFRoZXkncmUgcHJvYmFibHkgZmluZSBpZiB0aGV5IGRvbid0IGFkZCBsYXJnZSBkZXBl
bmRlbmN5IGNoYWlucyBhbmQgcnVuDQo+ICAgICBxdWlja2x5Lg0KPiANCj4gICAgIENoZWVy
cywNCj4gDQo+ICAgICBSaWNoYXJkDQo+IA0KPiANCj4gT0sgSSdsbCBzZWUgaG93IGRvYyB0
ZXN0cyBiZWhhdmUgZm9yIGFscmVhZHkgZXhpc3RpbmcgcmVjaXBlcyAoaWYgdGhleSANCj4g
aGF2ZSBzb21lKS4NCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+
IFZpZXcvUmVwbHkgT25saW5lICgjMTgwMjQ2KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xODAyNDYNCj4gTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTgzODQyODYvMTk5
NzkxNA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0N
Cj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=
--------------Btu1ZaOjgvYMrcq01srnFa0Z
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------Btu1ZaOjgvYMrcq01srnFa0Z--

--------------avDFEDo8kRggAU0xMlNiHSv9--

--------------Qzm9GUNP60tKvmPuzeUEud8V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZEFTeAUDAAAAAAAKCRC7BTNVkZ0zFMzn
AJ0XieurFB2k8BqOMSeP3x//eQeqEgCfZlidh/6B1NtYhLa/3cXKPL6WPS8=
=wvT4
-----END PGP SIGNATURE-----

--------------Qzm9GUNP60tKvmPuzeUEud8V--

