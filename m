Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.78])
 by mx.groups.io with SMTP id smtpd.web12.1798.1594279188872080381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 00:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=GrhfhpqC;
 spf=pass (domain: outlook.com, ip: 40.92.16.78, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zvoh1Psn54EIwDEA+CEpCyGI4SSag3NS3JvTo/xZ4rqXhMZy7W0JEOlIH7op1FQl9SXM/vW+jzL03QX2prun6jGeJHJQn1OiAtR5qSqOoZlrfBASOeKagsxOALj6wdra82Ow2VoBGzbCoB6Kjc4yn+5iqVdoBRkHKBMnyODCRpRAzCY1XzGkRPFW4ybJzugrGDLPxTGeFjhdTHhzL2p0LtZBhOYzVhyC6krHdCR6ub+LMwPhQkVNP7RyID0YAODpTl7lsDMzl8gQGhpAFxERXOsYq8UcPLjbOVgpqlIPK+B8D6Y9hb9OdaE/CbNeFUAamfvGoDL2HhIeZX2lYJ9vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1ulFCPsQRatPvIWnETDgPOz16KuwUUD7ERozJo2mnU=;
 b=BJtV7Tq6pGTVPQs65z5cOUBMq8jGYOdNaZaOOmNHwBSH8X7fzkmfebUEW5WpyFmeUB1hPUBmO5RvRaFCA/09cL7F41613OVZQtTYROA7Pep9PRdpCLMkN5G084pm82kawFaMOxZdmo0vM4mOboko6pJ37bjKs+0cHJFNIjHW5+7NrYk1wRo6GJD7d5bGeLGnNhd62heme0elgudom+uOPaYgGvYhbT3ALdgAOc6tjF5Lb0ELvv9YpJhvKOVU7ehkxtNY0qBxr7zdetAipyZ6eyiVLtRgN9Ck5GRmukw+ICagoHKwCJaYXYnyg9/XKmrFcUiPufK59fKTY2BPLQ4VWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1ulFCPsQRatPvIWnETDgPOz16KuwUUD7ERozJo2mnU=;
 b=GrhfhpqCqtEJ5+MctJ5OjS3Jgvpa3gx4KVf4ZCTQbtZILvDgKCe6g2WC1OS5cCnf07eS2lTrr99Eisq9sqYOSHYmT7+jAXWfTpP6udktJpA7c3LuHNhTArovG8vC44WQS1KmTIUUVSAfJRUejwsH42TPUk6D5f8xKV33zJ1lZbKieHk0gBJPt29fEzSbTzhmSE9QJsQ/Ch21Fn80B9cp6k2b/vA2B3uf4DW08jZwNs9ytAmHTqvMXZsaCEkIIW5QGBMTDuG20gRmXCkoX4ciKf4Fnf3jk0x4mZ2mTJj3P8WGWHVPbTTVIY7AkUo73+4Z7Dj9ZSsdc15ZH3NHXbz0Og==
Received: from AM7EUR06FT018.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::41) by
 AM7EUR06HT028.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::194)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 07:19:46 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::47) by AM7EUR06FT018.mail.protection.outlook.com
 (2a01:111:e400:fc36::396) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Thu, 9 Jul 2020 07:19:46 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:76A5AEC55EADF38E7E712AF46DD9911D6233E1AD38D83631E173DACD2540B4E2;UpperCasedChecksum:4120CB7A75AFE2739D3E09C0AD0A216F9199FC4B4B79D449D7A7CA087E23F493;SizeAsReceived:7413;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 07:19:46 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2] rootfs-post: remove trailing blanks from tasks
Date: Thu,  9 Jul 2020 09:19:19 +0200
Message-ID: <AM7PR05MB6881E512124C27A177984016A8640@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P193CA0040.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::17) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200709071919.1065-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.35.214) by AM6P193CA0040.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Thu, 9 Jul 2020 07:19:46 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200709071919.1065-1-kweihmann@outlook.com>
X-TMN: [qK2uvfTP3Lr6GXmGX4TrL1+q9TClWZph]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8eff9970-f2a6-47fd-d678-08d823d8756d
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyJ3mPeice8p4wLEA4mrg3bQV0uKu8KsxNPr5EyVP7E2cPeru5zpNGPyxastznAywR5/ux3mdMGq7T4PK+lS8hHIta+dKZVhiQez9FMW3huWH6LDKxi/MRWMPxRS8phsCwTof0+B15HggAjIPjp3d3KMHUSDtvrdgzqj8jTrwCj9tU4Fb4Jx7CKst1niMO4+TYxsUekyz/uI41fB8+WVd8a5+tx7XUfCk7pJj9+ZIMQGn7PFklHi1ZqLPoQbbOi1/o1IJTBzm996nbx9DtKQuRLyYGPMRig1lRXJnIL6M9VazpuyHAej5IpvrUw9BwcTFk07R53kgmfoCIkOLAjB+XyzPPwehw15RJbhExiFE7QPwXnOnfUCp8mbzdzqDDiUYHrq7tLuappuOF0LTExZ8UPIeCsAL3R8rSJvOkMscFtI1UYDQMof4KVwjPnl9htmxJQaJ7jbJjE68BEgynr7NzJBUE1NyaKgyxdUejF50AxkCOh7y+bbO40p4tgW5otpIzKJD7nlMgpgNof534dRm+eD+h1uEYmm/rU04aBSyskv+Y5NuQEAUQw7OGGm9CRlYCAjvytOsl2vqn4FiSea9xNbeD0IeiYjB5QQ664ow2ZyDkfAJqbM4OmmxBYalcdJdObn9/dpnfAzYXkToSi161wy8g6n0faTy39W/CEdvmKfyl+5pkm4vK1Nj8j6kFqoxBfv912RfD8v1Q+g98LlV6xCcQ7ASGSl+N3zmNWc1eXEeTsj4rSq+4x9cbb7fChEO+w=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT028:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q9PrWrT3zajnOSwwg/N4qxH1HmHOm3roU168djBdVulPUssuHRFaLmwzTmlV054Tl9KLE8wy9HSC/VUN8J9GXn3wTQz4a1+7pgkGK4N21JtGo9vfVR2u+Q0sKrvLZ1orf8K0rCbZUHVLHYr7mHgIX5YyXUQ0AQs+tO/aFKJRT1+dUxhRI+xH0XPzLY8Yqk3i+cOa2eU+EDH5XcKMsWeO6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	rWq8U/kcvFCoITXd1ifnNlCnxIz++IJjFn7HmrjZhmvuNc45kajsUiN+nZIV5+3GngaMk7p7XPKqsnY7S0pdZgRgccasx/kx+uvZUOgjHfnAeZCavoK7Wzca9g9GCpushuaGvW7btu/uzXlqLYQs7w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eff9970-f2a6-47fd-d678-08d823d8756d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 07:19:46.6410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR06FT018.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT028
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

remove the trailing blanks before the ;-delimiter, so one could use
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

