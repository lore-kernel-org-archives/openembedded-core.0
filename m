Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14128.1793088747450043003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gehealthcare.com header.s=selector1 header.b=BcRUuVA+;
 spf=pass (domain: gehealthcare.com, ip: 40.93.195.54, mailfrom: maxin.john@gehealthcare.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yf1n0WGaKqNff+RhGhPtVAGUIod+NEHsZ1tW8JJoB9Rm/Qm/u4J6tPoFYxCrQf1kS3/GNnKl66reylAFFEkt0c0gpPFaGTvykF/eaGioERVKLne0r9Ko96vrPqWigJZj/pNRE6U5Cr90EEfEHpr4T/8rf+5/1KciKJzdC4QqW82TNvxbQbc5wVmeaHRmfVSr5CtBx08GGGCiIdrAu8PRyFa4vSYarDQiq1gNoS1NI9jyh13Hk8l0SA5GIDubWD8tbVV9YPTpYpmdBEVW6mfajAL/ippfbfzMBXuaNwVVrVmzomFnlW9ThPdlTL4fLH51GoIms+lzmHONs7QXLdK4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzGemAlV6BAfNV9It+1JvyXRdWt3ec3rkzsjHBFtqtU=;
 b=c1OLIrazXAj6i4fIN/PvIkiporc2ITwEJhlCE2Bx+3SDx30yR+S6yM6dtL+GdrkT10++Uo4lGwYm4qkefAoVrn4JITMlWSbTcotrXI111PSngwAFxRCXNYfznslKhYPZxgNjW4f8nHufTqIhYuaTRfxcLMmk+GzkT7HYB8ouebofH519EOqlt9AoupyYrYvHF8ELAOf5n8f6M4K/TZKS71cDqN/zLm8hhsGOFC7Qk7B8kUSzkmiv7Mjb5syTAGYbWDZt8/JHCzIahh2B+KDa7EnJQX0z0EBhRjIDCMTQUsdZlgq1ViPLfH/AHnQrLOAmLG527hQQli0/2H9Pjfnpjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzGemAlV6BAfNV9It+1JvyXRdWt3ec3rkzsjHBFtqtU=;
 b=BcRUuVA+Kzz0qChF1Aw+0M8sNATvw9h9geBLljNCdE6JOlUlOh44eUkPOzm26w3yqGkikpUFP/2I0WS3ldwrwj8uDmhC5TV8wVDZTA3nOaS/1QXilYHPbN/b7//34inQQPdY4UahAfT4wyZSVLXL36ghLQ/PgI7A9+MM5Ly8HYgPzQMXdA8IevMEbopiV9FuGxwPq3dfURNWSgqHQ/2n1fK98eme6gblG8SouorD34Aqt5BOYUs7jB9Wyh4regy4vgTWIDvy+b31Iawro75w+cbIdHZjlio4pmPO66J1M9lzUkcsqWS/krkPD5IedZVdJSAJSRYEPQ670CE4rb28HA==
Received: from BN9PR03CA0593.namprd03.prod.outlook.com (2603:10b6:408:10d::28)
 by LV2PR22MB412579.namprd22.prod.outlook.com (2603:10b6:408:424::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Tue, 27 Oct
 2026 08:12:23 +0000
Received: from BN3PEPF00022BDA.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::17) by BN9PR03CA0593.outlook.office365.com
 (2603:10b6:408:10d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 08:12:23 +0000
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
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:12:23 +0000
Received: from d4c77ab47744.fihel.lab.ge-healthcare.net (zoo12.fihel.lab.ge-healthcare.net [10.168.174.110])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id CAEF127605
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:12:21 +0200 (EET)
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] insane: fix unimplemented-ptest error handling
Date: Tue, 27 Oct 2026 10:12:17 +0200
Message-ID: <20261027081221.13-1-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: maxin.john@gehealthcare.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BDA:EE_|LV2PR22MB412579:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f6383d-fe7a-4efd-4dd0-08df340207be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261009223027099003|261021121427099003|261021123027099003|10067099003|56012099006|261026121527099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: RNv+F5gsMkfsVtMM3CHcLKh9JCwDwGQQ3EHw79BjmwTqotqtNX79LnnUrEY4mpFusgkE+kU125idTx/D0ATysqJKGfw2fKDYd8bwhTz0lUfXuK+OSe5y6C5tM++6B2X2lflBsqXtPXkg5k7VCZ6BVNHHsQplpDnEHtzC4342gLVSy7SHgVMgT/C6UbQ4QykQYZjcoT3gM4TDqqy/xNtVUzANP5YPwwX+5y06WdiMLLRuLoV0ag1hheD6Z5pLCO+dLwQOdHVQ7tTXUb2XJnJViu+n+d+HX9+yV29/zMZwcE+rbMgCvBeuiED/v3d9/WSLrz40B4NTGWQs4fvEFiQHYyFOXdkfFxycbir2uDgbNjdGf5sEMz80k2Buzpd2BwtJOJqRO0z31qOw7J3hzuDFDN/JSpHJyS5oL8NxiJHNgFRqz/R7UUcYAsx5kKkuoHwCTk4ZdryOHyEZXtpud6OrbSkCDqgCBelBYjIXnxyj8dfUuGfcBZoZJAVlr1vy41q8/yK2iL7sJtzjMo0frOJw9NMbxbqhTbC3JCWKc/bipUJOYbitvKZbmfzI24JKZc3GC2pa5Jl8JLso1UaxbypRKPbzM6h1JVmlg1X+kbQ+o8vO4bxnPFHHSyTeCfcGwFOvTHYCkYALs7SgKNiqcq+1962kPUpc4RQt6cXjJzHFv9uuKhNqVKeUlhX6uMom6eabVmETdHN0DUH7JIB7o+FghQ==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(261026121527099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T3vwm038mqcPqWJWHO1NemmGpmJLRlmr7wZFeK2ohRVTbkb3mQSAQV8E4oBtAV4cR3LzmjVGhlbNuE2ZaUXp6SjOOQU58UZXaNg9mL3ywqIVNOsZrSOncG7SRM0Y2SQaQp6xeIGsJvo45EpcwxZQnHYYHUqntMctclDi4A41JFWZdrD41rxLZYjDUlue/1SxHyzW+xSi9wQmzjaq+nDpDm9zV+vbKpGLZ9skykXzCfiiPBGoUaEDE57ssG/O9MqxxCplsp8mBKcKjp3oFjsaKY4Oduq/7oBiM47J/6PzZbNg1fl0EG36TyuDWNDkeuZJt42otG8vBabdTMwxwmmkPhQS7Gy7o5zdcNIDEU1YD5BU75/yKfypjZCUStpz6GDQ/fPbH/ZTFiULnG1clp1mXP0HocdAIA+v8xYZe4BLgCprsSGCd8Jm3ZVJjyjhIfMY
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:12:23.2635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f6383d-fe7a-4efd-4dd0-08df340207be
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BDA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR22MB412579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248714
Content-Type: text/plain; charset="utf-8"

Avoid TypeError when the unimplemented-ptest check encounters
a FileNotFoundError.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index a4d17ccd2a..721088a8f5 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1301,7 +1301,7 @@ python do_qa_patch() {
         except FileNotFoundError:
             # pathlib.Path.glob() might throw this when file/directory
             # disappear while scanning.
-            bb.note("unimplemented-ptest: FileNotFoundError exception whil=
e scanning (disappearing file while scanning?). Check was ignored." % d.get=
Var('PN'))
+            bb.note("Recipe %s QA: unimplemented-ptest: FileNotFoundError =
exception while scanning (disappearing file while scanning?). Check was ign=
ored." % d.getVar('PN'))
             pass
         return False
=20
--=20
2.39.2

