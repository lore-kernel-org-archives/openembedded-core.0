Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2804C6C62D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C2F541851F;
	Tue, 27 Nov 2018 20:37:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id fyg2F2mF_pb5; Tue, 27 Nov 2018 20:37:53 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7286E18502;
	Tue, 27 Nov 2018 20:37:53 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F8A01E081;
	Tue, 27 Nov 2018 20:37:53 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 540491E07F;
	Tue, 27 Nov 2018 20:37:53 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 27 Nov 2018 20:37:53 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 4769A19B9;
	Tue, 27 Nov 2018 20:37:53 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 27 Nov 2018 20:37:52 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 27 Nov 2018 20:37:53 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] devshell.bbclass/terminal.bbclass: add a shell
	check at devshell
Thread-Index: AQHUhStYEwIDYW5r1kCzvIXxFS7g+KVkBXIA
Date: Tue, 27 Nov 2018 19:37:53 +0000
Message-ID: <107e5ff05d0e463cb5fceb2e9657a023@XBOX04.axis.com>
References: <1535958596-11573-1-git-send-email-hongxu.jia@windriver.com>
	<3c29358c-8127-fdda-c6ad-26adcc8b1193@windriver.com>
In-Reply-To: <3c29358c-8127-fdda-c6ad-26adcc8b1193@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] devshell.bbclass/terminal.bbclass: add a shell check at devshell
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
X-List-Received-Date: Tue, 27 Nov 2018 19:37:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBIb25neHUgSmlhDQo+IFNl
bnQ6IGRlbiAyNiBub3ZlbWJlciAyMDE4IDAyOjU3DQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnOyBSaWNoYXJkIFB1cmRpZQ0KPiA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGRl
dnNoZWxsLmJiY2xhc3MvdGVybWluYWwuYmJjbGFzczogYWRkIGENCj4gc2hlbGwgY2hlY2sgYXQg
ZGV2c2hlbGwNCj4gDQo+IFBpbmcsIGFueSBjb21tZW50cz8NCj4gDQo+IC8vSG9uZ3h1DQo+IA0K
PiBPbiAyMDE4LzkvMyDkuIvljYgzOjA5LCBIb25neHUgSmlhIHdyb3RlOg0KPiA+IFdoaWxlIHZh
ci1TSEVMTCBpcyBuZWl0aGVyIGBiYXNoJyBvciBgZGFzaCcsIHN1Y2ggYXMNCj4gPiBgY3NoJywg
bG9hZGluZyB0aGUgd3JhcHBlciBzY3JpcHQgd2lsbCBmYWlsIGF0IGRldnNoZWxsLA0KPiA+IGJl
Y2F1c2UgY3NoIGRvZXMgbm90IHN1cHBvcnQgc3ludGF4IGBleHBvcnQnLg0KPiA+DQo+ID4gQWRk
IGEgc2hlbGwgY2hlY2sgYXQgZGV2c2hlbGwsIGFuZCB1c2UgYC9iaW4vc2gnIHRvIHJlcGxhY2UN
Cj4gPiBpZiBzaGVsbCBpcyBuZWl0aGVyIGBiYXNoJyBvciBgZGFzaCcuIGAvYmluL3NoJyBpcyBz
YWZlIHRvDQo+ID4gdXNlIHNpbmNlIGBlY2RmZGQ3IHNhbml0eS5iYmNsYXNzOiBjaGVjayAvYmlu
L3NoIGlzIGRhc2gNCj4gPiBvciBiYXNoJw0KDQpJIHNpbXBseSBmYWlsIHRvIHVuZGVyc3RhbmQg
d2h5IGFsbCB0aGlzIG1lc3NpbmcgYXJvdW5kIGlzIG5lZWRlZC4gDQpXaHkgdXNlICR7U0hFTEx9
IGF0IGFsbD8gV2h5IG5vdCBhbHdheXMgdXNlIC9iaW4vc2g/IFdlIGtub3cgaXQgDQppcyBlaXRo
ZXIgL2Jpbi9iYXNoIG9yIC9iaW4vZGFzaCwgYW5kIGVpdGhlciBzaG91bGQgYmUgZmluZSB0byB1
c2UgDQp0byBydW4gdGhlIHdyYXBwZXIgc2NyaXB0Lg0KDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+DQo+ID4gLS0tDQo+ID4gICBt
ZXRhL2NsYXNzZXMvZGV2c2hlbGwuYmJjbGFzcyB8IDQgKysrKw0KPiA+ICAgbWV0YS9jbGFzc2Vz
L3Rlcm1pbmFsLmJiY2xhc3MgfCA0ICsrKy0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFz
c2VzL2RldnNoZWxsLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvZGV2c2hlbGwuYmJjbGFzcw0KPiA+
IGluZGV4IGZkZjdkYzEuLmM0NzY1ZGIgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2Rl
dnNoZWxsLmJiY2xhc3MNCj4gPiArKysgYi9tZXRhL2NsYXNzZXMvZGV2c2hlbGwuYmJjbGFzcw0K
PiA+IEBAIC0zLDYgKzMsMTAgQEAgaW5oZXJpdCB0ZXJtaW5hbA0KPiA+ICAgREVWU0hFTEwgPSAi
JHtTSEVMTH0iDQo+ID4NCj4gPiAgIHB5dGhvbiBkb19kZXZzaGVsbCAoKSB7DQo+ID4gKyAgICBk
ZXZzaGVsbCA9IGQuZ2V0VmFyKCdERVZTSEVMTCcpDQo+ID4gKyAgICBkZXZzaGVsbCA9IGRldnNo
ZWxsIGlmIGRldnNoZWxsLmVuZHN3aXRoKCJiYXNoIikgb3IgZGV2c2hlbGwuZW5kc3dpdGgoImRh
c2giKSBlbHNlICcvYmluL3NoJw0KPiA+ICsgICAgZC5zZXRWYXIoJ0RFVlNIRUxMJywgZGV2c2hl
bGwpDQo+ID4gKw0KPiA+ICAgICAgIGlmIGQuZ2V0VmFyRmxhZygiZG9fZGV2c2hlbGwiLCAibWFu
dWFsZmFrZXJvb3QiKToNCj4gPiAgICAgICAgICBkLnByZXBlbmRWYXIoIkRFVlNIRUxMIiwgInBz
ZXVkbyAiKQ0KPiA+ICAgICAgICAgIGZha2VlbnYgPSBkLmdldFZhcigiRkFLRVJPT1RFTlYiKS5z
cGxpdCgpDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy90ZXJtaW5hbC5iYmNsYXNzIGIv
bWV0YS9jbGFzc2VzL3Rlcm1pbmFsLmJiY2xhc3MNCj4gPiBpbmRleCA3M2U3NjVkLi5mNDI3NTM4
IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy90ZXJtaW5hbC5iYmNsYXNzDQo+ID4gKysr
IGIvbWV0YS9jbGFzc2VzL3Rlcm1pbmFsLmJiY2xhc3MNCj4gPiBAQCAtMjUsNyArMjUsOSBAQCBk
ZWYgZW1pdF90ZXJtaW5hbF9mdW5jKGNvbW1hbmQsIGVudmRhdGEsIGQpOg0KPiA+ICAgICAgIGJi
LnV0aWxzLm1rZGlyaGllcihvcy5wYXRoLmRpcm5hbWUocnVuZmlsZSkpDQo+ID4NCj4gPiAgICAg
ICB3aXRoIG9wZW4ocnVuZmlsZSwgJ3cnKSBhcyBzY3JpcHQ6DQo+ID4gLSAgICAgICAgc2NyaXB0
LndyaXRlKCcjIS91c3IvYmluL2VudiAlc1xuJyAlIGQuZ2V0VmFyKCdTSEVMTCcpKQ0KPiA+ICsg
ICAgICAgIHNoZWxsID0gZC5nZXRWYXIoJ1NIRUxMJykNCj4gPiArICAgICAgICBzaGVsbCA9IHNo
ZWxsIGlmIHNoZWxsLmVuZHN3aXRoKCJiYXNoIikgb3Igc2hlbGwuZW5kc3dpdGgoImRhc2giKSBl
bHNlICcvYmluL3NoJw0KPiA+ICsgICAgICAgIHNjcmlwdC53cml0ZSgnIyEvdXNyL2Jpbi9lbnYg
JXNcbicgJSBzaGVsbCkNCj4gPiAgICAgICAgICAgc2NyaXB0LndyaXRlKCdzZXQgLWVcbicpDQo+
ID4gICAgICAgICAgIGJiLmRhdGEuZW1pdF9mdW5jKGNtZF9mdW5jLCBzY3JpcHQsIGVudmRhdGEp
DQo+ID4gICAgICAgICAgIHNjcmlwdC53cml0ZShjbWRfZnVuYykNCj4gDQoNCi8vUGV0ZXINCg0K

