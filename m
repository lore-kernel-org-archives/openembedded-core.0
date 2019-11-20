Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410111.outbound.protection.outlook.com [40.107.141.111])
	by mail.openembedded.org (Postfix) with ESMTP id 701F67F3B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=T/X4n3JjFzbb7RHTra8fRoPfZQc7eNXE++N6D1Q9tSscVipbC4j9cDqPZjAs6wcAFQioGEb9fZS2iayHeY1W/7EphrQAmHwc9zXaO4dYy9EXID4aDS82usCcIePXNX770YXURKN/Yf2bP3WG4zo+cjgMoiDBOOirGJu+1qpIW2wK+mf+ZTXQFVVoJvLfAELwd3gzf0z8WEV6y5PFgaAHTCmXbpfVjgDA20dqWdTA8kpvVoUMtPVWJFo02NVqSmbAyIoRxi8StfHQp8g2528SKcaeIsdJw3XZEqbSaLb+gcBM8MQeWGPe8l8iI/Nwcvq5EeEALo5h3r7cW8q3rwI1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/mSfPe8SkFsgM+6egHmV9A6pRrAN3zvMlvQoiBDA3UE=;
	b=DP1wTIL1btxa+fy/6NXFIPVr6G4fp0XXlGyqYj7uLNeXo8XJVZ84BZPjXiA5yQyR12T6Ht30j37f51rMM0jcI/96k18lLeSHeDjAzxH7yErfg3DQZO/MlDWT8wjS3UUhE3yDBMD9XCliyeawGlu5cC6gFDgmSymsMxXTderrxZxQU/O+vbn5lJXNsJWPjAEmAC34HQzd0ZdqWzJUcejUuISvF2QxD2imCuKvAdlA9SlJvv1SFVBWG8KuKOajqY8ipMstzhoSwNf/SvP7sOTyr6dod40x9zejklIMR1/EzFfqpuysaVHp51nrjRlwaKcKuOcY1Xm+wJJY7C0hTVtTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector1-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/mSfPe8SkFsgM+6egHmV9A6pRrAN3zvMlvQoiBDA3UE=;
	b=qEoq/J7DfY/vcCeQesyvNQasG1AkzJePfXHPeGgBLV/wkafq/JBHPxT9peEfV3BsrjoA1rp93kcYVsRVcnahIKOBPw8/FrA0mClHkJQPUMR21ygxc4ikpmF6Ms7hH5n7S7czS3mfV9xfm3jC3pfeGN5+iVMMaZdoCxhaZ3DmStg=
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com (20.177.101.86) by
	TYASPR01MB0007.jpnprd01.prod.outlook.com (20.177.104.146) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.16; Wed, 20 Nov 2019 11:50:45 +0000
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::ac7e:4214:cf9b:e29e]) by
	TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::ac7e:4214:cf9b:e29e%7]) with mapi id 15.20.2451.029;
	Wed, 20 Nov 2019 11:50:45 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH] pseudo: Update checksum of the license file
Thread-Index: AQHVn2tbLXUnTBJliUWpp5/qn+xIcKeT80YA
Date: Wed, 20 Nov 2019 11:50:45 +0000
Message-ID: <4a71f87251e4f9bcad5bf7963b395db54548f45b.camel@cybertrust.co.jp>
References: <20191120062728.105714-1-shohei.maruyama@cybertrust.co.jp>
	<CANNYZj8X0YbDb2rDFjrqVMt-gm+Y8VxOgcQpZgr8abeVJ_rgmg@mail.gmail.com>
	<f3e6ab8a8e2fad37929e16fb99ab861741319d24.camel@cybertrust.co.jp>
In-Reply-To: <f3e6ab8a8e2fad37929e16fb99ab861741319d24.camel@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYAPR01CA0202.jpnprd01.prod.outlook.com
	(2603:1096:404:29::22) To TYAPR01MB3007.jpnprd01.prod.outlook.com
	(2603:1096:404:7f::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1bc1d3a2-bed2-40d9-5ca8-08d76dafe09f
x-ms-traffictypediagnostic: TYASPR01MB0007:
x-microsoft-antispam-prvs: <TYASPR01MB000729DE90B301A114A96ADFD64F0@TYASPR01MB0007.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(5640700003)(486006)(6436002)(6916009)(2501003)(6486002)(66066001)(316002)(6512007)(476003)(2906002)(2616005)(6246003)(118296001)(7736002)(5660300002)(66446008)(305945005)(71190400001)(71200400001)(256004)(64756008)(66556008)(478600001)(66946007)(66476007)(76176011)(25786009)(86362001)(26005)(52116002)(6506007)(102836004)(386003)(446003)(15650500001)(2351001)(11346002)(8676002)(99286004)(4001150100001)(3846002)(6116002)(81166006)(81156014)(8936002)(229853002)(1361003)(14454004)(4326008)(36756003)(186003)(4744005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:TYASPR01MB0007;
	H:TYAPR01MB3007.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ozSepAnp6/gZ6IXIm4Ywuf7yLSK7artVxbcio3SS/SB5KffCbswqMWthC+TQrFQt4QssOrDdoHT2obOHPbJrT9nCiPfPxjEKLsmMImnK/E2LRsqdzAqZHoWt0D2dw1KdB0be+UxgberoKtVCoFk/kTl59Py65RgR0WwDEdAzm/pMCfKARnX/iIgA8BEP0Kic6t4K0vKIwiOh9PGWsPKyA50xoH4BM5p2s0Z/k+zO9pnpHxfU/4g81p/SaX5/DQYtC6quwVCl7HEUKupkMRw1ES5UNUP9rmc3ofwvqxkA9GEg+bRAQqw5e6cS4V/oKyDKIjD/e2816+lJdoETvWmqgXcixcx0UGdIDGlVy0Sh/MhbewEXwKa/U38gEnfs8Onj6A4xUbQtj3CSDmxQhr4UM1YcwwoTtBhrLlFj7qMTqOUEdO7+bjpgr+r0ElEYz7X+
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc1d3a2-bed2-40d9-5ca8-08d76dafe09f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 11:50:45.2528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LiKQWXlUVKqFVcekw7ocDKGT+H+hEpwCgIeQsJLjbp554JPj1NGQDWRDGcKuWVqH8I7N+5FVkSAlUyTGgGrv1GUIXpUGM+QJaYC6+1+1j+2L+n6m3gFWroRUwJnGbZ/F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYASPR01MB0007
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Update checksum of the license file
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
X-List-Received-Date: Wed, 20 Nov 2019 11:50:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4293A987C212FF49882635D66D23F844@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTExLTIwIGF0IDExOjM5ICswMDAwLCBzaG9oZWkubWFydXlhbWFAY3liZXJ0
cnVzdC5jby5qcCB3cm90ZToNCj4gT24gV2VkLCAyMDE5LTExLTIwIGF0IDEyOjIzICswMTAwLCBB
bGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gPiBPbiBXZWQsIDIwIE5vdiAyMDE5IGF0IDA3OjI2
LCA8c2hvaGVpLm1hcnV5YW1hQGN5YmVydHJ1c3QuY28uanA+IHdyb3RlOg0KPiA+ID4gUmVjZW50
bHkgcHNldWRvLmluYyBoYXMgYmVlbiB1cGRhdGVkIHRvIGxhdGVzdCBtYXN0ZXINCj4gPiA+IChk
NTBiOWM1MTFlMTdjNmY1ODJlDQo+ID4gPiBmMzliNjFlYWFhOGQ0NTU1ZWFiYmEpLCBidXQgY2hl
Y2tzdW0gb2YgdGhlIGxpY2Vuc2UgZmlsZSBkaWQgbm90DQo+ID4gPiBjaGFuZ2UuDQo+ID4gPiBU
aGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBjaGVja3N1bSB0byBsYXRlc3Qgb25lLg0KPiA+IA0KPiA+
IEkgYW0gbm90IHN1cmUgSSBjYW4gbWFrZSBzZW5zZSBvZiB0aGlzLiBXaGVuIHRoZSBjaGVja3N1
bSBvZiB0aGUgZmlsZQ0KPiA+IGNoYW5nZXMgdXBzdHJlYW0sIGJpdGJha2Ugd2lsbCBjb21wbGFp
biBhbmQgcmVmdXNlIHRvIHByb2NlZWQsIHdoaWNoIGlzDQo+ID4gbm90IGhhcHBlbmluZyB3aXRo
IHRoZSBjdXJyZW50IG1hc3RlciBicmFuY2guDQo+ID4gV2hhdCBlcnJvciBtZXNzYWdlIGFyZSB5
b3Ugc2VlaW5nIGFuZCB3aGF0IGNvbW1pdCBhcmUgeW91IG9uPw0KPiA+IA0KPiA+IEFsZXgNCj4g
DQo+IEhpIEFsZXgsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHJlcGx5aW5nLg0KPiBJJ20gc29ycnkg
Zm9yIEkgZm9yZ290IHRvIGRlc2NyaWJlIG15IHNpdHVhdGlvbi4gSSdtIG9uDQo+IGM5YTFhNjA4
ZjUxNDZlNWRjZmViYzhlNTY2Y2I3ZjYzODhhMzk4NmYgKHdhcnJpb3IpLg0KPiANCj4gUmVnYXJk
cywNCj4gDQo+IFNob2hlaSBNYXJ1eWFtYQ0KDQpQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guIFRo
ZSBwcm9ibGVtIGlzIG5vdCByZWxhdGluZyBwb2t5LCByZWxhdGluZyBvdGhlcg0KbGF5ZXIuDQoN
ClJlZ2FyZHMsDQoNClNob2hlaSBNYXJ1eWFtYQ0KDQo=

