Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13971.1793088746905273632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gehealthcare.com header.s=selector1 header.b=uydPyhud;
 spf=pass (domain: gehealthcare.com, ip: 40.93.198.13, mailfrom: maxin.john@gehealthcare.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmRu3O7zXn0HmalAYjOMOok3pdsUGzroyi7kMEMkLZ0hqZdOrcsL3tiOsA6IfRGBkU+HO46MGTZU7jYS3sww59gcnQLpmoabh/AUrbfQLtZCS2TOOm2TdA/cDCm2dIMAWMJMlAHvIMFihocc2VKnTOy8CAjsaBn3il3pRcCCgptoC5YhI65P+1BrVw+DSrJj07Bc5PyW10lNMB4C26XltWoho9lM2v4xo4ay3mld2WXbOIRiFABy5d0eNF4mgyhqrefuTk5jxs2r6UBWXsJH3N4pGCSgJCNyOFVkLusQTzPd9qVal4QkWmJBpryG2z8AASSFHOTC5HeYscaKg9aaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCSFcoAk7zbPhRq5iafyXdA1r81VIDt2VtQ9+ZjVv3I=;
 b=a1C/xQWrLuAtUWwkTyApByTN4Ba5K5qPoyRwBgIEVEYs863Jx3Z6GbLrPZiB/UCrK0wWw0tkMSdJ5Ybh083wNsMc16m+M17NszNuGLdzmo5BaHX/3Llc5uWhVhVVDiQs/tecYXi639Gz/68NfwM8rEe3LcymZAy1ujwjHaKfQjdQ1UXNQS93iS3HdcacKkamfcYwmB0tF5Y8PpQ8ay+y7PSENcqTzLP5Vksb/Qx0FhUSr1jFgU25MgODqy8KXvkZp74lE6CSRYJMdNq8idf27v73BfntNL0bdaW4aAbRSlt3tgD7JseNh2gqaIkPWiWpdVMhp1djc1fns3GjG+ciXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCSFcoAk7zbPhRq5iafyXdA1r81VIDt2VtQ9+ZjVv3I=;
 b=uydPyhudRdDJCqsqVwlBYiXObp4z+d2x0CDQ6ZP441qXqMnzu7fNlywt5kHKoep2cSYGcfaieGd6f3MH3Nv+s73BGe4BQf6NUfR6zTqLLbupaYHrHQHiYdNqZiuKv61X2jS2ylqTmnM/FYThlQJgwr7QBuQUUXh7wokfwpht5fmGCQaKcNxgrSgFzpaYEN5owr5azaKZr1jUgIpuU9PpJ84c/QU2M7iIvRFIpA8/OuZISAMgH5VzG2Gg5bKVIoClNuTkw8R5CD2I0zlfiFUXfrGHIq9o1BOvYnZvA+4gXCyv4AmNcxd4UuvAwvVR8Dn11s0/aJtdMJw/wCUadHwunQ==
Received: from BN9PR03CA0577.namprd03.prod.outlook.com (2603:10b6:408:10d::12)
 by CHBPR22MB128719.namprd22.prod.outlook.com (2603:10b6:610:33f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:12:23 +0000
Received: from BN3PEPF00022BDA.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::6d) by BN9PR03CA0577.outlook.office365.com
 (2603:10b6:408:10d::12) with Microsoft SMTP Server (version=TLS1_3,
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
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id CDC3327606
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:12:21 +0200 (EET)
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] uki.bbclass: use f-string for kernel-not-found error message
Date: Tue, 27 Oct 2026 10:12:18 +0200
Message-ID: <20261027081221.13-2-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20261027081221.13-1-maxin.john@gehealthcare.com>
References: <20261027081221.13-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: maxin.john@gehealthcare.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BDA:EE_|CHBPR22MB128719:EE_
X-MS-Office365-Filtering-Correlation-Id: 105c498a-f0be-4fba-4485-08df340207f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|18002099003|261026121527099003|22082099003|56012099006|11063799006|261022115727099003|261022075727099003|261009223027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: QoGQjGWdbpvvQbWyzIzvt5LHI6QfdgItKaZLcx7HDKcxXo1UXfwfWY04jpBQm2FZaV9yPHeLgAmbObTkEYZg4NTcsa+bJYn1di6x6Wr/vFrIw7TGBWSB8lfn/RdNDyhqz0e9agqBIEjKiXjfsWbYipe/+FkP0B5iDRwsROAp5sd0HktfVzPQQpvRanKWAoVxc1G85z+SM8wjPy2QoLa3d/hb4IqtwrdczY9Bk1cBC+nVBq9lRMJ985oqdVx7egMQmLK0kYOUg/u+v/nX91KH9OFXjnqLt1ZgdRtqO8956vE/U35ZVyHe16b9IwAEKDh/eGaFLc+b2cjYyTpGVS5S5GxYr+3nZVkiCSo7RblJe9iWb3KudA4jlfRg0mRSktuyPSVyMXfpq1pKDl9Eemub4UrYarBan8OYvdXUmaXE+MsY0DoZvByzXUONKFKJ2ayxasKS//bOdBee5QkeecxrfsbFW5BBGshXa/Y+i4anDr7o6OQBz8KJhgmG83SuUsJXpea9vc88WFIWW7pJoNMgsWw/nZg1eO6aLeqVJXw+tzDFya8VVgpX1rXbAmLrSIM8bw39cCBNZKYVY7v6ui5wralpiveku17RiMTOfDj3YXGEQQgKvvUBaXgWR3/rG2ii4ybR9I+XidYvZt+pchs1OtKbLyMde8tKwrbfvwz6nsVrNN7E0Ax/ID/CSNJGwGJDBmKJn/H13WXaJ3S3bJYi/w==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(261026121527099003)(22082099003)(56012099006)(11063799006)(261022115727099003)(261022075727099003)(261009223027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aTiA3nhy6CL0EJPmO4BJxRWKgQ1e2jjpmAztQyAO/TMf6d/DT+40WuSrKizf34APs+QXTIXjluBDeRyOHRGlESKtKShGCOqGP6fS1ep1vZUPQQskN4Z31kjpolBUY37ukN/b2VnK8sra/pJnfYoLqhDrPFriqK21tpb00FlCtb3SFwlQkfCYd2pSlwy5PHpTcaZnO6cuQfwAvrpygKhGtBdaqvDN7DUND/g9h66KCwKaDJM5oJ3kVfgVEteMEG+l/QAjLi7J3MMeCAVlRE7AgT4DrDQvdRhNTx11kYXyci2pGpJ43TewdS+dS9nJ5ehoF45W01mrIFuT2Xw/3V5UcyLuJRvfi8vdOI+1wb7unheQUO7GEAdQTOdvMIdRibC991BH8eTgWZwFYt9caCAvzIFSJ+Vwbz3jHE6Crz5XH1L/EUEsXBqNsRDwmux3+SMO
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:12:23.6431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 105c498a-f0be-4fba-4485-08df340207f5
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BDA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR22MB128719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248713
Content-Type: text/plain; charset="utf-8"

The message was an f-string without placeholders combined with
'%'-formatting. Use a single f-string referencing the kernel variable.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbcl=
ass
index 566eab1eaa..cfb930e93d 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -138,7 +138,7 @@ python do_uki() {
     if kernel_filename:
         kernel =3D "%s/%s" % (deploy_dir_image, kernel_filename)
         if not os.path.exists(kernel):
-            bb.fatal(f"ERROR: cannot find %s" % (kernel))
+            bb.fatal(f"ERROR: cannot find {kernel}")
         ukify_cmd +=3D " --linux=3D%s" % (kernel)
         # not always needed, ukify can detect version from kernel binary
         kernel_version =3D d.getVar('KERNEL_VERSION')
--=20
2.39.2

