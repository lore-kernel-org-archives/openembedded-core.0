Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.41])
 by mx.groups.io with SMTP id smtpd.web09.7877.1632232450259740217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 06:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=uei3VkRS;
 spf=pass (domain: outlook.com, ip: 40.92.75.41, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbhc5nybmcS3Bf4RyZaC9ed4Kt/3kXs2/TWDCaJz5RU/TnB06vA8IPRpmxzxKXFFKxX2pkZM2pE38FTcd2pznPW8f+ZMYZu5l7yLWf6PA1aiUsPG0a1twQHcThsjIL4kQBGJ3y7r2QrzdNOvnCH7mulK+FUwt5R03STnz46GCbmCkm05uTJ9k3Lc/rWAWqYmpo/MzuXPeCXJLOhqFWyWnUgPoTKUlC5ol+YOIz0EhCfGqaENYNXtA/6OVirxSDUypbiwj2dyX6+YyL9Pgulj/P5ry7i8Yn1/Re0wYfQYNNQ0EfjrOe/HdBRshh6B+hCfGQJvFiplzBNd7BZn1TsVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=j5xF6lkl/iuwIgFlq9pyDwhlDsvkNRkWOjOIf+/UvfY=;
 b=ZUNeZ94KT4MoJ47badWeMFsRRgaZoeXbN78X5j1Mcg6xJDdmD1D/aNo1LJkHq+8KWZrVHiG+yHK7CyZHeXl78mcKWLhndR6mhZ+DH2KHBaESn6nNGR349+L9+E+8FiTtZurtIyVOEZ9WKthhCD7Mony+ciT6rKxL2TkHsECttGa+Dka0d3LXBvb4k87fsgPfHaRkvz+AEoPd5UEFsmjIt5xhIODbYs9ZF9Dbwbyp2lbQJm/2WinzsbTAx2VSRRt60lB/fKnAJipjXrcTMPPnN8KqH4TtvTbk8818NzAWVRk2Excp+Oql6kaIHoWd1b3twl2Ddg44fJIjAXPnQAELkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5xF6lkl/iuwIgFlq9pyDwhlDsvkNRkWOjOIf+/UvfY=;
 b=uei3VkRSETY8/MRr5dXaq7hXeLEg1BxvpT/6O41I1vNNxK7Hf6aB/3zOUl7cEzrI/vZMSh+UP6jsDX6A9pNir7JSDTSBFzNihECgYzEfR/g7tFnOCK+XB7exoIWXdLK+53NJhn65PWzzL1c2r0Dj2ztI22cCUrv7MezBZgLlOKo/yKCzYcEBDgOoZgh1VAC52y0zro2wlQqYSBIUUxUa8wI70p38XqWNv17ZLpJm3s75uQENcBuo3ijISIIobQ/3AO+0A+Js9t8ycm8D95F5IGqSTn37DEViw/RWDVgwwzTdUqCeDTBoR9m0sz2sBRaAWCFH7j6PQxJupqCg7LPn1g==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AS8PR09MB4902.eurprd09.prod.outlook.com (2603:10a6:20b:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 13:54:08 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::60cd:7afd:e00a:1c6c]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::60cd:7afd:e00a:1c6c%9]) with mapi id 15.20.4523.019; Tue, 21 Sep 2021
 13:54:08 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: anuj.mittal@intel.com,
	Konrad Weihmann <kweihmann@outlook.com>
Subject: [hardknott][PATCH] expat: pull from github releases
Date: Tue, 21 Sep 2021 15:53:44 +0200
Message-ID: <AS8PR09MB4645E56D5096A2E81EA54012A8A19@AS8PR09MB4645.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [gHgLTlB7/VHWw66MM+9LM9pVbp3235DNpZwZ2HaUQ1KNlyaa5KglXwYyVv8Ytm4+gKTp70kXxXI=]
X-ClientProxiedBy: AM0PR02CA0136.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::33) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210921135344.3995286-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:8109:9a80:3b94:11df:cd87:699f:18eb) by AM0PR02CA0136.eurprd02.prod.outlook.com (2603:10a6:20b:28c::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 13:54:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11b79e79-eeac-4d41-320c-08d97d0747f8
X-MS-Exchange-SLBlob-MailProps: 
	qY7UPrLqMbYQFWZzk4qLCwBH5XeShYkZ9SyJ+3Raim9UUOz5vB9u/cXf221yULhpKiBUh6PeS3M1f7b4z+Jgy1B/nZibMWHB4DlfX6ne33wxC3jeY2+WqU25mN8Q1P12naU8U3eC2zbfdI9bXSlp6UcoY95r6EcPbEGyIF9aB6fEUdVJ7ClN6lgObGjdm5Mz/TNSDozwl7FB5H4TdG3U4jv6dc8JQHCX6aUfjoZYM6HrBow2k1KAtSVp21ezT9Bca9wYufn2t4Xs/NflpUP3Azu0j1Y/CcN/RWc8+Uwv+7C3AxINPKlS3gcjkuTLVPOE/9RrEtpJ0+wTLVoyHclhL/9fUCnVomh+NW3LRBNQkxyNPaoWwdCa7aP8Bfi2ybRpx1DodwQrdjWfUrInDDe2CebrSMfz+6nC1g1zs+rGXwC2XuFc10If2n0tD5YriIKN1Ww6snYZCyHcM92i9LC704R1/yDB6J25+B6xDZ39rtQwxN/GNL9LpO7QFw+H3Mg1CtL+xUBeZ+6NM5qji4clJZ5tQWBfj8vAZsEN+4cXFS1y+Z0Bbt8C781JX7KKl/RzLXBe7ZfibSEoWcPf+2Qg54y9jRD2G7yh1cICkENiuzVow96l/lUT7Daw6rfJ2CCuwQrOzvwNbY4wDQhY4jwtHpSwDf/qrRt9zaZxbh0JPrB8JLIE5YxO/qh1WTkpGZs04/fVV+ZpTU+PIblfwldqQQ==
X-MS-TrafficTypeDiagnostic: AS8PR09MB4902:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QYGVZOG5BGauVGR+GCXLYpHpqWxHo1OeJ6gzIpfX/lyKBksLRpofuxJfhUdgr/5PlNt4acP8wTOvHfrCmgI89EO6RdVDSkdNwxsPrSMfkBJjPsgPOx69YkaFrqNRYTxt0r97qcoXUvh8E6wlsZgpjtMvJL47mhUHPKGjXpTSl4vSttrQEkeIXk7hpH0idg4ZUSabMsKj14e+Jkja2yHn+KXuQjV0ZR/luVvcNKO7UMKOgPos7cVPJga0er0OM7xwbKmkXm4MZk0NZ9O/JagZeIS/I7F+bor3jtkq1wMV0cfvYcXvnbEHEHw3jjqqmWm1IYk4oanLZ2LzUpwI6FiH1hDlg9grK2COuPe4vgnUAHsTaRajpf3quxTecYOzaqHAvICqWZp+/AXD4kwZWsnIDlUhaY4n/SzB0C1AuJXc2zadb/H4KfbiquCeJErlxWyy1I8yBjvFfYdJDr9w+AZKUD4wTCSTL1T/jbYjw0yw9akPH4aa5tlww92pkZi8+Kq1ZYLwIOknZO5w9aQ0W/jEbw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	73pYCOSYH8PR6vmt22fTBfurHyzCsWdFmI3lcCGbgQuXJQQstMcLt4FAOUpl33dboNa94V2/Aigm9yCdEfNINQFt55BwQPhYwSjTR2ma/LH/D6al9rJ4O6i3mcn8qLMNg6EVs7ZxAHLAtn4KMCrKy9SMPGuv5drfud/aHhcrpBJ+YmRr6SWJXxmiEmaEf1VvHHuj1kuI1CMwlrdJzhC5dw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b79e79-eeac-4d41-320c-08d97d0747f8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 13:54:07.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB4902
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

sometimes we can find release tarballs from sourceforge are not fully
distributed along all download mirrors leading to fetching failures,
depending on what download mirror will be chosen by sourceforge
servers.
As the project moved to github anyway, it's better to pull the tarballs
directly from github releases - serving the very same static artifacts.

Add an override UPSTREAM_CHECK_URI to enable devtool upgrade checks

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
(backported from commit 2a1743ace5aa41b188f77853d0f00c9e5a359c6d)
---
 meta/recipes-core/expat/expat_2.2.10.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/ex=
pat/expat_2.2.10.bb
index a54d832e52..08e8ff1cea 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -6,12 +6,16 @@ LICENSE =3D "MIT"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9e2ce3b3c4c0f2670883a23bbd7c37a=
9"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
+VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
+
+SRC_URI =3D "https://github.com/libexpat/libexpat/releases/download/R_${VE=
RSION_TAG}/expat-${PV}.tar.bz2  \
            file://libtool-tag.patch \
 	   file://run-ptest \
 	   file://0001-Add-output-of-tests-result.patch \
 	  "
=20
+UPSTREAM_CHECK_URI =3D "https://github.com/libexpat/libexpat/releases/"
+
 SRC_URI[sha256sum] =3D "b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794=
de278af72135a5"
=20
 EXTRA_OECMAKE_class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
--=20
2.25.1

