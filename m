Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC2CC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 15:51:53 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.9195.1655913110088368962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f9MnL90M;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso121196pjk.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=YMPT+EQxQ73zG9jhhXGiVOZ0TiNoUzrY6B/ZP2r/ldQ=;
        b=f9MnL90M3ud8rjKM5aslPlp6faEhMI+aOjxVJwyWuuvkRtBc06JvO/e4kneZgzt4jd
         Z11wdVktZyjRdwjavPru8pRQLTYS9SUeF4wP+0pBGKAcPVnXRhogBy9ln1FM9Q6v7Fks
         AM5uLO6ftWOyN8Tw/N789GsoLHHDSgOxAQPvbqTOndEeLaa6DpXYH7lIFxm2jE0H0xeL
         2YmEtuLeG9Xf/w1k86QyPtnWkpPupC5E7fVdeVBrphxog1WhideA8/mefqabZbXb+gBw
         H//r2q0TAP4sAnPQlRRwoFAMCMxMvHF1zwBwNtObIDeCL++SBr9Mnf1hW9jclwk1Eiys
         cOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=YMPT+EQxQ73zG9jhhXGiVOZ0TiNoUzrY6B/ZP2r/ldQ=;
        b=f4HJZ5F8kSEz8nRWu+2qNch0xSBdtnHmZd9K3SkdfpLZatUW1SXNw4EbrntYZ9WTLX
         f40x5DOtVlnAZWtUwv/gOYYBV4aN4wuLqknngQzcXP+ArcNJK0tSNtkIGfFSyT/rPrJe
         ynyWcHuG0dc4wol6nBCmjIwKHh1rovRjfJJqDGq/zyRoS2/S+KfW/hm+OC3gNewDn1IB
         O7NUIHmncpwFcQm8JPDG3n6TzpBEjh72Zig61pgkst9hKOK1iSP96xLImgMCP01PtAFl
         UneSjhvI4bzh29sO317EYwjGf2ieJhAsdhUPJlIETbf8ZOXInEHGJ68FUcLq8H1ZgMN3
         De4g==
X-Gm-Message-State: AJIora8XKP3nS6lskcyTOSTlAO2i6bVod+1h4i765TopqkRGMYD3hRUt
	1Uo+Em213xeF38ADmC1hTYM=
X-Google-Smtp-Source: 
 AGRyM1vXkLbq4L78/+YEHDD/YNhWlc4/UAEI0jyYGm8FYBTp/Pt0j7emwSjypco92LmCe2TjyRXvBQ==
X-Received: by 2002:a17:902:be12:b0:167:6cbd:f113 with SMTP id
 r18-20020a170902be1200b001676cbdf113mr34903959pls.69.1655913109321;
        Wed, 22 Jun 2022 08:51:49 -0700 (PDT)
Received: from ?IPV6:2406:b400:d1:49a:e5d4:faa9:62ed:3a3e?
 ([2406:b400:d1:49a:e5d4:faa9:62ed:3a3e])
        by smtp.gmail.com with ESMTPSA id
 n89-20020a17090a5ae200b001e880972840sm14690448pji.29.2022.06.22.08.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 08:51:46 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------Hv55zv3m00YPTSBZYTVZqqxA"
Message-ID: <af3cd90e-da65-a636-f1c7-033a485a9faa@gmail.com>
Date: Wed, 22 Jun 2022 21:21:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.61.0 FAILED
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Randy MacLeod <randy.macleod@windriver.com>
References: 
 <01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
 <260249af-2c6a-dbde-96a3-65a80c451ea8@windriver.com>
 <CANNYZj_WDmAaji4tiUQi9=w1bwMTQ810tO-HUXqroSMAZa21Mg@mail.gmail.com>
 <429629c2-95d3-7a9f-df3f-e8ddf2ba5b2f@gmail.com>
 <CANNYZj--fTwahYe2e1O1tSssrMK+jPNVDRsRuoP-SVnDtCf8JA@mail.gmail.com>
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
In-Reply-To: 
 <CANNYZj--fTwahYe2e1O1tSssrMK+jPNVDRsRuoP-SVnDtCf8JA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 15:51:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167244

This is a multi-part message in MIME format.
--------------Hv55zv3m00YPTSBZYTVZqqxA
Content-Type: multipart/alternative;
 boundary="------------N4gMTqyxs3mbOdbHItuMqT04"

--------------N4gMTqyxs3mbOdbHItuMqT04
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIvMDYvMjIgMTQ6MDIsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiBDYW4geW91
IHB1Ymxpc2ggeW91ciB3b3JrIHNvbWV3aGVyZSBvbiBnaXQgc28gSSBjYW4gcmVwcm9kdWNl
IHRoZQ0KPiBuYXRpdmVzZGsgaXNzdWUgbG9jYWxseT8NCg0KSGVsbG8sDQoNCkFzIEkgZG8g
bm90IGhhdmUgcGVybWlzc2lvbiB0byBjcmVhdGUgbXkgb3duIHJlbW90ZSByZXBvLCBJIGF0
dGFjaGVkIG15IA0KY2hhbmdlcyBoZXJlIGluIC9teXBhdGNoLnBhdGNoLyBmaWxlLiBJZiBs
aWJzdGRjKysuYSBpcyBhdmFpbGFibGUgaW4gDQovdXNyL2xpYi9nY2MvIHRoZSBpc3N1ZSBj
YW5ub3QgYmUgcmVwcm9kdWNlZCAoVGhlIGxpYiBwYXRoIHdpbGwgYmUgdGFrZW4gDQpmcm9t
IHRoZXJlKS4gSW4gYWRkaXRpb24gYmVsb3cgYXJlIHRoZSAvbG9jYWwuY29uZiAvY2hhbmdl
cy4NCg0KL1RPT0xDSEFJTl9IT1NUX1RBU0s6YXBwZW5kID0gIiBnY2MgZysrIGxpYmdjYyBs
aWJnY2MtZGV2IGxpYnN0ZGMrKyANCmxpYnN0ZGMrKy1kZXYgbGlic3RkYysrLXN0YXRpY2Rl
diBsaWJzdGRjKystc3RhdGljZGV2IA0KbmF0aXZlc2RrLWxpYnN0ZGMrKy1kZXYgbmF0aXZl
c2RrLWxpYnN0ZGMrKy1zdGF0aWNkZXYgDQpwYWNrYWdlZ3JvdXAtcnVzdC1jcm9zcy1jYW5h
ZGlhbi0ke01BQ0hJTkV9IA0KcGFja2FnZWdyb3VwLWNyb3NzLWNhbmFkaWFuLSR7TUFDSElO
RX0iDQoNClRPT0xDSEFJTl9UQVJHRVRfVEFTSzphcHBlbmQgPSAiIGxpYnN0ZGMrKy1zdGF0
aWNkZXYiLw0KDQoNCihOb3RlOiBBcyBJIHRyaWVkIG11bHRpcGxlIHdheXMgdGhlIGFkZGl0
aW9ucy9jaGFuZ2VzIGluIHRoZSBhdHRhY2hlZCANCnBhdGNoIG1heSBiZSB2YWd1ZS4pDQoN
Cg0KDQpUaGFua3MsDQoNClN1bmRlZXAgSy4NCg0KPg0KPiBLaGVtLCBjYW4geW91IGhlbHAg
dXMgb3V0IHBsZWFzZSB3aXRoIGl0PyA6KQ0KPg0KPiBBbHNvIEknbSBzdGFydGluZyB0byB3
b25kZXIgaWYgd2Ugc2hvdWxkIHBhdGNoIHJ1c3Qgd2l0aCBhIHdvcmthcm91bmQNCj4gZnJv
bSB0aGUgdGlja2V0IGluc3RlYWQ/DQo+DQo+DQo+IEFsZXgNCj4NCj4gT24gV2VkLCAyMiBK
dW4gMjAyMiBhdCAwODoyNCwgU3VuZGVlcCBLT0tLT05EQQ0KPiA8c3VuZGVlcC5rb2trb25k
YUBnbWFpbC5jb20+ICB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IEluIFlvY3RvLCB0aGUgUnVz
dCB1cGdyYWRlIGZyb20gMS42MC4wIC0+IDEuNjEuMCBlbmFibGVzIGEgZGVwZW5kZW5jeSBv
biB0aGUgbGlic3RkYysrLXN0YXRpYyBsaWJyYXJ5IGZvciBydXN0LWxsdm0uIFdpdGggdGhp
cyB1cGdyYWRlIGJ1aWxkIGlzIGFib3J0ZWQgZm9yICdiaXRiYWtlIGNvcmUtaW1hZ2UtbWlu
aW1hbCAtY3BvcHVsYXRlX3Nkaycgd2l0aCBiZWxvdyBlcnJvci4NCj4+DQo+PiA9PT09PT09
IEVycm9yIFRleHQgPT09PT09PQ0KPj4gfCBlcnJvcjogY291bGQgbm90IGNvbXBpbGUgYHJ1
c3RjX2xsdm1gIGR1ZSB0byBwcmV2aW91cyBlcnJvcg0KPj4gfA0KPj4gfCBDYXVzZWQgYnk6
DQo+PiB8ICAgcHJvY2VzcyBkaWRuJ3QgZXhpdCBzdWNjZXNzZnVsbHk6IGAvaG9tZS9wb2t5
YnVpbGQveW9jdG8td29ya2VyL3FlbXVtaXBzLWFsdC9idWlsZC9idWlsZC90bXAvd29yay94
ODZfNjQtbGludXgvcnVzdC1uYXRpdmUvMS42MS4wLXIwL3J1c3RjLTEuNjEuMC1zcmMvYnVp
bGQvYm9vdHN0cmFwL2RlYnVnL3J1c3RjIC0tY3JhdGUtbmFtZSBydXN0Y19sbHZtIC0tZWRp
dGlvbj0yMDIxIGNvbXBpbGVyL3J1c3RjX2xsdm0vc3JjL2xpYi5ycyAtLWVycm9yLWZvcm1h
dD1qc29uIC0tanNvbj1kaWFnbm9zdGljLXJlbmRlcmVkLWFuc2ksYXJ0aWZhY3RzLGZ1dHVy
ZS1pbmNvbXBhdCAtLWNyYXRlLXR5cGUgbGliIC0tZW1pdD1kZXAtaW5mbyxtZXRhZGF0YSxs
aW5rIC1DIG9wdC1sZXZlbD0zIC1DIGVtYmVkLWJpdGNvZGU9bm8gLUMgZGVidWdpbmZvPTAg
LUMgbWV0YWRhdGE9NWFjYzE3ZmZiM2NlNDRhOSAtQyBleHRyYS1maWxlbmFtZT0tNWFjYzE3
ZmZiM2NlNDRhOSAtLW91dC1kaXIgL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11
bWlwcy1hbHQvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3J1c3QtbmF0aXZl
LzEuNjEuMC1yMC9ydXN0Yy0xLjYxLjAtc3JjL2J1aWxkL3g4Nl82NC11bmtub3duLWxpbnV4
LWdudS9zdGFnZTAtcnVzdGMveDg2XzY0LXVua25vd24tbGludXgtZ251L3JlbGVhc2UvZGVw
cyAtLXRhcmdldCB4ODZfNjQtdW5rbm93bi1saW51eC1nbnUgLUMgbGlua2VyPS9ob21lL3Bv
a3lidWlsZC95b2N0by13b3JrZXIvcWVtdW1pcHMtYWx0L2J1aWxkL2J1aWxkL3RtcC93b3Jr
L3g4Nl82NC1saW51eC9ydXN0LW5hdGl2ZS8xLjYxLjAtcjAvd3JhcHBlci9idWlsZC1ydXN0
LWNjbGQgLUwgZGVwZW5kZW5jeT0vaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXVt
aXBzLWFsdC9idWlsZC9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvcnVzdC1uYXRpdmUv
MS42MS4wLXIwL3J1c3RjLTEuNjEuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGludXgt
Z251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9kZXBz
IC1MIGRlcGVuZGVuY3k9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11bWlwcy1h
bHQvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3J1c3QtbmF0aXZlLzEuNjEu
MC1yMC9ydXN0Yy0xLjYxLjAtc3JjL2J1aWxkL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9z
dGFnZTAtcnVzdGMvcmVsZWFzZS9kZXBzIC0tZXh0ZXJuIGxpYmM9L2hvbWUvcG9reWJ1aWxk
L3lvY3RvLXdvcmtlci9xZW11bWlwcy1hbHQvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0
LWxpbnV4L3J1c3QtbmF0aXZlLzEuNjEuMC1yMC9ydXN0Yy0xLjYxLjAtc3JjL2J1aWxkL3g4
Nl82NC11bmtub3duLWxpbnV4LWdudS9zdGFnZTAtcnVzdGMveDg2XzY0LXVua25vd24tbGlu
dXgtZ251L3JlbGVhc2UvZGVwcy9saWJsaWJjLWJlOGYyNWQ3YzVjMGEwNTkucm1ldGEgLS1j
Zmc9Ym9vdHN0cmFwIC1Dc3ltYm9sLW1hbmdsaW5nLXZlcnNpb249djAgLVptYWNyby1iYWNr
dHJhY2UgLUNsaW5rLWFyZ3M9LVdsLC16LG9yaWdpbiAnLUNsaW5rLWFyZ3M9LVdsLC1ycGF0
aCwkT1JJR0lOLy4uL2xpYicgLVp0bHMtbW9kZWw9aW5pdGlhbC1leGVjIC1adW5zdGFibGUt
b3B0aW9ucyAnLVdydXN0Yzo6aW50ZXJuYWwnIC1DcHJlZmVyLWR5bmFtaWMgLVogYmluYXJ5
LWRlcC1kZXBpbmZvIC1MIG5hdGl2ZT0vaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL3Fl
bXVtaXBzLWFsdC9idWlsZC9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvcnVzdC1uYXRp
dmUvMS42MS4wLXIwL3J1c3RjLTEuNjEuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGlu
dXgtZ251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9i
dWlsZC9ydXN0Y19sbHZtLTY4ODA1MWU4YzcyMGY1YTkvb3V0IC1MIG5hdGl2ZT0vaG9tZS9w
b2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXVtaXBzLWFsdC9idWlsZC9idWlsZC90bXAvd29y
ay94ODZfNjQtbGludXgvcnVzdC1uYXRpdmUvMS42MS4wLXIwL3JlY2lwZS1zeXNyb290LW5h
dGl2ZS91c3IvbGliL2xsdm0tcnVzdC9saWIgLUwgbmF0aXZlPS9ob21lL3Bva3lidWlsZC95
b2N0by13b3JrZXIvcWVtdW1pcHMtYWx0L2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1s
aW51eC9ydXN0LWxsdm0tbmF0aXZlLzEuNjEuMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUv
dXNyL2xpYiAtTCBuYXRpdmU9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11bWlw
cy1hbHQvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3J1c3QtbGx2bS1uYXRp
dmUvMS42MS4wLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgLUwgbmF0aXZlPSAtLWNm
ZyAnbGx2bV9jb21wb25lbnQ9ImFhcmNoNjQiJyAtLWNmZyAnbGx2bV9jb21wb25lbnQ9ImFy
bSInIC0tY2ZnICdsbHZtX2NvbXBvbmVudD0iYXNtcGFyc2VyIicgLS1jZmcgJ2xsdm1fY29t
cG9uZW50PSJiaXRyZWFkZXIiJyAtLWNmZyAnbGx2bV9jb21wb25lbnQ9ImJpdHdyaXRlciIn
IC0tY2ZnICdsbHZtX2NvbXBvbmVudD0iY292ZXJhZ2UiJyAtLWNmZyAnbGx2bV9jb21wb25l
bnQ9Imluc3RydW1lbnRhdGlvbiInIC0tY2ZnICdsbHZtX2NvbXBvbmVudD0iaXBvIicgLS1j
ZmcgJ2xsdm1fY29tcG9uZW50PSJsaW5rZXIiJyAtLWNmZyAnbGx2bV9jb21wb25lbnQ9Imx0
byInIC0tY2ZnICdsbHZtX2NvbXBvbmVudD0ibWlwcyInIC0tY2ZnICdsbHZtX2NvbXBvbmVu
dD0icG93ZXJwYyInIC0tY2ZnICdsbHZtX2NvbXBvbmVudD0icmlzY3YiJyAtLWNmZyAnbGx2
bV9jb21wb25lbnQ9Ing4NiInIC1sIHN0YXRpYz1sbHZtLXdyYXBwZXIgLWwgc3RhdGljPUxM
Vk1YODZUYXJnZXRNQ0EgLWwgc3RhdGljPUxMVk1NQ0EgLWwgc3RhdGljPUxMVk1YODZEaXNh
c3NlbWJsZXIgLWwgc3RhdGljPUxMVk1YODZBc21QYXJzZXIgLWwgc3RhdGljPUxMVk1YODZD
b2RlR2VuIC1sIHN0YXRpYz1MTFZNWDg2RGVzYyAtbCBzdGF0aWM9TExWTVg4NkluZm8gLWwg
c3RhdGljPUxMVk1SSVNDVkRpc2Fzc2VtYmxlciAtbCBzdGF0aWM9TExWTVJJU0NWQXNtUGFy
c2VyIC1sIHN0YXRpYz1MTFZNUklTQ1ZDb2RlR2VuIC1sIHN0YXRpYz1MTFZNUklTQ1ZEZXNj
IC1sIHN0YXRpYz1MTFZNUklTQ1ZJbmZvIC1sIHN0YXRpYz1MTFZNUG93ZXJQQ0Rpc2Fzc2Vt
YmxlciAtbCBzdGF0aWM9TExWTVBvd2VyUENBc21QYXJzZXIgLWwgc3RhdGljPUxMVk1Qb3dl
clBDQ29kZUdlbiAtbCBzdGF0aWM9TExWTVBvd2VyUENEZXNjIC1sIHN0YXRpYz1MTFZNUG93
ZXJQQ0luZm8gLWwgc3RhdGljPUxMVk1NaXBzRGlzYXNzZW1ibGVyIC1sIHN0YXRpYz1MTFZN
TWlwc0FzbVBhcnNlciAtbCBzdGF0aWM9TExWTU1pcHNDb2RlR2VuIC1sIHN0YXRpYz1MTFZN
TWlwc0Rlc2MgLWwgc3RhdGljPUxMVk1NaXBzSW5mbyAtbCBzdGF0aWM9TExWTUxUTyAtbCBz
dGF0aWM9TExWTVBhc3NlcyAtbCBzdGF0aWM9TExWTUNvcm91dGluZXMgLWwgc3RhdGljPUxM
Vk1PYmpDQVJDT3B0cyAtbCBzdGF0aWM9TExWTUV4dGVuc2lvbnMgLWwgc3RhdGljPUxMVk1D
b3ZlcmFnZSAtbCBzdGF0aWM9TExWTUFSTURpc2Fzc2VtYmxlciAtbCBzdGF0aWM9TExWTUFS
TUFzbVBhcnNlciAtbCBzdGF0aWM9TExWTUFSTUNvZGVHZW4gLWwgc3RhdGljPUxMVk1pcG8g
LWwgc3RhdGljPUxMVk1JbnN0cnVtZW50YXRpb24gLWwgc3RhdGljPUxMVk1WZWN0b3JpemUg
LWwgc3RhdGljPUxMVk1MaW5rZXIgLWwgc3RhdGljPUxMVk1JUlJlYWRlciAtbCBzdGF0aWM9
TExWTUFzbVBhcnNlciAtbCBzdGF0aWM9TExWTUZyb250ZW5kT3Blbk1QIC1sIHN0YXRpYz1M
TFZNQVJNRGVzYyAtbCBzdGF0aWM9TExWTUFSTVV0aWxzIC1sIHN0YXRpYz1MTFZNQVJNSW5m
byAtbCBzdGF0aWM9TExWTUFBcmNoNjREaXNhc3NlbWJsZXIgLWwgc3RhdGljPUxMVk1NQ0Rp
c2Fzc2VtYmxlciAtbCBzdGF0aWM9TExWTUFBcmNoNjRBc21QYXJzZXIgLWwgc3RhdGljPUxM
Vk1BQXJjaDY0Q29kZUdlbiAtbCBzdGF0aWM9TExWTUNGR3VhcmQgLWwgc3RhdGljPUxMVk1H
bG9iYWxJU2VsIC1sIHN0YXRpYz1MTFZNU2VsZWN0aW9uREFHIC1sIHN0YXRpYz1MTFZNQXNt
UHJpbnRlciAtbCBzdGF0aWM9TExWTURlYnVnSW5mb01TRiAtbCBzdGF0aWM9TExWTUNvZGVH
ZW4gLWwgc3RhdGljPUxMVk1UYXJnZXQgLWwgc3RhdGljPUxMVk1TY2FsYXJPcHRzIC1sIHN0
YXRpYz1MTFZNSW5zdENvbWJpbmUgLWwgc3RhdGljPUxMVk1BZ2dyZXNzaXZlSW5zdENvbWJp
bmUgLWwgc3RhdGljPUxMVk1UcmFuc2Zvcm1VdGlscyAtbCBzdGF0aWM9TExWTUJpdFdyaXRl
ciAtbCBzdGF0aWM9TExWTUFuYWx5c2lzIC1sIHN0YXRpYz1MTFZNUHJvZmlsZURhdGEgLWwg
c3RhdGljPUxMVk1EZWJ1Z0luZm9EV0FSRiAtbCBzdGF0aWM9TExWTU9iamVjdCAtbCBzdGF0
aWM9TExWTVRleHRBUEkgLWwgc3RhdGljPUxMVk1NQ1BhcnNlciAtbCBzdGF0aWM9TExWTUJp
dFJlYWRlciAtbCBzdGF0aWM9TExWTUNvcmUgLWwgc3RhdGljPUxMVk1SZW1hcmtzIC1sIHN0
YXRpYz1MTFZNQml0c3RyZWFtUmVhZGVyIC1sIHN0YXRpYz1MTFZNQUFyY2g2NERlc2MgLWwg
c3RhdGljPUxMVk1BQXJjaDY0VXRpbHMgLWwgc3RhdGljPUxMVk1BQXJjaDY0SW5mbyAtbCBz
dGF0aWM9TExWTU1DIC1sIHN0YXRpYz1MTFZNRGVidWdJbmZvQ29kZVZpZXcgLWwgc3RhdGlj
PUxMVk1CaW5hcnlGb3JtYXQgLWwgc3RhdGljPUxMVk1TdXBwb3J0IC1sIHN0YXRpYz1MTFZN
RGVtYW5nbGUgLWwgZHlsaWI9cnQgLWwgZHlsaWI9ZGwgLWwgZHlsaWI9cHRocmVhZCAtbCBk
eWxpYj1tIC1sIHN0YXRpYz1zdGRjKytgIChleGl0IHN0YXR1czogMSkNCj4+IHwgd2Fybmlu
ZzogYnVpbGQgZmFpbGVkLCB3YWl0aW5nIGZvciBvdGhlciBqb2JzIHRvIGZpbmlzaC4uLg0K
Pj4gfCAgICAgQnVpbGRpbmcgWz09PT09PT09PT09PT09PT09PT09PiAgICBdIDE4Ni8yMTg6
IHJ1c3RjX2FzdF9wYXNzZXMsIHJ1c3RjX2UuLi4NCj4+IHwgICAgIEJ1aWxkaW5nIFs9PT09
PT09PT09PT09PT09PT09PT4gICAgXSAxODcvMjE4OiBydXN0Y19leHBhbmQsIHJ1c3RjX3Bh
cnNlLi4uDQo+PiB8ICAgICBCdWlsZGluZyBbPT09PT09PT09PT09PT09PT09PT0+ICAgIF0g
MTg4LzIxODogcnVzdGNfZXhwYW5kLCBydXN0Y19wYXJzZS4uLg0KPj4gfCAgICAgQnVpbGRp
bmcgWz09PT09PT09PT09PT09PT09PT09PiAgICBdIDE4OS8yMTg6IHJ1c3RjX3BhcnNlLCBy
dXN0Y19idWlsdGkuLi4NCj4+IHwgICAgIEJ1aWxkaW5nIFs9PT09PT09PT09PT09PT09PT09
PT4gICAgXSAxOTAvMjE4OiBydXN0Y19wYXJzZSwgcnVzdGNfbWlkZGxlDQo+PiB8ICAgICBC
dWlsZGluZyBbPT09PT09PT09PT09PT09PT09PT0+ICAgIF0gMTkxLzIxODogcnVzdGNfbWlk
ZGxlDQo+PiB8IGVycm9yOiBidWlsZCBmYWlsZWQNCj4+IHwgY29tbWFuZCBkaWQgbm90IGV4
ZWN1dGUgc3VjY2Vzc2Z1bGx5OiAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11
bWlwcy1hbHQvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3J1c3QtbmF0aXZl
LzEuNjEuMC1yMC9ydXN0LXNuYXBzaG90L2Jpbi9jYXJnbyIgImJ1aWxkIiAiLS10YXJnZXQi
ICJ4ODZfNjQtdW5rbm93bi1saW51eC1nbnUiICItWmJpbmFyeS1kZXAtZGVwaW5mbyIgIi1q
IiAiMTYiICItdiIgIi0tcmVsZWFzZSIgIi0tZnJvemVuIiAiLS1mZWF0dXJlcyIgImxsdm0g
bWF4X2xldmVsX2luZm8iICItLW1hbmlmZXN0LXBhdGgiICIvaG9tZS9wb2t5YnVpbGQveW9j
dG8td29ya2VyL3FlbXVtaXBzLWFsdC9idWlsZC9idWlsZC90bXAvd29yay94ODZfNjQtbGlu
dXgvcnVzdC1uYXRpdmUvMS42MS4wLXIwL3J1c3RjLTEuNjEuMC1zcmMvY29tcGlsZXIvcnVz
dGMvQ2FyZ28udG9tbCIgIi0tbWVzc2FnZS1mb3JtYXQiICJqc29uLXJlbmRlci1kaWFnbm9z
dGljcyINCj4+IHwgZXhwZWN0ZWQgc3VjY2VzcywgZ290OiBleGl0IHN0YXR1czogMTAxDQo+
PiB8IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCj4+IHwgICBGaWxlICIv
aG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXVtaXBzLWFsdC9idWlsZC9idWlsZC90
bXAvd29yay94ODZfNjQtbGludXgvcnVzdC1uYXRpdmUvMS42MS4wLXIwL3J1c3RjLTEuNjEu
MC1zcmMvc3JjL2Jvb3RzdHJhcC9ib290c3RyYXAucHkiLCBsaW5lIDEzNDEsIGluIDxtb2R1
bGU+DQo+PiB8ICAgICBtYWluKCkNCj4+IHwgICBGaWxlICIvaG9tZS9wb2t5YnVpbGQveW9j
dG8td29ya2VyL3FlbXVtaXBzLWFsdC9idWlsZC9idWlsZC90bXAvd29yay94ODZfNjQtbGlu
dXgvcnVzdC1uYXRpdmUvMS42MS4wLXIwL3J1c3RjLTEuNjEuMC1zcmMvc3JjL2Jvb3RzdHJh
cC9ib290c3RyYXAucHkiLCBsaW5lIDEzMjQsIGluIG1haW4NCj4+IHwgICAgIGJvb3RzdHJh
cChoZWxwX3RyaWdnZXJlZCkNCj4+IHwgICBGaWxlICIvaG9tZS9wb2t5YnVpbGQveW9jdG8t
d29ya2VyL3FlbXVtaXBzLWFsdC9idWlsZC9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgv
cnVzdC1uYXRpdmUvMS42MS4wLXIwL3J1c3RjLTEuNjEuMC1zcmMvc3JjL2Jvb3RzdHJhcC9i
b290c3RyYXAucHkiLCBsaW5lIDEzMTAsIGluIGJvb3RzdHJhcA0KPj4gfCAgICAgcnVuKGFy
Z3MsIGVudj1lbnYsIHZlcmJvc2U9YnVpbGQudmVyYm9zZSwgaXNfYm9vdHN0cmFwPVRydWUp
DQo+PiB8ICAgRmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11bWlwcy1h
bHQvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3J1c3QtbmF0aXZlLzEuNjEu
MC1yMC9ydXN0Yy0xLjYxLjAtc3JjL3NyYy9ib290c3RyYXAvYm9vdHN0cmFwLnB5IiwgbGlu
ZSAxODUsIGluIHJ1bg0KPj4gfCAgICAgcmFpc2UgUnVudGltZUVycm9yKGVycikNCj4+IHwg
UnVudGltZUVycm9yOiBmYWlsZWQgdG8gcnVuOiAvaG9tZS9wb2t5YnVpbGQveW9jdG8td29y
a2VyL3FlbXVtaXBzLWFsdC9idWlsZC9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvcnVz
dC1uYXRpdmUvMS42MS4wLXIwL3J1c3RjLTEuNjEuMC1zcmMvYnVpbGQvYm9vdHN0cmFwL2Rl
YnVnL2Jvb3RzdHJhcCAtaiAxNiBidWlsZCAtLXN0YWdlIDIgLS12ZXJib3NlDQo+PiB8IFdB
Uk5JTkc6IC9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdW1pcHMtYWx0L2J1aWxk
L2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC9ydXN0LW5hdGl2ZS8xLjYxLjAtcjAvdGVt
cC9ydW4uZG9fY29tcGlsZS4xNzUxMDQ6MTc5ICBleGl0IDEgZnJvbSAncHl0aG9uMyBzcmMv
Ym9vdHN0cmFwL2Jvb3RzdHJhcC5weSAtaiAxNiAiJEAiIC0tdmVyYm9zZScNCj4+IHwgV0FS
TklORzogQmFja3RyYWNlIChCQiBnZW5lcmF0ZWQgc2NyaXB0KToNCj4+IHwgICAgICMxOiBy
dXN0X3J1bngsIC9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdW1pcHMtYWx0L2J1
aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC9ydXN0LW5hdGl2ZS8xLjYxLjAtcjAv
dGVtcC9ydW4uZG9fY29tcGlsZS4xNzUxMDQsIGxpbmUgMTc5DQo+PiB8ICAgICAjMjogZG9f
Y29tcGlsZSwgL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11bWlwcy1hbHQvYnVp
bGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3J1c3QtbmF0aXZlLzEuNjEuMC1yMC90
ZW1wL3J1bi5kb19jb21waWxlLjE3NTEwNCwgbGluZSAxNjINCj4+IHwgICAgICMzOiBtYWlu
LCAvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXVtaXBzLWFsdC9idWlsZC9idWls
ZC90bXAvd29yay94ODZfNjQtbGludXgvcnVzdC1uYXRpdmUvMS42MS4wLXIwL3RlbXAvcnVu
LmRvX2NvbXBpbGUuMTc1MTA0LCBsaW5lIDIwMg0KPj4gTk9URTogcmVjaXBlIHJ1c3QtbmF0
aXZlLTEuNjEuMC1yMDogdGFzayBkb19jb21waWxlOiBGYWlsZWQNCj4+ID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4NCj4+IFRoZSBidWlsZCBlcnJv
ciBpcyBzb2x2ZWQgYnkgYWRkaW5nIHRoZSBsaWJzdGRjKysuYSBsaWJyYXJ5IG9uIHRoZSBI
b3N0IChpbiBteSBjYXNlIFVidW50dSkgbWFjaGluZS4gTm93LCBJIGFtIHdvcmtpbmcgb24g
dG8gYWRkIHRoaXMgbGlicmFyeSB0byB0aGUgWW9jdG8gbmF0aXZlc2RrIHN5c3Jvb3QgdG8g
YXZvaWQgdGhlIGRlcGVuZGVuY3kgb24gdGhlIEhvc3QgbWFjaGluZS4gSSBtYWRlIHNldmVy
YWwgYXR0ZW1wdHMgdG8gYWRkIHRoZSBsaWJzdGRjKysgbGliIHRvIHRoZSBuYXRpdmVzZGsg
c3lzcm9vdCBiZWZvcmUgdGhlIHJ1c3QgLyBydXN0LWxsdm0gcmVjaXBlICdkb19jb21waWxl
JyB0YXNrIGlzIGV4ZWN1dGVkLiBJbiB0aGUgYnVpbGQgZGlyZWN0b3J5IEkgY2FuIHNlZSB0
aGUgbGlic3RkYysrLmEgaXMgYXZhaWxhYmxlIGJ1dCBpdCBpcyBub3QgY29uc2lkZXJlZCBi
eSB0aGUgcnVzdCByZWNpcGUgYW5kIHN0aWxsIHRoZSBhYm92ZSBtZW50b25lZCBlcnJvciBp
cyBhcHBlYXJpbmcuIFdoZW4gSSBhZGRlZCBkZXBlbmRlbmNpZXMsIEkgb2JzZXJ2ZWQgIGVy
cm9ycyBsaWtlICdub3RoaW5nIHByb3ZpZGVzIGxpYnN0ZGMrKyAvIGxpYnN0ZGMrKy1zdGF0
aWMgLyBsaWJzdGRjKystc3RhdGljZGV2IC8gdmlydHVhbC9uYXRpdmVzZGstbGlic3RkYysr
LXN0YXRpY2RldiAuLi4gZXRjJy4NCj4+DQo+PiBCZWxvdyBhcmUgdGhlIGZldyBsb2NhdGlv
bnMgaW4gYnVpbGQvdG1wL3dvcmsvIGRpcmVjdG9yeSB3aGVyZSBsaWJzdGRjKysuYSBsaWIg
aXMgYXZhaWxhYmxlLg0KPj4gLi94ODZfNjQtbmF0aXZlc2RrLXBva3lzZGstbGludXgvbWV0
YS1lbnZpcm9ubWVudC1xZW11eDg2LTY0LzEuMC1yOC9yZWNpcGUtc3lzcm9vdC91c3IvbGli
L2xpYnN0ZGMrKy5hDQo+PiAuL3g4Nl82NC1uYXRpdmVzZGstcG9reXNkay1saW51eC9ydXN0
LWNyb3NzLWNhbmFkaWFuLXg4Ni02NC8xLjYxLjAtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2xp
Yi9saWJzdGRjKysuYQ0KPj4gLi94ODZfNjQtbmF0aXZlc2RrLXBva3lzZGstbGludXgvcnVz
dC10b29scy1jcm9zcy1jYW5hZGlhbi14ODYtNjQvMS42MS4wLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvbGlic3RkYysrLmENCj4+DQo+Pg0KPj4gQ291bGQgc29tZW9uZSBnaXZlIHNv
bWUgaGludHMgb24gd2hpY2ggcmVjaXBlIHNob3VsZCBwcm92aWRlIHRoZSBsaWJzdGRjKyst
c3RhdGljIGxpYiBhbmQgaG93IGNhbiBJIG1hZGUgaXQgaXMgY29uc2lkZXJlZCBieSB0aGUg
cnVzdCByZWNpcGU/DQo+Pg0KPj4gVGhlIGxpbmtodHRwczovL2dpdGh1Yi5jb20vcnVzdC1s
YW5nL3J1c3QvaXNzdWVzLzk0OTgzI2lzc3VlLTExNzAzODY4NjAgIGRlc2NyaWJlcyB0aGUg
bGlic3RkYysrIGRlcGVuZGVuY3kgd2l0aCBydXN0IHVwZGF0ZS4NCj4+DQo+Pg0KPj4NCj4+
DQo+PiBUaGFua3MsDQo+PiBTdW5kZWVwIEsuDQo+Pg0KPj4NCj4+IE9uIDEzLTA2LTIwMjIg
MTg6NTYsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPj4NCj4+IFtQbGVhc2Ugbm90ZTog
VGhpcyBlLW1haWwgaXMgZnJvbSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10NCj4+DQo+
PiBUbyBnZXQgc3RhcnRlZCBxdWlja2VyLCBJIGhhdmUgYSByZWNpcGUgdXBkYXRlIGNvbW1p
dCBvbiB0b3Agb2YgdGhpcw0KPj4gYnJhbmNoLCB3aGljaCB5b3UgYXJlIHdlbGNvbWUgdG8g
Y2hlcnJ5LXBpY2s6DQo+PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY29u
dHJpYi9sb2cvP2g9YWthbmF2aW4vcGFja2FnZS12ZXJzaW9uLXVwZGF0ZXMtbGF0ZXINCj4+
DQo+PiBBbGV4DQo+Pg0KPj4gT24gTW9uLCAxMyBKdW4gMjAyMiBhdCAxNTowMSwgUmFuZHkg
TWFjTGVvZDxyYW5keS5tYWNsZW9kQHdpbmRyaXZlci5jb20+ICB3cm90ZToNCj4+DQo+PiBP
biAyMDIyLTA2LTEzIDA0OjE1LCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4+DQo+PiBS
dXN0IDEuNjEgaXMgaGVsZCBieSBydXN0LW5hdGl2ZSByZWdyZXNzaW5nIG9uIHJlZCBoYXQg
ZGlzdHJvczsgZmVkb3JhDQo+PiAzNC8zNSwgY2VudG9zL2FsbWEgOCBhbGwgc2hvdyB0aGlz
Og0KPj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9i
dWlsZGVycy8xMDIvYnVpbGRzLzMxNTENCj4+DQo+PiBBbGV4DQo+Pg0KPj4gVGhhbmtzIEFs
ZXguDQo+Pg0KPj4NCj4+IE5hdmVlbiwgU3VuZGVlcCwNCj4+DQo+PiBJdCBsb29rcyBsaWtl
IHRoZXJlJ3MgYmVlbiBhIGNoYW5nZSB0byBob3cgb3IgaWYgbGlic3RkYysrLXN0YXRpYyBp
cyB1c2VkOg0KPj4NCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9pc3N1
ZXMvOTcxMzgNCj4+DQo+Pg0KPj4gVGhpcyBjaGFuZ2UgaXMgcGFydCBvZiAxLjYxOg0KPj4N
Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9wdWxsLzk0ODMyDQo+Pg0K
Pj4gc28gcGVyaGFwcyB3ZSBuZWVkIHRvIGNoYW5nZSBvdXIgcmVjaXBlLiBBbnl3YXksIEkg
b25seSB0b29rIGEgcXVpY2sgbG9vay4NCj4+IFBsZWFzZSB3b3JrIG9uIHRoaXMgaXNzdWUg
QVNBUC4NCj4+DQo+PiAuLi9SYW5keQ0KPj4NCj4+DQo+PiBPbiBXZWQsIDEgSnVuIDIwMjIg
YXQgMTg6MTksIEF1dG8gVXBncmFkZSBIZWxwZXI8YXVoQHlvY3RvcHJvamVjdC5vcmc+ICB3
cm90ZToNCj4+DQo+PiBIZWxsbywNCj4+DQo+PiB0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0
aW9uIGZyb20gdGhlIEF1dG8gVXBncmFkZSBIZWxwZXINCj4+IHRoYXQgdGhlIGF1dG9tYXRp
YyBhdHRlbXB0IHRvIHVwZ3JhZGUgdGhlIHJlY2lwZSAqcnVzdC1sbHZtKiB0byAqMS42MS4w
KiBoYXMgRmFpbGVkIChkZXZ0b29sIGVycm9yKS4NCj4+DQo+PiBEZXRhaWxlZCBlcnJvciBp
bmZvcm1hdGlvbjoNCj4+DQo+PiBUaGUgZm9sbG93aW5nIGRldnRvb2wgY29tbWFuZCBmYWls
ZWQ6ICBmaW5pc2ggLWYgcnVzdC1sbHZtIC9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIv
YXVoL2J1aWxkL2J1aWxkL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QNCj4+IE5P
VEU6IFN0YXJ0aW5nIGJpdGJha2Ugc2VydmVyLi4uDQo+PiBXQVJOSU5HOiBIb3N0IGRpc3Ry
aWJ1dGlvbiAiYWxtYWxpbnV4LTguNiIgaGFzIG5vdCBiZWVuIHZhbGlkYXRlZCB3aXRoIHRo
aXMgdmVyc2lvbiBvZiB0aGUgYnVpbGQgc3lzdGVtOyB5b3UgbWF5IHBvc3NpYmx5IGV4cGVy
aWVuY2UgdW5leHBlY3RlZCBmYWlsdXJlcy4gSXQgaXMgcmVjb21tZW5kZWQgdGhhdCB5b3Ug
dXNlIGEgdGVzdGVkIGRpc3RyaWJ1dGlvbi4NCj4+IExvYWRpbmcgY2FjaGUuLi5kb25lLg0K
Pj4gTG9hZGVkIDE2NDMgZW50cmllcyBmcm9tIGRlcGVuZGVuY3kgY2FjaGUuDQo+PiBQYXJz
aW5nIHJlY2lwZXMuLi5kb25lLg0KPj4gUGFyc2luZyBvZiA4ODQgLmJiIGZpbGVzIGNvbXBs
ZXRlICg4ODMgY2FjaGVkLCAxIHBhcnNlZCkuIDE2NDQgdGFyZ2V0cywgMzUgc2tpcHBlZCwg
MCBtYXNrZWQsIDAgZXJyb3JzLg0KPj4NCj4+IFN1bW1hcnk6IFRoZXJlIHdhcyAxIFdBUk5J
TkcgbWVzc2FnZS4NCj4+DQo+PiBFUlJPUjogVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxs
IGxhc3QpOg0KPj4gICAgIEZpbGUgIi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVo
L2J1aWxkL2J1aWxkL3Bva3kvYml0YmFrZS9saWIvYmIvY29va2VyZGF0YS5weSIsIGxpbmUg
MTYyLCBpbiB3cmFwcGVkDQo+PiAgICAgICByZXR1cm4gZnVuYyhmbiwgKmFyZ3MpDQo+PiAg
ICAgRmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQv
cG9reS9iaXRiYWtlL2xpYi9iYi9jb29rZXJkYXRhLnB5IiwgbGluZSAxODcsIGluIHBhcnNl
X2NvbmZpZ19maWxlDQo+PiAgICAgICByZXR1cm4gYmIucGFyc2UuaGFuZGxlKGZuLCBkYXRh
LCBpbmNsdWRlKQ0KPj4gICAgIEZpbGUgIi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIv
YXVoL2J1aWxkL2J1aWxkL3Bva3kvYml0YmFrZS9saWIvYmIvcGFyc2UvX19pbml0X18ucHki
LCBsaW5lIDEwNywgaW4gaGFuZGxlDQo+PiAgICAgICByZXR1cm4gaFsnaGFuZGxlJ10oZm4s
IGRhdGEsIGluY2x1ZGUpDQo+PiAgICAgRmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9hdWgvYnVpbGQvYnVpbGQvcG9reS9iaXRiYWtlL2xpYi9iYi9wYXJzZS9wYXJzZV9w
eS9Db25mSGFuZGxlci5weSIsIGxpbmUgMTE4LCBpbiBoYW5kbGUNCj4+ICAgICAgIGFic19m
biA9IHJlc29sdmVfZmlsZShmbiwgZGF0YSkNCj4+ICAgICBGaWxlICIvaG9tZS9wb2t5YnVp
bGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9wb2t5L2JpdGJha2UvbGliL2JiL3Bh
cnNlL19faW5pdF9fLnB5IiwgbGluZSAxMzMsIGluIHJlc29sdmVfZmlsZQ0KPj4gICAgICAg
cmFpc2UgSU9FcnJvcihlcnJuby5FTk9FTlQsICJmaWxlICVzIG5vdCBmb3VuZCIgJSBmbikN
Cj4+IEZpbGVOb3RGb3VuZEVycm9yOiBbRXJybm8gMl0gZmlsZSAvaG9tZS9wb2t5YnVpbGQv
eW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydXN0L2NvbmYvbGF5ZXIuY29uZiBub3QgZm91bmQNCj4+DQo+PiBFUlJPUjogVW5hYmxl
IHRvIHBhcnNlIC9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxk
L3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvY29uZi9sYXllci5jb25mOiBbRXJy
bm8gMl0gZmlsZSAvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWls
ZC9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L2NvbmYvbGF5ZXIuY29uZiBub3Qg
Zm91bmQNCj4+IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCj4+ICAgICBG
aWxlICIvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9wb2t5
L2JpdGJha2UvbGliL2JiL2Nvb2tlcmRhdGEucHkiLCBsaW5lIDE2MiwgaW4gd3JhcHBlZA0K
Pj4gICAgICAgcmV0dXJuIGZ1bmMoZm4sICphcmdzKQ0KPj4gICAgIEZpbGUgIi9ob21lL3Bv
a3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3Bva3kvYml0YmFrZS9saWIv
YmIvY29va2VyZGF0YS5weSIsIGxpbmUgMTg3LCBpbiBwYXJzZV9jb25maWdfZmlsZQ0KPj4g
ICAgICAgcmV0dXJuIGJiLnBhcnNlLmhhbmRsZShmbiwgZGF0YSwgaW5jbHVkZSkNCj4+ICAg
ICBGaWxlICIvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9w
b2t5L2JpdGJha2UvbGliL2JiL3BhcnNlL19faW5pdF9fLnB5IiwgbGluZSAxMDcsIGluIGhh
bmRsZQ0KPj4gICAgICAgcmV0dXJuIGhbJ2hhbmRsZSddKGZuLCBkYXRhLCBpbmNsdWRlKQ0K
Pj4gICAgIEZpbGUgIi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1
aWxkL3Bva3kvYml0YmFrZS9saWIvYmIvcGFyc2UvcGFyc2VfcHkvQ29uZkhhbmRsZXIucHki
LCBsaW5lIDExOCwgaW4gaGFuZGxlDQo+PiAgICAgICBhYnNfZm4gPSByZXNvbHZlX2ZpbGUo
Zm4sIGRhdGEpDQo+PiAgICAgRmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9h
dWgvYnVpbGQvYnVpbGQvcG9reS9iaXRiYWtlL2xpYi9iYi9wYXJzZS9fX2luaXRfXy5weSIs
IGxpbmUgMTMzLCBpbiByZXNvbHZlX2ZpbGUNCj4+ICAgICAgIHJhaXNlIElPRXJyb3IoZXJy
bm8uRU5PRU5ULCAiZmlsZSAlcyBub3QgZm91bmQiICUgZm4pDQo+PiBGaWxlTm90Rm91bmRF
cnJvcjogW0Vycm5vIDJdIGZpbGUgL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgv
YnVpbGQvYnVpbGQvcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9jb25mL2xheWVy
LmNvbmYgbm90IGZvdW5kDQo+Pg0KPj4gRHVyaW5nIGhhbmRsaW5nIG9mIHRoZSBhYm92ZSBl
eGNlcHRpb24sIGFub3RoZXIgZXhjZXB0aW9uIG9jY3VycmVkOg0KPj4NCj4+IFRyYWNlYmFj
ayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCj4+ICAgICBGaWxlICIvaG9tZS9wb2t5YnVp
bGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9wb2t5L3NjcmlwdHMvZGV2dG9vbCIs
IGxpbmUgMzM0LCBpbiA8bW9kdWxlPg0KPj4gICAgICAgcmV0ID0gbWFpbigpDQo+PiAgICAg
RmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvcG9r
eS9zY3JpcHRzL2RldnRvb2wiLCBsaW5lIDMyMSwgaW4gbWFpbg0KPj4gICAgICAgcmV0ID0g
YXJncy5mdW5jKGFyZ3MsIGNvbmZpZywgYmFzZXBhdGgsIHdvcmtzcGFjZSkNCj4+ICAgICBG
aWxlICIvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9wb2t5
L3NjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkiLCBsaW5lIDIxMDgsIGluIGZpbmlz
aA0KPj4gICAgICAgdXBkYXRlZCwgYXBwZW5kZmlsZSwgcmVtb3ZlZCA9IF91cGRhdGVfcmVj
aXBlKGFyZ3MucmVjaXBlbmFtZSwgd29ya3NwYWNlLCByZCwgYXJncy5tb2RlLCBhcHBlbmRs
YXllcmRpciwgd2lsZGNhcmRfdmVyc2lvbj1UcnVlLCBub19yZW1vdmU9RmFsc2UsIG5vX3Jl
cG9ydF9yZW1vdmU9cmVtb3Zpbmdfb3JpZ2luYWwsIGluaXRpYWxfcmV2PWFyZ3MuaW5pdGlh
bF9yZXYsIGRyeV9ydW5fb3V0ZGlyPWRyeV9ydW5fb3V0ZGlyLCBub19vdmVycmlkZXM9YXJn
cy5ub19vdmVycmlkZXMsIGZvcmNlX3BhdGNoX3JlZnJlc2g9YXJncy5mb3JjZV9wYXRjaF9y
ZWZyZXNoKQ0KPj4gICAgIEZpbGUgIi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVo
L2J1aWxkL2J1aWxkL3Bva3kvc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weSIsIGxp
bmUgMTgxNCwgaW4gX3VwZGF0ZV9yZWNpcGUNCj4+ICAgICAgIHVwZGF0ZWQsIGFwcGVuZGYs
IHJlbW92ZWQgPSBfdXBkYXRlX3JlY2lwZV9wYXRjaChyZWNpcGVuYW1lLCB3b3Jrc3BhY2Us
IHNyY3RyZWUsIGNyZCwgYXBwZW5kbGF5ZXJkaXIsIHdpbGRjYXJkX3ZlcnNpb24sIG5vX3Jl
bW92ZSwgbm9fcmVwb3J0X3JlbW92ZSwgaW5pdGlhbF9yZXYsIGRyeV9ydW5fb3V0ZGlyLCBm
b3JjZV9wYXRjaF9yZWZyZXNoKQ0KPj4gICAgIEZpbGUgIi9ob21lL3Bva3lidWlsZC95b2N0
by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3Bva3kvc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFu
ZGFyZC5weSIsIGxpbmUgMTY3MSwgaW4gX3VwZGF0ZV9yZWNpcGVfcGF0Y2gNCj4+ICAgICAg
IHJlZGlyZWN0X291dHB1dD1kcnlfcnVuX291dGRpcikNCj4+ICAgICBGaWxlICIvaG9tZS9w
b2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9wb2t5L21ldGEvbGliL29l
L3JlY2lwZXV0aWxzLnB5IiwgbGluZSA3MDUsIGluIGJiYXBwZW5kX3JlY2lwZQ0KPj4gICAg
ICAgYXBwZW5kcGF0aCwgcGF0aG9rID0gZ2V0X2JiYXBwZW5kX3BhdGgocmQsIGRlc3RsYXll
cmRpciwgd2lsZGNhcmR2ZXIpDQo+PiAgICAgRmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3Rv
LXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvcG9reS9tZXRhL2xpYi9vZS9yZWNpcGV1dGlscy5w
eSIsIGxpbmUgNjMyLCBpbiBnZXRfYmJhcHBlbmRfcGF0aA0KPj4gICAgICAgY29uZmRhdGEg
PSBiYi5jb29rZXJkYXRhLnBhcnNlX2NvbmZpZ19maWxlKGRlc3RsYXllcmNvbmYsIGNvbmZk
YXRhKQ0KPj4gICAgIEZpbGUgIi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1
aWxkL2J1aWxkL3Bva3kvYml0YmFrZS9saWIvYmIvY29va2VyZGF0YS5weSIsIGxpbmUgMTY3
LCBpbiB3cmFwcGVkDQo+PiAgICAgICByYWlzZSBiYi5CQkhhbmRsZWRFeGNlcHRpb24oKQ0K
Pj4gYmIuQkJIYW5kbGVkRXhjZXB0aW9uDQo+Pg0KPj4NCj4+IFBsZWFzZSByZXZpZXcgdGhl
IGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIGFuZCBidWlsZC91cGRh
dGUgZmFpbHVyZXMuDQo+PiBBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdGh0dHBz
Oi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9QXV0
b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBUaGUgVXBn
cmFkZSBIZWxwZXINCj4+DQo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4gTGlua3M6
IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+PiBWaWV3
L1JlcGx5IE9ubGluZSAoIzE2NjQwNCk6aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNjY0MDQNCj4+IE11dGUgVGhpcyBUb3Bp
YzpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTE0ODAxNTkvMTY4NjQ4OQ0K
Pj4gR3JvdXAgT3duZXI6b3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPj4gVW5zdWJzY3JpYmU6aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgIFthbGV4LmthbmF2aW5AZ21haWwuY29tXQ0K
Pj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4+DQo+PiAtLQ0KPj4gIyBSYW5keSBNYWNM
ZW9kDQo+PiAjIFdpbmQgUml2ZXIgTGludXgNCj4+DQo+PiAuDQo+Pg0KPj4NCg0K
--------------N4gMTqyxs3mbOdbHItuMqT04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 22/06/22 14:02, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj--fTwahYe2e1O1tSssrMK+jPNVDRsRuoP-SVnDtCf8JA@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Can you publish your work so=
mewhere on git so I can reproduce the
nativesdk issue locally?</pre>
    </blockquote>
    <p>Hello,</p>
    <p>As I do not have permission to create my own remote repo, I
      attached my changes here in <i>mypatch.patch</i> file. If
      libstdc++.a is available in /usr/lib/gcc/ the issue cannot be
      reproduced (The lib path will be taken from there). In addition
      below are the <i>local.conf </i>changes.</p>
    <p><i><font size=3D"2">TOOLCHAIN_HOST_<a class=3D"moz-txt-link-freete=
xt" href=3D"TASK:append">TASK:append</a> =3D " gcc g++ libgcc
          libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev
          libstdc++-staticdev nativesdk-libstdc++-dev
          nativesdk-libstdc++-staticdev
          packagegroup-rust-cross-canadian-${MACHINE}
          packagegroup-cross-canadian-${MACHINE}"<br>
          <br>
          TOOLCHAIN_TARGET_<a class=3D"moz-txt-link-freetext" href=3D"TAS=
K:append">TASK:append</a> =3D " libstdc++-staticdev"</font></i></p>
    <p><br>
    </p>
    <p>(Note: As I tried multiple ways the additions/changes in the
      attached patch may be vague.)</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Sundeep K.</p>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj--fTwahYe2e1O1tSssrMK+jPNVDRsRuoP-SVnDtCf8JA@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Khem, can you help us out please with it? :)

Also I'm starting to wonder if we should patch rust with a workaround
from the ticket instead?


Alex

On Wed, 22 Jun 2022 at 08:24, Sundeep KOKKONDA
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sundeep.kokkonda@gmail.=
com">&lt;sundeep.kokkonda@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hi,

In Yocto, the Rust upgrade from 1.60.0 -&gt; 1.61.0 enables a dependency =
on the libstdc++-static library for rust-llvm. With this upgrade build is=
 aborted for 'bitbake core-image-minimal -cpopulate_sdk' with below error=
=2E

=3D=3D=3D=3D=3D=3D=3D Error Text =3D=3D=3D=3D=3D=3D=3D
| error: could not compile `rustc_llvm` due to previous error
|
| Caused by:
|   process didn't exit successfully: `/home/pokybuild/yocto-worker/qemum=
ips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.6=
1.0-src/build/bootstrap/debug/rustc --crate-name rustc_llvm --edition=3D2=
021 compiler/rustc_llvm/src/lib.rs --error-format=3Djson --json=3Ddiagnos=
tic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=3Ddep=
-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C debuginfo=3D=
0 -C metadata=3D5acc17ffb3ce44a9 -C extra-filename=3D-5acc17ffb3ce44a9 --=
out-dir /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x8=
6_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-li=
nux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps --target x86_6=
4-unknown-linux-gnu -C linker=3D/home/pokybuild/yocto-worker/qemumips-alt=
/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/wrapper/build-ru=
st-ccld -L dependency=3D/home/pokybuild/yocto-worker/qemumips-alt/build/b=
uild/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x=
86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/dep=
s -L dependency=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/t=
mp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-=
unknown-linux-gnu/stage0-rustc/release/deps --extern libc=3D/home/pokybui=
ld/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-nativ=
e/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/=
x86_64-unknown-linux-gnu/release/deps/liblibc-be8f25d7c5c0a059.rmeta --cf=
g=3Dbootstrap -Csymbol-mangling-version=3Dv0 -Zmacro-backtrace -Clink-arg=
s=3D-Wl,-z,origin '-Clink-args=3D-Wl,-rpath,$ORIGIN/../lib' -Ztls-model=3D=
initial-exec -Zunstable-options '-Wrustc::internal' -Cprefer-dynamic -Z b=
inary-dep-depinfo -L native=3D/home/pokybuild/yocto-worker/qemumips-alt/b=
uild/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/b=
uild/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/relea=
se/build/rustc_llvm-688051e8c720f5a9/out -L native=3D/home/pokybuild/yoct=
o-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.=
0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib -L native=3D/home/pokybu=
ild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-llvm=
-native/1.61.0-r0/recipe-sysroot-native/usr/lib -L native=3D/home/pokybui=
ld/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-llvm-=
native/1.61.0-r0/recipe-sysroot-native/lib -L native=3D --cfg 'llvm_compo=
nent=3D"aarch64"' --cfg 'llvm_component=3D"arm"' --cfg 'llvm_component=3D=
"asmparser"' --cfg 'llvm_component=3D"bitreader"' --cfg 'llvm_component=3D=
"bitwriter"' --cfg 'llvm_component=3D"coverage"' --cfg 'llvm_component=3D=
"instrumentation"' --cfg 'llvm_component=3D"ipo"' --cfg 'llvm_component=3D=
"linker"' --cfg 'llvm_component=3D"lto"' --cfg 'llvm_component=3D"mips"' =
--cfg 'llvm_component=3D"powerpc"' --cfg 'llvm_component=3D"riscv"' --cfg=
 'llvm_component=3D"x86"' -l static=3Dllvm-wrapper -l static=3DLLVMX86Tar=
getMCA -l static=3DLLVMMCA -l static=3DLLVMX86Disassembler -l static=3DLL=
VMX86AsmParser -l static=3DLLVMX86CodeGen -l static=3DLLVMX86Desc -l stat=
ic=3DLLVMX86Info -l static=3DLLVMRISCVDisassembler -l static=3DLLVMRISCVA=
smParser -l static=3DLLVMRISCVCodeGen -l static=3DLLVMRISCVDesc -l static=
=3DLLVMRISCVInfo -l static=3DLLVMPowerPCDisassembler -l static=3DLLVMPowe=
rPCAsmParser -l static=3DLLVMPowerPCCodeGen -l static=3DLLVMPowerPCDesc -=
l static=3DLLVMPowerPCInfo -l static=3DLLVMMipsDisassembler -l static=3DL=
LVMMipsAsmParser -l static=3DLLVMMipsCodeGen -l static=3DLLVMMipsDesc -l =
static=3DLLVMMipsInfo -l static=3DLLVMLTO -l static=3DLLVMPasses -l stati=
c=3DLLVMCoroutines -l static=3DLLVMObjCARCOpts -l static=3DLLVMExtensions=
 -l static=3DLLVMCoverage -l static=3DLLVMARMDisassembler -l static=3DLLV=
MARMAsmParser -l static=3DLLVMARMCodeGen -l static=3DLLVMipo -l static=3D=
LLVMInstrumentation -l static=3DLLVMVectorize -l static=3DLLVMLinker -l s=
tatic=3DLLVMIRReader -l static=3DLLVMAsmParser -l static=3DLLVMFrontendOp=
enMP -l static=3DLLVMARMDesc -l static=3DLLVMARMUtils -l static=3DLLVMARM=
Info -l static=3DLLVMAArch64Disassembler -l static=3DLLVMMCDisassembler -=
l static=3DLLVMAArch64AsmParser -l static=3DLLVMAArch64CodeGen -l static=3D=
LLVMCFGuard -l static=3DLLVMGlobalISel -l static=3DLLVMSelectionDAG -l st=
atic=3DLLVMAsmPrinter -l static=3DLLVMDebugInfoMSF -l static=3DLLVMCodeGe=
n -l static=3DLLVMTarget -l static=3DLLVMScalarOpts -l static=3DLLVMInstC=
ombine -l static=3DLLVMAggressiveInstCombine -l static=3DLLVMTransformUti=
ls -l static=3DLLVMBitWriter -l static=3DLLVMAnalysis -l static=3DLLVMPro=
fileData -l static=3DLLVMDebugInfoDWARF -l static=3DLLVMObject -l static=3D=
LLVMTextAPI -l static=3DLLVMMCParser -l static=3DLLVMBitReader -l static=3D=
LLVMCore -l static=3DLLVMRemarks -l static=3DLLVMBitstreamReader -l stati=
c=3DLLVMAArch64Desc -l static=3DLLVMAArch64Utils -l static=3DLLVMAArch64I=
nfo -l static=3DLLVMMC -l static=3DLLVMDebugInfoCodeView -l static=3DLLVM=
BinaryFormat -l static=3DLLVMSupport -l static=3DLLVMDemangle -l dylib=3D=
rt -l dylib=3Ddl -l dylib=3Dpthread -l dylib=3Dm -l static=3Dstdc++` (exi=
t status: 1)
| warning: build failed, waiting for other jobs to finish...
|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D&gt;    ] 186/218: rustc_ast_passes, rustc_e...
|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D&gt;    ] 187/218: rustc_expand, rustc_parse...
|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D&gt;    ] 188/218: rustc_expand, rustc_parse...
|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D&gt;    ] 189/218: rustc_parse, rustc_builti...
|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D&gt;    ] 190/218: rustc_parse, rustc_middle
|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D&gt;    ] 191/218: rustc_middle
| error: build failed
| command did not execute successfully: "/home/pokybuild/yocto-worker/qem=
umips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rust-sn=
apshot/bin/cargo" "build" "--target" "x86_64-unknown-linux-gnu" "-Zbinary=
-dep-depinfo" "-j" "16" "-v" "--release" "--frozen" "--features" "llvm ma=
x_level_info" "--manifest-path" "/home/pokybuild/yocto-worker/qemumips-al=
t/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-sr=
c/compiler/rustc/Cargo.toml" "--message-format" "json-render-diagnostics"=

| expected success, got: exit status: 101
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/=
x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstr=
ap.py", line 1341, in &lt;module&gt;
|     main()
|   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/=
x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstr=
ap.py", line 1324, in main
|     bootstrap(help_triggered)
|   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/=
x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstr=
ap.py", line 1310, in bootstrap
|     run(args, env=3Denv, verbose=3Dbuild.verbose, is_bootstrap=3DTrue)
|   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/=
x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstr=
ap.py", line 185, in run
|     raise RuntimeError(err)
| RuntimeError: failed to run: /home/pokybuild/yocto-worker/qemumips-alt/=
build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/=
build/bootstrap/debug/bootstrap -j 16 build --stage 2 --verbose
| WARNING: /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work=
/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_<a class=3D"moz-txt-link-=
freetext" href=3D"compile.175104:179">compile.175104:179</a> exit 1 from =
'python3 src/bootstrap/bootstrap.py -j 16 "$@" --verbose'
| WARNING: Backtrace (BB generated script):
|     #1: rust_runx, /home/pokybuild/yocto-worker/qemumips-alt/build/buil=
d/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104,=
 line 179
|     #2: do_compile, /home/pokybuild/yocto-worker/qemumips-alt/build/bui=
ld/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104=
, line 162
|     #3: main, /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp=
/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104, line=
 202
NOTE: recipe rust-native-1.61.0-r0: task do_compile: Failed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The build error is solved by adding the libstdc++.a library on the Host (=
in my case Ubuntu) machine. Now, I am working on to add this library to t=
he Yocto nativesdk sysroot to avoid the dependency on the Host machine. I=
 made several attempts to add the libstdc++ lib to the nativesdk sysroot =
before the rust / rust-llvm recipe 'do_compile' task is executed. In the =
build directory I can see the libstdc++.a is available but it is not cons=
idered by the rust recipe and still the above mentoned error is appearing=
=2E When I added dependencies, I observed  errors like 'nothing provides =
libstdc++ / libstdc++-static / libstdc++-staticdev / virtual/nativesdk-li=
bstdc++-staticdev ... etc'.

Below are the few locations in build/tmp/work/ directory where libstdc++.=
a lib is available.
=2E/x86_64-nativesdk-pokysdk-linux/meta-environment-qemux86-64/1.0-r8/rec=
ipe-sysroot/usr/lib/libstdc++.a
=2E/x86_64-nativesdk-pokysdk-linux/rust-cross-canadian-x86-64/1.61.0-r0/r=
ecipe-sysroot/usr/lib/libstdc++.a
=2E/x86_64-nativesdk-pokysdk-linux/rust-tools-cross-canadian-x86-64/1.61.=
0-r0/recipe-sysroot/usr/lib/libstdc++.a


Could someone give some hints on which recipe should provide the libstdc+=
+-static lib and how can I made it is considered by the rust recipe?

The link <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ru=
st-lang/rust/issues/94983#issue-1170386860">https://github.com/rust-lang/=
rust/issues/94983#issue-1170386860</a> describes the libstdc++ dependency=
 with rust update.




Thanks,
Sundeep K.


On 13-06-2022 18:56, Alexander Kanavin wrote:

[Please note: This e-mail is from an EXTERNAL e-mail address]

To get started quicker, I have a recipe update commit on top of this
branch, which you are welcome to cherry-pick:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-contrib/log/?h=3Dakanavin/package-version-updates-later">https://git.=
yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-version-updates-l=
ater</a>

Alex

On Mon, 13 Jun 2022 at 15:01, Randy MacLeod <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:randy.macleod@windriver.com">&lt;randy.macleod@windr=
iver.com&gt;</a> wrote:

On 2022-06-13 04:15, Alexander Kanavin wrote:

Rust 1.61 is held by rust-native regressing on red hat distros; fedora
34/35, centos/alma 8 all show this:
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/102/builds/3151">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/102/builds/3151</a>

Alex

Thanks Alex.


Naveen, Sundeep,

It looks like there's been a change to how or if libstdc++-static is used=
:

<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/issues/97138">https://github.com/rust-lang/rust/issues/97138</a>


This change is part of 1.61:

<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/pull/94832">https://github.com/rust-lang/rust/pull/94832</a>

so perhaps we need to change our recipe. Anyway, I only took a quick look=
=2E
Please work on this issue ASAP.

=2E./Randy


On Wed, 1 Jun 2022 at 18:19, Auto Upgrade Helper <a class=3D"moz-txt-link=
-rfc2396E" href=3D"mailto:auh@yoctoproject.org">&lt;auh@yoctoproject.org&=
gt;</a> wrote:

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust-llvm* to *1.61.0* =
has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f rust-llvm /home/pokybuil=
d/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with th=
is version of the build system; you may possibly experience unexpected fa=
ilures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1643 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1644 targets, 3=
5 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.

ERROR: Traceback (most recent call last):
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 162, in wrapped
     return func(fn, *args)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 187, in parse_config_file
     return bb.parse.handle(fn, data, include)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/__init__.py", line 107, in handle
     return h['handle'](fn, data, include)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/parse_py/ConfHandler.py", line 118, in handle
     abs_fn =3D resolve_file(fn, data)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/__init__.py", line 133, in resolve_file
     raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/conf/layer.conf not found

ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/=
meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuil=
d/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer=
=2Econf not found
Traceback (most recent call last):
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 162, in wrapped
     return func(fn, *args)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 187, in parse_config_file
     return bb.parse.handle(fn, data, include)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/__init__.py", line 107, in handle
     return h['handle'](fn, data, include)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/parse_py/ConfHandler.py", line 118, in handle
     abs_fn =3D resolve_file(fn, data)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/__init__.py", line 133, in resolve_file
     raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtoo=
l", line 334, in &lt;module&gt;
     ret =3D main()
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtoo=
l", line 321, in main
     ret =3D args.func(args, config, basepath, workspace)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/de=
vtool/standard.py", line 2108, in finish
     updated, appendfile, removed =3D _update_recipe(args.recipename, wor=
kspace, rd, args.mode, appendlayerdir, wildcard_version=3DTrue, no_remove=
=3DFalse, no_report_remove=3Dremoving_original, initial_rev=3Dargs.initia=
l_rev, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_overrides,=
 force_patch_refresh=3Dargs.force_patch_refresh)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/de=
vtool/standard.py", line 1814, in _update_recipe
     updated, appendf, removed =3D _update_recipe_patch(recipename, works=
pace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_repor=
t_remove, initial_rev, dry_run_outdir, force_patch_refresh)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/de=
vtool/standard.py", line 1671, in _update_recipe_patch
     redirect_output=3Ddry_run_outdir)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/re=
cipeutils.py", line 705, in bbappend_recipe
     appendpath, pathok =3D get_bbappend_path(rd, destlayerdir, wildcardv=
er)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/re=
cipeutils.py", line 632, in get_bbappend_path
     confdata =3D bb.cookerdata.parse_config_file(destlayerconf, confdata=
)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 167, in wrapped
     raise bb.BBHandledException()
bb.BBHandledException


Please review the attached files for further information and build/update=
 failures.
Any problem please file a bug at <a class=3D"moz-txt-link-freetext" href=3D=
"https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Up=
date%20Handler">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3D=
Automated%20Update%20Handler</a>

Regards,
The Upgrade Helper

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#166404): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/166404">https:/=
/lists.openembedded.org/g/openembedded-core/message/166404</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
=2Eopenembedded.org/mt/91480159/1686489">https://lists.openembedded.org/m=
t/91480159/1686489</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--
# Randy MacLeod
# Wind River Linux

=2E


</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------N4gMTqyxs3mbOdbHItuMqT04--

--------------Hv55zv3m00YPTSBZYTVZqqxA
Content-Type: text/x-patch; charset=UTF-8; name="mypatch.patch"
Content-Disposition: attachment; filename="mypatch.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL21ldGEvYnVpbGR0b29scy1leHRlbmRl
ZC10YXJiYWxsLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9idWlsZHRvb2xzLWV4dGVu
ZGVkLXRhcmJhbGwuYmIKaW5kZXggODNlM2ZkZGNjYzEuLjVjZTJiMjM1NmEyIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL2J1aWxkdG9vbHMtZXh0ZW5kZWQtdGFyYmFs
bC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL2J1aWxkdG9vbHMtZXh0ZW5kZWQt
dGFyYmFsbC5iYgpAQCAtNiw2ICs2LDggQEAgREVTQ1JJUFRJT04gPSAiU0RLIHR5cGUgdGFy
Z2V0IGZvciBidWlsZGluZyBhIHN0YW5kYWxvbmUgdGFyYmFsbCBjb250YWluaW5nIGJ1aWwK
IFNVTU1BUlkgPSAiU3RhbmRhbG9uZSB0YXJiYWxsIGZvciBydW5uaW5nIGJ1aWxkcyBvbiBz
eXN0ZW1zIHdpdGggaW5hZGVxdWF0ZSBzb2Z0d2FyZSBhbmQgYW5jaWVudCBjb21waWxlcnMi
CiBMSUNFTlNFID0gIk1JVCIKIAorQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2Rr
IgorCiAjIEFkZCBuYXRpdmVzZGsgZXF1aXZhbGVudCBvZiBidWlsZC1lc3NlbnRpYWxzCiBU
T09MQ0hBSU5fSE9TVF9UQVNLICs9ICJcCiAgICAgbmF0aXZlc2RrLWF1dG9tYWtlIFwKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3QtY3Jvc3NzZGtfMS42
MS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1jcm9zc3Nka18xLjYx
LjAuYmIKaW5kZXggNmVhOGNiMDliMjEuLjc5M2JjNmYxN2Q1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LWNyb3Nzc2RrXzEuNjEuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LWNyb3Nzc2RrXzEuNjEuMC5iYgpAQCAt
Myw2ICszLDkgQEAgaW5oZXJpdCBjcm9zc3NkawogcmVxdWlyZSBydXN0LWNyb3NzLmluYwog
cmVxdWlyZSBydXN0LXNvdXJjZS5pbmMKIAotREVQRU5EUyArPSAidmlydHVhbC8ke1RBUkdF
VF9QUkVGSVh9Z2NjLWNyb3Nzc2RrIHZpcnR1YWwvbmF0aXZlc2RrLSR7VEFSR0VUX1BSRUZJ
WH1jb21waWxlcmxpYnMgdmlydHVhbC9uYXRpdmVzZGstbGliYyIKK3JlcXVpcmUgcmVjaXBl
cy1kZXZ0b29scy9nY2MvZ2NjLWNyb3Nzc2RrLmluYworI3JlcXVpcmUgcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLXJ1bnRpbWUuaW5jCisKK0RFUEVORFMgKz0gInZpcnR1YWwvJHtUQVJH
RVRfUFJFRklYfWdjYy1jcm9zc3NkayB2aXJ0dWFsL25hdGl2ZXNkay0ke1RBUkdFVF9QUkVG
SVh9Y29tcGlsZXJsaWJzIHZpcnR1YWwvbmF0aXZlc2RrLWxpYmMgdmlydHVhbC9uYXRpdmVz
ZGstbGlic3RkYysrIHZpcnR1YWwvbmF0aXZlc2RrLWxpYnN0ZGMrKy1kZXYgdmlydHVhbC9u
YXRpdmVzZGstbGlic3RkYysrLXN0YXRpY2RldiIKIFBST1ZJREVTID0gInZpcnR1YWwvbmF0
aXZlc2RrLSR7VEFSR0VUX1BSRUZJWH1ydXN0IgogUE4gPSAicnVzdC1jcm9zc3Nkay0ke1RV
TkVfUEtHQVJDSH0tJHtSVVNUX0xJQkN9IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1c3QvcnVzdC1sbHZtXzEuNjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydXN0L3J1c3QtbGx2bV8xLjYxLjAuYmIKaW5kZXggNWI5NGUyMmY3YjIuLjY0Y2Q5ZmM3
ZDYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LWxsdm1f
MS42MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3QtbGx2bV8x
LjYxLjAuYmIKQEAgLTMsNCArMyw4IEBACiBMTFZNX1JFTEVBU0UgPSAiMTMuMC4wIgogcmVx
dWlyZSBydXN0LXNvdXJjZS5pbmMKIHJlcXVpcmUgcnVzdC1sbHZtLmluYworI3JlcXVpcmUg
cmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXJ1bnRpbWUuaW5jCiAKKyNERVBFTkRTICs9ICJ2
aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1nY2MtY3Jvc3NzZGsgdmlydHVhbC9uYXRpdmVzZGst
JHtUQVJHRVRfUFJFRklYfWNvbXBpbGVybGlicyB2aXJ0dWFsL25hdGl2ZXNkay1saWJjIHZp
cnR1YWwvbmF0aXZlc2RrLWxpYnN0ZGMrKyB2aXJ0dWFsL25hdGl2ZXNkay1saWJzdGRjKyst
ZGV2IHZpcnR1YWwvbmF0aXZlc2RrLWxpYnN0ZGMrKy1zdGF0aWNkZXYiCisKK2RvX2NvbXBp
bGVbZGVwZW5kc10gPSAiZ2xpYmM6ZG9fcG9wdWxhdGVfc3lzcm9vdCIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3RfMS42MS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1c3QvcnVzdF8xLjYxLjAuYmIKaW5kZXggYjUwNWFkNDZjYWYuLmMy
MTBjNmEzZDMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0
XzEuNjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNjEu
MC5iYgpAQCAtMiw4ICsyLDE0IEBAIHJlcXVpcmUgcnVzdC10YXJnZXQuaW5jCiByZXF1aXJl
IHJ1c3Qtc291cmNlLmluYwogcmVxdWlyZSBydXN0LXNuYXBzaG90LmluYwogCisjcmVxdWly
ZSByZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtcnVudGltZS5pbmMKKwogSU5TQU5FX1NLSVA6
JHtQTn06Y2xhc3MtbmF0aXZlID0gImFscmVhZHktc3RyaXBwZWQiCiAKKyNERVBFTkRTICs9
ICJ2aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1nY2MtY3Jvc3NzZGsgdmlydHVhbC9uYXRpdmVz
ZGstJHtUQVJHRVRfUFJFRklYfWNvbXBpbGVybGlicyB2aXJ0dWFsL25hdGl2ZXNkay1saWJj
IHZpcnR1YWwvbmF0aXZlc2RrLWxpYnN0ZGMrKyB2aXJ0dWFsL25hdGl2ZXNkay1saWJzdGRj
KystZGV2IHZpcnR1YWwvbmF0aXZlc2RrLWxpYnN0ZGMrKy1zdGF0aWNkZXYiCisKK2RvX2Nv
bXBpbGVbZGVwZW5kc10gPSAiZ2xpYmM6ZG9fcG9wdWxhdGVfc3lzcm9vdCIKKwogZG9fY29t
cGlsZSAoKSB7CiAgICAgcnVzdF9ydW54IGJ1aWxkIC0tc3RhZ2UgMgogfQo=

--------------Hv55zv3m00YPTSBZYTVZqqxA--

