Return-Path: <B40290@freescale.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Nov 2014 05:31:38 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0109.outbound.protection.outlook.com [207.46.100.109])
	by mail.openembedded.org (Postfix) with ESMTP id 55D946AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 05:31:38 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB329.namprd03.prod.outlook.com (10.141.139.12) with Microsoft
	SMTP Server (TLS) id 15.1.26.9; Mon, 24 Nov 2014 05:31:38 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Mon, 24 Nov 2014 05:31:37 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0026.003; Mon, 24 Nov 2014 05:31:37 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH 2/2] u-boot.inc : add compile multiple u-boot
	feature
Thread-Index: AQHQBMdkDZiKS+f+cUuRQKv4LBxQU5xqX+JAgADx3oCAA/PdUA==
Date: Mon, 24 Nov 2014 05:31:36 +0000
Message-ID: <BY2PR03MB4413EEDE56020D61009227584720@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1416477996-13841-1-git-send-email-B40290@freescale.com>
	<CAP9ODKrqNDd4eWZDTwuH=4XvC=+wfq2gCE1enRTWKD6ge48Rpg@mail.gmail.com>
	<b922d73bb68345b5989401a77426c885@BY2PR03MB441.namprd03.prod.outlook.com>
	<CAP9ODKqg6p0q59ci_1CQAOSBwY=kS963W0Yud-oZptKK7ewFEA@mail.gmail.com>
In-Reply-To: <CAP9ODKqg6p0q59ci_1CQAOSBwY=kS963W0Yud-oZptKK7ewFEA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.51]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;UriScan:;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-forefront-prvs: 040513D301
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(24454002)(377454003)(13464003)(105586002)(106356001)(99286002)(16601075003)(106116001)(97736003)(15975445006)(101416001)(107046002)(15202345003)(93886004)(95666004)(19580395003)(40100003)(19580405001)(33656002)(76576001)(64706001)(87936001)(2656002)(122556002)(110136001)(74316001)(20776003)(92726001)(77156002)(46102003)(92566001)(86362001)(31966008)(66066001)(62966003)(21056001)(99396003)(54356999)(54606007)(76176999)(120916001)(54206007)(50986999)(4396001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB329;
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Mon, 24 Nov 2014 05:31:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMuDQoNCkkgaGF2ZSBzdWJtaXR0ZWQgbmV3IHYy
IHBhdGNoZXMgLg0KDQpUaGFua3MNCkNodW5yb25nDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IG90YXZpby5zYWx2YWRvckBnbWFpbC5jb20gW21haWx0bzpvdGF2aW8uc2Fs
dmFkb3JAZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgT3RhdmlvIFNhbHZhZG9yDQpTZW50OiBTYXR1
cmRheSwgTm92ZW1iZXIgMjIsIDIwMTQgMTowOCBBTQ0KVG86IEd1byBDaHVucm9uZy1CNDAyOTAN
CkNjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSB1LWJvb3QuaW5jIDogYWRkIGNvbXBpbGUg
bXVsdGlwbGUgdS1ib290IGZlYXR1cmUNCg0KT24gRnJpLCBOb3YgMjEsIDIwMTQgYXQgMToyOCBB
TSwgQjQwMjkwQGZyZWVzY2FsZS5jb20gPEI0MDI5MEBmcmVlc2NhbGUuY29tPiB3cm90ZToNCj4g
VWJvb3QgY29uZmlnIGluY2x1ZGVzIFNQTCB0eXBlLg0KPiBTbyBJIHRoaW5rIHNwbCB0eXBlIHNo
b3VsZCBiZSB0aGUgc2FtZSBidWlsdCB3aXRoIG90aGVyIHVib290IGNvbmZpZyB0eXBlLg0KDQpZ
b3UgcmVtb3ZlZCB0aGUgaW5zdGFsbCBibG9jayBvZiBTUEwgYmluYXJ5OyBJIHRoaW5rIGl0IHdp
bGwgYnJlYWsgU1BMIGJhc2VkIG9uZXMuDQoNCi0tIA0KT3RhdmlvIFNhbHZhZG9yICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBPLlMuIFN5c3RlbXMNCmh0dHA6Ly93d3cub3NzeXN0ZW1zLmNv
bS5iciAgICAgICAgaHR0cDovL2NvZGUub3NzeXN0ZW1zLmNvbS5icg0KTW9iaWxlOiArNTUgKDUz
KSA5OTgxLTc4NTQgICAgICAgICAgICBNb2JpbGU6ICsxICgzNDcpIDkwMy05NzUwDQo=

