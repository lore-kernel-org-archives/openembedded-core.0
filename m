Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624DAC54EE9
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:25:39 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.1995.1663727132783471371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YFtQ++Co;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id v15so3464424qvi.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=hbEB2n4hiZLrsBOSsuXUFR3bvw4BXGI5zOD0DdEe2iU=;
        b=YFtQ++CoJB/2aqyEBj+4PBFJXh/pmHnMZOWpSeKZySaxCQj2Nc41pkjR8gNS7dq9N2
         8sjgsCF3MV2dQ8yURDU4H3bi2Q//aNi9EPws1+zVOTzsKS8YkXNqbSvt7x/cGFdViw3x
         6w+o9e2Wt1X2mrlEHEbRR4r79k7dyU3v/rXtB/g/TAdHutm3tT3/86HfklLibG7ntuh+
         HurVubenZyLFKhboJ574cvzOzpYD6C4PogazSjr4irbRKIaQfJsG2vONS9PedYpH+wBA
         EK7FAwBjP4WYG0BHv4WBm2nxf57Fo3voYAVSrGniW0I4+pdsPFGpJtpA5wcu7lNtcXiL
         7l+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=hbEB2n4hiZLrsBOSsuXUFR3bvw4BXGI5zOD0DdEe2iU=;
        b=8PIPTfgzdcFNS+nD3Va1rC3BadvaiRx+AhAyGAt9Jh4aSRu+e4STI4aez1nUdxLiSM
         aGRZ1lxkA6dVT1uyuCclFr9FwRssU7QJiughDseUWqspdG6V7FTl1HCiMwRk+2PVKn68
         B2wZUMqzK/y0RuTWPuz3eX+O7bWR51r8RN2cEjBOh/9ADCMWrg6wtRbwm8o8kHexrvW8
         fAwhwRnH/pv7Y2dqs8XuDBJmwQYh1e67QP+07QrUGMYnFVL0ex1YW0qSg+siJK59orLA
         /rbcfZKSJvo7G5psQPI8q9+MGLbabfL3rYxuGHUXa6YOjd8ItwwFNPu7oeb/9o0+uY3m
         YThw==
X-Gm-Message-State: ACrzQf2RolqCBNdWzLCwXMa4N1Dm1fswaLs2mnLke0/EhbNsYWjl8vIV
	xzXCUQoBgOU4KqloO5kAyHdVe7P60B9SWw==
X-Google-Smtp-Source: 
 AMsMyM4NbS3a9KaN3Sx0/l5m1sE7YRIr2VOjasraOOBYwur82WOSrDIirZlJBbP8aco1O3RItz0K4w==
X-Received: by 2002:ad4:5f0f:0:b0:4ac:b4f8:895e with SMTP id
 fo15-20020ad45f0f000000b004acb4f8895emr21370215qvb.75.1663727131620;
        Tue, 20 Sep 2022 19:25:31 -0700 (PDT)
Received: from [172.20.4.65] ([192.210.27.131])
        by smtp.gmail.com with ESMTPSA id
 o13-20020a05620a2a0d00b006baef6daa45sm1017207qkp.119.2022.09.20.19.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 19:25:31 -0700 (PDT)
Message-ID: <8fb9e2b8-fac4-02f6-22b0-797986b178e4@gmail.com>
Date: Tue, 20 Sep 2022 22:25:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH] gcompat: Add __getauxval wrapper needed on
 aarch64
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220917211339.2536726-1-raj.khem@gmail.com>
 <66d8e5eed72d41461ea5ca8367480404f26f182b.camel@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: 
 <66d8e5eed72d41461ea5ca8367480404f26f182b.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Db9l800GailVuiynyANADUBC"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 02:25:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170918

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Db9l800GailVuiynyANADUBC
Content-Type: multipart/mixed; boundary="------------9Ubzw05aSldOie2II0mjJ5OI";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <8fb9e2b8-fac4-02f6-22b0-797986b178e4@gmail.com>
Subject: Re: [OE-core] [PATCH] gcompat: Add __getauxval wrapper needed on
 aarch64
References: <20220917211339.2536726-1-raj.khem@gmail.com>
 <66d8e5eed72d41461ea5ca8367480404f26f182b.camel@linuxfoundation.org>
In-Reply-To: <66d8e5eed72d41461ea5ca8367480404f26f182b.camel@linuxfoundation.org>

--------------9Ubzw05aSldOie2II0mjJ5OI
Content-Type: multipart/mixed; boundary="------------72053L33HfUj3PUD5071GsxS"

--------------72053L33HfUj3PUD5071GsxS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8yMC8yMiA1OjM5IEFNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gT24gU2F0LCAy
MDIyLTA5LTE3IGF0IDE0OjEzIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4+IFVwZGF0ZSBT
UkNSRVYgdG8gYnJpbmcgaW4gZmV3IGJ1ZyBmaXhlcw0KPj4gSW5zdGFsbCBhIC5zbyBzeW1s
aW5rIHdoaWNoIGNvdWxkIGJlIHVzZWQgZHVyaW5nIGxpbmtpbmcNCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPj4gLS0tDQo+PiAgIC4u
Li9tdXNsL2djb21wYXQvMDAwMS1hdXh2LW5ldy1tb2R1bGUucGF0Y2ggICB8IDU5ICsrKysr
KysrKysrKysrKysrKysNCj4+ICAgbWV0YS9yZWNpcGVzLWNvcmUvbXVzbC9nY29tcGF0X2dp
dC5iYiAgICAgICAgIHwgIDYgKy0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWNvcmUvbXVzbC9nY29tcGF0LzAwMDEtYXV4di1uZXctbW9kdWxlLnBhdGNoDQo+
IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1
aWxkZXJzLzY0L2J1aWxkcy81ODczDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9q
ZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNDUvYnVpbGRzLzU4OTANCj4gDQoNClllYWgg
bXkgYmFkLCBZb2UgZGlzdHJvIHVzZXMgdXNybWVyZ2UgZmVhdHVyZSwgYW5kIEkgZm9yZ290
IHRoZSBtYWluIA0KbGlicmFyeSBpcyBpbnN0YWxsZWQgaW4gYmFzZV9saWJkaXIgYW5kIG5v
dCBsaWJkaXIsIHNlbnQgYSB2MiB3aXRoIHRoaXMgDQpjaGFuZ2VkDQoNCj4gQ2hlZXJzLA0K
PiANCj4gUmljaGFyZA0K
--------------72053L33HfUj3PUD5071GsxS
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------72053L33HfUj3PUD5071GsxS--

--------------9Ubzw05aSldOie2II0mjJ5OI--

--------------Db9l800GailVuiynyANADUBC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCYyp2GQUDAAAAAAAKCRC7BTNVkZ0zFBVV
AKCQjjMI4/mR5YXFxbJDgVWM/rSfcQCgigPeHTE0a21Yem3aEJbDaACF/bw=
=97E/
-----END PGP SIGNATURE-----

--------------Db9l800GailVuiynyANADUBC--

