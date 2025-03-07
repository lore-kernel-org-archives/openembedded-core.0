Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABFDC282D1
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 02:20:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2258.1741314044826044770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 18:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51615a5685=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5271bBpd008610
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Mar 2025 02:20:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux2ryt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 02:20:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2qnRZ+C9hDfqDwmHQQXG3/zybQ+t2jn3Emv+e3Hn2j2HyxVxSxqg1mJyqOTX+83ai+JdrJJ1EdLAEBpcEySzkZZjJCwTDzvMoWShb+gL8XJ0CXbYLH3MgOvrf/TLb29jN5XT8Xx2HgSPZCu3eftEETraYksfyRhg7ATEPXLqvOT6pUnMX92cqi8zq3EyntyOtLcy/HH5ZKtd9CWqV4eDex3dVculps5d3Axagea2i3twPeTBaizmQAHeAoAgpog/ArUU9zC3dIg8I/ETZVfVVhmdNeGgmGmh0z7OozJ/Q1ph4J4aQ1yyG8As01VgcgMLLQM7NYDVAkave0Dlx+WRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9OHbM6QateHhNje+tI5IjBhDSC4dje9g3vA2nvqCvI=;
 b=v93FYOALL8zf5BzCRZ+XIV5f9xwjIGf6dxETLB6n/v9jtWPDms1pu7DFvCL6e5smmZzDDwRUXJor7GkKJb27dAuoaHP5sPf5OgS9whOUm7sMK+IG2ePB8X6gRr8URn/uQ5UMc205zIT5sEfTI0zgB1tdXo0aHqgV4LsXbQPjSBFjqn3vfuec1GywrtdDRLnknaKbZvZ93/5+Mn20GdAGW9OH+i0hyA/MvrtI0hyHPrum7xiklOUcIBQc1Ml5dWYuLnb8McprQxlLnb1HoHcQRgmbSIxyWq9Dc4weHryRYoqwyaDvaeSXFyJooSzgqSndPessvengcWyqDeR86g+MrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Fri, 7 Mar 2025 02:20:39 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 02:20:39 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/2] tzdata/tzcode-native: upgrade 2024b -> 2025a
Date: Fri,  7 Mar 2025 10:20:17 +0800
Message-Id: <20250307022018.726675-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ee2fe8-6ec2-4239-16cd-08dd5d1ea75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FEwNed2pUKvpQzf2OamTq5r1o8ZxzkG5iBf839phMhTC+GnGGgN4kOCge7e2?=
 =?us-ascii?Q?nK4UF7MGWUB2jAjRbhvh8pQq/zTr1wh6ace2WSUtjCydlDVh29t+eta7HauW?=
 =?us-ascii?Q?HCXR9tfR6xSv/yRAuc5hOVRtgQmU5iY2e2TJzCynfu3eRIk5o73CKURSafBg?=
 =?us-ascii?Q?PVqLApIyUIkMWxmdZNStAXxwqme8rsCpcGZLzHIGWqhrjnWnR+vCiNmoGpKo?=
 =?us-ascii?Q?jRAxk4TjWTA4JvDnOaf6SF4f35RE/JPLDaTDsDw61blWsXX8KpgH16F4V+H5?=
 =?us-ascii?Q?7i4lzteSe1tyHEsJUwnszjHIjrHYcteek46qSrk8uG8V1MxFL/9kqLy0KKBR?=
 =?us-ascii?Q?A/uojcLEDV5sPFv5LKp1szBuPJWRInba/32zKxCDkHXRENyP0FPU2X2qMNbm?=
 =?us-ascii?Q?qh7SVoepogVQUWcpE1xjP3RpY91L+V0lQDumxXI2H0Pa0GiH3ENLFbm+hOtH?=
 =?us-ascii?Q?aOISj5K6OSkfY0lxuBXOj5LdIK/pqKNNlYqEVjtZdhdRbyiRl//1AlFoegW8?=
 =?us-ascii?Q?T4PZ2AFKYRNRSHyd63FvhBlR1r919kCoM0zew2ET8ughLWpX5uJBDtOgIYRO?=
 =?us-ascii?Q?AYkSkc1R61Aqsu84WBa2d0g85LCi/rSVX9rpLy7v8xExTGICDIxkR8A+ZMrr?=
 =?us-ascii?Q?NfefNpsXSJuaL4dbwUWjlRBRhS9B0M6oW9nWX6u+sG+gM3jPMX2ln21Nxj+z?=
 =?us-ascii?Q?M7FMnqGNortlITQDlfFRULEU8k4v25MWCcdXTqm9lMlas/rq9tdQ7Kwn4+/K?=
 =?us-ascii?Q?YcjIEQeyL92DrfprC//Amn9LqwlLUn+4eZXeqMsc6RJAazuJ6KLBLfSpf/tx?=
 =?us-ascii?Q?8N766yl09WWb6DoTel0l4Vw4j9/U4w6W+475c5cayL7S9jYmAdDSzopfjA6h?=
 =?us-ascii?Q?eqZKVofeIJBtxg3mJsN/Qq7VT7f0b+08uiGrZoHSy3MXGCz5SSd1mWDUbPu3?=
 =?us-ascii?Q?iHkuL1zFB4FepCVk8mSIh66lCOgkPBWhAe0X4LzgDpzY8Ew20r/1LqZOjoua?=
 =?us-ascii?Q?FU/WEzODA1+yIP8x1423CkIpHj5bnHUmvePFPV0/oVmOHZ7+sgMOCcW3PLrp?=
 =?us-ascii?Q?urNaMQhYgEUxv42rAEyFpRFNLoXOIu+V9GbpzSHaYLzOxVZNGg6Mx+aKVE8l?=
 =?us-ascii?Q?0Vcxf6P1L5IpCKY77pshCO3FbcfCP8kEzaRo0rkdcQWuxibLQs+kpQdLR+Dq?=
 =?us-ascii?Q?Bx7CDh00UYncRvh9lSiQSKZBqiWEFTSqxE/PhqhdPUulrcAdHsEFtESrS/+S?=
 =?us-ascii?Q?kALRm9EE0q4p4P1TtwM3QWHisWbdaR3W8WDdOGhSYaKcbh1k+ecvrxm3vgWB?=
 =?us-ascii?Q?kn1/arZEev9ReWqEXpNX1KangN3fSs+ROkZtKQvdgTxuROr+0O6iNf58lkk2?=
 =?us-ascii?Q?ybD/6sIXzBZusE8XyLlIeHgjh6bfMT4Gx6t9bzbHK69G7JGD7Hpj2/zi9/CH?=
 =?us-ascii?Q?ZJ0HXdMZK3Cl1Vq1p5R7bLnabfXq5evkpPd+E+Dh2vYnpxNz1PvYVw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TnBEcxEpaE38uXP1eBX2+kvFwXDyg+8n29vlsU8+/HBVREC1DeAiKEASwR4d?=
 =?us-ascii?Q?in1ZSnJHY8sf228ovf2lCvVKMEJc6E8K3ZOksOKYBQc2/+k5Ci7A7EB4Bv3d?=
 =?us-ascii?Q?J8+6KbXFQG7Sm+HtQ5i421IVv78bgXUQvHTOzFz1V5mYRMl+Vivk0sJbWvOo?=
 =?us-ascii?Q?RRClJfmUEKhAsUHYvQBgTE9n1wnPPbHcRse4S92S7mgjdmedbj22yS3R+O43?=
 =?us-ascii?Q?ZWXg1HHNFxgA7R6wZL8vxx4NU6WRYn6hJARwerUo759GPxAJM1eCJWuy+H5C?=
 =?us-ascii?Q?Lbp1h96dl26Tw389oQqEdqU9yJljYSbaU/BTcFv84GK2NStl/3n4Nvqg60x+?=
 =?us-ascii?Q?+hRSe1Wvt6EL8fKvxBm6q0qOpiGIlAEAcPGrc8GX7q3Gk+JWfCT2yEwwyeSv?=
 =?us-ascii?Q?8H2hOqKACBQ/p1+fg7nXh5RfhKpt0P5asomGvgr807xFXB7HVGCVUF4oloWC?=
 =?us-ascii?Q?GIUryXEg4VUQnSAAP6hlkV6wkPBCrm7ldGkefwhM9OIZcfqNe2oPqoZzib6/?=
 =?us-ascii?Q?d8IDDTy0xPc+dkKSnYhaQRnU+NKM1p8+3jAUjFt2sM/n4y8nDsfKR75o4jyS?=
 =?us-ascii?Q?KP9W5I/GppT3UbTD8piunqb76fPt5GWRuDYH3dPbTYwNnFF1+9PjENDJLsMo?=
 =?us-ascii?Q?vkseZSaxOZ1I75ERhqViqFiT8nC8+BV5XhrQlWTdwuhpenMaJzL4/hQANOV1?=
 =?us-ascii?Q?Y6AtPJsMdfvne6Jjbv+Jmw6lwp8munQljZFVHrfcV/d6ywNyf3oGZ6DNgU7l?=
 =?us-ascii?Q?BUhoMIEIdLQWVQADLhxgQLn1c5qlnr4NlUKFDjaUL83Fn3E2uVo8xKh74oNm?=
 =?us-ascii?Q?IlX2ty+hSMV2e8xsr8ruBx428nbr9GESvNgSH6o3pfghrfsUKCLOzuNHpGLZ?=
 =?us-ascii?Q?oc7MMsmZxuHz2c5FVXcwYjfIHgbIznTbHy2cRj8dWZD2ZQz1xZhsxUOIRw/A?=
 =?us-ascii?Q?qhoFxxaVMfIag4R6zsNSggDKmy6zElNEAMM2toHqDseGxAzTnHzXib0r9QS3?=
 =?us-ascii?Q?vPvmlzs/IO4OAHzphJwhZGURtM00DejDF6VnI/M95yCbwdTW0bzY0clZ5jz6?=
 =?us-ascii?Q?fItSVNOZM4yqoq4sXq5UM9/Yk9jInO1z7/zlNhH1a6+sYE5eMEkX61xs+42I?=
 =?us-ascii?Q?zReNl7AeH1iupAJ5mEROjzenTsPQMXKCmgF5y3jYzUm5rc+cM41e/drKiaO9?=
 =?us-ascii?Q?NwSCO+CV6FmqbqLomzpTbrEAinjDXRei33pzzYQw9DkFYUe2soOpmDMImz++?=
 =?us-ascii?Q?Ru/BCm2OUL5Tp2eQ9Ntq38W7XcTrGVSGp7yd7SxqlH2s4AzSV4idShC4WaZs?=
 =?us-ascii?Q?Udq+k7jWlFQl9nBUynJ6Ly+McUfi2+xEiM2Es6rJSfEG+R9jLONjkjUTwJJs?=
 =?us-ascii?Q?auJSEcVTPf5dP5q14ZAyN7sbozqK8zqIxGL1vmvZSe4myPNj41aqQxoPWl5Z?=
 =?us-ascii?Q?tgpkNb4NmOrIPcmr39eKYaPxgG8oziwAwBKa4pODJEbmASg4n41wH3cHLXVi?=
 =?us-ascii?Q?Zyz6G9LbhsLZOZl47qGb3hgyJIArzCmDvl4bnVqVnMsyxwwwcQVIRo0SALGE?=
 =?us-ascii?Q?t7dtALvEZW+Ga1Pcy3ANBhmMI53GLROL2Qz4J9aLIz1H1Liip9MK2D0e9f+I?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ee2fe8-6ec2-4239-16cd-08dd5d1ea75a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 02:20:39.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH+RuBRZy4eIRsC1ZXnHDEU4mLk53sxE+tMFBqe71y4IxArU25tkFN0+EmygEKUyALDHQVQtrYogIMScBQKvvb67/weMcpFlMlALI2wvKTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
X-Proofpoint-GUID: Hgnfvw9kjnPbSMqnRtx_27G47C86MIyu
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67ca57fb cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=I0CVDw5ZAAAA:8 a=fk1lIlRQAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=vEEcL3scq_NeQSkCwNIA:9 a=U75ogvRika4pmaD_UPO0:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Hgnfvw9kjnPbSMqnRtx_27G47C86MIyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_01,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=711 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503070014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 02:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212408

From: Priyal Doshi <pdoshi@mvista.com>

(master rev: a15c4e6793c55c8084a61298ef3695e1db2f60cd)

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index adf095280f..f1dbd7ba81 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024b"
+PV = "2025a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
-SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
+SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
+SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
-- 
2.34.1


