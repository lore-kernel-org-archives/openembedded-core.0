Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F15EE49A5
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:44:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.46.1692636255903086970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lpVnNsfo;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bdbbede5d4so27398195ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692636255; x=1693241055;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grwreF8phQdvr/XQf/f8nm7dGtccAlFg7XdgS8Zj2bA=;
        b=lpVnNsfo3TGYFt8LAhNhaLrKFh/zHbkBOGLsyuMHKwpXoGvNAEEAfm4Nx9ciIgixbp
         6TJuXSPfvOL6FdiuaHBtCry035QhCHjn0oVABJNLm5r9W7XV0GMozrVn+WSXWFN+wsxE
         Cp3A4eXkSqQIWat4JGeU1mS5n1G3QO01CJNR642xDIHOWDuBemaHrlq930WB9ZiGCe+7
         x0Bxc2xIpouoDs/kp+BtyFtRKRZbWMNyE8kk+7IBzKJaMVic+Zr6TdyqcjdCFlCND3OK
         bVGloAaxXIn9HE2Q1r804hOeA8UQx2JWzfIXc7Pjw0x4lzC6QU2Z36V69M0nF86mYKZp
         SpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692636255; x=1693241055;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=grwreF8phQdvr/XQf/f8nm7dGtccAlFg7XdgS8Zj2bA=;
        b=gJzZeGk8WIA6RwMBvDttbMOU/tSn0x6PvraQrynf2tOSxnYCOa3UhU4AqyCxAiEZ5c
         SAa0Mgi2gWPxNtRMenBckuE6nJyW40s+WYYC86q+7kDnAuWzD5N0lLGbwYzvWvxyx4kg
         HOe0FuC5tf3RgDl/gpn5qaI4+r6qviqfq+B9IKxO+ybeFFTRpS/Ai7I0xyVN+BHVZrxV
         BPmyfT2FEdsGK231aWXFhVUfU/cf4E8IIqnzrIdaezmE60e+U/LBtS5O7z0a28rCz0ew
         vtfF0kDOsNobWbl6nGThemOdsepGvGZFt9Qp8oFY/JLLbum0qtBhCe3iwLEi1L1Nj+Y3
         dkbQ==
X-Gm-Message-State: AOJu0YzCqJppZ+IMMRIKd1BUfDK51tUQvebC8oOgfk3szkePHgs+6IUF
	ukQhYjN8azVKOvwqa9JCdfg=
X-Google-Smtp-Source: AGHT+IFV3gl41bHGd/rqE02g9CFW+mrUTOqnTklEwgJgCD1I1l46DTF1iHqBSR0XFmpPKcsW8BsJxw==
X-Received: by 2002:a17:902:e74f:b0:1b9:ea60:cd82 with SMTP id p15-20020a170902e74f00b001b9ea60cd82mr8559334plf.5.1692636255048;
        Mon, 21 Aug 2023 09:44:15 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:4833:adee:8c28:48fc? ([2601:646:9100:2cb0:4833:adee:8c28:48fc])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902ee4d00b001b8a3e2c241sm7290453plo.14.2023.08.21.09.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 09:44:14 -0700 (PDT)
Message-ID: <257e2521-4ae5-4884-867e-64eae0b607eb@gmail.com>
Date: Mon, 21 Aug 2023 09:44:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] llvm: remove libLTO.so.*
Content-Language: en-US
To: Kai Kang <kai.kang@eng.windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20230821023652.47360-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230821023652.47360-1-kai.kang@windriver.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qKePnsknCkfB3GVMQw01lkTg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186478

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qKePnsknCkfB3GVMQw01lkTg
Content-Type: multipart/mixed; boundary="------------Mz2qNuDoJlyu0enpCAJhmcp5";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Kai Kang <kai.kang@eng.windriver.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <257e2521-4ae5-4884-867e-64eae0b607eb@gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: remove libLTO.so.*
References: <20230821023652.47360-1-kai.kang@windriver.com>
In-Reply-To: <20230821023652.47360-1-kai.kang@windriver.com>

--------------Mz2qNuDoJlyu0enpCAJhmcp5
Content-Type: multipart/mixed; boundary="------------UEg104Bk9mzjDM6OKyZ3TtZ0"

--------------UEg104Bk9mzjDM6OKyZ3TtZ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8yMC8yMyA3OjM2IFBNLCBLYWkgS2FuZyB3cm90ZToNCj4gRnJvbTogS2FpIEthbmcg
PGthaS5rYW5nQHdpbmRyaXZlci5jb20+DQo+IA0KPiBSZW1vdmUgbGliTFRPLnNvLiogZnJv
bSBsbHZtIHdoaWNoIHNob3VsZCBiZSBwcm92aWRlZCBieSBjbGFuZyBhbmQNCj4gcGFja2Fn
ZWQgdG8gbGx2bS1saW5rZXItdG9vbHMuIEl0IGNvdWxkIGF2b2lkcyB0aGUgZXJyb3I6DQo+
IA0KPiBFUlJPUjogY2xhbmctMTYuMC42LXIwIGRvX2NyZWF0ZV9zcGR4OiBUaGUgcmVjaXBl
IGNsYW5nIGlzIHRyeWluZyB0bw0KPiAgICAgICAgIGluc3RhbGwgZmlsZXMgaW50byBhIHNo
YXJlZCBhcmVhIHdoZW4gdGhvc2UgZmlsZXMgYWxyZWFkeSBleGlzdC4NCj4gICAgICAgICBU
aG9zZSBmaWxlcyBhbmQgdGhlaXIgbWFuaWZlc3QgbG9jYXRpb24gYXJlOg0KPiAgICAvcGF0
aF90by90bXAvZGVwbG95L3NwZHgvY29yZTItNjQvcGFja2FnZXMvbGlibHRvMTYuc3BkeC5q
c29uDQo+ICAgICAgKG1hdGNoZWQgaW4gbWFuaWZlc3QtY29yZTItNjQtbGx2bS5jcmVhdGVf
c3BkeCkNCj4gUGxlYXNlIHZlcmlmeSB3aGljaCByZWNpcGUgc2hvdWxkIHByb3ZpZGUgdGhl
IGFib3ZlIGZpbGVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5n
QHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZt
L2xsdm1fZ2l0LmJiIHwgMTIgKysrKysrLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9sbHZtL2xsdm1fZ2l0LmJiDQo+IGluZGV4IGYzZDZmMjRiZDIuLmNlOWViZmE5OTcg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fZ2l0LmJi
DQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fZ2l0LmJiDQo+IEBA
IC0xMDYsNyArMTA2LDcgQEAgZG9fY29tcGlsZSgpIHsNCj4gICANCj4gICBkb19pbnN0YWxs
KCkgew0KPiAgICAgICBpZiAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycs
ICdsaWJsbHZtJywgJ3RydWUnLCAnZmFsc2UnLCBkKX07IHRoZW4NCj4gLQlERVNURElSPSR7
RH0gbmluamEgLXYgaW5zdGFsbA0KPiArICAgICAgICBERVNURElSPSR7RH0gbmluamEgLXYg
aW5zdGFsbA0KPiAgIA0KPiAgICAgICAgICAgIyBsbHZtIGhhcmNvZGVzIHVzci9saWIgYXMg
aW5zdGFsbCBwYXRoLCBzbyB0aGlzIGNvcnJlY3RzIGl0IHRvIGFjdHVhbCBsaWJkaXINCj4g
ICAgICAgICAgIG12IC1UIC1uICR7RH0vJHtwcmVmaXh9L2xpYiAke0R9LyR7bGliZGlyfSB8
fCB0cnVlDQo+IEBAIC0xMTcsNiArMTE3LDEwIEBAIGRvX2luc3RhbGwoKSB7DQo+ICAgDQo+
ICAgICAgICAgICAjIHJlcHJvZHVjaWJpbGl0eQ0KPiAgICAgICAgICAgc2VkIC1pIC1lICdz
LCR7V09SS0RJUn0sLGcnICR7RH0vJHtsaWJkaXJ9L2NtYWtlL2xsdm0vTExWTUNvbmZpZy5j
bWFrZQ0KPiArDQo+ICsgICAgICAgICMgcmVtb3ZlIGxpYkxUTy5zby4qIHdoaWNoIHNob3Vs
ZCBiZSBwcm92aWRlZCBieSBjbGFuZyBhbmQgcGFja2FnZWQgdG8NCj4gKyAgICAgICAgIyBs
bHZtLWxpbmtlci10b29scw0KPiArICAgICAgICBybSAtZiAke0R9LyR7bGliZGlyfS9saWJM
VE8uc28uKg0KDQppcyB0aGF0IHRoZSBvbmx5IHByb2JsZW0gPyBJIHRoaW5rIHRoZXJlIHdp
bGwgYmUgbW9yZSBjb25mbGljdHMgdW5sZXNzIA0Kd2UgbGltaXQgdGhlIHNjb3BlIG9mIGxs
dm0gdG8gcHJvdmlkaW5nIGxpYmxsdm0gYW5kIHdoYXRldmVyIG1lc2EgbmVlZHMNCmF0IG1p
bmltYWwgYW5kIHJlbW92ZSBldmVyeXRoaW5nIGVsc2UuDQoNCmNsYW5nLW5hdGl2ZSBjYW4g
cHJvdmlkZSBsbHZtLW5hdGl2ZSBhbmQgd2hlbiBzb21lb25lIGlzIHVzaW5nIA0KbWV0YS1j
bGFuZywgcGVyaGFwcyBmb2xrcyB1c2luZyBtZXRhLWNsYW5nIGNhbiB1c2UgdGhhdCB0byBw
cm92aWRlIA0KbGx2bS1uYXRpdmUgc2VlIC0gDQpodHRwczovL2dpdGh1Yi5jb20va3Jhai9t
ZXRhLWNsYW5nL2Jsb2IvbWFzdGVyL1JFQURNRS5tZCNwcm92aWRpbmctbGx2bQ0KDQoNCg0K
PiAgICAgICBmaQ0KPiAgIH0NCj4gICANCj4gQEAgLTEzNCw3ICsxMzgsNyBAQCBsbHZtX3N5
c3Jvb3RfcHJlcHJvY2VzcygpIHsNCj4gICAJbG4gLXNmIGxsdm0tY29uZmlnICR7U1lTUk9P
VF9ERVNURElSfSR7YmluZGlyX2Nyb3Nzc2NyaXB0c30vbGx2bS1jb25maWcke1BWfQ0KPiAg
IH0NCj4gICANCj4gLVBBQ0tBR0VTID0rICIke1BOfS1idWdwb2ludHBhc3NlcyAke1BOfS1s
bHZtaGVsbG8gJHtQTn0tbGlibGx2bSAke1BOfS1saWJvcHRyZW1hcmtzICR7UE59LWxpYmx0
byINCj4gK1BBQ0tBR0VTID0rICIke1BOfS1idWdwb2ludHBhc3NlcyAke1BOfS1sbHZtaGVs
bG8gJHtQTn0tbGlibGx2bSAke1BOfS1saWJvcHRyZW1hcmtzIg0KPiAgIA0KPiAgIFJSRUNP
TU1FTkRTOiR7UE59LWRldiArPSAiJHtQTn0tYnVncG9pbnRwYXNzZXMgJHtQTn0tbGx2bWhl
bGxvICR7UE59LWxpYm9wdHJlbWFya3MiDQo+ICAgDQo+IEBAIC0xNDYsMTAgKzE1MCw2IEBA
IEZJTEVTOiR7UE59LWxpYmxsdm0gPSAiXA0KPiAgICAgICAke2xpYmRpcn0vbGliTExWTS0k
e01BSk9SX1ZFUlNJT059LnNvIFwNCj4gICAiDQo+ICAgDQo+IC1GSUxFUzoke1BOfS1saWJs
dG8gKz0gIlwNCj4gLSAgICAke2xpYmRpcn0vbGliTFRPLnNvLiogXA0KPiAtIg0KPiAtDQo+
ICAgRklMRVM6JHtQTn0tbGlib3B0cmVtYXJrcyArPSAiXA0KPiAgICAgICAke2xpYmRpcn0v
bGliUmVtYXJrcy5zby4qIFwNCj4gICAiDQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0
aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE4NjQxOSk6IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTg2NDE5
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210
LzEwMDg2NjQ4Ni8xOTk3OTE0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStv
d25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmFqLmto
ZW1AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==
--------------UEg104Bk9mzjDM6OKyZ3TtZ0
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------UEg104Bk9mzjDM6OKyZ3TtZ0--

--------------Mz2qNuDoJlyu0enpCAJhmcp5--

--------------qKePnsknCkfB3GVMQw01lkTg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZOOUXQUDAAAAAAAKCRC7BTNVkZ0zFFIb
AJ9ok7LgvjcioVNGQ/29i97VvGsx2ACbBVFK5Pjdk43x4+oRnX2dhUkG4jE=
=JYis
-----END PGP SIGNATURE-----

--------------qKePnsknCkfB3GVMQw01lkTg--

