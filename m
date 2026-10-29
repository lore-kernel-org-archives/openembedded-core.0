Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10543.1793276489447082563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gehealthcare.com header.s=selector1 header.b=oSnloeKr;
 spf=pass (domain: gehealthcare.com, ip: 52.101.48.37, mailfrom: maxin.john@gehealthcare.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lfs6oAgKDuNBWI5GHc9iI8c3NGMoPIosZQPm9oWi68muOADZlPOcxh7NItJcIxwlzWELb2GE0j6oEm7XaMUJoYE3dgRn11lykpUFzmszgKaAKFN/uU1aeaJPNo3OqVcQJbyr0PcA1MzM1W5Kka/zKTZikJ6NBFkPN1XTFG1epTUuq58riMjK9eMPyu1Z6FUWEO3sZpWBoXg4EGk192mVD8hWJAYreoZoJ5OvATmxXBD5w9uAwAhxK1DFIUEd5KqbE2PkEXgFuPcGSiy05zqrWcYUHOB5AF5HPFqUUb0hCUFOlbxu2Bgok7yK4c4tXgXL4DuBdai5GFXlZJah16cFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct6y+GhGaUgCyncsFfJ0WZG9mE7SbmV9sX+tWhU/7B4=;
 b=OLe9MUcdn9mYvxfUaSDR661Nf3tN7L0lGavLJygjyOdYyeupxjEMnPIV0KzScwSNYqapfy9Y/+8XXBpg2CmmFzHdD9xyRQLO+iiaE5W4V9zfFveOeCB2P0r5kzsC8yfssM8uvyr9sstVWlPIfI5MWB5aTdCYUt5BEMvg3pKr3quK1A3ZrUByG3ylZR0m3rIO0cEz0XA9MqluJYldiRzCo2aQJC9g06h8VONntdogYF5aXPnPVkcCCGPowOfzKXTjxbvORGdg92UKIE7tgoqspdr5oA78V7yFm9tsHxu99OazooqN6CRub2Jsa9Tx28kCguL+M612kAdgSnGyZMZp6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct6y+GhGaUgCyncsFfJ0WZG9mE7SbmV9sX+tWhU/7B4=;
 b=oSnloeKr7QguDwx8EPZP7S8oYCMWnxNdFf1idmY/npPjRsA6UkmVV9jP6i2t17hD8TcNW5hsfyaZ4fDqulrrqdfIMhpzKsiHc+HJ4HvFIwSbevJxtuvjol/y8ZbGYK+B7B6kQJnqJsV84D09GiKnrYIakTLeYrlXFIh+KBFgkzwTo2xYxHurnPQseGQQGJlXoPFKKvz4wudLYTb/H73op3hm4QybBJ8/XGiz8kUPhr1sDfcz5I4YMUAwFxzPtrAiU1raq+BjemZCnDyq3WdFcTw0XUoDdkAcfF5EcCv/D2WZCAKsqzIDitOzJ+FvP+IVFJIhXLzmwZ6J8duzyJ12dA==
Received: from CY5PR19CA0071.namprd19.prod.outlook.com (2603:10b6:930:69::17)
 by CHAPR22MB942290.namprd22.prod.outlook.com (2603:10b6:610:2f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 12:21:25 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:930:69:cafe::55) by CY5PR19CA0071.outlook.office365.com
 (2603:10b6:930:69::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 12:21:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 12:21:24 +0000
Received: from 3b1194cbe400.fihel.lab.ge-healthcare.net (zoo12.fihel.lab.ge-healthcare.net [10.168.174.110])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 3721D26D3C
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 14:21:23 +0200 (EET)
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] uki.bbclass: drop stray f-string prefix in kernel-not-found error
Date: Thu, 29 Oct 2026 14:21:22 +0200
Message-ID: <20261029122122.22-1-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: maxin.john@gehealthcare.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|CHAPR22MB942290:EE_
X-MS-Office365-Filtering-Correlation-Id: 44db0c0a-e5f0-4256-053f-08df35b72678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261026121527099003|261022115727099003|261022075727099003|261021121427099003|261021123027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: Zt9p3PBHlAgd/JNVOAoO9AVxocMyT8HAYd1ZoR6JzNINfVAqaW+tcYBhdERUkjx8p9qjrBC1d0RTtR4Ogl6anFGvzZI5CdBdeedttglP1GKTBauVyOWoS5vzDpOMzhvEPulXbPd+ZOU6r55kCyncvxG8IkB3NB82cceq5Dir8V9GrRMdmlxCOHVls/EezA5fe47B1MbU5r/gGUimQSHWdpw5yqrdlldUxLDAtHw5II9SxZpAPkFHhNpI3gt00ePb5t/hnrp9vaF0OsTQTcCHYGE1iyOOzcS82l8wytQxSQpZX8/jOSD4X7a75GEGi3Be4ZuoyPTW6/t55trr6MQJb/QjCY+XLMru4anFwENREdTLhRBUIQWk505ir+XXuMHMA6ZaVthRqhqfY/FeCnWsYuzLyj+AMII2uli+9oOtWMj+Qvlz+Xh9lo89/kTzbVsH3XwmhEE9ERl9r7rXPnOkta4pP3MT71MSgOwxJMUTNrcvQibLiQwLHPuGaDE5NiAKYO4e0RlzVAEG4ptuMBuFYVT0m+y3eXW+lo2pLU/kNSlwTD1YeKpTiZbPGrpurc/QjapJ2OM6WMbOLsLp2sdyXKGHBFj6BZQ+5AneBAJr7Pr33rxdHcLjWMRke24vZ35ulbCeCw1h7b4XMGgOSg5njTHGXeuIjEAsR1qtouhHEdVLRaO8ynbO6gJDv1qVsAmd85GW8F9i3pckydVkn9f0bg==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261022115727099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sXfybCnS6RATSQOrrITYDM6oR4PGunUP/EMX7qZfmxZgtHhElbqPu9qtDAOgsp5M2jOaTgtkrgH1u9iR2jv0oUKvX8tTxdw7/x9JUyBgi22qGg+YS0y4XfsFAPW7SnphITgBCDx+H6es3nsR1U3f+8s2gV4pi54jlKJbBG8xWKNzS/jh5jpcrfdTnFPvibK9H0LWX9dVtURVTK/mgak4a9P8aI12/JymOJh0Ft06vwc08y65hvXrIO9w6oX/e/RyziPssPdB1KqPUXYcF91Ie7KY8yDBYUAsYOmVC14ha9r0550tPIqtKhBtDM/grDIbwBW4xQdwZU9xNqRGo7aznpqKaNMAHWoF1UBD7OknzpfGwMHwqrNXGz5kgei6yQl1VHULNuh+V6G8g8rKkxZGJui/zGMHujxsnKClouJKBOznTY5k1SCQGVZYsVaTb5cg
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 12:21:24.8472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44db0c0a-e5f0-4256-053f-08df35b72678
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR22MB942290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 12:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248943
Content-Type: text/plain; charset="utf-8"

The message was an f-string without placeholders combined with
'%'-formatting. Drop the f prefix and keep '%'-formatting.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbcl=
ass
index 7c5c12a7b2..bcccf824c7 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -137,7 +137,7 @@ python do_uki() {
     if kernel_filename:
         kernel =3D "%s/%s" % (deploy_dir_image, kernel_filename)
         if not os.path.exists(kernel):
-            bb.fatal(f"ERROR: cannot find %s" % (kernel))
+            bb.fatal("ERROR: cannot find %s" % (kernel))
         ukify_cmd +=3D " --linux=3D%s" % (kernel)
         # not always needed, ukify can detect version from kernel binary
         kernel_version =3D d.getVar('KERNEL_VERSION')
--=20
2.39.2

