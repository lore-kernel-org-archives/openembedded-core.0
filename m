Return-Path: <steffen.pankratz@elektrobit.com>
Received: from smtpgw1fi.bittium.com (smtpgw1fi.bittium.com [194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id 0023175D4E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:55:33 +0000 (UTC)
Received: from smtpgw1fi.ebgroup.elektrobit.com (localhost [127.0.0.1])
	by smtpgw1fi.bittium.com (8.14.4/8.14.4) with ESMTP id t63AtVMY027052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 13:55:32 +0300
Received: (from defang@localhost)
	by smtpgw1fi.ebgroup.elektrobit.com (8.14.4/8.14.4/Submit) id
	t63AtPqS027044 for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 13:55:25 +0300
X-Authentication-Warning: smtpgw1fi.ebgroup.elektrobit.com: defang set sender
	to <steffen.pankratz@elektrobit.com> using -f
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.ebgroup.elektrobit.com (envelope-sender
	<steffen.pankratz@elektrobit.com>) (MIMEDefang) with ESMTP id
	t63AtPaq027040; Fri, 03 Jul 2015 13:55:25 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Fri,  3 Jul 2015 13:55:24 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Fri, 3 Jul 2015 12:55:24 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libdrm: Upgrade to 2.4.62
Thread-Index: AdC1Z8p3zllC9RjxR9meZsKny4a3+P//4umA///dzGCAAEI6AP//1eFw
Date: Fri, 3 Jul 2015 10:55:23 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A8DC@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836@deeres07.ebgroup.elektrobit.com>
	<CAHiDW_FZoQudwPMdV-zTF-SZ2OVoAjNXuoYY8vUTkSQfoMXDtQ@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364939A858@deeres07.ebgroup.elektrobit.com>
	<CAJTo0LZaxAkJtQm6cTnLxaEDESRqiQPWbRNwDTjOt+0g3MVZ=Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZaxAkJtQm6cTnLxaEDESRqiQPWbRNwDTjOt+0g3MVZ=Q@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.bittium.com [127.0.0.1]);
	Fri, 03 Jul 2015 13:55:32 +0300 (EEST)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.bittium.com [172.16.0.202]);
	Fri, 03 Jul 2015 13:55:25 +0300 (EEST)
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
X-List-Received-Date: Fri, 03 Jul 2015 10:55:34 -0000
X-Groupsio-MsgNum: 67526
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364939A8DCdeeres07ebgroup_"

--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364939A8DCdeeres07ebgroup_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogQnVydG9uLCBSb3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwu
Y29tXSANClNlbnQ6IEZyaWRheSwgSnVseSAwMywgMjAxNSAxMjoyMSBQTQ0K
VG86IFBhbmtyYXR6LCBTdGVmZmVuDQpDYzogT0UtY29yZQ0KU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGxpYmRybTogVXBncmFkZSB0byAyLjQu
NjINCg0KSGkgUm9zcw0KDQo+IE9uIDMgSnVseSAyMDE1IGF0IDA5OjMwLCA8
U3RlZmZlbi5QYW5rcmF0ekBlbGVrdHJvYml0LmNvbT4gd3JvdGU6DQo+ICtT
UkNfVVJJICs9ICJmaWxlOi8vaW5zdGFsbHRlc3RzLnBhdGNoICINCj4gDQo+
IFRoaXMgcGF0Y2ggZG9lc24ndCBhcHBseS4NCg0KTXkgYmFkLCBJIGZvcmdl
dCB0byBpbmNsdWRlIHRoZSB1cGRhdGVkIHBhdGNoLg0KSSBoYXZlIHVwZGF0
ZWQgbXkgcGF0Y2g6DQoqIHJlbW92ZWQgdGhlIGNvbW1lbnQgcmVnYXJkaW5n
IFZhbGdyaW5kDQoqIGluY2x1ZGVkIHRoZSB1cGRhdGVkIGluc3RhbGx0ZXN0
cy5wYXRjaCBmaWxlDQoNClNoYWxsIEkgcmViYXNlIG15IHBhdGNoIG9uIHlv
dXIgJyBsaWJkcm06IHJlbW92ZSBnaXQgcmVjaXBlLCBtZXJnZSBpbmMnIHBh
dGNoPw0KDQoNClJlZ2FyZHMNCi1TdGVmZmVuDQoNCkZyb20gNjRmMWE5NWY5
OGU1NDY5ZTRiNzFkY2YzMjgxNTdkZjdmMWQ1ZDQ0NiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDENCkZyb206IFN0ZWZmZW4gUGFua3JhdHogPHN0ZWZmZW4u
cGFua3JhdHpAZWxla3Ryb2JpdC5jb20+DQpEYXRlOiBGcmksIDMgSnVsIDIw
MTUgMTA6NTE6MjYgKzAwMDANClN1YmplY3Q6IFtQQVRDSF0gbGliZHJtOiBV
cGdyYWRlIHRvIDIuNC42Mg0KDQpTaWduZWQtb2ZmLWJ5OiBTdGVmZmVuIFBh
bmtyYXR6IDxzdGVmZmVuLnBhbmtyYXR6QGVsZWt0cm9iaXQuY29tPg0KLS0t
DQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm0vaW5zdGFsbHRl
c3RzLnBhdGNoIHwgOCArKysrLS0tLQ0KIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9kcm0vbGliZHJtXzIuNC41OS5iYiAgICAgICAgICB8IDYgLS0tLS0tDQog
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjYyLmJiICAg
ICAgICAgIHwgOCArKysrKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC41OS5i
Yg0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
ZHJtL2xpYmRybV8yLjQuNjIuYmINCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9kcm0vbGliZHJtL2luc3RhbGx0ZXN0cy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtL2luc3RhbGx0ZXN0
cy5wYXRjaA0KaW5kZXggMDNkNjI1NC4uMTE3NWRhZSAxMDA2NDQNCi0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtL2luc3RhbGx0ZXN0
cy5wYXRjaA0KKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJk
cm0vaW5zdGFsbHRlc3RzLnBhdGNoDQpAQCAtOCw3ICs4LDcgQEAgZGlmZiAt
LWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0N
CiBpbmRleCBiZjE5ODdmLi5kOTA5ZTE5IDEwMDY0NA0KIC0tLSBhL3Rlc3Rz
L01ha2VmaWxlLmFtDQogKysrIGIvdGVzdHMvTWFrZWZpbGUuYW0NCi1AQCAt
NiwxMCArNiwxMSBAQCBBTV9DUFBGTEFHUyA9IFwNCitAQCAtMjcsMTAgKzI3
LDExIEBAIEFNX0NQUEZMQUdTID0gXA0KICANCiAgTERBREQgPSAkKHRvcF9i
dWlsZGRpcikvbGliZHJtLmxhDQogIA0KQEAgLTE4LDYgKzE4LDYgQEAgaW5k
ZXggYmYxOTg3Zi4uZDkwOWUxOSAxMDA2NDQNCiAgCWRybXN0YXQNCiAgDQog
K2NoZWNrX1BST0dSQU1TID0NCi0gU1VCRElSUyA9IG1vZGVwcmludCBwcm9w
dGVzdA0KLSANCi0gaWYgSEFWRV9MSUJLTVMNCisgaWYgSEFWRV9OT1VWRUFV
DQorIFNVQkRJUlMgKz0gbm91dmVhdQ0KKyBlbmRpZg0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC41OS5iYiBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC41OS5iYg0K
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAxNGJmNDRhLi4wMDAw
MDAwDQotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8y
LjQuNTkuYmINCisrKyAvZGV2L251bGwNCkBAIC0xLDYgKzAsMCBAQA0KLXJl
cXVpcmUgbGliZHJtLmluYw0KLQ0KLVNSQ19VUkkgKz0gImZpbGU6Ly9pbnN0
YWxsdGVzdHMucGF0Y2ggIg0KLQ0KLVNSQ19VUklbbWQ1c3VtXSA9ICJkMzJh
MWQzN2MyNTQ2ZWUxMWZjNTkyNGFiZWVkYjIzZSINCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNjhkMjZlMWZkODU1ODJmNDI0M2Q2Njg2NGY5YjQzY2E0ZWU5
MzY2MjgyNWRlMzJiNTUwNmZjOGUxODFlYTQxYiINCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuNjIuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuNjIuYmINCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi43M2YwODIxDQot
LS0gL2Rldi9udWxsDQorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJt
L2xpYmRybV8yLjQuNjIuYmINCkBAIC0wLDAgKzEsOCBAQA0KK3JlcXVpcmUg
bGliZHJtLmluYw0KKw0KK1NSQ19VUkkgKz0gImZpbGU6Ly9pbnN0YWxsdGVz
dHMucGF0Y2ggIg0KKw0KK1NSQ19VUklbbWQ1c3VtXSA9ICJjOTI5MWJhZTBl
NWNhNjVkMTQ4MzgyMWQzNjk4ZDNhYiINCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOTA2YzI5NGJkYmUxYzk0YzNjYTA4NDMwNWQ2MWE2ZTVhODM2N2YzYjQ5
ODZlNmNjMTNiMWU5YjNmNzU5MzFkYyINCisNCitFWFRSQV9PRUNPTkYgKz0g
Ii0tZGlzYWJsZS12YWxncmluZCINCi0tIA0KMS45LjENCg0KCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tClBsZWFzZSBub3RlOiBUaGlzIGUtbWFpbCBtYXkgY29u
dGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24KaW50ZW5kZWQgc29sZWx5
IGZvciB0aGUgYWRkcmVzc2VlLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlz
CmUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIGRvIG5vdCBkaXNjbG9zZSBpdCB0
byBhbnlvbmUsIG5vdGlmeQp0aGUgc2VuZGVyIHByb21wdGx5LCBhbmQgZGVs
ZXRlIHRoZSBtZXNzYWdlIGZyb20geW91ciBzeXN0ZW0uClRoYW5rIHlvdS4K
Cg==

--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364939A8DCdeeres07ebgroup_
Content-Type: application/octet-stream;
	name="0001-libdrm-Upgrade-to-2.4.62.patch"
Content-Description: 0001-libdrm-Upgrade-to-2.4.62.patch
Content-Disposition: attachment;
	filename="0001-libdrm-Upgrade-to-2.4.62.patch"; size=2279;
	creation-date="Fri, 03 Jul 2015 08:02:36 GMT";
	modification-date="Fri, 03 Jul 2015 10:51:51 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2NGYxYTk1Zjk4ZTU0NjllNGI3MWRjZjMyODE1N2RmN2YxZDVkNDQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmZmVuIFBhbmtyYXR6IDxzdGVmZmVuLnBhbmtyYXR6QGVs
ZWt0cm9iaXQuY29tPgpEYXRlOiBGcmksIDMgSnVsIDIwMTUgMTA6NTE6MjYgKzAwMDAKU3ViamVj
dDogW1BBVENIXSBsaWJkcm06IFVwZ3JhZGUgdG8gMi40LjYyCgpTaWduZWQtb2ZmLWJ5OiBTdGVm
ZmVuIFBhbmtyYXR6IDxzdGVmZmVuLnBhbmtyYXR6QGVsZWt0cm9iaXQuY29tPgotLS0KIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtL2luc3RhbGx0ZXN0cy5wYXRjaCB8IDggKysrKy0t
LS0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC41OS5iYiAgICAgICAgICB8
IDYgLS0tLS0tCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuNjIuYmIgICAg
ICAgICAgfCA4ICsrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9k
cm0vbGliZHJtXzIuNC41OS5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9kcm0vbGliZHJtXzIuNC42Mi5iYgoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9kcm0vbGliZHJtL2luc3RhbGx0ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9kcm0vbGliZHJtL2luc3RhbGx0ZXN0cy5wYXRjaAppbmRleCAwM2Q2MjU0Li4xMTc1ZGFlIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybS9pbnN0YWxsdGVzdHMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm0vaW5zdGFsbHRlc3Rz
LnBhdGNoCkBAIC04LDcgKzgsNyBAQCBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUuYW0gYi90
ZXN0cy9NYWtlZmlsZS5hbQogaW5kZXggYmYxOTg3Zi4uZDkwOWUxOSAxMDA2NDQKIC0tLSBhL3Rl
c3RzL01ha2VmaWxlLmFtCiArKysgYi90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTYsMTAgKzYsMTEg
QEAgQU1fQ1BQRkxBR1MgPSBcCitAQCAtMjcsMTAgKzI3LDExIEBAIEFNX0NQUEZMQUdTID0gXAog
IAogIExEQUREID0gJCh0b3BfYnVpbGRkaXIpL2xpYmRybS5sYQogIApAQCAtMTgsNiArMTgsNiBA
QCBpbmRleCBiZjE5ODdmLi5kOTA5ZTE5IDEwMDY0NAogIAlkcm1zdGF0CiAgCiArY2hlY2tfUFJP
R1JBTVMgPQotIFNVQkRJUlMgPSBtb2RlcHJpbnQgcHJvcHRlc3QKLSAKLSBpZiBIQVZFX0xJQktN
UworIGlmIEhBVkVfTk9VVkVBVQorIFNVQkRJUlMgKz0gbm91dmVhdQorIGVuZGlmCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuNTkuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuNTkuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDE0YmY0NGEuLjAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2Ry
bS9saWJkcm1fMi40LjU5LmJiCisrKyAvZGV2L251bGwKQEAgLTEsNiArMCwwIEBACi1yZXF1aXJl
IGxpYmRybS5pbmMKLQotU1JDX1VSSSArPSAiZmlsZTovL2luc3RhbGx0ZXN0cy5wYXRjaCAiCi0K
LVNSQ19VUklbbWQ1c3VtXSA9ICJkMzJhMWQzN2MyNTQ2ZWUxMWZjNTkyNGFiZWVkYjIzZSIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI2OGQyNmUxZmQ4NTU4MmY0MjQzZDY2ODY0ZjliNDNjYTRlZTkz
NjYyODI1ZGUzMmI1NTA2ZmM4ZTE4MWVhNDFiIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2RybS9saWJkcm1fMi40LjYyLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9s
aWJkcm1fMi40LjYyLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjczZjA4
MjEKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8y
LjQuNjIuYmIKQEAgLTAsMCArMSw4IEBACityZXF1aXJlIGxpYmRybS5pbmMKKworU1JDX1VSSSAr
PSAiZmlsZTovL2luc3RhbGx0ZXN0cy5wYXRjaCAiCisKK1NSQ19VUklbbWQ1c3VtXSA9ICJjOTI5
MWJhZTBlNWNhNjVkMTQ4MzgyMWQzNjk4ZDNhYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MDZj
Mjk0YmRiZTFjOTRjM2NhMDg0MzA1ZDYxYTZlNWE4MzY3ZjNiNDk4NmU2Y2MxM2IxZTliM2Y3NTkz
MWRjIgorCitFWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS12YWxncmluZCIKLS0gCjEuOS4xCgo=

--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364939A8DCdeeres07ebgroup_--
