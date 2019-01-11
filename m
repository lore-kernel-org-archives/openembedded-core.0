Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 21659 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 12 Jan 2019 08:43:13 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140139.outbound.protection.outlook.com [40.107.14.139])
	by mail.openembedded.org (Postfix) with ESMTP id 757507C18C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wEh2qR25o9vbChfQjvUFJ2UxYf0IqSkGOoDoiA+DTJc=;
	b=TnhszfETyp28ZHcOtD2OKHGZMII5u1Dm/8RS19xfzn6bvXxSq5L2xzUDobyJtOCQH6tplAV1Bx6qnhNrBNe1dqx5Ft3RJgrBB1ZPErIBLOG9YMHmfgHVUpyYWeKVToaFbDEuvY465KVKg54j5QkoNdU5zaIO6Cv82JGLD2J/tBo=
Received: from HE1PR0201MB2265.eurprd02.prod.outlook.com (10.168.145.136) by
	HE1PR0201MB2137.eurprd02.prod.outlook.com (10.168.30.136) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.13; Fri, 11 Jan 2019 10:16:22 +0000
Received: from HE1PR0201MB2265.eurprd02.prod.outlook.com
	([fe80::54da:554c:d12e:e3da]) by
	HE1PR0201MB2265.eurprd02.prod.outlook.com
	([fe80::54da:554c:d12e:e3da%6]) with mapi id 15.20.1495.011;
	Fri, 11 Jan 2019 10:16:22 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] sdl2: fix sdl2.pc include paths
Thread-Index: AQHUqZazzAHcFuVVJ0WNtPAAGjcS1w==
Date: Fri, 11 Jan 2019 10:16:21 +0000
Message-ID: <20190111101609.5587-1-samuli.piippo@qt.io>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.89.120.53]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HE1P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::12)
	To HE1PR0201MB2265.eurprd02.prod.outlook.com
	(2603:10a6:3:7f::8)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0201MB2137;
	6:/awMFcS4E9hBM7tRZ6CSG6UFZ2rsbvphO6/ej15RAEuG9Q8MNQeOANXCHd3PS+ZLUheXawLW5ibq1uda7A4+qIrq7zAA/AXb7EnNMN1Cu7vkgXhzZk3Lld1lzJT5WXPdC5pP7viMZdDD3hkQj8OXxy4NlxkTWH4ziFPvCoKgqlWDrRQ3ddofz8WS7DoTO/5gZNkwwFGT2QPA85tIAerl45D6hUqej0216zblcnrruUl6lBA1Lb0U74QwAs5Kvfyd0NEroXRd9BzhGo4GR4qDZJvqbsM0ETXbEMhtWYQIJLzIM/+lfvajQndOaP0FFcuQcquT79N8KL5tT1wYEdHXiX/i0VyMzQlQFZ86Z4u4aTOJzu40hrFTScAhkgurAM/Km6J+uDfXp8nmd2kaMmI4oKTciqv4djJxOmwdNX1CPPv3EmVyuuMOc9dvOPmFIYVMrz6CgUloYApzEYrNIM8PeQ==;
	5:95o0IVYoViQk+tT4Bb1wE8VztiK4T+attuy+cvIaHM3mLx0xVTDd7QDh84I3M2SjOh7oD8owma0fP4NG3ez+79hdUNQTT17P8J08BlGUYHYVNWe+IRBaatVKyw90HvT5eCAAj33mdAgNhvgMx405LrWaCxQ75hlEYEwc9axr6dx7yyAo4yN2v1LreWPlAQMs4xWmLp3QMN7WeoyY8mhA/w==;
	7:TjrftXOVuVSoOgfb+HJScAAT1iNDW665ZePEc6rh1WdaDFVgE+EtnZO5jgcNwOzTcriGzVR7Zu82UYREAxw/0mon2R1Ssddz7n6P1dzUkPvpC1A5jRcZnRFOuZ4o8O3uk5Fti5ma8FXqQeOwJjFVwg==
x-ms-office365-filtering-correlation-id: d084757a-ee53-4ff7-b91c-08d677add576
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0201MB2137; 
X-MS-TrafficTypeDiagnostic: HE1PR0201MB2137:|HE1PR0201MB2137:
x-microsoft-antispam-prvs: <HE1PR0201MB213795432A346604410DAC4BE9850@HE1PR0201MB2137.eurprd02.prod.outlook.com>
x-forefront-prvs: 09144DB0F7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(136003)(39850400004)(346002)(376002)(199004)(189003)(14454004)(2906002)(102836004)(6116002)(74482002)(66066001)(386003)(6506007)(50226002)(478600001)(305945005)(71190400001)(71200400001)(3846002)(53936002)(6512007)(68736007)(7736002)(2501003)(8936002)(86362001)(2616005)(6916009)(186003)(486006)(316002)(8676002)(44832011)(2351001)(476003)(52116002)(26005)(5660300001)(256004)(99286004)(6436002)(1076003)(97736004)(5640700003)(6486002)(81166006)(81156014)(33896004)(105586002)(36756003)(106356001)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2137;
	H:HE1PR0201MB2265.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rCA1wHV+inJbrQG+i566OtuXrFNXgdzQUbNsG+mRBFJXpEmHtDq9QyIKlLjJLXcBAF8ZOs2EPMn5iTrE24JPDpxmqVrzEnmub/BDhrD/SAX4cArtmluj8Ad7HsfW4m4w1xeQlXu5h5rwNT+bpPqqYmN/Sv2Y4KJBe/zqgFhDkI12hmLPdyQu2sNLnpkavQp05iaTi02+XQicavxH6vjDXS07PzPa7hf7On/dnQRSOLTzuF9+C6LCLiaGWUP+1QKTwsuSoH6Aq12lX1RzvoAgJWN4w27h7Tuev3JPJdfH12dtNppATlHpGBy+GzF7i1FClZpplqeKV4wdGTeTIKzHD5ZU8Cew/cKOzFvKhLUgu5Ubk7liMZCIUEme3uqSsQEgjyI8DITaahS+hHMWdXdN0fyNA393oOmeKbFt3mOP9Cw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d084757a-ee53-4ff7-b91c-08d677add576
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2019 10:16:21.3498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2137
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2137;
	23:BMFwRwNpGgz6H3LZwyH5+dCWv3bpVRKQ7w8JNEhXPPBlMWtS1eptwoS76aXzymxtmH8KUdryBrd7q+nvgFd4M3c7s43LGAM+vzWsZTqh4QGvXF/DbvDwBVZLVQUbFs97NXirhk1OON43DCdcNIZN8Q==
X-OriginatorOrg: qt.io
Subject: [PATCH] sdl2: fix sdl2.pc include paths
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
X-List-Received-Date: Sat, 12 Jan 2019 08:43:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

SDL2 dumps all cflags to the sdl2.pc, which might then contain paths
to the recipe sysroot include dirs.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-=
graphics/libsdl2/libsdl2_2.0.8.bb
index 812a9abf3c..a9c5d8a443 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -64,6 +64,10 @@ do_configure_prepend() {
         export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
 }
=20
+do_install_append() {
+    sed -i -e "s|${STAGING_INCDIR}|$\{includedir}|g" ${D}${libdir}/pkgconf=
ig/sdl2.pc
+}
+
 FILES_${PN}-dev +=3D "${libdir}/cmake"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.17.1


