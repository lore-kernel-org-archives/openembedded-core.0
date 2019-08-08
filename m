Return-Path: <jacob.kroon@mikrodidakt.se>
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20093.outbound.protection.outlook.com [40.107.2.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE937F2F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 10:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Rpgkye59vh2IZhDiGcGhbs/51soSipG6FQEeMa0w4M+EZvjnDH3oMLdA0tbwBiaFivM/SIcqC/NN4BrUX0N9Zf/K+yDyQAXcsROVNGPMMzKtWFkSxTeppUGXqMVfmheCMiD1d4TofiLZ5qGFYWOUjlkT7/0khb0p6Wym+xgcKXsWeC6txdYip09OTFN8CPbl/+DLfVFsq5OKBoyhDI6xB3dcd2eIGq+pOdE5mffVEXr6+jmfJdIgjE4V+U6q/vf94RBKEmBQpY7RNRhshgU8IV7XlYeCYanCXtHi/baGaT/CHGM0fUVTEft8nqOJFhH+QXw16xDfPSPxO5oRmf6d7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AmGkuOlTXdJ2/Gyg1M2ZsfcvWpar7jl6ICKrshwc6sA=;
	b=ipnkCuxBTDNufj2eqrCM5bp6NoD29OXkj4Qz9lHLreKHaOwcmlPtfN7O72cGe8Y+YpNfYhnj5Wz8CXdprJUS5O1CkZM3WGdLZwbO2PH/2y7gMXTw+fxvuXu7G7vLWfvR3NiwB3sTyui7Q5UEd2+oC1p56G+yaKEJtWCmLAAbCzAKIBjA6GxtvVKtogAkxbBTZ8Fr/bBlm4SdwJZjtWe1E3wSfQz21bdIfpS2s/a22Of60A5/Hm9QHQRsl659M+Hd3iRyaHpEPYmOTWa/GjdrOc+NjKrjksAya5fgZfzet+zjFvua3yYRuqbeqvIoWx333JPZKF6iAPsRKQWIQzmWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=mikrodidakt.se; dmarc=pass action=none
	header.from=mikrodidakt.se; dkim=pass header.d=mikrodidakt.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ugglorna.onmicrosoft.com; s=selector1-ugglorna-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AmGkuOlTXdJ2/Gyg1M2ZsfcvWpar7jl6ICKrshwc6sA=;
	b=M3FgF1lHNSr3WQFbKRD7tzzZHwmtHoSHAdlgxzZpi1NciPLwZTceHOXxt7193Rt4+b9iTbV3rkRNvxH+H41C4HOKZhNEAcWpuIGj3zMLa/uDlR3uhLAxRWZiqEEGc2XFW/SsC2FmRRuwxykGbx1MqtrqbQ3dZQsaxFSirPaYoZo=
Received: from AM6PR08MB3205.eurprd08.prod.outlook.com (52.135.166.20) by
	AM6PR08MB3318.eurprd08.prod.outlook.com (52.135.163.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.16; Thu, 8 Aug 2019 10:18:21 +0000
Received: from AM6PR08MB3205.eurprd08.prod.outlook.com
	([fe80::20a0:fa68:2f63:5a7a]) by
	AM6PR08MB3205.eurprd08.prod.outlook.com
	([fe80::20a0:fa68:2f63:5a7a%7]) with mapi id 15.20.2136.022;
	Thu, 8 Aug 2019 10:18:20 +0000
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Hash Equivalency - What this means for developer
	productivity
Thread-Index: AQHVTdKaE45LLRZifUmcKQI3LGCxog==
Date: Thu, 8 Aug 2019 10:18:20 +0000
Message-ID: <3d17555f-62a3-ecfb-45be-afd08cc1156f@mikrodidakt.se>
References: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
In-Reply-To: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR04CA0147.eurprd04.prod.outlook.com (2603:10a6:207::31)
	To AM6PR08MB3205.eurprd08.prod.outlook.com
	(2603:10a6:209:4a::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jacob.kroon@mikrodidakt.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.185.29.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 578a2cb0-ceb1-4c3d-d16d-08d71be9bcfa
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);
	SRVR:AM6PR08MB3318; 
x-ms-traffictypediagnostic: AM6PR08MB3318:
x-microsoft-antispam-prvs: <AM6PR08MB33185ACEAB0A9B9D61F19FDA9BD70@AM6PR08MB3318.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(346002)(366004)(376002)(39830400003)(199004)(189003)(31686004)(305945005)(7736002)(6246003)(31696002)(5660300002)(8676002)(36756003)(6512007)(86362001)(25786009)(4326008)(71200400001)(53936002)(66066001)(476003)(2616005)(99286004)(446003)(6116002)(44832011)(81156014)(486006)(110136005)(8936002)(11346002)(81166006)(14454004)(6436002)(6486002)(52116002)(186003)(76176011)(316002)(26005)(3846002)(53546011)(229853002)(71190400001)(102836004)(508600001)(64756008)(66476007)(66556008)(386003)(256004)(66946007)(6506007)(2906002)(66446008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3318;
	H:AM6PR08MB3205.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mikrodidakt.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bjBTOCm1dVddBqY7onI+EoCf89UzdqQxtK3OSNCf3BIaDP8FqaiLpZmFRPOZxHW/T3oz91EKpSo9ZfSEPyWutSTD6zK9c1qy+vxQ/yZSZOWdYicgzYKsuPbmrTXNxdao3eShy+KuDdyZkI9lXFpxtn/QI9WXXlUGBVHGABzt3knOtBKnnR8SjCfLcgQjIJTYUcGueRPMHodhRXr8GlkTw5NNwiPdaYoLdptJHD5t+yqJ6gXCcF0n6Wshlkw9R5uj8S1uvzrNA33bETyOV54LQrXrQ/ehiX75K6zAAA103/5yGPppv23K7TvLUF3qsypXnekiFE8Rt9qEwjghtut/Xqo+Gj5t1vmBnzW3osvx/4FA+ro4kHuF1uoVf+lINLMCV0OmUhDi5B0tgJ9fObfyXfHz6ACnl58feHKbHBce02U=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: mikrodidakt.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 578a2cb0-ceb1-4c3d-d16d-08d71be9bcfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 10:18:20.9487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d8b8e37-ad11-4b86-9071-4e3fa1b980be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacob.kroon@mikrodidakt.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3318
Cc: Joshua Watt <JPEW.hacker@gmail.com>
Subject: Re: Hash Equivalency - What this means for developer productivity
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
X-List-Received-Date: Thu, 08 Aug 2019 10:18:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E843A9ADB9128F488F69A5C2E3C353CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDgvMi8xOSA1OjUzIFBNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gVGhpcyBo
YXMgYmVlbiB0YWxrZWQgYWJvdXQgaW4gYSBsb3Qgb2YgdGhlIHByb2plY3QgbWVldGluZ3MgYnV0
IEkNCj4gd2FudGVkIHRvIGVuc3VyZSBpdHMgb24gdGhlIG1haWxpbmcgbGlzdCB0b28uDQo+DQo+
IG1hc3Rlci1uZXh0IChhbmQgaG9wZWZ1bGx5IHNvb24sIG1hc3Rlcikgbm93IGNvbnRhaW4gcGF0
Y2hlcyB3aGljaA0KPiBlbmFibGUgImhhc2ggZXF1aXZhbGVuY3kiIHN1cHBvcnQgaW4gcnVucXVl
dWUgaW4gYml0YmFrZS4gVGhhdCBkb2Vzbid0DQo+IHNvdW5kIHNvIGludGVyZXN0aW5nIHVudGls
IEkgZXhwbGFpbiB3aGF0IHRoaXMgbWVhbnMuDQo+DQo8c25pcD4NCj4NCj4gSSB0aGluayB0aGlz
IHNob3VsZCBiZSBhICJiaWcgZGVhbCIgZm9yIG1hbnkgZGV2ZWxvcGVycywgcmVkdWNpbmcNCj4g
dW5uZWRlZCByZWJ1aWxkcyBhbmQgaGVuY2Ugc3BlZWRpbmcgdXAgZGV2ZWxvcG1lbnQuDQo+DQo+
IEFzIHdpdGggYW55IG5ldyBmZWF0dXJlLCB0aGVyZSBhcmUgbGlrZWx5IGdvaW5nIHRvIGJlIHNv
bWUgc29tZQ0KPiB0ZWV0aGluZyBpc3N1ZXMgYnV0IEknbSB2ZXJ5IG9waXRtaXN0aWMgYWJvdXQg
c29tZSBvZiB0aGUgYmVuZWZpdHMgdGhpcw0KPiBzaG91bGQgYnJpbmchDQo+DQoNClZlcnkgZXhj
aXRpbmcgc2VlIHRoaXMgZmVhdHVyZSBiZWluZyB3b3JrZWQgb24hIEkgaGF2ZSBoaWdoIGhvcGVz
IGl0IGlzDQpnb25uYSByZWR1Y2UgbXkgYnVpbGQgdGltZXMuDQoNCkkganVzdCB1cGRhdGVkIHRv
IGxhdGVzdCBiaXRiYWtlL29lLWNvcmUgbWFzdGVyIGFuZCBzdGFydGVkIGFuDQppbmNyZW1lbnRh
bCBidWlsZCBvZiBteSBkaXN0cm8gd2l0aCBoYXNoIGVxdWl2YWxlbmN5IGVuYWJsZWQsIGFuZCBy
YW4NCmludG8gb25lIHByb2JsZW06DQoNCkVSUk9SOiBjb3JlLWltYWdlLW1pbmltYWwtMS4wLXIw
IGRvX3Jvb3RmczogVW5hYmxlIHRvIGluc3RhbGwgcGFja2FnZXMuDQo8c25pcD4NCkNvbGxlY3Rl
ZCBlcnJvcnM6DQogICogU29sdmVyIGVuY291bnRlcmVkIDIgcHJvYmxlbShzKToNCiAgKiBQcm9i
bGVtIDEvMjoNCiAgKiAgIC0gbm90aGluZyBwcm92aWRlcyBldWRldiBuZWVkZWQgYnkgPHNuaXA+
DQo8c25pcD4NCiAgKiBQcm9ibGVtIDIvMjoNCiAgKiAgIC0gbm90aGluZyBwcm92aWRlcyB1ZGV2
IG5lZWRlZCBieSA8c25pcD4NCjxzbmlwPg0KDQpDaGVja2luZyB0aGUgYnVpbGQgbG9nIEkgc2Vl
Og0KDQouLi4NCk5PVEU6IFRhc2sNCi9ob21lL2prcm9vbi9Qcm9qZWN0cy88c25pcD4vYnVpbGQv
Li4vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBf
Mi42MC42LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QNCnVuaWhhc2ggY2hhbmdlZCB0bw0KYjg4ZjFi
MDE0MjFjZDc1MDFiMjkwODg4Yjc4M2IwNTdiOTJhN2ZiN2EyMGYzN2ZkMDhhNTZmMmVhZjhjNTZl
ZA0KTk9URTogU2V0c2NlbmUgdGFzaw0KL2hvbWUvamtyb29uL1Byb2plY3RzLzxzbmlwPi9idWls
ZC8uLi9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L2V1ZGV2XzMuMi44
LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QNCm5vdyB2YWxpZCBhbmQgYmVpbmcgcmVydW4NCi4uLg0K
Tk9URTogU2V0c2NlbmUgdGFza3MgY29tcGxldGVkDQoNCk5PVEU6IFRhc2sNCi9ob21lL2prcm9v
bi9Qcm9qZWN0cy88c25pcD4vYnVpbGQvLi4vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9yZWNpcGVz
LWNvcmUvdWRldi9ldWRldl8zLjIuOC5iYjpkb19wYWNrYWdlX3FhDQp1bmloYXNoIGNoYW5nZWQg
dG8NCjYwN2Q0ZWI3ODU5YmY2YzcyNWFkZDc1OTJhMmM4YmQ2NDQ2NGFmYjI1OTI2NDI4MWNiZjJh
M2FkNGUxN2U4ZDINCi4uLg0KTk9URTogVGFzaw0KL2hvbWUvamtyb29uL1Byb2plY3RzLzxzbmlw
Pi9idWlsZC8uLi9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9n
bGliLTIuMF8yLjYwLjYuYmI6ZG9fcGFja2FnZV9xYQ0KdW5paGFzaCBjaGFuZ2VkIHRvDQo4OTQx
M2M2YWZjMjViMzkwNDcxZjBjZWJiNjE5M2EyMjZlMjBhNzQ0YWM4NmI0NzNjMGIxMWY3NDMyYjUx
NjVhDQouLi4NCk5PVEU6IFNldHNjZW5lIHRhc2tzIGNvbXBsZXRlZA0KDQouLi4NCg0KQ2hlY2tp
bmcgZm9yIGJ1aWx0IGlwayBwYWNrYWdlcyBJIHNlZToNCg0KW2prcm9vbkBtYW5hdGFybXMtZ3Jl
eXNrdWxsIDxzbmlwPl0kIGZpbmQNCi90bXAvcmFtZGlzay88c25pcD4vZGVwbG95L2lway98Z3Jl
cCBldWRldg0KL3RtcC9yYW1kaXNrLzxzbmlwPi9kZXBsb3kvaXBrL2k2ODYvZXVkZXYtZGJnXzMu
Mi44LXIwX2k2ODYuaXBrDQovdG1wL3JhbWRpc2svPHNuaXA+L2RlcGxveS9pcGsvaTY4Ni9ldWRl
di1kZXZfMy4yLjgtcjBfaTY4Ni5pcGsNCg0KSWYgSSB0aGVuIGRvOg0KDQpiaXRiYWtlIC1jIGNs
ZWFuc3N0YXRlIGV1ZGV2DQpiaXRiYWtlIGV1ZGV2DQoNCnRoZW4gSSBnZXQ6DQoNCltqa3Jvb25A
bWFuYXRhcm1zLWdyZXlza3VsbCA8c25pcD5dJCBmaW5kDQovdG1wL3JhbWRpc2svPHNuaXA+L2Rl
cGxveS9pcGsvfGdyZXAgZXVkZXYNCi90bXAvcmFtZGlzay88c25pcD4vZGVwbG95L2lway9pNjg2
L2V1ZGV2LWRldl8zLjIuOC1yMF9pNjg2Lmlwaw0KL3RtcC9yYW1kaXNrLzxzbmlwPi9kZXBsb3kv
aXBrL2k2ODYvZXVkZXYtZGJnXzMuMi44LXIwX2k2ODYuaXBrDQovdG1wL3JhbWRpc2svPHNuaXA+
L2RlcGxveS9pcGsvaTY4Ni9ldWRldi1od2RiXzMuMi44LXIwX2k2ODYuaXBrDQovdG1wL3JhbWRp
c2svPHNuaXA+L2RlcGxveS9pcGsvaTY4Ni9ldWRldl8zLjIuOC1yMF9pNjg2Lmlwaw0KL3RtcC9y
YW1kaXNrLzxzbmlwPi9kZXBsb3kvaXBrL2k2ODYvZXVkZXYtc3JjXzMuMi44LXIwX2k2ODYuaXBr
DQoNCmFuZCB0aGVuIEkgY2FuIGNvbXBsZXRlIGJ1aWxkaW5nIHRoZSBpbWFnZS4NCg0KSSBkaWQg
bm90IGhhdmUgaGFzaCBlcXVpdmFsZW5jeSBlbmFibGVkIGluIHRoZSBiZWdpbm5pbmcsIEkndmUg
anVzdA0KcmVjZW50bHkgZW5hYmxlZCBpdCwgd2l0aG91dCB3aXBpbmcgdG1wLWJ1aWxkLyBvciBz
c3RhdGUgaW4gYmV0d2Vlbi4NCg0KL0phY29iDQoNCg0KW21pa3JvZGlkYWt0XQ0KSmFjb2IgS3Jv
b24g4oCiICs0NiA0NjMyNTA0MA0KDQptaWtyb2RpZGFrdC5zZSDigKIgU2tpZmZlcnbDpGdlbiA0
OCwgU0UtMjI0IDc4IExVTkQsIFN3ZWRlbg0KDQpDb25zdWx0YW5zIHNpbmNlIDE5ODAg4oCiIFNX
LCBIVywgRW1iZWRkZWQgU3lzdGVtcywgTGludXgNCg0KDQo=

