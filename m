Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 111883 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 Jan 2019 22:49:53 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70127.outbound.protection.outlook.com [40.107.7.127])
	by mail.openembedded.org (Postfix) with ESMTP id C86376BE3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 22:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dZWX/y5CQEYUXUgDcwYhopfrYq2luJjFCLuRBf0+BRs=;
	b=CCdmf1lHImys6f7djm5kF7V1OHRIGzCC6SaCrGp/o8gBmGjnxpRYGOvpzQi8y8VO8EkBL/tvoXWAYbTQGjQoXnWIsl7o8iZVoQUNKb5JDegV1zzEIuPAFbhze/Jkaez9F7/DeOrPKy0dYtDFV2u9J/6bgLwZWqpxFKMAJmLTeQY=
Received: from HE1PR0201MB2265.eurprd02.prod.outlook.com (10.168.145.136) by
	HE1PR0201MB2458.eurprd02.prod.outlook.com (10.168.146.151) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.21; Wed, 30 Jan 2019 09:11:49 +0000
Received: from HE1PR0201MB2265.eurprd02.prod.outlook.com
	([fe80::4803:90a1:ee0d:ae19]) by
	HE1PR0201MB2265.eurprd02.prod.outlook.com
	([fe80::4803:90a1:ee0d:ae19%5]) with mapi id 15.20.1580.017;
	Wed, 30 Jan 2019 09:11:49 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] Revert "gcc-cross-canadian: Add symlink to real-ld
	alongside other symlinks"
Thread-Index: AQHUuHvVqX5aaeYDckOGOVntt/ogTg==
Date: Wed, 30 Jan 2019 09:11:49 +0000
Message-ID: <20190130091148.19819-1-samuli.piippo@qt.io>
References: <20190128124739.9175-1-samuli.piippo@qt.io>
In-Reply-To: <20190128124739.9175-1-samuli.piippo@qt.io>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.89.120.62]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HE1PR05CA0212.eurprd05.prod.outlook.com
	(2603:10a6:3:fa::12) To HE1PR0201MB2265.eurprd02.prod.outlook.com
	(2603:10a6:3:7f::8)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0201MB2458;
	6:u9I70Fq0nwpYvdTBy7Lf3h7SNYPSx/ddy4qx9TddEhPqcrD+ZPnemXntbFb6IqAqsXYInmuM9EMHeK0aBNuSkO3X/uEihAfELgtJqmj9xyARu+aD/1y9mRPk/Rwui/UgcI9MxqcfRyKKW3UE5bjL4g1D8hdIWx7u6emEXaH/UJQK5myyvdcITS0ifNeIrgclYdXYfB5QU+T0EPI9jmy6bPUMQ2VLIxzPR3TIz4T19RNq+rototPUGastRY7g1LTJD0zrClukG7hReBK1EjkjWoZ8jjiiaytYm0tLH4lchTVjlWRRMdKpQobWLOo9NbC2zmR8R7AJaBeoLKNvNJzFNbNBHFOjSeacEnGZ/i/swYMFWyuKJld4c4G0oduWMyP65uvLrnEzOZtXDqBwkMKyKj4qu+KWUmB/Cxc2xDK/I5Twimb5ppPy4n0zBjL5QnZ1uMGW7uk+lyhHoFUxGEfh7w==;
	5:HPi2a5I/PVvWXMXHYnxdP7GU5F3zDlKn/creWeweAqWQpXPiEkfCmCJez2E8SyVAdScHBRArGbS7YuZxJn0Ef/UybVy/P+sWHmOAFHe/wbM7VJzgd0j64WMc4/kyMN3CAV4Zd2G+2hyBnSrjqrJYhos1gKFXriNzM6B2Ce6iZYKgNEOSOB37iTqIrC09lhSmq61IcNnrvxgEDZN2585VqQ==;
	7:vpr/r9qNDnE1ZtPqhI4k7NZTZQDUYLY2TVZXDkBCi0O2Ud/fHdKK50xsFDjWxzuvbv+dCmawTvDQC/pJRp+kus+8Rj6btiXxLTToiXWneb3Nnv+lH9rQ3t6UmqvLaX6uiojLabB7S6MN6VD+bisHxQ==
x-ms-office365-filtering-correlation-id: a37c0297-db6c-4bb6-52fc-08d68692f772
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0201MB2458; 
x-ms-traffictypediagnostic: HE1PR0201MB2458:
x-microsoft-antispam-prvs: <HE1PR0201MB24587426620ADB8E15DBCE4DE9900@HE1PR0201MB2458.eurprd02.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(105586002)(256004)(71190400001)(71200400001)(2906002)(106356001)(2351001)(102836004)(6116002)(186003)(6916009)(66066001)(6506007)(2501003)(446003)(476003)(386003)(44832011)(486006)(3846002)(11346002)(2616005)(4744005)(1076003)(36756003)(53936002)(50226002)(76176011)(305945005)(7736002)(8676002)(26005)(52116002)(316002)(86362001)(6436002)(478600001)(6486002)(25786009)(97736004)(6512007)(68736007)(33896004)(99286004)(74482002)(5640700003)(81156014)(8936002)(81166006)(14454004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2458;
	H:HE1PR0201MB2265.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: No8wXkbPGVETXAnf3w/0u1pHUHSnWeOZZ1uvVNdHpPVdC4nZ7D4xWO0ovY5tHQYWiDeYv3OF/Yi0aM4aO51cbPVqx2yVszw73/LT9OPYBygdAV4ZPNceYevaL+Kf/1rP+mzJjcDusB6pdg4/coqzqdMfC+mWxHDqJMWqRScktCZZQhqTSup/Q2fBNClIIaEFSwzXZhhvyh64S4ClkNlvzcm1XC1f85TOKIMbUy8WHl6p4vZQd9DG55VdPoaqfRnoJrONoCAO+Un/UoFNHwngrPN3PM9yJ5WgWuHRVoMKf0feYgGoqVGOMYng3pIjkiXS0c/E4gylGpx5aT7cMLGyEUA/jM1LdNtKq5X8MWLbq0gzTz+mZXW2doefETBNVIxSNiILSX+tzI5zr2wguFYW/XJJu1SNt9OfojqTUpjMS0c=
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a37c0297-db6c-4bb6-52fc-08d68692f772
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 09:11:49.3935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2458
Subject: [PATCH v2] Revert "gcc-cross-canadian: Add symlink to real-ld alongside other symlinks"
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
X-List-Received-Date: Thu, 31 Jan 2019 22:49:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This reverts commit cdd86896c8d29135f937968e9aa07f919cf543d3.

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


