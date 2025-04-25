Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF6DC369AB
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 00:44:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1389.1745541846053594626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 17:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h4QD64Dm;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225477548e1so19070245ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 17:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745541845; x=1746146645; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+rDeOgWiHE3DoyaaOYS2VXvKmQlRiUlezd2srLY15EQ=;
        b=h4QD64DmYANXX6o0QvPGkS83wVXbq6sIYkeqF/G2giJ0mJW5pcJM33UHO8DTef0gbj
         N0X5LQ/sW1bObQIGKJBzAVs2SotomraGIub/ULAJxjo5Gu/9dBIPE3kHZYfIdiIphT9z
         XiiJpY13huf9enUDQnOv+4t38/vqU9FkqL/iZaK/TrybTgtKawVeI8LKegikVe1+cEcB
         s4zxrQA3677rcnu1Tl2DkR+rYxNcVokGwR1patvGT5SC7L4zw504tatoVNAB8/4VVCBt
         SBpYbo4tySeex6pU5lLU8eeXEO3QLriZWBtV8vddCq+K5hxbZ4VDTLgR9GQkPxDm9EFa
         +dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745541845; x=1746146645;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rDeOgWiHE3DoyaaOYS2VXvKmQlRiUlezd2srLY15EQ=;
        b=dg9E/rxJv0gL/kHEtLIEpucoeBF7YWRWiAEfB04jjoODKtPR0ky3/r7uyuXhXGtlEP
         EIid2BxmLYoa63lRwliYO1bCmEdjU/o5QF6au+vwDVuG4XfnBWet/4tAWZhS/V+A/PJW
         2tWCh9PgMVYk0AEVxgzad0VomEwdKBRSM/6TfhzCrmDkD0J/5dAP5QM7E9edWSBnGwqx
         GP57LgQSHwDxyOSlIyV651YV0CAJK0kBWRhYbiDlpO+6H4haRhkhmJ2aV2YbU5MFTxL8
         obuSVf9QKyN8dhjL/29CBdWid3tM1MdYS4EQ6AfZ/A8tafCMbi2q4+H89bkPCJRx+Zeb
         OvQg==
X-Gm-Message-State: AOJu0YyFmRCX/H20/YRD04REVvZz9fGtt/xiMhKcnnEn213dRIQvmViN
	9TFzZpab8AUkTDx+BBfhEGTaha1pSGpIOfvZJI2zNZRphgeKpEhJ9uDrVtdP
X-Gm-Gg: ASbGnct53knD5D6qDTQ6hVt9YTUFKZ1ne0tCi9R/JMxPoSSaCBwnHLiQ7TfAPukOsEY
	D8FA4MslyTll008J9r7CvDsChdei8IqS2zjdMVTSmiTv4zPs7/x0IHwUEyV8SlRBq47CZJejLpY
	pxatAx03Cqta9eUqA2xLWXBB4KvaJBeAb7IKojg3swsnq8gl6kU89azSL1xBjQheraDYZnY4auG
	pZBxUnsnYJ4Dv51tb1HnA3kpnYDQnJcz1MytlwHMADHvhmi8/2pkdKYoBZEwGSaM2wSnbodKqu8
	zCeb/f8HIyk4wxGbNMT0CJhGaCP06Y9lJcojfyJl+U4CF6hyYXMrjX8OiBoC2SVTGmbi5G86vRo
	yKUX2u4UmOLoPryDFg+A9WRwmsw47XBekd7C4Ty89Hw==
X-Google-Smtp-Source: AGHT+IF55j0tpgX2dhpgI8KlENSFbarYQqP98YLsJ9X0IaxYiWk6FedlybQVZG4DXgzs3xkDzrzcLg==
X-Received: by 2002:a17:902:d488:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-22dbf5f8fc7mr5396685ad.23.1745541845278;
        Thu, 24 Apr 2025 17:44:05 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:4cdc:d44e:eaf:ca3b? ([2601:646:8201:fd20:4cdc:d44e:eaf:ca3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d77395sm20143025ad.5.2025.04.24.17.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 17:44:04 -0700 (PDT)
Message-ID: <0724d355-d683-4b4f-abd4-68c31bbef674@gmail.com>
Date: Thu, 24 Apr 2025 17:44:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] clang-merge: Bring clang recipes from meta-clang
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
 Liu Yiding <liuyd.fnst@fujitsu.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <zvfx3kfrbicdbv424j4ustmrrjwjg7immyx4lp6ihrnwktgsks@rqy3zvo7xjai>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <zvfx3kfrbicdbv424j4ustmrrjwjg7immyx4lp6ihrnwktgsks@rqy3zvo7xjai>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JH0dgnFeVVEf0z4XJNz0w25f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215411

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JH0dgnFeVVEf0z4XJNz0w25f
Content-Type: multipart/mixed; boundary="------------QTbIlZafTFPnIOA3VgA4iR71";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
 Liu Yiding <liuyd.fnst@fujitsu.com>
Message-ID: <0724d355-d683-4b4f-abd4-68c31bbef674@gmail.com>
Subject: Re: [PATCH 00/11] clang-merge: Bring clang recipes from meta-clang
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <zvfx3kfrbicdbv424j4ustmrrjwjg7immyx4lp6ihrnwktgsks@rqy3zvo7xjai>
In-Reply-To: <zvfx3kfrbicdbv424j4ustmrrjwjg7immyx4lp6ihrnwktgsks@rqy3zvo7xjai>

--------------QTbIlZafTFPnIOA3VgA4iR71
Content-Type: multipart/mixed; boundary="------------uS7bmWWoM6CiDEMrnzbYuEv5"

--------------uS7bmWWoM6CiDEMrnzbYuEv5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yNC8yNSAzOjA0IEFNLCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOg0KPiBPbiBUaHUs
IEFwciAyNCwgMjAyNSBhdCAxMjoyMDozNEFNIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4+
IExhdGVzdCBtZXNhIDI1KyBuZWVkcyBsaWJjbGFuZyBkdXJpbmcgYnVpbGQgZm9yIHRvb2xz
IGxpa2UgbWVzYV9jbGMsDQo+PiB3ZSBlbmFobmNlZCBhbHJlYWR5IGV4aXN0aW5nIGxsdm0g
cmVjaXBlIHRvIGJ1aWxkIHBpZWNlcyBvZiBjbGFuZyBhcw0KPj4gd2VsbCwgd2hpY2ggd29y
a2VkIGZvciBtZXNhJ3MgbmVlZHMgYnV0IGJyb2tlIHN0YXRpYyBjbGFuZyBjb21waWxlcg0K
Pj4gcHJvdmlkZWQgYnkgbWV0YS1jbGFuZyBkdWUgdG8gbmV3Zm91bmQgY29uZmxpY3RzLCBz
aW5jZSBjbGFuZyBpcyBub3cNCj4+IGJ1aWx0IHdpdGggbGx2bSByZWNpcGUgZnJvbSBjb3Jl
IGFuZCBhbHNvIGJ5IG1ldGEtY2xhbmcgYW5kIHRoZXkNCj4+IGNvbXBldGUgZm9yIHNhbWUg
bmFtZXNwYWNlLCBhbiBhdHRlbXB0IHRvIG1ha2UgdGhlbSBjby1oYWJpdCBkaWQgcmV2ZWFs
DQo+PiBtb3JlIGRpZmZpY3VsdGllcy4gQ2xhbmcgY29tcGlsZXIgZnJvbSBtZXRhLWNsYW5n
IGlzIG5vdCBhYmxlIHRvIHVzZQ0KPj4gbGx2bSBsaWJyYXJpZXMgZnJvbSBjb3JlIHNpbmNl
IHRoZXkgcGF0Y2ggdGhlbSBkaWZmZXJlbnRseS4NCj4+DQo+PiBUaGlzIHBhdGNoIHNlcmll
cyB0aGVyZWZvcmUgYnJpbmdzIGNsYW5nIGFuZCBhbGwgcmVjaXBlcyB0aGF0IGJ1aWxkIGZy
b20NCj4+IGxsdm0gc291cmNlcyBpbnRvIGNvcmUuIFdpdGggdGhpcyBjaGFuZ2VzZXQsIGNs
YW5nIHJlY2lwZXMgY2FuIGJlIHJlbW92ZWQNCj4+IGZyb20gbWV0YS1jbGFuZyB0aGVyZSBp
cyBhIHB1bGwgcmVxdWVzdCBmb3IgdGhhdCBhbHJlYWR5IFsxXQ0KPj4gQXMgYW4gYXNpZGUs
IHdlIG9ubHkgYnVpbGQgY2xhbmcgb25jZSBhbmQgdXNlIGl0IGZvciBtZXRhLWNsYW5nIG5l
ZWRzDQo+PiBhbmQgY29yZSBuZWVkcy4NCj4+DQo+PiBXaXRoIHRoaXMsIG1ldGEtY2xhbmcg
Y2FuIGRlcGVuZCB1cG9uIGNvcmUgbGF5ZXIgdG8gcHJvdmlkZSBjbGFuZyBhbmQNCj4+IHJl
bGF0ZWQgcmVjaXBlcywgbWV0YS1jbGFuZyB3aWxsIHN0aWxsIHByb3ZpZGUgdGhlIHRvb2xj
aGFpbiBwb2xpY2llcw0KPj4gYXJvdW5kIGNsYW5nIGJhc2VkIHRvb2xjaGFpbnMuIENsYW5n
IGNvbXBpbGVyIGZyb20gY29yZSwgd2hpbGUgdXNhYmxlDQo+PiBmb3IgbWVzYSBpcyBub3Qg
eWV0IGZ1bGx5IHVzYWJsZSBvdXQgb2YgYm94LCBzaW5jZSB3ZSBuZWVkIHRvIHdvcmtvdXQN
Cj4+IHRoZSBtdWx0aS10b29sY2hhaW4gYXJjaGl0ZWN0dXJlIGZvciBjb3JlLCB3aGljaCB3
aWxsIGJlIGRvbmUgaW4gbmV4dA0KPj4gcGhhc2UgYWZ0ZXIgdGhpcyBtZXJnZS4NCj4+DQo+
PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2tyYWovbWV0YS1jbGFuZy9wdWxsLzEwODgNCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiAN
Cj4gQWZ0ZXIgZml4aW5nIHRoZSBSUFJPVklERVMsIHRoaXMgc3RpbGwgZmFpbHMgdGhlIG5h
dGl2ZXNkay1tZXNhIGJ1aWxkIGlmDQoNCmNsYW5nIHJlY2lwZSBkb2VzIGhhdmUgdGhpcw0K
DQpQUk9WSURFUzphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBsbHZtLW5hdGl2ZSBsaWJjbGMt
bmF0aXZlIA0Kc3BpcnYtbGx2bS10cmFuc2xhdG9yLW5hdGl2ZSINClBST1ZJREVTOmFwcGVu
ZDpjbGFzcy10YXJnZXQgPSAiIGxsdm0gbGliY2xjIHNwaXJ2LWxsdm0tdHJhbnNsYXRvciIN
ClBST1ZJREVTOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIG5hdGl2ZXNkay1sbHZtIG5h
dGl2ZXNkay1saWJjbGMgDQpuYXRpdmVzZGstc3BpcnYtbGx2bS10cmFuc2xhdG9yIg0KDQoN
Ckkgd29uZGVyIHdoeSBpcyBSUFJPVklERSBuZWVkZWQuDQoNCj4gSSBlbmFibGUgT3BlbkNM
Lg0KPiANCj4gRVJST1I6IFFBIElzc3VlOiBGaWxlIC91c3IvbG9jYWwvb2Utc2RrLWhhcmRj
b2RlZC1idWlsZHBhdGgvc3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvdXNyL2xpYi9s
aWJNZXNhT3BlbkNMLnNvLjEuMC4wIGluIHBhY2thZ2UgbmF0aXZlc2RrLWxpYm9wZW5jbC1t
ZXNhIGNvbnRhaW5zIHJlZmVyZW5jZSB0byBUTVBESVIgW2J1aWxkcGF0aHNdDQo+IA0KPiBX
aGlsZSBidWlsZGluZyBPcGVuQ0wtZW5hYmxlZCBNZXNhOg0KPiANCj4gL2hvbWUvbHVtYWcv
UHJvamVjdHMvUlBCL2J1aWxkLXJwYi90bXAtcG9reS93b3JrL2NvcnRleGE1Ny1wb2t5LWxp
bnV4L21lc2EvMjUuMC4yL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2xsdm0vQURUL0Rl
bnNlTWFwSW5mby5oOjE3OjEwOiBmYXRhbCBlcnJvcjogJ2Nhc3NlcnQnIGZpbGUgbm90IGZv
dW5kDQo+IFVuYWJsZSB0byBnZW5lcmF0ZSBiaW5kaW5nczogY2xhbmcgZGlhZ25vc2VkIGVy
cm9yOiAvaG9tZS9sdW1hZy9Qcm9qZWN0cy9SUEIvYnVpbGQtcnBiL3RtcC1wb2t5L3dvcmsv
Y29ydGV4YTU3LXBva3ktbGludXgvbWVzYS8yNS4wLjIvcmVjaXBlLXN5c3Jvb3QvdXNyL2lu
Y2x1ZGUvbGx2bS9BRFQvRGVuc2VNYXBJbmZvLmg6MTc6MTA6IGZhdGFsIGVycm9yOiAnY2Fz
c2VydCcgZmlsZSBub3QgZm91bmQNCiA+DQoNCkkgZG8gbm90IHNlZSB0aGlzIGVycm9yIGZv
ciBxZW11eDg2LTY0IGhlcmUgKCBtYXliZSBpdCBoYXBwZW5zIGZvciBhcm02NCANCnRhcmdl
dHMgYWxvbmUgPyApIEkgZW5hYmxlZCBvcGVuY2wgcmVsYXRlZCBwYWthZ2Vjb25maWdzIGZv
ciANCm5hdGl2ZXNkay1tZXNhIEkgYWRkZWQgdGhpcyBsaW5lDQoNClBBQ0tBR0VDT05GSUc6
YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgbGliY2xjIGdhbGxpdW0tbGx2bSBhbWQgc3Zn
YSINCg0KYW5kIG5hdGl2ZXNkay1tZXNhIGJ1aWx0IGp1c3QgZmluZS4NCg0K
--------------uS7bmWWoM6CiDEMrnzbYuEv5
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------uS7bmWWoM6CiDEMrnzbYuEv5--

--------------QTbIlZafTFPnIOA3VgA4iR71--

--------------JH0dgnFeVVEf0z4XJNz0w25f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAra0wUDAAAAAAAKCRC7BTNVkZ0zFHf8
AJ46MGABmlw9Tkk3Sn/T+gaOKg4EUACggrJ6KmGnqQNE3MtCZTdw1h25gio=
=txdH
-----END PGP SIGNATURE-----

--------------JH0dgnFeVVEf0z4XJNz0w25f--

