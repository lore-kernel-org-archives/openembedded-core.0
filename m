Return-Path: <prvs=2065966fb=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id AD9B57F7E0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 21:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1573077143; x=1604613143;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=Gw4GbLviFFdJ2dRixW1R7+Fk/hu/8tJLFojJ7UpCJ2c=;
	b=OYR1fGSUNHSw5ECZLqCxHCClsBHUItR0IQvRPfYTBUDR/bNoaJ4VHTbG
	J9TySJcnsXZZMcc9HD8HbkFo6XOodisx+X7rsP0ZeI3fvN8aZjcIQ+LFI
	d2evya+eUHxoCqKow6xoj7w0IUnOMG/9QWKK20Z/Xzk8IveNZpqN/OTAM
	ZKrNIO7++6i5FTrh79l7c68xiYLeWR1IaO74QFgL0+GQiWiJ4pkNd9R/2
	EDgNa5woCYFvdxc4cOGBF2mLK7gepFZuCapAwTMWwZad+JvJztN9ZKJ6/
	69VcIV45uvdk5FDL5PzJDGHMNA6lmxukG440dxSAdTGOygWg1sQCXD16+ w==;
IronPort-SDR: mNCzcLoA6eZHWdoH3XPvGd8INHUJlhAxfXZi85BaTFZJ9aWKCvPewpl8BHA8M9qW4GcNo0JOp9
	g5Q5j5ByWCL8ocGPk6JAIEsUC1Mc9Imbl7LqHQqsgxbQ2zU9oFR714cIQ+1YcTQZ/l6BGv/5lT
	lN/epQtjgeiVML1xF+5/hQJFE2AL1UGAgDhLTvnnxOImWP0bFLYl30+usMTs0zGAGw5u1R2/jh
	B+0sTQyA23qLioMI3fPzMm8HZbbUtkWH575otx/2V3K7IgzAadyy2QSQcJk8HGcrae7+3VeMtI
	PAQ=
X-IronPort-AV: E=Sophos;i="5.68,275,1569254400"; d="scan'208";a="123059669"
Received: from mail-sn1nam01lp2059.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.59])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 05:52:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=LT0MYWg+58844zXKO1NOUAfcc4f4eUf9pDNgLYF0Z1NHk6er8Oq8AlacYRGV2znAFo2Az0rxZ2+uNidvnm3QxIa/U2q0bynzwvoJTHVG1wd1JE4BpLlo53MdKIdGWUV0QLdU745fHatBIr6Ot/BOmWxSgcx6K9oKNGxVAoGt4Cv6ui+BzDceRKxU8vWG3Vd4bZl5GxU9pLM1+0GjmK4VnTcMLK30iayT8bcPeJSBvOM0EGK4sBKmhGvJZV9Mtp/MIhA2KBH5x7824d2xNtncStMxPOXZlY5GhfjJSCvlKFc09/N15auTrgcOvM0jdd8cXdVXZXFSLlvRYdWo2m8JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Gw4GbLviFFdJ2dRixW1R7+Fk/hu/8tJLFojJ7UpCJ2c=;
	b=M0sVj+6cv4dCUPS9yCWuLblzvXA+9F82fjKcQp3rfFgg+sWKTVPYe0sCzov3wtI4Z/TRUlLxGyOVdeAVlB3gxJxY9RAfv+eWbX67uBeciXnWLKgWbjbaaTVKGNC0trzu3zdOTJAJO5immeg/NDMgn8G8B1kXZSIozH9417vo3+7ZTqeTqKrv8qso8387ijRHjxCHrQfJnQ1c+eAywPA5an3HhxRY2xcyRryz74LiHAanq8DfKjN/gftAm8Zr7Y+/NmRpOluXPIVhVjmyj/JtQa87azec+9sy0/0OwmM9UhbXdy7BbUEMBIUv9/uv2jaNECnnbIOBwJ+01EkVtNyrNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Gw4GbLviFFdJ2dRixW1R7+Fk/hu/8tJLFojJ7UpCJ2c=;
	b=iic+pKID+vzV4YVbLfvClYjr0+Epzc8KbnEdtvoKUKd9N9eaOIE1h+9lOH/snOqC9KBG+kVJ97G7DS+IibmYlgHdqvu43B38Am61XbH3hbjH705wF7pa5jXbJ2NOJ2bhnjBmr7ti262DgHOsufVFyOQc5uN9XlI42nMC6jZx0Mw=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4741.namprd04.prod.outlook.com (52.135.240.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Wed, 6 Nov 2019 21:52:20 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::112d:6934:52da:df11]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::112d:6934:52da:df11%7]) with mapi id 15.20.2408.024;
	Wed, 6 Nov 2019 21:52:20 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/2] tune-riscv: Add support for hard and soft
	float
Thread-Index: AQHVlM9NdS5ErB08Yka5j61T16bISqd+ny8AgAAJuoCAAAWzgP///zwA
Date: Wed, 6 Nov 2019 21:52:20 +0000
Message-ID: <8d3f034ee8d61d85b61392994c07a617fb5fcbce.camel@wdc.com>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<CAMKF1soM-bediaxsN9n5Ra_LK1ydR=_gpy5dyzxaH9yGu5Ar2Q@mail.gmail.com>
	<b2b7a383c402c8b63e5725084daf8ca77f697583.camel@wdc.com>
	<CAMKF1spVsuoq5TUhGTRdqgX-0wq0zrGSzfYo6PwccvG85=J3ww@mail.gmail.com>
In-Reply-To: <CAMKF1spVsuoq5TUhGTRdqgX-0wq0zrGSzfYo6PwccvG85=J3ww@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cf5c6f81-733d-4f98-60fb-08d76303996a
x-ms-traffictypediagnostic: BYAPR04MB4741:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR04MB4741EB768BC505E6789BAD6990790@BYAPR04MB4741.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(199004)(189003)(66476007)(186003)(6116002)(2351001)(25786009)(6916009)(305945005)(6506007)(53546011)(102836004)(14454004)(81156014)(8676002)(81166006)(76176011)(8936002)(66066001)(3846002)(966005)(6436002)(6486002)(229853002)(66446008)(5640700003)(118296001)(64756008)(66556008)(2501003)(6246003)(478600001)(76116006)(66946007)(5660300002)(7736002)(4326008)(26005)(99286004)(2906002)(256004)(446003)(1361003)(11346002)(2616005)(476003)(486006)(36756003)(71200400001)(86362001)(71190400001)(6306002)(316002)(6512007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4741;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WpKYvDlCUSQPdZloboKlzdexfskKgz6LZ1hQtQ9+0iSA8SGm1oiSID3qoG7E9cmtGMpEmDmOwzmxE65X1aCK2RhpBYjngYogBBvuYWS2vvh59bzDK3KbVUumdAiJA5x50xw4Ga6yX14DyeGV4sQbL+5z0OkEeR9WHEAXPWEdVLtcth6vkGrNbXsaDv2KppqzPnGKEQlenSvDWgR2zKZAmeriBfCDxFUvaMMIkwN5eAEwMzLLHcl5jJhpMGToLnQYSARH37O6UQvvjVJB27Q8vsCUbmtQn3rOlNczf2bGjAD69lWXFWpicZ4EsH/mdRla/aIk61a1pwdLMYieaaXRD+C/eVqTCxtmbovGlyZOGa+8UJRgHTMCklnwVJet7g25Wixbq9ei5Lv1MjGzQnmcj09ssa6xdrtD/5HpAKjQIBWWK0A2mkZiOFR4VrqZ8gfYfGjVfl1qvxrAM/dxI/q1yOYz/vAdhA7qMKRJuS9n7Gs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5c6f81-733d-4f98-60fb-08d76303996a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 21:52:20.5552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDbdqFrqhsRLuVhrX/AL7jy0daIclWYPsHgVCspFcjrlFBwZUIzPg6C67DwCXaXcAwbwusxmC/POSNQt4TAGPhfig6CHNturNCIPIWqgcUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
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
X-List-Received-Date: Wed, 06 Nov 2019 21:52:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <44C8A6B62762754D9E8A6099E47567C2@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTExLTA2IGF0IDEzOjQ5IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
V2VkLCBOb3YgNiwgMjAxOSBhdCAxOjM0IFBNIEFsaXN0YWlyIEZyYW5jaXMNCj4gPEFsaXN0YWly
LkZyYW5jaXNAd2RjLmNvbT4gd3JvdGU6DQo+ID4gT24gV2VkLCAyMDE5LTExLTA2IGF0IDEyOjU0
IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgTm92IDYsIDIwMTkgYXQgMTI6
MzcgUE0gQWxpc3RhaXIgRnJhbmNpcw0KPiA+ID4gPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4g
d3JvdGU6DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWly
LmZyYW5jaXNAd2RjLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBtZXRhL2NvbmYvbWFjaGlu
ZS9pbmNsdWRlL3Jpc2N2L2FyY2gtcmlzY3YuaW5jIHwgIDMgKystDQo+ID4gPiA+ICBtZXRhL2Nv
bmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L3R1bmUtcmlzY3YuaW5jIHwgMTcNCj4gPiA+ID4gKysr
KysrKysrKysrKysrLS0NCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2Nv
bmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L2FyY2gtcmlzY3YuaW5jDQo+ID4gPiA+IGIvbWV0YS9j
b25mL21hY2hpbmUvaW5jbHVkZS9yaXNjdi9hcmNoLXJpc2N2LmluYw0KPiA+ID4gPiBpbmRleCBm
M2VkY2MzOWY3Li42NzM3NTQ1ZTAwIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9tZXRhL2NvbmYvbWFj
aGluZS9pbmNsdWRlL3Jpc2N2L2FyY2gtcmlzY3YuaW5jDQo+ID4gPiA+ICsrKyBiL21ldGEvY29u
Zi9tYWNoaW5lL2luY2x1ZGUvcmlzY3YvYXJjaC1yaXNjdi5pbmMNCj4gPiA+ID4gQEAgLTQsNyAr
NCw4IEBAIERFRkFVTFRUVU5FID89ICJyaXNjdjY0Ig0KPiA+ID4gPiANCj4gPiA+ID4gIFRVTkVf
QVJDSCA9ICIke1RVTkVfQVJDSF90dW5lLSR7REVGQVVMVFRVTkV9fSINCj4gPiA+ID4gIFRVTkVf
UEtHQVJDSCA9ICIke1RVTkVfUEtHQVJDSF90dW5lLSR7REVGQVVMVFRVTkV9fSINCj4gPiA+ID4g
LVRVTkVfQ0NBUkdTIC49ICIiDQo+ID4gPiA+ICtUVU5FX0NDQVJHU19yaXNjdjY0IC49ICIke0Bi
Yi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsDQo+ID4gPiA+ICdyaXNjdjY0LWYnLCAn
IC1tYWJpPWxwNjRkJywgJyAtbWFiaT1scDY0JywgZCl9Ig0KPiA+ID4gPiArVFVORV9DQ0FSR1Nf
cmlzY3YzMiAuPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLA0KPiA+ID4g
PiAncmlzY3YzMi1mJywgJyAtbWFiaT1pbHAzMmYnLCAnIC1tYWJpPWlscDMyJywgZCl9Ig0KPiA+
ID4gPiANCj4gPiA+ID4gICMgUUVNVSB1c2VybW9kZSBmYWlscyB3aXRoIGludmFsaWQgaW5zdHJ1
Y3Rpb24gZXJyb3IgKEZvcg0KPiA+ID4gPiByaXNjdjMyKQ0KPiA+ID4gPiAgTUFDSElORV9GRUFU
VVJFU19CQUNLRklMTF9DT05TSURFUkVEX2FwcGVuZCA9ICINCj4gPiA+ID4gJHtAYmIudXRpbHMu
Y29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCAncmlzY3YzMicsICcgcWVtdS0NCj4gPiA+ID4gdXNl
cm1vZGUnLA0KPiA+ID4gPiAnJywgZCl9Ig0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jb25m
L21hY2hpbmUvaW5jbHVkZS9yaXNjdi90dW5lLXJpc2N2LmluYw0KPiA+ID4gPiBiL21ldGEvY29u
Zi9tYWNoaW5lL2luY2x1ZGUvcmlzY3YvdHVuZS1yaXNjdi5pbmMNCj4gPiA+ID4gaW5kZXggMjVk
MDQ2MzQ5Mi4uNjMxNjUzZjJhMiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvbWV0YS9jb25mL21hY2hp
bmUvaW5jbHVkZS9yaXNjdi90dW5lLXJpc2N2LmluYw0KPiA+ID4gPiArKysgYi9tZXRhL2NvbmYv
bWFjaGluZS9pbmNsdWRlL3Jpc2N2L3R1bmUtcmlzY3YuaW5jDQo+ID4gPiA+IEBAIC0xLDEyICsx
LDI2IEBADQo+ID4gPiA+ICByZXF1aXJlIGNvbmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L2FyY2gt
cmlzY3YuaW5jDQo+ID4gPiA+IA0KPiA+ID4gPiAgVFVORVZBTElEW3Jpc2N2NjRdID0gIkVuYWJs
ZSA2NC1iaXQgUklTQy1WIG9wdGltaXphdGlvbnMiDQo+ID4gPiA+ICtUVU5FVkFMSURbcmlzY3Y2
NC1mXSA9ICJFbmFibGUgNjQtYml0IFJJU0MtViBvcHRpbWl6YXRpb25zDQo+ID4gPiA+IHdpdGgN
Cj4gPiA+ID4gaGFyZCBmbG9hdCINCj4gPiA+ID4gIFRVTkVWQUxJRFtyaXNjdjMyXSA9ICJFbmFi
bGUgMzItYml0IFJJU0MtViBvcHRpbWl6YXRpb25zIg0KPiA+ID4gPiArVFVORVZBTElEW3Jpc2N2
MzItZl0gPSAiRW5hYmxlIDMyLWJpdCBSSVNDLVYgb3B0aW1pemF0aW9ucw0KPiA+ID4gPiB3aXRo
DQo+ID4gPiA+IGhhcmQgZmxvYXQiDQo+ID4gPiA+IA0KPiA+ID4gPiAgVFVORVZBTElEW2JpZ2Vu
ZGlhbl0gPSAiQmlnIGVuZGlhbiBtb2RlIg0KPiA+ID4gPiANCj4gPiA+ID4gLUFWQUlMVFVORVMg
Kz0gInJpc2N2NjQgcmlzY3YzMiINCj4gPiA+ID4gK0FWQUlMVFVORVMgKz0gInJpc2N2NjQgcmlz
Y3Y2NC1mIHJpc2N2MzIgcmlzY3YzMi1mIg0KPiA+ID4gPiANCj4gPiA+ID4gKyMgSGFyZCBmbG9h
dA0KPiA+ID4gPiArVFVORV9GRUFUVVJFU190dW5lLXJpc2N2NjQtZiA9ICIke1RVTkVfRkVBVFVS
RVNfdHVuZS1yaXNjdjY0fQ0KPiA+ID4gPiByaXNjdjY0LWYiDQo+ID4gPiA+ICtUVU5FX0FSQ0hf
dHVuZS1yaXNjdjY0LWYgPSAicmlzY3Y2NCINCj4gPiA+ID4gK1RVTkVfUEtHQVJDSF90dW5lLXJp
c2N2NjQtZiA9ICJyaXNjdjY0Ig0KPiA+ID4gPiArUEFDS0FHRV9FWFRSQV9BUkNIU190dW5lLXJp
c2N2NjQtZiA9ICJyaXNjdjY0Ig0KPiA+ID4gPiArDQo+ID4gPiA+ICtUVU5FX0ZFQVRVUkVTX3R1
bmUtcmlzY3YzMi1mID0gIiR7VFVORV9GRUFUVVJFU190dW5lLXJpc2N2MzJ9DQo+ID4gPiA+IHJp
c2N2MzItZiINCj4gPiA+ID4gK1RVTkVfQVJDSF90dW5lLXJpc2N2MzItZiA9ICJyaXNjdjMyIg0K
PiA+ID4gPiArVFVORV9QS0dBUkNIX3R1bmUtcmlzY3YzMi1mID0gInJpc2N2MzIiDQo+ID4gPiA+
ICtQQUNLQUdFX0VYVFJBX0FSQ0hTX3R1bmUtcmlzY3YzMi1mID0gInJpc2N2MzIiDQo+ID4gPiA+
ICsNCj4gPiA+ID4gKyMgU29mdCBmbG9hdA0KPiA+ID4gPiAgVFVORV9GRUFUVVJFU190dW5lLXJp
c2N2NjQgPSAicmlzY3Y2NCINCj4gPiA+ID4gIFRVTkVfQVJDSF90dW5lLXJpc2N2NjQgPSAicmlz
Y3Y2NCINCj4gPiA+ID4gIFRVTkVfUEtHQVJDSF90dW5lLXJpc2N2NjQgPSAicmlzY3Y2NCINCj4g
PiA+ID4gQEAgLTE2LDQgKzMwLDMgQEAgVFVORV9GRUFUVVJFU190dW5lLXJpc2N2MzIgPSAicmlz
Y3YzMiINCj4gPiA+ID4gIFRVTkVfQVJDSF90dW5lLXJpc2N2MzIgPSAicmlzY3YzMiINCj4gPiA+
ID4gIFRVTkVfUEtHQVJDSF90dW5lLXJpc2N2MzIgPSAicmlzY3YzMiINCj4gPiA+ID4gIFBBQ0tB
R0VfRVhUUkFfQVJDSFNfdHVuZS1yaXNjdjMyID0gInJpc2N2MzIiDQo+ID4gPiA+IC0NCj4gPiA+
IA0KPiA+ID4gIGl0cyBiZXR0ZXIgdG8gYWRkIHJpc2N2NjRzZiBhbmQga2VlcCBleGlzdGluZyB0
dW5lcyBhcyBpdCBpcy4NCj4gPiA+IHNpbmNlDQo+ID4gPiBzZiBpcyBnb2luZyB0byBiZSByYXJl
DQo+ID4gPiBjb21wYXJlZCB0byBydjY0Z2MNCj4gPiANCj4gPiBPaywgdGhlc2UgYXJlIHRoZSB0
dW5lcyBJIGhhdmUgbm93Og0KPiA+ICAgICByaXNjdjY0IHJpc2N2NjRzZiByaXNjdjMyIHJpc2N2
MzJoZg0KPiANCj4gd2hhdCB3b3VsZCByaXNjdjMyaGYgYmUgPw0KDQpSSVNDLVYgMzItYml0IGhh
cmQgZmxvYXQuIEl0IHNldHM6IC1tYWJpPWlscDMyZg0KDQpJdCBjdXJyZW50bHkgaXNuJ3QgdXNl
ZCwgYnV0IGl0IGNvdWxkIGJlIGluIHRoZSBmdXR1cmUuDQoNCkFsaXN0YWlyDQoNCj4gDQo+ID4g
QWxpc3RhaXINCj4gPiANCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4yMy4wDQo+ID4gPiA+IA0KPiA+
ID4gPiAtLQ0KPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiA+ID4gPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiA+ID4g
T3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPiBodHRwOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3Jl
DQo=

