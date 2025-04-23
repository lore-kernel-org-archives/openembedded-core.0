Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB5AC369C2
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 00:38:16 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.2018.1745368689604861250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 17:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k8iVsRLE;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-400fa6b3012so248022b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 17:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745368689; x=1745973489; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4/Aw59f7JeI6ibfvMhFf864tWPcVr7G+zR4Ocj74X70=;
        b=k8iVsRLExUNgMQCBaxXEe/R/MyoM4aMjgyuhN63+gHjktAGvzS9wQAFeDD52755f19
         QebNyh1n0RvqA0FNFOGD7q/rx5Ieg0Z+poFflQeykW8/PX3J204pS+eiLgou2bO2WyXD
         Ql1ErkawRgPgDOrYnvvc6EQz4k4CZGFP9hXihm1zUnptGGEZKUylfBQ20SycrGSNEVUR
         bWEVYVaPFRNkkrGTU8e9P7NtgXeaNCAruiM1gX+/MeROtVEfAmPM93R3C6zcplT32bDz
         eKG4nwoNCJC8dCbpIowCAoMYO7O3G3u3TJYQKYRwcrSwQjW0Cj071AwroM5QQ+eRUARL
         GTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745368689; x=1745973489;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/Aw59f7JeI6ibfvMhFf864tWPcVr7G+zR4Ocj74X70=;
        b=JjtT2G9B9GyQOboKqFtKG/T/6/PnWskvA5yyLTk1dxkJFI4hofg1tngW7xAuM06mk5
         6h+m1PHY+PjfF/6ZE8Ox0z6rl/pResF/f0q6yZLaBDls9K6wFIoyhIm6Bo+cpHF9Rksl
         6/GYAYc9bdZa2zSpiTcaFbcEY1vpj0NE41vWJHSGrle4Es36wLsh6bVhB8dHgs1KKYYD
         vwysb4lkQwsH4PlRX/sx2g0qLFdQcNwvv/ovPt0jGDWHDYifutNKddIYeaIoj0DBjRbU
         9WJ8Z8ARIrBpxBuLFpQmC/ynAFJPQdIqXrinFKHMTrBmNKbwlXzwe8AEwAMkbaM/0TJI
         KRow==
X-Gm-Message-State: AOJu0Ywde/xWmbLgltpxDVL4OzzXcFnn0y3+BHUiYxDlR/CX4Ye8gDXB
	p0RCQ7v8bfb55+PTefdpLKiVP8DsfmSrW8bOomqM7H1GaSHgLuW4
X-Gm-Gg: ASbGncuPR9WBuCXTujv6TPoupNJbwzyOM393z8ZVcxMjLqSA0M8hb9JaO3gHqRsJUOX
	grr66p+Ja2qX7M0Ef4dae+3q8zpDnDKCzlfyjDdRKWLG5epIyph0fVV49KP7uBoaFj6Izcij3Yo
	IViVSqY/uhqH0H6xo5naPtf39ial9kY9P0Ri7UI5DbSzc9/DWAr5VDdfIgGxs2nY43iYYR3DJ3M
	GYU4b8Qq0m8isAMioPErzvmgI3ux++G1JPxkxzDkD14u8P7SSLIAlnnczCpassHDBqtxobMgP6K
	uORFTrkI7Df8xY85HELltPAVg0NHYG5tPJm03Gd6Yu/1O2fdNi5uaDoVR32G9Sgwq3NBqlq4FMR
	UYWoGhghdV/uLCvqcGvfWgX6h+VTSjq9Ytw==
X-Google-Smtp-Source: AGHT+IHFk3aZno396exn+l/pL7Wabf8xXzCwLSqk8jGefAhlQr+tPK5aoPcDIGGl6cAPhcZO8R0Gag==
X-Received: by 2002:a05:6808:840a:b0:3f8:18a3:b1cc with SMTP id 5614622812f47-401e40af620mr474869b6e.12.1745368688861;
        Tue, 22 Apr 2025 17:38:08 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f90a:1834:bcca:2d8b? ([2601:646:8201:fd20:f90a:1834:bcca:2d8b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401becc2294sm2381875b6e.0.2025.04.22.17.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 17:38:08 -0700 (PDT)
Message-ID: <6e9c953f-2c57-4941-a2af-2b294e6943ed@gmail.com>
Date: Tue, 22 Apr 2025 17:38:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Proposal: skip debug builds of native packages
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
 <CANNYZj_nbOyz__f2_ruKziyOngMXCw2ibMR3D8ETMS1b_3DOYQ@mail.gmail.com>
 <c573e12e-f8fd-465a-aec5-01f5360c1841@gmail.com>
 <CANNYZj-pPc7iFL8y31aiffm8TjLPXy5iZ54fQSy8wuKD+WzHwA@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CANNYZj-pPc7iFL8y31aiffm8TjLPXy5iZ54fQSy8wuKD+WzHwA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vTSp0A2mHlfT3C6b6E04Fs9a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 00:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215254

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vTSp0A2mHlfT3C6b6E04Fs9a
Content-Type: multipart/mixed; boundary="------------paA25SUzxvDWatVFk9Wz1CGn";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <6e9c953f-2c57-4941-a2af-2b294e6943ed@gmail.com>
Subject: Re: [OE-core] Proposal: skip debug builds of native packages
References: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
 <CANNYZj_nbOyz__f2_ruKziyOngMXCw2ibMR3D8ETMS1b_3DOYQ@mail.gmail.com>
 <c573e12e-f8fd-465a-aec5-01f5360c1841@gmail.com>
 <CANNYZj-pPc7iFL8y31aiffm8TjLPXy5iZ54fQSy8wuKD+WzHwA@mail.gmail.com>
In-Reply-To: <CANNYZj-pPc7iFL8y31aiffm8TjLPXy5iZ54fQSy8wuKD+WzHwA@mail.gmail.com>

--------------paA25SUzxvDWatVFk9Wz1CGn
Content-Type: multipart/mixed; boundary="------------Q00tOdHs59EZvCDQuDaeC8ps"

--------------Q00tOdHs59EZvCDQuDaeC8ps
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMi8yNSA0OjMyIFBNLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gT24gV2Vk
LCAyMyBBcHIgMjAyNSBhdCAwMDo0NCwgS2hlbSBSYWogdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPHJhai5raGVtPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4+IFNvIGhhdmluZyBhbiBvcHRpb24gdG8gdHVybiBERUJVR19CVUlMRCBwcm9w
YWdhdGlvbiB0byBub24tdGFyZ2V0DQo+PiBwYWNrYWdlcyBjYW4gaW4gZmFjdCBoZWxwIHRo
ZSBtYWpvcml0eSBvZiB1c2UtY2FzZXMgd2hlcmUgT0UgaXMgdXNlZC4NCj4gDQo+IEFzIFBl
dGVyIHNhaWQsIHRoZXJlJ3MNCj4gREVCVUdfQlVJTEQ6Y2xhc3MtdGFyZ2V0ID0gIjEiDQo+
IA0KPiBXZSBzaG91bGQgcGVyaGFwcyBiZXR0ZXIgZG9jdW1lbnQgdGhpcywgYnV0IEkgZG9u
J3QgdGhpbmsgdGhlcmUgc2hvdWxkDQo+IGJlIHNwZWNpYWwtY2FzZSBoaWRkZW4gbWFnaWMg
b3RoZXJ3aXNlLg0KDQpUaGF0IHdpbGwgaW1wcm92ZSB0aGluZ3MgZm9yIHN1cmUNCg0KPiAN
Cj4gQWxleA0K
--------------Q00tOdHs59EZvCDQuDaeC8ps
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------Q00tOdHs59EZvCDQuDaeC8ps--

--------------paA25SUzxvDWatVFk9Wz1CGn--

--------------vTSp0A2mHlfT3C6b6E04Fs9a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAg2bwUDAAAAAAAKCRC7BTNVkZ0zFLSq
AJ9AHOx4gN5d0nSrDY1nNliG3zuOMQCfcZUv6OSKfhSd4we8I9ciT/8ngIc=
=M9qs
-----END PGP SIGNATURE-----

--------------vTSp0A2mHlfT3C6b6E04Fs9a--

