Return-Path: <laurent.bonnans@here.com>
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80131.outbound.protection.outlook.com [40.107.8.131])
	by mail.openembedded.org (Postfix) with ESMTP id A8EB66B06C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 08:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=lM/W2v5EH0Wl7qWlKu6RtpidjNYsomPCO6tOFD28SQ7soEzLSty/3Z+mF7r7mhBc6uuCW/GpLye9wllONygQ5uwOCQKEUMWNIb8nlle8+BbHcjjpX7ttZATZW/aeVvCKP4hwe31f1dE6+t2FILqIKSYdev7BQjrnoQYXxbcmb3K0SF2uVirELj4cnY+KaMnw9Ajr8H+goyTMDS1g7sm/jwllU/DZIIRXk7Gft9fpwxAYdEZrwF/1qomjDF19urug7S0NSR7L5htCfV9idVwQ8N/kgC8RRg7+tNedWvjTp2TikJQvnvMz74r9k3HtZPOWNfIXRyq9OoCYDdNjIWOCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GtY6AmhmWyT68otnGpGYVW6/PqUg+/UANRhGw4XLxiY=;
	b=a8JwAX/j03SkzzO4TMhcP/Yd/7TtzsK8RUazDgxu8NxnRkyL4x01yhj3Vml9MEdWPk9hB0rPbTD8QpL6LwvALgISo/D10GQ+u+8v1IA6N4Qnpxi4YFO5D9z9MG6koN2cdh9r53V5F0gXOfMltig7mTBxuqoANhGT5nJ1rrCXNUilLQ0xKFqHczaoBAUZkbKIEMbnlllknLDXMkS658VDF0zcBCDlNzwM6f7SgF7aJqBIHvFQ65sERg+hA7cQP5UeJdwJ5NWDK88eP19Hu/MAlGeo86h4LZwTWJdkKhLC/lIGCBu2XA3MtVl4qmJeN4LMOtQvyW8yZ2iOfImL6PpDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=here.com; dmarc=pass action=none header.from=here.com;
	dkim=pass header.d=here.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=here.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GtY6AmhmWyT68otnGpGYVW6/PqUg+/UANRhGw4XLxiY=;
	b=orfwQ9AKkIf6nUVn2u0NT8K8i1e3PX2VYif+TNd+5t5Fxq8Xyolv1G+WF+gWLWlQlSwJCe7I0YJxAbTzDWbFwdze6jvO3G0yglMvF2FNvjKFf5BdHd4Vxoee/GplMoYXVKckrpcmK93O0IO40wu3A09bkhFh/8qkAkvIigxVOYM=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
	AM5PR04MB3139.eurprd04.prod.outlook.com (10.167.171.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2284.20; Wed, 25 Sep 2019 08:49:36 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
	([fe80::5dd3:ddc9:411a:db41]) by
	AM5PR04MB3299.eurprd04.prod.outlook.com
	([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2305.013;
	Wed, 25 Sep 2019 08:49:36 +0000
From: "Bonnans, Laurent" <laurent.bonnans@here.com>
To: akuster808 <akuster808@gmail.com>, "Bedel, Alban" <alban.bedel@aerq.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [warrior][PATCH] kernel-uboot: compress arm64 kernels
Thread-Index: AQHVR6defzhnBU0AEUmRfvXMV9SCuKcZ6DmAgCDaYICAARz8gIAAjWmA
Date: Wed, 25 Sep 2019 08:49:36 +0000
Message-ID: <7fe69c8b-abc8-9b97-753e-da531152eadd@here.com>
References: <20190731135317.20174-1-alban.bedel@aerq.com>
	<2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
	<6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
	<ee76450e-80e2-7527-7296-df2e6cc83576@gmail.com>
In-Reply-To: <ee76450e-80e2-7527-7296-df2e6cc83576@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurent.bonnans@here.com; 
x-originating-ip: [131.228.216.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bad147b0-a55a-4e9f-544d-08d741954b36
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:AM5PR04MB3139; 
x-ms-traffictypediagnostic: AM5PR04MB3139:
x-microsoft-antispam-prvs: <AM5PR04MB31395427D739A80202117CD585870@AM5PR04MB3139.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(189003)(199004)(66946007)(305945005)(8676002)(76176011)(66446008)(486006)(64756008)(6512007)(66476007)(6486002)(14454004)(71190400001)(5660300002)(8936002)(14444005)(3846002)(81166006)(81156014)(2906002)(86362001)(7736002)(256004)(6246003)(6436002)(36756003)(71200400001)(229853002)(6116002)(186003)(2616005)(53546011)(66556008)(316002)(31686004)(478600001)(110136005)(66066001)(476003)(102836004)(99286004)(2501003)(31696002)(6506007)(26005)(446003)(91956017)(25786009)(11346002)(76116006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR04MB3139;
	H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: here.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H0YmxpOfucsxEn398sn5+tibPprf9MoC9eiTsm2nTDZYySzANqNzUhA9wjE00rDzxGeR8oggjPDjqqkB4lyQw7R2Wjqvw2u102j7lMnZgPoKVbFfmrthn6Nzq4J6QdLN3r9lCtTs7xEgmiKuFzYRejdJuI5vzbS/9A95mJt0ggRy2twgT0ecU+cwODCNQs2gxEzIEaTb3KKt2DWQ8kpB9hP32zl5IKd6I7P2JHxG8VhRMO8atvSsoov7/lxsQhsLSt4Y7YV9SIQeG/bHyf7Y0LTY7eMG9JNLxILs5J1NV3JDmt/WY/zcmljfm82xPQB0epQa6uP2fDj2YpzhBlUy3/OHk+aNIxoyGz8QqauHm86KJVHgTdZfeDHlxcADxe26AShDKxjMtBi4ht4jMxkrBoiQnENIB1VOP3PyrgzcTa4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: here.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad147b0-a55a-4e9f-544d-08d741954b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 08:49:36.3059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d4034cd-7225-4f72-b853-91feaea64919
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZ74VJeFH8OpBO24ugYrOe8xm2oT0aQ4CFt//5i/+Jo9whLjvIMpTPCM7XVIV5ijoOKeNC7ljqN+8fs+UEn2SEQAloq4NUVfZ2d55tY/TYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3139
Subject: Re: [warrior][PATCH] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Wed, 25 Sep 2019 08:49:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6830BEA18299694ABC67A81A66D8B525@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gOS8yNS8xOSAyOjIzIEFNLCBha3VzdGVyODA4IHdyb3RlOg0KDQo+IE9uIDkvMjQvMTkgMTI6
MjMgQU0sIEJlZGVsLCBBbGJhbiB3cm90ZToNCj4+IE9uIFR1ZSwgMjAxOS0wOS0wMyBhdCAwOTo0
MSArMDAwMCwgQmVkZWwsIEFsYmFuIHdyb3RlOg0KPj4+IE9uIFdlZCwgMjAxOS0wNy0zMSBhdCAx
Mzo1MyArMDAwMCwgQmVkZWwsIEFsYmFuIHdyb3RlOg0KPj4+PiBBQXJjaDY0IGltYWdlcyBhcmUg
bm90IHNlbGYtZGVjb21wcmVzc2luZywgdGh1cyB1c3VhbGx5IG11Y2gNCj4+Pj4gbGFyZ2VyLg0K
Pj4+PiBCb290IHRpbWVzIGNhbiBiZSByZWR1Y2VkIGJ5IGNvbXByZXNzaW5nIHRoZW0gaW4gRklU
IGFuZCB1SW1hZ2VzLg0KPj4+Pg0KPj4+PiBUaGlzIGNvbW1pdCBpcyBhIGJhY2twb3J0IG9mIGNv
bW1pdCBhNzI1ZDE4OGI1IChrZXJuZWwtdWJvb3Q6DQo+Pj4+IGNvbXByZXNzDQo+Pj4+IGFybTY0
IGtlcm5lbHMpIGFuZCBjb21taXQgNjBiYzdlMTgwZSAoa2VybmVsLXVib290OiByZW1vdmUgdXNl
bGVzcw0KPj4+PiBzcGVjaWFsIGNhc2luZyBvZiBhcm02NCBJbWFnZSkgZnJvbSBtYXN0ZXIuIEJv
dGggY29tbWl0IHdlcmUgbWVsdGVkDQo+Pj4+IGludG8gb25lIHRvIGF2b2lkIHNvbWUgdXNlbGVz
cyBjaHVybi4NCj4+PiBXYXMgdGhpcyBwYXRjaCBvdmVybG9va2VkLCBvciBpcyB0aGVyZSBhIHJl
YXNvbiBpdCBpcyBub3QgY29uc2lkZXJlZA0KPj4+IGluDQo+Pj4gdGhlIG5leHQgcm91bmQgb2Yg
dXBkYXRlIGZvciB3YXJyaW9yPyBXaXRob3V0IHRoaXMgcGF0Y2gga2VybmVsDQo+Pj4gaW1hZ2Vz
DQo+Pj4gYXJlIHRvbyBsYXJnZSB0byBmaXQgaW4gdGhlIGZsYXNoIG9mIHRoZSBzeXN0ZW0gSSdt
IHVzaW5nLg0KPj4+IEZ1cnRoZXJtb3JlDQo+Pj4gaXQgaXMgbm90IHRyaXZpYWwgdG8gZml4IHRo
aXMgaW4gbXkgb3duIGxheWVyLg0KPj4gUGxlYXNlLCBJIHJlYWxseSBsaWtlIHRvIGdldCBhbiBh
bnN3ZXIgaGVyZS4gSSdtIGZpbmUgaWYgdGhlcmUgaXMgYQ0KPj4gcmVhc29uIHdoeSB0aGlzIHBh
dGNoIGlzIG5vdCBjb25zaWRlcmVkIGZvciB3YXJyaW9yLCBidXQganVzdCBnZXR0aW5nDQo+PiBp
Z25vcmVkIGlzIHZlcnkgZnJ1c3RyYXRpbmcuDQo+IFRoaXMgYXBwZWFycyB0byBiZSBhIHBlcmZv
cm1hbmNlIGVuaGFuY2VtZW50IHdoaWNoIGRvZXMgbm90IGZhbGwgaW50bw0KPiB0aGUgY3JpdGVy
aWEgZm9yIGJhY2sgcG9ydGluZyB0byBhIHN0YWJsZSBicmFuY2guDQo+DQo+IC0gYXJtaW4NCg0K
SnVzdCB0byBicmluZyBhbGwgdGhlIGVsZW1lbnRzIG9uIHRoZSB0YWJsZToNCg0KSXQncyBwb3Nz
aWJsZSB0byBhcmd1ZSB0aGF0IGl0IGlzIG1vcmUgb2YgYSBmaXggZm9yIGEgcGVyZm9ybWFuY2Ug
DQpyZWdyZXNzaW9uLCBhcyB0aGUgc3ViLW9wdGltYWwNCmFwcHJvYWNoIHdhcyBpbnRyb2R1Y2Vk
IGluIDFhYTQxN2RmNjA0ZDI2MjdjNTYyMzJhN2EyYzM5NmM2YjA4NWQ3NGIgYW5kIA0KdGhlIHBh
dGNoDQppbiBxdWVzdGlvbiBpcyBlcXVpdmFsZW50IHRvIGEgcmV2ZXJ0Lg0KDQpGb3IgZXhhbXBs
ZSwgdGhlIHB5cm8gYnJhbmNoIGRvZXMgbm90IHNlZW0gdG8gaGF2ZSB0aGUgaXNzdWUuDQoNCkkg
ZG9uJ3Qga25vdyBpZiBpdCBtYWtlcyBhIGRpZmZlcmVuY2UgaW4gdGVybXMgb2YgY3JpdGVyaWEg
Zm9yIGEgDQpiYWNrcG9ydCBidXQgSSBhZ3JlZSB0aGF0IHRoZQ0KcHJvYmxlbSBpcyBpbmRlZWQg
bWFkZSB3b3JzZSBiZWNhdXNlIGl0IGlzIHF1aXRlIGhhcmQgdG8gb3ZlcnJpZGUgaW4gDQp1c2Vy
IGxheWVycy4NCg0KDQpMYXVyZW50DQoNCg==

