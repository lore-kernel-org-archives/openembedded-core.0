Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.18976.1629079763118655672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 19:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WtmYKPuw;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38626b40aa=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17G1uHVP026913
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=gks6wrOaCNxEWgVXKvojOzv6jwSqI8LNxfW71JQVIMQ=;
 b=WtmYKPuwFrTjQHTOLOuP8cJcO+01Iz6fw4K7YaMAHbvzV0Z3li/NBEn7ZdnaD/FvnYuH
 9vfIOIaZ2eKj5EUcghKzVM4D/R3GOjRcenSNQS0YrCw/xB+YZIpF2r7xFaxPkr8yZPc4
 5QRdSDr1RGlzqp1uAwevzL/QNluOZ47uH89MUQoORcyWFMJ8EgUFyJFQ/w6orDQFKzLM
 RUnLMWWPqsPIosJL76t6YDXF/lddPcRHMMtxNIF5ujhgVsl5qa+o5bVkASbOayJoYd5G
 /Osedzq8hp0OQvGpEliUjGBqnHyAbus8xE38DBAXi+Ysq9FOPKX684AOUWA9LpktH2NB GA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 3af2vg08qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:09:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEa/kwT9nc1AVEHxXjLkq97N8sE4O6DwiHogOilhyjTGStz+ijaPg5wsVSKPid9Tzya1ZZzgpv088ogi6JmLFWgguNeM9U/CRdffkrFA1NfUDX/oIicJ8XgLvCMQf61491fw2kqRrR/gf5ro0Z+pUjKEtZgFITufsX0wF+d33XlGtT7Bc3RkBhTvG+NCKmodvL+4DrOLw6+ZWmTkhg+UxvlYsNmM/4a2Uf3mrXCkw1VAfLl42S6lt1fFDvf6aOATnPZtzYmZuJM01svJgW/3jmO7wfXKHdEz6UiQACJuCbSUZO+6ptGz+pahRirfwgJSXOkhoCrP9unCMF5CkR5gWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gks6wrOaCNxEWgVXKvojOzv6jwSqI8LNxfW71JQVIMQ=;
 b=W2ICxclOAQFNvLbvat+SX30nv5HE1ls1osFf4GOWLNm7caH6xZOXKVLvyjZKju2yYKRyauuE56Idi+hhmHvQmMpkDnrNmCbcRFof5pqB47goY4+P2/R5KyAIsq+UmrUNoqZO6p2ocyEW7ez9n3j4oLFjSkkzD/LnrBvHYiOoN2X34h2vv6bvMsRTNxl43mNDXELHTILiW1mIBlZUbHJY3VCWxm3Zwb1bWRTTM9h16i4ZnSYb00xqqlitdVsgTu7lPJLb1kHisEf01biJiIghyaZXpZVfAIP4yfqptDRooMEbsnKnokcf2eIMBivHJ0LBPy1M7eJNuIvWMpSAnR0a3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1951.namprd11.prod.outlook.com (2603:10b6:300:10c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Mon, 16 Aug
 2021 02:09:20 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 02:09:20 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] prelink: add PACKAGECONFIG for selinux
Date: Mon, 16 Aug 2021 10:09:10 +0800
Message-Id: <20210816020910.10165-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SJ0PR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:332::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR05CA0070.namprd05.prod.outlook.com (2603:10b6:a03:332::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.8 via Frontend Transport; Mon, 16 Aug 2021 02:09:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aba08a9-c489-4150-d84d-08d9605adbdc
X-MS-TrafficTypeDiagnostic: MWHPR11MB1951:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19510F39E98D6E9F0F2D52ACF9FD9@MWHPR11MB1951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GusFAjxkDeywLZ5EIQlaAp9knrRpQEidoe9dA8E/9o05A/hVAt6PxdjYxNORRZMaHatxflS+7SQxaIhRxvSD9PW7hmCNbFRs8yH7iQ9HCHF2opZy+Sz3V5wzj+ZJ7XzEmbC4ZPAXBkoVFGZrRFc37TOKbBfwQIjRmjVAwcWL534f8ckUoDkw0xqbDQPIUGz6MBX5Qj8tkjss2tCvWQ0O+Ck8YkdtZ/oBoKFx8kfIL9VafODjtn17MfO/Gnp4CzwoZILCqu1iTXDFeT4oDY1nLDqDWxs+0egsG1xaAYekhkplxMw/sncwWJs08vf3iihhMkvanlb4mPEeWPx3FX64T5iNd0ZdDQgO2rBOggzXTKDynGCOeC5WKDBiXo+rlHqDoe2yvsw4EMFl9AE79EVT/qR/vApcKL41a2NZtw9tI0nZXZ3wBZqvjvCZwC4uJmf+Qstpf4N6jrguLHRPE7TthaHUMvZfPNuDuwBu+tKlKA1ehBVHkxniosHbA+5FRDIHmSx9PU0nY86d628BRl0o8ZsjR2Pmf0Fk3DIga9Qoyhmq20Q+BbLc8Aq31jOKVJjaejhxnmY0gKfxgjNLzvZoipc/kZosCCH6oTHlnPdTlJKEZ6aB4Y/77ISrgXV1Q/dNke/Ll55vTXB0ScfiUH9DdO7aXroWu13RE1GBMG0iXt+5WDOHjD9Suo7XX6DbxLYvnYaRj8gTxnq2AAOnpAME/PYHn1iV7MDp6bjNpFZI6/gA0IMfJn23mVZs8SIVnHBtgWmJiNzkuFbQqX8rIm8Yq9DZpJzFwPcWSfcrKOoOfZ8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39840400004)(366004)(376002)(6512007)(36756003)(6486002)(66556008)(66476007)(66946007)(956004)(2616005)(44832011)(8936002)(4744005)(86362001)(2906002)(8676002)(6916009)(26005)(83380400001)(6506007)(6666004)(38100700002)(38350700002)(1076003)(478600001)(186003)(316002)(5660300002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vMLPg6QujAXn0PhJJLSU2b9TjztPxdXnCA4JiXyzBsD0KNB8ZM4zum0KlO1p?=
 =?us-ascii?Q?1aTb3hVOEAKZL0iyQqAmznb+mqGNhcEPPRo3BG2k7I0NKSz4fJPQIUTl5m+O?=
 =?us-ascii?Q?S44U1VKDIys8LKsik0nuwaE0kzmtg68c5CZ76wywdWdrenpBZWhsfdwl71E/?=
 =?us-ascii?Q?h70nKLwaiWeUINOBZb6muMr6A+5+2jMCRSnF7iNP2qQ36hkWJKtpQ9n4Td3l?=
 =?us-ascii?Q?GiJ17Ddub4cXvW1Zt7fvDhLSEQimeZq8HiIY9mKJqAVNq9vnwKaBJrkQR+7w?=
 =?us-ascii?Q?QrTg6wbVA4NWfZpPaIdPHCqiTPivn1rDymogzQE+iyLzv3YNhBYWxoIrUKpA?=
 =?us-ascii?Q?QPi1aEUHFdv6rJiKryP5Uwnl1wf8blakf1ckpyjVldzTfknTZabad/USyK1u?=
 =?us-ascii?Q?eq6SXkiP/Ick/hjF0WRsE/Hp/IC8/oSO83Z89vQvxSCNByGfDRO9OZ4LnI80?=
 =?us-ascii?Q?FKxc/uOQii4cq2o/SmO1e+OWXxKeqIc9AKJCgXw1cWJY26+c0s7LHdEZGnsG?=
 =?us-ascii?Q?xBgiWkHkbfGwRhxRY1mRNsJaEjMBif7RsEHaDIC05lacnyavDz1BDR0WITpj?=
 =?us-ascii?Q?Fp6ysPlvUqr6RY0kNsVBpVJ0iGjqDfRxHrFMJygIcOYD0P/1uilIBZZVejaJ?=
 =?us-ascii?Q?DaCf0iVK3PE2aKSr8TDqhkLRPRhu7gik1vOHqUwhbxsDElBsxiOkFWk9IZFQ?=
 =?us-ascii?Q?n32GSFL1r8IKfW+rwXqFN1EpliqPZNm0/847UkncxrUzv7AmBgObwq9wxrVA?=
 =?us-ascii?Q?DIu2xyQgbMdoKmlB3esvQx+JjDt/sAi/UZCBQ9AhGzwElQeflP3TbA5tIA6r?=
 =?us-ascii?Q?CO2/tiAfw/G4UAmudbJvAVu3R6LzI+FJNBNz3wiAv3KDIyGij6cl6kdRB/zB?=
 =?us-ascii?Q?tDtHr+MGWQgO/kbkpRYYjNBcQGNDnVljAVJbzGTIcCf+MUmjAtHEuGjpb3gZ?=
 =?us-ascii?Q?h/8FZzAzlTy2cCtNR7E4HAWis2CHkFmurbrQzD4k18leX0GqaQGZEmk3PWEN?=
 =?us-ascii?Q?xifXHryUVmpfsGHmNUyTBI6Xpd8NcXUWxSNBc+bZxaJWf7sYuw2Rktsf4TC4?=
 =?us-ascii?Q?NflNNqpkuzS5Tbt9KNnJNC0WzTaUE8RrtOQv/pXB9dPScpBJ8xD0EIsJnNCZ?=
 =?us-ascii?Q?z8JgLZzmM65wUXbxfNV44jMmwVv1yg9baOjqaBqHUFSXl0/3Dsq0qco46rm7?=
 =?us-ascii?Q?lN0fT5uKW9A1QN7lrbHmaR5L/h2EhIW43JsuPcdg8iAIZCn0xrW70ITiHXaP?=
 =?us-ascii?Q?og5xEt0vmj5NqCwr4ygllP9nkMBG7acJ+IBNs0USwNsvJVqgmILM80IBgOrK?=
 =?us-ascii?Q?D1tYNaWiehUTBuX8ALQ9+tD4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aba08a9-c489-4150-d84d-08d9605adbdc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 02:09:20.4320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A41TYqhKr/PWZJARZN5DQmhsmu+oNv4WTP/uC2hlcLH+o6d2hCIRER7q9rRroAKae4PADM8jAT6MNVIEN1U2Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1951
X-Proofpoint-GUID: 1IpnLhj98gDaOstLT8JRLYqxrT_mThiS
X-Proofpoint-ORIG-GUID: 1IpnLhj98gDaOstLT8JRLYqxrT_mThiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-15_09,2021-08-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=555 mlxscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160012
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add PACKAGECONFIG for selinux rather than disable it directly. This is
useful for selinux distro feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 78d4c71817..24713b61f8 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -48,9 +48,11 @@ inherit autotools
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF = "--disable-selinux --with-pkgversion=${PV}-${PR} \
+EXTRA_OECONF = "--with-pkgversion=${PV}-${PR} \
 	--with-bugurl=http://bugzilla.yoctoproject.org/"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 #
 # For target prelink we need to ensure paths match the lib path layout
-- 
2.25.1

