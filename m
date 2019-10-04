Return-Path: <Alexandre.Bard@netmodule.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00128.outbound.protection.outlook.com [40.107.0.128])
	by mail.openembedded.org (Postfix) with ESMTP id E9C057F021
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 07:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=l/j92CDN+9xh87Q0QJjGK5Tl8A0Ji3Q8aXxSPN8pv6/38ny9DbJ8E9VJ93qfxfMrcczFD/Zb3ityH5vrTihU3Ut7aLck+doA1Ge4I+tGwp0wj1a+VTFGd8SAOOuuffk93s4XxCKW4YTjcdkSLYDVNYBwyAS9Q6AvJ8U5fQXpabAQS5YCP+Q4dQ7nZM8tQn2Dzbai5B9pzlHKKaOoW5//qKLx4PH8dDw91ljstOzRTVOpNjLvnkw0EHUJvI8tlK2foQhnzheE4nW6oln1KKBl+ejgWzGC+jMe7GZ7Vx++p26dB0k8FWSFR3fHB46jUI8IQ7UEc3lZ/j00H74AQ/LUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D+iZDJTQj4mg8SLAFEKQKxkTHaHYS+cP9JduCKsHQ0s=;
	b=Sv2D06GrrHFyNqO6WQ9oZXmPJQLSt5LJ35aiYlEBhzWQIMdrL0HnnLH0oSqwiRwNUe+QCVh4moP7ps1StuZLLAGRy7e4O902ovUR2d7gyW7zlc4vyOsCHlTLxuefL3ZlhFdagfwP60w5cdOFxsS4FVXnqwqQWcMObkCQq/GDF8kLdTw62sgEL54O+ufLgzIhT6iUEDUlBm78wFKu11JgFsBislVydlsLp7EPHTFXFvdixDFEprDMXXgEnrU1IXSU9pSo3/mw5iMIpWh0XjhF+0Xww3jq+V1MpKZ2J8g51lDOEDuwMDQ0ZvWADlU3umfmYLar1RbwJAM7Bc9aSxOHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=netmodule.com; dmarc=pass action=none
	header.from=netmodule.com; dkim=pass header.d=netmodule.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netmodule.onmicrosoft.com; s=selector2-netmodule-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D+iZDJTQj4mg8SLAFEKQKxkTHaHYS+cP9JduCKsHQ0s=;
	b=YxjkfVDAw09FM9JaPYo7MEftDMgR/BvD5beLMoTcb5X3z/QrJuGeDuikGg/KbIg+WCoZdj8JQXTcgOZkLS6F2LZLMwO+FrcIbMvRZCNNtVWK4/XlogPkf1fdLxjEW4PSgBn0Iufmf4772zj/C0wZp57mmnxYNBEun8H1pPA0KvE=
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com (20.178.15.83) by
	VI1PR06MB5774.eurprd06.prod.outlook.com (20.177.202.90) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Fri, 4 Oct 2019 07:51:17 +0000
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::7d7a:b7e4:8f0d:be18]) by
	VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::7d7a:b7e4:8f0d:be18%6]) with mapi id 15.20.2305.023;
	Fri, 4 Oct 2019 07:51:17 +0000
From: Alexandre Bard <Alexandre.Bard@netmodule.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [sumo][PATCH] systemd: Expose resolv-conf alternative only when
	resolved is built
Thread-Index: AQHVeoiBCjqw1DkoCUemQcKum6Z/Cg==
Date: Fri, 4 Oct 2019 07:51:17 +0000
Message-ID: <20191004075109.8961-1-alexandre.bard@netmodule.com>
Accept-Language: fr-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: PR0P264CA0230.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:1e::26) To VI1PR06MB5261.eurprd06.prod.outlook.com
	(2603:10a6:803:bd::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alexandre.Bard@netmodule.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.130.140.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73ac8c09-3de6-4141-65ed-08d7489fa36e
x-ms-traffictypediagnostic: VI1PR06MB5774:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR06MB5774A5D21A0CC6B9ACAE17DA879E0@VI1PR06MB5774.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(396003)(136003)(39830400003)(366004)(199004)(189003)(36756003)(305945005)(4326008)(6512007)(256004)(71200400001)(71190400001)(99286004)(7736002)(25786009)(107886003)(8676002)(66946007)(66446008)(64756008)(66556008)(66476007)(81156014)(81166006)(2906002)(6916009)(316002)(26005)(50226002)(6486002)(6506007)(6436002)(386003)(2351001)(186003)(4744005)(1076003)(5660300002)(86362001)(102836004)(52116002)(8936002)(476003)(2616005)(44832011)(66066001)(14454004)(486006)(6116002)(2501003)(3846002)(5640700003)(508600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB5774;
	H:VI1PR06MB5261.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: netmodule.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J0ztcA8j9C185wL7/+e9U49XtY0FscPu7+dtfBMtKKkM2KzsUUjbbzAGMjM3A9SJjFmP22CQnaDbpg+m0hTMwAtgPkdMsvuzDd9SRIwG7OE0Q2d+vKWTtX3OlzANPHdiuNrLN7qAMTj6OGbIbwiNcw7WKWVyAx5bzbg5FHFzvgU8lMkgHfjCmTHbI/07xvAA3AUWruUys/p2Zx/8ikzqEJJyVafkwSfPRpMwJqGbjV0P01sgK2tVnkf8pu+Js9zQkC2JqtZ/vWaGheQJiRZNf5hikSAiQ33JfyEhCuKrMxiGs4uFmiGncBd61FZAm39XqdOK+OtxFus8A26ajSgkTZSb/CiT49Kq2EIjkb8og7xBHv2GfgltDnS/fbVnWAxOjocPgkmuMJxqhzol/QzeQxBbGVDAhBIVEzu5yoyjQOw=
MIME-Version: 1.0
X-OriginatorOrg: netmodule.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ac8c09-3de6-4141-65ed-08d7489fa36e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 07:51:17.7164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcdfa962-340b-405e-be0c-5bfcc8a0841e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MX7TpQ/5zbTpSPgQF1BJv24wpPH2WyqsP0CtrdpqXNYO4kAD9vAi0fuMCxhNQDw4Y4xijbpnjf10HMrk4WuNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5774
Cc: Alexandre Bard <Alexandre.Bard@netmodule.com>
Subject: [sumo][PATCH] systemd: Expose resolv-conf alternative only when resolved is built
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
X-List-Received-Date: Fri, 04 Oct 2019 07:51:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When systemd is built without internal resolver, it does not make
sense to expose it as a resolv-conf alternative and can even break
images where this alternative would be chosen, because of an
invalid symlink.

Signed-off-by: Alexandre Bard <alexandre.bard@netmodule.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/s=
ystemd/systemd_237.bb
index a0e5d512e0..d3a6d52a73 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -548,6 +548,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit
=20
+ALTERNATIVE_${PN} =3D "init halt reboot shutdown poweroff runlevel ${@bb.u=
tils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
 ALTERNATIVE_${PN} =3D "init halt reboot shutdown poweroff runlevel resolv-=
conf"
=20
 ALTERNATIVE_TARGET[init] =3D "${rootlibexecdir}/systemd/systemd"
--=20
2.20.1


