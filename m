Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 6744 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 Nov 2018 21:08:31 UTC
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40085.outbound.protection.outlook.com [40.107.4.85])
	by mail.openembedded.org (Postfix) with ESMTP id 8580D6079E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dh4YyfmZmiYi+m8lOs9ny2JS1cIAoLQvblDyvKAaUaE=;
	b=St5YfsPe+TV4H34LkfDS5pS/N4rH4WkDkNwQLae8bZv7Qi4dEafxs1MaJYLM/7X/xpbNH0f41Pl1EBJL+q3b8swAbmsGnw66//Ki6/SXOjEFkFWMCziTfJ2ER60kn0bsu248ZZzOVlXtxuNWDC7ontp31RD0mfzFYoyqSxG/Tq8=
Received: from AM6PR0602MB3544.eurprd06.prod.outlook.com (52.133.23.17) by
	AM6PR0602MB3431.eurprd06.prod.outlook.com (52.133.22.140) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.20; Mon, 12 Nov 2018 11:32:14 +0000
Received: from AM6PR0602MB3544.eurprd06.prod.outlook.com
	([fe80::70b3:f9f3:a5a5:df3a]) by
	AM6PR0602MB3544.eurprd06.prod.outlook.com
	([fe80::70b3:f9f3:a5a5:df3a%5]) with mapi id 15.20.1294.044;
	Mon, 12 Nov 2018 11:32:14 +0000
From: Mauno Niko <niko.mauno@vaisala.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] strace: Bump to version 4.25
Thread-Index: AQHUentcVsDjH9u9xUuLPyT4bbyRTA==
Date: Mon, 12 Nov 2018 11:32:14 +0000
Message-ID: <20181112113200.128586-1-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.143.230.131]
x-clientproxiedby: AM5PR04CA0032.eurprd04.prod.outlook.com
	(2603:10a6:206:1::45) To AM6PR0602MB3544.eurprd06.prod.outlook.com
	(2603:10a6:209:e::17)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR0602MB3431;
	6:QrcIX0J0Irgc8uN/JzDKWu+dcwnS0KOJNgQnVnuH+zQlrZ5WWXntfaLEmqFgjROBYZcuGwo1HRVLgITeZ3lujQGiowF/8rHwBYDDSvieyYawTeZxkuv/XooTnjq7tB24saUecDuCqrcNiicXO1M0PVW1kLZwvxEKEuJxh1U+cQY2mvGBt4ZqGBGQjNma7aS4D7G/V+yplb3Bd4BrX/W5OFhQdgZ7dR7/kw1F74T0GXly9lOs5L1M0mgtqvskN7j4clRxcE/ZGGUA6w6jv2ms75kj4i8S1Px94Toma6y0/uAb+26bqlnjYHAhuBPWLyoEZtG9bY5ztlN6lIBOPH1GuL5MtwfXISHRKpo3sOxy/LxMmtEBFRMmjabODZdPzCuN8G90da/i2Th946oy7Ge09odo2rcI/qHsyB0t6xYx8FlcQFPcWJOnBijJDRhVvOkb0+MgaJX8L+HOnaFfny46zA==;
	5:lcmezO/6VrYoy4zqYZLk5U1d/SRgO0YJ8TxO5EebqlavqUSF4Yl50vdR1Uy4KhL1DhCTDgzLiWa8iSXOWZ9R8eMAipEySEzi++yHG4K/mFU620F4XYAaBk7yhTNYpGDGnN8WVUlC67Hlg1+eHK/cpJ8WH1ssqIKdREFl8jT84nU=;
	7:1BdQx122rp40HF1WodeJ2DrSuCiWnDUE+8PtopOoJm4ZMqOoXbXVIAKtCSna7AQXh+2bgoesOWb/VQJ1le4qS6CPB5rL4nJaI0F1a5Kzv6skBaOvPmXqad0wPpyuNEKLouN9fDEgyAhbTmeCcS+YQA==
x-ms-office365-filtering-correlation-id: 628a0951-8680-4e29-dfe3-08d648927e82
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0602MB3431; 
x-ms-traffictypediagnostic: AM6PR0602MB3431:
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-microsoft-antispam-prvs: <AM6PR0602MB343154C11377BC575C264E4181C10@AM6PR0602MB3431.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(84791874153150)(166708455590820);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231382)(944501410)(52105112)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:AM6PR0602MB3431; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0602MB3431; 
x-forefront-prvs: 0854128AF0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(346002)(39850400004)(136003)(396003)(24433001)(199004)(189003)(6116002)(1076002)(14444005)(256004)(3846002)(2900100001)(5660300001)(2906002)(52116002)(386003)(6506007)(68736007)(6916009)(102836004)(966005)(14454004)(26005)(186003)(6486002)(316002)(7736002)(107886003)(478600001)(6436002)(305945005)(486006)(4326008)(2501003)(66066001)(5640700003)(105586002)(25786009)(97736004)(86362001)(575784001)(71190400001)(476003)(2351001)(106356001)(71200400001)(6512007)(53936002)(2616005)(81156014)(8676002)(8936002)(81166006)(1857600001)(36756003)(6306002)(99286004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR0602MB3431;
	H:AM6PR0602MB3544.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: jPxbOoxpWxCfGs3Ctaz+KirnkZ75XA2c23915CCjN2MbNEH36DftcJzWxuXR1RYYZQqpk1WJxZ5mQoPE4BIxvR2OFgXwvuD9RpWPt3sVthUGPUUPXOeAjR5Bdsati3m++q95mt7aq9ST8z66jQbxYAHDrY5upT9/2Vs5QOkFHHtOaP5F8tztAc22nGgY8XCYJVUtSYvOwVPs0NFTKZ+sy9TDD1LGRm5uWW8RhHm5fmLKz0Y34Ojj70dvp0B2kY6g5Y2/HcMzqiT58+iByuSuV68XTRpuz9RkDEESx6KDgqdJvN2qr535zogId9SOfGW/oKUnRe8rTLO8/VXMbdj0tJevUHsZrKwvaCK+SmutFdc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628a0951-8680-4e29-dfe3-08d648927e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2018 11:32:14.7716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0602MB3431
Subject: [PATCH] strace: Bump to version 4.25
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
X-List-Received-Date: Mon, 12 Nov 2018 21:08:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

V4L2_CID_USER_IMX_BASE value differs in v4.14 and v4.19 LTS kernels
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/inclu=
de/uapi/linux/v4l2-controls.h?h=3Dv4.14.79#n191
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/inclu=
de/uapi/linux/v4l2-controls.h?h=3Dv4.19.1#n191

Building strace v4.24 against 4.19 kernel headers results in following
build failure

  | arm-vaisala-linux-gnueabi-ranlib libstrace.a
  | In file included from ../strace-4.24/static_assert.h:31,
  |                  from ../strace-4.24/xlat/v4l2_pix_fmts.h:4,
  |                  from ../strace-4.24/v4l2.c:78:
  | ../strace-4.24/xlat/v4l2_control_id_bases.h:36:1: error: static asserti=
on failed: "V4L2_CID_USER_IMX_BASE !=3D (V4L2_CID_BASE + 0x1090)"

This Linux kernel ABI breakage that occurred wrt V4L2_CID_USER_IMX_BASE
has been observed and addressed in strace upstream commit
https://github.com/strace/strace/commit/b89a69dec27cf638df0e17db80ed937c3e1=
abf77

Bump strace to version 4.25 which also addresses ABI breakage so that
strace once again builds against both v4.14 and v4.19 LTS kernel headers

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/strace/{strace_4.24.bb =3D> strace_4.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.24.bb =3D> strace_4.25.bb} (=
93%)

diff --git a/meta/recipes-devtools/strace/strace_4.24.bb b/meta/recipes-dev=
tools/strace/strace_4.25.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_4.24.bb
rename to meta/recipes-devtools/strace/strace_4.25.bb
index 9e40a064f8..117ebfbf72 100644
--- a/meta/recipes-devtools/strace/strace_4.24.bb
+++ b/meta/recipes-devtools/strace/strace_4.25.bb
@@ -15,8 +15,8 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.t=
ar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usi=
n.patch \
            "
-SRC_URI[md5sum] =3D "8780136849c85acf76ad3a522aa4462a"
-SRC_URI[sha256sum] =3D "1f4e59fc1edfa2bfb4adf2a748623dc25b105ec79713dd8440=
4199f91b0b0634"
+SRC_URI[md5sum] =3D "fa5ac841e9ce6af133061822898d49a9"
+SRC_URI[sha256sum] =3D "d685f8e65470b7832c3aff60c57ab4459f26ff89f07c10f92b=
d70ee89efac701"
=20
 inherit autotools ptest bluetooth
=20
--=20
2.11.0


