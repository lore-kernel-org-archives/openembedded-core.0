Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5ACDB7F59D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B6673184AE;
	Thu, 17 Oct 2019 15:11:00 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BnfqTXQbFYw8; Thu, 17 Oct 2019 15:10:59 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B5C9C1847D;
	Thu, 17 Oct 2019 15:10:59 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42C021E07E;
	Thu, 17 Oct 2019 15:10:59 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 359E31E078;
	Thu, 17 Oct 2019 15:10:59 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 17 Oct 2019 15:10:59 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 28E3A195C;
	Thu, 17 Oct 2019 15:10:59 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 17 Oct 2019 15:10:59 +0200
Received: from XBOX03.axis.com (10.0.5.17) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 17 Oct 2019 15:10:58 +0200
Received: from XBOX03.axis.com ([fe80::e49e:4060:87cc:61a]) by XBOX03.axis.com
	([fe80::e49e:4060:87cc:61a%22]) with mapi id 15.00.1365.000;
	Thu, 17 Oct 2019 15:10:58 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [warrior][PATCH 7/8] devtool: finish: Add suppport for
	the --no-clean option
Thread-Index: AQHVhF/MeB+PkpfQW0mlDi4YEqFcRqddvYMg
Date: Thu, 17 Oct 2019 13:10:58 +0000
Message-ID: <8e71858cc74c4d06a11d6f2d386be09c@XBOX03.axis.com>
References: <cover.1571243326.git.pkj@axis.com>
	<bdaf3cd8bb68282d2039c3aacaf6eca19a94418d.1571243326.git.pkj@axis.com>
	<8bc62b53-7f27-9c16-e89e-4825a15c8bf9@gmail.com>
In-Reply-To: <8bc62b53-7f27-9c16-e89e-4825a15c8bf9@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [warrior][PATCH 7/8] devtool: finish: Add suppport for the --no-clean option
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
X-List-Received-Date: Thu, 17 Oct 2019 13:11:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBha3VzdGVyODA4IDxha3VzdGVy
ODA4QGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDE2IG9rdG9iZXIgMjAxOSAyMjoyNQ0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVuZW1i
ZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFt3YXJyaW9yXVtQQVRDSCA3LzhdIGRldnRvb2w6IGZpbmlzaDogQWRkDQo+IHN1cHBw
b3J0IGZvciB0aGUgLS1uby1jbGVhbiBvcHRpb24NCj4gDQo+IE9uIDEwLzE2LzE5IDk6MzAgQU0s
IFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBLamVsbGVyc3RlZHQg
PHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPg0KPiA+IFRoaXMgd29ya3MganVzdCBs
aWtlIHRoZSBhbHJlYWR5IGV4aXN0aW5nIC0tbm8tY2xlYW4gb3B0aW9uIHRvIHRoZQ0KPiA+IGBk
ZXZ0b29sIHJlc2V0YCBjb21tYW5kLg0KPiB3aGF0IHByb2JsZW0gaXMgdGhpcyBzb2x2aW5nIGlu
IHdhcnJpb3I/DQo+IC1hIHJtaW4NCg0KS2VlcGluZyB0aGUgZGV2ZWxvcG1lbnQgdG9vbHMgaW4g
c3luYyB3aXRoIG1hc3RlciBzbyBvbmUgY2FuIHVzZSB0aGUgDQpzYW1lIG9wdGlvbnMgd2hlbiB3
b3JraW5nIHJlZ2FyZGxlc3Mgb2YgaWYgb25lIGlzIHdvcmtpbmcgd2l0aCBXYXJyaW9yIA0Kb3Ig
WmV1cy4gU2luY2UgaXQgZG9lcyBub3QgYWZmZWN0IHdoYXQgaXMgYnVpbHQgYW5kIGdvZXMgaW50
byB0aGUgcm9vdGZzLCANCml0IHNob3VsZCBub3QgYmUgYSBwcm9ibGVtIHRoYXQgaXQgdGVjaG5p
Y2FsbHkgaXMgYSBuZXcgZmVhdHVyZS4NCg0KLy9QZXRlcg0KDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4NCj4gPiAtLS0NCj4gPiAgc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5w
eSB8IDMgKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2xpYi9kZXZ0b29sL3N0YW5kYXJk
LnB5DQo+IGIvc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weQ0KPiA+IGluZGV4IGI5NDRl
YzM5NjYuLmFlYjk0NTJhOGEgMTAwNjQ0DQo+ID4gLS0tIGEvc2NyaXB0cy9saWIvZGV2dG9vbC9z
dGFuZGFyZC5weQ0KPiA+ICsrKyBiL3NjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkNCj4g
PiBAQCAtMTg5NSw3ICsxODk1LDcgQEAgZGVmIGZpbmlzaChhcmdzLCBjb25maWcsIGJhc2VwYXRo
LCB3b3Jrc3BhY2UpOg0KPiA+ICAgICAgICAgIGVsc2U6DQo+ID4gICAgICAgICAgICAgIHJhaXNl
IERldnRvb2xFcnJvcignU291cmNlIHRyZWUgaXMgbm90DQo+IGNsZWFuOlxuXG4lc1xuRW5zdXJl
IHlvdSBoYXZlIGNvbW1pdHRlZCB5b3VyIGNoYW5nZXMgb3IgdXNlIC1mLy0tZm9yY2UNCj4gaWYg
eW91IGFyZSBzdXJlIHRoZXJlXCdzIG5vdGhpbmcgdGhhdCBuZWVkcyB0byBiZSBjb21taXR0ZWQn
ICUgZGlydHkpDQo+ID4NCj4gPiAtICAgIG5vX2NsZWFuID0gRmFsc2UNCj4gPiArICAgIG5vX2Ns
ZWFuID0gYXJncy5ub19jbGVhbg0KPiA+ICAgICAgdGluZm9pbCA9IHNldHVwX3RpbmZvaWwoYmFz
ZXBhdGg9YmFzZXBhdGgsIHRyYWNraW5nPVRydWUpDQo+ID4gICAgICB0cnk6DQo+ID4gICAgICAg
ICAgcmQgPSBwYXJzZV9yZWNpcGUoY29uZmlnLCB0aW5mb2lsLCBhcmdzLnJlY2lwZW5hbWUsIFRy
dWUpDQo+ID4gQEAgLTIxNjksNiArMjE2OSw3IEBAIGRlZiByZWdpc3Rlcl9jb21tYW5kcyhzdWJw
YXJzZXJzLCBjb250ZXh0KToNCj4gPiAgICAgIHBhcnNlcl9maW5pc2guYWRkX2FyZ3VtZW50KCct
LW1vZGUnLCAnLW0nLCBjaG9pY2VzPVsncGF0Y2gnLA0KPiAnc3JjcmV2JywgJ2F1dG8nXSwgZGVm
YXVsdD0nYXV0bycsIGhlbHA9J1VwZGF0ZSBtb2RlICh3aGVyZSAlKG1ldGF2YXIpcw0KPiBpcyAl
KGNob2ljZXMpczsgZGVmYXVsdCBpcyAlKGRlZmF1bHQpcyknLCBtZXRhdmFyPSdNT0RFJykNCj4g
PiAgICAgIHBhcnNlcl9maW5pc2guYWRkX2FyZ3VtZW50KCctLWluaXRpYWwtcmV2JywgaGVscD0n
T3ZlcnJpZGUNCj4gc3RhcnRpbmcgcmV2aXNpb24gZm9yIHBhdGNoZXMnKQ0KPiA+ICAgICAgcGFy
c2VyX2ZpbmlzaC5hZGRfYXJndW1lbnQoJy0tZm9yY2UnLCAnLWYnLCBhY3Rpb249InN0b3JlX3Ry
dWUiLA0KPiBoZWxwPSdGb3JjZSBjb250aW51aW5nIGV2ZW4gaWYgdGhlcmUgYXJlIHVuY29tbWl0
dGVkIGNoYW5nZXMgaW4gdGhlDQo+IHNvdXJjZSB0cmVlIHJlcG9zaXRvcnknKQ0KPiA+ICsgICAg
cGFyc2VyX2ZpbmlzaC5hZGRfYXJndW1lbnQoJy0tbm8tY2xlYW4nLCAnLW4nLA0KPiBhY3Rpb249
InN0b3JlX3RydWUiLCBoZWxwPSdEb25cJ3QgY2xlYW4gdGhlIHN5c3Jvb3QgdG8gcmVtb3ZlIHJl
Y2lwZQ0KPiBvdXRwdXQnKQ0KPiA+ICAgICAgcGFyc2VyX2ZpbmlzaC5hZGRfYXJndW1lbnQoJy0t
bm8tb3ZlcnJpZGVzJywgJy1PJywNCj4gYWN0aW9uPSJzdG9yZV90cnVlIiwgaGVscD0nRG8gbm90
IGhhbmRsZSBvdGhlciBvdmVycmlkZSBicmFuY2hlcyAoaWYNCj4gdGhleSBleGlzdCknKQ0KPiA+
ICAgICAgcGFyc2VyX2ZpbmlzaC5hZGRfYXJndW1lbnQoJy0tZHJ5LXJ1bicsICctTicsDQo+IGFj
dGlvbj0ic3RvcmVfdHJ1ZSIsIGhlbHA9J0RyeS1ydW4gKGp1c3QgcmVwb3J0IGNoYW5nZXMgaW5z
dGVhZCBvZg0KPiB3cml0aW5nIHRoZW0pJykNCj4gPiAgICAgIHBhcnNlcl9maW5pc2guYWRkX2Fy
Z3VtZW50KCctLWZvcmNlLXBhdGNoLXJlZnJlc2gnLA0KPiBhY3Rpb249InN0b3JlX3RydWUiLCBo
ZWxwPSdVcGRhdGUgcGF0Y2hlcyBpbiB0aGUgbGF5ZXIgZXZlbiBpZiB0aGV5DQo+IGhhdmUgbm90
IGJlZW4gbW9kaWZpZWQgKHVzZWZ1bCBmb3IgcmVmcmVzaGluZyBwYXRjaCBjb250ZXh0KScpDQoN
Cg==

