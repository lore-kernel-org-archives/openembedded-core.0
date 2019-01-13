Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 46858 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Jan 2019 23:56:17 UTC
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20119.outbound.protection.outlook.com [40.107.2.119])
	by mail.openembedded.org (Postfix) with ESMTP id B89157BE0B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 23:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oYCnyGFh1LX9PeotIuhNpOSpXU4SwaKP227Z8FNJn9s=;
	b=JkdwfTilRrmBDkl9UPYWJDwG5i4N77rixyAbqaxRvwccAQF+8iyDggoiK3OF7d+vhdfLANZkjVZXjjwEPAF3ML6bmANcSw7UUZCDjLZhP7jFgYnVtlOkxXZT3DImuRlIxNNSWnRB43ahlRIXpLdR+HQL7Q5x6PQut/SseIo4ROA=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
	VI1PR10MB2432.EURPRD10.PROD.OUTLOOK.COM (20.177.62.152) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Sun, 13 Jan 2019 11:18:30 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::dc83:d2d3:895c:e6fc]) by
	VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::dc83:d2d3:895c:e6fc%4]) with mapi id 15.20.1516.019;
	Sun, 13 Jan 2019 11:18:30 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH resend^2] wic: allow bitbake variables in kickstarter
	files
Thread-Index: AQHUnwpquhLMeV6xGkCDGVeOoumouaWtJVSA
Date: Sun, 13 Jan 2019 11:18:30 +0000
Message-ID: <262d7d40-8d61-d613-ac3c-d1428573fa9b@prevas.dk>
References: <20180703125414.28470-1-rasmus.villemoes@prevas.dk>
	<20181229000646.23975-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20181229000646.23975-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR07CA0003.eurprd07.prod.outlook.com
	(2603:10a6:7:67::13) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.186.119.68]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR10MB2432;
	6:I6eUnznbESv1hoY1XOlmtdVPQ2T3HfTDgwCHBPPQdtOj7Kc+AZ2zfQo5OIOvxdooBIqChZGwxXpd2LjlWgau2SlWh/5PtWpPYd1IicB0fx52FHnG3hqQiTcT3Y+6mFMRt5bOLsq9o7smlkA04Sq6oIX6x5H21oHlOXuEifzfs/6TULOxBkfbzjC6ybBLrtiAprcc5DlfpoLDGLUKf2A5v2XX7XmCSIOECeVU4bYqwrild6hUwC5+oQSqyWAIO/7tGf5KHRTFA80am1oRmqJ71AfuzrCn0l9+Q+eQWmZcBGJfSZiVjFifQBbGKo2dqXCzY0/fZ/VGDNpnb4AV3a6Pi/LKqKcfDN97qE98zRZTvt0FxdBfVMpxXoR6pEyW/dY9XqLZ2yETjknmw5jnJlS1mFgUI0qmwsDOfVynmOd9NmfhCy/X2s8I5MAbT58kfZsdgKZ4PLEPqx7eUO06JtQbtA==;
	5:WunBMcK8GJUSUkH1c2TNR0OOKzsESpvP1uBF+eoFfjN1XWLUfLPnxNgM80soYan8rsHu9souwuLvbhs4qA52REPN9mcthP5Jlca2L4RH1nZ6rivWZLW6DjDCUg9z5DjXu2BvzVoavxPIVjd95GZzX/3LYUACvHIjMtySZ6MpAgcgvz9fljrCjVNklSJa5IHRrrh9SIfeNs7o8G5UYL9HlQ==;
	7:nf8fmtcpm4ZPAM8tbrRdza48wu5gh9jwud1o1GuCsNz7BsU3pGsTB88aczvUm0DVFRAoHZEiFE2SbpZvqpAOeJ1NuPb23UGRLiVbpRevxCW5NJp3Qymjf5Q0aGNlhOOgCGEt8HFliNtnnPevCKpJ1Q==
x-ms-office365-filtering-correlation-id: 5a1d7870-4d14-49af-880f-08d67948d8d5
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR10MB2432; 
x-ms-traffictypediagnostic: VI1PR10MB2432:
x-microsoft-antispam-prvs: <VI1PR10MB2432A86D438BAD5265E3359E8A870@VI1PR10MB2432.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 0916FC3A18
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(346002)(366004)(39830400003)(136003)(199004)(189003)(71200400001)(6116002)(44832011)(71190400001)(3846002)(14444005)(6486002)(72206003)(256004)(6436002)(478600001)(81166006)(6506007)(31686004)(386003)(97736004)(106356001)(74482002)(2351001)(8976002)(71446004)(8936002)(2616005)(11346002)(14454004)(5640700003)(486006)(229853002)(81156014)(2906002)(105586002)(476003)(15974865002)(446003)(31696002)(42882007)(6246003)(25786009)(26005)(305945005)(7736002)(53936002)(6512007)(6916009)(102836004)(4326008)(99286004)(76176011)(52116002)(316002)(8676002)(5660300001)(54906003)(186003)(2501003)(66066001)(68736007)(36756003)(81973001)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2432;
	H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vvAVIVJNdyP5jw1LoqSQP60ZUA5//PCF/SshTIPXNUhpAV3a4VgxonPSahohxKLHiXHwEs37DC3+C4Pv3If8xQ8Ef0CQ364Dv1o6ouiX+L75XZmjrywx+yqiISYmn3VNhm2kd+UmWI5hicUDmPmUHcgmOXQTXuBUT/L8O2+KBo3xN72imWGwyd61u37iv89X2T2v1u+/80wU62J7co8aB1mWJHRw9SPlie/lCcpgXA5KGx/5aZvjoT3L9JtwsFt11OdPcq9PDeIHvQKLwJNCrsXymMipAM9i8Z67kkOO7FQSInuXBGdkFUtgdLLu0IpTrh15T9zBnkrZa0E/aHdB3TxGoACBAqehVUd0poqANgA2Sipu1P5xYW6j9AJCCYv7U5LL3zdl79QrL/fkQ6uGkGa0crKRnYZf+SF0aKqPGN0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1d7870-4d14-49af-880f-08d67948d8d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2019 11:18:29.7889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2432
Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
Subject: Re: [PATCH resend^2] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Mon, 14 Jan 2019 23:56:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C769F4998225A438209004CED824A2F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

cGluZyBwaW5nDQoNCk9uIDI5LzEyLzIwMTggMDEuMDYsIFJhc211cyBWaWxsZW1vZXMgd3JvdGU6
DQo+IGltYWdlX3R5cGVzX3dpYy5iYmNsYXNzIGhhcyBhIG1lY2hhbmlzbSBmb3IgZG9pbmcgdmFy
aWFibGUgc3Vic3RpdHV0aW9uDQo+IG9uIC53a3MgZmlsZXMgYnkgc2ltcGx5IGxldHRpbmcgdGhl
IGlucHV0IGZpbGUgYmUgY2FsbGVkDQo+IC53a3MuaW4uIEhvd2V2ZXIsIHRoYXQgZG9lc24ndCBh
bGxvdyB1c2luZyB2YXJpYWJsZXMgaW4gZmlsZXMgaW5jbHVkZWQNCj4gdmlhIHRoZSBpbmNsdWRl
IGRpcmVjdGl2ZS4gVGhpcyBpcyB1bmZvcnR1bmF0ZSwgYmVjYXVzZSBsYWNraW5nIGVpdGhlcg0K
PiB0aGUgYWJpbGl0eSB0byBpbmNsdWRlIG90aGVyIGZpbGVzIG9yIHZhcmlhYmxlIHN1YnN0aXR1
dGlvbiBsZWFkcyB0bw0KPiBmcmFnaWxlIGFuZCBlcnJvci1wcm9uZSBkdXBsaWNhdGlvbiBiZXR3
ZWVuIGtpY2tzdGFydGVyIGZpbGVzIGFuZA0KPiByZWNpcGVzL2NvbmZpZ3VyYXRpb24gZmlsZXMg
dXNlZCBmb3IgdmFyaW91cyBib2FyZHMuDQo+IA0KPiBUaGlzIGFkZHMgKHNvbWV3aGF0IG5haXZl
KSBzdXBwb3J0IGZvciB2YXJpYWJsZSBzdWJzdGl0dXRpb24gaW4gYWxsDQo+IGZpbGVzIHBhcnNl
ZCBieSB3aWMuIFRoZSB1c2VyIHNob3VsZCBhZGQgYWxsIHJlcXVpcmVkIHZhcmlhYmxlcyB0bw0K
PiBXSUNWQVJTIHRvIGdldCB0aGVtIGV4cG9ydGVkIGFwcHJvcHJpYXRlbHkuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxyYXNtdXMudmlsbGVtb2VzQHByZXZhcy5kaz4N
Cj4gLS0tDQo+IHNjcmlwdHMvbGliL3dpYy9rc3BhcnNlci5weSB8IDE3ICsrKysrKysrKysrKysr
KysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL3NjcmlwdHMvbGliL3dpYy9rc3BhcnNlci5weSBiL3NjcmlwdHMvbGliL3dpYy9rc3BhcnNl
ci5weQ0KPiBpbmRleCA3ZTVhOWM1MDkyLi4wOGJhZjc2MTIzIDEwMDY0NA0KPiAtLS0gYS9zY3Jp
cHRzL2xpYi93aWMva3NwYXJzZXIucHkNCj4gKysrIGIvc2NyaXB0cy9saWIvd2ljL2tzcGFyc2Vy
LnB5DQo+IEBAIC0yOCwxNCArMjgsMzAgQEANCj4gIGltcG9ydCBvcw0KPiAgaW1wb3J0IHNobGV4
DQo+ICBpbXBvcnQgbG9nZ2luZw0KPiAraW1wb3J0IHJlDQo+ICANCj4gIGZyb20gYXJncGFyc2Ug
aW1wb3J0IEFyZ3VtZW50UGFyc2VyLCBBcmd1bWVudEVycm9yLCBBcmd1bWVudFR5cGVFcnJvcg0K
PiAgDQo+ICBmcm9tIHdpYy5lbmdpbmUgaW1wb3J0IGZpbmRfY2FubmVkDQo+ICBmcm9tIHdpYy5w
YXJ0aXRpb24gaW1wb3J0IFBhcnRpdGlvbg0KPiArZnJvbSB3aWMubWlzYyBpbXBvcnQgZ2V0X2Jp
dGJha2VfdmFyDQo+ICANCj4gIGxvZ2dlciA9IGxvZ2dpbmcuZ2V0TG9nZ2VyKCd3aWMnKQ0KPiAg
DQo+ICtfX2V4cGFuZF92YXJfcmVnZXhwX18gPSByZS5jb21waWxlKHIiXCR7W157fUBcblx0IDpd
K30iKQ0KPiArDQo+ICtkZWYgZXhwYW5kX2xpbmUobGluZSk6DQo+ICsgICAgd2hpbGUgVHJ1ZToN
Cj4gKyAgICAgICAgbSA9IF9fZXhwYW5kX3Zhcl9yZWdleHBfXy5zZWFyY2gobGluZSkNCj4gKyAg
ICAgICAgaWYgbm90IG06DQo+ICsgICAgICAgICAgICByZXR1cm4gbGluZQ0KPiArICAgICAgICBr
ZXkgPSBtLmdyb3VwKClbMjotMV0NCj4gKyAgICAgICAgdmFsID0gZ2V0X2JpdGJha2VfdmFyKGtl
eSkNCj4gKyAgICAgICAgaWYgdmFsIGlzIE5vbmU6DQo+ICsgICAgICAgICAgICBsb2dnZXIud2Fy
bmluZygiY2Fubm90IGV4cGFuZCB2YXJpYWJsZSAlcyIgJSBrZXkpDQo+ICsgICAgICAgICAgICBy
ZXR1cm4gbGluZQ0KPiArICAgICAgICBsaW5lID0gbGluZVs6bS5zdGFydCgpXSArIHZhbCArIGxp
bmVbbS5lbmQoKTpdDQo+ICsNCj4gIGNsYXNzIEtpY2tTdGFydEVycm9yKEV4Y2VwdGlvbik6DQo+
ICAgICAgIiIiQ3VzdG9tIGV4Y2VwdGlvbi4iIiINCj4gICAgICBwYXNzDQo+IEBAIC0xOTAsNiAr
MjA2LDcgQEAgY2xhc3MgS2lja1N0YXJ0KCk6DQo+ICAgICAgICAgICAgICAgICAgbGluZSA9IGxp
bmUuc3RyaXAoKQ0KPiAgICAgICAgICAgICAgICAgIGxpbmVubyArPSAxDQo+ICAgICAgICAgICAg
ICAgICAgaWYgbGluZSBhbmQgbGluZVswXSAhPSAnIyc6DQo+ICsgICAgICAgICAgICAgICAgICAg
IGxpbmUgPSBleHBhbmRfbGluZShsaW5lKQ0KPiAgICAgICAgICAgICAgICAgICAgICB0cnk6DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaW5lX2FyZ3MgPSBzaGxleC5zcGxpdChsaW5lKQ0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgcGFyc2VkID0gcGFyc2VyLnBhcnNlX2FyZ3MobGlu
ZV9hcmdzKQ0KPiANCg0KDQotLSANClJhc211cyBWaWxsZW1vZXMNClNvZnR3YXJlIERldmVsb3Bl
cg0KUHJldmFzIEEvUw0KSGVkZWFnZXIgMw0KREstODIwMCBBYXJodXMgTg0KKzQ1IDUxMjEwMjc0
DQpyYXNtdXMudmlsbGVtb2VzQHByZXZhcy5kaw0Kd3d3LnByZXZhcy5kaw0K

