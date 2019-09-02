Return-Path: <alban.bedel@aerq.com>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30126.outbound.protection.outlook.com [40.107.3.126])
	by mail.openembedded.org (Postfix) with ESMTP id 889077F351
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 12:08:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=NLP6pJXpjN1S5yamHMln3vEshem86rtBoYn6PZD+xhFslZXpsCQusGnSDN+UCnj1jLZ2JjT++J32r4+YA5br5cJmNNDOVXCopy6pbvC9EhZf5jGhnokT5jO24MvzdNUlYQM1Pxn65vNEFD+ii3arlkoaRDjSIaqRoikVO7QfXpud1ek38TAQPr4kTBTL/k6CcazHl+s24PX+wYHrpb2Zyd1Go0IiWsWR7aUjp11nhGTJEhGRvE7s+SRKEjnb7GH4PurOGwgxrNIRT3VqLw+QxVt9/8M/XXxWdZbuYuVWfDxWE7lnasBBGBJzKVxU34rp9m5vUEN9fpdeugxDqrf3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tjoHuN7k1cV5F+H4k8EdgDwVp1pAp1nsAun5hpi26gw=;
	b=dYbKnUraK43LGUpTe5EY+LnaZl/9/eS1wKZuJCopra+yfGVTjiLAFiBzCspvJwLFihc7lvJmgdY683vHFOte2dfnncMmAkMsVMZ2XQ6WNH7cU32t50cYYnXs4V4HAi+Rsbn+nOVWnPOnl9nhDrsJX+XAMZ8NkPHVpgbeCGH+jZEux2z3a34abX+tfXDwqDPiVwjFb8BZgzwph2Flsutdadzv1mJyOVn/oSQ1w5hoPcZIudmbXxUslselJNcpDX4E9m4PIQGcEldl6kK+ypfj+YaNmJicCgnvGp2iKMrF2fTi3Csfe7JR2ghtuACEKdZI0O79O/loo1JUJCBGEiADaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tjoHuN7k1cV5F+H4k8EdgDwVp1pAp1nsAun5hpi26gw=;
	b=FyZG+hZjbc5/bknV/5C+XMaj0Uw08aXD9RzG6moNi9o2DjnfgjjqaXlWa9MWW62687rCZ/bbfp+0tftHOG/zDJ8SgFQw9qmqdA3EVpEGrP6tm+fkXmexlwiWULxBLAVxd54sVq6XqePc+Xh6qBw2zK1m2nS8Q2XRfHBSahggGvc=
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM (52.134.115.151) by
	AM6PR10MB2744.EURPRD10.PROD.OUTLOOK.COM (20.179.2.79) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2220.18; Mon, 2 Sep 2019 12:08:01 +0000
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8]) by
	AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8%3]) with mapi id 15.20.2220.022;
	Mon, 2 Sep 2019 12:08:01 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: QA check for package arch less specific than one of the
	dependency
Thread-Index: AQHVYYcQ2GTPpg0RI0Sjcyg6FiCZAQ==
Date: Mon, 2 Sep 2019 12:08:01 +0000
Message-ID: <5a07fd1a6c7f51f526b06d31987395f901faf9e6.camel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1747d6d-492a-4ed1-e0de-08d72f9e3392
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM6PR10MB2744; 
x-ms-traffictypediagnostic: AM6PR10MB2744:
x-microsoft-antispam-prvs: <AM6PR10MB2744B790FC3FB808D37B38EF96BE0@AM6PR10MB2744.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(366004)(39830400003)(346002)(376002)(136003)(396003)(53754006)(199004)(189003)(2501003)(91956017)(99286004)(76116006)(4744005)(6116002)(3846002)(6436002)(2906002)(2351001)(6916009)(7736002)(5660300002)(66556008)(81166006)(66476007)(305945005)(66066001)(508600001)(14454004)(64756008)(66446008)(66946007)(8936002)(36756003)(26005)(6506007)(102836004)(316002)(5640700003)(55236004)(186003)(256004)(486006)(2616005)(476003)(81156014)(8676002)(71190400001)(71200400001)(25786009)(118296001)(86362001)(6486002)(53936002)(14444005)(6512007)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR10MB2744;
	H:AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S3GbwP/FBL355IDsUOChS/1R9PJzhMKYxnbE13NR03zIsNujZDCDC0+G6FmLSLYK45iWmxuSZ4UBvhatgTXfhFqB/XwUHQm94FloOq6eAfVybpa4ct9i6yBQF9vm+4t7mNNDQ9K65f/znRdNX1Ptr/D082ZUXFM115bsWwjgJZYAaWCWnXTo2SYT1WhvzsdZtNGhisLJmVb+k7B9A7g7proOlD7Pk4LACjywc42guF0GaUwQTwj33ZRadZOMi9R19mqYJ+1vL743xaVAIIlEXphOYuRAcj7er5++uzh9em5VnkwVVXD0FBdX4y4cDFEdqkglURRjoqfHPqpBFGHmF5B05a7A2OAw3nsEI3epMbKHxNH3QtCQz/9waK8tj13yfpa0KojM3Md94shu5wbibj79xMxJqTAtVnqMGSyYvbs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1747d6d-492a-4ed1-e0de-08d72f9e3392
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 12:08:01.1667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUsOUXu1C1P/pjGVg+GK9txAhaq2oweYdToIj3QFAZvya4KWsdd8+4Nv+Ca7l8BPqVvVz2ycMKM9QhfB+GhQYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2744
Subject: QA check for package arch less specific than one of the dependency
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
X-List-Received-Date: Mon, 02 Sep 2019 12:08:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8829EE96A981EE4ABB4D9F6DEF83EBDD@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQppbiBhIGxheWVyIEknbSB1c2luZyBJIG5vdGljZWQgdGhhdCBzb21lIHJlY2lw
ZXMgdXNlZCB0aGUgZGVmYXVsdA0KZ2VuZXJpYyBhcmNoaXRlY3R1cmUgYWx0aG91Z2ggdGhleSAo
YnVpbGQpIGRlcGVuZCBvbiBtYWNoaW5lIHNwZWNpZmljDQpyZWNpcGVzLiBBcyBmYXIgYXMgdW5k
ZXJzdGFuZCB0aGlzIGlzIGdlbmVyYWxseSBpbmNvcnJlY3QsIGEgcmVjaXBlDQpzaG91bGQgbmV2
ZXIgaGF2ZSBhIGJ1aWxkIGRlcGVuZGVuY3kgdGhhdCBoYXMgYSBtb3JlIHNwZWNpZmljDQphcmNo
aXRlY3R1cmUgdGhhbiB0aGUgcmVjaXBlIGl0c2VsZi4NCg0KQXNzdW1pbmcgdGhpcyBpcyBjb3Jy
ZWN0IHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGhhdmUgYSBRQSBjaGVjayB0bw0KdmVyaWZ5IHRo
aXM/IEkgZ2F2ZSBpdCBhIHNob3QgYnV0IGRpZG4ndCBmb3VuZCBob3cgSSBjb3VsZCBnZXQgdGhl
DQphcmNoaXRlY3R1cmUgb2Ygb3RoZXIgcmVjaXBlcywgYW55IHBvaW50ZXIgb24gaG93IHRoYXQg
Y291bGQgYmUNCnJlYWxpc2VkPw0KDQpUaGFua3MsDQpBbGJhbiBCZWRlbA0KDQo=

