Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140139.outbound.protection.outlook.com [40.107.14.139])
	by mail.openembedded.org (Postfix) with ESMTP id C4A017997C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IFg8XYleixLQl8wlcGpcmGKsLClPOV7jJfA6I3abgbk=;
	b=RfWymplG8I6Qb6K6WzvZtd266qIU6Q8Kv5ghfbGyrmuEIS86r1cjl6sSzdPAd4rTO9kHaYz/gtAfFeVehs+eVBQD9DhKwsiIbulgd2IHBn8NWp8gwC14R+NfNR3f3w3NmN0hH+GXAAQqsbDsnKI5ssqCJwPeGP4n8Okgx1ZRSl8=
Received: from VI1PR0201MB2271.eurprd02.prod.outlook.com (10.168.63.9) by
	VI1PR0201MB2303.eurprd02.prod.outlook.com (10.168.63.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.26; Thu, 17 Jan 2019 07:28:12 +0000
Received: from VI1PR0201MB2271.eurprd02.prod.outlook.com
	([fe80::c5ee:96b9:def2:e5f9]) by
	VI1PR0201MB2271.eurprd02.prod.outlook.com
	([fe80::c5ee:96b9:def2:e5f9%10]) with mapi id 15.20.1537.018;
	Thu, 17 Jan 2019 07:28:12 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] sdl2: fix sdl2.pc include paths
Thread-Index: AQHUrjYzlrCzzqHHCEa2tqbcHfnF0Q==
Date: Thu, 17 Jan 2019 07:28:12 +0000
Message-ID: <20190117072753.25141-1-samuli.piippo@qt.io>
References: <20190111101609.5587-1-samuli.piippo@qt.io>
In-Reply-To: <20190111101609.5587-1-samuli.piippo@qt.io>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.89.120.53]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HE1P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::15)
	To VI1PR0201MB2271.eurprd02.prod.outlook.com
	(2603:10a6:800:52::9)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0201MB2303;
	6:FCAxrdXPI80Vut1/I1r57zXoJ/JEjcwYyxIFyPtfdUoZ1ZZHo9dXjypQQyQDh+B06n+hyNvF9IJueJqXgt/pBpo39/kdn13ldniq8tREU5NYiCAvtlFIHfMUYD7uUqHRf950ljtSBzQh0sGyv/YDErvAfUKgjp+6Vf3Uo5vnBr1dWLEKtFPqyNTY6koCd2P/1ZhpPcd85I2vWAEfkqnKbOW6RTXGxIZiPa5qjTSP65kEo62mOl2Yx0ufftuq//jgSxB7S/eV/i4y4itfyAvtWXRoUCtRH7mJW7VawHiFb7+6IgA1j3WzSJdYoq58QheXA1C1532l9dwCgnjVyHpk9IgifA0LfuCXGp82Pgq8BKfjr4AlBxjS8ptk16+5tMy4dLs5g/5xq8flswImV4CMU1QyFCuA5HqONmFtn7UfXO7cqig3NWgJHYvB68Oh1MNJE7krITzz4hGOR5upavKiJA==;
	5:BQawyTBvyes3etHdj2gM3vqeVRQfDrICTdB4Ji23ZRXEnZYj0UA1FXdCRwTD2OJI8PpDi/hOpmlVpKdXTjmZgUIwbXiHkpSE8U/HPzmvVMadmHDVTONnfDTvadhDpmelBGXthiUEXkVFSpezZEcwpHXTpIGtG7BkF+ftoLV8auisoHnJmsNLilbkCMphxbZOc0D3oem4q3g6aDRfO/M7HA==;
	7:K0S8skk5ZMFCxzV9T/uuqMF+ouBxk1nfA0XUc3QS3wCFvDtQS35OqVJsaG99iZTGaXgKW1shRTBRb7z/Ip/ANZw+xsTwJvHQTpTDAVLpJwViIlPnUtBGLlTSPoLpSFPlcLfLQjg1/JHttlhR4jeGKQ==
x-ms-office365-filtering-correlation-id: 07e37cd4-3939-4988-dd70-08d67c4d55fd
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0201MB2303; 
x-ms-traffictypediagnostic: VI1PR0201MB2303:
x-microsoft-antispam-prvs: <VI1PR0201MB2303BCC0AC4FA9E6C74A0C1AE9830@VI1PR0201MB2303.eurprd02.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(376002)(39850400004)(396003)(366004)(199004)(189003)(6512007)(14454004)(33896004)(476003)(44832011)(256004)(486006)(36756003)(1076003)(74482002)(4744005)(2616005)(26005)(6486002)(6436002)(5660300001)(50226002)(6916009)(446003)(71200400001)(71190400001)(25786009)(2501003)(186003)(99286004)(5640700003)(53936002)(81166006)(102836004)(52116002)(478600001)(316002)(11346002)(68736007)(8936002)(106356001)(7736002)(305945005)(8676002)(81156014)(86362001)(6506007)(105586002)(76176011)(2906002)(97736004)(66066001)(3846002)(2351001)(386003)(6116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0201MB2303;
	H:VI1PR0201MB2271.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gDOs+CdcO2NfKSazFOCnyu1IfgEikPjOacLk2ofRWB/u4CWzIuuMvFmPAnmKjRlqaas/w5hFg24k95tZxdYlprE/76ux0/jzrBDYLF752gHMDKvX4h219Es/KTdJlKlL3m0bIVoloGo2gFpnzLw/GGUQsjmeA0xusTaPWc8exgO+NnkD2KAQ98o2SkGwxJfsdh94/V65tq4TCeLjgPu2ZoWFrITKLW7mks+qCzBm92r4C1Pcn01FNVK+bKWGbhhUZRC+0aYaGcPs96QlkE5U1WTNYyZYdlg2Mz20VywCQ8WbBHRG6Uom9lmM6WEcnXPbN4OCSkiLx0UQ/J6oHBlVgFWmaxLRkFcypFI6nShVEMz7vOhv3AtvdqFmqIXgUBowSEPnQaWnOdYx9ga3kybyt9B6TiyrBuyL8wyLvvGYZhk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e37cd4-3939-4988-dd70-08d67c4d55fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 07:28:11.4969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0201MB2303
Subject: [PATCH v2] sdl2: fix sdl2.pc include paths
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
X-List-Received-Date: Thu, 17 Jan 2019 12:00:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

SDL2 dumps all cflags to the sdl2.pc, which might then contain paths
to the recipe sysroot include dirs.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb b/meta/recipes-=
graphics/libsdl2/libsdl2_2.0.9.bb
index a5ec77728a..8941f05958 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
@@ -63,6 +63,10 @@ do_configure_prepend() {
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


