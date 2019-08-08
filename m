Return-Path: <jacob.kroon@mikrodidakt.se>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130109.outbound.protection.outlook.com [40.107.13.109])
	by mail.openembedded.org (Postfix) with ESMTP id 5702C7F290
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 14:03:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=cnpu8EZcivP+QTHK8ULxyLUhAW/zw5uUhw+1bYuFAlKbvACzFuws2CVfFdS4VS5bH6rjcchLXLf6pQNPpKV0Nt+0ptu8RQqiTfA1CHJ9byToshTMKLJZ0chIvmsGlmWc3Rc2IYQeKklYxVlA2tVtuZ2+dGg62LTtaxN1l6k0Cp9aGN/9nE6XHrmu3MH2kGMGPxm+YzgKZYNavB8sX7BvKGTuMRfFjqb6Cz3XevCU3SF91MsFH0jI9OqEzKDxjDoOBgn13Cy5s+QVVKAJ3/XfapsGlIYAmV1pu4OPQAnVt9/igV7NUP9Qd1nwbeNxjbrMg/EAlUm8fPQ+7BW82wCNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6eIjmjULJ9ZBJe3UCnyN7VaSHCsJ1Pib1trCsJeViH8=;
	b=Rd04jQ54p4XYlPp+IPy2JPASi8ppA0pWQnq6CUfJvfDoEkgrfs24LiZOy4VyMPIWd/hldgHzoeQpcI6hzO87+3f2BS03naumf+nVdRx6+5EnLMqlnTUh3Rsuy6EfKApBGI7mNyiEcoaK6k/NShdkKlF0xXGPLFj6gYhs201q+zchzHWY+bLhk/F6TC74mNMJmBac/DNNrg190RcLYE0iomZF8peISIgAPCJWeacWv3i6UZA91uUC2r5MUUqTYWXveuBOIMbxCk03qM25dM3ZIQ76rPG/oIk8hN3dgoa5Y3o0K32ARnYb9cUlb+uLZqLDR/J37BbKHvon3JNHTzPuQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=mikrodidakt.se; dmarc=pass action=none
	header.from=mikrodidakt.se; dkim=pass header.d=mikrodidakt.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ugglorna.onmicrosoft.com; s=selector1-ugglorna-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6eIjmjULJ9ZBJe3UCnyN7VaSHCsJ1Pib1trCsJeViH8=;
	b=g/jxr06z+ALQH45lrFBa4SUA2mbD4SYbmxVC4boAOO67AvErI9NTbJqh3lnZ6n1aTIWybq+pJSJY6S8Pcycj2ZoXcQwWN57V9xS3U1rGG1nViMOdSKqcsFflwxr8Yv9hcw+z6OeCd/Due3gXmoy6rVWdV5U3WbQZQaxWFKfzRNw=
Received: from AM6PR08MB3205.eurprd08.prod.outlook.com (52.135.166.20) by
	AM6PR08MB3463.eurprd08.prod.outlook.com (20.177.112.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Thu, 8 Aug 2019 14:03:30 +0000
Received: from AM6PR08MB3205.eurprd08.prod.outlook.com
	([fe80::20a0:fa68:2f63:5a7a]) by
	AM6PR08MB3205.eurprd08.prod.outlook.com
	([fe80::20a0:fa68:2f63:5a7a%7]) with mapi id 15.20.2136.022;
	Thu, 8 Aug 2019 14:03:30 +0000
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: "luca.boccassi@gmail.com" <luca.boccassi@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] python3-pygobject: move python3-setuptools
	from RDEPENDS to DEPENDS
Thread-Index: AQHVTfIOyfgzPrNoTE2ZMM13A6AV1Q==
Date: Thu, 8 Aug 2019 14:03:29 +0000
Message-ID: <81efba6d-0174-370f-778c-c4c6fa434afc@mikrodidakt.se>
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
	<20190808135858.4609-1-luca.boccassi@gmail.com>
In-Reply-To: <20190808135858.4609-1-luca.boccassi@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0202CA0006.eurprd02.prod.outlook.com
	(2603:10a6:200:89::16) To AM6PR08MB3205.eurprd08.prod.outlook.com
	(2603:10a6:209:4a::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jacob.kroon@mikrodidakt.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.185.29.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d89b1b7b-a6f0-4788-53c1-08d71c093109
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM6PR08MB3463; 
x-ms-traffictypediagnostic: AM6PR08MB3463:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR08MB346344966A65840EAA8167619BD70@AM6PR08MB3463.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39830400003)(346002)(396003)(376002)(189003)(199004)(186003)(36756003)(81166006)(99286004)(66556008)(66476007)(66946007)(64756008)(110136005)(31686004)(66446008)(6246003)(53936002)(6486002)(25786009)(508600001)(6436002)(229853002)(71190400001)(6512007)(256004)(6306002)(8936002)(3846002)(6116002)(305945005)(2906002)(81156014)(8676002)(71200400001)(7736002)(316002)(66066001)(446003)(14454004)(2616005)(11346002)(486006)(2501003)(44832011)(476003)(966005)(86362001)(386003)(6506007)(102836004)(52116002)(26005)(53546011)(76176011)(31696002)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3463;
	H:AM6PR08MB3205.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mikrodidakt.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z5spvVzVaTeKSVqekytl5bZ20kmusNrbN8bf6uYtz+YSWQ7YC0ilSJibo9UdcsxzNeCmpjg4RYgncvWgwqPhYq0ZWXf5mAAi3Hwiegjdwd0k1zdJYubBI8rh54bwCUM2TodopqKbPFYJSbsJ3MmXu5ap6+YsPXjP2pIoN4zm1MKEBBFCsfodF40I+1N2xTDpJ11abONjPEdejylwRufIxGMf0E0XRIte7YMiSEuOjgHo3L4rxK/2d24lrR2FB+nQzyin71YbHuMkJM5rkRvi6Ud4qQuvhBF1J8yXd30ucrB7F38hOA7Dq0DSBgtU6AbkgK2rsoqAccDfwHkFkLbv1aT4i88rSzg448+6Ay8Z+8ZJNPKLlvI+CbUMj2K3+M8tOGrLxUdo2hmNknnczR+tCw2grGNqZeUM1fWVDPDY7HE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: mikrodidakt.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d89b1b7b-a6f0-4788-53c1-08d71c093109
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 14:03:30.0102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d8b8e37-ad11-4b86-9071-4e3fa1b980be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacob.kroon@mikrodidakt.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3463
Subject: Re: [PATCH v3] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Thu, 08 Aug 2019 14:03:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E07213D0C32D44393E3A6400371589A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgTHVjYSwNCg0KT24gOC84LzE5IDM6NTggUE0sIGx1Y2EuYm9jY2Fzc2lAZ21haWwuY29tIHdy
b3RlOg0KPiBGcm9tOiBMdWNhIEJvY2Nhc3NpIDxsdWNhLmJvY2Nhc3NpQG1pY3Jvc29mdC5jb20+
DQo+DQo+IHB5dGhvbjMtc2V0dXB0b29scyBpcyBuZWNlc3NhcnkgdG8gYnVpbGQgcHlnb2JqZWN0
IGJ1dCBub3QgdG8gcnVuIGl0LCBhcw0KPiBhbHNvIGRvY3VtZW50ZWQgYnkgdGhlIHVwc3RyZWFt
IHBhY2thZ2luZyBndWlkZToNCj4NCj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL3B5
Z29iamVjdC9ibG9iL21hc3Rlci9kb2NzL3BhY2thZ2luZ2d1aWRlLnJzdA0KPg0KPiBNb3ZlIGl0
IHRvIERFUEVORFMgdG8gc2hyaW5rIHRoZSBydW50aW1lIGRlcGVuZGVuY3kgY2hhaW4sIGFzIHNl
dHVwdG9vbHMNCj4gaW5jbHVkZXMgc2NyaXB0cyB0byBkb3dubG9hZCBvdGhlciBwYWNrYWdlcywg
d2hpY2ggbWlnaHQgbm90IGJlIGRlc2lyZWQgb24NCj4gYSBtaW5pbWFsIGltYWdlLg0KPg0KDQpU
aGlzIGNvbW1taXQgbWVzc2FnZSBzaG91bGQgYmUgcmVwaHJhc2VkIG5vdy4NCi9KYWNvYg0KDQo+
IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQm9jY2Fzc2kgPGx1Y2EuYm9jY2Fzc2lAbWljcm9zb2Z0LmNv
bT4NCj4gLS0tDQo+IHYyOiB1c2UgLW5hdGl2ZSBzdWZmaXggYXMgcmVxdWVzdGVkIGR1cmluZyB0
aGUgY29kZSByZXZpZXcNCj4gdjM6IGRvIG5vdCBhZGQgc2V0dXB0b29scyB0byBERVBFTkRTIC0g
aXQgaXMgb3B0aW9uYWwgYW5kIGl0IGJ1aWxkcyB3aXRob3V0IGl0DQo+DQo+ICAgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjMyLjIuYmIgfCAyIC0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuMzIuMi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy4zMi4yLmJiDQo+
IGluZGV4IDA1Njg4YmU2MDMuLjQ1M2ZkYWMyYzggMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy4zMi4yLmJiDQo+ICsrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy4zMi4yLmJiDQo+
IEBAIC0yNyw3ICsyNyw1IEBAIFBBQ0tBR0VDT05GSUcgPz89ICIke0BiYi51dGlscy5jb250YWlu
c19hbnkoJ0RJU1RST19GRUFUVVJFUycsIFsgJ2RpcmVjdGZiJywgJ3dhDQo+ICAgIyB3ZSBkb24n
dCBsaW5rIGFnYWluc3QgcHl0aG9uMy1weWNhaXJvIC0+IFJERVBFTkRTDQo+ICAgUEFDS0FHRUNP
TkZJR1tjYWlyb10gPSAiLURweWNhaXJvPXRydWUsLURweWNhaXJvPWZhbHNlLCBjYWlybyBweXRo
b24zLXB5Y2Fpcm8sIHB5dGhvbjMtcHljYWlybyINCj4NCj4gLVJERVBFTkRTXyR7UE59ICs9ICJw
eXRob24zLXNldHVwdG9vbHMiDQo+IC0NCj4gICBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSINCj4g
ICBQQUNLQUdFQ09ORklHX2NsYXNzLW5hdGl2ZSA9ICIiDQo+DQoNCg0KW21pa3JvZGlkYWt0XQ0K
SmFjb2IgS3Jvb24g4oCiICs0NiA0NjMyNTA0MA0KDQptaWtyb2RpZGFrdC5zZSDigKIgU2tpZmZl
cnbDpGdlbiA0OCwgU0UtMjI0IDc4IExVTkQsIFN3ZWRlbg0KDQpDb25zdWx0YW5zIHNpbmNlIDE5
ODAg4oCiIFNXLCBIVywgRW1iZWRkZWQgU3lzdGVtcywgTGludXgNCg0KDQo=

