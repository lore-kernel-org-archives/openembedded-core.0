Return-Path: <chris.laplante@agilent.com>
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
	by mail.openembedded.org (Postfix) with ESMTP id A3E5460F4C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 00:23:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ebm2SnohN9GlWpZVP2PNatYzSxJADExw1Mr7hkryxkByhduPb2+gWE0hAQOa646h5C6s+8Tm+Mt94uHsr8uUrmB2Fb7C0skDVIMWvz4Z1bS1sn5F7RN7Dy2WcWicqfbDQUThVLZcInQsCwVlwjJS+rKj+7LNfej2Ilg70+iFjHRlTXcYkwwsUzMeWAs2TzO9HpHvEeL6WbOI48K7gFNhoEQT5bJ6JZ6zOoD79gv6YHTeIDwxA8GOVrPbthvrvu2CC7kqHEyYclH0rzXiXedP+wdT18vhmU+ZGf+1flkp7eraiNe34/DRyf7dJu5eNn5736Nq7g9eDLiz7hCrcb0e8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kDEQvWlAtMvI0BMm0aDDgbCa4bvZB7nJDQSmDJcBjbI=;
	b=kFIMSqvupo9xoSpVo4wSz7Uqd3tgQZ0ZfoL89njpv1+TUtb5Q9BbYwptvalmxIZdeC6mW1HFn8HqzA4QQ9JVBXZ3LV0AaXidXwDgIokGoy+jVU9SW9PVJCFtPrXk5jZH7btw1xujeIWKgeoOeGghvzZ1kwpRUkyxDjeU3Ns/6VRZIpdG6dG87dN3Ux7iGV13lh/Gs/2munKsE08A/fye6JvCCeapYjN/qTSMvBGO6YG6fhywfs4+stzIdTOX2ma900iCmECfh8+VExNSVSYypcsVShM4GRLgIcftdPzkHHoxOJWfzi01FMdiJYigX7b2Bo2CbDSVZ+72VoOZxnMBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kDEQvWlAtMvI0BMm0aDDgbCa4bvZB7nJDQSmDJcBjbI=;
	b=AX3zl+VKNtBRknDL1tGQ1HdS6Pieoo/41OFlhVMMS6SitIfjFxkA8MeA4+dNMPz6uOFqCxIQAh6iv3V53vyghmu0ipNfh77Qrt5qRCKfUr8/GnHepaZhP2k30un133+iNz5b12GUgsHzJHGmxW0mrZspnVG9TFzr/eYOkfh65XM=
Received: from BN6PR1201MB2482.namprd12.prod.outlook.com (10.172.108.140) by
	BN6PR1201MB0035.namprd12.prod.outlook.com (10.174.238.140) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.21; Sun, 9 Feb 2020 00:23:41 +0000
Received: from BN6PR1201MB2482.namprd12.prod.outlook.com
	([fe80::b9c1:6c94:2b61:5290]) by
	BN6PR1201MB2482.namprd12.prod.outlook.com
	([fe80::b9c1:6c94:2b61:5290%11]) with mapi id 15.20.2707.024;
	Sun, 9 Feb 2020 00:23:40 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Cache unihash ... doesn't match BB_UNIHASH ...
Thread-Index: AQHV3Y7yppMxqsfL50SQ0gLLoMQb+qgPZvSAgABkhGCAAAmeAIAACsOAgAISmdA=
Date: Sun, 9 Feb 2020 00:23:40 +0000
Message-ID: <BN6PR1201MB248219E5E090A8B5691CCB098B1E0@BN6PR1201MB2482.namprd12.prod.outlook.com>
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
	<BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
	<CAO5Uq5T1k-ZMZwpsDOeE+aQOJMBZ0PQSzC1jeS+iw=20bxyogA@mail.gmail.com>
In-Reply-To: <CAO5Uq5T1k-ZMZwpsDOeE+aQOJMBZ0PQSzC1jeS+iw=20bxyogA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.59.252.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3de755ba-0d62-44ae-74ed-08d7acf65091
x-ms-traffictypediagnostic: BN6PR1201MB0035:
x-microsoft-antispam-prvs: <BN6PR1201MB00354207C798EF22EFCE5A898B1E0@BN6PR1201MB0035.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0308EE423E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(39860400002)(396003)(136003)(346002)(189003)(199004)(29502001)(7696005)(8936002)(81156014)(81166006)(71200400001)(8676002)(6506007)(54906003)(4326008)(316002)(26005)(478600001)(2906002)(186003)(66556008)(66946007)(66476007)(66446008)(64756008)(9686003)(86362001)(76116006)(55016002)(33656002)(52536014)(6916009)(5660300002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0035;
	H:BN6PR1201MB2482.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WEnjvmX9/evXQJuRRp7ys9iOq7/OkxRF79QBrawlVDrI+GUXuHF0c3mhB7bUB6uboxcfnh14SxbALBkDoS3xRU0oiVZk0EkD7z2WJU7hYTcCBEx/z1GQLTDPHMwhz94OvJ9OZSDS0Wp06dUOH2mLurF0jL9YLFlM8SmucJY5aVOfsUzhWMInZSBJMLs3gC3kbNTCTcEnTbQ6ryD3nYIUlRG0+63EnAQrrO8HKd9h/EcT6MMsi1Lit0pXmAHr0mGvm36hpSjS/9emN0ced3yQ7Y/sAD83xnEKoXTpGl/YhAk9BgQLobxQvCoFtZd1dW/iZNdtMzeglS/TVeVRLqwixdxaTFH2IGso1E/KObyRQ8AAA7fKVkr9Jjb9bk5B5jGP80OsL2jP7TRMNSdPViskgloZE5SeCHBSRpqOn7QLHEJDPOOp+cznHsnvbDfQhPRKZyhlzd+nleNaxCPcR/P3+BUKwQGNCZ+AWtL/3+dkaugaIlzW3i/QgT7gO7HjGsuF
x-ms-exchange-antispam-messagedata: OvVJddUJTJlYR9k+kG3UZkbupVOh3nJYDWlEmczWzpJYUk5SqdnbAsNvqqhKsNzPKTPHZRKSdCg4cE6/d8LlhqdatUF4VQz471err0YSk19LKWcwQlEDJQL/n8g87bY31CxgidXlhbAqWSAlYQ/GWg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de755ba-0d62-44ae-74ed-08d7acf65091
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2020 00:23:40.7727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2X7ibzz9ewXGn/Qjb6syQRvTXGfRa/n1aK8tlRNexvDgNppFdxd5eU9JFy6L6NVIFngDb/wT4MhFmLJ/AQsgkgQQAz9EuegVNj+zoIk5v/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0035
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Sun, 09 Feb 2020 00:23:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiA+ID4gQW5lY2RvdGFsbHksIHdlIGFyZSBydW5uaW5nIFpldXMgZm9y
IG5pZ2h0bHkgYnVpbGRzIHdpdGggdGhyZWUNCj4gPiA+IG11bHRpY29uZmlncy4gSSBjaGVycnkt
cGlja2VkIHlvdXIgImJpdGJha2U6IGZpeDIiIGFuZCAiYml0YmFrZToNCj4gPiA+IGZpeHVwIiBw
YXRjaGVzIGFuZCBoYXZlbid0IHNlZW4gYW55IG9mIHRoZSBCQl9VTklIQVNIIGVycm9ycyBzaW5j
ZS4NCj4gPiA+IEdyYW50ZWQgaXQncyBvbmx5IGJlZW4gYSB3ZWVrLiBCdXQgYmVmb3JlIHRoYXQs
IGhhc2ggZXF1aXYgKw0KPiA+ID4gbXVsdGljb25maWcgd2FzIHVudXNhYmxlIGR1ZSB0byB0aGUg
QkJfVU5JSEFTSCBlcnJvcnMuDQo+ID4NCj4gPiBUaGF0IGlzIGEgcmVhbGx5IGhlbHBmdWwgZGF0
YSBwb2ludCwgdGhhbmtzLiBJIHNob3VsZCBwcm9iYWJseSBjbGVhbiB1cA0KPiA+IHRob3NlIGJp
dGJha2UgcGF0Y2hlcyBhbmQgZ2V0IHRoZW0gbWVyZ2VkIHRoZW4sIEkgY291bGRuJ3QgZGVjaWRl
IGlmDQo+ID4gdGhleSB3ZXJlIHJpZ2h0IG9yIG5vdC4uLg0KPiA+DQo+IA0KPiBJIGp1c3QgcGlj
a2VkIGFsbCB5b3VyIHBlbmRpbmcgY2hhbmdlcyBvdXQgb2YgbWFzdGVyLW5leHQgaW50byBvdXIN
Cj4gbG9jYWwgcGF0Y2ggcXVldWUgLSB3aWxsIGxldCB5b3Uga25vdyBob3cgaXQgbG9va3Mgd2hl
biBpdCdzIGZpbmlzaGVkDQo+IGNvb2tpbmchDQoNClRoZXJlIGFyZSB0d28gc21hbGwgaXNzdWVz
IEkgaGF2ZSBvYnNlcnZlZC4gIA0KDQpPbmUgaXMgb2NjYXNpb25hbGx5IEkgZ2V0IGEgbG90IG9m
IHVuZGV0ZXJtaW5pc3RpYyBtZXRhZGF0YSBlcnJvcnMgd2hlbiBCQl9DQUNIRV9QT0xJQ1kgPSAi
Y2FjaGUiLCBtdWx0aWNvbmZpZywgYW5kIGhhc2ggZXF1aXYgYXJlIGVuYWJsZWQuIFRoZSBlcnJv
cnMgYXJlIGFsbCBvbiByZWNpcGVzIGZvciB3aGljaCBTUkNSRVYgPSAiJHtBVVRPUkVWfSIuIEl0
IGRvZXNuJ3QgYWx3YXlzIGhhcHBlbi4gQnV0IGl0IGRpZCBqdXN0IG5vdyB3aGVuIEkgcmViYXNl
ZCBvdXIgInpldXMtbW9kaWZpZWQiIGJyYW5jaCBvbnRvIHRoZSB1cHN0cmVhbSAiemV1cyIgYnJh
bmNoLCB0byBnZXQgdGhlIGNoYW5nZXMgc3RhcnRpbmcgd2l0aCA3ZGM3MmZkZTZlZGViNWQ2YWM2
YjM4MzI1MzA5OThhZmVlYTY3Y2JjLiANCg0KVHdvIGlzIHRoYXQsIHNvbWV0aW1lcyAiSW5pdGlh
bGl6aW5nIHRhc2tzIiBzdGFnZSBhcHBlYXJzIHN0dWNrIGF0IDQ0JSBmb3IgYSBjb3VwbGUgbWlu
dXRlcy4gSSB0cmFjZWQgaXQgZG93biB0byB0aGlzIGNvZGUgaW4gcnVucXVldWUucHkgKGxpbmUg
MTE2OCBvbiB6ZXVzKToNCg0KICAgICAgICAjIEl0ZXJhdGUgb3ZlciB0aGUgdGFzayBsaXN0IGFu
ZCBjYWxsIGludG8gdGhlIHNpZ2dlbiBjb2RlDQogICAgICAgIGRlYWx0d2l0aCA9IHNldCgpDQog
ICAgICAgIHRvZGVhbCA9IHNldChzZWxmLnJ1bnRhc2tlbnRyaWVzKQ0KICAgICAgICB3aGlsZSBs
ZW4odG9kZWFsKSA+IDA6IA0KICAgICAgICAgICAgZm9yIHRpZCBpbiB0b2RlYWwuY29weSgpOg0K
ICAgICAgICAgICAgICAgIGlmIGxlbihzZWxmLnJ1bnRhc2tlbnRyaWVzW3RpZF0uZGVwZW5kcyAt
IGRlYWx0d2l0aCkgPT0gMDoNCiAgICAgICAgICAgICAgICAgICAgZGVhbHR3aXRoLmFkZCh0aWQp
DQogICAgICAgICAgICAgICAgICAgIHRvZGVhbC5yZW1vdmUodGlkKQ0KICAgICAgICAgICAgICAg
ICAgICBzZWxmLnByZXBhcmVfdGFza19oYXNoKHRpZCkNCg0KV2hlbiBJIGluc3RydW1lbnQgdGhl
IGxvb3AgdG8gcHJpbnQgb3V0IHRoZSBzaXplIG9mICJ0b2RlYWwiLCBJIHNlZSBpdCBkZWNyZWFz
ZSB2ZXJ5IHNsb3dseSwgc29tZXRpbWVzIG9ubHkgYSBjb3VwbGUgYXQgYSB0aW1lLiBJJ20gZ3Vl
c3NpbmcgdGhpcyBpcyBiZWNhdXNlIHByZXBhcmVfdGFza19oYXNoIGlzIGNvbnRhY3RpbmcgdGhl
IGhhc2ggZXF1aXYgc2VydmVyLCBpbiBhIHNlcmlhbCBtYW5uZXIgaGVyZS4gSSdtIG92ZXIgbXkg
d29yayBWUE4gd2hpY2ggbWFrZXMgdGhpbmdzIGV4dHJhIHNsb3cuIElzIHRoZXJlIGFuIG9wcG9y
dHVuaXR5IGZvciBiYXRjaGluZyBoZXJlPyANCg0KVGhhbmtzLA0KQ2hyaXMNCg==

