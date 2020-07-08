Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.11])
 by mx.groups.io with SMTP id smtpd.web11.8317.1594206644442186858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 04:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=QPbAdy+7;
 spf=pass (domain: outlook.com, ip: 40.92.64.11, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayaCrbStQD64y5NFkyKddKIK0uEsMYyuHWkTDTajUEyWwgB/3COdUD74ScveMLm45np0yPe0KWBepVrSH91TgTFrK3Zqn5nbvnGZL+sLShLNNMBnfhYffmDnILaVxjeeEOO6OL0p33GLyxLeJudBQxDbZr+HQKbASXi2rTmfebtziWWOBkRmyA97cx7x+9CjoVeBx8O1vyJcyU8n+QIPnjcCPiw9pDcFOxaYfLwJKgYDO1B0aN6ylWKnWGM2ePoHW7ZfVNiew9kOr9io9Kw4r6hfi4m0hQN1Rop1dHWeRMrQXj7b64HYWo7kQTE1TcTrlkmDsoVv1oa4ABErxKQkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VthJL7oKiXgNN1XUc+7rh9btm8T1y9kiSjLUfYKprI=;
 b=MihZlaNRDsU+gSTg/uLyNruwRzBGz7LZc+2sWZgtXidqicsRlwNtsz024Ympw443UPRT4B1jIddgWwrRrZTVEkPgYBV3r/mlvPOeNLRwF02L1yGAyS7nq4xBETWdOOZWdu8vmSawUvQPyS8kfASi68+AFaeKDCmmMEYVLRh6bnisR3VvN7wo7grT/mpyIMiGvb/iLCYzGGV2wyizMNU+U1AjYtXSWuJo6PEjqI66BBVSNsl+BkGbZbcLmicyAfW7NrTlk/J0M1xCabcBcZDeqVH1ObERbTZ1enM7h3htVJfgGrJkhjaZq9/YpHTioTye32aJkAfoFSge5wtT/KlB1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VthJL7oKiXgNN1XUc+7rh9btm8T1y9kiSjLUfYKprI=;
 b=QPbAdy+71znW/PLQSqzqRc7ZOlCpdiQvYgbiqz1tfUXI1SrVAX5zn/5LbQwOEHJUIA39RUZwtPErGoNFgM5554r8reoh+iqfY8e2pKqU408WqkBxzSiUQkH5T5ldTt+dPr2XQf/u/VQ9dOSCkrWw3qZLwkCpgQLyFgLro812AVDSnkFLbvbtlyc2aAZrKhZ9LtJbsr/d5vOnYXCIupgYzhiiu0YHxaPh3awOjBp+gds0avtdIuFPjAplvovG9FD4R8ybRrH2FPzwNMZhaZ5/IfOtPUj71IrA7VydEJgynHNT47AqV+Rxr7Vr42EZvIv2E4eUyTlC4jHRMY/LPKcfGQ==
Received: from VE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::4b) by
 VE1EUR01HT043.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::268)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Wed, 8 Jul
 2020 11:10:42 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e19::4a) by VE1EUR01FT052.mail.protection.outlook.com
 (2a01:111:e400:7e19::275) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 11:10:42 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FBEB34B3F0B0DDE783339EC97E85D29792249DDB7EF43A8C08E08B61BA73F734;UpperCasedChecksum:CB54271C87C328800487352D3C1C5DDB0F4DF81028A19D3DEC8B6E8D63160AB9;SizeAsReceived:7416;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 11:10:42 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/2] rootfs-post: remove traling blanks from tasks
Date: Wed,  8 Jul 2020 13:09:35 +0200
Message-ID: <AM7PR05MB68810192ED5AB6DB0BDFF67DA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P195CA0064.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::41) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200708110936.17099-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.67) by AM6P195CA0064.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 11:10:42 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200708110936.17099-1-kweihmann@outlook.com>
X-TMN: [+BXv95umPwXkBBfRgPdMXpqsV3SQU3DS]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 75d2e258-7970-4a77-a34a-08d8232f8dba
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyJw5UtaifPLpAfX0jZwjGxHdOppa7JNHiqDo3olalfWofhJhXxcl2VXuBtQA97YzZwQCtl+xqQ/pJ51lSx1n7zG9G9iOjDau6uzdhAlXkIRUgr9uQf43IWWeZhtjL+ukp9ho/LLzR2yJIW3V/5WWCnGKDYb85tXwv+sNf/mbYmfoj6opf/5EGL4ZW75R5ePBrZmi/tquLGfp0LeULNoNrpr01hIGNSxNZxgesitgOtbxyF2nwBTjgU7I+4tzdNb4wN7dNpMGFH8iNKk1fUwz1F+qRQBk8N8JzPZVPnztTwV7FKkSYQ9lpMuxyj+tPdca8QT2lcCtk6MkQrKTYp1yiyvlY+nnyowhut0PMufsp31xGJFNICwZcFvj3q6Ai+mXkPDFMYZffj9T1XQB2lwzpmXVlkZoo5stBGagr4sTle1LuzA6wec2qCVOtTZGAavs2f2ko8zWSOV4snypt2nc6s8rQBTC0mLIpp9SGCSZM1iMiCfqQnfeVUCsblIDtRlKDG+dVTFkkB1rMPb0L4nuiWCkeo1c7qqi/EM5d5kB3kJP/Gs2O8dI9GgSm5TMtvPsYky8WME+ToQ5Y2BoMUPJbNVmCCs4aMs6cGodPvmrtnFNS+xInEZDgbLnNyBSmROhkrL0CQyekqWnlGQIcEnAzSiXredHhLfRyCfwmwsIC1vc5nj09prUASAlb+OGx+QyY+z5RZPWahgmgg0ommNzgVzVFbVvBnPqm0P3cgFa9bcrceLop72HzYvtHy1as5Zvvo=
X-MS-TrafficTypeDiagnostic: VE1EUR01HT043:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I+Ydf5GBOUk/Y4ThARgfeX5NLt4N86AornT8L/L6+slE8dOtOevy+0KZbLtiVxtODXCCOe3icAcuCLXmY3kZEpNj6CFgfkuS5jrUFr6ANSf2IDG8qYfqHUzWI1pMoJdcK9ZwRseCKKOUSVUtbf6y7PvBFj4axCzgdWzajePi/SH1o7V4dQzbILT09VQyjfz91fHB3rzjB0vFXkbhqNNdKg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	3G+io3GGHlXpt2mEgwva9HH9DW2Xxn4DYx9Otq1roZ2v7Y5DkY/OVganXtonsA27rVTIgsbXbkXVBgflsvpAJ+rJjVOj4KNYmlnScsTHMe7BkZf7q6SV9/UatElIFcrtiqvqxxCUG2SRqPLvRI4rZw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d2e258-7970-4a77-a34a-08d8232f8dba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 11:10:42.4863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT043
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

remove the traling blanks before the ;-delimiter, so one could use
"_remove" to avoid running tasks like 'rootfs_update_timestamp',
which are currently hardcoded and not bound to any
configurable feature flag

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/rootfs-postcommands.bbclass | 6 +++---
 meta/classes/rootfsdebugfiles.bbclass    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index c43b9a9823..984730ebe8 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -1,6 +1,6 @@
=20
 # Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ;=
 ",d)}'
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; =
",d)}'
=20
 # Allow dropbear/openssh to accept logins from accounts with an empty pass=
word string if debug-tweaks or allow-empty-password is enabled
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ",=
 "",d)}'
@@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any=
("IMAGE_FEATURES", [ 'deb
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", =
"",d)}'
=20
 # Create /etc/timestamp during image construction to give a reasonably san=
e default time setting
-ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp ; "
+ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp; "
=20
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is =
enabled
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", "r=
ead-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
@@ -26,7 +26,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IM=
AGE_FEATURES", "read-only
 APPEND_append =3D '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootf=
s", " ro", "", d)}'
=20
 # Generates test data file with data store variables expanded in json form=
at
-ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data ; "
+ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
=20
 # Write manifest
 IMAGE_MANIFEST =3D "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.mani=
fest"
diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes/rootfsdeb=
ugfiles.bbclass
index e2ba4e3647..85c7ec7434 100644
--- a/meta/classes/rootfsdebugfiles.bbclass
+++ b/meta/classes/rootfsdebugfiles.bbclass
@@ -28,7 +28,7 @@
 ROOTFS_DEBUG_FILES ?=3D ""
 ROOTFS_DEBUG_FILES[doc] =3D "Lists additional files or directories to be i=
nstalled with 'cp -a' in the format 'source1 target1;source2 target2;...'"
=20
-ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_debug_files ;"
+ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_debug_files;"
 rootfs_debug_files () {
    #!/bin/sh -e
    echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source ta=
rget mode; do
--=20
2.20.1

