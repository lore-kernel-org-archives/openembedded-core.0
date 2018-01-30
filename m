Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0052.outbound.protection.outlook.com [104.47.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id AAA1A71BFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hFYjCZ00IOcz7djz6oKZ6RvLmXBgjn1VKNezk7f/OZQ=;
	b=yIWK0uUlz6mS90YFSFEkaMQV/B1xEaiPnggCPIFGVv+3+INqcBRVbgtKatE/fVraPQqTrlNbWHHUDm2LWqSfC3Ve9ogR68a4UJuje3R9h4mZVwC6fI/eaY4Xd+xkNOIP7yaIIfct3snGvxv4Fe5p36c6J+Y6DpXti7YkulBxBko=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB267.namprd02.prod.outlook.com (10.242.236.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Tue, 30 Jan 2018 16:34:05 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0428.026; Tue, 30 Jan 2018 16:34:05 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: Add comm to HOSTTOOLS
Thread-Index: AQHTmSlH5k1h2zZ6sU+NF2lo4LVknKOL934AgAAIJ4CAAJzbcA==
Date: Tue, 30 Jan 2018 16:34:05 +0000
Message-ID: <BY2PR02MB347A0B646A0F7C24A121FDBB9E40@BY2PR02MB347.namprd02.prod.outlook.com>
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<2afb5638-31ca-39fa-bf28-d305fea507c0@linux.intel.com>
	<48a79520-c02f-2dfe-b25b-0b89beb182d6@gmail.com>
In-Reply-To: <48a79520-c02f-2dfe-b25b-0b89beb182d6@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB267;
	7:2/Rs0RrKQZhkdnGL8elNM2PRTosrsXI6YIC7sa7TryEq2zGITHScMBc8ERZ0/JhEpTxh+qvb4eI0U0BLmEg6hArOfmaZVucKo63BERziU2k6iVJ4dzwz89V7qzw0CC483zjjv9wSIU52eAIfEhCfOicnR4k60tzmDfb/7Oix5UlibkHFfuFMfSjuqK2EnrTC4sNbek0TZeZ5LpdBAgKRGBB4jQvfHcgSot2jRY2NlPuVfs/GqWVBkCZenqEJuAVQ
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5735a413-46b7-4b30-7aa5-08d567ff479e
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB267; 
x-ms-traffictypediagnostic: BY2PR02MB267:
x-microsoft-antispam-prvs: <BY2PR02MB26721BF7703B356BDBF8845B9E40@BY2PR02MB267.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231101)(944501161)(6055026)(6041288)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB267; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB267; 
x-forefront-prvs: 0568F32D91
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(366004)(376002)(39380400002)(39860400002)(396003)(13464003)(199004)(189003)(2950100002)(110136005)(25786009)(6116002)(102836004)(81166006)(2501003)(8676002)(72206003)(478600001)(81156014)(33656002)(2900100001)(316002)(26005)(6436002)(6506007)(53546011)(97736004)(5660300001)(229853002)(7696005)(186003)(55016002)(53936002)(3660700001)(99286004)(86362001)(106356001)(76176011)(105586002)(2906002)(74316002)(14454004)(6246003)(305945005)(39060400002)(68736007)(3280700002)(9686003)(77096007)(3846002)(8936002)(7736002)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB267;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Pv8ZSwsKS5f/AOeatV07ERrnl7p9wSKyZW1QdaR85xN2lDTGQSKis1PXK/F0GsOQu/A7X+wE+xEM12eTqIN5eg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5735a413-46b7-4b30-7aa5-08d567ff479e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2018 16:34:05.7745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB267
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Tue, 30 Jan 2018 16:34:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gS2hl
bSBSYWoNCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDI5LCAyMDE4IDExOjA3IFBNDQo+IFRvOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIXSBiaXRiYWtlLmNvbmY6IEFkZCBjb21tIHRvIEhPU1RUT09MUw0KPiAN
Cj4gDQo+IA0KPiBPbiAxLzI5LzE4IDEwOjM4IFBNLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToN
Cj4gPiBPbiAwMS8yOS8yMDE4IDA3OjQ3IFBNLCBOaWtvIE1hdW5vIHdyb3RlOg0KPiA+PiBUaGlz
IG1pdGlnYXRlcyBmb2xsb3dpbmcgaXNzdWVzIGR1cmluZyB1LWJvb3QgZG9fY29tcGlsZSgpIHN0
ZXAgLS0NCj4gPj4gb3RoZXJ3aXNlLCBpZiBjb21tIGlzIG5vdCBhdmFpbGFibGUsIHRoZXkgYXJl
IHF1aWV0bHkgaWdub3JlZDoNCj4gPj4NCj4gPj4gwqDCoCAuLi4vc2NyaXB0cy9jaGVjay1jb25m
aWcuc2g6IGxpbmUgMzM6IGNvbW06IGNvbW1hbmQgbm90IGZvdW5kDQo+ID4+IMKgwqAgLi4uL3Nj
cmlwdHMvY2hlY2stY29uZmlnLnNoOiBsaW5lIDM5OiBjb21tOiBjb21tYW5kIG5vdCBmb3VuZA0K
PiA+Pg0KPiA+PiBTaW5jZSAnY29tbScgaXMgcHJvdmlkZWQgYnkgY29yZXV0aWxzIHBhY2thZ2Us
IGFkZGluZyBpdCB0byBIT1NUVE9PTFMNCj4gPj4gd2FzIGNvbnNpZGVyZWQgYSBsb3dlciBpbXBh
Y3QgZml4IGNvbXBhcmVkIHRvIGFkZGluZyBjb3JldXRpbHMtbmF0aXZlDQo+ID4+IGJ1aWxkdGlt
ZSBkZXBlbmRlbmN5IHRvIHUtYm9vdCByZWNpcGUuDQo+ID4NCj4gPiBJIGRpc2FncmVlLiBFeHBh
bmRpbmcgSE9TVFRPT0xTIGp1c3QgdG8gY2F0ZXIgdG8gdGhlIG5lZWRzIG9mIGEgc2luZ2xlDQo+
ID4gcmVjaXBlIGlzIG5vdCBvcHRpbWFsLCBJTU8uDQo+DQo+IGFsdGVybmF0aXZlIGFyZQ0KPiBi
dWlsZCB0aW1lIGRlcCBvbiBjb3JldXRpbHMtbmF0aXZlLg0KDQpUaGlzIHdvcmtzLCB0ZXN0ZWQg
aXQgaG93ZXZlciB1LWJvb3Qgbm93IHdpbGwgZGVwZW5kIG9uIGNvcmV1dGlscy1uYXRpdmUuDQoN
Cj4gZml4IHVib290IHNjcmlwdCB0byBub3QgdXNlIGNvbW0NCj4gZG8gbm90IGludm9rZSBjaGVj
ay1jb25maWcuc2ggYXQgYWxsLg0KPiANClRoaXMgbWlnaHQgbm90IGJlIGFuIG9wdGlvbiBmb3Ig
dXMgOikNCg0KPiBub25lIG9mIHRoZW0gYXJlIGFueSBiZXR0ZXIuDQo+IA0KDQpBZ3JlZSB3aXRo
IEtoZW0gaGVyZSwgaWYgaXQgaXMgbm90IGluIEhPU1RUT09MUywgaXQgd2lsbCB0cmlja2xlIGRv
d24gdG8gY29yZXV0aWxzLW5hdGl2ZSB0aWxsIHUtYm9vdCBzY3JpcHQgZ2V0cyBwYXRjaGVkLiAg
IA0KDQpUaGFua3MsDQpNYW5qdQ0K

