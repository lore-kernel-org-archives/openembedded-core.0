Return-Path: <steffen.pankratz@elektrobit.com>
Received: from smtpgw1fi.bittium.com (smtpgw1fi.bittium.com [194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE5260088
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 08:30:42 +0000 (UTC)
Received: from smtpgw1fi.ebgroup.elektrobit.com (localhost [127.0.0.1])
	by smtpgw1fi.bittium.com (8.14.4/8.14.4) with ESMTP id t638Ufxc032157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 11:30:41 +0300
Received: (from defang@localhost)
	by smtpgw1fi.ebgroup.elektrobit.com (8.14.4/8.14.4/Submit) id
	t638UZPu032141 for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 11:30:35 +0300
X-Authentication-Warning: smtpgw1fi.ebgroup.elektrobit.com: defang set sender
	to <steffen.pankratz@elektrobit.com> using -f
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.ebgroup.elektrobit.com (envelope-sender
	<steffen.pankratz@elektrobit.com>) (MIMEDefang) with ESMTP id
	t638UZsZ032137; Fri, 03 Jul 2015 11:30:35 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Fri,  3 Jul 2015 11:30:34 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Fri, 3 Jul 2015 10:30:33 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libdrm: Upgrade to 2.4.62
Thread-Index: AdC1Z8p3zllC9RjxR9meZsKny4a3+P//4umA///dzGA=
Date: Fri, 3 Jul 2015 08:30:32 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A858@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836@deeres07.ebgroup.elektrobit.com>
	<CAHiDW_FZoQudwPMdV-zTF-SZ2OVoAjNXuoYY8vUTkSQfoMXDtQ@mail.gmail.com>
In-Reply-To: <CAHiDW_FZoQudwPMdV-zTF-SZ2OVoAjNXuoYY8vUTkSQfoMXDtQ@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.bittium.com [127.0.0.1]);
	Fri, 03 Jul 2015 11:30:42 +0300 (EEST)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.bittium.com [172.16.0.202]);
	Fri, 03 Jul 2015 11:30:35 +0300 (EEST)
X-Virus-Scanned: at elektrobit.com
X-Scanned-By: MIMEDefang 2.78 on 172.16.0.202
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.62
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jul 2015 08:30:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdXNzaSBL
dWtrb25lbiBbbWFpbHRvOmp1c3NpLmt1a2tvbmVuQGludGVsLmNvbV0NCj4g
U2VudDogRnJpZGF5LCBKdWx5IDAzLCAyMDE1IDEwOjI3IEFNDQo+IFRvOiBQ
YW5rcmF0eiwgU3RlZmZlbg0KPiBDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lv
bnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0hdIGxpYmRybTogVXBncmFkZSB0byAyLjQuNjINCg0K
SGkgSnVzc2kNCg0KPiA+IGF0dGFjaGVkIHlvdSBjYW4gZmluZCBhIHBhdGNo
IHRvIHVwZ3JhZGUgbGliZHJtIHRvIHZlcnNpb24gMi40LjYyLg0KPiANCj4g
VGhhbmtzIFN0ZWZmZW4uIENvdWxkIHlvdSByZXNlbmQgdGhlIHBhdGNoIGlu
bGluZSBhbmQgbm90IGFzIGFuDQo+IGF0dGFjaG1lbnQ/DQoNClN1cmUgOikN
Cg0KRnJvbSBkMzU0M2JlZjQzMjI5MGE0YWQ4YjVmNjJlMTA2MDA2ODBkYzRk
MWQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogU3RlZmZlbiBQ
YW5rcmF0eiA8c3RlZmZlbi5wYW5rcmF0ekBlbGVrdHJvYml0LmNvbT4NCkRh
dGU6IEZyaSwgMyBKdWwgMjAxNSAwNzo0NTozNyArMDAwMA0KU3ViamVjdDog
W1BBVENIXSBsaWJkcm06IFVwZ3JhZGUgdG8gMi40LjYyDQoNClNpZ25lZC1v
ZmYtYnk6IFN0ZWZmZW4gUGFua3JhdHogPHN0ZWZmZW4ucGFua3JhdHpAZWxl
a3Ryb2JpdC5jb20+DQotLS0NCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJt
L2xpYmRybV8yLjQuNTkuYmIgfCAgNiAtLS0tLS0NCiBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuNjIuYmIgfCAxMCArKysrKysrKysr
DQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvZHJtL2xpYmRybV8yLjQuNTkuYmINCiBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjYyLmJi
DQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xp
YmRybV8yLjQuNTkuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xp
YmRybV8yLjQuNTkuYmINCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KaW5k
ZXggMTRiZjQ0YS4uMDAwMDAwMA0KLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2RybS9saWJkcm1fMi40LjU5LmJiDQorKysgL2Rldi9udWxsDQpAQCAt
MSw2ICswLDAgQEANCi1yZXF1aXJlIGxpYmRybS5pbmMNCi0NCi1TUkNfVVJJ
ICs9ICJmaWxlOi8vaW5zdGFsbHRlc3RzLnBhdGNoICINCi0NCi1TUkNfVVJJ
W21kNXN1bV0gPSAiZDMyYTFkMzdjMjU0NmVlMTFmYzU5MjRhYmVlZGIyM2Ui
DQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4ZDI2ZTFmZDg1NTgyZjQyNDNk
NjY4NjRmOWI0M2NhNGVlOTM2NjI4MjVkZTMyYjU1MDZmYzhlMTgxZWE0MWIi
DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJk
cm1fMi40LjYyLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJk
cm1fMi40LjYyLmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMC4uMTA5ZmMyYw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjYyLmJiDQpAQCAtMCwwICsx
LDEwIEBADQorcmVxdWlyZSBsaWJkcm0uaW5jDQorDQorU1JDX1VSSSArPSAi
ZmlsZTovL2luc3RhbGx0ZXN0cy5wYXRjaCAiDQorDQorU1JDX1VSSVttZDVz
dW1dID0gImM5MjkxYmFlMGU1Y2E2NWQxNDgzODIxZDM2OThkM2FiIg0KK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI5MDZjMjk0YmRiZTFjOTRjM2NhMDg0MzA1
ZDYxYTZlNWE4MzY3ZjNiNDk4NmU2Y2MxM2IxZTliM2Y3NTkzMWRjIg0KKw0K
KyMgVmFsZ3JpbmQgc3VwcG9ydCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQgY3Vy
cmVudGx5DQorIyBhbHJlYWR5IGZpeGVkIHVwc3RyZWFtOiBodHRwOi8vY2dp
dC5mcmVlZGVza3RvcC5vcmcvbWVzYS9kcm0vY29tbWl0Lz9pZD02NzZjODA2
ZDAyMjFhN2VhMzc1Njc2YjJlYWI1MTRjNDI2ZmNhY2QzDQorRVhUUkFfT0VD
T05GICs9ICItLWRpc2FibGUtdmFsZ3JpbmQiDQotLSANCjEuOS4xDQoNCg0K
LS0gDQpSZWdhcmRzDQotU3RlZmZlbg0KCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ClBsZWFzZSBub3RlOiBUaGlzIGUtbWFpbCBtYXkgY29udGFpbiBjb25maWRl
bnRpYWwgaW5mb3JtYXRpb24KaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgYWRk
cmVzc2VlLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzCmUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIGRvIG5vdCBkaXNjbG9zZSBpdCB0byBhbnlvbmUsIG5v
dGlmeQp0aGUgc2VuZGVyIHByb21wdGx5LCBhbmQgZGVsZXRlIHRoZSBtZXNz
YWdlIGZyb20geW91ciBzeXN0ZW0uClRoYW5rIHlvdS4KCg==

