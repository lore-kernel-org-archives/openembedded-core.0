Return-Path: <rasmus.villemoes@prevas.dk>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60132.outbound.protection.outlook.com [40.107.6.132])
	by mail.openembedded.org (Postfix) with ESMTP id D22807FC56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 15:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=DleUH4MegEeK1kebjf0xIVQUxEemRLnpKSm0sVt2FyWNGoo01jU0r9fTIfYbelU5WhdjSKq0Pewx0grLk7m8JKJaldAh9ZnVytPvdJKIwTF4g2v9ngA9bduNdbfZU+tKxrXLxs7NF3JYxmTKrC+0DZw3+hn578T41OElkdpvJF27uUCAJM+WnkbgSL5POV5RGxGx6uz5G5lgWwgDen7Pc4IHURT3B8MOWT4zMAn6Exn/fVtr5cFrchwxFr89jlfVk7mghaRjANxibJ3A1VidoqmWzoVPvQF7kFsYc351QBIRwdFyYsZnDJZD5kl9IRq9WpfnPI3zu7anpOBCKJy5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qylIfKHV/HnCLgSyNVVScbcYP5pWfwSsURBt8cd3GWs=;
	b=aW6HLBjrZPlm9WbYGO6x0i1LnXGcUPULeZR5JHbW7JOOO1MI6XH/U7PghGn4Spvlj5wrksV5MZPz4dYDrtDPQB6EjM2z5EfzcRwiKFQ0tA43j+PwVdBQFpscMtdcyM1WX4Ouc3XAeT4uBWhbtmyjcc6b+4Bm8PUKODD1aUw5Cd1oZ892LkWuWeg0ByYLHqe25pZX4Ct1SYXAeqoKmph535HG+YM2h6VInC7o3F+mb6J2DMOOCNvMZwpRtfwWH5kYAYeY9FMWSdyW1Qv34+hlgQr/LEubK47wmgkFiBKNpwkVNKQMtOIO3i0W6LyRRgvR0cRkLQR/+t8g1GFWP2B9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk; 
	dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qylIfKHV/HnCLgSyNVVScbcYP5pWfwSsURBt8cd3GWs=;
	b=lJou6kJlFirjv+1bmxHO7Dgd/8RwxYawCAe+ipARzTktDzE94KWw9r43i1CTEJinv5dw2dgoGcFMF0jV1O2E7XzWTBHWdSdSJ7frSPjVQur8XDGdtIDZAHEQAtViEnv25/GdgPyo+chRBzTcDXNfGh8sSnDAnnhF1TlNAKlT/1o=
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (20.178.126.85) by
	VI1PR10MB3310.EURPRD10.PROD.OUTLOOK.COM (52.133.246.202) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.19; Mon, 20 Jan 2020 15:53:02 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d]) by
	VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d%6]) with mapi id 15.20.2644.026;
	Mon, 20 Jan 2020 15:53:02 +0000
Received: from [172.16.11.50] (81.216.59.226) by
	AM6PR08CA0002.eurprd08.prod.outlook.com (2603:10a6:20b:b2::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18
	via Frontend Transport; Mon, 20 Jan 2020 15:53:01 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [PATCH v2] glibc: don't ignore global LDFLAGS settings
Thread-Index: AQHVz3M5G9BLSb/lB0upqgzk1nY10KfzsY+AgAAC6oA=
Date: Mon, 20 Jan 2020 15:53:01 +0000
Message-ID: <d7c14f57-4168-b83e-6810-d9aa657f9e26@prevas.dk>
References: <20200120072801.16603-1-rasmus.villemoes@prevas.dk>
	<20200120092258.32254-1-rasmus.villemoes@prevas.dk>
	<CAMKF1so2RcV_qzS3if53Z-xhAchan1piCUrAaUn2Gb-3M3VwYA@mail.gmail.com>
In-Reply-To: <CAMKF1so2RcV_qzS3if53Z-xhAchan1piCUrAaUn2Gb-3M3VwYA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR08CA0002.eurprd08.prod.outlook.com
	(2603:10a6:20b:b2::14) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e1::21)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=rasmus.villemoes@prevas.dk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 472ba44a-c960-420e-2b0e-08d79dc0d45f
x-ms-traffictypediagnostic: VI1PR10MB3310:
x-microsoft-antispam-prvs: <VI1PR10MB33103AC888B093D567B9789E93320@VI1PR10MB3310.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(396003)(376002)(39850400004)(189003)(199004)(66446008)(26005)(8936002)(64756008)(66556008)(8676002)(81156014)(86362001)(81166006)(66476007)(8976002)(31696002)(44832011)(66946007)(956004)(2616005)(4744005)(186003)(316002)(16576012)(54906003)(16526019)(478600001)(52116002)(5660300002)(4326008)(36756003)(31686004)(6486002)(71200400001)(6916009)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB3310;
	H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.dk does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TpJHaLJTtjU1neBBRNqQEuDpTGa/sw/sOUGnJgNVcGKuV2z7n/o1EtTrzdJ2pKzNArUX5JtR/eaGATbHzk3XvEeQVzXPMtKiclTOwDjxtzayUXuCe88piwlJFyvorU7yko6lAWZLD2YLzgnVZZ6usBU5Fawf74aKZu3BhZRLpimbBhc/3GScvj+BBlN3PjBx+uCjb9XZ/x5Daxhoo4w34T74RXrAuRsYgh3WRov2c55XQpS4KnGON8jepUyM0jTt5T4bhq1Kfqcndc+rtDnIya/gLEeDyjUXj0EpjzxJXId2bGGZlWmAGQgEM+7qZjb7BdQdm8nlb4dNY1V01QBeXjJrJbh744m847voWHjmv/bhY4zP1MXO/czArTK7S7pOtSCg9EPR8hMeePIhvfkwvUupg2DlY9cFQ6S5pt6vrU5ECGKZ2UTnpcnmsl7c2EV+
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 472ba44a-c960-420e-2b0e-08d79dc0d45f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 15:53:02.0281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzjvHlkdB+SoWu7oDdxZFyiUxQ0lDMsLghGE+5pOF/zdD6qnIr8EqSF7ChMuZWHdR2uqZQOU3Bp5NhL2Be6FC9YZXRfyKWrZL8oEYyQWH0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3310
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glibc: don't ignore global LDFLAGS settings
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
X-List-Received-Date: Mon, 20 Jan 2020 15:53:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D920BA90944C134195A1AB46C2D70556@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

T24gMjAvMDEvMjAyMCAxNi40MiwgS2hlbSBSYWogd3JvdGU6DQo+IHRoaXMgcGF0Y2ggaXMgb2sg
YnV0IEkgaGF2ZSByZXNlcnZhdGlvbnMgc2luY2UgICs9IG5vdyBtZWFucyBnbG9iYWwNCj4gbGRm
bGFncyB3aWxsIGJlIGFwcGxpZWQNCg0KSW5kZWVkLCB0aGF0J3MgaGFsZiB0aGUgcG9pbnQgb2Yg
dGhlIHBhdGNoLg0KDQo+IHNvIGl0IHdvdWxkIG5lZWQgc29tZSB0ZXN0aW5nIHRvIGVuc3VyZSBp
dCB3b3JrcyB3ZWxsLg0KDQpZZXMsIGJ1dCBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYW55IHdheSB0
byBmaWd1cmUgb3V0IGlmIGl0IGJyZWFrcw0Kc29tZXRoaW5nIG90aGVyIHRoYW4gdHJ5aW5nIGl0
LiBJZiBpdCBkb2VzLCBJIGNhbiBjZXJ0YWlubHkgbWFrZSBpdCBqdXN0DQpMREZMQUdTID0gIi4u
LiIgb3V0c2lkZSBkb19jb21waWxlLCBhbmQgdGhlbiBJJ2xsIGhhdmUgdG8gLmJiYXBwZW5kIG9y
DQpfcG4tZ2xpYmNfYXBwZW5kIG15IGN1c3RvbSBMREZMQUdTLCB3aGljaCBpcyBvayBmb3IgYSBz
aW5nbGUgcmF0aGVyDQpzcGVjaWFsIHJlY2lwZSwgYnV0IHdvdWxkIGJlIGEgaGFzc2xlIHRvIG1h
aW50YWluIGlmIHRoaXMgd2FzIGEgY29tbW9uDQp0aGluZy4NCg0KUmFzbXVzDQo=

