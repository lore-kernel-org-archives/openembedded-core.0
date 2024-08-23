Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EA8C5320E
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7352.1724377703276028694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MBhYIp018581
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x11n-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRKexHZToRxFjoFBFo/qtW9U9duj0UJ34giZR+t5/VeGk9EyUottpp24nPiwbeY338bdgeKO0yvy6RwgVL5NM84dJThQ9nV1hr4wplO0j2e55mtDuOVRPmVRjsLu3IMPjYvBqnD0tH3gMhD5fLmwya8PMckMbs1F5yasvrtiJTOZg4PKizXmdX1N8F5bn5oJRxomHwm9Mx9VR7Mw0/Yj9wTASGzm4xejA9N8XXDAF/SxwOjtpna4+L9/e4t8YxlMz+ts3q12CYmZhWnGyN1ewJ7Sb2zR04s0x544TFZHQhWeZ4K3SP9+QPXsLHs8WKnZcbEyA8h4iAQ2bL9WqZDgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IW9CyjTl4jutPi47k7nIT4Ozeqq9nWQIHjNVi8qQkE=;
 b=S1rbo/xG7Mqv3QF2fEWO8osdouh39giySiyD9FZA3tDKgZ/dCKs3r5xncgYHjE466xaeqsrQeek0D2ajIc03vHzA1Mdc0pgZlim+JHExMrH9MCsb60gvabj0s5lYZAllrbHHI1+23PXvLp7I8HVzfrCRAGCszZ5pzNgOWH0XQhB7MCyUtZN1G5mQTnfghED8Ph/LbDgCBu0gSIoR8YKPBlYbDK+ncxT464GH9/Hj7FTvy3Xh6PXi1okYnJpfoMRx/30QJiSQKST0hhGdMdamIwE4lvNI0Nflsd5bEWRjrQSAnGhVFKn2EKqAPrE7495CGg2fFGhJ5+5WsxFMUdvedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:19 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:19 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 3/9] libxml2: 2.12.8 -> 2.13.3
Date: Fri, 23 Aug 2024 09:48:00 +0800
Message-Id: <20240823014806.4154590-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240823014806.4154590-1-hongxu.jia@windriver.com>
References: <20240823014806.4154590-1-hongxu.jia@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4f2ed0-36a0-4745-0258-08dcc315aa00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rAm5eA9VVMmGu4wGTBXBapq8wIImj1md/8OiurXIWkTqNIUUNaYtke6n87sM?=
 =?us-ascii?Q?C44w1a32EHdmUxkdFRRsY3/8p62dEjGunXkfAfVRBNL9B2oFRO/2LTkugvM8?=
 =?us-ascii?Q?TQWUyVff/kTu+1Tyh16F7+tE2W5tp5C2uF7JGte2xrsdBq52titfV/FuLLXu?=
 =?us-ascii?Q?oSbr8o9kw0HGQBB6R0gN6Liq3mP+sI8vMVmDYcrN8ZwUwF0w5NglievhVQ3y?=
 =?us-ascii?Q?FXkZDXOKfu4JCQ7TcjQ7uY4GCEUFDWvAqiagcnCu2OFQC1l98Saz7Ibam0TS?=
 =?us-ascii?Q?FvyTwI2SgGT/YkpOs3cFcBE2qzT4IDqkWho456vHuXil2RqJh22pWQ0hWIym?=
 =?us-ascii?Q?w6qZVOgjmFqJMxLsl7OJ4wryWQ1NFPCKMkW3+/+OdSb7hw8lJ5b68FOw7WSy?=
 =?us-ascii?Q?onwZl+kVEXSwveWNqekbERkNcpwhQ69smGn4mZat2Y5hG8//EnYdFNFZ3HB3?=
 =?us-ascii?Q?O+MUIkVISS5vwPi9ovZV039gXmwy2YU3LDzBV9CZ7icC5CHQ68L2lPE7as6+?=
 =?us-ascii?Q?zzlVf2fEC7i5YMo7ZVeOqkpyicLEgvgaAJy/qg1r1kj2sE399HjSHyNB38gl?=
 =?us-ascii?Q?7/9XRI2zkky/F6chb6Bv6p5ncK5UlrQnSuVIS75nFha4NMnYWSlQRpXVrqYY?=
 =?us-ascii?Q?Y0ZvGuRsvvcj5SdeL7OckZCbAWIehtLJO96r7e70+ey2+/MTZKkdmUJt00rn?=
 =?us-ascii?Q?jo1wAltJaZ4/vp/ThCm2H0fwy/RLg4rtOvP3tX1980X2IKhJRQohg05LqUvK?=
 =?us-ascii?Q?T91dZ/4KBOgj4SwxeVbozbUpCIYji/ZMpIpRxVXv0wr61+TcwfUFJS9UO/fU?=
 =?us-ascii?Q?RoStribocQa2XLxHfSrecZCGrX7DVRRmZqorPhpQR2Sw8q0u46c7QeDJb3Xo?=
 =?us-ascii?Q?JmmMPQml335ycAMWw05w69Vj+3hNCt2P8efFDdRTtt9jDTYEOS1QkRlxMhF+?=
 =?us-ascii?Q?fxWLPokzjv45Aj7UjdTxh4NnFIRgoBX8fAVmHM6SFvMmTd07ckrMW2J8oDGD?=
 =?us-ascii?Q?g9PpEhjO4/5RYRl2IbgZ4NHhQ7Mx8ZAbUbqJKV/fyS703nq1vXEn/wlgKZNz?=
 =?us-ascii?Q?mfchlU/Ldd4lazHbF92/S8EXIOHCWLvL+eNWq5rWvi1jkmpgYD8qa9gZRNdZ?=
 =?us-ascii?Q?NaNNqfl/fJ+99eVbIyHo5gP1UXbZ4J4ggJcMqBfoG6fnYJiBlpv2HgSza8Kj?=
 =?us-ascii?Q?ZqsdZBJPDXjrNzfKZ6KQIaRVo08OUyds8+IZqJLvuJMi1K/GxXVhJhDRp+sM?=
 =?us-ascii?Q?jmGEZV57xYSKMk4QNIWMOJY7ebFl/ZEn4FO7Qd/TA9+ESlhq9YYu0Rn3Jygs?=
 =?us-ascii?Q?KUhlP0yScRJnJrwX9LaW2qgbSUpKJcowkqrOCwj+GnTO4jOa+IqvseLz7YCd?=
 =?us-ascii?Q?EjLDRUM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KU84/pN3B5Ow5up/wZtv4Pkf+91xxp40Or9QY/iqnwdTUZvAPH3ODpzBpBZT?=
 =?us-ascii?Q?g+vPMxESdQs/2Ec0cLyAXPksTDwuz9oDNYxJutD4PueTLSJVXu4bdVmA+Ti/?=
 =?us-ascii?Q?KQQcyt0zimjdWf43KJKlX2THsFZr6uhsRksrDds0WHvWV24MkTAjaFgwGYLL?=
 =?us-ascii?Q?aGat+dMvfJeUmyVoiOD+keUq2OOqAE4/nA6frB/rqF9Ecb7Qn6M20rPu3Zoy?=
 =?us-ascii?Q?8a9FQLAdP6GrAc/hOwURpAtxOEDFVDmuRVzk9nt9lY8GhMELmHQKsqSwAYWX?=
 =?us-ascii?Q?nt9IWsCBBStMSB+VaQTIPodxcYGwCgd8GStLRhUw06toqDIMTe30F9xf/4/R?=
 =?us-ascii?Q?q6eKg7gU39HdVd9kvBrxX0OOJmMdB9vvKkm4aq37cAbAjyFBWlEdQoPjbgc3?=
 =?us-ascii?Q?5TZQS6l5ltoiOL5wzKfO8zDcfHL52zTM2frJhk+AFoLmmMplvU9GGdFupQBW?=
 =?us-ascii?Q?CvZTi9RSppO7EHwsisDrYyKsXePcXMP2s0zX+9MdTXE+QMeto+RVrlfKj+Pn?=
 =?us-ascii?Q?eZ35nW7KGUkUYHpigm95XMzF+es13H4eHQxlZ4kMVg9AmjsD33rBTt7jxPPU?=
 =?us-ascii?Q?uqWvVJ9cGfkFZ2HsnOTjTJzL/P5FCbjKJTE5XP6MNFaU8xrjJO8P8dxBEEl6?=
 =?us-ascii?Q?A73ec4IDwDGcfjrdR4XdMr3KJHmxijBKW/SditWSvwat52YaJVtBiQoJ4DLi?=
 =?us-ascii?Q?td7RqtWPTAmoeHcBlb81Qu2pY65UDxYLa3eo/YRIesSH4HzpaMLQm4uoYq+2?=
 =?us-ascii?Q?pC2LV+3FSPSFQRi5cd9fARJ/sGuTxW6dPrEu8RHR90ZnljDhyXGwbOVCqREE?=
 =?us-ascii?Q?A3tbDlk+fey40pQkxY2vKH10G7dFB4wtkHO9lnLzKRoMC2Lt7T+KMs95aBLZ?=
 =?us-ascii?Q?kYSqKdY94PRujF1nevv1QhxEJUfX5iphJCS3QyzEBKsjQcjqC3GKcx4pmQ0T?=
 =?us-ascii?Q?qYmH3Rt9lH3w8Hwi4rrtQzgVllJuvP0QymkmEb25nzZ1uSZGFNk9kTLCJqAL?=
 =?us-ascii?Q?DZ9XRkO6c6Bh4/HKIOuTt2/0SqH5PXFNkMND8VUD2exTiH5IOFCG+x5fHfnB?=
 =?us-ascii?Q?pCHtTfwqcgOs9KrNlswE3SQRjjN1g0jaa9FsSCRyEUVvSVxV+5j85pKVo48o?=
 =?us-ascii?Q?PeqxEMlRH81LyHbeopkd7xWvs/K/eKMpGhIl6xmqAxJGXzV+cN/bVNDONdtZ?=
 =?us-ascii?Q?KG0ra6q7GBAavqsGjzY4qDqgizAWRE5QL3PDpbWwh7EX5uPZUY7e+yy3I4oc?=
 =?us-ascii?Q?3zmvF82YN/ysu0HGL9YT82lEPJZW8tH/xSaFEdehCk5v/YaXnjyEsRU6FfPl?=
 =?us-ascii?Q?kESMqDmMH2vqY3aVRqCWJB3zIS7w9ZFXquwUyk2raUdPaiFnREy2C2G4niBh?=
 =?us-ascii?Q?eSnBpwR3CrAdd/EYJe0Yw8mHsalkQ13eZhqnvGaNmAfpyQPvKDKqq/jh/rj6?=
 =?us-ascii?Q?HkNdeIvC9s7t/usC+QXJr8hPyIR0tPPiekYI6XN+NlesBd280VeNUiIZnVE5?=
 =?us-ascii?Q?Zo6+o6F2DsgWm5QUTJmvCdCtY38Dgqp29lTpj0a6Bk6pCaaSnewHWcR7iQgo?=
 =?us-ascii?Q?42qUiNJz8JhVHyEAHWC/lzZhDlMKmKap4adqB2MwJsZLdpOO6cvo5MSD/1Y0?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4f2ed0-36a0-4745-0258-08dcc315aa00
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:19.5380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7AfofSjVO7uRKsjTHvU9TPIe8DnOJkgyIt0DAdn2DQ4dq1EOtFlKifIEIQULEb64qlrmMJ1p1XicM45Gj4H16qOYcluAGI6JWB1b16jmCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Proofpoint-ORIG-GUID: MoKLLCfQWRXkU9ycGLczOakoLrbGYFgj
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7ea66 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=aiIX5UjjAAAA:8
 a=SSmOFEACAAAA:8 a=xQZ9gNtfWTOmVUv4kpcA:9 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=K4UmP72BP_XnEf30ZnvK:22
X-Proofpoint-GUID: MoKLLCfQWRXkU9ycGLczOakoLrbGYFgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203670

* Remove Trio and updated Copyright to remove Trio [1]
* Remove --with-fexceptions configuration option [2]

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/7d6969d95509a94347d6f96167ac5420abafa291
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/e349709ae7e07a2183304ccc9352b6ac86f62a18

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxml/{libxml2_2.12.8.bb => libxml2_2.13.3.bb}        | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.8.bb => libxml2_2.13.3.bb} (93%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.8.bb b/meta/recipes-core/libxml/libxml2_2.13.3.bb
similarity index 93%
rename from meta/recipes-core/libxml/libxml2_2.12.8.bb
rename to meta/recipes-core/libxml/libxml2_2.13.3.bb
index fb103f0273..df24f3031c 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.3.bb
@@ -4,10 +4,9 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://Copyright;md5=fec7ecfe714722b2bb0aaff7d200c701 \
+LIC_FILES_CHKSUM = "file://Copyright;md5=f437ed9058e8e5135e47c01e973376ba \
                     file://dict.c;beginline=6;endline=15;md5=2b4b7b827d2d8b080372433c4c9c85b6 \
                     file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
-                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f \
                     "
 
 DEPENDS = "zlib virtual/libiconv"
@@ -20,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "43ad877b018bc63deb2468d71f95219c2fac196876ef36d1bee51d226173ec93"
+SRC_URI[archive.sha256sum] = "0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
@@ -52,7 +51,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
                                          "
 
 # WARNING: zlib is required for RPM use
-EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n --without-lzma --with-fexceptions"
+EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n --without-lzma"
 EXTRA_OECONF:class-native = "--without-legacy --with-c14n --without-lzma --with-zlib"
 EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --without-lzma --with-zlib"
 EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --without-lzma --with-zlib"
-- 
2.27.0


