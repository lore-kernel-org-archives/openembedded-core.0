Return-Path: <Neetika.Singh@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B6AC43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 12:45:41 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.64])
 by mx.groups.io with SMTP id smtpd.web11.71237.1656938733241960804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 05:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=p9kye1Kg;
 spf=pass (domain: kpit.com, ip: 40.107.239.64,
 mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atfhAKqJg+I9R7Z0GcFnvqSrLq++5qgRWGcYNcRCfJzowjhGED/yV8C/K+BGaioDOWPgrGF3rKo/+fgyUp5actmV7ksoylVSTWXri+A68MAQZhL4mYnVJhvMJcXsD+j6qt585t21Yz4KKdf9UrmrAKTFXWQlqIyOuSCcwG4bGNfQEMCu5NgqnpTvCl4er8MxZYvbwW8A1ru8z/OB59VAyXCe2gNnBwV85PGCvITE5SrcvOlbkuSr/R1+YtYCW7chaQXFOB4MgoQc2e9KdD3IfzcbCs9RmutFQSDL8zwus6WynmFUp8Z9/5Pj7A+Y7FVZm8McsATSNLIEQctb5UPITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfBTQdBxjEgCOXGjEap/EK3rLukwgmHQkQYIFCTLazE=;
 b=lwAj7dnwce8Sa8OzuxvGYaC7v1H83HlZrMqZGXTvo1IL9l7Bob0+nQSRomTdaxAV/ExxphBhagEAD5+eeewh0gRdDUdAkQ/m/ry5K33zSYWSCCEzXicbc0jyGeqYyyoVeRKKBrAsGBaqHdt1lIC+JnVgv7Il2PctNNdTST/fQ8wahQpX8zlxfSRAewdSddfUqPI8zpNTa465WuctkLBLGI5+k/dsSFlmsFNnJKOMvOLQFbe5QoN1DFyWLvgYK54SPr8PJC/OIn6Fzftl63+yxY1qjpg+wGD1s83fVpDuCNEWlckYdi+s+M4f/rVFFfRDg+Jk1zjnoDt7ftzpyhNnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfBTQdBxjEgCOXGjEap/EK3rLukwgmHQkQYIFCTLazE=;
 b=p9kye1KgLe9cGnqhwA7mbOAs49v1d+4GGa+ZaShNlgPnt3hkAX6YlrCNWOMONqiFZMEEhU5S+Xtf2PvHh+YbgCgR4+FurAXn4VVKZJmXSbVhMV8nlqroeHDolPn/J4YfDV4rdHnGnoeKs5LEbxNxzrEgpQ+XtT5rEWAGObAvmMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:29::12)
 by MAXPR0101MB1724.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Mon, 4 Jul
 2022 12:45:26 +0000
Received: from PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d87d:de05:d2d4:7a77]) by PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d87d:de05:d2d4:7a77%7]) with mapi id 15.20.5395.014; Mon, 4 Jul 2022
 12:45:26 +0000
From: Neetika <Neetika.Singh@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-java][dunfell] [PATCH] xerces-j: Upgrade to 2.12.2
Date: Mon,  4 Jul 2022 18:15:11 +0530
Message-Id: <20220704124511.16872-1-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:29::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 606eaf77-f0ab-4097-6e36-08da5dbb1153
X-MS-TrafficTypeDiagnostic: MAXPR0101MB1724:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WRKP6CWVWx0pieaCvj0dJ4kb9nEHIYrwiKxNlLaQ0r+BPTbB+92pI17z+VgGnbNWujz8FzmdVESRqdLyGTDtJewmHkfB/B4eRNIMarlsTYjTBJDK9SVbBCOu4W8jDsDHtjKKr3WXrX5Y9lX0rYHpqvvV6+BSD3X+RElztAIrN5Wd2gEu8CXxQcR9ZrhBA8YxUACm3xx4CXownPtttkc++iTX2cNKxEx20zhlwRykbJNrtWEOod/RJoJnoi5yhYuIEIfbTKEwEDHrShRogiBmGSZCuBmEN+VC/H9UnDgwmBhtWKqJdPnTPQOLhBRijYXCno2RLoXaOhEXoAtlARTvSejQ6BCl+C8CiN35p1uOt3q/znQGulO8lewR5+2fwHdGaZDRJ4zKftaRgVirDoEI7XvrrOCnUUSXYTLII6EgDUam4NfXK8wQgDRPO12AvghCcWMAcK6iMG14S4PsaE57eNEdk4qXdoOYeI2gZiwAfs/z8PIxteATrWIN0HuKVpbPjTHj5D/kHZ7+sUTeNQdSi38apXG+XuglD1N5rROjaMrGqt4fFIrZdlr8cnyiFzR4llgDBgqEGj03ayyAYqucnlMXhVbyynibfv31TtsKHxLcn6S7klIaJka/Dtqs4RbUqkCQjgkq4B/XvMN6eVtOHazGWUc+XGuF73RD1xQnc3DwzeRfds4e8ZiTOFoWb0ykryfLDjQ/luM+hSxeLAOxxguQOXDBSmLvpNI4Ge9Q6gU6ciXEkE9YZSqEKzo7mUvn64qGQ5d4yD4KJiJzVwUtRQcj2nQpeElJ62mDMcYTEOg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(6506007)(6512007)(86362001)(66574015)(6666004)(38100700002)(5660300002)(52116002)(8936002)(36756003)(2906002)(316002)(478600001)(66946007)(6486002)(966005)(41300700001)(1076003)(186003)(2616005)(107886003)(66476007)(66556008)(4326008)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+NdL0/tN1wn4/yi2jtoGcnuZ/r8g4ys93SOsJxlc0hgtlw3DTFlXWCMsvada?=
 =?us-ascii?Q?dJ9OS909vRMHjwZp/e1CkftkbSG3NMpUOFfJ824RfR2ZreEvTYYErNOWiObM?=
 =?us-ascii?Q?D4+TTsZf2PKTlCgfvDsvQlBTG+dZ5rXIXe3fejn6fFatJTrhlmXppIH0WwV2?=
 =?us-ascii?Q?AkZ9Vc4fbdYG80mgPcTMFg5GcZGaYW7ReLsryTMjXBH03jS6lAsEP2FKoxRF?=
 =?us-ascii?Q?5Su8YlifgTR+xKNZFM2rrXC1507XO6NWKKVzVG5jeXpHfYv5Th7dvI+YnFJN?=
 =?us-ascii?Q?jBQPV5dxFh1v0ovZbEp4EadIAJnStuO39DAD7uvBr6YizGf6buQABxWwJquq?=
 =?us-ascii?Q?X1Pl2J4VNqNtXEFuQA3tlMDqJ2oJh8/tsxyLvUSp+/hYiwE4/qCZdDkxuaOC?=
 =?us-ascii?Q?x20GDr/PtA+pjDPW7mG8H5BafsXJ5GhpBFGz7EUm88cuLJ/vaV9Qi4gb+FSd?=
 =?us-ascii?Q?4Uvvi+nhx8DO2qI796fM7MnaLEFaniYL1rv1JpVlXt59VMq4MqW07wQ1w8Mr?=
 =?us-ascii?Q?swyEhtDqWjuK+QpoVfLXSef8MqmqHu63g0ggr0dqniY7fyvKz7b3aZ9ue+jY?=
 =?us-ascii?Q?V1OjjYrvqHNaxIqYLWqDhr8C2iLZD7Q3rovPPszTnvRHT62nCEeFVKp7R1ki?=
 =?us-ascii?Q?OwJ/Jgob3JXGdtRwLiUCK2rzf2l55dqftMvjD/g2Jxurx7umhmXO3n6oqors?=
 =?us-ascii?Q?RliBY8xWJQbj4MyrNxnNu/LOMr/LOZpiB9VaEouQqrNyF3Mgr9duITP/2s95?=
 =?us-ascii?Q?Eq78WVE6mH34cJmIoBHHeUXDYgZzG/EDDtHJ303fBVPhVbpEKRGEjaRzVYmQ?=
 =?us-ascii?Q?BYw4lN7U+1sxLpgSibHuLs5EtRFFug81p8QRQRn/B51lmhSkJ/nRL4rAazjA?=
 =?us-ascii?Q?AEQ7nbpbiLVSTREOZkkEQsH4vwFMXVqpuTYEvk4x9m41lZBkm7nkqidURWnK?=
 =?us-ascii?Q?irRi1tvF17Ep2yvyrpxIoZ8t2UYa/1Re5VHWD1lSgiqKiFI9mJQZK9OVfjlq?=
 =?us-ascii?Q?hLsfwiUlwpg/O9DTwccxjs5hutF8dtjNIMiLG3cNP5tGU/NJMicLhuMJs1iU?=
 =?us-ascii?Q?0Tk5jUHn1TrZUYYDG12Ka/tWPTw7mkceFC2rZU28rBOUrQ3D0yogE9ev/q02?=
 =?us-ascii?Q?DRyNSNtgshCDYnsp800e11b3bCOeeG8XIjP87YaZDaCkDFF9anAr4c0Nnm3+?=
 =?us-ascii?Q?UTFDlpRI/QOefgO+7VTdOThuBA//tgmOLAx40SIfBKcS1zQmY+wPw3mL3n7e?=
 =?us-ascii?Q?kWghUC7t8s6H5PvbCXNaz9R6NVTGkg3dBC3C2WZ48creyL1dxsRi4eSnRMu9?=
 =?us-ascii?Q?GEu45ndbFcSHUKCZazXtCeRNBq+VSk5ymE/9uSRDkfqGisOx0VRK0hxVqWtB?=
 =?us-ascii?Q?xDhrESeqeqjMfkrGpKe/yujeXoQJ1Sp6n+naj0xgj2Xk0dbToRCriidYGLR9?=
 =?us-ascii?Q?gQAVJ4GKNo7UVDvmST4WhUToIg+yWUu0nLzL9z8avNTECroC32RlRHME7Did?=
 =?us-ascii?Q?uNCFN+Qe4Ly2YtpGpJgKWGC87AtfOa3Ha9KDv/xPq1LPSAq56UR/WDjEircH?=
 =?us-ascii?Q?+qJLcI2MQNKEIf9UbYqqXvOTxzs9i+VZi2S86/w4GN5FSZdz8xse/S6DDarM?=
 =?us-ascii?Q?PK+A8tMcziO2lxUfdMdpBpNGJh3SW1i4BqBV41S71DkJ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 606eaf77-f0ab-4097-6e36-08da5dbb1153
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 12:45:25.9950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pccNTshnKYlndDkm/kmI/edSiHZBKZ0pJ+q4k146sl6uNdfsQj9FwuPcBmKgImBdOXepfpIdPcn4WDSMzK3XZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1724
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 12:45:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167604

From: Neetika Singh <Neetika.Singh@kpit.com>

As per below links CVE-2022-23437 is fixed by upgrade of
xerces-j version to 2.12.2.
https://bugs.gentoo.org/show_bug.cgi?id=3DCVE-2022-23437
https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D743111a72f39a1b24f87=
bd1b2fc32ef707b41407

Hence upgrade the version.

Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
---
 .../xerces-j/{xerces-j_2.11.0.bb =3D> xerces-j_2.12.2.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-core/xerces-j/{xerces-j_2.11.0.bb =3D> xerces-j_2.12.2.bb} =
(88%)

diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces=
-j/xerces-j_2.12.2.bb
similarity index 88%
rename from recipes-core/xerces-j/xerces-j_2.11.0.bb
rename to recipes-core/xerces-j/xerces-j_2.12.2.bb
index fda6fe4..bc2780e 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.12.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
                     file://LICENSE.serializer.txt;md5=3Dd229da563da18fe5d5=
8cd95a6467d584 \
                    "

-SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.ta=
r.gz"
+SRC_URI =3D "http://archive.apache.org/dist/xerces/j/source/Xerces-J-src.$=
{PV}.tar.gz"

 # CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux ver=
sions.
 # Already fixed with updates and closed.
@@ -20,7 +20,7 @@ SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xerc=
es-J-src.${PV}.tar.gz"
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
 CVE_CHECK_WHITELIST +=3D "CVE-2018-2799"

-S =3D "${WORKDIR}/xerces-2_11_0"
+S =3D "${WORKDIR}/xerces-2_12_2"

 inherit java-library

@@ -63,7 +63,7 @@ do_compile() {

 }

-SRC_URI[md5sum] =3D "d01fc11eacbe43b45681cb85ac112ebf"
-SRC_URI[sha256sum] =3D "f59a5ef7b51bd883f2e9bda37a9360692e6c5e439b98d9b6ac=
1953e1f98b0680"
+SRC_URI[md5sum] =3D "41dde3c515fca8d307416123bc07a739"
+SRC_URI[sha256sum] =3D "6dd1ebd4c88e935c182375346cd7365514bd8dd2ad2f30f0d0=
b05257bab34ee8"

 BBCLASSEXTEND =3D "native"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

