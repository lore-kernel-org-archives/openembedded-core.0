Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C712C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:47:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2678.1752565649108054632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 00:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=929159a285=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56F5e8NU3260716
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 00:47:28 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0r904-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 00:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrsth92d/yZSkTGb1XQZvnqmF5JhsdB+QtqD9CMCEMcnSA4m8xkz3qsYLrjhCmhmYOhcIkUXf5pwyioNbPAnO5l5Oq3OuI2dzwt3QvwIfyg57Ag5eBiMRpdyrWzt0JLD06+fqGa5pBBxgTfcJeAZyV1zYpFMm65iag4bj39lqQhT60TkjXZctsprRHbigRa9Vc5A17//qdVCYb+9l2Q9XC11Xo1iBiegyCq4JF3axZ/sslilXeFCboh/ThVqPbOcREDTGnr55JmcP3oOv9tJ4eWMxAdtPEveu8dCOV004rPOFQpbtU26JJ0/vPNwtoVRlKk6pPfCXzgnYJ6VuOhpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hz06s3y6tRT77ONBvb95MqSKs3Tsf9mAh2E9001kCoA=;
 b=i2H3eiZxJk3gfVLSvthUH1kQknFVTPpVlSQ2eGSXOq8xMY9oS2PcruvTeONF3blNkl3hJB/2ESdXhRscYzVSIRmL8p5EKeA4lTdowkGzjlx0iHbQceh41fO1K5w7w1bpnrPt2NyGTj516SrzQ+zJzAaJPVeS4Ks9DXRSBF7odjJGWj27O/pZgk7MGzzmd4X6hoZf0ZiHXnHynot3uo3OCZHx2NRb+GlDpM13JKl8AhvjyI1G+mZ0NFz27s+1ZKZrQDFVwDKZlpC1Z73lzZfkxRaJ75g8NLsXO0LL6cxKdThoCzWJRPZMdW5RkMgKUHWvS45szbXDsZsNHCIuKPZC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ0PR11MB8295.namprd11.prod.outlook.com (2603:10b6:a03:479::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 15 Jul
 2025 07:47:25 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 07:47:25 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] bintuils: stable 2.38 branch update
Date: Tue, 15 Jul 2025 00:47:04 -0700
Message-ID: <20250715074704.523495-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0307.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::15) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ0PR11MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b69c4c-76b4-4638-46c6-08ddc373d6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2ZvQR/i5D3cSjj7AKbkAdApZX5sHhVoUXwYYz5VGwt8B3+gTlQ102Dv2zvlC?=
 =?us-ascii?Q?MYiZEaatGnO5sbM5AI2ixv1BUUXBVKBLPaEeGSj67yPcdVe22tUtc5gZFsBl?=
 =?us-ascii?Q?iLxDG6dMk7Xjl3NrB6QyK2UjgvfNsutUbIO9ETljtUWKVrlLfxPinFVwJoy9?=
 =?us-ascii?Q?EbwiapIheG5MQBakbvY9UO/Gt3S4eeUnjVabwhW6wXOtZ4bXFzfbuI3Gh/hw?=
 =?us-ascii?Q?1v51ZSL9tPTrV37lM+MxN36fgkAShwblY/PoFw3Gg5DFI1HP1+4oCyOUfRvq?=
 =?us-ascii?Q?7xqo0BySbH/0vMWIGuAp9rWFeojFf8Wh+Jli/81/zJ6FmVNTAufjnpEfkIWw?=
 =?us-ascii?Q?Oy+APLDo+EiTZB2rpi0uZgtHG/wIJ50P+QeeoxmTj6LHf0Hr4VGe/nCz/Ayk?=
 =?us-ascii?Q?otVOMA9nB6UviDJG1qs24h9hh92hNI22CsJf+8//JGXIOo4rSZ3VMt5xNdod?=
 =?us-ascii?Q?xEToANKYYAdiPGVa+b7KTZpISb/TKqNJCnkvSvRn8rupbiswNp1Uel/gKWaB?=
 =?us-ascii?Q?anLPlAPVOhS6gotLfJ9X/Rom+Nqh1/Oh1kw9YjehCwNgyhEuWJfqEHw2VB/N?=
 =?us-ascii?Q?lwulHb5gzZFHBnkkocWxxbtIwvH1vuHFki0e9kCA1i7alGE8Wa0eG0Yl1nXD?=
 =?us-ascii?Q?msmu59eO2b57tYiZJQ7pdGi018jTRYgg4NQG2fizNIc/qiRyv6+bG0GgCp8C?=
 =?us-ascii?Q?ICqdQ/yVjbICoPWFJdMBpPoKVLmKZhvJVCBp8x2MXEr5FnhoT/36z+roqPnV?=
 =?us-ascii?Q?j1ZwroGC4iy8ww5iNomZEIz/7oDRz7lw42Yi19WqwBf7mxFgwOFD3cxfNLln?=
 =?us-ascii?Q?WN4upiPIXEJ445Rnk0zoNuL5EfdGlMXW7aD12nH3yUTUJWwtRBTqPOXuZJLv?=
 =?us-ascii?Q?JX8STnV7QLY4oNAxxpe1V+8jUJqJc7hof3wd0RKO7c09Cgsn1UcblJLaRm4j?=
 =?us-ascii?Q?Caa7BiJ998eT3syWY/5ZoaFhDMoJF7lRULxF1vri+RoibEu6Cz/3BnjS0ypC?=
 =?us-ascii?Q?caeOU1cmtbu3qUpqPWZqFk/bZ23GOQo3Yj3s2A/5nDLAMmPcgxPCUOdo4B5o?=
 =?us-ascii?Q?PWpdQ8Zga/KFMHZfc4f243fKZlYpYOE8g91xcBkzJnSB35ftzcw6Yn/9eWCs?=
 =?us-ascii?Q?mB/mMj3o9pRbwMgi8g80eMtQS4iz3Vdv1apaSPjO+7ClW1rVFT9FcScjrHV0?=
 =?us-ascii?Q?+7MDWDTAKHcopCAI9AnMQ9eQgRIxAfBaYdNheAozIg8PA4Lyhe9YJ4QehzGW?=
 =?us-ascii?Q?W6oyZyoa7ddIPGCW4voitaFpEmS4blKmKrkuFdKJlzsL1ULaO2oGXXJ/ByHs?=
 =?us-ascii?Q?DTv3VasCcxVvJO1M4nTOqCtFhfGAhySpyOVUvoWI4QzE7d9pjBUKYqHIEii1?=
 =?us-ascii?Q?8ygZqnloUF6sc3SdP7pXLDvg4Mc4AFUi47K42PKTpYGP6FNh9yqji47Ao7Dg?=
 =?us-ascii?Q?0bwFDqR+w+zyptXEc2m1m4q3+0jtziY/n0O3JLyVUnN6dlvq0olz4g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?20/g3XbTIf74PwKYGi6Lct8Jf09ZY4lNuZep/jqLgPuqS2Gh+GXgU8YX/Vx/?=
 =?us-ascii?Q?ukk6T15p6OSR78Namr8tVgUrAoy5V4xNu6ylQIzSLaR3+FWSTH+Wef769KXQ?=
 =?us-ascii?Q?+XcqQQHkT8/3aVxUm8jhwpr25oZ6/Wkw5O2tz+HlwaeWk2An1vo5+hK24OVY?=
 =?us-ascii?Q?Ll1IpWY/it1VdWmB8mcO+OGchtXU9YjciAKhY5wgFLd+yxtzGvMURs2+5LmP?=
 =?us-ascii?Q?FhzeeydeEZOXXqDmkeKz8MBhd3r4C16rQeIC2sU1lvwt/LsNUb7oGU+xWps2?=
 =?us-ascii?Q?PIPNY0auN25jhgad19a+nSjjQ47Y5vRxfGCpnpEiGKaWnMbQNBBMeWBKPFph?=
 =?us-ascii?Q?RbPKf2V2fTmBsYJ0qVFxGlHGvDdgrGTDJyFJZ4FcdYOlCSgbC/kHUUp4/ZEa?=
 =?us-ascii?Q?Yfwy6ZID+zUFN1d0JYKoakjJNsOzm70k8ukQo5EKk/RfdDWgk3SE7QhkT2Vz?=
 =?us-ascii?Q?/psdPmcuAMhWVecIDjDODpK2Y2BravY6k9pLBZpccEVncT6H+W9PLZ1lrEDZ?=
 =?us-ascii?Q?ZIVVz6nWfYKnOFabtkXokfxNBv8zjnXTDJ69RkLM3hTkW49QhBpzusUt3Cgz?=
 =?us-ascii?Q?MWwZS57Qc7bjCKUHCxuQLeJRRhR8ZgfDIf6qTE/JysoCeiQqY4GYBR693CXi?=
 =?us-ascii?Q?g0QL/bxlAd2t83UfsvAXzuyA4S13EuOeBNK9wiOlNdNRAxOEZuKc2CJgkYv5?=
 =?us-ascii?Q?6c44UyX9RW1HKVyDmNGqvo/fcKPwp6VJCCoPjXXXT0q8TjpYAWgxdRMnV/Km?=
 =?us-ascii?Q?sTmM8yYW4uwNv78o5/IjaHoNNPnb09Fy8SF/ABjcY3qUbEuJgEjzk2UHxI77?=
 =?us-ascii?Q?jB5GK5+meLjApHqT5QrnhNn+4SZF62oI7tdpq5nFLNu3zb7o2saoY4WmV2Xu?=
 =?us-ascii?Q?MvV5RsaRtbIVgRV7uMBr9K6xzGml/D4NAAOij7mCT6ABi3fcMYtqONjr8eC7?=
 =?us-ascii?Q?YNB3Ut0LPbpkrbpiwmxgjQZvt8gwKDBGsQtGnSSmTo45mJ46BpP9kH7an65V?=
 =?us-ascii?Q?TWrbbG6srkRiHkYbaEwWC1Qr/qdmzJXMh8tnO6qb+ky2x3g+/qTocyz6Ao/M?=
 =?us-ascii?Q?YciUZjAp6d+1b4JSn5Zh7ZDkF3H4n6+h1n2jDCrHPg2X6PAvDcokdfHVsQfZ?=
 =?us-ascii?Q?iLy6AitZC+NoZ9GsF6HpK5feomx6yFBQ9OzjIPwpns3cxeUa0WbDm13hNh+b?=
 =?us-ascii?Q?ngfP5m2rawYmqdZhJLErt93bafa8YljNbtUV76Nv1qbBZspLZAl67XxarDC6?=
 =?us-ascii?Q?uMOnE8/sDFMYASURf8zGvb/VREqjNs9/x657ykqb+UwN+YJMwafZkTi23ycT?=
 =?us-ascii?Q?pefoohe1ZZjW7g9U7DtTIgqvwS8smwbo7D/qDQ+8CnXXSU9HoPnUCERnxdw4?=
 =?us-ascii?Q?o7hgJwM6Su+t9uyBQW177aF24admzTWvyC+QKsm845KXL0kO4ZnvLtppG3c+?=
 =?us-ascii?Q?5d/LXvoiBFY4mnArRHhjZoHs4swAgDsQUmbtjGrY14FWFFwu4geXruVroUEz?=
 =?us-ascii?Q?ykajLVVR39/JT3N7DNHblmKLnYVIVUgyW1yyV6V3Q/VSGPBds3dWx5o5i3FW?=
 =?us-ascii?Q?NJIm7i4B2emt63NdxXGwaZefHPIvpepSy5RtwLO/covbqm5bTLaNomCz8SuH?=
 =?us-ascii?Q?RljlqB+mil4ldpvDvyb2yao=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b69c4c-76b4-4638-46c6-08ddc373d6d7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:47:25.2188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ieuv9keeGSaCdnmN2Xfu2UvKqPserYPFG1KIjeka+WS6mBxb1G6CsnslMrcl1a854qI5TNYk5JKI5qt0JPQP9Gr7ZuJaI60EgLYICgWWIT5ZR6woMBIXkf3sJwXcORI/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8295
X-Proofpoint-ORIG-GUID: rVbMe2cppGhYlVBuk5vryFxyV43czpDV
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=68760790 cx=c_pps
 a=kfSuSaS5NlyHnrYV7DsYBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=Cj2JNex5IhnVwOnuttoA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX+i/0iGi7IxXW
 9MUPtgYrisKttxZG842LuXVZf2/+QMMxur+yfMAzbvgI21qokK0Fege8K19CCSCaKXwWXCa/ZFX
 ARj46fvDRAkAiB+dSGo1Fd0FXbbQR4NGcKF2ZfYJuxj8Wk0S/o1F5hzLojDuFCURYyqFXpYRXAt
 NvkHKJUL0yxk5vf4YtB6M0hWk8QeUHkuhsVjkiE3mSm40ozGOOaEdfGkbaFWyHoiKtb9Un/Y7Ly
 vprSi2Njj+p8jwPZec9BuFdvrHaV3vjxD0atnqq+v9VOv5Fa4dL7scBKkAVL2sskPbKyeiletvP
 2AIihu13rXCVv6kJGPOkNu8Fd8rINfzpvrHIL7SJUnJjkeHC/CAOM7ZgII67N/mZtmDVs0GtJNu
 AflMAafm
X-Proofpoint-GUID: rVbMe2cppGhYlVBuk5vryFxyV43czpDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 07:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220269

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commit on binutils-2.38 stable branch are updated.

9bee8d65d32 x86: Check MODRM for call and jmp in binutils older than 2.45

                                 Before  After  Diff
No. of expected passes            280     280    0
No. of unexpected failures        2       2      0
No. of untested testcases         1       1      0
No. of unsupported tests          7       7      0

Testing was done and there were no regressions found

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index f1c29015bc..e25f52e171 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "4d71e17a9fd8d319359ded891eb3034a2325d4c0"
+SRCREV ?= "9bee8d65d32ac1480997c13ce76ae7991180f1ed"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.49.0


