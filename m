Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13972.1793088748270641817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gehealthcare.com header.s=selector1 header.b=VpB3s8T6;
 spf=pass (domain: gehealthcare.com, ip: 52.101.48.32, mailfrom: maxin.john@gehealthcare.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsgxYv/LpIry/Fef6aT86PDEW97rKp2DFPCJ2/JcnHyEZi8Lc0yQfZWt4pjnJIBIThlg0eIID7a+Yvg+Sb0StAOc/4mK3Tz9IwcMqJRsk9KUhYNtA5F7wQgnwKZe1JztwLt4ZdHWl8P+b11QZgWzvLhz4k0hDGjJhcCBJvRRHDdwDX47LzJ0Myz60Df+/yvRj1t+pKtMpWpm8UdaZ49NhL30jmJxXeuE7Dbs3Vahw9zd7NVNIOX/bOoeVPajxpEm7LBkj9VZNkuF6eYNK3ges2C4ZeQ4tDm65KW5DCQVx19gGY8lSuNbut0Aeu5PZOyM4z87Z5LDUyk03v7HpTDZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwjYnB8XddXYPcS+4JFhFVyXMNNK7wfSjlbK5jsGHBM=;
 b=Ddz2YVryOpeLAHWZsZv2Cw0fUlxjjcaqUkHCn5+KQQ3QI+Vg2I/dpepeTQpvHqtSojlLSzZtJTiWJFU1Xa/BBPFkB7wRjc/tazVlffatkJ3w9tWpFgmKA8dREBbf0hIcLvQazMYX7n4CsNUgbrcY2sQmEMJNPblAUbY0UigEyzz19QNXs5AWBrKp8Z0kqDoc1iytN8gTi31E7eEMBKbmEMDcFifXxm/NakpJ1j0L22Lt7AhFaDU0Fun0sOse0eZVTAxrnKX/KNvI2NLUw5i4tziZ0DzxSiNKu9twOUgYtZURwakQ4op6Sh+QVmmJTbfOs4LE4nMv8AWqBx0qrAfMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwjYnB8XddXYPcS+4JFhFVyXMNNK7wfSjlbK5jsGHBM=;
 b=VpB3s8T6RtHzqlCGFUpTvn9bcKzkeh0Q2At8u6g/6CIXbmsLXrvEFZZn+0AEeMF0DsC3AZAY7F6zRQ48nWinHlEKDtXwPVEMt/hv7vu/4jLsjUwvKCoTnxQ69BXPi/WPbAmux1KA31DiCXGytjDISRS3bCj/94th//PaU22qVpG/8koBuEbDp0iEdfhgu/ShFMyeXvHP5UfhlAG33KVGCAM9Gm6FDuFF96ZxgeanhAhjRIfC/eaQqFcaKI2qT6LlJowE66iQW63wB/QecsLsXcJZ+BDsglyLtBPN9OoOuXZ2wXqfmMRq7lhu0jK5ZU7dOH7Y0A0tuDGaEAruv8VaIg==
Received: from BN9PR03CA0571.namprd03.prod.outlook.com (2603:10b6:408:10d::6)
 by LVUPR22MB996702.namprd22.prod.outlook.com (2603:10b6:408:3a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:12:25 +0000
Received: from BN3PEPF00022BDA.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::7a) by BN9PR03CA0571.outlook.office365.com
 (2603:10b6:408:10d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 08:12:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN3PEPF00022BDA.mail.protection.outlook.com (10.167.248.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:12:25 +0000
Received: from d4c77ab47744.fihel.lab.ge-healthcare.net (zoo12.fihel.lab.ge-healthcare.net [10.168.174.110])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D4C0327609
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:12:21 +0200 (EET)
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] archiver.bbclass: remove unused shutil import
Date: Tue, 27 Oct 2026 10:12:21 +0200
Message-ID: <20261027081221.13-5-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20261027081221.13-1-maxin.john@gehealthcare.com>
References: <20261027081221.13-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: maxin.john@gehealthcare.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BDA:EE_|LVUPR22MB996702:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a62e7a-f1ec-486f-96b7-08df340208cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|261021123027099003|10067099003|56012099006|261026121527099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 5dbsxIk/W/iGfvDJs8OkV+sEQklhScJ2zpPzfGBApyXSQIp4EnfpudQh0079GAO1GSG+W3ZFwl0soGrcow8AesgwCpp4F4jn6hV5ae3SzwYL6Erg7Q99fZAe8F0IWb8vfyV7YmXz0NIveAG7sFJE/dsDdRDYy3E21l5ANu7CHWZtzqxHkegADxV6Mrq/8btobGbKqlmMGjwxZK/c3Xtt6vamPjO32E9BAYd0KY80QN4WOADUtt4Ni+OCbBN3M/1optcvhZHZgd/nE/Ehx5wLU18JMwveX/9p2w/+qNpVZ5KyeNGXOsMTzNiRoSUcJY+eN3MGQwgDHvQxnkUeRPJcbr/hI1yPuOm3lxD3GuN7yNxAj4T1wiE3exa5HcfM3nXFFotCO5P2qcHDgewOlFma8BIP9TIK/bQF82O3IpIc8nL1IUUSYlimtCOiazmSVv7BYHLme1hxNiTqh4TT82ecBNnx5RHdN8HWHrrWoLRQKbUx5dePSRtQ18w9Iliy5xlMnOGYQU4jIGp4wE7wSxIYFC0LyH2JByvfMdp0Ir1O9Df6XtX3RdpS+8Puv1q9ysSTb7Wa4Yd0RyZxID0d+lUzDMc3ZDLFSlASxwo2qfAeGR8JUjKr6TQX18DX5FqmCNY798pAFaXpZRqbg+y9cLPjMV0ujevH0pOxi6X+twXwZkv/PGwpyYAeSKcQPCtVhfRET5wwsWXp94qvzOc27tBR8Q==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(261021123027099003)(10067099003)(56012099006)(261026121527099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M/hKBqqNKe4S1wzdcB7i77/j6eDN89TvDqbP8umAajFpv1z7uD70UEYx03rxZyJhfWdk8IuhsXgwg13hgGo01q2kTWQ1UVP+R7M8UsCH93RheQekynMxGtx66qMfSPU10UR1pW7+hf2q1c8ersL6Zao1PGX0Vyv9X90A6M6ZC97tSbRG/K6UciyB4QxqBA3VfOdxo9+g8j7U3H6zHcE5Qm7wfySvv31qYdPPAj77ENhVGxLFWTr2cJAvvscXFmwuflYycoDjTZimFwoA134x62mcYvkP8lwn0BZ2QuFGnZIFFYIQ94imbzjp/PPpxoyiOHwNqM0Lms2IyLOOJdEfiJQbhN4VPnNgsgM/3iVDgi4BOgZSA+/NojCEgwm5tSIzOAdx/MFRGPxDqPMqBykv/7CSUt33h2qYab1r/YOrgSQf8uMx869RGhYrHay1MOAs
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:12:25.0807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a62e7a-f1ec-486f-96b7-08df340208cf
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BDA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR22MB996702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248716
Content-Type: text/plain; charset="utf-8"

shutil is not used in do_ar_configured.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/classes/archiver.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b2b618023b..0400d6e373 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -261,8 +261,6 @@ python do_ar_patched() {
 }
=20
 python do_ar_configured() {
-    import shutil
-
     # Forcibly expand the sysroot paths as we're about to change WORKDIR
     d.setVar('STAGING_DIR_HOST', d.getVar('STAGING_DIR_HOST'))
     d.setVar('STAGING_DIR_TARGET', d.getVar('STAGING_DIR_TARGET'))
--=20
2.39.2

