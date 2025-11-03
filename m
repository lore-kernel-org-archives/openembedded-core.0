Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41756CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:28 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.96])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15419.1762154846272846270
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=YAedPnpN;
 spf=pass (domain: navimatix.de, ip: 52.101.84.96, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyAMF8QypehmZqvu2CuwMippuY/HXe2w3EJm7J7VNt9+wfDB0wwupIMIiY9wNTwQ560p7/sNuce9c/0d1GykDwJnBZMwihV+EOuLEo/TX+aUIVG8MkjisnwiVrdgagKMmq8oAB/6+CU4dEDoU4S9FK2uCO1OqVyuU0p50/SMRqnHIu5wGgc2EufxFfJsOrek9R4fwXadhCOu14WpJh4NGI38S8HmVTLgvQki2Ajaq7yAMQSY5HV4uYsij0guHKa01YzsLpPqyt+20kXYO8dwKsnYs/cFyQuVhgRegU6mQ5s+KjM4vt7Cd9Xei/DhnwkFj3dkXENFMycdPuks1Um24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQqmV1n0mgeoZuQ0uvOD+6/rSPYaCrVcNlHDXzfWqdQ=;
 b=lInydUWEAlpftySyIcHC7+zyqDXXiYw//HbG0EqV9TDfoU6igINcOttAQTCMESWO0wUKf5yuek5APP7iSP4sLLAyCaj/beNglsoZMMJaTzGa82jdGvmbWkl5lVxeQZyunN5UlrcxgLTEiOVbyH3QcX/ZsIB9gotFvCB/HZs387b7S7E25cHbuVdnELKitqUBgmTt/k65yqM0ku6IKHWvAEPgyYj9aMqHV9OiL4dcKD/l2P+OPHyKHv7BrygOM+keaJAgrr9Hqf1kvQUUORCYY+b9bal1iP12zX5sRHAc1G3n/lW4koCYWw7dr1H/VyMk1WVs/eWYlnPzmm4kUqEZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQqmV1n0mgeoZuQ0uvOD+6/rSPYaCrVcNlHDXzfWqdQ=;
 b=YAedPnpNMyoLQqMjrsNY7Kw4gz1TEiBJHv895aV662sTDWOxaMwbe1b6b7G4y3YEZ/sRtb2f06pDMsd28Tdl2wja/m6BnAbLS0bB6bKeVeCWzR9u82S92hj95+YZ+jAxKeBVbRAxWXyaj7AKIpmhnlZA0N5wq1Qk2ydu7EkKipM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:24 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:24 +0000
Date: Mon, 3 Nov 2025 08:27:22 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 17/18] cantarell-fonts: Remove meson, pkgconfig; already in
 gnomebase
Message-ID: <ce176a4245ee1fd62e7f13700b8ecfd87fee913e.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ad2136-b18b-4066-d5f8-08de1aaa6ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NVkn3KsY9pCi20/w2hPboySz+kq9xZ9lyT/gEQRGQhowsY/bWs5781mS0u8D?=
 =?us-ascii?Q?vzbYHgG/bs0JKb+JSDPGRIIaOEsuXcEpmDHW6m4PaF5sXX7tasj1a5NVB6mu?=
 =?us-ascii?Q?pqYKwhKoG7S+1fuLqOQpWkTawh+0Z1XjjA6D18L1Kcgg6N8Jjg0espjGytbE?=
 =?us-ascii?Q?iwsI2J4kJ8ZK305TRBRh45m/t2CuekmvbY9Kt9FnBnBCgzGznymPAbOmRZ5j?=
 =?us-ascii?Q?Hz9sHnkrObk5AXYDs+D+4Hu7Av+ZWhzd29nHrAkZVHIm7uUfL139FiEdvHyc?=
 =?us-ascii?Q?uyRNPuVnU89xwgIffl+2Rm2mt4yTqXu8Gb42w8sVoPyvX3jM7ebpR+o449bP?=
 =?us-ascii?Q?i+Y3u4z4LwglE6Fi+9OT+K/L7ok6YoXObnuJf+zEkLdRpdHqRtItVimPEtSB?=
 =?us-ascii?Q?zWzB2DbguRf7ghJXYfXKW8BPfRjI5yO2/lBI/kMMu65OYgSd4tcLDNizbYAh?=
 =?us-ascii?Q?M8Q1gJxdSeO7c/SgUqpr8FbTMECqHAy4JrmIsOpx0dntRPezBgr18EG2utXz?=
 =?us-ascii?Q?4l//2t7Qp+wzwsvoZOBh6LtY+Ebgszmw4XO5rEm0Qxf3rSE1Ucc6ejrN+vhe?=
 =?us-ascii?Q?3gL4GfG4OgBJWRXsJiOznzWMw5ERqJvFpzgg1iCwQOcAH5mw/7Ffy1LbwcJk?=
 =?us-ascii?Q?YBDFmS8hHH/RmzBbpXAwVCaPtCcryErxr5pCvogY6SZ12z2G4l8MLFXKl9HU?=
 =?us-ascii?Q?Q9sq3ViVpYsG87r14IQCFtPRUHE5jKGOSAtejzPJttf4VxtKJ5yuVTOaD4VI?=
 =?us-ascii?Q?mFbW8VJBkk3sygiL9JA/GFZfciDP+MV+mQtieHUoqMUOw3yMzylT3xxdl9Kw?=
 =?us-ascii?Q?f/pNaiStIi4wEKQ0dLr5qu/ianwZdhV4hCLWtAItysjERdOHOBawYrPtfVSn?=
 =?us-ascii?Q?FLR8Q0s2ItKzI/Yh/YEAaVm4n/cMnb2Efq5DbEwUaSOdDuDivezBZHBp1nTM?=
 =?us-ascii?Q?16pqhlevaa2GEkt0lUKT7Nd8l5am5r0OfPAXbK1zgnghP86G5R1+UGtvsfs8?=
 =?us-ascii?Q?ugXXCOBqYLdm3ssNefMZeWjuP0RC2DchR+PYdDTC77aotitUnsDNFJCXlgLj?=
 =?us-ascii?Q?QnAXvaI5+sEICyf4FEqBS2IOzf68UegreKGM/zpTzlrOTzTqn7AM+8JhEmt7?=
 =?us-ascii?Q?X7LuRYrddQmmcYKcTgDib4BIJBVXvMlZGrMXcRJz6t7ebJgLkNlugGlR4nxl?=
 =?us-ascii?Q?2myRWWo7adHBbOy+FrafXLg9AYR9wtBhiqPkd8rkJGEAfqt0HOy3ARGecnHc?=
 =?us-ascii?Q?zy13U8KNp3G+G6bw7yMhdzTmgJ8njT6QbVZoVdEjxo20TfGO72wjz3Fgkd3h?=
 =?us-ascii?Q?SfR5T9vr2/JOfnoZOnXYcyNhonPl42/t9TY3G6OhQY10E4Ns3I8k1jiKbY9A?=
 =?us-ascii?Q?iEpnI37Hu3vpfy5HcUQaNJKbetFuK8xL1ZggK/xBBiZpKx6xd0ExWQYaMzCn?=
 =?us-ascii?Q?ZmFc+UXDxoiD/4olZse0M2b2E2vxFAqR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bcs2NdvKILfxHIoW2VDbl2cxbVbtPPVa3cjAwztGipr3IoeSkqALqYGF5Z/Z?=
 =?us-ascii?Q?ODf2WxSUBUltgrY/s6IberrgZ3hu50u4Q3KeEzykHzpE0m0GrUwCIc07leTP?=
 =?us-ascii?Q?/HKYfxsULaNgqXm8qKxzyLeVRSHtuUzKyS1WxtaCdIODc7Q2VKL0kGDCXUZJ?=
 =?us-ascii?Q?fxkuXm6KZYYf8YzdrrZwESfHLSV0Dgog+VSuPnTQ3hd88HUvKhhESfiPvHQq?=
 =?us-ascii?Q?pA7HqLBNhe2tUqIEARQZsIN3ErB4y20wml7dQN37GyO9ZEDBRlD9qTyb68bp?=
 =?us-ascii?Q?71hK+sTJPPMS+rVvidVNHGEs4vubUDE/P+9SeVmSdvmiOT+XId+dhWqWPxzK?=
 =?us-ascii?Q?+YPSZxJ6tXGKLZcpSGvJVwUqXeRvRfyN5+k1jp8WYZnC3OrVMHQZDpoBxHZ8?=
 =?us-ascii?Q?jm/k8N/EVAWe/qVySJ369iCKLjXD/NSn+zmEQ1Eh+6dPVbFMB4F5qZVMh9bE?=
 =?us-ascii?Q?R5+qWUrgooabfE7/y7N5WneUbnQ9ETGzoK88WpiJWuOcCT2xHt5GpYOlt2zK?=
 =?us-ascii?Q?AksYoevuMuRiTDGSHNYNdlI/H6iegOtnR9GS5PATO7IXD+cDyQp19hWoLTGX?=
 =?us-ascii?Q?+2eSjazwR3KJNqVlj7ZBdnxNn7yO49dzSfy3edlO0E2vjL4QZFKePs9iYSzD?=
 =?us-ascii?Q?SnoSNsHhM2571x21ebtRCH1y3f+2TrFco/T5zm01q+hfNS3hlXxYxNvV1ce8?=
 =?us-ascii?Q?3+YeMR4/e2bCDVsYFfsan4CJmD1E2nUTkvE6IlAE7ThN25VZQHwM4ajlmkS5?=
 =?us-ascii?Q?8g2Bj34eEe6roxUGZn/4Uyih4YLV5HH+GB/rfxUsJfOM0IeLOlo8rWxXTGe/?=
 =?us-ascii?Q?+rNX2x+cuyTLvrjHIRHS1Du3G7nwSDbSqsHMcfoTgdnvSGFgpZmJPQMfEoUt?=
 =?us-ascii?Q?fhzTZaLtE5ucI4eWTdiP8zJqhLWcfAZgRucWD67nlFmFvC8ju/dUPNTizyGV?=
 =?us-ascii?Q?R7i/0LMlvcgcFr7zFvCEvd+v66mm/jYZxhVodJnRQ4NSPszCw+tUw0IxR1xl?=
 =?us-ascii?Q?c5ZTonqQK/Kff4j+ogmdIlnnVxIEbeFYtGZuPSLS2IUxOuFy95CKyM5mM2Q9?=
 =?us-ascii?Q?r9Gaogi5TIzXJLaP8n9JhSpbgJfpfQqotdz8yVgWjrNEbDFtseWgZ2Hq8HGu?=
 =?us-ascii?Q?16DtQBN7RV0dT2s6Ews6EFql+IQV9iacFG16fVpmMPoKCDUx3KQ73xV5QC/v?=
 =?us-ascii?Q?pTLmhjt9o1O6uEHUHnBqD+QvzJQWV8+fUPX4G5V7sntVfO7y6XZFOakN/bYQ?=
 =?us-ascii?Q?gMHpSUGZISb88q3L/VZMeYh42Yy7FhWkzImtFDWdFGDqGHgXGlD2rqaKQ9s5?=
 =?us-ascii?Q?ZT835TRgesqoIlze+fGd44zKl89Qquo7zm3O6XcXVVdVoQFJGo5G0Dk/nvNM?=
 =?us-ascii?Q?thfywJvS6/sLojPHK/tgKumUR8EZiKkEcwCnWhHziaq2aPb/EzOmcj+vTS0C?=
 =?us-ascii?Q?BFyKFCZkBJZ4rlf/yY9FFVuEsBqayvsRNwqLu+jyh7j+Bk1EXzYuc6cLYly0?=
 =?us-ascii?Q?6odhsqQj6okTaALvIsstUsn0aUBp8Q8YMH4VlUt/PQvMxz+drxDZzblyloEG?=
 =?us-ascii?Q?gjtXCdb28AiwMubU0pNgdYK0HIdacyZ+FJ0ntoEyIu8jkJZpQdWnhGgPAgqP?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ad2136-b18b-4066-d5f8-08de1aaa6ed1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:24.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWHJFMq8SZej0zJHmpKUFIpgzdk/awcqLIVz8rQDRM3SGV9OK6gR7KTD3HTilUK0S+WkD0Tqe3zpwp/nfil7OvDoBdPMT40TS+qG8Pxx2og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225608

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.=
bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
index a3a69ae49c..6e32d1b861 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
@@ -10,7 +10,7 @@ SECTION =3D "fonts"
 LICENSE =3D "OFL-1.1 & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb1ef92b6909969a472a6ea3c4e99cb=
7"
=20
-inherit gnomebase meson allarch fontcache pkgconfig
+inherit gnomebase allarch fontcache
 SRC_URI[archive.sha256sum] =3D "f9463a0659c63e57e381fdd753cf1929225395c5b4=
9135989424761830530411"
=20
 EXTRA_OEMESON +=3D "-Duseprebuilt=3Dtrue -Dbuildappstream=3Dfalse"
--=20
2.51.0


