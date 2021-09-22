Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.408.1632348875591829009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 15:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=F4b5UUEP;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4899816592=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MMDcet022629
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 15:14:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hjdvJLSlu3sZB9cFUVoebIg8dUYoqPJkZAaA29Q1vvo=;
 b=F4b5UUEPpbmLFH757GOLtQ0W7gnGuQdPCcBC9QqnCWMduOlISqlXFVC1Jyai8hnrWs4p
 RyvT0f5E4H1Kc7ujoM7rLRbesfpdxOvI2/McBNvzjTKRJGClylowpR7o5feBnDfWYypx
 5xcE37eKW8Eiqa1dkktAPWLy0Mw2GPFoTTbuXEW5Vn23nsj++P5ohxyZhOXENRvXiv5J
 OOEppuZYN/Il0B7U4elYM+/c7E6vQHx4lhKiSFsKMpqQsorSJi9cNxMoSQMS8YFWjR+G
 p/1Iz9YpZgu5zuuMpEsn1C+ZgqsWZbXAkFf0RPbX+R9kPwZs3B8J1nYzAFPbjXmtzQ56 rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8d37g012-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 15:14:34 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18MMEYxu024683
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 15:14:34 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8d37g00y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Sep 2021 15:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nliO1FTnNuRVP6vqUxRMhE4oFeGf2hFPrBNEnqH4K//nl7+gHSWlX7Wq0MGyttUHqeikYtglR1+JV7ayT++06P+S4fyahvMFg41i0yBh+fBHEDCFXvvTxHDieRJs+FNCixwvja2psC+X6m2MmhHi4FxPFpeIwdgCmFCUhITsf1jWVkiY2Fues4E6rN3wuoWMOyNIZ3QDC8PabrAoPGgG3N2u5NidZwA66B5WrVf8Cuf8vsrBHvsE/S5JZdJuHRXBk9cPOCT196X/tubd3hTB4jMkwnd62DrPlRHiYj0aY0VlrmC+96GLqI+2LtP2+V7mQWkX7k1qRVD/xfFrkSONgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hjdvJLSlu3sZB9cFUVoebIg8dUYoqPJkZAaA29Q1vvo=;
 b=JDV/cjmyGFXoJN4B6FdiggDc4NGbQSrq61cxraOR9HVVGAT6WCBmoYndYQByu/0yAl/RnrzuEbY/etYiu5De39r9OF7mfogog/d4vmhfUN4QMenFOw0Vt/uClYUkoxszMQYGgJI65M+MLF/Jg8vbVK/jlaNmKz28sv76hvb029VISBFe9E0t1YuCfAf50llq/hGejNbhsYFIW1IAfXOBsiGUnyHkm8Ip8PV6VA4/1m89jWOroWp9LHROB5GVsyk4E4LK/vUJKvNza53Tp6nfMipy9rjoo3VigEzb2yqY9tYcjhb5DKO3hVI70wlGoTqX3ACttElRRToEA30PUK2M1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by BYAPR11MB3302.namprd11.prod.outlook.com (2603:10b6:a03:7b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Wed, 22 Sep
 2021 22:14:32 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::e5b7:1e6c:e33e:3b52]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::e5b7:1e6c:e33e:3b52%2]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 22:14:32 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Subject: [PATCH] create-spdx: Don't collect natives sources
Date: Wed, 22 Sep 2021 15:14:20 -0700
Message-Id: <20210922221420.4115636-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: CO2PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:104:4::14) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by CO2PR04CA0160.namprd04.prod.outlook.com (2603:10b6:104:4::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 22:14:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8be0cc4b-60d3-4dfe-1505-08d97e165a52
X-MS-TrafficTypeDiagnostic: BYAPR11MB3302:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33026DD4CA07B3CBADFC4671EEA29@BYAPR11MB3302.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FEIqK/wf5S3xZedZV3S4Zar5ggyh/uRI5oNUvc3WHitX5v4rdEfb+YpSRsRPJwdJdHB9LCF2OkhlfS6CvTFQM/R7nmpjGV4k3N9bo3QEkNzZX7qLoCxHf6W+V/x5Tcm8RRgXZole50eBvq9PjhD50p5CILGFjDjUEGrHjfkAGECXBb8+mU7SoB3sA6IaFtWaEE5TU9dPVPB1s+jGgRNS801ryJtmOPAYB2OdB6JOOiwqwUn9tDdTL2X4K/B4NPI9j3IE16JiFctfWMjffZTL/5eJGo8gm70PmrMSpKFCVOXKXgbCPH14SndmevQMQZaY/hYdMuLoPePek5begEQHH30xM/IC6zC4QfU4eouFGD2Aq5QVuA0iV6gAxVjgoQGt3qcRNlcxSGfUS8ApsssIlRL9ZFD1nj4b5w7jyJGX+yH07xpx3Mis2zwPxb6er+7mV/gvENCRCkZz6UMxKodhH5k4RjfBnS6q7bjVX7z+Yj8qj9oGqpoIlB1w/JWz/YAtfsD2qkrYmrplDO6VEejp3N7T6YRfI40JKn6yNv9rHYL3KvZO79HQ0Zk8dXGTAg9P+3RA51xGs7B4Ey4WvVBv++ujnC9xZ8LuQ3L6khLdvm+VQf7moP+gRVnq8+irRAl1nYfmCrcl03sCl8Z7CKqLaKCaUJj0BUX86w7fAGTexnN1nAO75xDCtN1/bdbaN9Mj41l90VRrSfuI0ufd5xGCQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66476007)(66556008)(6512007)(6486002)(2616005)(8936002)(186003)(86362001)(38350700002)(6666004)(956004)(66946007)(4744005)(44832011)(1076003)(316002)(508600001)(36756003)(38100700002)(5660300002)(52116002)(6506007)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OA+v6DhONvne3/ubHqDwhht7J70GLdCmsZJhpOgoA8wlQkt/MF5paFD4btzT?=
 =?us-ascii?Q?OEZHa1keGRuV26igtebVUBxNBqry2XPomc10MBSgvwUEl6d6zqWQsPc21JHd?=
 =?us-ascii?Q?k6tR2Ljv+hGKeqPDhCTjC8Rqxtv+Hpd5z/eQvWKozj+A823QleM8X+lpKfHu?=
 =?us-ascii?Q?v14mIEaaXdfFmusl8K9b25XVSDIFLUaEuH/0tXGTRHK5P/7PKinWvflQ5pbb?=
 =?us-ascii?Q?VmacLz7iI7D8Gu0H9onpfEfQnnr0feCqs/KwHV7gWtBFiw4mfpdaHNRpc21g?=
 =?us-ascii?Q?MOq4rUJ4Pg80OfxEAiaSwoODU2XVBwoVdvdXIZhTGws15MSHs3vzxp3HhIbU?=
 =?us-ascii?Q?5r+3zZ7OgRTwH3lOTNH2ZlQSFC97GZnLZboxRaCVicMQjYH7S2mYdnsoQAff?=
 =?us-ascii?Q?UTgWrh9MjeMexIBQFhhvdgfEW2Vt6OoCPsimQ2VlD/2aobU5aHP3Noe/xN2h?=
 =?us-ascii?Q?TX4G2iz/xLBEGFosaZ19x6A7E9LwHiVQai6HsdQlFVQAbLIDtaW19R8snyTH?=
 =?us-ascii?Q?r9gmke1SiP0ykPv/mi0IZSD++kXO9JRi4UjTMZnF83BpChyhSOBXV/sooJ0L?=
 =?us-ascii?Q?2NK/zbQ5OH9xGye8HLhtUR/pBNxrShxM556n8gHhiqCVwpdA0nT3x0ZBVoXL?=
 =?us-ascii?Q?0N2qihq6wp68rxGDdZ29BEtzQUeYtoKruuxy2Z15X5XxfRH23iJrql76mj+3?=
 =?us-ascii?Q?fWdEJXeAwkxlbWk4MSjeEmtofqlvRnTI9gT0B9SyzDuE3icfaw8V3rNeTEoU?=
 =?us-ascii?Q?qFF7qS1bbfIPF6VGbuhpyQxPKa7XxVyxbDfrb5ZTbMyoNQJvbhZnP/aBcyRT?=
 =?us-ascii?Q?EaFomt+GAVW45t44iEDeZdbyiNb3OCzNtu0QEPnR9eKOX1y8Mn0uUpBDW3nn?=
 =?us-ascii?Q?4kishpYD2rs8hN3N1tNzvi0C8N/HyapKJT2uIYX5FoKmT9QKmwJaCq2OBzPZ?=
 =?us-ascii?Q?JdKR8F8GrzKVG255J6QfZN84iPbN3EaXxXPiBNCgnAG9yLl5YVqN9VlYBKyr?=
 =?us-ascii?Q?DxJfN9AkceQ2+tE5iROWKHW0eawtLksPRAGgi4IyLVQLJfXdgKYwTs1HMPQv?=
 =?us-ascii?Q?eumvAAfI7yJ+C88LoXkI8sJC5jtmPllUaIYCYTrzHc1g1JUqC0FxxGAvEukO?=
 =?us-ascii?Q?rLeeZJGtZ0zXqOhUjP0r5DK3TMbWoGFazPwThArWjAyTaeUIBCcenG1nFbK8?=
 =?us-ascii?Q?L+IlXjJ2AcVIZf0RLfCOipRcwlK+J6rQFxwj51cmjpPT+seC083lTy0jWDIg?=
 =?us-ascii?Q?jbXe8WekjI5mS1L2AsZpkTATLbgpODAPx3AntSMcmCN/In3BeZNBB2avXdIv?=
 =?us-ascii?Q?16TeVXb5tP5xnXY+FF6OAeXo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be0cc4b-60d3-4dfe-1505-08d97e165a52
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 22:14:32.1336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOkaAC5GTHRcCbdFy7NP2bvaTZgebo3ozP8ZWJpbXm1ISxP2yHl8YDw7cWYNE20Tl9uXGijQKvovne6iVNgkRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3302
X-Proofpoint-ORIG-GUID: RXqgyw1ze9NdilZ8KqWmquGXv6I16GZU
X-Proofpoint-GUID: FidbQx3aL2I5ZzolI6lzs3q5DoCCIJ37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_09,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=828 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220143
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When the collect_dep_sources() runs, it collects sources from both native
and non-native recipes. Later when the GENERATED_FROM matching occurs it
may find the file (via checksum) from the native recipe since it's the
same checksum as the target file. The that are generated DocumentRefs
point to the native recipe rather than the target recipe DocumentRef.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 3c73c21c04..8f7fae43f1 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
 
     sources = {}
     for dep in dep_recipes:
+        # Don't collect sources from native recipes as they
+        # match non-native sources also.
+        if "-native" in dep.recipe.name:
+            continue
         recipe_files = set(dep.recipe.hasFiles)
 
         for spdx_file in dep.doc.files:
-- 
2.25.1

