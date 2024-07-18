Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B715C3DA63
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 17:54:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.591.1721325265145777061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 10:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=792985b9a1=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IGqv40007322
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 17:54:24 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc8t16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 17:54:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYP8GWQtqsVFNEZl7EfGM5Gc9xD77Vf4JhC2WX8vGZ+kbRQv7X6LWnlbp1asH6v0iCVaHZdjtpXhhQs6Pvx/Du29JLkFKxeFNbfitTxVuCQ76mNdGlxn5Huywjlncda88tpeQcpDbKGLTYm9amoW/kZuZUHvQBiXSSOBK6sR5LCytskEpT4q6hw0Bbv9pSVBwnOZhg60POnmQttp9NEELF4yS/DQUPG5ddVGjUPoJZm6WB709joOmuKrtIYpxV8n/6F0kg0qufYMX+eZjg1aWEfCHFYeKvaLMQ3G6pOFhqjOkXl8iHX6SPIwDSbLdiAdP+AhuX/TbXwmw3vKtZ8etQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HsRrZ3fsT9oxuD1tLLfCDWeO4/REuyo4bgHAeDEsD8=;
 b=iA6cV6K9pDR0cvnQyhaYehBPA+2yyHHw/bU8TAABGSXuynl0T2Eo9m7X+S74ktQSb8oMmNcyVrlXHmrnr8BiISdNGl7L8fzGZ/IhiVUpyWxYSvOZL42MnteGb3HTj2TuW78y87oqi7PQB62By33hCioVismqupiXPhRBGaF4xdxewcLLXvNVZRhHapXWyDXlGI/ute4DV+zN54AHjBxQ6KxsrzySbeyZZ6wwnd596PardyPYRO2YzCXK1thWA2MVNn29PCLvnJWb4wcUM6MlsgJy0h1B//ut0Z9E0OZvInWrezZA3Dk80iutmZrCLNNyVXGWz2MpiS/sD5fSgM4t1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 17:54:19 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 17:54:17 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com
Subject: [PATCH V2] oeqa/selftest/reproducibile: rename of reproducible directories
Date: Thu, 18 Jul 2024 10:53:51 -0700
Message-ID: <20240718175351.3033859-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 25753bf4-9e60-4685-166f-08dca752a485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Izla443cfZc0Yo8ocWeBpB7OR4X+hQ5A+yjYn4/lPn28jCdFRIfMbpx7UT7O?=
 =?us-ascii?Q?rbfUTa6c5fi+0Iqo5GPVAvpaEYimo3mUaG5UKmOdeQw+Id2Ned7DvxyRiod5?=
 =?us-ascii?Q?WT0pwZ2qCO5lJrDUvn1dHxD2K5C30RMDD2QfIpdAkXaIUa4qK7+pA6hizZeO?=
 =?us-ascii?Q?uD5Ky1QzSYFQzyHRGO7AyvQvfe9qsBRf3+0Y85gI2CU1ApHaTvlI0pQ919d4?=
 =?us-ascii?Q?DghVkPisPppiY1kN1+Ni5yinR1QvZfvcL/gCH1zQjnzvpZAVgfKFtd4Sp0FY?=
 =?us-ascii?Q?l1KKUok15DNQqND6ZBWvM5fLA4XdADvtFe/dJSMK6ct3AnviyO4mw/4ng5Fk?=
 =?us-ascii?Q?PAHSzO+ug6BxxZZ45EovQxiH7mNX0roJREj759VJJ8WMNe5L7lLhpbbpKGJ9?=
 =?us-ascii?Q?6paHfSNlUgtgLB8HMKP6c9fqhSdVnYN156kNuNBnaASXxhpGigblSncUoGXt?=
 =?us-ascii?Q?hUGZDS+W09UYQKuD6zotM8i2071I5/PEPsvpGd9MG1NOUZViirBsT1wJv2qt?=
 =?us-ascii?Q?Wz0av7nP8TtOx2QcseNCRLJ7BaxMISRR3M1YgfSMyqEyV4mdlYwgkaAE/+mM?=
 =?us-ascii?Q?i7g1c/N5GIgaXkm4WfY+KVJAzz8pYE7RR7+PFvl9qQte2SpEJgohn+MlWNa5?=
 =?us-ascii?Q?MWtNOJJiloCQSjzmyOLX7BnigkCTKPIOQIJPNGP4XRUcKKphKQE2HZh5ZKgM?=
 =?us-ascii?Q?8vKumT7Cb65ay1HE3BBH7NC3n3npWFpM2l6oPLNYI2426J3/00qAm9bj4naO?=
 =?us-ascii?Q?p6hx/qIHuUktFcevpRP2auDvjuM55+Ly4yu9uRBHgS2AWupzqkyhDj51Oflh?=
 =?us-ascii?Q?x0TYnX2TtLPtVpshS2SsNZm9RAu8/9IKDqTOpq/+jQlOJdD5Z4dybaHQp/PH?=
 =?us-ascii?Q?xZm/SzsRt8uDoMumlqlujge0O5IXZxdYNinsfMJGXLnO7rOasmBdWw9j//z7?=
 =?us-ascii?Q?B2EOaxwP8LeKZzVpvwloksc1+LyilamggvX2RyEDO2knBmpwZ0kU59PSLDF0?=
 =?us-ascii?Q?L2RvB3h1TgIUGFe9jG3gnGj5GI5SKnIqgekd/qAa++J7v1hICBWJOGn4Zy9x?=
 =?us-ascii?Q?tkS9BaXdDtCnYIXMSIqTqxYqz/VSqb6Q//3hmikHWwkqDfWTzfBGcP/LjdMc?=
 =?us-ascii?Q?Ow39CGTKgL3FYaU/SYAMCC/RJYpiVU8sloD2/39OaLfaeWWriEjo2bMzeXrd?=
 =?us-ascii?Q?VwClr7i2wxGxq5/u6N4niNfKfhqxTYXL1zmr8NKnU3G419YyuUIb5P1Ms8l/?=
 =?us-ascii?Q?rw5T3oBWYwNKG14tGz9vRl7Qy5wUYkVLK27YeRk+T9Xtie6uknuwJL184iRw?=
 =?us-ascii?Q?nT7ElCqqyye5gJCAFV5QlMXTWawEVqmNC3tO/SJt+x+AGc8KimYE1U4joq/M?=
 =?us-ascii?Q?s+tgBsg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR11MB8683.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aSSLVnTvFX79wik3IngpHGqOeAlsVUXmsRidBECqM38WVeQ/IkGQTp1n6qoe?=
 =?us-ascii?Q?tcnRsi2hd7lZSgpIt85jUsuUwuZjXZww9Z/n04bREuazhehzIcDvCLgVzacE?=
 =?us-ascii?Q?aklSOxfUIbvTFSxxcbLYwOh+c8aZrbgytKuH19Kj0ys8Mjmpvahw6/BhNOEb?=
 =?us-ascii?Q?tPmKnFlPUgW+VAiFSEBJbct/C4ztbJyG9dVeqMLq76MqZveIZTopCLAQ3rGN?=
 =?us-ascii?Q?fz/1lWaBGOl4PFZftJTMAf2J+IoYl/nkcFivfqiUGa02LMsYtgWdymDY1uOS?=
 =?us-ascii?Q?kG+XxG7UcrZ1tftcWf3+xCQdUdMRa0801Ep4Nq1yb4PLYz7TGFLw2zM5CUWD?=
 =?us-ascii?Q?HVTL5wjWoElrPTzFS08/qna+s/CMkitAR4a4Tl2Bgh5Oz56CUBd9BXSwlrbR?=
 =?us-ascii?Q?QTr0+aXnGhGPkjAvJAOdR1FpM/OVKmJqAFWY/dxaedPEJdQP5nWBPJJ0b3QL?=
 =?us-ascii?Q?yo/+vf3hzXuV3vadT00EV3IeRcw56sIaQHojs8LRc3Kn0BEW+WlA6iw5wUfy?=
 =?us-ascii?Q?x4xtBvSd/SeKwTTTifGQihjkh0wwlAvemo7n/x87a9ZHrxeHOQ6Pig+1j+zk?=
 =?us-ascii?Q?Az1u2phn4eOf3yv84I5YLfYk+iMKhQV4bH1sREen8GRhSH1jRZ84izcILndk?=
 =?us-ascii?Q?v8/0cCvu+P7/yb9X4j9TsDooXomgZSpayCniHsPfFJIRPxaiEaR4hWmJizAL?=
 =?us-ascii?Q?I162Zugw1BDMK87vTw0U7H8os2cCjkrhCy6Qiy+JJ05Q2wRCqey6wMAFUBF8?=
 =?us-ascii?Q?aRBc7ESmgsjobAFKqxapjzZxS0rJIl0JFpup07Z97wODdv85nSrXRgs4Ifup?=
 =?us-ascii?Q?wdaZ0K6e9/fsEaUghpPLnJJrVB8e0zkNHL8Jh+eWPjPBepUaY8QQ5VYEncZO?=
 =?us-ascii?Q?P6KF2joqiUu12/GREzDRsUZvqBWs2whOt4it+MXB8EeLfbwbzpj1CDjdxnlx?=
 =?us-ascii?Q?GFliaGnHJ6vjvgSJEWxETxwaQXQNvgRZAhM7Jj3IEmSfxDjGBClj+gkmWm3z?=
 =?us-ascii?Q?/aspfeG2zs2c1Itlsfm55MUP/182R4rmunToks173VMrsNlDu24LaQmQWQHf?=
 =?us-ascii?Q?6h1n8b7wiS6EOtqH/MP3zdIci42HPGDkK5DiOknU+QAWw4imGuoO+yfsWqcv?=
 =?us-ascii?Q?jz9A3xaQZ4+sJU6alVZ1pcxyxh22flqHC+ICmybC8rWuU7ed3te6ebGA+cVs?=
 =?us-ascii?Q?YD0GImNP15hmQLCI8LG0A3qD5o6+AFUM0/nTeOUpavcXuQQ7HTuVi/W/bTHu?=
 =?us-ascii?Q?fWWO9ugMPnrGXcMeHgsumWaOl7G+FY9HN8R1rMImsqJahDr7nduHMa5xI6I8?=
 =?us-ascii?Q?1y7apDJrGFu/mfPqcbctRyqY0MLpfujCKyO9GS6Vg+CxEHtNdPZshwZiA9gn?=
 =?us-ascii?Q?UiAGGVoYCG0voUhZV25Wy5crHWy8QapC+xFbsRve912eoBVAcVE1IzVqS5W9?=
 =?us-ascii?Q?iSWxIdYuGMkuyamZv/DjhFYNXRq9DZQXLtPm1y3889VOV6XFuyhqNvNdIZYB?=
 =?us-ascii?Q?Rd6qUaG6AkKmfdjC3zqYbLDxxEWDYc7SBGn4AXvjRNyTigbCMf5/T8sIwdmL?=
 =?us-ascii?Q?Tf+xGBGbeFh0SoDLg6pDS7gvsJLxfxSCXGnSgztF2VGziWriSfPkJ+RS6ZGk?=
 =?us-ascii?Q?4dujx3QGAZ97yKmkypmNAoc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25753bf4-9e60-4685-166f-08dca752a485
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 17:54:17.0522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nub1aZJ66zOx7O78+Blg5f2AzmecWewT/rJ/Tb/tx5KeYcXYN1qh5AbHmG/VUskdIA9I94PslScAKq+idRWxKvc8C2XwCnuErmW2VLKKOsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
X-Proofpoint-GUID: yp7OUfjoZAglOFftE3ixxUOk88FKJ1X9
X-Proofpoint-ORIG-GUID: yp7OUfjoZAglOFftE3ixxUOk88FKJ1X9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_12,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 17:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202234

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

We do see a few reproducible issues are depending on the path length of the build directory.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554

The current implementation of reproducible tests having different names for directories but with same length.
The build directory names are changed to have different length.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 7c6cf3eb1f..5460f158e5 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -276,9 +276,13 @@ class ReproducibleTests(OESelftestTestCase):
             os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
             self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
 
+        # The below bug shows that a few reproducible issues are depends on build dir path length.
+        # https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554
+        # So, the reproducibleA & reproducibleB directories are changed to reproducibleA & reproducibleB-extended to have different size.
+
         vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
 
-        vars_B = self.do_test_build('reproducibleB', False)
+        vars_B = self.do_test_build('reproducibleB-extended', False)
 
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
@@ -333,7 +337,7 @@ class ReproducibleTests(OESelftestTestCase):
                 # Copy jquery to improve the diffoscope output usability
                 self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
 
-                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir, max_report_size=self.max_report_size,
+                run_diffoscope('reproducibleA', 'reproducibleB-extended', package_html_dir, max_report_size=self.max_report_size,
                         native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:
-- 
2.43.0


