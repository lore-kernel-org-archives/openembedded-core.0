Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E25AC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 01:45:40 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.4101.1663033532322914659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 18:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lt4BE7wi;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id m3so9806853pjo.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=cP2oDNrSkY1tn4npElD7QogOjrJyQ7iaZb7QqMiZFIY=;
        b=Lt4BE7wiAXsHYWLOQJNo8S5L0TMRl4uMpq7FyXFxHP9RtcnZ7GfmwwGKyzHdhC+e6y
         jjej1xy77A8YMfIiOKnOOjGX9AeCHvL/1oqlB/HgFS/4b94QaZ2c4suhAJnOFklRBGBS
         5G9MWbNV9BGFkFwkIXifD3iF4d2zJrpy01Mi635riDiTWc06aw+uUheTz7Y1HPVTSCZI
         en8kpvduOkIx49Q/ZrLTFsgksF7oLf/aWmiqFfz4jO9wF3aZDPTajADVWp7fpEzaynKl
         IuJU5k2n5k4F6FcdOsN8vt4Z5nwB4HgEFYsX9JW9fQmf9/4Us5nZXQuEmY72A3ybBQSs
         ktOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=cP2oDNrSkY1tn4npElD7QogOjrJyQ7iaZb7QqMiZFIY=;
        b=cDYudWhuSVQ41+aFX2XOtINOXvc2Gwf2WsfHMU6t0mPF/9e0RoGgfafaiP6Tmgzt38
         IG004A/GTq/M9Cr493oHa5rg9sK/Z78ekJ9ZMhZdnSPTV4DA3HyM9gXF9D/PdlX1jumc
         0gK+dNIh9MXG2/fZ/fgsiUVu77FSLosQL0j/cKKPV/HlvElh2tntI+EhAMURScGBO1Cx
         58VdlhRGnz+yVHMnFejtglJzhw4ZGqrd943vej2+VtB+ue7NOD2vbDGMrekFD3dTiNHv
         qUQLxvLEdoJcFQD9uUBKmjdFN+/zn22/RHcCYBNRXTciU6vM5oF/oCNADCVQKcxhoNaP
         4Fdw==
X-Gm-Message-State: ACgBeo2CSTZBbs0VtE52bTLb4uLXU2/V9/3sGoq0a6LRz5YwYS5m4kFd
	9GLgYTaDTaCaQqOs09w7KXE=
X-Google-Smtp-Source: 
 AA6agR7/LLrnXViWQSGGb0Q5n/Tyl/6Y7iVqUbKMCHnLR2Lg2dhhZ7+oOyo0HkTwdVQmdMJcSjgr7Q==
X-Received: by 2002:a17:903:2349:b0:178:111b:e6da with SMTP id
 c9-20020a170903234900b00178111be6damr17106784plh.70.1663033531300;
        Mon, 12 Sep 2022 18:45:31 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:fc5f:c615:18d8:b0f2?
 ([2601:646:9200:a0f0:fc5f:c615:18d8:b0f2])
        by smtp.gmail.com with ESMTPSA id
 w4-20020a17090a6b8400b001fd803f057bsm3925874pjj.33.2022.09.12.18.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 18:45:30 -0700 (PDT)
Message-ID: <54a93e27-ba69-ae00-bf9d-dfa8b051b3a3@gmail.com>
Date: Mon, 12 Sep 2022 18:45:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 11 Sep 2022
 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org
References: <20220911140238.1ECB1960B01@nuc.router0800d9.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20220911140238.1ECB1960B01@nuc.router0800d9.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kVp4qPtlxVByt2649top1zM9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 01:45:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170556

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kVp4qPtlxVByt2649top1zM9
Content-Type: multipart/mixed; boundary="------------ASkuz5a0wqEi8f6HKXWfA00o";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org
Message-ID: <54a93e27-ba69-ae00-bf9d-dfa8b051b3a3@gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 11 Sep 2022
 04:00:01 AM HST
References: <20220911140238.1ECB1960B01@nuc.router0800d9.com>
In-Reply-To: <20220911140238.1ECB1960B01@nuc.router0800d9.com>

--------------ASkuz5a0wqEi8f6HKXWfA00o
Content-Type: multipart/mixed; boundary="------------sVBailUHAkEKUbR5f80N7MHx"

--------------sVBailUHAkEKUbR5f80N7MHx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8xMS8yMiA3OjAyIEFNLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0KPiBCcmFuY2g6IG1h
c3Rlcg0KPiANCj4gTmV3IHRoaXMgd2VlazogMTAgQ1ZFcw0KPiBDVkUtMjAyMC0zNTUzOCAo
Q1ZTUzM6IDUuNSBNRURJVU0pOiBsaWJqcGVnLXR1cmJvOmxpYmpwZWctdHVyYm8tbmF0aXZl
IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUt
MjAyMC0zNTUzOCAqDQo+IENWRS0yMDIyLTEzNTQgKENWU1MzOiA1LjUgTUVESVVNKTogdGlm
ZiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZF
LTIwMjItMTM1NCAqDQo+IENWRS0yMDIyLTEzNTUgKENWU1MzOiA2LjEgTUVESVVNKTogdGlm
ZiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZF
LTIwMjItMTM1NSAqDQo+IENWRS0yMDIyLTMwOTkgKENWU1MzOiA3LjggSElHSCk6IHZpbSBo
dHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIw
MjItMzA5OSAqDQo+IENWRS0yMDIyLTMxMzQgKENWU1MzOiA3LjggSElHSCk6IHZpbSBodHRw
czovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjIt
MzEzNCAqDQo+IENWRS0yMDIyLTM4MTI2IChDVlNTMzogNS41IE1FRElVTSk6IGJpbnV0aWxz
OmJpbnV0aWxzLWNyb3NzLXRlc3RzdWl0ZTpiaW51dGlscy1jcm9zcy14ODZfNjQgaHR0cHM6
Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTM4
MTI2ICoNCj4gQ1ZFLTIwMjItMzgxMjcgKENWU1MzOiA1LjUgTUVESVVNKTogYmludXRpbHM6
YmludXRpbHMtY3Jvc3MtdGVzdHN1aXRlOmJpbnV0aWxzLWNyb3NzLXg4Nl82NCBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItMzgx
MjcgKg0KPiBDVkUtMjAyMi0zODEyOCAoQ1ZTUzM6IDUuNSBNRURJVU0pOiBiaW51dGlsczpi
aW51dGlscy1jcm9zcy10ZXN0c3VpdGU6YmludXRpbHMtY3Jvc3MteDg2XzY0IGh0dHBzOi8v
d2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0zODEy
OCAqDQo+IENWRS0yMDIyLTM5MDI4IChDVlNTMzogNy41IEhJR0gpOiBpbmV0dXRpbHMgaHR0
cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIy
LTM5MDI4ICoNCj4gQ1ZFLTIwMjItMzkwNDYgKENWU1MzOiA1LjMgTUVESVVNKTogZ2xpYmMg
aHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0y
MDIyLTM5MDQ2ICoNCj4gDQo+IFJlbW92ZWQgdGhpcyB3ZWVrOiA0IENWRXMNCj4gQ1ZFLTIw
MjEtMzkyOSAoQ1ZTUzM6IDguMiBISUdIKTogcWVtdTpxZW11LW5hdGl2ZTpxZW11LXN5c3Rl
bS1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVs
bklkPUNWRS0yMDIxLTM5MjkgKg0KPiBDVkUtMjAyMi0yOTUzIChDVlNTMzogNS41IE1FRElV
TSk6IHRpZmYgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVs
bklkPUNWRS0yMDIyLTI5NTMgKg0KPiBDVkUtMjAyMi0zMjg5MyAoQ1ZTUzM6IDguOCBISUdI
KTogd2Via2l0Z3RrIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWls
P3Z1bG5JZD1DVkUtMjAyMi0zMjg5MyAqDQo+IENWRS0yMDIyLTM4NTMzIChDVlNTMzogNS41
IE1FRElVTSk6IGJpbnV0aWxzOmJpbnV0aWxzLWNyb3NzLXRlc3RzdWl0ZTpiaW51dGlscy1j
cm9zcy14ODZfNjQgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDIyLTM4NTMzICoNCj4gDQo+IEZ1bGwgbGlzdDogIEZvdW5kIDE1IHVu
cGF0Y2hlZCBDVkVzDQo+IENWRS0yMDIwLTM1NTM4IChDVlNTMzogNS41IE1FRElVTSk6IGxp
YmpwZWctdHVyYm86bGlianBlZy10dXJiby1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3Qu
Z292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIwLTM1NTM4ICoNCg0KV2UgYXJl
IGF0IDIuMS40IGluIG1hc3RlciBhbmQgdGhpcyB3YXMgZml4ZWQgaW4gMi4wLjYgdmlhIA0K
aHR0cHM6Ly9naXRodWIuY29tL2xpYmpwZWctdHVyYm8vbGlianBlZy10dXJiby9jb21taXQv
OTEyMGEyNDc0MzZlODRjMGI0ZWVhODI4Y2IxMWU4ZjY2NWZjZGUzMCANCnNvIEkgd29uZGVy
IHdoeSBpdHMgYmVpbmcgZmxhZ2dlZC4NCg0KPiBDVkUtMjAyMS0zNTIxIChDVlNTMzogNC43
IE1FRElVTSk6IHJwbTpycG0tbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3
L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS0zNTIxICoNCj4gQ1ZFLTIwMjEtMzU5Mzcg
KENWU1MzOiA2LjQgTUVESVVNKTogcnBtOnJwbS1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5p
c3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIxLTM1OTM3ICoNCj4gQ1ZF
LTIwMjEtMzU5MzggKENWU1MzOiA3LjggSElHSCk6IHJwbTpycG0tbmF0aXZlIGh0dHBzOi8v
d2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS0zNTkz
OCAqDQo+IENWRS0yMDIxLTM1OTM5IChDVlNTMzogNy44IEhJR0gpOiBycG06cnBtLW5hdGl2
ZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZF
LTIwMjEtMzU5MzkgKg0KPiBDVkUtMjAyMS00MTU4IChDVlNTMzogNi4wIE1FRElVTSk6IHFl
bXU6cWVtdS1uYXRpdmU6cWVtdS1zeXN0ZW0tbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0
Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS00MTU4ICoNCj4gQ1ZFLTIw
MjItMTM1NCAoQ1ZTUzM6IDUuNSBNRURJVU0pOiB0aWZmIGh0dHBzOi8vd2ViLm52ZC5uaXN0
Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0xMzU0ICoNCj4gQ1ZFLTIw
MjItMTM1NSAoQ1ZTUzM6IDYuMSBNRURJVU0pOiB0aWZmIGh0dHBzOi8vd2ViLm52ZC5uaXN0
Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0xMzU1ICoNCg0KdGhlcmUg
aXMgYSBwYXRjaCBvbiBtbCBmb3IgdGhpcy4NCg0KPiBDVkUtMjAyMi0zMDk5IChDVlNTMzog
Ny44IEhJR0gpOiB2aW0gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRh
aWw/dnVsbklkPUNWRS0yMDIyLTMwOTkgKg0KPiBDVkUtMjAyMi0zMTM0IChDVlNTMzogNy44
IEhJR0gpOiB2aW0gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDIyLTMxMzQgKg0KDQpSaWNoYXJkIHNlbnQgYW4gdXBkYXRlIGhvcGVm
dWxseSBhZGRyZXNzaW5nIHRoaXMuDQoNCj4gQ1ZFLTIwMjItMzgxMjYgKENWU1MzOiA1LjUg
TUVESVVNKTogYmludXRpbHM6YmludXRpbHMtY3Jvc3MtdGVzdHN1aXRlOmJpbnV0aWxzLWNy
b3NzLXg4Nl82NCBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92
dWxuSWQ9Q1ZFLTIwMjItMzgxMjYgKg0KPiBDVkUtMjAyMi0zODEyNyAoQ1ZTUzM6IDUuNSBN
RURJVU0pOiBiaW51dGlsczpiaW51dGlscy1jcm9zcy10ZXN0c3VpdGU6YmludXRpbHMtY3Jv
c3MteDg2XzY0IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1
bG5JZD1DVkUtMjAyMi0zODEyNyAqDQoNCnNlbnQgYSBwYXRjaCB0byBtbCB0byBpZ25vcmUg
dGhlc2UgdHdvIHNpbmNlIHRoZXkgYXJlIGZpeGVkIGluIG91ciANCnZlcnNpb24gb2YgYmlu
dXRpbHMuDQoNCj4gQ1ZFLTIwMjItMzgxMjggKENWU1MzOiA1LjUgTUVESVVNKTogYmludXRp
bHM6YmludXRpbHMtY3Jvc3MtdGVzdHN1aXRlOmJpbnV0aWxzLWNyb3NzLXg4Nl82NCBodHRw
czovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjIt
MzgxMjggKg0KDQp0aGlzIGlzIGZpeGVkIGluIGJpbnV0aWxzIG1hc3Rlciwgd2lsbCBuZWVk
IHNvbWUgYmFja3BvcnRpbmcgc2luY2UgaXQgDQpkZXBlbmRzIG9uIHNvbWUgbW9yZSBwYXRj
aGVzIGZyb20gbWFzdGVyLg0KDQo+IENWRS0yMDIyLTM5MDI4IChDVlNTMzogNy41IEhJR0gp
OiBpbmV0dXRpbHMgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDIyLTM5MDI4ICoNCg0Kc2VudCBhIHBhdGNoIGZvciB0aGlzLg0KDQo+
IENWRS0yMDIyLTM5MDQ2IChDVlNTMzogNS4zIE1FRElVTSk6IGdsaWJjIGh0dHBzOi8vd2Vi
Lm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0zOTA0NiAq
DQo+IA0KDQpzZW50IGEgcGF0Y2ggZm9yIHRoaXMuDQoNCg0KPiBGb3IgZnVydGhlciBpbmZv
cm1hdGlvbiBzZWU6IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL25vbi1yZWxl
YXNlL3BhdGNobWV0cmljcy8NCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTcwNTE4KTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzA1MTgNCj4gTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTM2MTE1
NDQvMTk5NzkxNA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jhai5raGVtQGdtYWls
LmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=
--------------sVBailUHAkEKUbR5f80N7MHx
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------sVBailUHAkEKUbR5f80N7MHx--

--------------ASkuz5a0wqEi8f6HKXWfA00o--

--------------kVp4qPtlxVByt2649top1zM9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCYx/guQUDAAAAAAAKCRC7BTNVkZ0zFPyo
AKCFlJL/ebtSNTnK28uorB0k3rlM9wCeJBv7fCxzqtY2xVxo2G6cK0fZ4GQ=
=qUUx
-----END PGP SIGNATURE-----

--------------kVp4qPtlxVByt2649top1zM9--

