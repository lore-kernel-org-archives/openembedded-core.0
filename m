Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4C4965FFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:33:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8G1XYr2014019
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 18:33:34 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.165]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Mon, 15 Sep 2014 18:33:34 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "BURTON, ROSS" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libgcrypt: Fix ARM assembly when building
	__PIC__
Thread-Index: AQHP0PCpp4Ye7fC5w0uL+1vmZFmoN5wC+fhA
Date: Tue, 16 Sep 2014 01:33:32 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD4F3AF2@ALA-MBA.corp.ad.wrs.com>
References: <1410776160-23885-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0La5gLNDcuwj3TawqphFg2N-a74=nDH_DL7u-crY09KPSw@mail.gmail.com>
In-Reply-To: <CAJTo0La5gLNDcuwj3TawqphFg2N-a74=nDH_DL7u-crY09KPSw@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.134]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Fix ARM assembly when building __PIC__
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
X-List-Received-Date: Tue, 16 Sep 2014 01:33:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAx
NSwgMjAxNCAxMDoyMyBQTQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0KPiBDYzogT0UtY29y
ZQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gbGliZ2NyeXB0OiBGaXggQVJNIGFz
c2VtYmx5IHdoZW4gYnVpbGRpbmcgX19QSUNfXw0KPiANCj4gT24gMTUgU2VwdGVtYmVyIDIwMTQg
MTE6MTYsICA8amFja2llLmh1YW5nQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+ICsrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy9saWJnY3J5cHQtMS42LjEtbWFrZS1h
cm0tYXNtLWZQSUMtZnJpZW5kbHkucGF0Y2gNCj4gDQo+IFRoaXMgaXMgbWlzc2luZyB1cHN0cmVh
bS1zdGF0dXMvc2lnbmVkLW9mZi1ieSB0YWdzLg0KDQpJIGhhZCBhZGRlZCB0aGUgc3RhdHVzIGFu
ZCBzaWduZWQtb2ZmLCBjb3VsZCB5b3UgcmUtY2hlY2s/DQoNCitTaWduZWQtb2ZmLWJ5OiBKdXNz
aSBLaXZpbGlubmEgPGp1c3NpLmtpdmlsaW5uYUBpa2kuZmk+DQorDQorVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydA0KKw0KK1NpZ25lZC1vZmYtYnk6IEphY2tpZSBIdWFuZyA8amFja2llLmh1YW5n
QHdpbmRyaXZlci5jb20+DQorLS0tDQoNClRoYW5rcywNCkphY2tpZQ0KDQo+IA0KPiBBbHNvLCBB
bmRyZWEgc2FpZDoNCj4gPiBJbnN0ZWFkIG9mIHBhdGNoaW5nIDEuNi4xLCB3b3VsZG4ndCBpdCBi
ZSBiZXR0ZXIgdG8gdXBkYXRlIHRvIGxpYmdjcnlwdF8xLjYuMiA/DQo+IA0KPiBObywgd2UndmUg
ZmVhdHVyZSBmcm96ZW4gbm93LCBzbyBhIGJhY2twb3J0IGlzIGFwcHJvcHJpYXRlLg0KPiANCj4g
Um9zcw0K

