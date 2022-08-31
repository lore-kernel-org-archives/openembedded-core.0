Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90ECAECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 16:40:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.1216.1661964038129553711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQDMSczG;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 i5-20020a17090a2a0500b001fd8708ffdfso12367281pjd.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc;
        bh=ICRjlht/WrtMR+M5cU5s0L2MOx18gHMZyf+98v3bJ5g=;
        b=LQDMSczGN3YlORNh4i2/yvv+Zu1JQ+UWp0xfCP/Opfmw+7mVDgntvd3VpzmLeQ1nwf
         +QWmlB0FS2YWFc2Ef2ab02i0mCdsjPx6bLRqXa1W7bcNgp0V91b1faHdZp3kCARvh0JC
         PbSUrlMEiqrEt7BkOnuPT+9EzKQi4ICfXT1ER5hVZx17rM3X/XIHILAPL/PiSEzGe4VY
         /mf7SIQhKH4IOtGZW6bQ6sAv0dl6BY8TBE8FA2+6fz1tdbDbcGlWoqIbuXN+3wSzlf72
         cZZB4HN5jDXjieRuNM1k52GZpTkv+rKPvo6Im0TLhbUyj02UhAE74HKb9HL5GjY7Kc7x
         dfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc;
        bh=ICRjlht/WrtMR+M5cU5s0L2MOx18gHMZyf+98v3bJ5g=;
        b=5f0NbMJw2cs+L5sN+/Hm8WGmPx/MgQ4a7Vo9cROZWkP5s7QWvSvNjOTL0gAwjFr0gF
         1IeBEeGYXka0wqTCigROueJsTcZWU5vw/v4WQmfUeFjFLTPVMqVD/J/nV5Y+i/gJJOW9
         PXctcCoPjnnCMabWg+JYVSt1Fu7AX1AxgbnGrw1lYzYZ2oQDOfOV/yaiY8mn2rfgVUzk
         F7k7VFpYaKG3QEt+OgzcToWc+I8VzLAvdZM0ZynU2/0vj4pKzfpVUwi5B5CfsD0fIpQM
         uc89WgUhvDXngA0S+aHhzv1jk+h8X4JNR5XmuaRgghEAqYRROHCMI7JlNoYl/F4H6OSN
         rIbQ==
X-Gm-Message-State: ACgBeo3AS0nPmlkC1flTIJ7+4y/WEKXt/zjDTH72CCQCzaSkYipjEhMF
	5ua0Nlcue5bcjibJd3LnQUY=
X-Google-Smtp-Source: 
 AA6agR6lWuxuFb54C//1QmRbANK+BlUDefUDBQjGhEUOO/mMGjYCv2re+XqAuu1QjJidDDhwS5pR1g==
X-Received: by 2002:a17:90b:3b8d:b0:1fe:30f0:6c37 with SMTP id
 pc13-20020a17090b3b8d00b001fe30f06c37mr3293063pjb.205.1661964037419;
        Wed, 31 Aug 2022 09:40:37 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:1163:751d:bea0:2d81?
 ([2601:646:9200:a0f0:1163:751d:bea0:2d81])
        by smtp.gmail.com with ESMTPSA id
 q96-20020a17090a17e900b001fd6460c2dcsm1494975pja.44.2022.08.31.09.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 09:40:36 -0700 (PDT)
Message-ID: <814b297a-2fac-cc3c-5b98-030152543e3b@gmail.com>
Date: Wed, 31 Aug 2022 09:40:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [OE-core] [PATCH] vim: Upgrade 9.0.0242 -> 9.0.0341
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220831160712.189938-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8T_Cntva5-+YXX7Dzhf2YJNOyPkbbEYWWZAmHUm4g3xA@mail.gmail.com>
 <bf42031e0112176dc1efea54df994161f2e554b3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: 
 <bf42031e0112176dc1efea54df994161f2e554b3.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1RmBavH7Uh0JLAae4fN4UpDF"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 16:40:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170140

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1RmBavH7Uh0JLAae4fN4UpDF
Content-Type: multipart/mixed; boundary="------------VIHdcZcuSxBMpoc29RBI9YBN";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <814b297a-2fac-cc3c-5b98-030152543e3b@gmail.com>
Subject: Re: [OE-core] [PATCH] vim: Upgrade 9.0.0242 -> 9.0.0341
References: <20220831160712.189938-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8T_Cntva5-+YXX7Dzhf2YJNOyPkbbEYWWZAmHUm4g3xA@mail.gmail.com>
 <bf42031e0112176dc1efea54df994161f2e554b3.camel@linuxfoundation.org>
In-Reply-To: <bf42031e0112176dc1efea54df994161f2e554b3.camel@linuxfoundation.org>

--------------VIHdcZcuSxBMpoc29RBI9YBN
Content-Type: multipart/mixed; boundary="------------07xOMqZuuv8n0k2Igu4Z6iGI"

--------------07xOMqZuuv8n0k2Igu4Z6iGI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8zMS8yMiA5OjIxIEFNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gT24gV2VkLCAy
MDIyLTA4LTMxIGF0IDE4OjE3ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4+
IEkgaGF2ZSB0byB3b25kZXIsIHdoYXQgaXMgcmVhbGx5IGdvaW5nIG9uIHRoZXJlPyA6LSkg
VGhpcyBuZXZlciBlbmRpbmcNCj4+IHN0cmVhbSBvZiBDVkVzIG1ha2VzIHZpbSBmb3JtYWxs
eSB0aGUgbW9zdCBpbnNlY3VyZSBpdGVtIGluIGNvcmUuIERvZXMNCj4+IGFueW9uZSBrbm93
Pw0KPiANCj4gUGVyc29uYWxseSBJIHN1c3BlY3Qgc29tZSBraW5kIG9mIGJ1ZyBib3VudHkg
c3lzdGVtIG1heSBiZSBpbmZsdWVuY2luZw0KPiB0aGluZ3MuIEkgaGF2ZSB3b25kZXJlZCBh
Ym91dCByZW1vdmluZyB2aW0gZnJvbSBjb3JlLg0KDQorMSwgZG8gd2UgaGF2ZSBhIG5vbi1i
dXN5Ym94IGVkaXRvciBwZXJoYXBzIG1vdmUgbmFubyBmcm9tIG1ldGEtb2UgaW50byANCmNv
cmUuDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQo+IA0KPiANCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTcwMTM2KTog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVz
c2FnZS8xNzAxMzYNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvbXQvOTMzNzQ0MjAvMTk5NzkxNA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVk
ZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5z
dWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4g
DQo=
--------------07xOMqZuuv8n0k2Igu4Z6iGI
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------07xOMqZuuv8n0k2Igu4Z6iGI--

--------------VIHdcZcuSxBMpoc29RBI9YBN--

--------------1RmBavH7Uh0JLAae4fN4UpDF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCYw+PAwUDAAAAAAAKCRC7BTNVkZ0zFKAk
AKCGVfGxcYil+a6XhAq+JRjZRKj5hwCfdEPXT1+JpKWCrFs6bubMFiQYdTI=
=Zw5b
-----END PGP SIGNATURE-----

--------------1RmBavH7Uh0JLAae4fN4UpDF--

