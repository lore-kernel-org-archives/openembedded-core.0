Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.528.1792680262007574354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 07:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=UOYvJ0Qk;
 spf=pass (domain: ericsson.com, ip: 52.101.70.69, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDNwTD1TGOl4LVaZTRtZoD3i8tQrOwOxuy3T/hGMjZ+Wo1JlDaWFR1NvDgqJUxPSkJlMqXS8gM1xrHwwAk3mzFltb3HTGPd6kETEy5QoebnSK5CLDDsnGau5YKo6YJb/5fIT/S7TsIrAYcB9Sc3TnxvOt0FWJkYR8LLkCmKZoVJPEDLv8o4btf2Qg8dth+XqzfDEoc75JqM6N1d68DDzb7ug7dofcJX8IiF6iWKxagDUKbPrXoqbS5LV1K0A+ysJi2kX1FTU39pv+O2MlPcEdE9j5uQ+tOBVSe/ypWZISNcjVXFVcESeXTC3I9Uwnh7pcTqvstnYJmo6WKZNJQUGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ/6wjwuX5grNvYr97FNSucC0lD2+/TaYclhJQOC36c=;
 b=NBbqbJE3THvZmaSbusOQH6GqKF0WErfuE8yZkE79Eh/Iah3afAoGXObfdSqbWb/bmS8qDBbm9SK7hZ/RZpQ2aKPqgbNl3JvVsyoWfHwoIAU6eZM5McNngqxfO6odzK2Op8kdwCmEfdwmSTRbuxwzmUX74/Oi5ea571KYCVdIT/EIBoRdM/P+/IJfs8+e1WD1SgEcA27kD8D/gITvY50TZrFe91Fofyf95wZecp5RspmvLYSUcGZgfFSaYSsWm0r2AKlJ/E0/e1zsDTNBMeCZVufa9AMTepnEruCnluqhG98uMJBHThI48SDxsHHosY6/W+p9ewpEEaXSvyr8al1jaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ/6wjwuX5grNvYr97FNSucC0lD2+/TaYclhJQOC36c=;
 b=UOYvJ0Qk7JgB+MHZABzvaowwoaNKi249Cy2+BM57D5RHiBSzaHF1z1JWtH02mhP4CmwFtWmdXluLqM3HVTws1clTsaSLcHMrn8jtsr25//aWg01QUlZ0eo+PFUmY3+2Z38t3Gud2PTeGDgFc9BaeIyl7/3Ca1aRClpwAdM/SZFhcILlH4vgTysJSPh6by6BvQpq7Itb+PezIokO3TgNYCgRkcDhTdL1pQwjSPDU5WfyWa7565BkB/hT0lqUM2gLlKqimVNcHcL0Sf+TaI2zoitaC1EZv98EIvyttc15F+P2vIhnbw4UvnXDoIwJESrrJArHcOquwWTuVb0S6IBMG6w==
Received: from AS4P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::14)
 by MI3PR07MB863091.eurprd07.prod.outlook.com (2603:10a6:290:97::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 14:44:17 +0000
Received: from AMS1EPF00000097.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::6b) by AS4P195CA0023.outlook.office365.com
 (2603:10a6:20b:5d6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 14:44:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000097.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 14:44:16 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 22 Oct 2026 16:44:15 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 2AF0F95805;
	Thu, 22 Oct 2026 16:44:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id F01D370722D0; Thu, 22 Oct 2026 16:44:14 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 0/2] devtool: add annotations if the changelog is not well format
Date: Thu, 22 Oct 2026 16:44:11 +0200
Message-ID: <20261022144413.1690870-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000097:EE_|MI3PR07MB863091:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f27f4e-2c24-45e5-761f-08df304af24b
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|10067099003|18002099003|261021121427099003|3023799007|261021123027099003|261009220027099003|261009223327099003|11063799006|261009221727099003|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info: 3a/q0OLnXDbm8zVsqg8epl1UCpVSzzhWqbfj2V/byLOStyvUEkFXVGEk3dr6nTkuchT38KBitYoL2lCw2sjKKibolRkZK4hqu/qnFGCAKr4iF/wnOgJr0X0YioyF0oV5sFylMYN6pU3gn4G7sZfWt4NreVdPBVwW2ff1YmhyB8bmdcl60rygKH2LPx8x7Vd/lTKmeqNzYphxlXwDLN12R3emArk4h6K/seLjpsuIFgJUFDDpOeGo78UhVGoaZ0XEg5By5WjwfynyMCSkDvsr31x2LjN/XnwlQfsiis3G4pfvHMVNsr8Q0d7kAAU7gfVHQikLIKZV/j+ayc9NJEq9GjTZQaEGkOWJpE4EUU1EIO5AB3HEJDl5enzzoocjoaI1N7IgTK49E5pKGN7dkM1sOqfg/sQGLn7CV0L2llIyIXveVfljXjxLz6WUqxbfeO31Cn7WMZKuTIJyTcuBUdLuExHxmuIyRj2mvdAK/sNlRkggTPrE7PrY6txNcNZXnTtJ1V7qoi7M3wOOQyFTo3gft2fDaEeGjvyXawyK5KNB31u8CeQ2UkLyT5phlGPs0XD42kzFsHVO9BhS7qkAky3UVcYybTxJnqHqtoOcCfgwemd0dDawaHZQgfwaE1T/3t4VIc4C/LCoSnQ7TqR5fmOqXksXWmkqjkZAB40QdHzNDbYm7JqGIWFHyQ/Yx/BXJBwHiGIWfNZK8iI7Re3sz+JHgw==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(10067099003)(18002099003)(261021121427099003)(3023799007)(261021123027099003)(261009220027099003)(261009223327099003)(11063799006)(261009221727099003)(261009223027099003)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O4zvVLs4yXqUa+ppJ7GSzZXxCdmQJPbXtbn7qTRarmAcEVJkaE6wBTfQrtodnRwqzoSn8YIYb/kOMzZvvnjLfcJl5TvAIIoesbiMZdTgJbpY+z4Wm2o9OOmPVeG1PkTT8YFQlFVNg+2FBbVrZ47u0BnVzUcAsITzxNjKc/EhZIwfHSIivEQGymNudTF5MQ3kGUDprOhUD7GOgJHJ+uHYSblftgSz5/sDGIypRQgHBBihPRc3ulSVCn9nAghantHdEuMQT5rUGQPN+t0Sc/XN4bbE7dxOAXYnT1XRQltK+6oIFusyONfJmMT2snNv8HOpyQfGO3ZOFN5cSja1JkCgv8bxtbszRNtdLBkV8cJXV3Zyryetm2L5/KiEGYMF4pMbKUWJUiob5biIYG3yZrHlYcARSZb/BGr3EmtVMA1yFqQB5OjOClbCx2GrQ2ZFo5hi
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 14:44:16.0035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f27f4e-2c24-45e5-761f-08df304af24b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000097.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR07MB863091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 14:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248446
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Some components are difficult to extract the changelog and create
badly formatted changelogs by devtool.

This series is a follow up on the first attempt in AUH and
yocto-autobuilder-helper. We can remove components once the changelogs
get better for them.

https://lists.yoctoproject.org/g/yocto-patches/topic/121846157?msg=3D5121#m=
sg5121

A companion patch will be sent to AUH that reads the new parameter.

Daniel

Daniel Turull (2):
  devtool: upgrade: flag badly formed changelogs in metadata
  maintainers.inc: add RECIPE_UPGRADE_CHANGELOG_SKIP

 meta/conf/distro/include/maintainers.inc | 29 ++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py  |  7 ++++--
 scripts/lib/devtool/upgrade.py           | 10 ++++++--
 3 files changed, 42 insertions(+), 4 deletions(-)

