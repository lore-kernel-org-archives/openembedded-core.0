Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 3552 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Apr 2018 21:42:42 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0065.outbound.protection.outlook.com [104.47.0.65])
	by mail.openembedded.org (Postfix) with ESMTP id 067A174637
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=toIqmHNHQnmAMcExLPXsJgWfp+GoAd/evaQZRbaZeyU=;
	b=i+Y6I+wrOWH+sf0KGftzBb7Aw+Pcrd1asB/gbDvxgJJjcUzH8JexhPV07w5INb7rWcdfpJ+CwwTuzaZru3NVK/YQENQi0KKklZMEkFroInmT1dptNBm1Eg9c5Q3rDAiFeCf7xGvvwIq1zQBBllNOhRabjHNTPnMpMQPuieLPsIo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=vaisala.com;
Received: from ThinkStation.vaisala.com (193.143.230.131) by
	VI1PR0601MB2544.eurprd06.prod.outlook.com (2603:10a6:800:81::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.696.13;
	Fri, 20 Apr 2018 14:10:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 17:09:29 +0300
Message-Id: <20180420140930.8149-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180420140930.8149-1-niko.mauno@vaisala.com>
References: <20180420140930.8149-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: HE1PR06CA0141.eurprd06.prod.outlook.com
	(2603:10a6:7:16::28) To VI1PR0601MB2544.eurprd06.prod.outlook.com
	(2603:10a6:800:81::18)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0601MB2544; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	3:CVauOgMMwxRUgBQKkuMNNiV0A9aoUCILLW70vdiShmqhCKNPlVLSckDhNMQ2qMXFiN2mlST3/9DjSVB8qNtHwjUFVFcTmJXp0ikvNr/GrulgSTiOdQSkZTXfxQfL1hbBFCYWKhkiasgrlm+iUezfUHWWO8GBpxsL525EPgLTuEb0FMi9K906RuZ5fhSwBYVXu7tZoiuVM/jpLWvaltoECUzl+buMgfoPUXo6cBC3s/UYq0BfrR4IzMf/tZQS900G;
	25:fZUk6okgtmYomdR/959T9Qz1FOxNAqHjSvuKC0Oy+suAhO0qaPUGcmaRvd0x/RVGSy/4Qaj1AzJDzulzlpwgYT7AiVEiZI26do3uMWjx9QpKCddjpRk1dbAAaY5mnlM5H5rpXm+jdr0LdBst2oWYX+P6nvyq5Tawz8mhkSFjMklW+2Ecm1AxE1dpAUzj5F4lU2LYfXQqLUXPcqVvLYr1hovFSjy5buZjxCqZF9sMC22ZJ5oq+3RqDsRBgbbTA+FMjy9WpD+4/FQGoLfaNwMua/feVDMRvvloxRrgeMKwJ1ZDu4gx2uismIGgiAy/Nn+Fu+fRMc+e1mHrDEyMTn//Xg==;
	31:uURTdVO2DCXCZd5DVTW2c3YePxHcCz929o0FS3ByP/LBby5qAgTStzV05a1oZL5kJhiGja6revTyTxWPkUofXHs76M0+Fvw3HsswWy9m4IUei8LzTzwERt74ty2nwxEKqKKzLulxmXw1wxvSDY6Sk/xpkwTUI6pJxeIDnMeagosEHnR6RYN4lYh3aZPG5H0HrL0mJqxITs9eOFwBGvDEb6aojiOyPS9rL7BXS1QXZxE=
X-MS-TrafficTypeDiagnostic: VI1PR0601MB2544:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	20:zMUN+AFNrjAgMnc40oWsxrBa2UXb5DmCyMhLK0/NA2sZJ1xIznQHOO7L/xmj3PehY8rAtoZ1u4LOpItJQoFKJevxtC2/6+DBQsKHMS2yl6Zjcb0xluyQBUGkH+EUm3z9ikdYwAQA67WNIJcVuTzjKJMURE1UIymhzSCcAFSlveM=;
	4:sAVNct+pGn2eLyHCFUgcqZzcQSPUzD41c3On20lKUXlJccU+h/PSCv8wc5EWkluE+dQe6c6XkHYubb2l9xX4PxfuQMLIjAjk5Yi55NjcacboV0XYait8w6yj56xV2ymtw2WLTbxd2mYlzy8tJYAIFUe7/CbfFct5a47SwyWl2pmhr9o/jDOFNGOIk4/KtTXCioMso1h/zgeP/QbGmnZxroYMxVJGyHZpBLHjmmylKhLYqaigLdJZfxWEFGET1XEsh0LTJ1ZerPh+jM+o7DD31Q==
X-Microsoft-Antispam-PRVS: <VI1PR0601MB254465002CD3679A724F855B81B40@VI1PR0601MB2544.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231232)(944501395)(52105095)(93006095)(93001095)(10201501046)(3002001)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:VI1PR0601MB2544; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0601MB2544; 
X-Forefront-PRVS: 0648FCFFA8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(376002)(39380400002)(346002)(396003)(366004)(8676002)(50466002)(81166006)(76176011)(86362001)(50226002)(52116002)(25786009)(386003)(48376002)(36756003)(7696005)(6666003)(6916009)(107886003)(6486002)(59450400001)(478600001)(476003)(2351001)(956004)(16586007)(1076002)(446003)(6116002)(44832011)(53416004)(2361001)(305945005)(11346002)(2616005)(4326008)(2906002)(316002)(186003)(66066001)(8936002)(5660300001)(3846002)(53936002)(7736002)(15650500001)(26005)(16526019)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0601MB2544;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; LANG:en; MLV:sfv; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0601MB2544;
	23:AA6Gh1EHMFtBBMgljXHuhHgPz6FIES6y7yfltH2?=
	=?us-ascii?Q?tBmAn8tC6bibkSlJDu4KkwPR//J5t7oq+v635r2sUQ/Rjs8AT5VCwjRIrKLW?=
	=?us-ascii?Q?11QuQiCy7YQ+bJ0AONG7UvtRW7ceq92fUe8/ZIN5L4v9y/C5KYBbizIaAa5v?=
	=?us-ascii?Q?Iy9gbzYywfCo+GbtkNvo1Dy9cNPxdkKRZK6Z6QNlP24onbfDytpo4YpdoaSN?=
	=?us-ascii?Q?orA13AXubL+Ky6+8+s5EVjSXvXBqB+8SuYPOq5A6Qub2rpxDf5d/wDX+mWNA?=
	=?us-ascii?Q?F126yJl6PNtWRrVeHP8rawBXgeXk3CEt13BfQYmJAfuimAQUGMMuUwRvmgfE?=
	=?us-ascii?Q?okNY4GFOwkhPnEY4H/rYRRzfsLD1kGaeyXEG4AUWdztCa5TUM7fh4i27Njuj?=
	=?us-ascii?Q?EthZ66CtUipeHwCU1fyTveYCCHHjYgxcv0scuxF5oDLCnz8l1P7r9xktpu5n?=
	=?us-ascii?Q?e1MdJhQzqSy5beyhCvkGVFg1lc2dn8sjavjTjr8pyBU906s1/TASla8ZJ9bx?=
	=?us-ascii?Q?qL2jeF6MlgfEbGd+AdK8FQ4nWWjWoFS+mw3IU+rb8I1XbMzIoDEhgDlWwRhk?=
	=?us-ascii?Q?CDjMlWmhR0tD1EYOH12wBa/PYu4bBdvvi4Y1Wq9tb4aCX4Ue122wYsR0P1V6?=
	=?us-ascii?Q?d0IurY67VrCLEM1AmQv9mwipE8dKizO9SFB48mCr0gWgWkyqcOnV95IIL6Xk?=
	=?us-ascii?Q?YQiaL0/qYaGsspL34W+Qml+U+5/X6V53a/hOnjeL7hvFo7FDB640B99HI0SE?=
	=?us-ascii?Q?se87P2JktQUIL+j5hX/hz+q51sL7Yr/QYB81KeTK0AcvW1n6IE2BOV92nG6y?=
	=?us-ascii?Q?XAYOKwfXikgDSlJ5iJj+Ku4SWKrIE99jwqSuuXjh59MD9Vn1uj4tZRR93JAd?=
	=?us-ascii?Q?NXaLnxML9b6vRzXfmPYA4YcbjQwMoBEBsXp17nRnltROd3Diy3jHLEHURaI4?=
	=?us-ascii?Q?UT8ZVNClR+5Ej2nU0bYMihR0KdQDHS530qXldaDC9eay64GN0GDT/xVYvYXw?=
	=?us-ascii?Q?Yf8eHdF+PtSMBtqzkT9sqIZpUg1LTZnC2bJe99tumRWhmc11wN5ClIx2YQMZ?=
	=?us-ascii?Q?y5qBxccjGfrrxG6oQK8PlUpqG21jNJXMosQWekwOf+WymQqDBpksEz6AjbLA?=
	=?us-ascii?Q?BQMHDra9/T4ZZOVzSY14pQNivAo86SFY9929PCqCXYfL5fKkIXyk07w=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: KaN0GixffwsUgA6L9Fsp3O3Pyir8OIdD8bTDmtjMur2sTC9XQy9O9xRcANXqYQGYGT+mEK0WYmlHPu17Qu5UeYCiBJX1/DzFu33xsi89Q1iCti0IanZRe49NuGddYZNNT8VPBF20Md33IvG/K/AG8jdzzGugiCLCBnaCJkgz/7ekh8skKcx31lvIi+JLb/ie
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	6:dmV0axxdFUnWmZqANTKj/IE5Fwd+OrFgSvPmNJoho3HuwNKoL9I/pUtlkPyriGdnbZ2AX6CQ3XhBM7s2rphLF7Jya/ja8JddWPD4eH5MA7FQbvnKQqy/7jHmDbUAYgMf2cD5UgbGEW39hceIF6V5W/MKrpwZPD8K+pXgu7BCsmCmTme1JEriRxQqK3Aax6GZaStiIf/gdmEtf2y09VCYp1URbjAE1IY+YAPDYmxQrq66ekoP+V1XgjB9eyjYFI2A9ny+oG+htDM2Qov8ttFVCqNQMMtr8RQZ3mvx3HVq9jANxLVB5vRS2iyxmsASyrCyBERLw/DroEB16yyx0MyIJ7W/RL8KidU1LogqlBc6RGqHO0D5ygqVOhC8WYiJS4S0Bkb5bbW6UI/NkMGC+USdkut5Ss0sVaDWhNK2yif3OEv6FconSigrGUsWmZrKe3HumVfAw73sp3RchsrJe4dbcQ==;
	5:axOyw1IESlrSRx3XjN1lARCfgr4H8acJpO9ibswAmKFAM7wXVSAgTeCmUBykQ6IyycwKz+wxGNaMg2/zvQFskXkxdi95g0n+pTuC1bgbEwfxG1LR9nOUbnKN4D97ggGJ0tG3NCOIfNJtCXUqTUjjzKAd8JYodONODF7Hpc+YZN4=;
	24:Sb38FF+9CbnroBeNNn6YddS5anIRFRkzuNsywo5WUohCM+sfO7kF6Nh9Lejrn3nf10C2WN1XZ2DbR7ys+dyWcX6ADm0rS85LgQVVoztl1q0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	7:DznPhB1GxFC1dxgwIKCosbhWkRSXI8EgkBcmdw/b4ehbh7Qu1NvZV7YXVJ3SNhfzMx2EA6qf4Ny2jwtIvNtcXpl1z+oQSLt2zpRqW+TOx7f0HkypWzAFz/XtDPqt8UqFpLTqrjgq/j01RARv2plJgKzqh2A7QOqHPjj4TJNx9ZhXY098LLKwuv8L5Q1GfSSFpreaQh5yo8nB15vGi2Vl7T2n9q35Y7sNpqYsJzTj1AxekZrk67FFl82N5KsmpymO
X-MS-Office365-Filtering-Correlation-Id: 12eb2aca-ff71-4350-c69b-08d5a6c8703f
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2018 14:10:14.6409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eb2aca-ff71-4350-c69b-08d5a6c8703f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2544
Subject: [PATCH 2/3] e2fsprogs: Complement update-alternatives scope
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Apr 2018 21:42:43 -0000
Content-Type: text/plain

Avoid collision of e2fsprogs provided tune2fs, mke2fs and mkfs.ext2
commands with corresponding BusyBox provided applets in case both
packages are installed to same rootfs, by adding these commands to
update-alternatives scope

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
index 56abb3b5d3..cda432460f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
@@ -100,6 +100,13 @@ ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
 ALTERNATIVE_${PN}-doc = "fsck.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
 
+ALTERNATIVE_${PN}-tune2fs = "tune2fs"
+ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
+
+ALTERNATIVE_${PN}-mke2fs = "mke2fs mkfs.ext2"
+ALTERNATIVE_LINK_NAME[mke2fs] = "${base_sbindir}/mke2fs"
+ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
+
 RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash"
 
 do_compile_ptest() {
-- 
2.11.0


