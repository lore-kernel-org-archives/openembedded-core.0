Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.6282.1631261303072653357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 01:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kN0N0sKq;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48872e2802=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A7rGVx008323
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 08:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=MbVy5aQAI2tkpiUNi4PIqb5ELLQZy9E+lfDGq0lR4IA=;
 b=kN0N0sKqV1zr43jCM2cOHTAWfINpW1utFvrRVADhQ5Xn52aeyDDnu1IKIr+GBJnsG89I
 U96yj11MQg9D2jKGclU8WO+MZ3qDJ+aVPkydHlLqIxI6VUShNX4afLr5Dr+aghmRr9pn
 SuLMzY+WcecrfMriLyK8SQ6rxyV3IkoRE9gN8UkLka1wTZbWHuUS9wSynqGGJOjpYAV4
 zEUUTyRRHyVz6Il0wlf8+aZAoX5srOY4OimnF0aPsodgYci6cXHvNh0KRZMLclwdUhSd
 AxE4/9VOl5j3LD9fBppBqnrdMObpGPY+4jUwgw0YbGNd+PN8FPv5YWYAfqP59XlOdmyU UQ== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aytea0b7t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 08:08:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/xHnXHGmspwbayMzJ+q3DuN65Ik4/2RYqDByLBY/BHtmjrfORGmWty2/u85Eba23n9UCOmQfWENOsuYtSd07IQyb9sedUvBYSMbwYZ1RKdi3u/QnppqwZXA6bEFoq4bnmhRWKmgDC4lZH3k/eMLMtXnEl+zzhqIsfpRjSbzpMxUjC2DbP7OFJd6DTZY0Lpg+aY9/zBUNwFKdHDYGpcRiVborAXjVM2/70Kmy3eAYrkzCOi6DSwN1OujPmyi7zsXU5toRztYCo8ZYQ38GEhCwB5nqhUkOaiYR6vjnZq4RXRA2QyCRZWEvCTO59i7aowYhBUD956NCc6imQ9er8Bf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MbVy5aQAI2tkpiUNi4PIqb5ELLQZy9E+lfDGq0lR4IA=;
 b=LAXqs4RR3CwiGnjnXbCLDLLIbF/f6ABRSNPdccxKV1VpVWXM7oCGrABeboLHG9uTaG+14zsr+cDThTYDthAGg/DN8X71UCyOgdHIVRFHyBj/7AoIPRMzwS16HY4zFaencrOy8uqAE4h+OujlRBm7weL8veL3KYAFhgX3Lpr7XDPDEsFyt469DoI3xHUd9oD/PE4ULKVfBplcLlQoo0usYGmhRqnVAmer7rPzkvMbgWLGK75/F1uR62mxBZOgrkGbq192qMIODBzuJ5V1YObnGzsQumI4PRAmrYxGq2Kj2WU82j83YZgrWDsyvw66CmM9AVfY2w5kJQK1E48rOKN7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB4105.namprd11.prod.outlook.com (2603:10b6:5:5::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Fri, 10 Sep 2021 08:08:19 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:08:19 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] oeqa/sdk: assimp.py -> cmake.py
Date: Fri, 10 Sep 2021 01:08:11 -0700
Message-Id: <5c90531f95216929b0e3cc55784a25f3a2386b28.1631260941.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1631260941.git.liezhi.yang@windriver.com>
References: <cover.1631260941.git.liezhi.yang@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from ala-lpggp7.wrs.com (147.11.105.171) by SJ0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:a03:33e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 08:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da77b0e1-cdca-4cc4-5e3f-08d9743226b6
X-MS-TrafficTypeDiagnostic: DM6PR11MB4105:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB41054C2C4A108DE1DC76BCB3FFD69@DM6PR11MB4105.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pSy8E8HRkR8XqfTowNy84wY965uHzoGmtIIAydecavZ8PQg7Vw7gU7mZLcATXYivUXVxEDURI7Fleau3X0mBP8DcsHk02ou5cqoErFNBN2jLHHXjdY1xHKDswmmZPQoCZShK9ksrp4fWSNc/Vk+hkEzrSwoAEsQDlGyq1O8ycoOy0J7uffHjDbTDl5GqUshSNUl2qlOHq2LZ4ryQ2trUo+E0RxIpWj0YFGZkAsR83bHmuaqi4O2/br9bb5r8t6vXDyMRewoJdh9vVkZEbDozYcOhZxoKxYax1jYZ1xXZc5NvpvOYsm+vW85iWr4xwT2SOv5CNy5y2+ado/qUe6QLditcr/WKicLPxpgmHJiqn/Y48lvxzpKsaWng+JhSorFWxh/FHgENMEYykQv4QgVB3dPAXyUsqYs0/XboGukfARjsqsdKWuiPf/un/mlG2eEQJaZTx4qU22Ol4uApJ8vIto11iaqTsO1jLyL2AQnf5CclcajrUTp95l3s3LWb8Qb+CweH+xb3RRANg69iofaZLSYw4G/mj4Xqs15h0RHmqqZo9D6NkDZXN1pq7AaiiL2C4PPiUUNieIqVZdajHReD4b8TE5sycoFo/NOOxWSeIWqWZjVRe4sBizr0GclWhYzDYWzbWPgWbf8HbxiLRD8s7a/ragEqqnjzs5jdM+TeGs620NhRtfNj0WER9MAoEd/As+q7lGP82TP2PEdHLr/LUkdqOrWaEdfCf7mYBJRATLPwGIFM1qRUNhhtoddG2WwMiG67po86XB8p88mL2dJfNfMGIkzprfJlGlC1UK0ahqUZA/ZNs3KNYsTyWd7svDQ2h1Rqcy7Q8GtFIuW7DSEqAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(396003)(136003)(38350700002)(38100700002)(6512007)(83380400001)(478600001)(86362001)(2906002)(316002)(6506007)(6486002)(66476007)(36756003)(66946007)(66556008)(8936002)(8676002)(6916009)(52116002)(26005)(5660300002)(186003)(6666004)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V09/DfZn5jm0E7SJt97FQNNeW44p4TMmKAUSY5z9CCwYH8LEGFz6GZaiEe6L?=
 =?us-ascii?Q?pKATSapPkG78FPiis30Ah6A8DhBFypKG0jEByf3QU5NsfFDkmnNcjcjhUpeY?=
 =?us-ascii?Q?zTUKtTCL06qH4iKSCIAjZ9fyIiq4xWqVIjOS85bVXwyhtVB3l/p6C7w4edof?=
 =?us-ascii?Q?kx7sjQhiPxE560CC4Xsz8wBBrbI0ww1+AmmCst9n3yxGPq1bL4P2FJck7X1x?=
 =?us-ascii?Q?3haCJ4zzJ1JJdUgAcpP/ulWx3YOWz2ctCevuKEXg7f/j0HWyUcTGjZ9Dt2t1?=
 =?us-ascii?Q?bfYwgvcIoT9AGZBwMjuN8bYAjPhcLq5sJMye1MeG54Nh2efkI+fCR5NRkGkm?=
 =?us-ascii?Q?NrGvXnAGSYjjYEzy7oZT+FcVrrhMO27yMwitybocyeumfimpr1lN7YwOSTgp?=
 =?us-ascii?Q?3Dp6zzomcTtWghEbr5xpdHr8vkXk+rHOIcMjgy2QtmTQzaS1SIkVAnAy18so?=
 =?us-ascii?Q?G2tVp8HnYboYhWQv256vzuDlWfBQ1f+m7AUWNWxc4NbQot/g79iCG0WZzaac?=
 =?us-ascii?Q?Y5w2VXmXX2tmcgdp1rqiwIcMhUuA61JHtDcEZeDaiXCGGgvPFat8WXypRf13?=
 =?us-ascii?Q?DG+jkCqfqH2vt+iyYoe380oHQKkDRyAnuZDVyR/Wn1Y8i6aiUrFkcLKn4N8n?=
 =?us-ascii?Q?GkLREXH5dzZMIkAcxtiKTr2bOLm7DXQ1cPR8ywvpzyqLOf5XXs+zwz5F+Ilk?=
 =?us-ascii?Q?tEtXV7CWTkvFDuV2TjDyDHvGXVVFvu6kmxueVxs+ZbTVo0Zr0aLg0HyiMC7u?=
 =?us-ascii?Q?Imyxc1+mlSnSwfC2AC5/W9BwJdo2ivWnRsqzmUSDRSJ4/1uiSucTH7geEKfL?=
 =?us-ascii?Q?mqJEv7g7ObnKLWfFSc5lpIN5tzkjhIWraduBVQHjBBrXlqVaQ6iddda/RBJ0?=
 =?us-ascii?Q?pOtqZWQuFk5W7lwRE8+r0TydEDU65aVXvzwGES4Ceto2CEfdB5WYpWudL5yS?=
 =?us-ascii?Q?OOnH6EtxvINgLHk5CSUOLbMb3+PIG4KP1oYSTScp6Oz8y/zr/uDGki/JO2ka?=
 =?us-ascii?Q?WPlxDdiGWoaJGR4Ed7tPcmfXzlxC6lcS+ae5UGlf6zGhyqUUjJdkfO9HVp9n?=
 =?us-ascii?Q?E5HmHzhbOQ0usUjZQE6ebvxmLEREGlR39KZwsZbl71a7EF6xa6wcIQzVbMB5?=
 =?us-ascii?Q?0dr0+BepH64b8vyjtRbkbloKgrgMvs98fwaiQEavnNJyO8US/R9cb1FAwx/S?=
 =?us-ascii?Q?wUXP41HM0jTy223l1MxKkmAERV1hRraW95p9EiolQ1YwrAGU4IZareuFn/X2?=
 =?us-ascii?Q?eAI6n+Y7z7BaiBef/MP942nxkKI2z6Lrs2Atu5qfwvf1UZ3PRt39d+h1RfqK?=
 =?us-ascii?Q?3XCgIOG2bnmO7WhewotrlgtP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da77b0e1-cdca-4cc4-5e3f-08d9743226b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 08:08:19.7314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geiyOxDQck89UZNEHYKsVqXhRV+L+7YxfUNgbrj+GrVOYAQEyicdzoUHXD0LcyFOB3RNIT7jw4HgDU1oXq7gt0ykKLDTqEs7seqHLjGl/5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4105
X-Proofpoint-GUID: O6G1q6XWrx2k-xTw5qNE5MAqPtpC1p3G
X-Proofpoint-ORIG-GUID: O6G1q6XWrx2k-xTw5qNE5MAqPtpC1p3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=961 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100050
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The downloaded non-free sources, now download expat-2.4.1.tar.bz2 to replace
it, and also rename the test case to cmake.py since it is used for testing cmake.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} (70%)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/cmake.py
similarity index 70%
rename from meta/lib/oeqa/sdk/cases/assimp.py
rename to meta/lib/oeqa/sdk/cases/cmake.py
index f166758e498..13b24072109 100644
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
 
@@ -34,7 +34,7 @@ class BuildAssimp(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            self._run("cd {build} && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON {source}".format(**dirs))
+            self._run("cd {build} && cmake {source}".format(**dirs))
             self._run("cmake --build {build} -- -j".format(**dirs))
             self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**dirs))
-            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.4.1.0"))
+            self.check_elf(os.path.join(dirs["install"], "usr/local/lib/libexpat.so.1.8.1"))
-- 
2.31.1

