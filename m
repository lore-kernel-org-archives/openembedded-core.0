Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E345C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 16:53:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.14942.1636476797558534593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 08:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SZmuA7F3;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id v20so21998614plo.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=qDGdorHe5l3VDk++aPEaB1/MZPhZkHCPrfxVMIhv5so=;
        b=SZmuA7F37b1AZlEzUYyoHJgmMTDz4JecQJAd4/khYlt2QZ8QkkqS5WmPMADkezN1u5
         23wsmbnwE0aK8iQ84xkhenh1Jqx7cSsjk4bBxuxaVVH5lDkHZEUzhTTUWbypGPAjkpK/
         t1I3qCXlNPCDgEaNkWMrvbsI6pRv7b/bh+GzXFp1NRXtUt35YrQl/bwzyriklltVxO2Y
         2VUKywoyqW4zNJLWYI5/OlT5moO7y82pQ0ws3TksZO8w4zYVhzEfC7HPilDrMy26Bu41
         WX64n7/MDtRhRoBtVigkVpeSmljGTVonWsmlnR56sTUmYaNdg/Q28a44nfqHZ0hPb8DN
         PXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=qDGdorHe5l3VDk++aPEaB1/MZPhZkHCPrfxVMIhv5so=;
        b=P32t9VB77eTprlkq4zcwzNB5DfpfjODYuPUJGn5S/Xi8xhFM0rHz2UJJEjN8cmojWw
         FLC42q1nlyP1FqCGxJPJKfE4YUhhXLgG8ecKbpCiKjVzq2HoxjmFlW8BBq9/juo5jm2T
         hvU3o2sHY/4NNAoCK8YAKHwktBkszKc7XtV16YfRHyD2M/SOah0F9O26MaEgjNGcKaMJ
         NiGfMCKMhQ0bAwnItPomh+oD+EBpu6AAKZL1TC0AreiiIf3K1OEHwFy+IHtDD7irBFn1
         BsSCw/SPHwxqv9gColLvulNGC8QP1avjLmwG8kKXAGVEjCkCetPEwodF5avPvfwt2f6D
         zz6A==
X-Gm-Message-State: AOAM531HyGQY3gFAgVvHN/+MAZBF2zX8SJcYlYYStoFeP/eLDEsbXcoA
	7tDjH3zzl7kvl1/7lRgfHRM=
X-Google-Smtp-Source: 
 ABdhPJwXnnRbLKh7XRHy8FOvFZQuHoM9MXBi82Kw4ppoe/5QbEZviOIc7l3tSzBcSlgt3v9VueSEyQ==
X-Received: by 2002:a17:90b:1e4e:: with SMTP id
 pi14mr8543293pjb.161.1636476796901;
        Tue, 09 Nov 2021 08:53:16 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:f4e6:1636:a1:de6e?
 ([2601:646:9200:a0f0:f4e6:1636:a1:de6e])
        by smtp.gmail.com with ESMTPSA id
 w7sm15924191pgo.56.2021.11.09.08.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 08:53:16 -0800 (PST)
Message-ID: <11046c6c-17a2-dfbc-b9aa-61d93279b7b9@gmail.com>
Date: Tue, 9 Nov 2021 08:53:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [OE-core] [PATCH] gdb-cross: add dependency on gmp-native
Content-Language: en-US
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20211109102958.22207-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211109102958.22207-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 16:53:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158058

DQoNCk9uIDExLzkvMjEgMjoyOSBBTSwgTWFydGluIEphbnNhIHdyb3RlOg0KPiAqIGl0IHdh
cyBhbHJlYWR5IGFkZGVkIGZvciB0YXJnZXQgYW5kIGNyb3NzLWNhbmFkaWFuIGdkYiBpbjoN
Cj4gICAgY29tbWl0IDQ2NDNkMWViMjIyMTUxMzg0Zjc3ZDEzYTkzNjUzN2FhZTVjYTNmZTYN
Cj4gICAgQXV0aG9yOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiAgICBEYXRl
OiAgIEZyaSBOb3YgNSAxNzozNzozMyAyMDIxIC0wNzAwDQo+IA0KPiAgICAgIGdkYjogQWRk
IGRlcGVuZGVuY3kgb24gbGliZ21wDQo+IA0KPiAgICAgIGdkYiAxMSBoYXMgYWRkZWQgdGhp
cyBsaWJyYXJ5IGFzIG11c3QgaGF2ZQ0KPiANCj4gKiBidXQgZ2RiLWNyb3NzLmluYyBvdmVy
d3JpdGVzIERFUEVORFMgZnJvbSBnZGItY29tbW9uLmluYw0KPiAgICBhbmQgbmVlZHMgdGhl
IGRlcGVuZGVuY3kgYXMgd2VsbCBhcyBzaG93biBpbiBsb2cuZG9fY29tcGlsZToNCj4gDQo+
ICAgIGNoZWNraW5nIGZvciBsaWJnbXAuLi4gbm8NCj4gICAgY29uZmlndXJlOiBlcnJvcjog
R01QIGlzIG1pc3Npbmcgb3IgdW51c2FibGUNCj4gICAgbWFrZVsxXTogKioqIFtNYWtlZmls
ZTo5NDE4OiBjb25maWd1cmUtZ2RiXSBFcnJvciAxDQo+IA0KPiAgICBhbmQgaW4gZ2RiLWNy
b3NzLWk2ODYvMTEuMS1yMC9idWlsZC1pNjg2LW9lLWxpbnV4L2dkYi9jb25maWcubG9nOg0K
PiANCg0KdGhhbmtzIGZvciBkb2luZyBpdA0KDQoNCj4gICAgY29uZmlndXJlOjEwNDAyOiBj
aGVja2luZyBmb3IgbGliZ21wDQo+ICAgIGNvbmZpZ3VyZToxMDQyMjogZ2NjICAtbyBjb25m
dGVzdCAtaXN5c3RlbS9PRS90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvZ2RiLWNyb3Nz
LWk2ODYvMTEuMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2luY2x1ZGUgLU8yIC1w
aXBlICAgICAtaXN5c3RlbS9PRS90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvZ2RiLWNy
b3NzLWk2ODYvMTEuMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2luY2x1ZGUgLUkv
T0UvdG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2dkYi1jcm9zcy1pNjg2LzExLjEtcjAv
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlICAtTC9PRS90bXAtZ2xpYmMvd29y
ay94ODZfNjQtbGludXgvZ2RiLWNyb3NzLWk2ODYvMTEuMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2xpYiAgICAgICAgICAgICAgICAgICAgICAgICAtTC9PRS90bXAtZ2xpYmMv
d29yay94ODZfNjQtbGludXgvZ2RiLWNyb3NzLWk2ODYvMTEuMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvbGliICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtLWVuYWJsZS1uZXct
ZHRhZ3MgICAgICAgICAgICAgICAgICAgICAgICAgLVdsLC1ycGF0aC1saW5rLC9PRS90bXAt
Z2xpYmMvd29yay94ODZfNjQtbGludXgvZ2RiLWNyb3NzLWk2ODYvMTEuMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJw
YXRoLWxpbmssL09FL3RtcC1nbGliYy93b3JrL3g4Nl82NC1saW51eC9nZGItY3Jvc3MtaTY4
Ni8xMS4xLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAg
ICAgICAgLVdsLC1ycGF0aCwvT0UvdG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2dkYi1j
cm9zcy1pNjg2LzExLjEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9saWIgICAgICAg
ICAgICAgICAgICAgICAgICAgLVdsLC1ycGF0aCwvT0UvdG1wLWdsaWJjL3dvcmsveDg2XzY0
LWxpbnV4L2dkYi1jcm9zcy1pNjg2LzExLjEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xp
YiAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLU8xIC1XbCwtLWFsbG93LXNobGliLXVu
ZGVmaW5lZCAtV2wsLS1keW5hbWljLWxpbmtlcj0vT0UvdG1wLWdsaWJjL3N5c3Jvb3RzLXVu
aW5hdGl2ZS94ODZfNjQtbGludXgvbGliL2xkLWxpbnV4LXg4Ni02NC5zby4yIGNvbmZ0ZXN0
LmMgLWxuY3Vyc2VzdyAtbG0gLWxkbCAgLWxnbXAgPiY1DQo+ICAgIGNvbmZ0ZXN0LmM6NTI6
MTA6IGZhdGFsIGVycm9yOiBnbXAuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiAg
ICAgICA1MiB8ICNpbmNsdWRlIDxnbXAuaD4NCj4gICAgICAgICAgfCAgICAgICAgICBefn5+
fn5+DQo+IA0KPiAqIHRoaXMgZmFpbHMgb25seSB3aGVuIHRoZSBob3N0IE9TIGRvZXNuJ3Qg
aGF2ZSBHTVAgaW5zdGFsbGVkDQo+ICAgIG90aGVyd2lzZSBpdCB3aWxsIHVzZSBsaWJnbXAg
ZnJvbSBob3N0IGFuZCBpZ25vcmUNCj4gICAgLS13aXRoLWxpYmdtcC1wcmVmaXg9L09FL3Rt
cC1nbGliYy93b3JrL3g4Nl82NC1saW51eC9nZGItY3Jvc3MtaTY4Ni8xMS4xLXIwL3JlY2lw
ZS1zeXNyb290LW5hdGl2ZS9PRS90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvZ2RiLWNy
b3NzLWk2ODYvMTEuMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJ0aW4gSmFuc2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+DQo+IC0t
LQ0KPiAgIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNyb3NzLmluYyB8IDIgKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi1jcm9zcy5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi1jcm9zcy5pbmMNCj4gaW5kZXgg
NGU1MGNkNWFiMC4uOWY5Njc1YzFiMyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dkYi9nZGItY3Jvc3MuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9nZGIvZ2RiLWNyb3NzLmluYw0KPiBAQCAtMSw2ICsxLDYgQEANCj4gICByZXF1aXJlIGdk
Yi1jb21tb24uaW5jDQo+ICAgDQo+IC1ERVBFTkRTID0gImV4cGF0LW5hdGl2ZSBuY3Vyc2Vz
LW5hdGl2ZSBmbGV4LW5hdGl2ZSBiaXNvbi1uYXRpdmUiDQo+ICtERVBFTkRTID0gImV4cGF0
LW5hdGl2ZSBnbXAtbmF0aXZlIG5jdXJzZXMtbmF0aXZlIGZsZXgtbmF0aXZlIGJpc29uLW5h
dGl2ZSINCj4gICANCj4gICBpbmhlcml0IHB5dGhvbjNuYXRpdmUgcGtnY29uZmlnDQo+ICAg
DQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3Ug
cmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5
IE9ubGluZSAoIzE1ODAxMCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTU4MDEwDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzg2OTI4MjcxLzE5OTc5MTQNCj4gR3Jv
dXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IA0K

