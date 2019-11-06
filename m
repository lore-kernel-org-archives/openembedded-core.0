Return-Path: <prvs=2065966fb=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id A2F277F79E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 22:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1573080094; x=1604616094;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=SpwAlmL1PAxJ7zoezKqfZBZag2AtZo0z7j94sY9e2YM=;
	b=Ij6OKrbdKMan1EHTLNKHwapd0M4RysXRWtGbg/WYxrajFnE/74FhPQSv
	BOtprYcGwup3c6MjqJOx9F9BQS4ebbFuTrwajXj3R19fE7Gf5vtUOt6Mm
	gGh/vFtHjSdPpy3dV6ZB8mDPYbC+QVOTem/ItjyYxleSTVuBOgMgoYR8a
	ssT3EHQCoQ5uJfaSsZIcwP2KqTsn2zyDDtR/XKPrp7QN/xkkPDDXA+fQy
	2SGJg1qKXo7zyyytDgqjPzc7jMq8m+HdfW16nQwL4+/0+obgMyTDHP9tz
	beza9Qe+xlhjSnYX7AnN2x1lM8M2wDISs/UmPOxBoi/7maISdBS+tk2a/ g==;
IronPort-SDR: hf0LXCJ2LViaELDR02Ur8u46igIARKv5ysPrYZVplo5VJz2U5H3H0i6wHp4xMpMzwLQFMlAW4o
	Dg6fAgc6TSRg+O96Waw1kG8m1JrXU/ZXeVSG+WIeKGjtvF5YgWLtHjhvQ4lCRmVNxNSiyfKkp1
	KwPcw707tWiSgpG2imCogEKZlg/UF6QzH20dCn0YxmekkZ/QtwUhcboleszSqmE/i1a+kjid1+
	OFsoIeqeghOEk+qdjOGC3oLdJrtXJffN7Lb8wjcYobusR3tFSWNkGd2QcIrV4sNordzNsI003/
	ZRo=
X-IronPort-AV: E=Sophos;i="5.68,275,1569254400"; d="scan'208";a="126743724"
Received: from mail-bn3nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.51])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 06:41:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=l3bWL317J/KqhF8rXBg8aqS7x4sDXmnqy9SFYlSF8w3PtTLpbAV63HfHI/aHQsEdeS6fuC0DHN1/5Qc4kpwVRxoc9302oe21IqX5B5CpEczQrxq8850vKxEyXUV9VEfgCMLLrQmJUGlMt4Y/b8XsTCaQrPJgVxD8ZAOVh7+6twt6iH8hggu6VqojdXnGScLNB2yH4R13LCL4sFhRxlU6eyrgqXlnbPph8xByBeU7DbzM5G/3CYDhVWGe/9cr27i7nSONJBWtH5vqTU9uCAo99LweDKAqM+mJBHDeba36ZV5wdusOKwPmmQiDG9N5AieK9H8Hrjal9DacdTpLSkFN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SpwAlmL1PAxJ7zoezKqfZBZag2AtZo0z7j94sY9e2YM=;
	b=EndZo+xvmdwDX13fvRkJ+VwNhaVIoKkRkPFYiHUmaQbCjnCYIye5YhGjoWLFGB9xjQ58zdWyB6mpMaokR8WUX+YmbfXEJ736OiLTOgQJJOBUjLbraBb1nuNYYUI26CWcS4FOH6IxBF9HYH5A/twvf8dQLeLmiliImlwCdrdSWWnOSOJtJP+oqqGx+mUc8O7PwFwD2/xyHiGfrTu4/dXQ2sNsqaxA8ad2aQff+j93G689KCkXF0IXFiTHfE7v/FyQpdrAhkhp1bfmS9isEqFhzyenAOHr1TbNIWIBE1v8qL8rIZrnXAIs5h+QDZGl1D5/0Cp+1hougVgH/Nv3e/UehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SpwAlmL1PAxJ7zoezKqfZBZag2AtZo0z7j94sY9e2YM=;
	b=h7IAUXitClau09Z5uFhFDkV9E1u436bImgutZDyvA9UQs8hCHQQiRXk7Sx7EMcv17IGSLWfNJkL4U7Uz5KipjRpTr32hV4SSqi2lcCxIZj5xVNRHrVHhqeaKu61z9tTM43PoZgZ3jIk6f/MFm84EPSk/x0Xu9tWeh6L2C3esCrQ=
Received: from DM6PR04MB4908.namprd04.prod.outlook.com (20.176.112.209) by
	DM6PR04MB7083.namprd04.prod.outlook.com (10.141.107.71) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.22; Wed, 6 Nov 2019 22:41:30 +0000
Received: from DM6PR04MB4908.namprd04.prod.outlook.com
	([fe80::d8c4:243b:66b4:61f3]) by
	DM6PR04MB4908.namprd04.prod.outlook.com
	([fe80::d8c4:243b:66b4:61f3%5]) with mapi id 15.20.2408.024;
	Wed, 6 Nov 2019 22:41:30 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/2] tune-riscv: Add support for hard and soft
	float
Thread-Index: AQHVlM9NdS5ErB08Yka5j61T16bISqd+ny8AgAAJuoCAAAWzgP///zwAgAAIwoCAAAT5gA==
Date: Wed, 6 Nov 2019 22:41:29 +0000
Message-ID: <8690213d480ef25c4f6273e634b928bb2bcc3f04.camel@wdc.com>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<CAMKF1soM-bediaxsN9n5Ra_LK1ydR=_gpy5dyzxaH9yGu5Ar2Q@mail.gmail.com>
	<b2b7a383c402c8b63e5725084daf8ca77f697583.camel@wdc.com>
	<CAMKF1spVsuoq5TUhGTRdqgX-0wq0zrGSzfYo6PwccvG85=J3ww@mail.gmail.com>
	<8d3f034ee8d61d85b61392994c07a617fb5fcbce.camel@wdc.com>
	<CAMKF1srbbV2xmcnKhU8GuXcDv6s8s7MZR0YSJsoj2EJVKt1qiw@mail.gmail.com>
In-Reply-To: <CAMKF1srbbV2xmcnKhU8GuXcDv6s8s7MZR0YSJsoj2EJVKt1qiw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 71356a05-57bf-44e7-2445-08d7630a77cd
x-ms-traffictypediagnostic: DM6PR04MB7083:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR04MB70832B5AC5DEA5F5F2B2ED6790790@DM6PR04MB7083.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(199004)(189003)(5640700003)(2906002)(86362001)(6916009)(2501003)(1361003)(6486002)(3846002)(76176011)(118296001)(6116002)(6306002)(4326008)(966005)(36756003)(6512007)(71190400001)(14454004)(316002)(6436002)(99286004)(229853002)(6246003)(71200400001)(64756008)(478600001)(2616005)(66446008)(66556008)(66476007)(66946007)(25786009)(186003)(8676002)(76116006)(2351001)(66066001)(91956017)(5660300002)(26005)(102836004)(256004)(53546011)(8936002)(305945005)(7736002)(81156014)(81166006)(6506007)(446003)(486006)(476003)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB7083;
	H:DM6PR04MB4908.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eNnM4R5YHYZLdJ3GOjYx+UaQhUV6qFqxdqB0frlGx50mZ37PT2Bps+wUUFgKPBnJFLyi1dabsn0rYUAzVIeu83KTMGJYCRfztSfVk9vLxcLtohuKyoPJlyV3LnEmP+Kn76URRVbI6u54b+CwsjQhROQL3vJ2AjN0rolyWkjS+8jR3RmYObx09BrOzvI4eIAzxBYjnag6/gRfwNSgORpGT94f43wi1Q+4N8dK4NiREcU1mNZXdPVDNxoW4hR4Gsdo8kL+OANwNyLeALd8qW6wEEN+zhHT24g/znl8WOZFrDnopfPFGoZhBrOVLlkGR38PTvxKd5xE29tENqEdOQvZ47D2UC68jaZsug00J+WxbXTPAunR27kDbzBSP2ZA11t0bYB+TqtkiNBt0ZY2WNWekNY5TzabG+/2sSu5G/Dh3ZeK0nqOg1KhjXbgPTH0+hSVAnmk5BHW3kPKImV5TjUkFjTjeyrXJiTa43Gheq7htvE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71356a05-57bf-44e7-2445-08d7630a77cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 22:41:29.6126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CZqK1IhkqxzncfnQTp4x/lsXqFrQ19sKc2dAnSx5heVNLzYDfFhXI4AC8d+j6fr6EjeuZwJ3qQC/9JV418J0G5AQWhSnXNTtQYL2kZ01n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7083
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Wed, 06 Nov 2019 22:41:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <156A0FEB5A32DC46873CE83FA04F483A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTExLTA2IGF0IDE0OjE4IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
V2VkLCBOb3YgNiwgMjAxOSBhdCAxOjUyIFBNIEFsaXN0YWlyIEZyYW5jaXMNCj4gPEFsaXN0YWly
LkZyYW5jaXNAd2RjLmNvbT4gd3JvdGU6DQo+ID4gT24gV2VkLCAyMDE5LTExLTA2IGF0IDEzOjQ5
IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgTm92IDYsIDIwMTkgYXQgMToz
NCBQTSBBbGlzdGFpciBGcmFuY2lzDQo+ID4gPiA8QWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tPiB3
cm90ZToNCj4gPiA+ID4gT24gV2VkLCAyMDE5LTExLTA2IGF0IDEyOjU0IC0wODAwLCBLaGVtIFJh
aiB3cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIE5vdiA2LCAyMDE5IGF0IDEyOjM3IFBNIEFsaXN0
YWlyIEZyYW5jaXMNCj4gPiA+ID4gPiA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPiB3cm90ZToN
Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZy
YW5jaXNAd2RjLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gIG1ldGEvY29uZi9t
YWNoaW5lL2luY2x1ZGUvcmlzY3YvYXJjaC1yaXNjdi5pbmMgfCAgMyArKy0NCj4gPiA+ID4gPiA+
ICBtZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L3R1bmUtcmlzY3YuaW5jIHwgMTcNCj4g
PiA+ID4gPiA+ICsrKysrKysrKysrKysrKy0tDQo+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9yaXNjdi9hcmNoLXJp
c2N2LmluYw0KPiA+ID4gPiA+ID4gYi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L2Fy
Y2gtcmlzY3YuaW5jDQo+ID4gPiA+ID4gPiBpbmRleCBmM2VkY2MzOWY3Li42NzM3NTQ1ZTAwIDEw
MDY0NA0KPiA+ID4gPiA+ID4gLS0tIGEvbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9yaXNjdi9h
cmNoLXJpc2N2LmluYw0KPiA+ID4gPiA+ID4gKysrIGIvbWV0YS9jb25mL21hY2hpbmUvaW5jbHVk
ZS9yaXNjdi9hcmNoLXJpc2N2LmluYw0KPiA+ID4gPiA+ID4gQEAgLTQsNyArNCw4IEBAIERFRkFV
TFRUVU5FID89ICJyaXNjdjY0Ig0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAgVFVORV9BUkNI
ID0gIiR7VFVORV9BUkNIX3R1bmUtJHtERUZBVUxUVFVORX19Ig0KPiA+ID4gPiA+ID4gIFRVTkVf
UEtHQVJDSCA9ICIke1RVTkVfUEtHQVJDSF90dW5lLSR7REVGQVVMVFRVTkV9fSINCj4gPiA+ID4g
PiA+IC1UVU5FX0NDQVJHUyAuPSAiIg0KPiA+ID4gPiA+ID4gK1RVTkVfQ0NBUkdTX3Jpc2N2NjQg
Lj0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRVUkUNCj4gPiA+ID4gPiA+IFMnLA0K
PiA+ID4gPiA+ID4gJ3Jpc2N2NjQtZicsICcgLW1hYmk9bHA2NGQnLCAnIC1tYWJpPWxwNjQnLCBk
KX0iDQo+ID4gPiA+ID4gPiArVFVORV9DQ0FSR1NfcmlzY3YzMiAuPSAiJHtAYmIudXRpbHMuY29u
dGFpbnMoJ1RVTkVfRkVBVFVSRQ0KPiA+ID4gPiA+ID4gUycsDQo+ID4gPiA+ID4gPiAncmlzY3Yz
Mi1mJywgJyAtbWFiaT1pbHAzMmYnLCAnIC1tYWJpPWlscDMyJywgZCl9Ig0KPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiAgIyBRRU1VIHVzZXJtb2RlIGZhaWxzIHdpdGggaW52YWxpZCBpbnN0cnVj
dGlvbiBlcnJvciAoRm9yDQo+ID4gPiA+ID4gPiByaXNjdjMyKQ0KPiA+ID4gPiA+ID4gIE1BQ0hJ
TkVfRkVBVFVSRVNfQkFDS0ZJTExfQ09OU0lERVJFRF9hcHBlbmQgPSAiDQo+ID4gPiA+ID4gPiAk
e0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsICdyaXNjdjMyJywgJyBxZW11LQ0K
PiA+ID4gPiA+ID4gdXNlcm1vZGUnLA0KPiA+ID4gPiA+ID4gJycsIGQpfSINCj4gPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L3R1bmUtcmlzY3Yu
aW5jDQo+ID4gPiA+ID4gPiBiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvcmlzY3YvdHVuZS1y
aXNjdi5pbmMNCj4gPiA+ID4gPiA+IGluZGV4IDI1ZDA0NjM0OTIuLjYzMTY1M2YyYTIgMTAwNjQ0
DQo+ID4gPiA+ID4gPiAtLS0gYS9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L3R1bmUt
cmlzY3YuaW5jDQo+ID4gPiA+ID4gPiArKysgYi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3Jp
c2N2L3R1bmUtcmlzY3YuaW5jDQo+ID4gPiA+ID4gPiBAQCAtMSwxMiArMSwyNiBAQA0KPiA+ID4g
PiA+ID4gIHJlcXVpcmUgY29uZi9tYWNoaW5lL2luY2x1ZGUvcmlzY3YvYXJjaC1yaXNjdi5pbmMN
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gIFRVTkVWQUxJRFtyaXNjdjY0XSA9ICJFbmFibGUg
NjQtYml0IFJJU0MtViBvcHRpbWl6YXRpb25zIg0KPiA+ID4gPiA+ID4gK1RVTkVWQUxJRFtyaXNj
djY0LWZdID0gIkVuYWJsZSA2NC1iaXQgUklTQy1WIG9wdGltaXphdGlvbnMNCj4gPiA+ID4gPiA+
IHdpdGgNCj4gPiA+ID4gPiA+IGhhcmQgZmxvYXQiDQo+ID4gPiA+ID4gPiAgVFVORVZBTElEW3Jp
c2N2MzJdID0gIkVuYWJsZSAzMi1iaXQgUklTQy1WIG9wdGltaXphdGlvbnMiDQo+ID4gPiA+ID4g
PiArVFVORVZBTElEW3Jpc2N2MzItZl0gPSAiRW5hYmxlIDMyLWJpdCBSSVNDLVYgb3B0aW1pemF0
aW9ucw0KPiA+ID4gPiA+ID4gd2l0aA0KPiA+ID4gPiA+ID4gaGFyZCBmbG9hdCINCj4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ID4gIFRVTkVWQUxJRFtiaWdlbmRpYW5dID0gIkJpZyBlbmRpYW4gbW9k
ZSINCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gLUFWQUlMVFVORVMgKz0gInJpc2N2NjQgcmlz
Y3YzMiINCj4gPiA+ID4gPiA+ICtBVkFJTFRVTkVTICs9ICJyaXNjdjY0IHJpc2N2NjQtZiByaXNj
djMyIHJpc2N2MzItZiINCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gKyMgSGFyZCBmbG9hdA0K
PiA+ID4gPiA+ID4gK1RVTkVfRkVBVFVSRVNfdHVuZS1yaXNjdjY0LWYgPSAiJHtUVU5FX0ZFQVRV
UkVTX3R1bmUtDQo+ID4gPiA+ID4gPiByaXNjdjY0fQ0KPiA+ID4gPiA+ID4gcmlzY3Y2NC1mIg0K
PiA+ID4gPiA+ID4gK1RVTkVfQVJDSF90dW5lLXJpc2N2NjQtZiA9ICJyaXNjdjY0Ig0KPiA+ID4g
PiA+ID4gK1RVTkVfUEtHQVJDSF90dW5lLXJpc2N2NjQtZiA9ICJyaXNjdjY0Ig0KPiA+ID4gPiA+
ID4gK1BBQ0tBR0VfRVhUUkFfQVJDSFNfdHVuZS1yaXNjdjY0LWYgPSAicmlzY3Y2NCINCj4gPiA+
ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICtUVU5FX0ZFQVRVUkVTX3R1bmUtcmlzY3YzMi1mID0gIiR7
VFVORV9GRUFUVVJFU190dW5lLQ0KPiA+ID4gPiA+ID4gcmlzY3YzMn0NCj4gPiA+ID4gPiA+IHJp
c2N2MzItZiINCj4gPiA+ID4gPiA+ICtUVU5FX0FSQ0hfdHVuZS1yaXNjdjMyLWYgPSAicmlzY3Yz
MiINCj4gPiA+ID4gPiA+ICtUVU5FX1BLR0FSQ0hfdHVuZS1yaXNjdjMyLWYgPSAicmlzY3YzMiIN
Cj4gPiA+ID4gPiA+ICtQQUNLQUdFX0VYVFJBX0FSQ0hTX3R1bmUtcmlzY3YzMi1mID0gInJpc2N2
MzIiDQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArIyBTb2Z0IGZsb2F0DQo+ID4gPiA+ID4g
PiAgVFVORV9GRUFUVVJFU190dW5lLXJpc2N2NjQgPSAicmlzY3Y2NCINCj4gPiA+ID4gPiA+ICBU
VU5FX0FSQ0hfdHVuZS1yaXNjdjY0ID0gInJpc2N2NjQiDQo+ID4gPiA+ID4gPiAgVFVORV9QS0dB
UkNIX3R1bmUtcmlzY3Y2NCA9ICJyaXNjdjY0Ig0KPiA+ID4gPiA+ID4gQEAgLTE2LDQgKzMwLDMg
QEAgVFVORV9GRUFUVVJFU190dW5lLXJpc2N2MzIgPSAicmlzY3YzMiINCj4gPiA+ID4gPiA+ICBU
VU5FX0FSQ0hfdHVuZS1yaXNjdjMyID0gInJpc2N2MzIiDQo+ID4gPiA+ID4gPiAgVFVORV9QS0dB
UkNIX3R1bmUtcmlzY3YzMiA9ICJyaXNjdjMyIg0KPiA+ID4gPiA+ID4gIFBBQ0tBR0VfRVhUUkFf
QVJDSFNfdHVuZS1yaXNjdjMyID0gInJpc2N2MzIiDQo+ID4gPiA+ID4gPiAtDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gIGl0cyBiZXR0ZXIgdG8gYWRkIHJpc2N2NjRzZiBhbmQga2VlcCBleGlzdGlu
ZyB0dW5lcyBhcyBpdA0KPiA+ID4gPiA+IGlzLg0KPiA+ID4gPiA+IHNpbmNlDQo+ID4gPiA+ID4g
c2YgaXMgZ29pbmcgdG8gYmUgcmFyZQ0KPiA+ID4gPiA+IGNvbXBhcmVkIHRvIHJ2NjRnYw0KPiA+
ID4gPiANCj4gPiA+ID4gT2ssIHRoZXNlIGFyZSB0aGUgdHVuZXMgSSBoYXZlIG5vdzoNCj4gPiA+
ID4gICAgIHJpc2N2NjQgcmlzY3Y2NHNmIHJpc2N2MzIgcmlzY3YzMmhmDQo+ID4gPiANCj4gPiA+
IHdoYXQgd291bGQgcmlzY3YzMmhmIGJlID8NCj4gPiANCj4gPiBSSVNDLVYgMzItYml0IGhhcmQg
ZmxvYXQuIEl0IHNldHM6IC1tYWJpPWlscDMyZg0KPiA+IA0KPiA+IEl0IGN1cnJlbnRseSBpc24n
dCB1c2VkLCBidXQgaXQgY291bGQgYmUgaW4gdGhlIGZ1dHVyZS4NCj4gPiANCj4gDQo+IGhtbW0g
d2UgY291bGQgYWxzbyB1c2Ugc2YgPSBzaW5nbGUgZmxvYXQgZGY9ZG91YmxlIGZsb2F0DQo+IG5m
PXNvZnQobm8pIGZsb2F0IHdoZXJlIGV4Y2VwdGlvbnMgYXJlIHRvIGJlIGluZGljYXRlZCBhbmQg
a2VlcA0KPiByaXNjdjY0IGFuZCByaXNjdjMyIHRvIGluZGljYXRlIGRlZmF1bHQgKCBjb21tb24g
KSBBQklzDQoNCk9rLCBob3cgYWJvdXQgdGhpcy4NCg0KSSBhbSBqdXN0IGdvaW5nIHRvIGFkZCBy
aXNjdjMybmYgYW5kIHJpc2N2NjRuZi4gVGhpcyB3aWxsIHNwZWNpZnkNCi1tYWJpPWlscDMyIGFu
ZCAtbWFiaT1scDY0IGFjY29yZGluZ2x5LiBJIHdvbid0IGNoYW5nZSB0aGUgZGVmYXVsdA0Kcmlz
Y3YzMiBhbmQgcmlzY3Y2NC4gV2UgY2FuIHRoZW4gZGVhbCB3aXRoIHRoZSBzaW5nbGUgYW5kIGRv
dWJsZSBmbG9hdA0KYXQgYSBsYXRlciBwb2ludC4NCg0KQWxpc3RhaXINCg0KPiANCj4gPiBBbGlz
dGFpcg0KPiA+IA0KPiA+ID4gPiBBbGlzdGFpcg0KPiA+ID4gPiANCj4gPiA+ID4gPiA+IC0tDQo+
ID4gPiA+ID4gPiAyLjIzLjANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gLS0NCj4gPiA+ID4g
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4g
PiA+ID4gPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiA+ID4gPiA+IE9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+ID4gPiA+IGh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUN
Cg==

