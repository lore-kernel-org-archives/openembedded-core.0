Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59DFC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:01:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33296.1741597281118216411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5164f71202=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A79H0T002895
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:01:20 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8std0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:01:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWOxAbNBFgtm2VGanRaDO8UPD32CL0iCw5+BVYgxgJeQ29OvsX67J1sW/eFymZln9YK7APjvP3lGOKc32NHN/uukoN19jfkBU5zhR6HxiouZ5Avp0OGDVftM9tt29i1l/bpzQzwj4H3YrYk7udCtowkQK9Xq+I4iUuwLC29Auk7t+M1K2O4AJzBygStmkCKbH2SVRWAP+JxqvP3VO+pwyPP3VqeTGuFULuc6BNVHJ718Cr1c0UZp6ZGOpos57XeawvKuNWO4I5YMXBNarDdh1sgdL50POgLyNfaH7ZMOd4fLpHOxw9clr7izJt97V4rpPjq4mkg1iRHoNcOuMMRmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mBFf+8WWCYPbFX56RD9rXrVZY53SRlWKBFxoXqQ5a8=;
 b=ZvAEyLR+cv2/Ftb5nJ3zYkw6okoNhoyl7u+V7znK05tXCU90MePaYCLRZY+D/TZ3TtWucQVdFPEW+tIORdltsBJWRNFK38R2qHfR+rp0Y5FYQ3il6oA2Fkr0CrSCKXiamp6haoXXJlPbQhBS35rgfm5Z45Lwe6eUQ4ADkdBUHz6J6W/zPYnc07IAIesqhub5USXxhZMhbudKJ8eRc0ELqlPALXUN8/qxUIIOumvug8i5DkSxYei042sNQxBxfQm41EEIuzAfO1AzW6OcFMu/W7ncaLJO8Fq07Uf4ezIz9nb8ooyti8IMzxvev2btYngKlCx0S+G2EUDcPHFL6zNC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:01:17 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 09:01:17 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/1] boost: update SRC_URI
Date: Mon, 10 Mar 2025 17:01:01 +0800
Message-Id: <20250310090101.446602-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: d14ccfdb-9982-49fa-c437-08dd5fb21e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qVHiF8zKAip6rsr5Ne6J3/QRYADRqMa4MfmTtV/BLrbE8A6gyREQmX+Zp0Wz?=
 =?us-ascii?Q?IP2lzeQ/7GdPKMh+2IUD99hf8siEJ+EkgplH6tXGjkq9mQIvZWnnTp9H0ZJN?=
 =?us-ascii?Q?qnyBr2wA31EWPxBMYlf/haH1PWTkqhmsN0CeeSaLGEjIv1GphH1rFbsO2xKo?=
 =?us-ascii?Q?xvu/9w/w+QaiuDfX0s79swGzHQiZ8KVCg5+aQFkW3u81tCxo2lc0B+raswUL?=
 =?us-ascii?Q?UibiM42j1tptE/WUWR2THRgIDhTJeFSKqikHOi+txurW2z/2ByvQtJeAZ2YJ?=
 =?us-ascii?Q?j5oofjQVFtEtBTYF/l2OLo5jYDsWvxCKkaSMy4fjk8AEVo9Zh/tElWPPRyTG?=
 =?us-ascii?Q?+zhxLntQIMCsPo73R/fCX0ZzE/Y1Hd6mPoJO1Kev1XWZQqbsjv2WN0xEMTtr?=
 =?us-ascii?Q?0K+mTTZsOW/JStG58LjnUSb/Igjy4sslWleWUy2glkQ6j2E/a4A1NFp2Y25P?=
 =?us-ascii?Q?HDuB5FJ5IXZYBzM3G0BqyuA5qOn79cpbC+gN6sOBf0TiAbrYFgQ0KJc1QTE9?=
 =?us-ascii?Q?vY1F1g2TSybiW0DgTl1hOedp+dtSwCEVxQ23IldrOCTWM7sFNDIYX0SzaQzK?=
 =?us-ascii?Q?EHNa9q8QQzEySLSCCjPNhOuyBSxamEXo6Fb31k8jjFRh/rDc8dk7PDPwnCoF?=
 =?us-ascii?Q?MCl9tNJcJcVjvGMxyV6btOrpPDVEAg+/B5coo5pY+1Ph/7j7ofxyVGvTb7+Q?=
 =?us-ascii?Q?HvAFscFzqQJqz2+JuSBWNX1jGjGdeBre2akHuPS9bSI78bEc3zFCksnCJObq?=
 =?us-ascii?Q?UciYAVaLqvHx9iu4qYERRH1/cWFLSE+WfY298cZIT5AD5d+I4IvFswDIQ19h?=
 =?us-ascii?Q?RHA5rsBDjjifsmhUxLhrfAura82vIembPADtuTDQemWsTsulnT68b4dZPQef?=
 =?us-ascii?Q?WTsCDnusQt1Ub6MAM+8PGuXXfDoFwkAC72kGmslqWNA9jgbctnSA12TqrNoA?=
 =?us-ascii?Q?UtcC4E0fTNfUTEuZ4rIQbwv5bRhnZFKj/41lpqsDjvMlmBlBx0ySxva4IUXX?=
 =?us-ascii?Q?JL+gJRTQE75zfBu1biZnz1fbqDl75EELArIKrm41Odu+3ZwCxqBfPlZRmMWZ?=
 =?us-ascii?Q?gP8nSrxzal7P4q0v1hGQT6rZeDSIz5Eefw9JDkcEYeuFDDdWLnZ+tXrfza/f?=
 =?us-ascii?Q?3NKlMqdrqmHCEy1H19KEy/2ECGvflAWap0rV1wxBuO4ljxUWTC3QD2XirjxJ?=
 =?us-ascii?Q?CSa7yBZNDOjUIgwu7CQ4dzwA0yqqHgCfiaspRc6TVm+W+lGhJJ9Qxv6+n1iw?=
 =?us-ascii?Q?z7uWcHNEf2sx1hx8mC28sxpehy8x5SaQ9cNPLdhoLTQgL/62sraulP6RYgj+?=
 =?us-ascii?Q?t4mELgnMvmS2vnFGXYIyWUYxWfR/R7t0fUQfUgMzpAhDPDWbZAQgBVVof8Ph?=
 =?us-ascii?Q?ef5wBXge3lnDHO+r43qNWbh4dfjs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2m+7GRWY2RIuQyCI8JRa/3FHQlEtSXUATgmLtE4rjnAqa2LIUeZdG/pyhHyx?=
 =?us-ascii?Q?JwgMOgjLSf/pKUl1PC2HGKYJF3nVCqSg5B8o641A6i6Hvhx62zQRkBrANt7v?=
 =?us-ascii?Q?V85r0kL+xik8WP3VLLnUGU6vvd0pKuWrw56HwlIWYukoJtqUde5CaoBjCDfN?=
 =?us-ascii?Q?hK/yxZSjPxBXJOdJctZWm+8Leg5iHsuy4VProG0wGrEuxTPSaU5/j2yEO+Z5?=
 =?us-ascii?Q?NOBGBI67PZavHlnNqTqK7ExENqPCZeqEZlVCqDuyvfyEvpMVO4GSMD/BIor1?=
 =?us-ascii?Q?8yvSOk9Du661MdLcceaeNM2YC2EmOp/TYIpw5ZuK5dmrCGrwBSR/Az5HFxlY?=
 =?us-ascii?Q?FuvB/2YXuWYYrBLGZ07H3PpWeOL3t2Rj+7r6XHvmEcJNq3yG2vXUXz+rA2CL?=
 =?us-ascii?Q?Sij72RnE9hxAt8l6deDdN8J8MHuYrolP2UTivrpwCYIjecJINLE3d08IST3L?=
 =?us-ascii?Q?CQFcPymD14mJyyMkyBWamgq+nG7vsVQtVV4PbCuuwENVDe6/B+wk7SmYFU65?=
 =?us-ascii?Q?OTsP8zyt2JNPm0J6P7gliJZtFaOyJgKyzOASAZYwj0bOHGWTSTAOSsAptTiS?=
 =?us-ascii?Q?BqX5BNGE7hJRaK3n4kFgH/NeXMCj2608kgjUO9gGIn/mxyHamik8S64ZWJTM?=
 =?us-ascii?Q?uGTbiH+O0dooOxtXEm4HKXyxBKCTuEHzhCXTlT0FkoMofKVLMHuAhegNCNJI?=
 =?us-ascii?Q?ps7CAzuS8zkBseFMBKgUMazfe3L89tze0WDJu2Zs2DuWxBSDOCmFNdgzIxop?=
 =?us-ascii?Q?eOs8FIDM8EjkYljOd+iaoCebE84WO+ZU3l1lc1CyksuQViZUd0aqBI/ex0MI?=
 =?us-ascii?Q?NJvuMqL+fsr+QbTo2yrGq//5Yk/O5+afYOhnQBM6lH7XFo0t32WNTDF+Ks8g?=
 =?us-ascii?Q?Y43uKbFNu6XcRIA5XS7ztKZGJmbX7LudpAqoBr8eM3BqYDaiGvu4xvcQoxX6?=
 =?us-ascii?Q?crigjfmsCcqhvKB3dsuBU7kESUUxo7+b6BmZtDkvOgTTa1YVeAgXOrX/4Z+O?=
 =?us-ascii?Q?8+TfFj6oZcvkvUJlZkocezV4JFf2NwedsEjhbVm5LgDQ65XPGni/4C9NZR7a?=
 =?us-ascii?Q?rRmEkvATiHlSbi51jgs4joQw4/NE8VOh76s/t0xgv1kJlb/Vnz3cevKVu494?=
 =?us-ascii?Q?UY4CG4zE4Bmhv6ffWaXfR/Jx9C5/xQETrM3xuY53jT0NjKKr1/lhFlXUroJd?=
 =?us-ascii?Q?vueWcIgxDVUG0x8veT+9jPcoRfl1VmMzGv6LuXpNolyG7iVd0D+RxL8OT0gX?=
 =?us-ascii?Q?qgtWQdKHZ+fikpus5Lx88K8Zb45iSdNgOcVYH2bl0NUC46KYGW4bCdWk+MoW?=
 =?us-ascii?Q?Ni/fJOmAJ8jWstas1cV7JrXsz0alQ86WmPTA3D2UYH+Nr8fA0jI+UUWoMMV4?=
 =?us-ascii?Q?pzIzj2Ea4V4MR2yclEZquhhAzrigBnfNpZZb2pewG0GDtQpDJjYrFlA4UsXW?=
 =?us-ascii?Q?OVektgDS/JlaRZmgkGpSc45u0kB8tdnGnjIO7HaMymbWVoUjubY99uJ3SFcN?=
 =?us-ascii?Q?kzEqhe2c6R3cNCjk1WEOAL4qFl0o1X1IENAi8UWkAs8SzBOHOedMgCDOYCo2?=
 =?us-ascii?Q?4L6ekEZ4aoBiZlyMxjz0uVXY4KBQ3PB7WNc8cHMMphsCP2WL5L7aiVY8MrN6?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14ccfdb-9982-49fa-c437-08dd5fb21e46
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 09:01:17.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JD7jNPk4Ny8FpVjcxf563Z1gzi5tvcLP4+Xu+6qdmCepT8tBi37MZ5oF27YusbNe5OLyF4HfLBoSUd76c6VbcdycTkVQImuuE7tR1piqcs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
X-Proofpoint-ORIG-GUID: FwMJ_a09pzlIFLroLeQDTOKLJ36rau0c
X-Authority-Analysis: v=2.4 cv=QbKcvtbv c=1 sm=1 tr=0 ts=67ceaa60 cx=c_pps a=2scX5b6JGDBY9+deG5t9BQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=gvic6WYWAAAA:8 a=ovJmrJClAAAA:8 a=AIPdC31oAAAA:8 a=t7CeM3EgAAAA:8 a=qGZC1g6ORkK1xQXCNfoA:9 a=PupUpSa0FqD61Tkl4dNl:22 a=brTEhlvMp4NY0_u118I2:22 a=5478VIVnyzLWgM9zoUhq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FwMJ_a09pzlIFLroLeQDTOKLJ36rau0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212493

From: Guocai He <guocai.he.cn@windriver.com>

The official archive location of the Boost tarball has changed to:
https://archives.boost.io/release/

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-support/boost/boost-1.78.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.78.0.inc b/meta/recipes-support/boost/boost-1.78.0.inc
index 729a47b54f..98f4f7ff30 100644
--- a/meta/recipes-support/boost/boost-1.78.0.inc
+++ b/meta/recipes-support/boost/boost-1.78.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-- 
2.34.1


