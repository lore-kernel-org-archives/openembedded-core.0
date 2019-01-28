Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 3553 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Jan 2019 07:19:10 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130095.outbound.protection.outlook.com [40.107.13.95])
	by mail.openembedded.org (Postfix) with ESMTP id 8A70960720
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rsYXGnuq9njPBGXReT0AV0lP+dQyqdcmdxm8A+W61/k=;
	b=YdoXRt3x+FBzJoW2aM3v8MUoo+Q7zgwkdSU2oy0Hr1YFiJTvoJ+4QNhWXdoUt5ZDLdlDA5+6R6SJOMrEe2090WB2A3m6qqV+6i5aEGrzqcql79NlX8RhlZNzAMZOSUhurL3Y2iRwOB4tdL7axvDFyaKKj0L5bSA2YeAyGkDRiRA=
Received: from HE1PR0201MB2265.eurprd02.prod.outlook.com (10.168.145.136) by
	HE1PR0201MB2458.eurprd02.prod.outlook.com (10.168.146.151) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.21; Mon, 28 Jan 2019 12:47:37 +0000
Received: from HE1PR0201MB2265.eurprd02.prod.outlook.com
	([fe80::4803:90a1:ee0d:ae19]) by
	HE1PR0201MB2265.eurprd02.prod.outlook.com
	([fe80::4803:90a1:ee0d:ae19%5]) with mapi id 15.20.1537.032;
	Mon, 28 Jan 2019 12:47:37 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] gcc-cross-canadian: Do not create symlink to real-ld
Thread-Index: AQHUtwelR25ZdeukykGTSLbWP9aspQ==
Date: Mon, 28 Jan 2019 12:47:37 +0000
Message-ID: <20190128124739.9175-1-samuli.piippo@qt.io>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.89.120.53]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HE1PR05CA0259.eurprd05.prod.outlook.com
	(2603:10a6:3:fc::11) To HE1PR0201MB2265.eurprd02.prod.outlook.com
	(2603:10a6:3:7f::8)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0201MB2458;
	6:kC0EGd0dRUBs1CNOSn45d4VmAUsoScxOPlkIHpSgqY4YVV5bEkA5SxmJ0EBam2dNCjMjML9Xklgd4sUWbo5Hy+iLF9OW+mvahk+N0iBDTL1rB5TMVJD6mWGVgKtikiOWPHLiIY8yKa0nKIV/SferOPrGrrqv1GKwSEub7pDID1H27izm8PCP9AN5DyhnCmHbME70QOlS1O6v+b0TATs5bClcPlO2oioB2f0qq35E21FCrSf/jio4qb97JfceSdlGlSpa07L7N1IrK+RVumG7KQh6GgoUvRlpb8/vBrTQSetNz74ObZKvw/+rJvgal0tkoB1FFYgHicG4PszYN9fjVQUJBawWo8HcbCKR9r+n3/Q6bWv9FOSs8FdpH5H1F6zLq3GSj+9eyBXmxGBwkkAGUK5F5BqpcgZQzoPT9+7B6OOMTdQPzEgcym6HTG1MwPcQNkNDFLkZ7FDrpdyfg/FT7w==;
	5:yAodd8toLsyKJ4rX69lskcW1FfogfJ8Jw4kr/m5N8hCPxSqQ//555uWqfi+NuIHPHKQsHf3eJx1QNB7scM0QXEUa2BrAzSH1KHYQ/B9ChQJsfRObogTA0j70Jf4s6rwFgOpYD+LuweC7PMWW2U7BwKI/BJzJYl+nn0yE1sVuXCrZ0Lgvs2oEqH614yFah9lhQNFMREJVxgSaJ/vdvN37cA==;
	7:Gx2KynZSlZ8hmOMD+WVigEWAbw/o1G9lZ8DgmRyetnZ4vBHYZkb6uJ4zY1nEDhi//eQUe7lwX16NGhEwJb9lr74wdMpHHd2DZyEI60M17SPEITVTv5HndYy9J7PrbucgFPmAqH7sF/BeBbzcRPsaxQ==
x-ms-office365-filtering-correlation-id: 68c81a60-2da4-4e4f-453a-08d6851ec825
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0201MB2458; 
x-ms-traffictypediagnostic: HE1PR0201MB2458:
x-microsoft-antispam-prvs: <HE1PR0201MB2458D13E53798850F06B5217E9960@HE1PR0201MB2458.eurprd02.prod.outlook.com>
x-forefront-prvs: 0931CB1479
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(39850400004)(396003)(136003)(189003)(199004)(105586002)(106356001)(71200400001)(71190400001)(256004)(2906002)(2501003)(2351001)(6116002)(102836004)(6506007)(386003)(186003)(44832011)(26005)(6916009)(486006)(3846002)(2616005)(66066001)(476003)(4744005)(1076003)(36756003)(99286004)(33896004)(53936002)(52116002)(7736002)(305945005)(8676002)(316002)(86362001)(6486002)(6436002)(6512007)(478600001)(97736004)(5640700003)(74482002)(68736007)(14454004)(25786009)(81156014)(81166006)(8936002)(50226002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2458;
	H:HE1PR0201MB2265.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N+rFU6yyET58xbma0Kgf3FfYezdndrC7NYyQnY2XIeFDnJbAQPTfTuhA2mIgPcDYMKvbnodh+Yp9bFeHhf9AD+T5I54dUsWNU+ai9KQQ+tl7eSfp9xh+sjyzCvwBzqaKeQZucCKzBRJhTviIUPqTQ39B4oz5CVuPRlY4GEiQbhKNqvqfDvhXmESviYEqzWvG2+nuGTTV7WGJJhpURsMBaFargPlwhr5P3QKMFETQv7zhEXl+I83q4p4/arV5gFzJ4jmAwoZVSHgvJAF4fmKuwTtfjQsT2EzmcojAzjAFJ9APLNRwdN/wEG1n+ZLa/d9uZ76J/Isf4yztD30bWAQ57w8WQlKAc6AsRCoDYCD8bY/WH8hHGLfo+JdQa6vd99G8dTP69k8lygr18Xra8IR3h0rMnKiFj2/1NR9L2UB77w8=
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c81a60-2da4-4e4f-453a-08d6851ec825
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2019 12:47:37.2432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2458
Subject: [PATCH] gcc-cross-canadian: Do not create symlink to real-ld
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
X-List-Received-Date: Tue, 29 Jan 2019 07:19:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

real-ld is always used if that is found, which means you cannot
switch between bfd and gold linkers using -fuse-ld=3Dgold.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipe=
s-devtools/gcc/gcc-cross-canadian.inc
index e7c08d3a61..ececec4965 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -137,8 +137,6 @@ do_install () {
=20
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
 	done
-	t=3Dreal-ld
-	ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $dest$t$suffix
=20
 	# libquadmath headers need to  be available in the gcc libexec dir
 	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
--=20
2.17.1


