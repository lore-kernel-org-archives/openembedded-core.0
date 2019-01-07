Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 28704 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Jan 2019 07:35:47 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790089.outbound.protection.outlook.com [40.107.79.89])
	by mail.openembedded.org (Postfix) with ESMTP id D6BBC6D268
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 07:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XhVmpJYdcqSyesKId3d3bUusySSFb2WP++Ix4l8YZ3M=;
	b=PK8lGRSiV4WmSQVJkn3ydmU+SSe9ylQZ4ISqmeIqVdzA/MYNzzh16B/YD0icnFifN7golVMmmdS9lBnQyoaO3mrC5UiEon9NVBgmLYHHtRv9ZGOjWoU/uw//+I56j7Yq87MrO/2zlqJVeFabUD+5FduyJxpXAEw+zOQEB/wRF4M=
Received: from DM5PR18MB1452.namprd18.prod.outlook.com (10.173.214.17) by
	DM5PR18MB1644.namprd18.prod.outlook.com (10.175.224.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.9; Mon, 7 Jan 2019 19:03:40 +0000
Received: from DM5PR18MB1452.namprd18.prod.outlook.com
	([fe80::cc9d:a769:501e:d4a]) by DM5PR18MB1452.namprd18.prod.outlook.com
	([fe80::cc9d:a769:501e:d4a%8]) with mapi id 15.20.1495.011;
	Mon, 7 Jan 2019 19:03:40 +0000
From: Martin Kelly <mkelly@xevo.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2 7/7] meson: enable nativesdk
Thread-Index: AQHT+ev3geAPqleHUU6IZ+aFHc1yNaWlGNqA///RKACAAIagAIAAEuaA
Date: Mon, 7 Jan 2019 19:03:40 +0000
Message-ID: <b58692ae-91e1-f184-7c20-2a2559ffac3e@xevo.com>
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-8-mkelly@xevo.com>
	<CAJTo0LY-16oCyFf-etweZq1P5=DpOtG8Qou0pQHMa0mZkXvPaA@mail.gmail.com>
	<db1d1175-3104-eb1f-a3ca-66c7c362aa4a@xevo.com>
	<CAJTo0La_G9H-unLAJKkf_EaTqt+AvONk8wNsOw66WVO3n6Gh6A@mail.gmail.com>
In-Reply-To: <CAJTo0La_G9H-unLAJKkf_EaTqt+AvONk8wNsOw66WVO3n6Gh6A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR19CA0089.namprd19.prod.outlook.com
	(2603:10b6:320:1f::27) To DM5PR18MB1452.namprd18.prod.outlook.com
	(2603:10b6:3:bc::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [174.21.177.9]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR18MB1644;
	6:z/TmtM4nc+HRsZ7hF3N4A71C2hm24Laxxv4rn7Am/be9rILv5GsK0RMzncPGYplO0YJVY3PnmMExLEMHx7ZLH9h4mtB07ZN5MidZw9/XylAQW6crtcdJCIuHfLNsatTTFiJkx0kW94S99Hw1caM7EgVS5KCCguzRgLbxGAkMaNbqW3itx4N8d7+cAfbGPfqfuuocaEW+iQCZbVsvu4zgVELttyIElFbA416zWnNHEXCFqLjWcPq+ivXSE7m8oXEeBC8qhYEO0bF6IU54vrT+1VjgmrP/+JLI35zabcJYyuBGpuH14lNHlP7iZGrGRtyDe/01UOx8luYT4R2oFgSoUFrkUp5rD1cZgMLvgjeU7gGBGcxDY1InDJzWggXIMLbS8mesIw5UAvXj8Qm+3NcvdySsnqlVKTY5nkgBJfCMQw8020OnAhzT0p3TJVdn1Z2OvfQZm7bV1vB2ySsnkhsBzg==;
	5:enz2PIUpg/6Lu4EhIOj+zrCC7PWk7sQ0a33wld5iWgXVISl3doyEXLAGhOqqcR7WARdH0MifFYzBlqCgdyFKXN0VFxhlxa3cwHZb1iKN4IKhHsuPfF8/+y0ww0RC48iPOMiPa7kv67tgXYNTaa0QVzeWLzat2lgnAGV/6Yq1qwS2XDT5qnszrRTuJ3ifOw3C35gTfP73MET22EIB1wuIGw==;
	7:ZDTwYjUX/QhxM3crqE+/UNClWjG18t1SDV8GEfRF3h7qGRve+hVLoP4qxn2njSV5IxbOiaMGP3O8jwyMQ2QPO+5LqTgetyopDbD37dyg62WRybdXn29yDqkwP7YlZUU3EXmx+7J2N/9HBdIPb6KLpQ==
x-ms-office365-filtering-correlation-id: 0cb1e7a0-c314-450e-f115-08d674d2d5b3
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR18MB1644; 
x-ms-traffictypediagnostic: DM5PR18MB1644:
x-microsoft-antispam-prvs: <DM5PR18MB164433ED2E3D29C2EDCCF35FAB890@DM5PR18MB1644.namprd18.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(6041310)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM5PR18MB1644; BCL:0; PCL:0; RULEID:; SRVR:DM5PR18MB1644; 
x-forefront-prvs: 0910AAF391
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(346002)(39840400004)(396003)(376002)(366004)(199004)(189003)(52116002)(97736004)(93886005)(31696002)(486006)(26005)(99286004)(6916009)(53546011)(6506007)(102836004)(186003)(76176011)(8936002)(386003)(6346003)(4326008)(25786009)(476003)(71200400001)(14454004)(71190400001)(105586002)(3846002)(106356001)(6116002)(316002)(446003)(11346002)(66066001)(2616005)(36756003)(229853002)(6486002)(31686004)(14444005)(68736007)(305945005)(256004)(2906002)(6512007)(8676002)(81156014)(81166006)(478600001)(53936002)(86362001)(7736002)(5660300001)(6436002)(6246003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR18MB1644;
	H:DM5PR18MB1452.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S9C7Kh2NxwsaVhsJKIJDr1wDY8HYCtX8y69OOjPxyofKlFKVDcyhsPRat6fc95gQf5I0xDGMRLzznBExkiH8p5ts9QZkWMeilwY0caP8QtSX7opsgZSttCg9BJJBeTKIp+OXrlwC0sNXe0qJsxxd75svUUb87htulqnMRA9Wgptp+OAm8hXI3DdRpcWhAYvxUOFfvNXw7h9xxLQoHIBzeoA1wqW4o3wxPi10pnEBWzRUnQp7BzxkURhlSQkmFKslzdcxKsJk1Y2IevVmLpMRaHpK4LASqh/ERFx8etPHIIWJOzZjnqYnTqDX48tAG3K7
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb1e7a0-c314-450e-f115-08d674d2d5b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2019 19:03:40.4314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1644
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 7/7] meson: enable nativesdk
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
X-List-Received-Date: Tue, 08 Jan 2019 07:35:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7A266C3EC5A0F44B48AEAB64E780E5D@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMS83LzE5IDk6NTUgQU0sIEJ1cnRvbiwgUm9zcyB3cm90ZToNCj4gT24gTW9uLCA3IEphbiAy
MDE5IGF0IDE3OjU0LCBNYXJ0aW4gS2VsbHkgPG1rZWxseUB4ZXZvLmNvbT4gd3JvdGU6DQo+PiBD
b3VsZCB5b3UgZWxhYm9yYXRlIG9uIGV4YWN0bHkgd2hhdCBpcyBicmVha2luZywgb3IgZG8geW91
IGhhdmUgYSBsaW5rDQo+PiB0byB0aGUgYXV0b2J1aWxkZXIgYnJlYWthZ2U/DQo+Pg0KPj4gVG8g
Z2l2ZSBhIGJpdCBvZiBiYWNrZ3JvdW5kLCBjbWFrZSBoYW5kbGVzIHRoaXMgYnkgcHV0dGluZyBl
bnYgdmFycw0KPj4gZGlyZWN0bHkgaW50byB0aGUgd3JhcHBlciBzY3JpcHQuIEhvd2V2ZXIsIG1l
c29uIGRvZXMgbm90IHN1cHBvcnQgZW52DQo+PiB2YXJzIGluIGl0cyBjcm9zcyB0b29sY2hhaW4g
ZmlsZSAoYW5kIHVwc3RyZWFtIGlzIHJlc2lzdGFudCB0byBhZGRpbmcNCj4+IGl0KSwgc28gd2Ug
YXJlIGxlZnQgd2l0aCBnZW5lcmF0aW5nIHBhdGhzIGF0IHJlbG9jYXRlIHRpbWUuDQo+IA0KPiBB
IG11bHRpbGliIFNESyBoYXMgbXVsdGlwbGUgZW52aXJvbm1lbnQgc2NyaXB0cywgYW5kIGl0cyBv
bmx5IHRoZQ0KPiBlbnZpcm9ubWVudCBzY3JpcHRzIHRoYXQgZGlmZmVycy4gIEJ5IHRoZSB0aW1l
IEknZCBmaWd1cmVkIG91dCB3aGF0DQo+IHRoZSBwcm9ibGVtIHdhcyBJIHdhcyBjbG9zZSB0byBz
b2x2aW5nIGl0LCBzbyB0aGVyZSdzIHBhdGNoZXMgb24gdGhlDQo+IGxpc3QgdG8gc29sdmUgdGhp
cyBwcm9ibGVtLg0KPiANCj4gUm9zcw0KPiANCg0KR290IGl0LCB0aGFua3MhDQo=

