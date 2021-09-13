Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26363.1631519123556072802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 00:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=F7nU97+0;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4890dbbd43=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D6nR5i014041
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 07:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=gshwE2P7qb638XNl2l+/zdhawEMF8RslRJNMJNgge1E=;
 b=F7nU97+0t2D32rlLN2KHXczeCd4Mwb02GOwy+RLY4RSuSTJr6+kXCDbU7NKREs+nOeh6
 sBprEet+WAZb4drOTq3IDibkoQFsLV3tqrzbf3inh7PmbDRHV7w9eq0qh8lSE5ll5935
 p65sexjahGzzbw9ltu+1pCz9qqhxD+0d333bbrGIk8hIoqXjIRZB3y9udMmF/hPhL5cg
 nmDQjRwb3X9RcYnOQC9WjNZEYearEwphSAkY/MnBEcjBO42ETSD5yXriD8hPZzO1AjyE
 cuV8kKo5XPnBuiVWwmABP0a5WtrOr5v6qNzK245bcKU91eQLk/znBjtDvo9hclUJ4AuI IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1dacggsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 07:45:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18D7jLvL007051
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 07:45:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1dacggsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Sep 2021 07:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AT962YdR6IiP58neEDmfFo/jo3KIyZhG8S29DHVWg1wgEDZekYJaqWhe6nNeqEkvSiquc20Z17WSwVfhqpIq7dwzkjtgC5As9eRU78tFdVVR5fWv/YlVboEfAJeOUTPNmnHfvCc4zzIfIzXMIgCPOlNUViDHdH+KGlGy/dC23mGXTdzpcV1HrWw8ZYmR6gmJUsgb6DfdPvjED4ROTQ9/ioIA4iW3lCu1LQuMGuNWrRr9gvTjB0HXOsIrWnQgDCxqcFe+RLb7+IRTCJTECtMPhhQl1TxLQz25S1Yxz+Z1vFtsa2OI7GP5u+eT9lxCEa+HRwvd911aCF71u/z3zMabMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gshwE2P7qb638XNl2l+/zdhawEMF8RslRJNMJNgge1E=;
 b=WaaOLf5gUK79MNf8w3KqejpQ1reu+o2GQ4Y7JlUIlV/BBTGU9VqRuUhZF/glFRRNJ3lQJzE/jjij7/krRGiWa4r28jPzUkD6KyWmNsg1ayWFTHc4QJpvf0F09DehYozmxWqIXOW9Rz7DceFIQ2uEBl52ZuxrzoIv5Dx8DiKk3/gqzl6yiojXkpqBRoOha74ZJ6WWA6N6qWYtjPJsyDs9DVjvw4T1XIopTR1Oee3Wlx8JIYZQGWbVRjY77ok5ivEa3K61LQMJDE5KhfnSOwmMKJ+NZQLJOszVmiYct5H3zNfxLoHt/W4KenYlyOp1DquejxOXyXBNyGjsKS8Y1qUAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 07:45:20 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%4]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:45:20 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org, ross@burtonini.com
Subject: [PATCH v2 1/1] oeqa/sdk: assimp.py -> cmake.py
Date: Mon, 13 Sep 2021 00:45:12 -0700
Message-Id: <02077d8206a44e96485ac7006e8e044dd755a269.1631518973.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631518973.git.liezhi.yang@windriver.com>
References: <cover.1631518973.git.liezhi.yang@windriver.com>
X-ClientProxiedBy: BY5PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:a03:167::45) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from ala-lpggp7.wrs.com (147.11.105.171) by BY5PR17CA0068.namprd17.prod.outlook.com (2603:10b6:a03:167::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 07:45:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82719086-37a7-4421-aba6-08d9768a6fcf
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3628DAF4CC5561BB1BDDF8B9FFD99@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ls4AgaDBEMq8seg+B8Atx5/EFuIEoIGCTh7aTNYb0HABN/JcVvbSbp6x0JsfRS6g9V3jjJyo9QVq49IbgURBIX9Zr/UuZBK/7NDzxdRrIOPmf2Bc1Lr/ohZNUEdaHecjSJQSA1mG+S7ffxYrr4fqIcPNlYgrR3YHWL9xA+oHY9sPco7cNCPCOVciS5dg7jhHqbO4ckUYUKS91q6wnhRGS74ipOEJfV3Gtnch2ng/oHtK1uTWLrPbaY6PHdcwpSs1LWzQIGzcf3EnC/UogT8SIw08e/eAxJeTQm9MtLBOveeDGEBalC08P312QDEVpA25xS24oz1ejX6sIjL2/7ob48hzPG7PvIpYYiCk5q79jnEHWFjFWlY85QCL+SFYdsi51csyCSpxkffTfw2usCXDWB6VwJqIgjuC0mOkhGq2U3ZWoTs+dr7xWh9x12enhThOgDyrsgulDczIXCHD7vt86k8/F/USOBONb23q0cbEIURh+zBXZpGGjIQEnjoIB2NZAserhfWmS8+rAo5qLp947c99gUW9xhxFXYbyQK40NzH6/HsayZgLECxDwiMH0ttyLirujKhacI5tCsabknwrvOwSRRowXKBI9oSD9JTaqcn34/PycHxu2galOdVagYLyKSlXTUewwmuES1rcFIZGhKwfqkMqv4pF9ihD+hCrpTkFoobgzlJ3D4jjMAsOKdFN/GXArfzO0jcvjtjC9kGqVyrlwep5sKE83V99yT26df3BlYD4EsVgMeLGR2aBQp5ohod25RhZ6/ZS5bNWWyKNVFTfdRuVG3boN6qK1qxuicIw9epNZ8BrpVOpk32O8u82k7hYubOZjfgQUq0Y0SLmcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6666004)(86362001)(2906002)(83380400001)(8936002)(8676002)(508600001)(38350700002)(38100700002)(2616005)(5660300002)(6512007)(66556008)(956004)(186003)(6486002)(36756003)(52116002)(6506007)(66476007)(66946007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J23M4lWo8o+AZ2+dFgUGaQgpl1fkr8maFudHEgoU/t+5HxEkDKm0SsljAD/8?=
 =?us-ascii?Q?ImaiRNZbeLmfqFWkgNqbGLLwjO/owIm8yjS41UwU2zfhhWHud40vw2n8OJOe?=
 =?us-ascii?Q?6D+y7oISsfWktv8QO6vGySbed8XxU9uwITIq2H1VdndRgmLaUNCGEE3OF/J3?=
 =?us-ascii?Q?hWACN8Ofk9k8yhcpVcUz9uOoISCVH3E+DlXBzWML+OeKUCC2cq8Vq+WfxxZ9?=
 =?us-ascii?Q?YKwJFjO+sKbeGL0sV76aUzvxf94zBZRtSsjs5ZFPHCTrefKRjftqkCwIKYH4?=
 =?us-ascii?Q?vy1+aKRxNYGjXk89Qat/Mh3yf7Ih2i/E4kne8fDFsi/85iYxXhz1XUTY4hoV?=
 =?us-ascii?Q?mumVA/1dn1IakRwMBvnMksqFtrJYjzAuteYxFrOjuUln1l+iJuFiWAUyxWCN?=
 =?us-ascii?Q?tsfPM7K1mfetUvcCC+OhH9zNKLDYLNnA38f1WzQpujq6YG3Jx9F7eqw9mUyy?=
 =?us-ascii?Q?UL4dURgFyidyVp+UJL/hXl7ETu5kJTcF4X3GsEJgmF0xMjVAxejW63Z08HjP?=
 =?us-ascii?Q?SN9LIfcDKsWIAWNSMZFEZlksx2E5Ihx59koUgXZ4aPMG/+CnF+NQMYISGnGv?=
 =?us-ascii?Q?h2ANbi1bkyiDExwnxNErvDPkyuSNejPN/VsCMHbmBP5MEJn5ogqKzP4M419u?=
 =?us-ascii?Q?sDpg+Ppy99EkyudIGZtzdwWTOEEiJEC3v/W9G6K8RKuloC1XAaXMvNfCbvoE?=
 =?us-ascii?Q?ZzlL6dH/NTynhRL4Yt0cs9m7Y8MicOgA8gSCmgeUjQiWODRPts7uLCnnnR7P?=
 =?us-ascii?Q?5BQjiz8fX7yxOCwb45ANtjY9tD0HaZ/I9Zz0PewLyf/yMM2e63hYOvx+EveJ?=
 =?us-ascii?Q?5SooMdxQudbvZ+pBThiCARmg8iVQxti3/jIyYkYUfrQUvAcRuw0Mi5yOjt3b?=
 =?us-ascii?Q?wJGkuybKvLGntagJGpI44Vw5vz6RPCj2xfliByfBNeQAZg2hv9/uQeIe/AKJ?=
 =?us-ascii?Q?onmjth1AWEZ2klz1x75ucWtSmYNvMf5hnEMFXUCoK07/26WNYcMI/zLJzAQe?=
 =?us-ascii?Q?bqZTo/+ERSrwk/Ro6e9Nb3Pj/2fIMN5sf/mPC38ZiGiJenA22VUUqfsb4jqw?=
 =?us-ascii?Q?JM5Oj37SB7aDqEcxeQgoMnMOt53yRAgAqubKmI/EtpGDwNNUyNGiTLt2inE9?=
 =?us-ascii?Q?8JAkWtOIh1bWrFVGwhbxmO7Hav32b2W/K4hZdBWRzHsBpTaeA1v5cNKvWn+i?=
 =?us-ascii?Q?RBGm+BVihiqUM/IT94v2VoZzGsJn+pzwwZLdjXM0EW3nBAaMZKXz4xpmGc9Q?=
 =?us-ascii?Q?E/3ghPPPNN1DG4tFiT85BGIXftAZDAIwLdSz0X8ht2D/lJNhHTkLVXlBMKOQ?=
 =?us-ascii?Q?Rn8FQ09Y9+diLS2BVSRTT57i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82719086-37a7-4421-aba6-08d9768a6fcf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 07:45:20.4425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KOnasl1HAFXemWwksSOuLNE8JyHbRuPfYr6pFw6RTgfc/tKu9Mv0VJEb2ssMBPttwq7LYJoKW909sBQi46Grn+5MqV37oINkBkUaUhlgr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
X-Proofpoint-ORIG-GUID: NrkLR44a3B7XYmPnYeSa_zJGl3yZTtg9
X-Proofpoint-GUID: CQxECsv_j5Ww7Qyb9ay8U1fY2UyqC-Gt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_03,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130050
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The downloaded non-free sources, now download expat-2.4.1.tar.bz2 to replace
it, and also rename the test case to cmake.py since it is used for testing cmake.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} (81%)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/cmake.py
similarity index 81%
rename from meta/lib/oeqa/sdk/cases/assimp.py
rename to meta/lib/oeqa/sdk/cases/cmake.py
index f166758e498..24741d4c0ac 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/cmake.py
@@ -21,12 +21,12 @@ class BuildAssimp(OESDKTestCase):
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("Needs cmake")
 
-    def test_assimp(self):
-        with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz")
+    def test_cmake(self):
+        with tempfile.TemporaryDirectory(prefix="cmake", dir=self.tc.sdk_dir) as testdir:
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://downloads.sourceforge.net/expat/expat-2.4.1.tar.bz2")
 
             dirs = {}
-            dirs["source"] = os.path.join(testdir, "assimp-4.1.0")
+            dirs["source"] = os.path.join(testdir, "expat-2.4.1")
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
@@ -37,4 +37,4 @@ class BuildAssimp(OESDKTestCase):
             self._run("cd {build} && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON {source}".format(**dirs))
             self._run("cmake --build {build} -- -j".format(**dirs))
             self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**dirs))
-            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.4.1.0"))
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libexpat.so.1.8.1"))
-- 
2.31.1

