Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B10C369CC
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 02:55:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.195.1744858552535397032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 19:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6202e9a415=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H2ACnl016010
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1npcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urcTdQLq0XHneD5f8F4KkVF+grq932vZVOJU5gQDafHMPUCo+8LdkGqawz4t06WP5BIOLXY9tZEku1Rs0UJ1eB70eLwVbCfmGrE5JlOICNUFTuQujdAtd95SOw6RRy1BEULII+Hcu948GRhghkxdgdunPkhQtT1mf0PHtQMVgixopREsmGPYQYhGC9k3/eNj/LyWpkq3Ca2F0R2vFtNMJcgnKGQrosTVoClGtrJDSu1VYk/5ocAFfzMSpYFBhnHFkKjr54F/Yx2fKf0SkEZT77MdhhGleHebyffnVykvDBV+nzfXmGRBB3rzN2Y2QvvOmC5IU/dqMtdZk1mz/S7hhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrPzlXpCxxR0acO4pYTsgO8/78FO0/2DMZhNKzsbtdk=;
 b=MY2ZboEH9fDlwyNtoWKB0b2E0/JlLcLctHVx6/shYUhFgzwYru1AA1mT3PZv1arQ558hSPhaH2niMQWlTTI+l5wrXxH8uuf63/pjYMnktINGpOxYBivvkoqqA9BhAK4Sh2/5MgtP4tit7upNBsaX0lI1ucqJHASksSBUR8HN4H2NDz200iIIfP7CB/MMFlaOGQU9suhTFuVdBusWfzJ3Hplixs+UV2LqvVoDyP7QRTd0dW+3rmfCv+6ijeGYkx1lsdpZG83phTQw66NeC7ui7GQ1qRYp1ZohSbljRMkcfhG1Z6qzndb9KlBlAzE7YOI5tXVh4C6wpKbAPA7MgoetwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 02:55:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 02:55:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] libksba: drop -unknown suffix from version number
Date: Thu, 17 Apr 2025 10:55:32 +0800
Message-Id: <20250417025532.1363790-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417025532.1363790-1-yi.zhao@windriver.com>
References: <20250417025532.1363790-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbaeef8-990c-4b31-c175-08dd7d5b5c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SqQfKGf3UF2VMOYTMLon6AFMCAnDXqRDvNQQbKRS7vgExOZHAIcA1a5uhHH2?=
 =?us-ascii?Q?IQXDL6NSsKrnEoOdtdE7F0W6ZQM4pcOmDdGKKMs81OvS1xALeKfBc3/gIamk?=
 =?us-ascii?Q?md/1ZHxiKW96dsmoc2K3vH3+n2kQwVgE7OBsLFFXMTlec/t5SJuDI3n8lsKE?=
 =?us-ascii?Q?qRKs/xbBGKSELq/FPkaz2rB9pdsCSOLMhyT5DZX13gAtdCfCj30Ds8EhYm2A?=
 =?us-ascii?Q?Betq7dFvHH5oFx13kPximEUZsLML46tLAp6v9xLmjbfiLUrF7LBdYs8aywKV?=
 =?us-ascii?Q?awVyI6gWNvHJzN3Hdl9DNMG3vUBrPsUJ7CEEsiQN5cUut6kfI8cdcB2xe7om?=
 =?us-ascii?Q?y21f71XfYrrLuYF8ZtPWxRr/CxF4GfeubkNPjW1BSassyoOsueS/z5pTtZod?=
 =?us-ascii?Q?QwkFii0pFr2wdrLmW44mMqN5mgzIuAM9VCTv20I6EZx2DR47TvKw306k8wZ5?=
 =?us-ascii?Q?Ca9HziYWEuiMXn4zRZsnpR2PR9K3xvjgkeQ75vc7Xk6+u7KSLfHiAVISYZY9?=
 =?us-ascii?Q?WDgwrGEVt/l6futILG33VNPyM6lYHQneefSay+nIYTyypmcc7Jeu2ghrFtb2?=
 =?us-ascii?Q?SLDA+In4PZ6SPmX6YlcClhmxz+SXrtOz4MQ22/IlLN8EF5oyooySg+FB0BCE?=
 =?us-ascii?Q?s+Nos5W15e26fHmregtLhTBzGOUhJYS0y5FSiT11pUfQRs8dvp9G/xDbk/0J?=
 =?us-ascii?Q?x5c6UlMuzMcz/9z4t/ycLfodZsoXpcTr0cibnH8z8eYrWwnmndWsZ/hAsYix?=
 =?us-ascii?Q?55oavxgWgGyllIMTgeSOv/zMXIp7qKWuuypCy6fOSSV2Hc2ERwApjazRSJJ6?=
 =?us-ascii?Q?hlTJ3zG03bXIs8Z3/K4H6KeHS2yGJJVvAaWRhWMdM7dlUBvBgNOHt0lpwOQC?=
 =?us-ascii?Q?t0EUELj98QwPSxVM0vqsRu9xhNOVo6qiOKsed2AvaMo75jSq6yQSEVz9J+kg?=
 =?us-ascii?Q?inouXIOH0+lhvELoXxJoY8RtBEq/HTcEvldyI/1J0POzfvcwhDvayN3efBAk?=
 =?us-ascii?Q?V2gIzO4ajQw67+Njc0YYIE3MaoPQLZOZQHztjdIHUb/AqOo7S6kOo3Ni1sBe?=
 =?us-ascii?Q?K3PqfpOEnO3NkeWVd2A4Ivfoi/8mtvKnVALIbj84WSWtGDGA6+QYCZcZ70PH?=
 =?us-ascii?Q?9VE8eezThQzgN7D+Xij2RL3NRcgF7uwAOEzakz8s7+2AVeCnu7JDYjY3yhyf?=
 =?us-ascii?Q?YGujMaanWO4KAw8B5Z289QBELAYDDxLm/bbv3rj7kOAvT9BJyBB7hZmOT+GS?=
 =?us-ascii?Q?kYAgVyQb4QtBBr6I+kOJZ3CNL0VSljj54Nr+PiRaDK+kWbrhXCZbh2MOkFYC?=
 =?us-ascii?Q?IuJHtPWnx3uktQH4PJN3NCd3axonydPwMPJKmUBp0CBK9JRPO0kRVSaesOOi?=
 =?us-ascii?Q?3XlCW7Nylr/ORljO64rsMkoCd8oudIFm5keTbAKLD9pFsMklHwQXNvxFFfBV?=
 =?us-ascii?Q?2L0pYqN3ObQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MV/B2ihs/aluoE7/i8NsWxWw03IMKbUHweTCCVLrrsMpWVPsJCbekUUSmyby?=
 =?us-ascii?Q?zJTzEfEf4aVHGaX7v7GgyQv4cbmQqvoj9HzJxppW3pnHxfrdWw1XTv9bNndF?=
 =?us-ascii?Q?E11FlPc0WlFwfNEg1fGMHYIDLBlRhBz8IW7PMI5NFu1twzbKeKjfjbCuyM/G?=
 =?us-ascii?Q?3RNwgtI3aJsgP2bv9EfVG97CpL+z3vTzZB4oRhtoFixGr82YZgTW5PLSOWzl?=
 =?us-ascii?Q?PGlitZydtDx2wk4jf3+LoDw6qLP7jd/orRtaxBM+loc7O4EeXbKwsdD8RSN9?=
 =?us-ascii?Q?4/8Qd9oolrm5+vjazXya3WmJhtAZ5w4Q5iImXUxurdawuxRZ7KU1Iq4IOSWR?=
 =?us-ascii?Q?gL9eYFvVbEqT7hkOcmYpFsjAG6vpEnyJuZ0wmB4VAB0+nUH6uGf4/h/z2TOn?=
 =?us-ascii?Q?AIqCYB0Xu3sZafvJLe3ckUCjuG6BEiBzbc+cGiX4MAkEF8odMB0HAYi9ia0G?=
 =?us-ascii?Q?KoJFh3mRs1frnFKhqxOmmy7yyvnKOfUJcnvR7KJwo4t9cy+AY07e+7lvcApS?=
 =?us-ascii?Q?QqdqlSu2oVU0ArHFs8ZqeXwQyld+vjoCCazGAnIaUVyhS3LizE0Uoh0ZGGlY?=
 =?us-ascii?Q?TRK8l2TbMUdC5gHoF5Bts0SW/CXFS0rmE0vOgf86D/jBVRRKDfYhu0ssl1Bf?=
 =?us-ascii?Q?s4Th8nSKBzIUn744YyTE7NizWAKlnEsMSSd/JRF36M9cGD7keIkLL2sqyk9/?=
 =?us-ascii?Q?xfUU25fhu9TUqd9UMmIT+d04kaAPWaDugmR06ksTm0kEeQza6+NVuZHfGpku?=
 =?us-ascii?Q?8sez337tr4j3Wway37A5fK4s6y4lf6GfBYIOrcTEx20raIe4Mb/mNYLPMHlk?=
 =?us-ascii?Q?OBTVL014sl4HyLWI540uaWnxeL61ASpzk8mwx1piTaCY6WrknS6e+JsDAHFc?=
 =?us-ascii?Q?DmZ4s3dNHiybILFsBjTaiBlpurp4uLIQ4rBaYSXcrweF/R8JRtoKYHIcq/qc?=
 =?us-ascii?Q?SZ46HeeU00CdBAKDj8LD8crQNIK5gp03w5swPRDGy+bjiHQU9r2Jcu/Fshr4?=
 =?us-ascii?Q?QtRugMxHB0RXvb7+OTq5YaGvJN5RQ3SCAdGuwRAfqgZR1apNJD9wblMRsSnk?=
 =?us-ascii?Q?jf8ThrnqMlySHzS8H4hBdKJR9CsFt2ev/bWtz+cueg3pRhIQi/8cZzfuU/Ho?=
 =?us-ascii?Q?Ythk/RnkWu3hMV7s0/8tLHUGBO0abeyxfxzu38OKTstP/HxRAjmmX7IbbShA?=
 =?us-ascii?Q?8Sjmx5Z2nA4NzGPcyzCjTdQzOUmxYQ4jIUklwtCZTxnRbzLXfgN29yZrJ/80?=
 =?us-ascii?Q?w4KNP5rrO8oU8UFr5o85XGVPG9DAUbyccc26w+MK0WAXkLEyyn5Etrr+Qa21?=
 =?us-ascii?Q?Yqqm3DiB+T77ZYsSAZ1SiNPDTekvynPoy5RRCDju2u/JUjQPhto0ZWvj1edn?=
 =?us-ascii?Q?ompI24iPgxf8BTcwD/EboP+sV3sF2jEbiGW/sUThD/pk0H4adXJZyBn3tC7c?=
 =?us-ascii?Q?T1+7YEKF5RbHTArsVBkrBYjOEkyAr2O9XHxANdZY+GhpfqQVDrDGVW17tCGW?=
 =?us-ascii?Q?lxugYIaW1MxoLeqWDelVCG+H5H42IyB4Jgf3ZLp0mJrefuPiwf7/fj1pZtJy?=
 =?us-ascii?Q?ay3qMLJY+9a8TX8VUmi0av7/c8vPAf6reODfPDIK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbaeef8-990c-4b31-c175-08dd7d5b5c12
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:55:49.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiFGV04hgZfF920aUoGP1ATBuoy63HF5Ilql28ps8dVQF1Rn5g8lx4meXrfGXOsJuFgfkLdgkiMt6MM71rxltA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
X-Proofpoint-ORIG-GUID: Sl_X_a-qOwT7wcyeEyoPdqwvNrWvHGkB
X-Proofpoint-GUID: Sl_X_a-qOwT7wcyeEyoPdqwvNrWvHGkB
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68006db7 cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=99BbB_j3FNS7aohJxzYA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215031

If autogen.sh is run outside of a git repo, the find-version function
always assumes that libksba is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ cat /usr/lib/pkgconfig/ksba.pc
[snip]
Name: ksba
Description: X.509 and CMS support library
Requires: gpg-error
Version: 1.6.7-unknown
Cflags: -I${includedir}
[snip]

After the fix:
$ cat /usr/lib/pkgconfig/ksba.pc
[snip]
Name: ksba
Description: X.509 and CMS support library
Requires: gpg-error
Version: 1.6.7
Cflags: -I${includedir}
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.6.7.bb |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..39d50af837
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From 5837fbaa76e6959ea895dc118893fb60957012fc Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that libksba is a beta version and adds the suffix
+'-unknown' to the version number. This should not work for users who use
+tarball and re-run autoconf in build directory.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index e6efe33..6acff4d 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -269,8 +269,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes-support/libksba/libksba_1.6.7.bb
index b7a9fc4050..28ce97ac6a 100644
--- a/meta/recipes-support/libksba/libksba_1.6.7.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
@@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch"
 
 SRC_URI[sha256sum] = "cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763"
 
-- 
2.34.1


