Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 27812 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Jan 2019 19:38:53 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
	by mail.openembedded.org (Postfix) with ESMTP id B130D6AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zhe7TzsVzhgFlZE0gXUgrzlLDnxiREs7cQy3NMIkAWI=;
	b=Tzuqo/VmwSROeucT7HWNpwtG43Li/pgg6DugfdE6Taw18P/3mZnbjoMqJAeDj9PWAuNE+ZPNTvv5YQ1hC3W37S4yp2yRDEV7DkwXiu8rafSStKOJDwFCGue9/jP45uqoUHXBu//XLwx+/madXKQ7R6wizsHWdTAjAfn3BazEJho=
Received: from DM5PR18MB1452.namprd18.prod.outlook.com (10.173.214.17) by
	DM5PR18MB1611.namprd18.prod.outlook.com (10.175.224.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.7; Mon, 7 Jan 2019 20:07:24 +0000
Received: from DM5PR18MB1452.namprd18.prod.outlook.com
	([fe80::cc9d:a769:501e:d4a]) by DM5PR18MB1452.namprd18.prod.outlook.com
	([fe80::cc9d:a769:501e:d4a%8]) with mapi id 15.20.1495.011;
	Mon, 7 Jan 2019 20:07:24 +0000
From: Martin Kelly <mkelly@xevo.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 3/7] meson: fix nativesdk-meson for multilib
	SDKs
Thread-Index: AQHUpqeCa8HIPhfIskuI0gSSXGWRd6Wjo9uAgACWsQCAAAFUgA==
Date: Mon, 7 Jan 2019 20:07:24 +0000
Message-ID: <4aaa9cb8-dbc4-7991-e470-6ecedfb1838b@xevo.com>
References: <20190107163823.31816-1-ross.burton@intel.com>
	<20190107163823.31816-3-ross.burton@intel.com>
	<b22346fb-8cd8-a747-de26-cbcd5a39deea@xevo.com>
	<CAJTo0LYHrwfyL98stDqaxRug65ioeRgKjc-Q9CTyyqr-behAKw@mail.gmail.com>
In-Reply-To: <CAJTo0LYHrwfyL98stDqaxRug65ioeRgKjc-Q9CTyyqr-behAKw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
	To DM5PR18MB1452.namprd18.prod.outlook.com
	(2603:10b6:3:bc::17)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [174.21.177.9]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR18MB1611;
	6:HBMpLPqtwz9hzuC7AKsRq7TKB450U6k850+r3I2P0SMTMUj9y8E31HUH018vipc3H5sNOVkLX8GIQudflt/JTV/tQ1ugE/sPiXa8BSTpZcXmWmiM18Z5sA+3n6/6mxaux7vXBTh1owB/R+RwTV3AOU1TDhTX8l6DwUif7yYmDXjkRAzhyFxd/B/ol1Y1WyR23lVKQX9nUnykG/K/z36j/iUxDULqs04t2cpv+FU7qeH8/Bn2/XimxYvBsdUnckQwYexfjBsJQ1jDosvjRy83v2EOYH+VcukVpsA95Asz3hvsC5/hs4qLXEE9HCGDkgc/eFlEmJmJ5DxYADlF/ZifEDRlb6qyjK4nDo8O/2Q9ZKUBw9CYRFtD0EDXq79GWqoD3vwVXHyIN/iimVFEohOL2WaKcWQiXsByw6leTPcaY2keL4gvLDb8kh+KAlHT2PzFNxWqdVJ0nmoR+Pcx4zRpyA==;
	5:ni5hcn2e0HoVaotE9llWf3cQToFPBYNba+7Mswak2PhRyaY7GZwWZQiSaYawWERDPos6vJLbQOzp6zl2GijWhnnBqMY5KfRbR+MWQHZwf4bcoexCGd5sIvTI4mPo7wjky1nbAwb8t0trPcRO8x5SucbqpaTFj20JRRmc1C2g8eHWSJGw2VshzxNAsgi8xy4NO7amKI1+eKVvHqWTFVTGxA==;
	7:uXT9g5rzWLDrgM4O8BZJssOiKcbiq4lmR+bYTVG5ZAXOcawkv6uRID9PHPHuKUZh/l4LqrwzaoOTLzpIzmDWrIhhcu1mJDxm+4BZgwGDXojA7ULWD8G9j03p2v+gQQansoLOyDwNGlIr/YvUFq63/A==
x-ms-office365-filtering-correlation-id: 92cb6340-a139-4cea-b7f4-08d674dbbd2a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR18MB1611; 
x-ms-traffictypediagnostic: DM5PR18MB1611:
x-microsoft-antispam-prvs: <DM5PR18MB16115A923D0F98888542B63DAB890@DM5PR18MB1611.namprd18.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(93006095)(93001095)(3002001)(3231475)(944501520)(52105112)(10201501046)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM5PR18MB1611; BCL:0; PCL:0; RULEID:; SRVR:DM5PR18MB1611; 
x-forefront-prvs: 0910AAF391
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39840400004)(376002)(136003)(366004)(346002)(199004)(189003)(4326008)(305945005)(186003)(476003)(76176011)(256004)(7736002)(6246003)(386003)(6506007)(53546011)(25786009)(316002)(71200400001)(36756003)(52116002)(86362001)(6512007)(31696002)(5660300001)(99286004)(2906002)(71190400001)(8676002)(229853002)(8936002)(53936002)(31686004)(81166006)(3846002)(6116002)(81156014)(66066001)(478600001)(68736007)(6436002)(93886005)(105586002)(97736004)(446003)(11346002)(2616005)(102836004)(6486002)(26005)(14454004)(6916009)(486006)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR18MB1611;
	H:DM5PR18MB1452.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Y7KJSdX/Sof7XvS2xhn/gzMA/KwIlXFdO28hGShDHQIhPe3d3Jzerhx6PEc4rrBBzY5Fr/H1eMbYqvetAFZzbmOQBA9NC0hkgZ1PqwB1LLBinCDax02Iw0Kzb+14Nvh8/MKFMq9Vjtp+tPqy4ITEaIscY6zArXflX3pur+Rh3NtNCBf7NCN7Z/RgAJLqioJkWM69+nfbM40lsmsNYuwweO59fyfOZV8w8Ejcrj5HpIT8ZIqvimjnv1rpv+rvzhaCRiUHPxVwizdOE9KmrViXstnEx/zBZw39zUkIug0n5dmmLASh1NEHakB796KihOD
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cb6340-a139-4cea-b7f4-08d674dbbd2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2019 20:07:24.4280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1611
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] meson: fix nativesdk-meson for multilib SDKs
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
X-List-Received-Date: Tue, 08 Jan 2019 19:38:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <856B8886A0F35F43A44A797E0D940315@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMS83LzE5IDEyOjAyIFBNLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQo+IE9uIE1vbiwgNyBKYW4g
MjAxOSBhdCAxOTowMywgTWFydGluIEtlbGx5IDxta2VsbHlAeGV2by5jb20+IHdyb3RlOg0KPj4+
ICt3aXRoIG9wZW4odGVtcGxhdGVfZmlsZSkgYXMgaW5fZmlsZToNCj4+PiArICAgIHRlbXBsYXRl
ID0gaW5fZmlsZS5yZWFkKCkNCj4+PiArICAgIG91dHB1dCA9IFRlbXBsYXRlKHRlbXBsYXRlKS5z
dWJzdGl0dXRlKEVudmlyb24oKSkNCj4+PiArICAgIHdpdGggb3Blbihjcm9zc19maWxlLCAidyIp
IGFzIG91dF9maWxlOg0KPj4+ICsgICAgICAgIG91dF9maWxlLndyaXRlKG91dHB1dCkNCj4+DQo+
PiBJIGxpa2UgdXNpbmcgc3RyaW5nLlRlbXBsYXRlIGluc3RlYWQgb2YgY3VzdG9tIGxvZ2ljLCBi
dXQgc2hvdWxkbid0IHdlDQo+PiBrZWVwIHRoZSBhdG9taWMgcmVuYW1lIGxvZ2ljPyBJZiBzb21l
b25lIGhpdHMgY29udHJvbC1DIG9yIHRoZQ0KPj4gZXh0cmFjdGlvbiBwcm9jZXNzIGNyYXNoZXMg
ZHVyaW5nIHRoZSB3cml0ZSwgd2UgZG9uJ3Qgd2FudCBhIGNvcnJ1cHQNCj4+IGZpbGUgZHVlIHRv
IGEgcGFydGlhbCB3cml0ZS4NCj4gDQo+IElmIHNvbWVvbmUgY29udHJvbC1jJ3MgZHVyaW5nIFNE
SyB1bnBhY2ssIHRoZSBTREsgaXNuJ3QgdXNhYmxlLg0KPiANCg0KSSBkb24ndCB0aGluayBpdCB3
aWxsIGJyZWFrIGNsZWFubHkgdGhvdWdoOyBpbnN0ZWFkLCBzb21lIHRoaW5ncyB3aWxsIA0Kd29y
ayBhbmQgb3RoZXIgdGhpbmdzIHdvbid0LiBJIHdhcyB0cnlpbmcgdG8gYXZvaWQgY3J5cHRpYyBl
cnJvciANCm1lc3NhZ2VzIHN1Y2ggYXMgbWVzb24gaGl0dGluZyBhIHN5bnRheCBlcnJvci4gSG93
ZXZlciwgSSBhZ3JlZSB0aGF0IA0KdGhpcyBzaG91bGQgYmUgYWRkcmVzc2VkIGdsb2JhbGx5LiBT
ZXBhcmF0ZSBmcm9tIHRoaXMgY2hhbmdlLCBtYXliZSB3ZSANCnNob3VsZCBkcm9wIGEgc2VtYXBo
b3JlIGF0IHRoZSBlbmQgb2YgZXh0cmFjdGlvbiBhbmQgY2hlY2sgaXQgaW4gdGhlIGVudiANCnNl
dHVwIHNjcmlwdCwgc28gd2UgY2FuIGRpc3BsYXkgYSBuaWNlIG1lc3NhZ2UgaWYgc29tZXRoaW5n
IGRpZG4ndCBjb21wbGV0ZS4NCg==

