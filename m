Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3B4D41C33
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 12:38:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10473.1731501473859194421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 04:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1047230667=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADAkLru024485
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 04:37:53 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwppa0v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 04:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvmUDMHYQcE9kPf/NeaBWfcijfBmmHd3n8sMdt+dk8VscbONrFfUX1H5arx+WPFzcSMYjLtfDQW5XZqNc6ktQwI5z+Mq2CcG8/NmlsSVbareG+qo+NZvLCrrif68qIW7zfEwCcQ5oR+oocIiofI3Xzf+8O9uW++KB4ceCPKj9QXBeHej6mxXkzNdP8KtITAJdzsUAVYJESu3bROFSv8s6ptE7FA7mhFsNpQYeNKshU1umT3nsUf5ymeoboX38ria0+M0GriWh21R4wc9qtmqAH5z7z9zms96OCoODbeFhSEGwG81hreBfclLyX7w4ER7gmaWWog8Y/EpsD25MPvClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evPgLL/3FBl6sVZOqfMFegboiblYWLl+JbBK3yeH9Oo=;
 b=wy+OlksDLR4ONYhxQF7RFDFVVrjQevJk9ElgesaPFEhyLstdLz7n7uja5D8vL/7nZCSInu30ttAt4i38fnnHCpQmlENeY0HujYmoSaVTTdPlxOFeRYJyahNlLBldVsnhK2HW7wIflOR+KZ32mhPJJctXMXaXw5Ff9ysVQnE8XLY1XJTpTKlctjNDquK3AZIPWF021EGwx5NQDAWdrBrHrXlVRDza131LFUxSxwYIXC6/u1wgIisfo1WFuiVSrCeEprs/+vK6HD+GevQuBkq3gYvLm8lkBw6kbN2Rw8y42E1+sFsIz1bXEoZLIpWybC/Hjr3sud07gwXhFjKcGz8lkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by PH8PR11MB6973.namprd11.prod.outlook.com (2603:10b6:510:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 12:37:49 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 12:37:49 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] glibc: stable 2.40 branch update
Date: Wed, 13 Nov 2024 04:37:33 -0800
Message-ID: <20241113123733.4190180-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:a03:167::38) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|PH8PR11MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 990d4dd2-ff93-4c0a-00bd-08dd03dffb9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?51vxz3JrRI3053jFcB/mFiKJBKMYIFQiOhx2P2fSAKTXmwola3wFqReACdas?=
 =?us-ascii?Q?DHx1Vbk/FAw2qdROMKWrs3nMyUyFNSyT3icv0S6ldLSReF2tIgcmUu+nZEay?=
 =?us-ascii?Q?wixFo4ARZZUf9FhYYsk1BVQqH9N9em13l7hRkFaWIWqytlMrvgH7Hjj6gXtC?=
 =?us-ascii?Q?FQ7aeIoPs1q7IGYqjSGQnDRabxFnPtboPiVFoUr5q/PYkLy5gIUPlzdmuBuT?=
 =?us-ascii?Q?zzzEygeRl+ScwT7vRu5Slz9xZtjuOusVCjuvjcnBpNNm9c5LDn//lSSgcg/E?=
 =?us-ascii?Q?OoAgpGbFIBPXbtzLQcATkoboRp4xRHWyVZ26dcDjuHROo4YkE7ENLTHB+NTi?=
 =?us-ascii?Q?QFiwuCMcjmliWRbUhewt/xSw4lt8gUVk9t+Gbx3CEnDUYH6JOVWzAVzGLCsZ?=
 =?us-ascii?Q?bpcFDQBG0beLx8e80Q4+lnem8r2HNvJ0pp/0rjRBPbmn1qAH6/znkjm+uiHG?=
 =?us-ascii?Q?ECjzTX19vQey0YrzYkleyxIBoBSnS6aL4cz5y/CScYRZaR3V/ROsPedrRx88?=
 =?us-ascii?Q?fSEK+2sXwGS7rPOL+bcAek3jrkO490KT2/tBi00ci7+7iv5rYMWOZiJ4hqkc?=
 =?us-ascii?Q?YdJLsWZgtuFf81WaHmSMQI7dx+2ymC9B7f4Ih1/BcfldE800YJvzyQU8K6Mg?=
 =?us-ascii?Q?XTIQi4D4Bqxgy2TqFJdKDbK2CHOGeBzQySZCFtPM5CO6PKxXOj/myXuJlsny?=
 =?us-ascii?Q?NLg0NCp8ZM5gJkIgJVQbKBeKoREjjeMJgrUDGTVaTdtY5LUYtGBKGdQ1VEtO?=
 =?us-ascii?Q?yWCOCYDYBM1gNVk4vCo80FH7vjkJOKIpheZ0yePl4n5K0f0/b5eF079pLTaF?=
 =?us-ascii?Q?phkMx8eZCm6EuFrKR3+pdYF4RogyNMVyvQrZXY1N9sidAMhdkB6D4m2bXFPe?=
 =?us-ascii?Q?Kfo465Hzu2G7DTw3PXSPHLEKoESgNQcPCrZLS9Xv3rnKM92SHj/kQOoX5+Ka?=
 =?us-ascii?Q?qOsHdv6Rm8fOS94vVRX2w3jWRvsK4Hz57ovNirq9bNbuBoFG1XNSLjLX+y7i?=
 =?us-ascii?Q?lCWYRIMJJFNr4iHn3tQ53umybX70tmOMI0w2w8VYwL2qMpYDeIyxJP5MQ5Wk?=
 =?us-ascii?Q?TfAZKcfTwb/48PDE+fwim8qlqbw/kyjWdtVRRLqcb3FziTkTHzfVqBd7oUuV?=
 =?us-ascii?Q?p6s1HXMabRXVbibRrSusJH6ONwx6isgadn+LOCGFrlfJK3lo1yx3GE9K+AWJ?=
 =?us-ascii?Q?XYp+Dkg04zmIH1RN8DYQsBLXAn8kcEGpNUWiNWnWWCQYq2IkAVGwzoz312gJ?=
 =?us-ascii?Q?id+fQ0NWAf2QJr9tpyCYB/cPmXCfX+rvZPKtOt/7Z+2hBPyjKhEVbVMk3Eyr?=
 =?us-ascii?Q?Fo5FJEdXd+lSV+EXij/FYdqpncSFZpgXjTUwbuWWDJktSPMpTVtLnlmegKIt?=
 =?us-ascii?Q?RNeAqqk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rDi67nstjtYuIaZOe6sboHj8Ta7whNeJKWFAeZZqvoQLEhoFS4P83ZZrl9KI?=
 =?us-ascii?Q?Cy8TsGxj33JJGECTf8ZN0JiGiRjziosyjtklWwm1IUSvix+MGIcQA/acirx5?=
 =?us-ascii?Q?hCX5sSZ9/V2XyAHfLIXRryisBAAPlJx1dtzIqKO7aVrh6U9n1M0kl0KkFYJt?=
 =?us-ascii?Q?0hG4rx39psHPbn3b+O23VgaapRzwtn6FMCg/bxtua+5KWVwwQLTA2mQEfNir?=
 =?us-ascii?Q?LV5G+Er6VA09zSHSIEAPiXIc38o/UZvJ6DjTCtAHSVVp8m7CjZ4qfK0wTzR5?=
 =?us-ascii?Q?cpLg5gXEHseu8BeTduzaWwmSH9kPop9nqgOT3LpNhbuhJaBnVWeC/LHN2Tvh?=
 =?us-ascii?Q?uIhUiKGxOo1FUAK2Gvuo/demT007N1LA/fpD44SWHxVLLHrkjpC8PYXaJqnp?=
 =?us-ascii?Q?06GPMDAqoBgV63f7NLQUxiNi/wls5Q7GlBK5Yhz/233j0JEqRXZIh8yGg7Hz?=
 =?us-ascii?Q?utCSTT0p12nj2cjOz/mO3uXU34hvNJnKSAgrcYegFe0c8S874mpU1MsmnrI/?=
 =?us-ascii?Q?+QPz7UTLmq2+CDRl817tTnPPKtPtPJyG9OMmfOF5A5DIagIcXDB2a3Aroi9U?=
 =?us-ascii?Q?X2m+1aMwhO3inBSV7N5e+372rzTunNaaHOcTjnIyuW2H/MXaqnPsexFcXIxH?=
 =?us-ascii?Q?7MWBW3nlflK2oDyp+i7A1xUSt73bfTEP3EU/cM4OsMk45pz0LpEYrddMg9G+?=
 =?us-ascii?Q?lMDsASRnmkeO66Z0waNipagxIo42WQ3UOy3pX2BnbF9k9hn51CTR8Tp4AqPr?=
 =?us-ascii?Q?ItbjMpBeQPOGYf1HuykG9kqb3fyRgzPo6YTlWNVf5LFEgXsYT/q0yKM6tbO9?=
 =?us-ascii?Q?rO0S2r3sXDPwC6Sy2ZtURYTe5QuzU4LEaCnv6tHm+xBI56xkjyWiykos1a85?=
 =?us-ascii?Q?82DQQqGo5RyAHGCxHnFHO+qyTEGFOx65bYP9VdJU7TxB+hP4HyMR4a5LYDgk?=
 =?us-ascii?Q?5anqIuqAcl+t4OwNkmkTEYtc0f8+qc+9dUWwXAXQ+PsDWwYP7/UyA+LCHlB+?=
 =?us-ascii?Q?HFqMF2JZ20hqhA8FCdwjsMQ+MmzaqLkZ2z6/KF0qG4zCoU2sDTAfHudUaubx?=
 =?us-ascii?Q?/p3+Li8j54U5d5vp8UrSdql5nvjdcMGD191/5mpRLAiU1TrGnpo41gR1y2k/?=
 =?us-ascii?Q?xPvyL5xkPG+a5QqTbkfh5r3R37E00Tl5C8yVmsoJCtDvMiTsvbJxJrdkQQ3y?=
 =?us-ascii?Q?3AMC8GeEvZVagUXo9JgECkH5sDCOAS8C1JbzvKuqGcB/sRbW2BkCbAB59ZiR?=
 =?us-ascii?Q?7g6gUkaZo6KqaXz5WyqAzhs/X6zzG+EsGgMi35ifzRH1+N5kmNszqic237bg?=
 =?us-ascii?Q?QmaQ2whTgjEXksrBqzOOFwQYH7Ad6D5zwGC4sra060F1jkq5s/8h6QBsPA7F?=
 =?us-ascii?Q?MSPjYewB6Q3lynZoQTOIhMQ+QYUoiCmaSmVqQIapCHT2vlJpLTzy9ofpZAli?=
 =?us-ascii?Q?jUfDFgHp59bP8fVctfPpCsaPiVfumKAyIlsuLryvQVQ7/R2Xa416ufI6M7XP?=
 =?us-ascii?Q?fUzOuMjHoDUhyqdgUWw8KZLNb/tZp2fSzr1o//+Jcs+I49+3T0j9NehwejH1?=
 =?us-ascii?Q?Aqw3cbwFLjPZfZHq+WZuRlMh+R4RfmTwpd3PlN73/QQGpDIgoiGRFduebzBm?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990d4dd2-ff93-4c0a-00bd-08dd03dffb9e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 12:37:49.1645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKuASeJiluvZrkcpNbt/TULy/xwHqNdw3LJnNVxDxyn4FcI5v+c3gQyjl0m/EDAlshZA3NwUc0+s9svNwwGS1ezgq01br2n8qA+9OMGgSB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
X-Proofpoint-ORIG-GUID: 2X5p03eZjH49lZQtEbOKiXxel9CClto1
X-Proofpoint-GUID: 2X5p03eZjH49lZQtEbOKiXxel9CClto1
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=67349da1 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=7umbWx2pWX3K8tXTQi4A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_09,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=892 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411130108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207096

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.40 stable branch are updated.
efb710034e linux: sparc: Fix clone for LEON/sparcv8 (BZ 31394)
2344580243 Mitigation for "clone on sparc might fail with -EFAULT for no valid reason" (bz 31394)
3a34851103 elf: Change ldconfig auxcache magic number (bug 32231)
85e5850f2f Make tst-strtod-underflow type-generic
5c06c6e0b5 libio: Set _vtable_offset before calling _IO_link_in [BZ #32148]
cc256952ec Add tests of more strtod special cases
8f40dfbe2a Add more tests of strtod end pointer
4a9b6cdc88 Make tst-strtod2 and tst-strtod5 type-generic
5a10d05c39 powerpc64le: Build new strtod tests with long double ABI flags (bug 32145)
c4cc72d2ef Do not set errno for overflowing NaN payload in strtod/nan (bug 32045)
ad93c2047d Improve NaN payload testing
cac10d88c6 Make __strtod_internal tests type-generic
d0c1792ad2 Fix strtod subnormal rounding (bug 30220)
e06153665f More thoroughly test underflow / errno in tst-strtod-round
9bc76c7ca4 Test errno setting on strtod overflow in tst-strtod-round
61b6464f8d Add tests of fread
77018fd9f9 stdio-common: Add new test for fdopen

Testresults:
After update	|Before update	 |Difference
PASS: 5005	|PASS: 5002	 |PASS: 3
FAIL: 166	|FAIL: 167	 |FAIL: -1
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 229|UNSUPPORTED: 229|UNSUPPORTED: 0

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index c8614e3c60..b349560a0d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.40/master"
 PV = "2.40+git"
-SRCREV_glibc ?= "7073164add3b874cf0c19ca0fb84236f6bb0985d"
+SRCREV_glibc ?= "efb710034e4c5e734d100cc4ef1b1e27d4315825"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


