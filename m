Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15810.1794780972975887261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 14:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=qYv2w9kZ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.93.201.43, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TY812/nzpkiU8pz+lCdYLcmJnhUFnYdQtEN4ijA2vZavGSwbaTCApvBNDkKl++6nYYhOw5xq/lDN6OfSu5xKbsO3ei2x98MqfJcjRgCrw9rxTMkh+/TrzrpsaPEi9XcqMlmPV5gG8JgcDGSSPJLQJayVrhnTzE3qK3hUSzMYoXZS15x7Ux9qWzBfYG9dKxHUpieE++zqz6PtYz3f8iv1jelU+TCkE/EIR0myPR4wymh95UdEBz6tkCRkJgQDIEfkDdVSRnRjpN1r5oLM04vrJW27lKT64pbLgRt9yyu6B/vrM6omURywSdPVBi9z/wa8V7aodHhh84lGkq1zMRkNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cnxt3j426XpVM7x+bK2Ju443dFqTo4ejY3+I0dEZ4A=;
 b=Oj473s94GB1t+t7VABACxpN0QEe6sgl9lrPBkCsuIUAhBEzhlZYWsYdFZOU0p0XqgyRupRZmsLvKQDUmCaV/lsLB+zbpunUMBu9SIur6704CLHyEQcsBOoKBOivPDwHNWVXWjKfP9FfPctBmRPdeGCmUrx66S/jCqbYglbTd+uw1lEbvT/sKtpBhu5JnzbTK25OeQsGaNABNVryvYeYfyzF+AA20v5MMo6GWWKMaG0nZ8fZ2TYKtHA0At0KTGoX2/ZWsnVDxXdCFyFLL33HUlK88DCaAWldehZEPN/xk/OUC2WB4IbfJRSemt4aylaYM8Hcj4cxsZ/PgR6xnlmA6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cnxt3j426XpVM7x+bK2Ju443dFqTo4ejY3+I0dEZ4A=;
 b=qYv2w9kZFs37v9HDX//cI0erUPcOUdij1scy04M0oQIQhiTYkDyM/ryRasv5jkRoCOdi8FSvIsBxE5ILtD2Xkj3gfWjVvKPEDBMkzCBXXsgj5p6NRfYqsgQyT/ZqzBk2Fent85pm6cj/Lc7KtyjRdzovBO0PRAmDQ3mHZBPxTWI=
Received: from CH2PR07CA0066.namprd07.prod.outlook.com (2603:10b6:610:5b::40)
 by BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 15 Nov
 2026 22:14:03 +0000
Received: from CH01EPF000BE94C.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::30) by CH2PR07CA0066.outlook.office365.com
 (2603:10b6:610:5b::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Sun,
 15 Nov 2026 22:14:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE94C.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 15 Nov 2026 22:14:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 16:14:02 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 16:14:02 -0600
Received: from xcolc230100.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 16:14:02 -0600
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] multilib.bbclass: Check COMPATIBLE_HOST and abort early
Date: Sun, 15 Nov 2026 15:14:01 -0700
Message-ID: <20261115221401.758706-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mark.hatle@amd.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94C:EE_|BL1PR12MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 314b9587-939b-4766-6910-08df4365c1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 7qquPtL7ogeMrPj1gheZczAQ2cIa7lQtXXGfDW44ntYpUWWjYA0eikYCEE7kGuYHF7+ax4Xfv6qrxgCw4VMk3GkNGFbBDs1jRBoP8Movsmxm2L7MfRanDiDkhjeewDx9KpfBoXXCxaDC6bHBPYm9/QIytszT3QXH9MHOE8wF80SLF1CPMXoelCPJiGsVjyvqXwLrMU76WlPFLX3GMhv6Vue3eXWlQL6jrEqHjQfMzTQ7cOmRJbO3up8i/PoLXlIaseCHb1JrQQE215DcgcOyFXmhFYs5F/nS9XhEdk9Yf93QEb3ahqBrxYEnSVDSMRqu8/DO4xwkjpi4p0ieUWp0NxKrNY5yJ7/PTva0Rg1qSXjv827Gng9i394X+egSXNbMJL7dKwxejgE+/RMX7LuLEV3XJjFNo/6AquDohxLhRCHcHbruM6HSmH/kQXQb6oDLPl/AldVTGX+FJguHbmYsErDpCtZug2o/NYWSG1HN02I5ZxG5wvYdlyT9tHCMscf4aapWgl6QQkZHGxZJ3dVHCp4LhztDOmxOWTtTsM4bD6Qv4LgFK3Q6RR64abHUBvNxZL/+ttGzOAUp1xL28b0ozxM+HKtqGSEedwP9YVSddTGBMHPJhiZYMkqLS5LWLAQNCY+Vom8JXE0V4GD2n4DAjVhVaq5kD9b+JkUj5vWI5s2oD6Xh2i3rkOFAjdL4RLFZ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zvYGAqAzlIzlQmBm8DWeS1Vh33XvsNAyKymi7L9ClAZZSmmNMOwfy2HfHgBWXhbaYBE90VW8n3YxEGMVvSmc0O1RGapep2f7f4c16s/YL+HzjTvCgwqqjnwBw205F/SyROdaaM5mX3TsYcsviHw3I2wvpqg60K9b7ZyibcIKjI7Cam8sorABgI2+POrN76SwSiRfWa1Z5HHu2WBT3z3Ox43Fyun5gGZW016yXsd0sUwPwc8D6v34vOVItf2QKM7RB1xmLb0hwIg8YFQfZN2sJCl/fdzmibIPsotf1NffWb61r4GSaCsxWiqS4rYckhfvh7BVJKJ2zz5AnvjOFYOrMkOoybDooU7WMThNcSjZuzzxrLdbqqgUL5Y/4KP17JI+CmvirTy40M9rNU6Gfgreg9+dPrrIdOTy3GH+FDuoEEyFibX4epwkR5v1/UA4zPF1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 22:14:02.8877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 314b9587-939b-4766-6910-08df4365c1a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH01EPF000BE94C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 22:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250300
Content-Type: text/plain; charset="utf-8"

The change duplicates the base.bbclass COMPATIBLE_HOST check in the
multilib.bbclass, after doing a basic expansion to quickly exit if
there is no reason to expand this recipe into a multilib.

For a baremetal SDK toolchain, there is a configuration that contains
54 multilibs.  This causes a pathalogical case of multilib expansion.

To attempt to prevent unnecessary multlib expansion, the baremetal
distribution sets:

  COMPATOS =3D ""
  # Set the regex for target recipes only, follow TARGET_OS default
  COMPATOS:class-target =3D ".*-linux${LIBCEXTENSION}${ABIEXTENSION}"
  COMPATIBLE_HOST ?=3D "${COMPATOS}"

Parse time still was taking almost 18 minutes.  It was determined that
the system was still expanding most recipes and then deciding the
multilib was not useful in that environment.

With the change, we now detect the COMPATIBLE_HOST sooner in the
multilib expansion and raise an exception if it should not be expanded.

This lowers the parse time down to about 90 seconds for the same
configuration.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
The Clause via Copilot helped me determine this case.  In my baremetal
SDK for microblaze, I have a configuration with 54 multilibs defined.
This takes an exteremly long time (18 minutes or so) to parse before
any building begins.  With this change, it drops down to about 90s.

I've looked at this change, and I understand clearly what it's doing
and why, but I'm not really sure if it's right.  Also I'm not sure
if there may be additional checks that should also be done at this
point to help reduce the number of multilibs being processed when it
is not necessary.  (i.e. SKIP_RECIPE or other reasons.)

 meta/classes/multilib.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 55b8aee882..b178d64f7b 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -72,6 +72,27 @@ python multilib_virtclass_handler () {
             and not bb.data.inherits_class('packagegroup', d)):
         raise bb.parse.SkipRecipe("Don't extend allarch recipes which are =
not packagegroups")
=20
+    # Apply base.bbclass's COMPATIBLE_HOST check before the setup below. T=
hat
+    # setup (e.g. expanding ALL_MULTILIB_PACKAGE_ARCHS) creates a datastor=
e per
+    # multilib, so doing it for every variant only for base.bbclass to ski=
p it
+    # later is quadratic in the number of multilibs and dominates parse ti=
me for
+    # configurations with many of them (e.g. baremetal toolchains). The va=
riant's
+    # tune isn't in place yet, so evaluate HOST_SYS in a copy which has it=
.
+    source_mirror_fetch =3D bb.utils.to_boolean(d.getVar('SOURCE_MIRROR_FE=
TCH', False)) or \
+            bb.utils.to_boolean(d.getVar('PARSE_ALL_RECIPES', False))
+    if not source_mirror_fetch:
+        mldata =3D bb.data.createCopy(d)
+        mldata.setVar("OVERRIDES", mldata.getVar("OVERRIDES", False) + ":v=
irtclass-multilib-" + variant)
+        mltune =3D mldata.getVar("DEFAULTTUNE:virtclass-multilib-" + varia=
nt, False)
+        if mltune:
+            mldata.setVar("DEFAULTTUNE", mltune)
+        need_host =3D mldata.getVar('COMPATIBLE_HOST')
+        if need_host:
+            import re
+            this_host =3D mldata.getVar('HOST_SYS')
+            if not re.match(need_host, this_host):
+                raise bb.parse.SkipRecipe("incompatible with host %s (not =
in COMPATIBLE_HOST)" % this_host)
+
     # Expand this since this won't work correctly once we set a multilib i=
nto place
     d.setVar("ALL_MULTILIB_PACKAGE_ARCHS", d.getVar("ALL_MULTILIB_PACKAGE_=
ARCHS"))
=20
--=20
2.34.1

