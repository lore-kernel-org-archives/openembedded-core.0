Return-Path: <bartlomiej.kucharczyk@nokia.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0122.outbound.protection.outlook.com [157.56.112.122])
	by mail.openembedded.org (Postfix) with ESMTP id A502B700EB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iQZSV22O42fAJIxm1uRMUF9ZEnXxhUn7NvXjMYaBvvo=;
	b=Uz/RBMBG3iGAHe3x0XiENSEHNz60cJQwDKg8urAAw2VxoXRA0tBDZ7wWIzuywQioAJ8jo2Q/BiokDm5KSLE/LRk3b03FFRRI9TFm6RgcXTcRtuWHEEOAtNF0rORvAs7970hKkccYlHTaVErBiKZPM+iHrzgumxyQ+csywHwjUqY=
Received: from AM3PR07MB228.eurprd07.prod.outlook.com (2a01:111:e400:8819::20)
	by AM3PR07MB226.eurprd07.prod.outlook.com (2a01:111:e400:8819::18)
	with Microsoft SMTP Server (TLS) id 15.1.485.9;
	Fri, 6 May 2016 10:10:25 +0000
Received: from AM3PR07MB228.eurprd07.prod.outlook.com
	([fe80::7d44:8a68:cdaa:ca98]) by AM3PR07MB228.eurprd07.prod.outlook.com
	([fe80::7d44:8a68:cdaa:ca98%18]) with mapi id 15.01.0485.011;
	Fri, 6 May 2016 10:10:25 +0000
From: "Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)"
	<bartlomiej.kucharczyk@nokia.com>
To: EXT Christopher Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] How to force BitBake to track dependency to
	METADATA_REVISION?
Thread-Index: AdGm/HmzYSUtO8YdRD+Yb3Ba5Zji7AAJprIAABatTAA=
Date: Fri, 6 May 2016 10:10:25 +0000
Message-ID: <AM3PR07MB22889D01AF1F38A1664FBB3F97D0@AM3PR07MB228.eurprd07.prod.outlook.com>
References: <DBXPR07MB23993DC9B9946851B629E21F97C0@DBXPR07MB239.eurprd07.prod.outlook.com>
	<CABcZANniNW9XRsATUvu=D0nSMWh2paEWPED2xZRjo2z6VBKvBg@mail.gmail.com>
In-Reply-To: <CABcZANniNW9XRsATUvu=D0nSMWh2paEWPED2xZRjo2z6VBKvBg@mail.gmail.com>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kergoth.com; dkim=none (message not signed)
	header.d=none; kergoth.com; dmarc=none action=none header.from=nokia.com;
x-originating-ip: [131.228.2.18]
x-ms-office365-filtering-correlation-id: 6144b8e0-54cf-48f3-15fd-08d37596a47b
x-microsoft-exchange-diagnostics: 1; AM3PR07MB226;
	5:07LqInobW0pqImfUY+sbtS4IapacbRAN4oo3RxJdDoX1ZGTtxqPxTVIbWhfpigukLMrjuDsO9PorMjm0LK0pPW4ftbx499LYIuBYJ1CuR4NFbd8agwkxf6lA+GtRzsKwGIL/BvPAk7GdOvmKTG3Jhw==;
	24:Y2V1812uPzDwmp7dCmLqT8MwrNKR9rKQtg2lBrcVztuV3gtRaiVNJEo7sK3GRFi/MOOS2D5LZ1F8MkqJyDvk6TsXF3M5bbPTTZv2yDt/XLk=;
	7:fIRRNP9iUDY7GSb0xE9iEGCRF/HLqfO4QrVXPdIxSDWgh+qZPc6s42aJhABAQdIy1nNY8h5hTg9bBNul8z1pcJxtEnU4O91xRreOVhWCYoCUn5qYGe9PeXEBnBPqI9LixkMJKhleMXBdZYX2F6qgdzau8ZwjoVUut1sRRvh5UPhhS+9Nqq/kS+NGU1FtVavl
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR07MB226;
x-microsoft-antispam-prvs: <AM3PR07MB226F59C63AB4FB194D77358F97D0@AM3PR07MB226.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:AM3PR07MB226; BCL:0; PCL:0; RULEID:; SRVR:AM3PR07MB226; 
x-forefront-prvs: 09347618C4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(2900100001)(8936002)(33656002)(5008740100001)(5004730100002)(9686002)(2950100001)(66066001)(189998001)(74316001)(5003600100002)(81166005)(11100500001)(110136002)(2906002)(92566002)(3660700001)(87936001)(5250100002)(3280700002)(5002640100001)(4326007)(86362001)(76176999)(54356999)(3846002)(102836003)(6116002)(1220700001)(50986999)(586003)(76576001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR07MB226;
	H:AM3PR07MB228.eurprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2016 10:10:25.2102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR07MB226
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to force BitBake to track dependency to METADATA_REVISION?
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
X-List-Received-Date: Fri, 06 May 2016 10:26:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBCaXRiYWtlIHRyYWNrcyB1bmV4cGFuZGVkIGZvcm1zIG9mIHZhcmlhYmxlcywgbm90IGV4cGFu
ZGVkLiBTbyBpdCdzIGxpdGVyYWxseSBzdG9yaW5nICcke0BiYXNlX2RldGVjdF9yZXZpc2lvbihk
KX0iIGluIHRoZSBjaGVja3N1bSwgbm90IHRoZSBhY3R1YWwgcmV2aXNpb24uDQo+IE1FVEFEQVRB
X1JFVklTSU9OW3ZhcmRlcHZhbHVlXSA9ICIke01FVEFEQVRBX1JFVklTSU9OfSIgaW4geW91ciBy
ZWNpcGUgd2lsbCBkbyBpdC4NCg0KSGVsbG8hIA0KDQpUaGFua3MgZm9yIHlvdXIgYW5zd2VyLiBJ
J3ZlIHRyaWVkIHRvIHVzZSB2YXJkZXB2YWx1ZSwgYnV0IGl0IGRvZXMgbm90IHdvcmsuLi4gQWZ0
ZXIgSSBidWlsZCBpdCBmb3IgdGhlIHNlY29uZCB0aW1lIChhZnRlciBidW1waW5nIGdpdCByZXZp
c2lvbiksIG5vdGhpbmcgaXMgcmVidWlsdC4NCg0KICAgICQgYml0YmFrZSB0ZXN0DQogICAgLi4u
DQogICAgTk9URTogVGFza3MgU3VtbWFyeTogQXR0ZW1wdGVkIDI1MSB0YXNrcyBvZiB3aGljaCAw
IGRpZG4ndCBuZWVkIHRvIGJlIHJlcnVuIGFuZCBhbGwgc3VjY2VlZGVkLg0KICAgIC4uLg0KICAg
ICQgZWNobyAiIiA+PiAuLi9SRUFETUUNCiAgICAkIGdpdCBjb21taXQgLW0idGVzdCIgLi4vUkVB
RE1FDQogICAgJCBiaXRiYWtlIHRlc3QNCiAgICAuLi4NCiAgICBOT1RFOiBUYXNrcyBTdW1tYXJ5
OiBBdHRlbXB0ZWQgMjUxIHRhc2tzIG9mIHdoaWNoIDI1MSBkaWRuJ3QgbmVlZCB0byBiZSByZXJ1
biBhbmQgYWxsIHN1Y2NlZWRlZC4NCiAgICAuLi4NCg0KTXkgdGVzdCByZWNpcGUgaXM6DQoNCiAg
ICAkIGNhdCAuLi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGVzdC90ZXN0XzEuMC5iYg0KICAgIExJ
Q0VOU0UgPSAiQ0xPU0VEIg0KICAgIElOSElCSVRfREVGQVVMVF9ERVBTID0gIjEiDQogICAgTUVU
QURBVEFfUkVWSVNJT05bdmFyZGVwdmFsdWVdID0gIiR7TUVUQURBVEFfUkVWSVNJT059Ig0KICAg
IGRvX2NvbXBpbGUoKXsNCiAgICAgICAgZWNobyAiJHtNRVRBREFUQV9SRVZJU0lPTn0iID4gIiR7
U30vdGVzdGZpbGUiDQogICAgfQ0KDQpBbnkgc3VnZ2VzdGlvbnM/DQoNCkJhcnRlaw0K

