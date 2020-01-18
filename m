Return-Path: <chris.laplante@agilent.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	by mail.openembedded.org (Postfix) with ESMTP id A72F37FC59
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 01:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=BpgnQ+guTca0EVhzfD9xlKotJWsK7YEWtpOBPkusYsiM9tjLkPo1fbByEsn43L7e9fGJ0akCOwmYHjd3hDqrQOBMlLGgoa3Fa7wVw57MyYKSxkODZFOYriXfajweRi6N++khXFZtrvie+f+qQig96ctoj3lpdluVdTOjid7olZOYyeNo+MriPm+VgBjXTCmI0Bwgd09ANAa7QT05/5776CEhXR04pm+U5OzGPwfqXyVTc88mE4vgaJMTZ9e6gOukbkp/pFm2MV52LwUe57o5o6RppRN4LO+TM48rxSWVQJY7Pz/MdtYFtdFsXNHjQ8HJIyBFgoqVPyhUgz4HclbJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y6MCLNOQ9JLrVa/xfMSsGJ7FXzT9UZWUhpf/EQJp0EQ=;
	b=HNO843NPTrW49IFLheSK7EWxwv/GQRl+NjVpEELcphQOno41CqQjnYt2p3os1UXOR0JiZ/MuK5EnfJJ6keOa4UPWqBVpowAVnP2WBttnvBYOPKOwjPFWBt6PqpMtNlHdCBaHsChAMjRNHMpG2Bc3xWQrI9F4lPmw0l0iddHKSJbRAYMtIo6LLJsPsQ3zKNrB0t9LAC9RpOYwGI5cNB1lOapB2QOVnYanfaPefM7hM4/5sewoB/8Hguwao09XTfQf1D83Z39ycK2u81OiuhLo7J45E3fOhZXEsKZIZUqnJc0wIQWlXhQ3rpgKciciVGSNi89PIHD5Mdb8idax0UYTSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y6MCLNOQ9JLrVa/xfMSsGJ7FXzT9UZWUhpf/EQJp0EQ=;
	b=Wuh48YshxRz5y0YL7/xdLo0etSqzw7ROqsmDfJi+X2Na22pAHaSaLSRDlgZ+2IJU8aHBGxeHTXkeA5JAKKMQPcn3JZ32dsH6TijabIJRvQJ3+R8ao1sB/RVt383emoC5c3A06a1dMtZqnMonP42j5sI2xha3tqK1KF5ixZJQ6/4=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1237.namprd12.prod.outlook.com (10.168.167.136) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.21; Sat, 18 Jan 2020 01:11:24 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2644.023;
	Sat, 18 Jan 2020 01:11:24 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Pascal Huerst <pascal.huerst@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Looking for a way to build latest tagged releases in
	recipes
Thread-Index: AQHVxtrVLP5ZK3dnBEaFuu03GmqUsqfiOsqAgAACogCAADZ9MIAJtE3AgADWm4CAAJUykIAAMtbwgAHi/QA=
Date: Sat, 18 Jan 2020 01:11:24 +0000
Message-ID: <CY4PR12MB1653BEA34A6F214D78FA27138B300@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
	<a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
	<CY4PR12MB1653B76238099F8FD42B7F228B350@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB16537AE4F18230211893EAFB8B370@CY4PR12MB1653.namprd12.prod.outlook.com>
	<5635f310-c6a0-1f4a-9fb9-05ac4813fdc1@gmail.com>
	<CY4PR12MB1653056C46459CD414FA9C578B360@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB165360D26B46F6A7220313238B360@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB165360D26B46F6A7220313238B360@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ea2108d-e545-44c9-7def-08d79bb35677
x-ms-traffictypediagnostic: CY4PR12MB1237:
x-microsoft-antispam-prvs: <CY4PR12MB12372D3E5795F440572A23068B300@CY4PR12MB1237.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0286D7B531
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(366004)(189003)(199004)(29502001)(8936002)(4744005)(2906002)(8676002)(55016002)(81156014)(9686003)(966005)(316002)(110136005)(478600001)(81166006)(5660300002)(26005)(71200400001)(86362001)(6506007)(76116006)(186003)(33656002)(64756008)(66476007)(4326008)(52536014)(7696005)(66556008)(66446008)(66946007)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1237;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7LkNX5Ub241mkgFuwgm4rfiBHsHStm9EMw7zQ9qF1Apo3hsI6wKvjtjG2KnBIiA5sCRAhBgNgyzsIkWz12nYWMoRrKUz76Y3ok1tPxFsRotWj0jCr474T4TpIFX0QGM2F+KN/lv3Lh6bU1g1knGORwVGtVeZPLXybbFlOS3gCs/Sjyfrmsy2muANI/9ju6DQBSqKR3TvBLIkIWxbu3yMv+73EPAPX34vXjgS1dV8qFcmAx1ZTfuhELRXxJ4tkDrBw0UgV6zSx6F2uTsXPfSv9b31mm8pr7IwK22Ufx7YuURdEBb3IzEoNkZxmewbTmv7afB0xsHP4Wtz35stMrRhUP2h3krlc9gAaRnqmnKJacy6Le3WOsGRfW/4GNXsGYPK8AEU0NCJ1OA5Qtc6xpTIcHQy2RMyhO5iQAiVb1zRhzew+QnXkWjmBu82PfKDiwG4PEx74KmjNJmyC3fmbzNWFnEGEAok8Vq+DbgR7AJ7JfstwRSxQmtaIsf/QpbQZnmOVDzLvi4+oqu/B0cKMNV1lIxZia9Vt3M7nE29DrpOrSTbDQ9H//asJqR4EhXrtGeW
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea2108d-e545-44c9-7def-08d79bb35677
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2020 01:11:24.7217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7EpFHqX77Un8/4H8XiPRIw3BYzk0UPJr2yaZH8qVQF6ygx6JnMZ4oEbxoNVAQNTwN4A/aHYlfmJxh+bR0cvnnchigb0Wo947Z5lZ/tStVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1237
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Sat, 18 Jan 2020 01:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBDcm9zcyB0aGUgZmlyc3QgVE9ETyBvZmYgdGhlIGxpc3Q6DQo+IGh0dHBzOi8vZ2lzdC5naXRo
dWIuY29tL21vc3R0aGluZ3N3ZWIvMzllMjRiMzI5ZGU3MGMwMjEyZTViZjIxYTQzMWUxNDMvOGQx
YTVmNTFiM2MwYmYyNjBjNzMwZWQ1NzE2ZDk4MDdjNzgzMzViOA0KPiANCj4gKEJUVyBldmVudHVh
bGx5IEkgd2lsbCBtb3ZlIHRoaXMgdG8gcG9reS1jb250cmliOyBnaXN0IGlzIGp1c3QgbW9yZSBj
b252ZW5pZW50IGZvciBtZSBmb3IgdGhlIHNob3J0IHRlcm0uIElmIHRoZXJlJ3MgYSBkZXNpcmUg
Zm9yIGl0IHRvDQo+IGhhcHBlbiBzb29uZXIgbGV0IG1lIGtub3cuKQ0KDQpyZXZyZWNvcmQuYmJj
bGFzcyBoYXMgYmVlbiBtb3ZlZCB0byB0aGUgY3BsL3JldnJlY29yZCBicmFuY2ggb2YgcG9reS1j
b250cmliLiAgDQoNCkkgaGF2ZSBhZGRlZCB0aGUgYWJpbGl0eSB0byBjYXB0dXJlIHRoZSBicmFu
Y2ggZm9yIGdpdCByZXBvc2l0b3JpZXMuIFBsZWFzZSBjaGVjayBpdCBvdXQuDQoNClRoYW5rcywN
CkNocmlzDQo=

