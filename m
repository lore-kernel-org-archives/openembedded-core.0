Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254D8C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 20:41:51 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.461.1667335302321621809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 13:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hd0m0xzM;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so131996pji.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yyRWPSEV9a9/ITL7EGLHXNEwCRukowkDlO8dYZcCFjc=;
        b=Hd0m0xzMQtQE70jG1c4TtVOXfV/C/ogcuNVB4MciofW/1O9qCfDOqSan7yalsOKayf
         naqmH82ehoeh/mbzWG7i8//1i53ABixSpMLaSwlTXowzh5cX10zdzZX2Ra3sJJMg5Psj
         wEaLb4mBdbnBGpP6ytAkdHmUvQ8CqEJOlLEsxlHI0nYmcCUdQFFznH2Ykax/zXUSoz3S
         odu+JRt3hV6xdVi5GxZosiD+kgnOp+dvYpu+rcP+YaxlwWqVB5asfYxCZ6RQVELfPltq
         XJZhFRD3MeTQMjtPp1CmxfkY06iHLQ+rUssAK0c+PRx9FG0PH8ibI2Ju4W2QV8oNAEYP
         bzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyRWPSEV9a9/ITL7EGLHXNEwCRukowkDlO8dYZcCFjc=;
        b=8KvDrBZG+Pt+gR4JK6PGmGkCqKgz9fxQIO5II58xD+eqQeYLujNtl3qLjhQ6XgJwhj
         gOHntwb16cm8mP3NSI+Km2PDrUAXB58Od6qngoNBJV103UbJTcveTvOKGeYeEMDiG/fv
         zidVhyx4/t9Cl0bQokk2ISq0an8KcU0fuL1JaCbLG2b7je4WB5NfP2m0t0LHsH6ZON/s
         FkKsVBOpd14f9Z85Yxhtjd0jthjMHxnnBdX90tWXUaUnngnEvv+v72B40+iMnrqlmy6T
         1TsfVryIym+wWZDBjWkWLNN1o02y7LzybbZg9rLG+bjSfx9fDsmbDErgRvplknMqvBuX
         91XA==
X-Gm-Message-State: ACrzQf3RFK1D1FLwagjjg0lSx9dpjCSJPJlnnVuOfdki86B9NG353Pv+
	7y48wu+NsEIKaK8GZXya3M0=
X-Google-Smtp-Source: AMsMyM7xBhbmete38N4b6Tx+yiQPyRva2CcCXH8ViUJAqDmYVuhV07VOdswvX3z5YZZ91y6BbQCfgQ==
X-Received: by 2002:a17:90a:664e:b0:213:ff:1cda with SMTP id f14-20020a17090a664e00b0021300ff1cdamr181369pjm.86.1667335301273;
        Tue, 01 Nov 2022 13:41:41 -0700 (PDT)
Received: from ?IPV6:2601:646:9181:1cf0:5578:475c:27e4:6168? ([2601:646:9181:1cf0:5578:475c:27e4:6168])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902c40d00b00174c1855cd9sm6813089plk.267.2022.11.01.13.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 13:41:40 -0700 (PDT)
Message-ID: <1a13e680-26ec-d87f-95c3-7be37ff316ca@gmail.com>
Date: Tue, 1 Nov 2022 13:41:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [OE-core] [PATCH v2] bluez5: Point hciattach bcm43xx firmware
 search path to /lib/firmware
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20221101115445.18282-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20221101115445.18282-1-marex@denx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1d0SRFqagbvFF0vQCzcHs3eu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172387

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1d0SRFqagbvFF0vQCzcHs3eu
Content-Type: multipart/mixed; boundary="------------a1hsuTtRvQXuovGtFAIrI3DJ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <1a13e680-26ec-d87f-95c3-7be37ff316ca@gmail.com>
Subject: Re: [OE-core] [PATCH v2] bluez5: Point hciattach bcm43xx firmware
 search path to /lib/firmware
References: <20221101115445.18282-1-marex@denx.de>
In-Reply-To: <20221101115445.18282-1-marex@denx.de>

--------------a1hsuTtRvQXuovGtFAIrI3DJ
Content-Type: multipart/mixed; boundary="------------e8LP0s4d2f2Zg7rDUx6ZE4nW"

--------------e8LP0s4d2f2Zg7rDUx6ZE4nW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMS8yMiA0OjU0IEFNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gQ3VycmVudGx5IHRo
ZSBoY2lhdHRhY2ggYmNtNDN4eCBmaXJtd2FyZSBsb2FkZXIgbG9va3MgdXAgdGhlIGZpcm13
YXJlDQo+IGJsb2IgaW4gL2V0Yy9maXJtd2FyZSAuIENoYW5nZSB0aGlzIHRvIC9saWIvZmly
bXdhcmUgaW5zdGVhZCwgc28gdGhhdA0KPiB0aGUgcGF0aCBpcyBjb25zaXN0ZW50IHdpdGgg
TGludXgga2VybmVsIHdoaWNoIGFsc28gbG9va3MgdXAgZmlybXdhcmUNCj4gZm9yIHRoZSBX
aUZpIHBhcnQgaW4gL2xpYi9maXJtd2FyZSAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJl
ayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gLS0tDQo+IENjOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhh
bmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPiBDYzogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IC0tLQ0KPiBWMjogUmVwbGFjZSBo
YXJkLWNvZGVkIC9saWIgd2l0aCAke25vbmFyY2hfYmFzZV9saWJkaXJ9DQo+IC0tLQ0KPiAg
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMgfCAyICsrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUuaW5jDQo+IGluZGV4IGYwN2UzMTg4
OTcuLmEyYWE3Yjg2YzQgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmx1ZXo1L2JsdWV6NS5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9ibHVlejUvYmx1ZXo1LmluYw0KPiBAQCAtNjgsNiArNjgsOCBAQCBFWFRSQV9PRUNPTkYg
PSAiXA0KPiAgICAgLS13aXRob3V0LXpzaC1jb21wbGV0aW9uLWRpciBcDQo+ICAgIg0KPiAg
IA0KPiArQ0ZMQUdTOmFwcGVuZCA9ICIgLURGSVJNV0FSRV9ESVI9XFwiJHtub25hcmNoX2Jh
c2VfbGliZGlyfS9maXJtd2FyZVxcIiINCg0Kd2h5IGRvIHdlIHVzZSBhcHBlbmQgYW5kIG5v
dCArPSBoZXJlID8NCg0KPiArDQo+ICAgIyBibHVlejUgYnVpbGRzIGEgbGFyZ2UgbnVtYmVy
IG9mIHVzZWZ1bCB1dGlsaXRpZXMgYnV0IGRvZXMgbm90DQo+ICAgIyBpbnN0YWxsIHRoZW0u
ICBTcGVjaWZ5IHdoaWNoIG9uZXMgd2Ugd2FudCBwdXQgaW50byAke1BOfS1ub2luc3QtdG9v
bHMuDQo+ICAgTk9JTlNUX1RPT0xTX1JFQURMSU5FID8/PSAiIg0KPiANCj4gDQo+IA0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3Nh
Z2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNzIzNTkp
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9t
ZXNzYWdlLzE3MjM1OQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9tdC85NDcwNzA2NC8xOTk3OTE0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJl
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91
bnN1YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PiANCg==
--------------e8LP0s4d2f2Zg7rDUx6ZE4nW
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------e8LP0s4d2f2Zg7rDUx6ZE4nW--

--------------a1hsuTtRvQXuovGtFAIrI3DJ--

--------------1d0SRFqagbvFF0vQCzcHs3eu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCY2GEgwUDAAAAAAAKCRC7BTNVkZ0zFI+8
AJ9r5mkrgtUWZP7PVXgm2q2Wl8gXPgCeIDY5LLruUTFMS5WpIoAm2o+ah84=
=L6Y6
-----END PGP SIGNATURE-----

--------------1d0SRFqagbvFF0vQCzcHs3eu--

