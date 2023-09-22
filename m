Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA21BE6FE52
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 15:25:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.409.1695396335171889683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 08:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FrzHWBUE;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c43166b7e5so19819875ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695396334; x=1696001134; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aUn8HQ+HILkpeF5YVzOcuUYLnT20MuVWZ9NUvfV4NYQ=;
        b=FrzHWBUEVer6FeD3/UwQX3srbNMQqMdcrrbXdEGgxZuCXwvHoXs22taYyQqeKdoznV
         jJAaWGXKqf/YcILKptKpuUT805M/ARZrNhGakNf8oIDdCDe7xoYJtw2A2ophonZWGZJM
         qR6WpunTcfVr2dgkY36VIwAceEGg3zJFlLHTEB6nUT20Qv8C4KU6S8BnSFnON1W2Tvq7
         9hvwNJkRbxoC3lFNbxgUXTSBqM3+ahaTO2hcjk59d5WcBGRBOSW1oUfaZ9FwF0ihfoxF
         7MZWin4eMvhQYBRHbaJdQ+GGta7da75n1pFVKtafj5AgksH3fc5MPqT7sQUopRNUD2y3
         d9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695396334; x=1696001134;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUn8HQ+HILkpeF5YVzOcuUYLnT20MuVWZ9NUvfV4NYQ=;
        b=jY4P3/zhRAwsc7j6EoLTEuJQ8okqB6R8S0a6RUR6qjPfa0B1RkfrpAFUBQMk4UtvbB
         nXTM8mneiY4Ce8OlHGSxhdynIvIJnkvofeLmsy6qY4TnmjYugkPzCA8ARmUVq/ZdAiHE
         7xTGXoAtjkeU9TyazCOVYn9HcNeTnElJNjjl5VupahMWKI2jc0fQAayGdmdQMtdGoItf
         BZj9lojSjDq+UEZFbkPVD1MPFj51eO+gkjVm73wH8xbFDBOvZfKZmEDkcbGj+KFaWkf6
         ljt5eA230WRLcyPKLSU81QheGzpH4HILfJw7PNFL7/JptYepA4cWUBZX4Or3H/mYsOIj
         b1wQ==
X-Gm-Message-State: AOJu0Yxa/P1cLEmKrkXFFYfQdb4ElfGev3yXWOmov8nwiGSRM11Rz8LZ
	fJXMouQlHaQX1oLkuFFiwbotCCfze5XD7A==
X-Google-Smtp-Source: AGHT+IEbDk/RiNSMYxer1GptuzE5YTmTFHkapg8FjUfgTWC4xiD/ZTJL4JjTS/43pZXYjqtllRtgaA==
X-Received: by 2002:a17:902:82c4:b0:1c4:20af:a01f with SMTP id u4-20020a17090282c400b001c420afa01fmr7879477plz.22.1695396334517;
        Fri, 22 Sep 2023 08:25:34 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:68a7:e86e:d0e8:e1f2? ([2601:646:9100:2cb0:68a7:e86e:d0e8:e1f2])
        by smtp.gmail.com with ESMTPSA id jk23-20020a170903331700b001bb04755212sm3608573plb.228.2023.09.22.08.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 08:25:33 -0700 (PDT)
Message-ID: <9aed83ae-02f9-4c15-899e-1cc24fae9e4e@gmail.com>
Date: Fri, 22 Sep 2023 08:25:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] musl: Drop MIRRORS
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20230922011520.23704-1-raj.khem@gmail.com>
 <2d66ceecc50d6a5041963c1afa9d55858c0e9bfa.camel@linuxfoundation.org>
 <CAMKF1soqXrRMfeFt6Gk-w9GfFN3CjjFW87qOeBi0F5Bx3kuvJw@mail.gmail.com>
 <b735592296f29ef9f60dc9a7249d1c180a035a32.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <b735592296f29ef9f60dc9a7249d1c180a035a32.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a7fS5XilTcri1If0Et109k05"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 15:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188124

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a7fS5XilTcri1If0Et109k05
Content-Type: multipart/mixed; boundary="------------h7DteB83LCISz9rIfywLrbfO";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <9aed83ae-02f9-4c15-899e-1cc24fae9e4e@gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Drop MIRRORS
References: <20230922011520.23704-1-raj.khem@gmail.com>
 <2d66ceecc50d6a5041963c1afa9d55858c0e9bfa.camel@linuxfoundation.org>
 <CAMKF1soqXrRMfeFt6Gk-w9GfFN3CjjFW87qOeBi0F5Bx3kuvJw@mail.gmail.com>
 <b735592296f29ef9f60dc9a7249d1c180a035a32.camel@linuxfoundation.org>
In-Reply-To: <b735592296f29ef9f60dc9a7249d1c180a035a32.camel@linuxfoundation.org>

--------------h7DteB83LCISz9rIfywLrbfO
Content-Type: multipart/mixed; boundary="------------T0XjmJbLXMqcOpoKb9ymp3FA"

--------------T0XjmJbLXMqcOpoKb9ymp3FA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8yMi8yMyA4OjE2IEFNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gT24gRnJpLCAy
MDIzLTA5LTIyIGF0IDA4OjEwIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4+IE9uIEZyaSwg
U2VwIDIyLCAyMDIzIGF0IDM6MTHigK9BTSBSaWNoYXJkIFB1cmRpZQ0KPj4gPHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPj4+DQo+Pj4gT24gVGh1LCAy
MDIzLTA5LTIxIGF0IDE4OjE1IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4+Pj4gV2hlbiB1
c2luZyBtaXJyb3JzIGZldGNoZXIgZ2V0cyBpbnRvIGEgd2VpcmQgc3RhdGUgd2hlbiBzaGFs
bG93IGNsb25lcw0KPj4+PiBhcmUgZW5hYmxlcy4NCj4+Pj4NCj4+Pj4gRVJST1I6IEJpdGJh
a2UgRmV0Y2hlciBFcnJvcjogVW5wYWNrRXJyb3IoJ05vIHVwIHRvIGRhdGUgc291cmNlDQo+
Pj4+IGZvdW5kOiBjbG9uZSBkaXJlY3Rvcnkgbm90IGF2YWlsYWJsZSBvciBub3QgdXAgdG8g
ZGF0ZToNCj4+Pj4gL21udC9iL3lvZS9tYXN0ZXIvZG93bmxvYWRzL2dpdDIvZ2l0Lm11c2wt
bGliYy5vcmcuZ2l0Lm11c2wuZ2l0Ow0KPj4+PiBzaGFsbG93IGNsb25lIG5vdCBhdmFpbGFi
bGU6DQo+Pj4+IC9tbnQvYi95b2UvbWFzdGVyL2Rvd25sb2Fkcy9naXRzaGFsbG93X2dpdC5t
dXNsLQ0KPj4+PiBsaWJjLm9yZy5naXQubXVzbC5naXRfNzliZGFjZi0xX21hc3Rlci50YXIu
Z3onLCAnZ2l0Oi8vZ2l0Lm11c2wtDQo+Pj4+IGxpYmMub3JnL2dpdC9tdXNsLmdpdDticmFu
Y2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzJykNCj4+Pg0KPj4+IFRoYXQgc291bmRzIGxpa2Ug
c29tZXRoaW5nIHdlIHNob3VsZCBsb29rIGludG8gYW5kIGZpeD8NCj4+Pg0KPj4+IEkgZG9u
J3QgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgYXMgYSBqdXN0aWZpY2F0aW9uIGluIGEgY29tbWl0
IG1lc3NhZ2UuDQo+Pg0KPj4gSSB0cmllZCB0byBkbyBpdCBpbiBzZXZlcmFsIHdheXMgYW5k
IHNvbWVob3cgZmV0Y2ggaXMgZmFpbGluZy4gT25seQ0KPj4gd2F5IEkgc2VlIGl0IHdvcmsg
b25jZSB3YXMgd2hlbiByZW1vdmluZyB0aGUgbWlycm9ycyBhbmQgcmVidWlsZGluZw0KPj4g
YWZ0ZXIgLWNjbGVhbmFsbA0KPj4gc2VlIC0gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy82NC9idWlsZHMvNzgzNg0KPj4NCj4+IGlm
IEkgZ2l0IGZldGNoIHRoZXNlIHJlcG9zIGZyb20gYW55IG9mIG1pcnJvcnMgb3IgdXBzdHJl
YW0gY2xvbmVzIHdvcmsNCj4+IHRvdGFsbHkgZmluZSBidXQgZ2l0IGZldGNoZXIgYWx3YXlz
IGNvbXBsYWlucy4gTm8gaWRlYSB3aGF0cyBnb2luZyBvbg0KPj4NCj4gDQo+IFBsZWFzZSB0
ZWxsIG1lIHlvdSdyZSBub3QgcnVubmluZyAtYyBjbGVhbmFsbCBvbiB0aGUgYXV0b2J1aWxk
ZXINCj4gaW5mcmFzdHJ1Y3R1cmU/DQoNCm9mY291cnNlIG5vdC4NCg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0K
--------------T0XjmJbLXMqcOpoKb9ymp3FA
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------T0XjmJbLXMqcOpoKb9ymp3FA--

--------------h7DteB83LCISz9rIfywLrbfO--

--------------a7fS5XilTcri1If0Et109k05
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZQ2x7QUDAAAAAAAKCRC7BTNVkZ0zFAWt
AKCCaoNxSEhsNdhlmWHujSbHzBvsWgCfVP29q0y+/XAZS4iQZiNI3N1mReE=
=C/0K
-----END PGP SIGNATURE-----

--------------a7fS5XilTcri1If0Et109k05--

