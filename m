Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0128.outbound.protection.outlook.com [207.46.100.128])
	by mail.openembedded.org (Postfix) with ESMTP id 53E57738AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 22:48:10 +0000 (UTC)
Received: from BLUPR03CA001.namprd03.prod.outlook.com (10.255.124.18) by
	BN3PR03MB1414.namprd03.prod.outlook.com (10.163.34.21) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Thu, 21 Jan 2016 22:48:09 +0000
Received: from BN1BFFO11FD025.protection.gbl (10.255.124.4) by
	BLUPR03CA001.outlook.office365.com (10.255.124.18) with Microsoft SMTP
	Server (TLS) id 15.1.390.13 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:09 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD025.mail.protection.outlook.com (10.58.144.88) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:08 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0LMm653012064; Thu, 21 Jan 2016 15:48:06 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2016 16:47:32 -0600
Message-ID: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD025;
	1:+zDf7wQZ+38Hl1nkQt4lSWg3RzOyyDmZSmNFz7t6A4GL/eV2gwuMqPaIw27KXsgObeNdj+3KZ0R20QrIJyOO3jhSBU+ELXRjKI9n7d2wsSyBqE5czeW+JRWgWgX2A5Y3dANSC6JWPwJM03t2fWURXrtvu/WyV9lJ3MySyP3BFk31+PE0U/IH1uzGzVdkkbY0olbpNnzH8EGzDHzMEqBwWfRn6ymbilNLCmFkyIsXCsTEd/i4qpvYUzP/C+MJFJ/KMQGuYk0o/1x3mlnc3sexUdifOWvIDIJ/NEpiK7fcKCKtvmHgQYx0I7CRehuyD9inEKxFTZfEaT5TF5i3SfY8rZLrdmhXWnJe/jer2VlEyl811CaDpRFIGo3WUxMMkvaEEZYO9zcpSKd2V7gqGF8qfBzUV1sT4RqpdtjxWPoImyaAJXWusAySCsHX/Qu4r7xglRtbT/yjbQPvl2qrl+hkOtGxIG4IQPjVqmIUjvqJ8GU=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(189002)(199003)(2906002)(19580405001)(4326007)(450100001)(189998001)(48376002)(19580395003)(1220700001)(1096002)(2351001)(47776003)(5003940100001)(230783001)(50466002)(110136002)(86362001)(5001960100002)(107886002)(53416004)(106466001)(6806005)(81156007)(97736004)(50226001)(5008740100001)(77096005)(104016004)(50986999)(92566002)(85326001)(229853001)(586003)(4001430100002)(33646002)(87936001)(36756003)(11100500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1414;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: a6488cb3-e3fc-4af9-5e6c-08d322b4ef1f
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1414;
	2:SPujAKb0YA9W97CxR180NMnoClOG00E2okcoUfxqDaZ8RcoYsZ2/lluAyjAA/ENutSCrxj+TZ3FhZbB5B6cPe4Jce9ru0oQcS+40Ved59vZ+dzwQfMi/+nOjLEqBd/fAUVWVmNr+usfPVhR0fEJkQPdIQurFEaDcT/n9tkiFZJyOt3lrW1A4qoTHDb5pDEqB;
	3:uJpSlWpIEG7oSB0OyYMt962qYfuvbMs6WGu8W4Wmjk7IualVInns1sptalDDGUs6FD7mdsHarEChwP+prm1PM+Id0S3/tkUfuEXcFfsLuU7sFD/QQ1VicUHTALbXQWYHTunAugI98xzWDrvgr1MTOsXYNilpGl/mPODj463VWXfsDcIDIZTwCUQ1lt9Zw9vvwF1jUPf0hUZYHFHcRTVJvf5+pvalV9FCTx05I7ZWE/U=;
	25:iOk07ZGVN/saxdvNEtVKyNbJ+Uk329ejXHTYhy7lY+ki9POpNUI+CEQCYMWi/5CAZqCmtRqLKRpzKFA8E9cyBtiYYAx/T7La4QPQIgvj+L09aNBssTEi0nq0w1oCAW113J0WgsgFskwGJZX3m0+p6WeDSenIJOuexjZLjjx5W8hAsxDVBgXvoxRf34eazDHck+J3DNs+qIA0890upiycTwOoTUxYH1TQBqR4vmHlPzSFfNQ/JpScApNN9OqeKiDp
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR03MB1414; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1414;
	20:siXck+8ZhrXf7/miBbOuCKEiP+1vTfF5lh30YQ8LzFo94icVqfOBn2zG9i8ZHaYwxaQrq2tpC/zZJODVpgWuO1pehRjlbMYviRWDQFKUzTo7ljbDCtKwOw7Kh+t8xpovMKRiGY1mf3GA6vJsSNJ9E8xthrzs7DukkRCtkKXvR9NwtNW9cxF1fQx0VUU3ie+CgYpfy4CQZmCQXpmihRZpDzR4JVXDWMqXRJYadzk5f64s/SgE8Tr33SGjHBSmv1p/7uAEZ4o7ldJPt2ryFIlKeif7YGQmzIHD0jHHQc2AeUYIrCR/UklvS/JEiIV/tzbLuO7cIDneWWlI/yn/nYKdCp4BBFGSLxskUziQD2n7yVd5vsdwZN53wbAJBEwlu7rLNGr87n2CXubh0384ck73iGVMwalHMn4qUinmR8VszHmJbqgTw/da/Xs7qgm7Ju/k
X-Microsoft-Antispam-PRVS: <BN3PR03MB1414BBDE3CFCC0075E0CC417E8C30@BN3PR03MB1414.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(123027)(601004)(2401047)(8121501046)(520078)(13024025)(13017025)(13023025)(13018025)(5005006)(13015025)(3002001)(10201501046);
	SRVR:BN3PR03MB1414; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1414; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1414;
	4:RwCQMYTNtX8Vp/Xxe4f4WwQc+MyAD06T1Ca5DQ9IGgxoDcEOCYbeAnLWZVQdA2zgxwXUStraCzgKJP+SHHAkoynkHgzdaPbqew1PTDKP1JB1uLUI5H+J9Tz3QdpC7MdziwdA+CPtd8hPZxbXt74nu5c/ctKZAHvaXOar+qAEGo1hKPD/AhSvV6UQYKk0P3m6R1Ted0VvDyvBs5mgC5ItpLvpUO7MBbaw/BG4RNdiGBJPJ28HEmGx7aSwPoZZUrB3r0I1M3HYzITFP4BEGnCfDe5XpzLtE/Otx+slBrJk5j/5m9gjQ1eSXf26UiDVChxkl9R18vAdyAMnoe+U9PDUz0/w6PjoWIVS7bXBZc8bvqU+K1zTwn+NoI0zHhnQM5YIRv5M3/WyUoqMp4fDXp6JGlGrJ0hRyyH3GcwkosoUYU8hcvv2fo9/YsDfs2b3sQoBlv5PLGX/Kvo/EOfcGAoPa5sV/s3T8wHEIrATZo6MelAU63laOuXKdAf3h1ThsxYSZg2JVeO9QFpPmQZ/d3fEYsMoQifd3PRCLZ3oO2E/5ho=
X-Forefront-PRVS: 08286A0BE2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1414;
	23:ARPGLFHXqskizya1J1DhHWEzDEnv7RdRJn36GbxX+?=
	=?us-ascii?Q?fHu0vsyaxYEwFa4ERd2zjZhLSRDPtUamsvqay2AHmgT34yntMk+sR8P4sgaL?=
	=?us-ascii?Q?OtDkmujuQKHBlB0P4OAA0aRhXgcZA4OFvX23vu0JZi9akgLOTf5oxwA6HKu/?=
	=?us-ascii?Q?aHu80TRqq31x030a3Fdu9DPBHOkAZUFSj9Ojtu+s7g5YtfPcaFk3jPULEVsq?=
	=?us-ascii?Q?Kyh40w1tI6ktFc+c1DMzkTZfF4NR9t768kK0qppwnX0+DszJAOo4PJwOAvTV?=
	=?us-ascii?Q?H9suJk4PWDbKx4ZudcDyOJOJnAW8k4zNt4XtrvakSxyJgLCOUufZT0Va6fE1?=
	=?us-ascii?Q?JV/dxg4WI3YcwpWASXmpukjexL1eyyqT1qkQavkX9U982kh1zs39oeNZl8Gd?=
	=?us-ascii?Q?sFnWNfP14HjnJiym3rK5fXtmEe0SrnW62hRpUiZruEQCGdxPv3tOrOYVtUwG?=
	=?us-ascii?Q?b8dnLLF93GkSUxoKKjSytING9kxkJlaC6tfKqvKc386EXX9wZobBdXlcONtK?=
	=?us-ascii?Q?qLfBpbvKk1hAelgtEjndlFZCT6W7iePUmK4swYtpA/HrpzC7/t6lFiNNfsj9?=
	=?us-ascii?Q?zLDG6oC7WoT01O3uIbSfhM9eojDeq6GMoSfCU5IrEsxTzV9si2s8ihhVQtNo?=
	=?us-ascii?Q?euoLIM8X3Uzp3DdJz1R5krwFEwWwFsh7iZzxXN2kgfdTuFjZEHe8OoCWwoOW?=
	=?us-ascii?Q?QR27O28murFqlHGZvXlrFvYwj/ZxWPMOFPWKmnIOSqXTxmrXLEB7RT/qt+ap?=
	=?us-ascii?Q?lZJ9nGpP5n451lT9pYMONI3P4jPDz9zEiAV3s+Ox3lE/likYCpr2h05u0h7X?=
	=?us-ascii?Q?cmAKFUEeTWyAVRcMcD6udFj6nryg4b2yl5RIp5q4ffsXiX9DLP4TVZT/K5eN?=
	=?us-ascii?Q?TiVuMkJ9iEXxzedV7BOOPRMmx1V8KOz9KazELDY76kgeqL+OcUi5Xf/NHFgT?=
	=?us-ascii?Q?C4k0a0W5ZCLfOzbPHBabRA0tPP3pXHcq8hu06iB6X0Sxi65MhHFsUv3OPtX7?=
	=?us-ascii?Q?9PyLpUvN4VyM2QpY9vif0sTvhxEKyYLOkrLw8Iv9av10i10zxN7nEhG/U3RF?=
	=?us-ascii?Q?zm4yGyWQdNn0qsDy+gyFfCLtSvhzBTzyf1yzKV1TzfZ9Kl/PUs+YpWQ4OEy0?=
	=?us-ascii?Q?Lgj5+8a9IuFzptlqOZVvY7j+AVeZup6?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1414;
	5:ZMDA3Kqdkqn/EodamfKBkazDeVraQmdY7Z7MrHmEeVQEvATI5XeJ+L0jk7aciMMtupIO53QJmuA8jyednQct0xBB0OXkLo1mM953xPPT5TTSs8P7H+m0q92fc0de5p05Dg0wVWa3q9zhweB33pwEdw==;
	24:dhKCHKuzRoA7rVcCExyvy+Snj3e3XDWvUQ9yF8RBGDejaMoag5z9hSqKZwanx1+2fMRkKFcThnDKT7HWtwBnUoZuvqtz3s7sW02FWVzA1aI=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2016 22:48:08.2060 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1414
Subject: [PATCH v3 1/5] core-image-weston: Add XWayland option to the image
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
X-List-Received-Date: Thu, 21 Jan 2016 22:48:13 -0000
Content-Type: text/plain

Allow the user to add XWayland to the image via the xwayland
distro feature.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/images/core-image-weston.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 52e271d..6dd49e7 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -8,4 +8,6 @@ inherit core-image distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "wayland"
 
-CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'xwayland', 'packagegroup-core-x11-xserver xterm', '', d)} \
+    "
-- 
2.1.4


