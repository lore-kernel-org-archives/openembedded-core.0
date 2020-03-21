Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.48])
 by mx.groups.io with SMTP id smtpd.web12.3552.1584769806539171280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2020 22:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c6BW7J4Y;
 spf=pass (domain: windriver.com, ip: 40.107.220.48, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbhIfN90jlqVeHgboHoxdAFaSDYzpw5cl+Yw9oZnuBHJS6awCrqKXGDdZ6X0yGjijQzgmzwrRjztX4utsYAxRDOF7rCMRP3h2QRCIBO72DKUZWrlAfHgejYD70Sn1p9v+rk6NFgWoHV5u9qpnlYfgQcPm4NEPY1dxb9uTAjETdaBmPVjqO/WSBTWTxJLUiAETtTFKBWbTbqtlJPBO9ssc+9IWkSgW7roYr2jTnxR6FDn0HiNpXKaAMWCmdTWjZKDU1N0TuQOCET1ZbRhMhHv4vtLsoHgjjxlT4Xo7vX4JRd+6ij7CSqtB/Lt6zfObL99HTK04SieMFJQr//yD9T5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xHskKid6PHjC/4/mvqKxuchVpsjAJviuHxn3oJYntM=;
 b=MBeOXGI+hAnjpuawbJkcaqVyP2ozaVZ+u1nTPaCG6YCOt5iFVexf+UM3O7J+0tpHwtx452shdwx0L09GLmZGey0v9i/yZpsOhBN34xLjOpCzigLXUodoKufyPcK66SWUJvWT4xd1yE1AoJJ0TrhWPI1l1LoAW299VQK+MLMhOBAPbCDa5c1QM9aCFf1Egf0RFF4uCQ7DdDf3HooHHt3q8Dd2GbU9+8IKz9CvJ1wAUQXKMj6mh9KWE4x1euWBgTgPye57YAiPO/u/QNVC9C1hdDZ5aHX1HRFaZiKx9N9NbUDBhG/0YS4TynYQPzf9C1oNuwN0H7xPNlsLBxYuIbBfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xHskKid6PHjC/4/mvqKxuchVpsjAJviuHxn3oJYntM=;
 b=c6BW7J4Yv3lr9/hNoY8PTudjNnHIZTQOgZvy0GcYZs2p3uIAVxCD4+/uZfdMm3I/SA0x+uuGFhIhos1xUU42d+gB57I6KramkoSANUrFZ86RIen0TC6hqFSE15VbUxcQTOnYlx6U4o9XupuVOAJ2EwkdeWLCcuUqqq9WHMZnC90=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kexin.Hao@windriver.com; 
Received: from DM6PR11MB4314.namprd11.prod.outlook.com (2603:10b6:5:1de::32)
 by DM6PR11MB2666.namprd11.prod.outlook.com (2603:10b6:5:c9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Sat, 21 Mar
 2020 05:50:04 +0000
Received: from DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::51ee:49fd:5fa4:3ac5]) by DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::51ee:49fd:5fa4:3ac5%7]) with mapi id 15.20.2814.025; Sat, 21 Mar 2020
 05:50:04 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Kevin Hao <kexin.hao@windriver.com>
Subject: [PATCH] linux-yocto-dev: Bump to 5.6-rcx
Date: Sat, 21 Mar 2020 13:02:18 +0800
Message-ID: <20200321050218.33726-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
X-ClientProxiedBy: HK2PR0401CA0004.apcprd04.prod.outlook.com
 (2603:1096:202:2::14) To DM6PR11MB4314.namprd11.prod.outlook.com
 (2603:10b6:5:1de::32)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HK2PR0401CA0004.apcprd04.prod.outlook.com (2603:1096:202:2::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Sat, 21 Mar 2020 05:50:02 +0000
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 320748e5-962c-40b0-57ad-08d7cd5bb3de
X-MS-TrafficTypeDiagnostic: DM6PR11MB2666:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB26661A5782DB3E9CC4BD0267E2F20@DM6PR11MB2666.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 034902F5BC
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(396003)(39850400004)(346002)(136003)(366004)(376002)(199004)(36756003)(26005)(1076003)(6506007)(54906003)(4326008)(316002)(6512007)(186003)(8676002)(86362001)(6666004)(16526019)(2906002)(81166006)(2616005)(956004)(107886003)(8936002)(81156014)(6916009)(66556008)(6486002)(478600001)(52116002)(66476007)(5660300002)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB2666;H:DM6PR11MB4314.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pFo1R2uVTd0hl5Ulm7dcsRyX6QXqrcc2UXZjuOfVH+J7rcpDfjfm/h6ZMH56MwPp6f47ck2pVhZ8tbP1kBBSiilyPP9dm2ngAK59PK7rrN9GLZhF9yDidKTTJy8smKbw9A/dcvkJwykSZmpC/VsSgoyHrxnKBULp3JwKswafNUWEfIfqE/MWfjWWb4NSSAd9bMWCDkSyaB7GT9aqTevPUQh/CNIvntevhabowl3pg/UeV/c044kHEgEFYEXp98K0gzr/Chd9Y69yt9fADNwUUxvdIh0pdCyb9elM1+uQkCKj3HYoIYz4SZvmrKaM/2P19Wsy5nlBev4d3bSFQIWJB7Vod58zg7v7JxdZ5Owy4zu6i7Z2uVTyFLfFedOutULnkxRmGzhoqO8W0MJry+wEbC3Ey59MfGvISFBZTGZyArKNjRU4fORbHLwchl8BLNA/
X-MS-Exchange-AntiSpam-MessageData: 
	0CKFWTX4tw1TARRbwZPepMRVLaJO66M38CMKgo5RUhQ9PYRgHNFNjHH/OAl94ZFzrX+pCBWFGVf7mHakaWhkxnyky56KxLke6H6V9cYS/SAUFlqrZFK0E9RppdJHS0wERa0bwsw8cD0pXmz3HNZLVw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320748e5-962c-40b0-57ad-08d7cd5bb3de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2020 05:50:04.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/enQKHntBBdYqzvh0loV/OYDfQkLupBUPSDg6R/tInR6yGqPjypgRIL9/yczQWnD9eHEhR4Q1rRFet7/vIJHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2666
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The -dev kernel has been upgraded to v5.6-rcx and the COPYING file in
the kernel source was updated by kernel commit 74835c7db032 ("COPYING:
state that all contributions really are covered by this file"). So we
should also update the md5 checksum of the COPYING file in the
linux-yocto-dev.bb in order to make the -dev kernel buildable.
Also update the LINUX_VERSION at the same time.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-ke=
rnel/linux/linux-yocto-dev.bb
index c364a97cba4b..06a9108fab49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,11 +30,11 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-dev=
.git;branch=3D${KBRANCH};name
 SRCREV_machine ?=3D '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/k=
ernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53=
970c60e", d)}'
 SRCREV_meta ?=3D '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kern=
el", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970=
c60e", d)}'
=20
-LINUX_VERSION ?=3D "5.5-rc+"
+LINUX_VERSION ?=3D "5.6-rc+"
 LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV =3D "${LINUX_VERSION}+git${SRCPV}"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b881=
4"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e4=
6"
=20
 DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d=
)}"
 DEPENDS +=3D "openssl-native util-linux-native"
--=20
2.25.1.377.g2d2118b814c1

