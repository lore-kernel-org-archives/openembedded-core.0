Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09472C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 18:09:25 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.20218.1672855760263763196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 10:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pq8w/KjM;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id y1so1146686plb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 10:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7AAE8OtDzWfIt81qwkeY3BY/cNSZufoYwE3TKoY8NkY=;
        b=pq8w/KjMA73inv4FKHlEwoVYMMDGUGCR/i2j60OeKC0zBsejaWKpmBlP5bPVRx4yR7
         IHg3RrjDgjJyPQzt7IbuR3f1IGhXC4E6PFSKDYRCMW1dEfsxWCifKG1bX3cWdkElrnwA
         4YciCHZqgSTXjBv8EMyPFBcBikFQcNDda58i8Qs8obK8enlFzKXEF1PJ0ZU/ewYqYIM2
         m05fnkpq59BPD0XtTHRQ8HibPgBOU8nzePVjw0y+PRYgpFT7boT84BBa8bL5La1I8Agb
         25picPe/Ks8lJqH1lgYvonjDVMnHdKMOeLfXi8nS6YhCXmEzXwscgcQDJr05zzHji5cX
         K/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7AAE8OtDzWfIt81qwkeY3BY/cNSZufoYwE3TKoY8NkY=;
        b=8BCqEZF9RIeBuWc7F3g1zcJcYteBNe7GelmQYK/fsHJqoZsflNkTMK7Potf53QMk2V
         BdLIMwdOEwmQVvjIq/4z22IkFWzHhCdJc6uhFtUq2OLQAv++mY9E09g+hJOcZPrb0Zkg
         crqBmxAt2VGfoW0bWOTRjSOVRLh/njcl4fa/1HTqASe70JU5G5a0ZC8BXzOngYUngLBS
         tebHRjf5Fhmv/RM27IBZ3s5V4wWbgUvcCSFHVZMH2yEvxMmUm9ocVihkypCyWvAGkZzy
         3eBGLFN0Hq2zSeF/C+GVqJL7rjAAzMEi8vm1/uT1gWl2hssWHvUGgFLIO5TmXLjfTDuW
         svew==
X-Gm-Message-State: AFqh2kpzRT3lROzkxxC6Ip9SWKOGDhraw3L4900uFPesDZwqTWngvr/T
	C7I5BO+cg/j44UJA0+LfJCY=
X-Google-Smtp-Source: AMrXdXuogbr3+UAzxO5OSeTs5ZoSWVs7ebsAtCYpG0hPRJ1/l6ncnHSupy6pdO2cuTa0G5JOXL9JQA==
X-Received: by 2002:a17:902:ccc4:b0:186:e434:6265 with SMTP id z4-20020a170902ccc400b00186e4346265mr60246400ple.2.1672855759388;
        Wed, 04 Jan 2023 10:09:19 -0800 (PST)
Received: from ?IPV6:2601:646:9181:1cf0:9863:ec0a:9928:ce36? ([2601:646:9181:1cf0:9863:ec0a:9928:ce36])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902e84100b00189e7cb8b89sm14287367plg.127.2023.01.04.10.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 10:09:18 -0800 (PST)
Message-ID: <a3fed81d-5310-ae68-4ef6-4aa8162a8b8e@gmail.com>
Date: Wed, 4 Jan 2023 10:09:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [OE-core] [PATCH 03/77] ethtool: upgrade 6.0 -> 6.1
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
 <20230104110548.2537259-3-alex@linutronix.de>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230104110548.2537259-3-alex@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BenIM8afzEHfQ70ip9d7WbW0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 18:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175503

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BenIM8afzEHfQ70ip9d7WbW0
Content-Type: multipart/mixed; boundary="------------kOHoWuhq8tXSDR6XosNjfYvY";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Message-ID: <a3fed81d-5310-ae68-4ef6-4aa8162a8b8e@gmail.com>
Subject: Re: [OE-core] [PATCH 03/77] ethtool: upgrade 6.0 -> 6.1
References: <20230104110548.2537259-1-alex@linutronix.de>
 <20230104110548.2537259-3-alex@linutronix.de>
In-Reply-To: <20230104110548.2537259-3-alex@linutronix.de>

--------------kOHoWuhq8tXSDR6XosNjfYvY
Content-Type: multipart/mixed; boundary="------------k42iG00NulLKwjnioxYPCrZT"

--------------k42iG00NulLKwjnioxYPCrZT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMS80LzIzIDM6MDQgQU0sIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPg0KPiAtLS0N
Cj4gICAuLi4vMDAwMS1tYXJ2ZWxsLmMtZGVmaW5lLV9HTlVfU09VUkNFLnBhdGNoICAgfCAy
NiArKysrKysrKysrKysrKysrKysrDQo+ICAgLi4uL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxf
dGVzdHMucGF0Y2ggICAgICAgIHwgIDYgKystLS0NCj4gICAuLi4ve2V0aHRvb2xfNi4wLmJi
ID0+IGV0aHRvb2xfNi4xLmJifSAgICAgICAgfCAgMyArKy0NCj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDMxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvMDAwMS1tYXJ2
ZWxsLmMtZGVmaW5lLV9HTlVfU09VUkNFLnBhdGNoDQo+ICAgcmVuYW1lIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9ldGh0b29sL3tldGh0b29sXzYuMC5iYiA9PiBldGh0b29sXzYuMS5iYn0g
KDkwJSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sLzAwMDEtbWFydmVsbC5jLWRlZmluZS1fR05VX1NPVVJDRS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvMDAwMS1tYXJ2ZWxsLmMtZGVm
aW5lLV9HTlVfU09VUkNFLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAuLmYwZDRjNTQ1OTYNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sLzAwMDEtbWFydmVsbC5jLWRlZmlu
ZS1fR05VX1NPVVJDRS5wYXRjaA0KPiBAQCAtMCwwICsxLDI2IEBADQo+ICtGcm9tIDAxODM1
Y2UyMGYwNjA1ZjE0NTgzNjVlNjc5MTM3ZWE2NWMyNmFhNDggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxDQo+ICtGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRl
Pg0KPiArRGF0ZTogTW9uLCAyIEphbiAyMDIzIDEzOjQ1OjQ2ICswMTAwDQo+ICtTdWJqZWN0
OiBbUEFUQ0hdIG1hcnZlbGwuYzogZGVmaW5lIF9HTlVfU09VUkNFDQo+ICsNCj4gK090aGVy
d2lzZSB1X2ludDMyX3QgaXMgbm90IGRlZmluZWQgdW5kZXIgbXVzbCBDIGxpYnJhcnkuDQo+
ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtieSBlbWFpbCB0byBta3ViZWNl
a0BzdXNlLmN6XQ0KPiArU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhA
bGludXRyb25peC5kZT4NCj4gKy0tLQ0KPiArIG1hcnZlbGwuYyB8IDIgKysNCj4gKyAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9tYXJ2
ZWxsLmMgYi9tYXJ2ZWxsLmMNCj4gK2luZGV4IGQzZDU3MGUuLjg2ZjFkNDYgMTAwNjQ0DQo+
ICstLS0gYS9tYXJ2ZWxsLmMNCj4gKysrKyBiL21hcnZlbGwuYw0KPiArQEAgLTUsNiArNSw4
IEBADQo+ICsgICogIFN0ZXBoZW4gSGVtbWluZ2VyIDxzaGVtbWluZ2VyQG9zZGwub3JnPg0K
PiArICAqLw0KPiArDQo+ICsrI2RlZmluZSBfR05VX1NPVVJDRQ0KDQpJdCBpcyBwcm9iYWJs
eSBiZXR0ZXIgdG8gcmVwbGFjZSB1X2ludDMyX3Qgd2l0aCB1aW50MzJfdCBmcm9tIHN0ZGlu
dC5oIA0KaW5zdGVhZCB3aGljaCBpcyBtb3JlIHBvcnRhYmxlIHRoYW4gdV9pbnQzMl90IG1v
cmVvdmVyIHVzaW5nIF9HTlVfU09VUkNFIA0KZmVhdHVyZSBtYWNybyBpcyBhbHNvIG5vdCBu
ZWVkZWQuDQoNCj4gKysNCj4gKyAjaW5jbHVkZSA8c3RkaW8uaD4NCj4gKw0KPiArICNpbmNs
dWRlICJpbnRlcm5hbC5oIg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0
Y2gNCj4gaW5kZXggYzNjZWZiYjVlNi4uNDk5NDM2OTY4MiAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0
cy5wYXRjaA0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29s
L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoDQo+IEBAIC0xLDQgKzEsNCBAQA0KPiAtRnJv
bSBkZWE5MGFiNzExYWNhZDI1MWI1ZDg1MzZjNTM0NDA5OTc5ZWE4YmU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KPiArRnJvbSAwZDA2NmE5MDEyOTJlNmE0NGZmN2JjN2VlMTZmOTlk
ZDJiYTRlYTE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiAgIEZyb206IFR1ZG9yIEZs
b3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPg0KPiAgIERhdGU6IFdlZCwgMjggTWF5IDIw
MTQgMTg6NTk6NTQgKzAyMDANCj4gICBTdWJqZWN0OiBbUEFUQ0hdIGV0aHRvb2w6IHVzZSBz
ZXJpYWwtdGVzdHMgY29uZmlnIG5lZWRlZCBieSBwdGVzdC4NCj4gQEAgLTE1LDExICsxNSwx
MSBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUNCj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ICAgDQo+ICAgZGlmZiAtLWdp
dCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYw0KPiAtaW5kZXggODlkMGU3MC4uYWIy
YmU5YyAxMDA2NDQNCj4gK2luZGV4IDNlYjRlN2IuLmVlNWM3MmYgMTAwNjQ0DQo+ICAgLS0t
IGEvY29uZmlndXJlLmFjDQo+ICAgKysrIGIvY29uZmlndXJlLmFjDQo+ICAgQEAgLTIsNyAr
Miw3IEBAIGRubCBQcm9jZXNzIHRoaXMgZmlsZSB3aXRoIGF1dG9jb25mIHRvIHByb2R1Y2Ug
YSBjb25maWd1cmUgc2NyaXB0Lg0KPiAtIEFDX0lOSVQoZXRodG9vbCwgNi4wLCBuZXRkZXZA
dmdlci5rZXJuZWwub3JnKQ0KPiArIEFDX0lOSVQoZXRodG9vbCwgNi4xLCBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnKQ0KPiAgICBBQ19QUkVSRVEoMi41MikNCj4gICAgQUNfQ09ORklHX1NS
Q0RJUihbZXRodG9vbC5jXSkNCj4gICAtQU1fSU5JVF9BVVRPTUFLRShbZ251IHN1YmRpci1v
YmplY3RzXSkNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29s
L2V0aHRvb2xfNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9v
bF82LjEuYmINCj4gc2ltaWxhcml0eSBpbmRleCA5MCUNCj4gcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjAuYmINCj4gcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi4xLmJiDQo+IGluZGV4IDhm
MzY1MjBiMDAuLjJiOWJiZTY5ZGIgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9ldGh0b29sL2V0aHRvb2xfNi4wLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9ldGh0b29sL2V0aHRvb2xfNi4xLmJiDQo+IEBAIC05LDkgKzksMTAgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4
MGZkYWY0YTQyNjMgXA0KPiAgIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9zb2Z0
d2FyZS9uZXR3b3JrL2V0aHRvb2wvZXRodG9vbC0ke1BWfS50YXIuZ3ogXA0KPiAgICAgICAg
ICAgICAgZmlsZTovL3J1bi1wdGVzdCBcDQo+ICAgICAgICAgICAgICBmaWxlOi8vYXZvaWRf
cGFyYWxsZWxfdGVzdHMucGF0Y2ggXA0KPiArICAgICAgICAgICBmaWxlOi8vMDAwMS1tYXJ2
ZWxsLmMtZGVmaW5lLV9HTlVfU09VUkNFLnBhdGNoIFwNCj4gICAgICAgICAgICAgICINCj4g
ICANCj4gLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMjE2OGUyYjQ1ZDdlNThlZDViNzZlNTUz
M2ZkNjA3Y2EwNzIwYzllNjMxZjQyNzFiZmU5OTdiZjcyMzMwNzk2Ig0KPiArU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjFkMDNmMWNlMzI0ZmJkOTU1OTExOTFjNDJhYzBjNGM5Y2M3MjFlMDY3
YjkyOTA4M2EyMGE0NmM0YjQ3MzE0MzYiDQo+ICAgDQo+ICAgVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvZXRodG9v
bC8iDQo+ICAgDQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBW
aWV3L1JlcGx5IE9ubGluZSAoIzE3NTM4OCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTc1Mzg4DQo+IE11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzk2MDQ3ODcwLzE5OTc5
MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
--------------k42iG00NulLKwjnioxYPCrZT
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------k42iG00NulLKwjnioxYPCrZT--

--------------kOHoWuhq8tXSDR6XosNjfYvY--

--------------BenIM8afzEHfQ70ip9d7WbW0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCY7XAzAUDAAAAAAAKCRC7BTNVkZ0zFFWh
AJ4/YIZ+X0zmUnRlMByUWojUP31CEQCfbhi7k2tjsBWpTsdzcg8Oc/d7BDw=
=i6Kk
-----END PGP SIGNATURE-----

--------------BenIM8afzEHfQ70ip9d7WbW0--

