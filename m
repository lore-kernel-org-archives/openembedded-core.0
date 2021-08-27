Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.90.1630101488191917007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 14:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AL/K6qWJ;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3873cf6686=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RLgjWw018077
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 14:58:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0iOsf9rAARt41aqv6vInRcWH+825EBjqqEd1JadairI=;
 b=AL/K6qWJEUYNqqAQCsnOGFALAqS0gbM69rZxRULppeaBxUHq97/J/k8oOeFlfnZ56Zvk
 nsBHmfLvmrtRAUslpo+o0i0hC0iu1zvTyAGQNTyfJcp3HnDvfNTAhqHDu2fJXUdxre4b
 QfIFqPTM40xm60KS+ZqkJq8uuim+EiAT/Tc/tEc1S7rKLBzkwBHXbPZh4ywU+Lxek+Zb
 nEDq2ILxVj2hIBDdJA9CvNcpgbK+eR2p6QBBl2R09ZXk1mrrwN4LZ/Ku+Onno1btFgzM
 lFkcWQPg5M4jZ+QiaA9CsphZEVYLTRaKbF8Y62pM8K/9gXY6lhUq77qnDF12OaXoCb0e LQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 3apmv38r23-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 14:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaXQd3uVFgm6T9ssreIfmlrywk/9KMjEviJ1ao3L/ZruyNPhIIkzdy8Ejt0BmFOkd6aX7pelZ+2jN6T1wxpogY8M8JUg23X8RQ3CRLAlSYtxTWDgK3Gbz2WxI/FST2crukickkwDVe87FT2Ah+w4LKa64+ienqoR7UAPMWdm32jZDlUKT25OW9qnbnO/YD8povjY8T9VI8HEBVtSGPjpNObt07Varqmi7wXyOtA/uM1YtQu7HwNwnmKGEN0+m4OFgcPx8e0Fz40jmPvlU/UPK8hBWcnYuCuyrSncGupZHf7qBXXnIvMh+4pVt60NOnAiHKxD29cBkXaapHYzoxECbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iOsf9rAARt41aqv6vInRcWH+825EBjqqEd1JadairI=;
 b=hDl5sPOuO9tIQg+4geIJnwa6hk48KNrtCA87Mf4A9J891imGdW6Fhvc0d8k8uOUTrTJg0qsAHOQXiu1DEd7O+78yXEHj3tgi/8SwZxbKnOlC+0AScR7brUVoOM/waPgm/WeR1JDLlroSsjCb6prJ/lraee+ff1ScmLNS/3ZIl5W95KlVdMeWeOuL7p/cr6mqzs3RHijR9PpgZ+1c9/Zmr4t/GCbUGF4SEGO9msScTwnjf6gBWR+TKE1jjgMNA2fZPnc275HSJRErX+3l1wO9aKRIi04gzDdtywG7CxkGotISJNKhdgjL0loB1vooS8KLDagMQSYx1SxlcZwlD2cG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 21:58:04 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fde2:338b:6ec:71ea]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fde2:338b:6ec:71ea%5]) with mapi id 15.20.4457.017; Fri, 27 Aug 2021
 21:58:04 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libtool: Only package libltdl for the target
Date: Fri, 27 Aug 2021 14:57:42 -0700
Message-Id: <20210827215743.2027466-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0271.namprd04.prod.outlook.com (2603:10b6:303:89::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 21:58:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8655ae2-f605-49a9-5e39-08d969a5bebf
X-MS-TrafficTypeDiagnostic: MW3PR11MB4683:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4683F63DA51F762F911F7282EEC89@MW3PR11MB4683.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lFJS8hi2tzJqDx2vJBgNPp1zQofeCZ/TTJQdZtXhbAEIHsqhqw+9uznNAbEbQDRWKOyIgu/UiqGiP/XcRdUU1RA/RzXilnh1uxmtR+Wk+JEwhSq9BNyMPa4b/N7pr5yWqempX8RMTeY3FRr+quPJBUEit340R/jlSS6npYMbPNlxPS1H7hbqGQPLwe1a7suq83qNVs15IOelJ7/0GH5mxO48d2AGIIXX9VUIHZruO0ph9ijfVIUnJkILU4+12YA4D73jvN0Wt8tv/t/GSND+LIsPVOl5DzS64UHbvh579K28hwick60lizyy3ZZ1pMMhVidDjLrfsFj7VryGoEZTONvDC7Xlq8om+koisP58NBpCeuCypvwWkZRkLERAOrcW3fHYAJ4Syb2oh6ZRSi3fMMnxQuOzHP39oPFqaMqrX5pyOFpZj7IpcQeAWQcMfYN/GLsM8cNcYccD3QkHjqcAUF1dzEwDLDCfRFKB5DE/x+ULqqZmq4Yd/PTwa76Lr2enJ+gzeErB7hwOPzPZs4leDHkRTmF7G0/jI9bfkjysxYEahHMgEWBV0PcBcQDcgg/3CX+WxOgIg1zmF/aQV4PkfZUb4JLaHUvfLNvvzLltb8igKeUAoCwmi0C7wcRlNRTMIfX1Wg5/9fedKRnJ9b2qqBFf/eNXLnczwSa0VanFQ4tIVJ64uqQ4ckkT6lvnfhDiJ4GgNH6jXtHZLdJGXMDdPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39850400004)(396003)(346002)(316002)(52116002)(83380400001)(6512007)(38350700002)(6486002)(186003)(2616005)(1076003)(44832011)(956004)(6506007)(5660300002)(6666004)(8936002)(478600001)(6916009)(8676002)(66476007)(86362001)(38100700002)(4744005)(66946007)(66556008)(36756003)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ywcYU0L8f1t8BK3AApPxkUdFq3rOa10iaR0WEthhQPURKcm6l4EujIXrVltj?=
 =?us-ascii?Q?cpz1g8jWF1UPq/ikXGZvzgSMGZf6NN8BmaXKmXRP5ZeBynYccnI5sB+6tJ/e?=
 =?us-ascii?Q?hn030JWKJkCLHF8e4QNiOpCGbKDgULkqFnHNyOB3jlupIzzYtslRXnLGasNV?=
 =?us-ascii?Q?BP5EfeZWeQ6MA1pK6n4NZj96322lpgTVvbSj87JlkrMJEg0SgT6IK/TmniFJ?=
 =?us-ascii?Q?M6HzB7A/7sfFL8h1zXkxtldT5Y4NaqzIoqJxFHbMhjA/Hmy7rXQXKZuaaCVE?=
 =?us-ascii?Q?xE0hFRrm9jwdt+BlIbQrbRXqUN3Lass3RY9rKFxnQ/4R5wq1O10KmLFOIpkY?=
 =?us-ascii?Q?cVyvQfIu+eCDuaGAlNyK2l6+Mfp4C5SKNxyxgh+QhAoPpGTTBEbMDyZrjH87?=
 =?us-ascii?Q?fbp1+nA23jcjOx2bPPA3D0SukkZ+xlC0RykWVDhoHNBqUutTzgT0Q797vNyo?=
 =?us-ascii?Q?1trSs7x4jbkkdDvsDltXEKxzzvUjQq5FmK7OsVAxl/y6pQSEKUKbprT9u5dJ?=
 =?us-ascii?Q?BzvvMTi/pOHJR/+2lniPj1yED5RiQhfseHRQacxU5VMzdtBWkRLl962pQ62P?=
 =?us-ascii?Q?T3097sNtUyqqluBLtagq8sLRpORwLD1cRFYxeKqXdewWO3eoKvWbIcsU9tw9?=
 =?us-ascii?Q?tfLfou1m5L2lB4u1tIyq13EYsR83XxH7lBiZ59NQ6DC2qh9niXI2mTDqI5GL?=
 =?us-ascii?Q?fvKg3seHb2yQcoL3vKoGR80Mu/NtPaYz2hSCKlg3cXXYIm0xGGloQJoJtTJI?=
 =?us-ascii?Q?SyeGNSn2ldDgqI9TvDoUQuXAEFAjb3GvfaBXCTO5b/zgQjoykIpgtruG3u/S?=
 =?us-ascii?Q?As6w55fOgkDgpzFs5j4cs0fnkN3F63y74mJB2XeK52uB01jpub5b6zohZZoZ?=
 =?us-ascii?Q?da3KSQORQEDH5ZJy1ArxP7ZmbXUb0LObgGgNP8AvQSoU+qIGRqhl7l3EAy3w?=
 =?us-ascii?Q?s7DdEv28ZIvD8KvbPtj8kcRIqswvYvjGagjDg0KKK2N1pOjjab0S4o/YQnu3?=
 =?us-ascii?Q?1XBU5oCQZ0w4l7BwD89Cj5Ub0wFPQdYAk2DQeMm+E0qhl1+/V2kLC2Fu53da?=
 =?us-ascii?Q?RzJQmhl8VSrQnIsBK+FKZlcxtuhHyeycucqIpy7RnnB6iAXmW073KOTDfGhn?=
 =?us-ascii?Q?uJGyq2HdalMEn5PtTff9t8ewrFfRu4UHiBCWeqMb5dbzNvPI0jA7eHS++KNZ?=
 =?us-ascii?Q?1bSE5QQv597hb43HWQt306DncjTKA8tobG/tX0It+jOisOHC5qycwY7AzNdR?=
 =?us-ascii?Q?SxMU8vMvsAj5liN2SN9B+QdwK8snDmRlR48z8zf9dgMQhlquXkjlFMzbmBSo?=
 =?us-ascii?Q?b55656Dlr/E10mgLKwTOzaLM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8655ae2-f605-49a9-5e39-08d969a5bebf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 21:58:04.1852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/lGrZBUPgn9yHP0hniQ1HC1rdXZbwB4cPUVsUspsMQWuKF34k/FvDrTbC2rx9xjoej/O6BzNaNTu02L2vch2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
X-Proofpoint-GUID: sZFlOglyqKRbOVUm-7f2tP_A8nm0QtEU
X-Proofpoint-ORIG-GUID: sZFlOglyqKRbOVUm-7f2tP_A8nm0QtEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-27_07,2021-08-27_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=608 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270130
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The libltdl package is not needed for -native or -cross, so make it's
only packaged for the target class.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.6.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 6748d7468e..38982bf67f 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -43,7 +43,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_GREP=grep"
 
 DEPENDS = "libtool-native"
 
-PACKAGES =+ "libltdl"
+PACKAGES:prepend:class-target =+ "libltdl"
 FILES:${PN} += "${datadir}/aclocal"
 
 FILES:${PN}-dev:remove = "${datadir}/aclocal"
-- 
2.25.1

