Return-Path: <prvs=2065966fb=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 414867F85F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 22:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1573080220; x=1604616220;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=qRYwYKzQ2BLEvoYsg6iOvPoTsVxGDLbeIjVgwJajSeg=;
	b=TNULAT2R7ps2/owGop/Q5kS5KOblDqzqTxd1S6u7Cl8KbIHrVFH5h87s
	CvdA0TIqxqYEpQlIhJJBJ1Zp03FebprC7dfnTT1ctVqbKVH7g8gUvK9GQ
	82dB6HqZsXYPak/oBZb83KKMc+BLRBd3o/5dhJZSOWvigRfkT3yGn3jk4
	N9qKn8DikImYYcuPO/nXCjCFB89HcEckLXwOUKqsn/uLJ188q5LL6/laN
	vuxChX3DAqi0f7/IBPiJFcq/KQBBj1+uaH01xRPjjP1CbG/zyhLd4IJS3
	AKG8Gcfl3Zn4jZECVBTop6WLbwxZ1WX0MowMPD67tbb8KM+rK6mdFuRbM A==;
IronPort-SDR: 2CcwLswyle3gXwXIM1NFkQb3IeW4S2jP4oImacAnqJe8dw0btt6r9684/FBkwXMh+Wao6tf7tW
	PPRn63rjr1xvlSt9U4UZuheJndMFy1VzK5ZJaJF1rMeyrJqeGkbcCP0ouePthTXQQBh07u1KlP
	W+SspMHRGktWLN4+wTPoIZYLlRsUXh6UJZ62zHRvwuWJ9wA+9FyWcS2zJjHftuMweRThTxHMAL
	D2ZL1u5NrQX2Z7kY/PGeuJ+4jZNXMpl7PITM0lX2jKbHndt/7OALjSIkC9xNNfvkhlcxMNDzT2
	9dY=
X-IronPort-AV: E=Sophos;i="5.68,275,1569254400"; d="scan'208";a="122327038"
Received: from mail-sn1nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.51])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 06:43:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=h5ODBis1j9Zn3PaeazB+uDw3Fq/3hrKe6OVonm722s331zF9ufewJjE519GY6+PSBsdGtoCWbcLqOAG5nD/qBLGO/0MaVMc2brKD2QkjjKktmgexfCI94akWeTSghAyfbshxGnWGkVOaXYndZZ677IQFSQf/ae6GMHVAdx1hA2ON1Nl/QrI2nX9zxXAP/1eUqVVT4L7YPU05OeahtZmbZwHZRVxadcQcFK1acFfW5jeQSNbRkMgBQfnpFAB5TCg2D6GcF1N+MQ4Scscn//rKlbsjM3VmlNVu2LCXFUZMEyfKw7bHpn8IZnv6jOl23nZ9kM8XKjWlj+eprOaFewv2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qRYwYKzQ2BLEvoYsg6iOvPoTsVxGDLbeIjVgwJajSeg=;
	b=LtK2hMBpoAfsqtcFyQuas9dejSkCz97IgiIdmhaV4OoULEErWI9tCaDSB7vrZqhRpHe14ewvR1fojmrcuL0pQqqo+MdvcORnssR97D6hIcIludg2skrgA/Iz5IEBNZzLIgDQ9gaFzEinXl33sApIqCENGk3NS/cwa+dtuZQUu+08+7ypdLGZ3ahilV7D4jrG56Edwk6VXwDxyxk8Hd2Z0VjZ7HpufTS1a48JWvh0te9/qp+47hOKx9cP2z7gdG7CVGYxwqmohjI/w+AKxKORtp7ODc8lzNdyqPAmjtanLG8KGPjSG+CclPGyx9KgqvmnubfvAXHiXbFP0seuNtrR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qRYwYKzQ2BLEvoYsg6iOvPoTsVxGDLbeIjVgwJajSeg=;
	b=fyJrlQj9y1v40GScCx89vjI4Fw9TmWcjK6Sv4kSaio+wKV4kDvZW6Pe6dN90eOO+dllTfa/8JrQx/o34bNy6k/DQ9c9ZImgn7Sj6O32CKubpFg0HvXC8Vck/Gf91er9XzyyM7WBk3i5vjACOd+mU46mvpfc7xdQoXC4HNVi79Ro=
Received: from DM6PR04MB4908.namprd04.prod.outlook.com (20.176.112.209) by
	DM6PR04MB6443.namprd04.prod.outlook.com (10.141.163.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.22; Wed, 6 Nov 2019 22:43:39 +0000
Received: from DM6PR04MB4908.namprd04.prod.outlook.com
	([fe80::d8c4:243b:66b4:61f3]) by
	DM6PR04MB4908.namprd04.prod.outlook.com
	([fe80::d8c4:243b:66b4:61f3%5]) with mapi id 15.20.2408.024;
	Wed, 6 Nov 2019 22:43:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "bunk@stusta.de" <bunk@stusta.de>
Thread-Topic: [OE-core] [PATCH 1/2] tune-riscv: Add support for hard and soft
	float
Thread-Index: AQHVlM9NdS5ErB08Yka5j61T16bISqd+tQgAgAAHJQA=
Date: Wed, 6 Nov 2019 22:43:38 +0000
Message-ID: <e37b5da9acc8a0f7562a9dacf649bc28e6a41f9d.camel@wdc.com>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
In-Reply-To: <20191106221250.GD14721@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b662d697-21db-430a-71f7-08d7630ac449
x-ms-traffictypediagnostic: DM6PR04MB6443:
x-microsoft-antispam-prvs: <DM6PR04MB64431CD22007E7C13540F2C390790@DM6PR04MB6443.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(189003)(199004)(7736002)(478600001)(36756003)(229853002)(14454004)(99286004)(8936002)(25786009)(26005)(118296001)(186003)(3846002)(6116002)(4326008)(66066001)(6916009)(316002)(2906002)(256004)(102836004)(86362001)(81156014)(305945005)(76176011)(1730700003)(6486002)(64756008)(66946007)(6506007)(66446008)(66556008)(91956017)(5660300002)(76116006)(66476007)(486006)(2351001)(6246003)(6512007)(2501003)(5640700003)(71190400001)(446003)(2616005)(11346002)(8676002)(71200400001)(476003)(6436002)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB6443;
	H:DM6PR04MB4908.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LOiwo8nWtYHpWPpBwerOcIUHvPOfr9ehpsD1lQTAdT6XeJfXxxRbddG72w9R1zw+O0U2QRFNG7YKmU0onghHszWGwGFKObU+7EYxShincTzhLsuvQhNN3GKCNxztP1h2svpR4/9Es0iar9gWhKWzYNkJlfq/ufyWyaWL4X0DW6qQRRgJJDph1PuvnmhXEbk0qPeow2k+IJBfxx1Cdfk7VSwRl2/IQbfbChXTQ2bGiJjEvt44CXN8DYJ8Lpovlsug3aCs6F5Ru8r6rIOhcHEN0ql2j0gjA4rsNEpETMsB22AETC38Kif2xwT3de4LzBVMm0Up0Tx8pPqyAmzdUbAe+dGEl0Qc4C9NDQOEX05iP5AZFarnwVdcDjYivgYexr0NThAGx86oDKbNIFo4E8I8A7a8so845Hx2xhIAZlq1vsYyqSIqOBkGGHzV2ytDMCSS
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b662d697-21db-430a-71f7-08d7630ac449
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 22:43:38.9205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UsY6+qgDDIYG1k5wBbujVmpZAFmKrQ1FlQ8prjHyyzbeQCUoSlrAsrVVqbKWgRvbTmw8jgfd2fjpL3RVwWBrq2ipL5WNf5eZWnBqP3Brcgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6443
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
X-List-Received-Date: Wed, 06 Nov 2019 22:43:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <296AC5139CC5E447A934E7439AC53528@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE5LTExLTA3IGF0IDAwOjEyICswMjAwLCBBZHJpYW4gQnVuayB3cm90ZToNCj4g
T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTA6MTg6MThBTSAtMDgwMCwgQWxpc3RhaXIgRnJhbmNp
cyB3cm90ZToNCj4gPiAuLi4NCj4gPiArVFVORV9DQ0FSR1NfcmlzY3Y2NCAuPSAiJHtAYmIudXRp
bHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLA0KPiA+ICdyaXNjdjY0LWYnLCAnIC1tYWJpPWxw
NjRkJywgJyAtbWFiaT1scDY0JywgZCl9Ig0KPiA+ICtUVU5FX0NDQVJHU19yaXNjdjMyIC49ICIk
e0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsDQo+ID4gJ3Jpc2N2MzItZicsICcg
LW1hYmk9aWxwMzJmJywgJyAtbWFiaT1pbHAzMicsIGQpfSINCj4gPiAuLi4NCj4gDQo+IFRoYXQg
bG9va3Mgd3JvbmcsIHdoYXQgd291bGQgeW91IHB1dCBpbiBUVU5FX0ZFQVRVUkVTDQo+IGZvciAt
bWFiaT1scDY0ZiB3aGVuIC1tYWJpPWxwNjRkIGlzIGNhbGxlZCByaXNjdjY0LWY/DQoNCkkgYW0g
anVzdCBnb2luZyB0byBhZGQgcmlzY3YzMm5mIGFuZCByaXNjdjY0bmYuIFRoaXMgd2lsbCBzcGVj
aWZ5DQotbWFiaT1pbHAzMiBhbmQgLW1hYmk9bHA2NCBhY2NvcmRpbmdseS4gSSB3b24ndCBjaGFu
Z2UgdGhlIGRlZmF1bHQNCnJpc2N2MzIgYW5kIHJpc2N2NjQuIFdlIGNhbiB0aGVuIGRlYWwgd2l0
aCB0aGUgc2luZ2xlIGFuZCBkb3VibGUgZmxvYXQNCmF0IGEgbGF0ZXIgcG9pbnQuDQoNCj4gDQo+
IEFsc28gbm90ZSB0aGF0IHRoaXMgaXMgb25seSB0aGUgZmxvYXRpbmcgcG9pbnQgY2FsbGluZyBj
b252ZW50aW9uLA0KPiB3aGV0aGVyIHRoZSBjb21waWxlciBlbWl0cyBmbG9hdGluZyBwb2ludCBp
bnN0cnVjdGlvbnMgaXMgZGVmaW5lZA0KPiBieSAtbWFyY2guDQoNCi1tYXJjaCBpcyBhbm90aGVy
IGNhbiBvZiB3b3JtcyB0aGF0IEkgd2FzIHRyeWluZyB0byBhdm9pZC4gSSBkb24ndCBoYXZlDQph
IGdvb2Qgd2F5IG9mIGhhbmRsaW5nIHRoZSBJU0Egc3RyaW5ncyBhdCB0aGUgbW9tZW50IHdpdGhv
dXQgc29tZSBjcmF6eQ0KbnVtYmVyIG9mIHR1bmUgb3B0aW9ucy4NCg0KPiANCj4gSXQgd291bGQg
YmUgZ29vZCBpZiB0aGlzIHdvdWxkIHN0YXJ0IHdpdGggYSBwbGFuIGhvdyB0byBoYW5kbGUNCj4g
YWxsIHBvc3NpYmxlIGNvbWJpbmF0aW9uIG9mIFJJU0MtViBJU0EgZXh0ZW5zaW9ucywgaWRlYWxs
eSBiZXR0ZXINCj4gdGhhbiB0aGUgYXJtIG1lc3MuDQoNCkFncmVlZC4gSSBhbSBqdXN0IGdvaW5n
IHRvIGNoYW5nZSB0aGlzIHRvIGFkZCBhIG5vIGZsb2F0IG9wdGlvbiBhcyB0aGF0DQpmaXhlcyBh
IGxhcmdlIG51bWJlciBvZiAzMi1iaXQgbGluayBmYWlsdXJlcyAoc2VlbiBpbiBVLUJvb3QsIE9w
ZW5TQkkNCmFuZCBTREtzKSBhbmQgd2UgY2FuIHJlLWV2YWx1YXRlIGEgbG9uZ2VyIHRlcm0gbWFy
Y2ggZml4Lg0KDQpBbGlzdGFpcg0KDQo+IA0KPiBjdQ0KPiBBZHJpYW4NCj4gDQo=

