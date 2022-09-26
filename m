Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324BFC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 15:58:59 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.30443.1664207930009991084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 08:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPOFrjcz;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c198so7098374pfc.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date;
        bh=MapLU8/jhPzPsoxCQhAdtCCyRXPPsKccMRoRFANlHBI=;
        b=hPOFrjczNawerEo3CgYQqPTmxfVHJf1vlVvCrKMN0NHXyeMiXd+UkjYSUwncgiqH6u
         RNrWevE8OvrM30pwxvl4rTufGh7V0r99YCVIjr7o364VCpZ95oHEa8kpyx+djOV3Bw4t
         vVPU68nv2zIQpJq9snHIX+1UkJo/eFOTIyUs+c+TRBGWotb1a+2v2kOH8Sp7sH4hP4pk
         OKG4wfzZ9XFlOtS6uOd/55bbScT++su91SgDReJ05bYlUWgS3zHGEh2Cn0IGyYYq/6sF
         N52KAV/1DjDG898gSF//5zHXybbCAKX8e9JIoHK3PPUYkCW0Rw5+C27OPqViLqyBbgQ6
         QzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=MapLU8/jhPzPsoxCQhAdtCCyRXPPsKccMRoRFANlHBI=;
        b=0peyzfOmDzQbG8DwLfEVwFm8vIz9ZpCXVMp9aWAunPvtHzv8NRtwUG1UOXsZqZlY25
         p73EtWuKDxCOzU0saXLhVzGLKcm1zs6BnmluvpoPpJ2wbWwAPDAPPKnoEqPfQDsIiU8G
         Lw6Q6h6j7WUYCCvOffPTU54va+QyI3MSEdkncRUriZUBgdn6qt8bdle5JXCxRIy1LGvx
         XMxZjxgBRxVmG7iQZaA/DNNzAuBOs0tjv2324dR/cdLt75mLZy5JcoqeT4ON37KdEuq5
         /138Rg0mM3SIKHHWi5mlLEBQWoBbnj84PYcEl9ybmdcsIXNwNpsd4lGEZo62maOF0xco
         cmQw==
X-Gm-Message-State: ACrzQf12PQ5jQcFkv3XupVz2MT5sDWnBKnXornq5Hupz+4AzjuqANmH8
	QR4eF/DS0dDWOrMFMC0SAa0=
X-Google-Smtp-Source: 
 AMsMyM6Y9WxSofNHxYJUiiSID9lboErS4ghND9TAcqTRczPvHn//e6V4oUz5LbBhCfjGBlqBBW49lA==
X-Received: by 2002:a63:8841:0:b0:43c:afd6:a957 with SMTP id
 l62-20020a638841000000b0043cafd6a957mr5922566pgd.554.1664207929093;
        Mon, 26 Sep 2022 08:58:49 -0700 (PDT)
Received: from ?IPV6:2601:646:9181:1cf0:18b4:2f80:6996:91e2?
 ([2601:646:9181:1cf0:18b4:2f80:6996:91e2])
        by smtp.gmail.com with ESMTPSA id
 a15-20020a1709027e4f00b00172c7dee22fsm11347498pln.236.2022.09.26.08.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 08:58:48 -0700 (PDT)
Message-ID: <0ccee561-6f18-d5f5-1b54-7c75368057ed@gmail.com>
Date: Mon, 26 Sep 2022 08:58:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [OE-core][PATCH] lttng-tools: Disable on qemuriscv32
Content-Language: en-US
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, jonathan.rajotte-julien@efficios.com
References: <20220926080807.1625573-1-zhe.he@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20220926080807.1625573-1-zhe.he@windriver.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s0ROuZm7vKxuieEC3DWQ5HJo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 15:58:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171069

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s0ROuZm7vKxuieEC3DWQ5HJo
Content-Type: multipart/mixed; boundary="------------GSd9eu41nl9q7ufL3s0UPYOS";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, jonathan.rajotte-julien@efficios.com
Message-ID: <0ccee561-6f18-d5f5-1b54-7c75368057ed@gmail.com>
Subject: Re: [OE-core][PATCH] lttng-tools: Disable on qemuriscv32
References: <20220926080807.1625573-1-zhe.he@windriver.com>
In-Reply-To: <20220926080807.1625573-1-zhe.he@windriver.com>

--------------GSd9eu41nl9q7ufL3s0UPYOS
Content-Type: multipart/mixed; boundary="------------VEQPbeYhETEtXL1WfywnAMa0"

--------------VEQPbeYhETEtXL1WfywnAMa0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8yNi8yMiAxOjA4IEFNLCBIZSBaaGUgd3JvdGU6DQo+IGx0dG5nLXRvb2xzIHJlcXVp
cmVzIFNZU19wcG9sbCBhbmQgU1lTX3BzZWxlY3Q2IHdoaWNoIGFyZSBub3Qgc3VwcG9ydGVk
IG9uDQo+IHJpc2N2MzIuIFRoaXMgaGFzIGJlZW4gY29uZmlybWVkIGJ5IGx0dG5nLXRvb2xz
IHVwc3RyZWFtLg0KPiBodHRwczovL2dpdGh1Yi5jb20vbHR0bmcvbHR0bmctdG9vbHMvcHVs
bC8xNjINCj4gDQo+IEl0J3MgYWxzbyB0dXJuZWQgb2ZmIGZvciByaXNjdjMyIGluIG1ldGEt
cmlzY3YuDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9tZXRhLXJpc2N2L2Jsb2IvbWFz
dGVyL2NvbmYvbGF5ZXIuY29uZg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGUgWmhlIDx6aGUu
aGVAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+ICAgbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy9sdHRuZy1wbGF0Zm9ybXMuaW5jIHwgNCArKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
bHR0bmcvbHR0bmctcGxhdGZvcm1zLmluYyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
bHR0bmctcGxhdGZvcm1zLmluYw0KPiBpbmRleCA5MzNjNjVkODVkLi45OGIxM2IxOTRjIDEw
MDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLXBsYXRmb3Jt
cy5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1wbGF0Zm9y
bXMuaW5jDQo+IEBAIC0xNSwzICsxNSw3IEBAIExUVE5HVVNUOmFyYyA9ICIiDQo+ICAgDQo+
ICAgQ09NUEFUSUJMRV9IT1NUOmFyYzpwbi1sdHRuZy11c3QgPSAibnVsbCINCj4gICANCj4g
KyMgV2hldGhlciB0aGUgcGxhdGZvcm0gc3VwcG9ydHMgbHR0bmctdG9vbHMNCj4gKyMgbHR0
bmctdG9vbHMgcmVxdWlyZXMgU1lTX3Bwb2xsIGFuZCBTWVNfcHNlbGVjdDYgd2hpY2ggYXJl
IG5vdCBzdXBwb3J0ZWQgb24gcmlzY3YzMi4NCj4gKyMgSXQncyBhbHNvIHR1cm5lZCBvZmYg
Zm9yIHJpc2N2MzIgaW4gbWV0YS1yaXNjdi4gU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di9tZXRhLXJpc2N2L2Jsb2IvbWFzdGVyL2NvbmYvbGF5ZXIuY29uZg0KPiArQ09NUEFUSUJM
RV9IT1NUOnFlbXVyaXNjdjMyOnBuLWx0dG5nLXRvb2xzID0gIm51bGwiDQo+IA0KDQpJdHMg
cGVyaGFwcyBiZXR0ZXIgdG8gZGlzYWJsZSBpdCBydjMyIHdpZGUgbm90IGp1c3QgZm9ybSBx
ZW11Lg0KDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlv
dSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVw
bHkgT25saW5lICgjMTcxMDUyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzEwNTINCj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTM5MjI1MzMvMTk5NzkxNA0KPiBH
cm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=
--------------VEQPbeYhETEtXL1WfywnAMa0
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------VEQPbeYhETEtXL1WfywnAMa0--

--------------GSd9eu41nl9q7ufL3s0UPYOS--

--------------s0ROuZm7vKxuieEC3DWQ5HJo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCYzHMNwUDAAAAAAAKCRC7BTNVkZ0zFI8M
AJ9NnRHHXhhTiYMIA05Nk+MaEgvh6gCgj+kL/jz+15PiAvqgaTjQZf53Aec=
=L6dH
-----END PGP SIGNATURE-----

--------------s0ROuZm7vKxuieEC3DWQ5HJo--

