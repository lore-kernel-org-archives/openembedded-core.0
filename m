Return-Path: <prvs=2065966fb=Alistair.Francis@wdc.com>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Nov 2019 21:44:42 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id DA50B7F7D1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 21:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1573076706; x=1604612706;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=Xbu4drlb74iyCIilbrPmFPlZWu+x43a17OLqlR1tRRE=;
	b=eASSwkKWOm/yFw8ABdzK63YLU6JpLfNVX+Hd4OmjUTFkzdXXxXsqELAG
	LwEKjfXbPEGlTZekGECU/ZF9gjGAlhAI11hwxIMAjc99BQuavM1fqEe+B
	g7ZaegghFdGX3O38C5MlP+WUb4xbyCbvECQfwrN0wAgFdNq8w6nM8ffP8
	wg7gFtfpTVCqjLYorcs3lZreqg0Um2B1ydXWZRMtHpiTpQQQ385KtO3nM
	nAJ89p8GNrYXcbWJ00P115H3Q+w39DfW4ZDUEtKfWOO4URHOrremCm5Ox
	cqx6cccRY8BksXLKAGIx5NGc2+eDuTHEyDZjauecPVVgIZEEqd9HhVvka Q==;
IronPort-SDR: rK4ByV9Nm47YQzfcIeYdGn3BbSrSJ095P4JGJ5bl0MpIaS3Cmoim95z0FERbE8+J18QZJBxXsE
	oGtpoKi8BDim1/YJrrMRxK9eIp0iquSMjUB/AAD2NJj/vQlBeG3M51B//jll+eAuiVfpJFF2LB
	A6CcbCkkpWNSiJHIwWFeJotz6iQ0kqEZnMIT+8W67+aC4GjLH1iV1qeN+E3fLaaBO28vivthIL
	SBZAo3bfctym++ss8YNvCb9zYm8wRvjmyWAz9o3vctazRLPsLNg9ErF4iZe010Oktu4X8aVMce
	ZTU=
X-IronPort-AV: E=Sophos;i="5.68,275,1569254400"; d="scan'208";a="223512821"
Received: from mail-dm3nam05lp2051.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.51])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 05:35:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=e/FV9rc1BBZVfNUj9MZ8ZqKnHIhI2Y/MPd/mixtfu8mn2aj3GqPcUPvMcrCUt9HDVri8cpYb+KpXaxXCzydjkWLYp18V+sIWq03XBXGQnHcmJuB0N4OIKxBLlFmkSHddxbZZhScqGG/awEl2H/g7nY6ULJljthbxyXb15LowFsfEvumt0gCg3Bd82U91xPlmfH+BE7qI0SbalRD3C2itSGYQ5HIyoSjJjmCeMqS7PmTzjCz9sYNIDRERso1pfxNy1K3Pqq7BxgRpNSY4k/D6hftIinCQMe+zGrMnVydQNXG8ZoD0DLkfgvt+hh8gHLPIZrujch+nHbH8QhH+nxlxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Xbu4drlb74iyCIilbrPmFPlZWu+x43a17OLqlR1tRRE=;
	b=V774exyZB21lwTP+mVKTJQGCq4N0BueRlu4v9YlyPKEijMvDhz0C/OJ3XrlzPe4Ih8bdZ5hUlnNrnGJILxCYtGYXvh7ubdibovji7eRJoHa9DRW5sG6J39q11dh8TnT+vjN1lDhi2D1c1euNNVy/EvZ6Kzj6vC1750gdEE7I1gjdEzy/v1zp1Eef4+tYbWkpDxDSZbelIeS9ceioC+7CFAQIWMTbL1Og0p409VSX0iF4RsS7bu926kyJ6zlxa7HcXOZv956PybWjui/xDY8V98CQ9czmnGMNGvGQDZIKoi6iI/q8hpD0uV8EfhN8zIcjO1UeIBmfOZ6LoZx6KuX8jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Xbu4drlb74iyCIilbrPmFPlZWu+x43a17OLqlR1tRRE=;
	b=BHsWXCvpcpV685wWrUh/n5fjWtlH4W75qAUOR46FvUfjbR0ZTFrCc8nFEbX0Emx8W677tf+NpmJI3uy5R+RWnvnm0t/CM2LQbNZqHFufSZhKou0kaXWbAzrvdb1nAoljVIrM5OOHN0teUa+KPyBJLcapSyNspUbE0oxnKi7wv14=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4437.namprd04.prod.outlook.com (20.176.252.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Wed, 6 Nov 2019 21:34:41 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::112d:6934:52da:df11]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::112d:6934:52da:df11%7]) with mapi id 15.20.2408.024;
	Wed, 6 Nov 2019 21:34:41 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/2] tune-riscv: Add support for hard and soft
	float
Thread-Index: AQHVlM9NdS5ErB08Yka5j61T16bISqd+ny8AgAAJuoA=
Date: Wed, 6 Nov 2019 21:34:41 +0000
Message-ID: <b2b7a383c402c8b63e5725084daf8ca77f697583.camel@wdc.com>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<CAMKF1soM-bediaxsN9n5Ra_LK1ydR=_gpy5dyzxaH9yGu5Ar2Q@mail.gmail.com>
In-Reply-To: <CAMKF1soM-bediaxsN9n5Ra_LK1ydR=_gpy5dyzxaH9yGu5Ar2Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e7307e09-695d-43f5-28f6-08d7630121e4
x-ms-traffictypediagnostic: BYAPR04MB4437:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR04MB4437D56DA883CB2B6F5ED16290790@BYAPR04MB4437.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(189003)(199004)(2906002)(25786009)(71190400001)(71200400001)(14454004)(6116002)(86362001)(53546011)(6506007)(5660300002)(229853002)(6486002)(3846002)(76176011)(6246003)(5640700003)(66066001)(186003)(6306002)(486006)(446003)(6436002)(11346002)(256004)(6512007)(2616005)(4326008)(476003)(8936002)(305945005)(99286004)(8676002)(478600001)(81166006)(81156014)(6916009)(102836004)(2351001)(26005)(118296001)(2501003)(316002)(66476007)(66556008)(66446008)(966005)(76116006)(64756008)(36756003)(66946007)(1361003)(7736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4437;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kp3jHbgrTsfwyMOZuBsD7WslNCH2rM3RW1kIkP17D+7VLwDeoZ3Bevo+HyldoB9y6CpqLsYZUL446cl6edFWM7yoVqRwrdOcFi5de9eVm+x8DNGufUT24wyd0x0WX01SkLQkX9MnRaL2XzkxYarh6u5wsGgNEKeb7S2E9UikEC/fJmgPKCh24TGDoNsvwSJqmm6feG06LjXAZo0aCRQvCC8tAMFcX6lxVBHNmSalDcVtK/vQyHSiOZTtf0w9BOt4WjYibQ18gqpaovyTBRaemIPJdCPjHA8LChKjfP8c2U2yV8JSRQqzh/2hVJavjlSSMw6vVG097rWiR+zE/0peEbyRUvBeBb9oXWdIhRBPLP8X5GEDu3lUWyHSbWabuDtCiXR6Div4U3V6Yi5HNzzcA0R92e6AdcEoldeQmQv+VEZ59DdEHSU1jPBVMGe4Gw/QUdtvvU+ntmisXk/3jfiCa2rUkAcWtF3Zra7z44wX+d0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7307e09-695d-43f5-28f6-08d7630121e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 21:34:41.0642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: czR2xY1daDSEOqs5b8wYoMsH3POVJBJL2TSU/MuceWvS0r/SxUgAhNxKfiu0EQ18BOS+LgpLijxd5qPrl+xGCqeGX7ucHXPeLiwVch8kGNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4437
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
X-List-Received-Date: Wed, 06 Nov 2019 21:44:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CDD7B8AA630DB45A9AD0C50513F2C5C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTExLTA2IGF0IDEyOjU0IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
V2VkLCBOb3YgNiwgMjAxOSBhdCAxMjozNyBQTSBBbGlzdGFpciBGcmFuY2lzDQo+IDxhbGlzdGFp
ci5mcmFuY2lzQHdkYy5jb20+IHdyb3RlOg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZy
YW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jb25m
L21hY2hpbmUvaW5jbHVkZS9yaXNjdi9hcmNoLXJpc2N2LmluYyB8ICAzICsrLQ0KPiA+ICBtZXRh
L2NvbmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L3R1bmUtcmlzY3YuaW5jIHwgMTcNCj4gPiArKysr
KysrKysrKysrKystLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY29uZi9tYWNoaW5lL2lu
Y2x1ZGUvcmlzY3YvYXJjaC1yaXNjdi5pbmMNCj4gPiBiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1
ZGUvcmlzY3YvYXJjaC1yaXNjdi5pbmMNCj4gPiBpbmRleCBmM2VkY2MzOWY3Li42NzM3NTQ1ZTAw
IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvcmlzY3YvYXJjaC1y
aXNjdi5pbmMNCj4gPiArKysgYi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L2FyY2gt
cmlzY3YuaW5jDQo+ID4gQEAgLTQsNyArNCw4IEBAIERFRkFVTFRUVU5FID89ICJyaXNjdjY0Ig0K
PiA+IA0KPiA+ICBUVU5FX0FSQ0ggPSAiJHtUVU5FX0FSQ0hfdHVuZS0ke0RFRkFVTFRUVU5FfX0i
DQo+ID4gIFRVTkVfUEtHQVJDSCA9ICIke1RVTkVfUEtHQVJDSF90dW5lLSR7REVGQVVMVFRVTkV9
fSINCj4gPiAtVFVORV9DQ0FSR1MgLj0gIiINCj4gPiArVFVORV9DQ0FSR1NfcmlzY3Y2NCAuPSAi
JHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLA0KPiA+ICdyaXNjdjY0LWYnLCAn
IC1tYWJpPWxwNjRkJywgJyAtbWFiaT1scDY0JywgZCl9Ig0KPiA+ICtUVU5FX0NDQVJHU19yaXNj
djMyIC49ICIke0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsDQo+ID4gJ3Jpc2N2
MzItZicsICcgLW1hYmk9aWxwMzJmJywgJyAtbWFiaT1pbHAzMicsIGQpfSINCj4gPiANCj4gPiAg
IyBRRU1VIHVzZXJtb2RlIGZhaWxzIHdpdGggaW52YWxpZCBpbnN0cnVjdGlvbiBlcnJvciAoRm9y
IHJpc2N2MzIpDQo+ID4gIE1BQ0hJTkVfRkVBVFVSRVNfQkFDS0ZJTExfQ09OU0lERVJFRF9hcHBl
bmQgPSAiDQo+ID4gJHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCAncmlzY3Yz
MicsICcgcWVtdS11c2VybW9kZScsDQo+ID4gJycsIGQpfSINCj4gPiBkaWZmIC0tZ2l0IGEvbWV0
YS9jb25mL21hY2hpbmUvaW5jbHVkZS9yaXNjdi90dW5lLXJpc2N2LmluYw0KPiA+IGIvbWV0YS9j
b25mL21hY2hpbmUvaW5jbHVkZS9yaXNjdi90dW5lLXJpc2N2LmluYw0KPiA+IGluZGV4IDI1ZDA0
NjM0OTIuLjYzMTY1M2YyYTIgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jb25mL21hY2hpbmUvaW5j
bHVkZS9yaXNjdi90dW5lLXJpc2N2LmluYw0KPiA+ICsrKyBiL21ldGEvY29uZi9tYWNoaW5lL2lu
Y2x1ZGUvcmlzY3YvdHVuZS1yaXNjdi5pbmMNCj4gPiBAQCAtMSwxMiArMSwyNiBAQA0KPiA+ICBy
ZXF1aXJlIGNvbmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L2FyY2gtcmlzY3YuaW5jDQo+ID4gDQo+
ID4gIFRVTkVWQUxJRFtyaXNjdjY0XSA9ICJFbmFibGUgNjQtYml0IFJJU0MtViBvcHRpbWl6YXRp
b25zIg0KPiA+ICtUVU5FVkFMSURbcmlzY3Y2NC1mXSA9ICJFbmFibGUgNjQtYml0IFJJU0MtViBv
cHRpbWl6YXRpb25zIHdpdGgNCj4gPiBoYXJkIGZsb2F0Ig0KPiA+ICBUVU5FVkFMSURbcmlzY3Yz
Ml0gPSAiRW5hYmxlIDMyLWJpdCBSSVNDLVYgb3B0aW1pemF0aW9ucyINCj4gPiArVFVORVZBTElE
W3Jpc2N2MzItZl0gPSAiRW5hYmxlIDMyLWJpdCBSSVNDLVYgb3B0aW1pemF0aW9ucyB3aXRoDQo+
ID4gaGFyZCBmbG9hdCINCj4gPiANCj4gPiAgVFVORVZBTElEW2JpZ2VuZGlhbl0gPSAiQmlnIGVu
ZGlhbiBtb2RlIg0KPiA+IA0KPiA+IC1BVkFJTFRVTkVTICs9ICJyaXNjdjY0IHJpc2N2MzIiDQo+
ID4gK0FWQUlMVFVORVMgKz0gInJpc2N2NjQgcmlzY3Y2NC1mIHJpc2N2MzIgcmlzY3YzMi1mIg0K
PiA+IA0KPiA+ICsjIEhhcmQgZmxvYXQNCj4gPiArVFVORV9GRUFUVVJFU190dW5lLXJpc2N2NjQt
ZiA9ICIke1RVTkVfRkVBVFVSRVNfdHVuZS1yaXNjdjY0fQ0KPiA+IHJpc2N2NjQtZiINCj4gPiAr
VFVORV9BUkNIX3R1bmUtcmlzY3Y2NC1mID0gInJpc2N2NjQiDQo+ID4gK1RVTkVfUEtHQVJDSF90
dW5lLXJpc2N2NjQtZiA9ICJyaXNjdjY0Ig0KPiA+ICtQQUNLQUdFX0VYVFJBX0FSQ0hTX3R1bmUt
cmlzY3Y2NC1mID0gInJpc2N2NjQiDQo+ID4gKw0KPiA+ICtUVU5FX0ZFQVRVUkVTX3R1bmUtcmlz
Y3YzMi1mID0gIiR7VFVORV9GRUFUVVJFU190dW5lLXJpc2N2MzJ9DQo+ID4gcmlzY3YzMi1mIg0K
PiA+ICtUVU5FX0FSQ0hfdHVuZS1yaXNjdjMyLWYgPSAicmlzY3YzMiINCj4gPiArVFVORV9QS0dB
UkNIX3R1bmUtcmlzY3YzMi1mID0gInJpc2N2MzIiDQo+ID4gK1BBQ0tBR0VfRVhUUkFfQVJDSFNf
dHVuZS1yaXNjdjMyLWYgPSAicmlzY3YzMiINCj4gPiArDQo+ID4gKyMgU29mdCBmbG9hdA0KPiA+
ICBUVU5FX0ZFQVRVUkVTX3R1bmUtcmlzY3Y2NCA9ICJyaXNjdjY0Ig0KPiA+ICBUVU5FX0FSQ0hf
dHVuZS1yaXNjdjY0ID0gInJpc2N2NjQiDQo+ID4gIFRVTkVfUEtHQVJDSF90dW5lLXJpc2N2NjQg
PSAicmlzY3Y2NCINCj4gPiBAQCAtMTYsNCArMzAsMyBAQCBUVU5FX0ZFQVRVUkVTX3R1bmUtcmlz
Y3YzMiA9ICJyaXNjdjMyIg0KPiA+ICBUVU5FX0FSQ0hfdHVuZS1yaXNjdjMyID0gInJpc2N2MzIi
DQo+ID4gIFRVTkVfUEtHQVJDSF90dW5lLXJpc2N2MzIgPSAicmlzY3YzMiINCj4gPiAgUEFDS0FH
RV9FWFRSQV9BUkNIU190dW5lLXJpc2N2MzIgPSAicmlzY3YzMiINCj4gPiAtDQo+IA0KPiAgaXRz
IGJldHRlciB0byBhZGQgcmlzY3Y2NHNmIGFuZCBrZWVwIGV4aXN0aW5nIHR1bmVzIGFzIGl0IGlz
LiBzaW5jZQ0KPiBzZiBpcyBnb2luZyB0byBiZSByYXJlDQo+IGNvbXBhcmVkIHRvIHJ2NjRnYw0K
DQpPaywgdGhlc2UgYXJlIHRoZSB0dW5lcyBJIGhhdmUgbm93Og0KICAgIHJpc2N2NjQgcmlzY3Y2
NHNmIHJpc2N2MzIgcmlzY3YzMmhmDQoNCkFsaXN0YWlyDQoNCj4gDQo+ID4gLS0NCj4gPiAyLjIz
LjANCj4gPiANCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4gT3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==

