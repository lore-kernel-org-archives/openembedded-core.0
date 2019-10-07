Return-Path: <Alexandre.Bard@netmodule.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150125.outbound.protection.outlook.com [40.107.15.125])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFC474769
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 12:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=V3r/Sj3PtTlp/+kvOVJdjDk+uJLKOTCjiyFvwsCRr6Yqj+JFCwKqtqifvwYdr1dQbqCBfEMa58JRy/4rCV6DfDaJ6k3xAMSa4M//R0XTh8KsE+5uzHEGFA/eWDBfIRZ+k/0XL6Sfv1QmCvq0VIcfvvYIr0vTjr2lE4CMzOtW7Z/eywF11yzCC/eZSDYahz/ukDUnlvE9zhVhJTOx7UGWwfzI+9VGGLAIReNRieR2r3ctu3hm2R5ug57t7sO+6f8Z6svqeAU/e1nYHLlnotD+lHOVax6xki2R6sWk7Mpjpx7ejYfDqEFM5bi47y/XSSGfOug3GAcXBFsdbdIGRPWLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ue7F9+lvMq+fnJKwyjJ1OFdUR9a728TJ3JSQDqDZD/A=;
	b=K/mKC5HiW/pGAEOe9G0n+9N5Cr5Ppsw35OYsEHQ9z9ixiF1uOj0yr9tbdzfmZ062gLVjaqfNv258LEV1IA8DohzefjHfqTMya9zK0/oCSabizUty4QXls6alnf0YBx5fSDj84melb4WFEHlL0/403eAk1B4VJZAeqCxvvEENHdYJYP3NcvdXQhre34JG/Ue01rCY3Zs7bYy+j6+oJfKQp+H90SxOV4TLivCXkH3/IDi4bPCQwHnz9fcbGrH6BtV1OEbnhdcMRNY5vVK/L6yMRSSc5xL0dOwmuw1J0Hx0ckuODmDGl3+nUZswrLPeW6ngYPDV64EmtGtOFGVJn7wr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=netmodule.com; dmarc=pass action=none
	header.from=netmodule.com; dkim=pass header.d=netmodule.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netmodule.onmicrosoft.com; s=selector2-netmodule-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ue7F9+lvMq+fnJKwyjJ1OFdUR9a728TJ3JSQDqDZD/A=;
	b=g0kfOGlNEBNs9ZSRiIS/ZfiKm6utf5zc7t1hzAhEgTsA3XdctD2mKdBV5oNqVIH1aHtoiqPihAAJSC3o2SyjKhaN2G1G80XWA71BBHckd2d0eLaVhGlXt6Q+8UqrbByJUBW1UugH0l6rYTikoGMEMYjF9VZYWethkkizvyP/IXg=
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com (20.178.15.83) by
	VI1PR06MB3965.eurprd06.prod.outlook.com (20.176.6.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2327.23; Mon, 7 Oct 2019 12:42:01 +0000
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::8c56:adfb:a379:4cce]) by
	VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::8c56:adfb:a379:4cce%6]) with mapi id 15.20.2327.023;
	Mon, 7 Oct 2019 12:42:01 +0000
From: Alexandre Bard <Alexandre.Bard@netmodule.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [warrior][PATCH] systemd: Expose resolv-conf
	alternative only when resolved is built
Thread-Index: AQHVeofweb8k+AGR0U6T76cEDa6uUqdN4wmAgAFBIAA=
Date: Mon, 7 Oct 2019 12:42:01 +0000
Message-ID: <029fd220-be1d-ae90-5c3c-418aa49af10f@netmodule.com>
References: <20191004074659.7538-1-alexandre.bard@netmodule.com>
	<5a60e7e9-3254-ca2a-4c96-43631d41fa6d@gmail.com>
In-Reply-To: <5a60e7e9-3254-ca2a-4c96-43631d41fa6d@gmail.com>
Accept-Language: fr-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0110.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:19::26) To VI1PR06MB5261.eurprd06.prod.outlook.com
	(2603:10a6:803:bd::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alexandre.Bard@netmodule.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.130.140.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 087a8e2f-f02a-4756-fb10-08d74b23c009
x-ms-traffictypediagnostic: VI1PR06MB3965:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR06MB39650BD0EE0CED94C2E78726879B0@VI1PR06MB3965.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(396003)(39830400003)(366004)(136003)(376002)(346002)(189003)(199004)(5660300002)(36756003)(305945005)(6506007)(53546011)(386003)(76176011)(99286004)(31686004)(256004)(26005)(14444005)(2501003)(52116002)(11346002)(2616005)(476003)(25786009)(186003)(446003)(6246003)(7736002)(6116002)(44832011)(3846002)(2906002)(486006)(102836004)(86362001)(71190400001)(6306002)(508600001)(64756008)(66476007)(14454004)(71200400001)(8676002)(66066001)(6436002)(31696002)(966005)(66946007)(229853002)(81166006)(81156014)(6486002)(110136005)(8936002)(6512007)(66446008)(316002)(66556008)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB3965;
	H:VI1PR06MB5261.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: netmodule.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZtVwaSB7HfsaHVSiew9CwvbbPSX8I4eEW6UUeiITFY1sBPkbCBxw5hplcaJG4c5Ey94eoKdURsJx4MZQ5az+qo4NfLv6DA4T+WqtTgba5slN2v+0n76kOpFj4MYcrkLPzimf0WCIKMSUezLxuZq1N1aeAriVQiFGRk7JDNticBoVoITelYIBLAFyjK72x4awB3O9bOpUVyyWcdwsZPyWyy8MZrvTUVtttdTo6S7JXnjP+7bKy1pLLyhpQgAyOy5uQdiMv4v3kUuOR3Ce0l4re8vfbyr1ZrqlaDiMPfMCQJ6wFLBIWRbyyyEPKU2/aQVBMaSpeo38qinDWCirvZmbq9VONgCiL3MGYmBrF6jqO88hHfT3yemAwTO1KHozFVff0DOI6R1CbzEPaC7AlL2AyU2AmfrFe/AYtrOtPRY7s8gse9MTvxMG8pz48vuZqtaLqlIs+8ChFgtsogSwsqtwPw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: netmodule.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087a8e2f-f02a-4756-fb10-08d74b23c009
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 12:42:01.6261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcdfa962-340b-405e-be0c-5bfcc8a0841e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cAv5sLHrPjFRB45rbDvqO4cIS6DVt+sDjzWq7qch/H9jB4EoK/9lPnkJCTjBV9azblvEEvMQff8pHD2Yl8qZyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB3965
Subject: Re: [warrior][PATCH] systemd: Expose resolv-conf alternative only when resolved is built
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
X-List-Received-Date: Mon, 07 Oct 2019 12:42:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D35B2300E7BD841B66CCE73108B70C5@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64

DQpPbiAwNi4xMC4xOSAxOTozMiwgYWt1c3RlcjgwOCB3cm90ZToNCj4NCj4gT24gMTAvNC8xOSAx
Mjo0NyBBTSwgQWxleGFuZHJlIEJhcmQgd3JvdGU6DQo+PiBXaGVuIHN5c3RlbWQgaXMgYnVpbHQg
d2l0aG91dCBpbnRlcm5hbCByZXNvbHZlciwgaXQgZG9lcyBub3QgbWFrZQ0KPj4gc2Vuc2UgdG8g
ZXhwb3NlIGl0IGFzIGEgcmVzb2x2LWNvbmYgYWx0ZXJuYXRpdmUgYW5kIGNhbiBldmVuIGJyZWFr
DQo+PiBpbWFnZXMgd2hlcmUgdGhpcyBhbHRlcm5hdGl2ZSB3b3VsZCBiZSBjaG9zZW4sIGJlY2F1
c2Ugb2YgYW4NCj4+IGludmFsaWQgc3ltbGluay4NCj4gRG9lcyBNYXN0ZXIgaGF2ZSB0aGlzIGlz
c3VlPw0KPg0KPiAtIGFybWluDQoNClllcyBpdCBkb2VzIGFuZCB0aGUgcGF0Y2ggaXMgYWxyZWFk
eSBhdmFpbGFibGU6IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dp
L3Bva3kvY29tbWl0Lz9pZD1mYjQyN2Y0ZjVjOTBkMTBmODVkZGFkMTYwZTc4MjA5ZWQyYjgxMDBk
DQoNCkFsZXhhbmRyZQ0KDQo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQmFyZCA8YWxleGFu
ZHJlLmJhcmRAbmV0bW9kdWxlLmNvbT4NCj4+IC0tLQ0KPj4gICBtZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWRfMjQxLmJiIHwgMiArLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI0MS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZF8yNDEuYmINCj4+IGluZGV4IGViMzI0MmQ2MjQuLjBhZGQzODRhN2IgMTAwNjQ0DQo+
PiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfMjQxLmJiDQo+PiArKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfMjQxLmJiDQo+PiBAQCAtNjAxLDcg
KzYwMSw3IEBAIHB5dGhvbiBfX2Fub255bW91cygpIHsNCj4+ICAgICAgICAgICBkLnNldFZhcigi
SU5ISUJJVF9VUERBVEVSQ0RfQkJDTEFTUyIsICIxIikNCj4+ICAgfQ0KPj4gICANCj4+IC1BTFRF
Uk5BVElWRV8ke1BOfSA9ICJoYWx0IHJlYm9vdCBzaHV0ZG93biBwb3dlcm9mZiBydW5sZXZlbCBy
ZXNvbHYtY29uZiINCj4+ICtBTFRFUk5BVElWRV8ke1BOfSA9ICJoYWx0IHJlYm9vdCBzaHV0ZG93
biBwb3dlcm9mZiBydW5sZXZlbCAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycs
ICdyZXNvbHZlZCcsICdyZXNvbHYtY29uZicsICcnLCBkKX0iDQo+PiAgIA0KPj4gICBBTFRFUk5B
VElWRV9UQVJHRVRbcmVzb2x2LWNvbmZdID0gIiR7c3lzY29uZmRpcn0vcmVzb2x2LWNvbmYuc3lz
dGVtZCINCj4+ICAgQUxURVJOQVRJVkVfTElOS19OQU1FW3Jlc29sdi1jb25mXSA9ICIke3N5c2Nv
bmZkaXJ9L3Jlc29sdi5jb25mIg0K

