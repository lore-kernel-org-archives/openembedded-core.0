Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A99C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 17:03:56 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.3268.1745514232724731150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 10:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g6O6MbTv;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3feaedb4d2cso871131b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745514232; x=1746119032; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/h3343jfQQZobzNy1zBEt6RhWYxsIlsgXVPA8IBhCPU=;
        b=g6O6MbTvJqa/cNH7R3GD5w4tfPmAepCeWnx85kGDpARBXhnX6l2TA1B6mJtumtInW4
         f8h4jjunjhBWFAzfkn+wruigvDEjCknRW5vLpUCxnXZbbbRAWUjL7fN3o5byWN1PfcFC
         mintz7FsruATNEUG9lqX8OriDh+xa43syMDHyEZSqLPhi/hcDVzLJa/R8EMh16Yca6cT
         Zv9daitWgLRQSBHkbebWi2htgv7dM06a7WKINzBGAodVejRtdt7moT2iwEEGI6h5xH3T
         MOx0GfngkvlfcV6fBP4sIrlUPa/CA+0xgH8blxXQkRHJl7ygKEZDQrTfu+cUTf4Kl8y9
         LFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514232; x=1746119032;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/h3343jfQQZobzNy1zBEt6RhWYxsIlsgXVPA8IBhCPU=;
        b=JjamZ146a2auxWmhzUo57WheJ5PM1uB7Pj8QJ8rqH++/tCO/8BhziDUK034ijhNBmh
         SsQPzf+0gcB39ZhWubAebt+XWByQRJENJ1BeFWjOV9hGXa2fIs1nYksBnNhEmXg8hQS+
         myrdkbmUVHBI8+GfmOD91rpT8mzZ7DrlHi4c0Bc6ln2SqOhmpcM84FV+nNxYxxKvgPPS
         0epWaD/+Qo32YSEQO21Jcq+kobHaeCrqLAGYNmY1FL1XYduRs6s8ZJhWNwF3mW2PhmSG
         OMwVq50PbPm45UnhCzUsa2eZO+0ljP0Lys4J7XL4ETVF/ni6QfHX7V1E/igQUJOMMk86
         oceQ==
X-Gm-Message-State: AOJu0YzwuvEDPFAtb4I1l5zh2QqufO6nZkbyqx+1YXauo/uXyEyraByJ
	zkxubttZlMirmnZ71zXslYbMKnvRPAjY/klhHFvEFQvJO5hpzDP6
X-Gm-Gg: ASbGncv/jv5TDUPL8sCKq8806XdR7hlOIInrekDaPX4hWPvXZ1qMXhe2CxuRvC/DFv+
	Lf+I/wjI5V0FQz/jz9WLqrib/wysUhnRimo6UN+q00D1y8Egrgaxc/Rrd1OSNOIUdNg6PVDq9HP
	8Ee/sb3/yFf4FS53+PN3CVNDhurBKfhFBMpCzRw+hSImIaVr02GyghIRnbq6WGI8rCcx4u/gQrk
	Oq5WMBOwAhu+NtZSr3p7j8aPCXqzd+Sfp5Ny+uNeexTUFec83DYMqpxDTMR7xpDX1fX+12JadaM
	fjeRgwyeR1i4YQTBTMCEhWK6Kz4UjksZJeEjD83+aRJg+hvNf4BuHPio8q1mzQ7Hr89TsC3JHc5
	VoSb88Mg+uyOuFogXS3miIZBpiV+dksgIh/cPvtWd3Dwo
X-Google-Smtp-Source: AGHT+IF+2wJFJ7Ud/RTjm60Hvwk92PV7ckiCGPspq18LvDzx5K6jXqOlNFZ11MHDwa2LjoGbG2JREA==
X-Received: by 2002:a05:6808:2f1a:b0:401:ea99:537 with SMTP id 5614622812f47-401f11a2090mr122655b6e.16.1745514231909;
        Thu, 24 Apr 2025 10:03:51 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:1d26:e07d:3f72:d4cc? ([2601:646:8201:fd20:1d26:e07d:3f72:d4cc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec8e4c3fsm326567b6e.30.2025.04.24.10.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:03:51 -0700 (PDT)
Message-ID: <91383b9d-3775-44bb-a79f-e875865216fa@gmail.com>
Date: Thu, 24 Apr 2025 10:03:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] clang: Merge llvm/clang family recipes from
 meta-clang
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-4-5a492a8461aa@gmail.com>
 <2dn5sjqkea3lnf5z662xc6urbgewdmynwarnghbuwwaxpnvdyi@heehdshhztm5>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <2dn5sjqkea3lnf5z662xc6urbgewdmynwarnghbuwwaxpnvdyi@heehdshhztm5>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------twtvLAkWiVJdS8b5lExI646F"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 17:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215394

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------twtvLAkWiVJdS8b5lExI646F
Content-Type: multipart/mixed; boundary="------------k2dypKdiPPNSmFAfwWk0KcXR";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <91383b9d-3775-44bb-a79f-e875865216fa@gmail.com>
Subject: Re: [PATCH 04/11] clang: Merge llvm/clang family recipes from
 meta-clang
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-4-5a492a8461aa@gmail.com>
 <2dn5sjqkea3lnf5z662xc6urbgewdmynwarnghbuwwaxpnvdyi@heehdshhztm5>
In-Reply-To: <2dn5sjqkea3lnf5z662xc6urbgewdmynwarnghbuwwaxpnvdyi@heehdshhztm5>

--------------k2dypKdiPPNSmFAfwWk0KcXR
Content-Type: multipart/mixed; boundary="------------ka7vCMU7Dp0Og98xGWktlOXb"

--------------ka7vCMU7Dp0Og98xGWktlOXb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yNC8yNSAyOjE4IEFNLCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOg0KPiBPbiBUaHUs
IEFwciAyNCwgMjAyNSBhdCAxMjoyMDozOEFNIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4+
IFRoaXMgY2FuIGVuc3VyZSB0aGF0IG1ldGEtY2xhbmcgZG9lcyBub3QgY2FycnkgdGhlbSBh
bmQgY2FuIHJlbHkgb24gY29yZSBsYXllcg0KPj4gd2hpbGUgbWVzYSBjYW4gdXNlIHRoZW0g
dG9vLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+DQo+PiAtLS0NCj4+ICAgLi4uL2NsYW5nL2NsYW5nLWNyb3NzLWNhbmFkaWFuX2dpdC5i
YiAgICAgICAgICAgICAgfCAgMzYgKysNCj4+ICAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ns
YW5nL2NsYW5nLWNyb3NzX2dpdC5iYiAgICAgfCAgMzkgKysNCj4+ICAgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NsYW5nL2NsYW5nLWNyb3Nzc2RrX2dpdC5iYiAgfCAgMzQgKysNCj4+ICAg
Li4uaW5kLWxpYnVud2luZC1oZWFkZXJzLXdoZW4tTElCQ1hYQUJJX0xJQlUucGF0Y2ggfCAg
NjAgKysrDQo+PiAgIC4uLmVyLXJ0LXN1cHBvcnQtYS1uZXctZW1iZWRkZWQtbGludXgtdGFy
Z2V0LnBhdGNoIHwgMzA5ICsrKysrKysrKysrKysNCj4+ICAgLi4uLVNpbXBsaWZ5LWNyb3Nz
LWNvbXBpbGF0aW9uLi1Eb24tdC11c2UtbmEucGF0Y2ggfCAgNDQgKysNCj4+ICAgLi4uTGli
cmFyeUluZm8tVW5kZWZpbmUtbGliYy1mdW5jdGlvbnMtaWYtdGgucGF0Y2ggfCAgOTAgKysr
Kw0KPj4gICAuLi5hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLWFuZC1saWJkaXItcGF0aC5w
YXRjaCB8ICA3MSArKysNCj4+ICAgLi4uLWNsYW5nLWRyaXZlci1DaGVjay1zeXNyb290LWZv
ci1sZHNvLXBhdGgucGF0Y2ggfCAgNzUgKysrKw0KPj4gICAuLi5pdmVyLXRvb2xzLmNwcC1B
ZGQtbHNzcF9ub25zaGFyZWQtb24tbXVzbC5wYXRjaCB8ICAzMiArKw0KPj4gICAuLi4vMDAw
OC1jbGFuZy1QcmVwZW5kLXRyYWlsaW5nLXRvLXN5c3Jvb3QucGF0Y2ggICB8ICAzOSArKw0K
Pj4gICAuLi5pbnNpZGUtdGhlLXRhcmdldC1zeXNyb290LWZvci1jb21waWxlci1ydS5wYXRj
aCB8ICA0MSArKw0KPj4gICAuLi5hbmctRGVmaW5lLXJlbGVhdGl2ZS1nY2MtaW5zdGFsbGF0
aW9uLWRpci5wYXRjaCB8ICA0NyArKw0KPj4gICAuLi5wdGhyZWFkLWFuZC1sZGwtYWxvbmct
d2l0aC1sdW53aW5kLWZvci1zdC5wYXRjaCB8ICAzNSArKw0KPj4gICAuLi5fRVhFQ1VUQUJM
RS13aGVuLWNyb3NzLWNvbXBpbGluZy1mb3ItbmF0aS5wYXRjaCB8ICAyNCArDQo+PiAgIC4u
Li8wMDEzLUNoZWNrLWZvci1hdG9taWMtZG91YmxlLWludHJpbnNpY3MucGF0Y2ggIHwgIDM0
ICsrDQo+PiAgIC4uLmNvbmZpZ3VyZS1mb3ItcGFja2FnZXMtdXNpbmctZmluZF9wYWNrYWdl
LnBhdGNoIHwgMTE3ICsrKysrDQo+PiAgIC4uLmVzb3VyY2UtZGlyLWxvY2F0aW9uLWZvci1j
cm9zcy10b29sY2hhaW5zLnBhdGNoIHwgIDUwICsrKw0KPj4gICAuLi5yLUFkZC1keWxkLXBy
ZWZpeC13aGVuLWNoZWNraW5nLXN5c3Jvb3QtZi5wYXRjaCB8ICA3OSArKysrDQo+PiAgIC4u
Li8wMDE3LWNsYW5nLVVzZS1weXRob24zLWluLXB5dGhvbi1zY3JpcHRzLnBhdGNoIHwgIDM1
ICsrDQo+PiAgIC4uLjQtc2V0LVlvY3RvLWJhc2VkLUdDQy1pbnN0YWxsLXNlYXJjaC1wYXRo
LnBhdGNoIHwgIDcwICsrKw0KPj4gICAuLi4tYW5jaG9yLWZvci1hZGRpbmctT0UtZGlzdHJv
LXZlbmRvci1uYW1lcy5wYXRjaCB8ICAzMiArKw0KPj4gICAuLi4tRG8tbm90LXVzZS1iYWNr
dHJhY2UtQVBJcy1vbi1ub24tZ2xpYmMtbC5wYXRjaCB8ICA2OCArKysNCj4+ICAgLi4uODYt
dHJpcGxlLWZvci1ub24tZGViaWFuLW11bHRpYXJjaC1saW51eC0ucGF0Y2ggfCAgMjggKysN
Cj4+ICAgLi4uMDAyMi1saWJ1bndpbmQtQWRkZWQtdW53X2JhY2t0cmFjZS1tZXRob2QucGF0
Y2ggfCAgNTYgKysrDQo+PiAgIC4uLi1Eby1ub3QtdXNlLWluc3RhbGwtcmVsYXRpdmUtbGli
Yy1oZWFkZXJzLnBhdGNoIHwgIDM0ICsrDQo+PiAgIC4uLi8wMDI0LUZpeC1saWItcGF0aHMt
Zm9yLU9wZW5FbWJlZGRlZC1Ib3N0LnBhdGNoIHwgIDc5ICsrKysNCj4+ICAgLi4ubGlicmFy
eS1zZWFyY2gtcGF0aC1mb3ItT3BlbkVtYmVkZGVkLUhvc3QucGF0Y2ggfCAgODQgKysrKw0K
Pj4gICAuLi4vMDAyNi1sbGRiLUxpbmstd2l0aC1saWJhdG9taWMtb24teDg2LnBhdGNoICAg
ICB8ICAzMyArKw0KPj4gICAuLi4wMjctY29tcGlsZXItcnQtRW5hYmxlLV9faW50MTI4LWZv
ci1wcGMzMi5wYXRjaCB8ICA3MyArKysNCj4+ICAgLi4uLURvLW5vdC11c2UtY21ha2UtaW5m
cmEtdG8tZGV0ZWN0LWxpYnpzdGQucGF0Y2ggfCAgNjIgKysrDQo+PiAgIC4uLmxlci1ydC1G
aXgtc3RhdC1zdHJ1Y3Qtcy1zaXplLWZvci1PMzItQUJJLnBhdGNoIHwgIDQ2ICsrDQo+PiAg
IC4uLi1VbmRlZi1fVElNRV9CSVRTLWFsb25nLXdpdGgtX0ZJTEVfT0ZGU0VULnBhdGNoIHwg
IDQzICsrDQo+PiAgIC4uLnMtR251LmNwcC1BUk1MaWJEaXJzLXNlYXJjaC1hbHNvLWluLWxp
YjMyLnBhdGNoIHwgIDgxICsrKysNCj4+ICAgLi4udm0tQWRkLU9FLXNwZWNpZmljLUFCSS10
cmlwbGUtZm9yLU4zMi1BQkkucGF0Y2ggfCAgNzggKysrKw0KPj4gICAuLi5kLWxpYnVud2lu
ZC5wYy5pbi1hbmQtbGx2bS1jb25maWctc2NyaXB0cy5wYXRjaCB8ICA5MCArKysrDQo+PiAg
IC4uLnB5LXJlc3BlY3QtTExWTV9MSUJESVJfU1VGRklYLWxpa2Utb3RoZXItLnBhdGNoIHwg
IDkyICsrKysNCj4+ICAgLi4uci1ydC1Eby1ub3QtcGFzcy10YXJnZXQtdG8tY2xhbmctY29t
cGlsZXIucGF0Y2ggfCAgMjkgKysNCj4+ICAgLi4uL2NsYW5nL2NsYW5nLzAwMzYtRml4LWJ1
aWxkLW9uLXBwYzY0LW11c2wucGF0Y2ggfCAgOTcgKysrKw0KPj4gICAuLi5kLWEtYnVpbGQt
b3B0aW9uLXRvLWRpc2FibGUtYnVpbGRpbmctZGV4cC5wYXRjaCB8ICA4NSArKysrDQo+PiAg
IC4uLm1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoIHwg
IDMxICsrDQo+PiAgIC4uLi9jbGFuZy9jbGFuZy9zcGlydi1pbnRlcm5hbC1idWlsZC5wYXRj
aCAgICAgICAgIHwgIDMwICsrDQo+PiAgIC4uLi9jbGFuZy9jbGFuZy9zcGlydi1zaGFyZWQt
bGlicmFyeS5wYXRjaCAgICAgICAgIHwgIDI1ICsrDQo+PiAgIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbGFuZy9jbGFuZ19naXQuYmIgICAgICAgICAgIHwgNDk3ICsrKysrKysrKysrKysr
KysrKysrKw0KPj4gICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2xhbmcvY29tbW9uLWNsYW5n
LmluYyAgICAgICB8ICAyNCArDQo+PiAgIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbGFuZy9j
b21tb24tc291cmNlLmluYyAgICAgIHwgIDE3ICsNCj4+ICAgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NsYW5nL2NvbW1vbi5pbmMgICAgICAgICAgICAgfCAgODUgKysrKw0KPj4gICAuLi4v
Y2xhbmcvY29tcGlsZXItcnQtc2FuaXRpemVyc19naXQuYmIgICAgICAgICAgICB8IDEzOSAr
KysrKysNCj4+ICAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NsYW5nL2NvbXBpbGVyLXJ0X2dp
dC5iYiAgICAgfCAxMzUgKysrKysrDQo+PiAgIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbGFu
Zy9saWJjeHhfZ2l0LmJiICAgICAgICAgIHwgMTE5ICsrKysrDQo+PiAgIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbGFuZy9sbHZtLXByb2plY3Qtc291cmNlLmJiIHwgIDEyICsNCj4+ICAg
Li4uL3JlY2lwZXMtZGV2dG9vbHMvY2xhbmcvbGx2bS1wcm9qZWN0LXNvdXJjZS5pbmMgfCAg
OTkgKysrKw0KPj4gICAuLi4vcmVjaXBlcy1kZXZ0b29scy9jbGFuZy9uYXRpdmVzZGstY2xh
bmctZ2x1ZS5iYiB8ICAzNiArKw0KPj4gICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2xhbmcv
b3Blbm1wX2dpdC5iYiAgICAgICAgICB8ICA2NyArKysNCj4+ICAgNTQgZmlsZXMgY2hhbmdl
ZCwgMzg2NyBpbnNlcnRpb25zKCspDQo+IA0KPiBHZW5lcmljIGNvbW1lbnQgd2hpY2ggSSBm
b3Jnb3QgdG8gd3JpdGUgaW4gdGhlIGZpcnN0IHJldmlldyBlbWFpbC4gQnkNCj4gdGhlIGVu
ZCBvZiB0aGUgc2VyaWVzIHRoZXJlIGFyZSAyMyBQZW5kaW5nIHBhdGNoZXMgb3V0IG91dCA0
MCAoSSdtIG5vdA0KPiBjb3VudGluZyBTUElSViBwYXRjaGVzKS4gSXMgdGhlcmUgYSBwbGFu
IHRvIG1vdmUgdGhlbSBpbnRvIE9FLVNwZWZpYyAvDQo+IFN1Ym1pdHRlZD8NCj4gDQoNCkRl
ZmluaXRlbHkgeWVzLCBzb21lIG9mIHRoZW0gd2VyZSBzdWJtaXR0ZWQgcHJpb3IgdG8gbGx2
bSBzdGFydGVkIHVzaW5nIA0KZ2l0aHViIHNvIEkgcGxhbiB0byBnZXQgdGhpcyBzb3J0ZWQg
aW4gdGhpcyByZWxlYXNlIGN5Y2xlLg0K
--------------ka7vCMU7Dp0Og98xGWktlOXb
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------ka7vCMU7Dp0Og98xGWktlOXb--

--------------k2dypKdiPPNSmFAfwWk0KcXR--

--------------twtvLAkWiVJdS8b5lExI646F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaApu9gUDAAAAAAAKCRC7BTNVkZ0zFOCx
AJ44VKhgSNi4CAE1UYhG+YjqlPjSXgCeNardx8In3zWo4QCJDdO2NlgTciQ=
=7KBa
-----END PGP SIGNATURE-----

--------------twtvLAkWiVJdS8b5lExI646F--

