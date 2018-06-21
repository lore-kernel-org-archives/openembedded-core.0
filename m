Return-Path: <prvs=703660e7d=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 2F73E784F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1529616427; x=1561152427;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version;
	bh=RLYflLS2vp94GATU0dnITDRLlW55euZ3Vz3pPUCRss4=;
	b=GYsCEzSl/ZKksE7R6lK6cgqL9QQYDoKw7qMz9Uy6lG58hxwYO3Bfpgt0
	2q/ymGVZH638B+o31gPMMPBm0oonbE0GfLdb+RvvK8vqpyOGh42Z4xxnW
	tlXjbvfty0yWpZHKwIz3aL3xGKW9YLgGH3awgINq4wc9qKVnB6vW/TSJ9
	AKJpLzElQdqEqqsd25kbzV2gLDGmQqrIzDFO2uE8TdYetak6IzQMHfepV
	VAowvnj1Q9pNphTp+r7IfYvmGJ0wcrtM2AlsiHBVEg/nRMr/ZjIeJ8SYE
	VPPRi7WyNkPTOeKTy+oqGn9fx9clS7fz1Au4J5eFjZSAbzxXPOFYrecoH w==;
X-IronPort-AV: E=Sophos;i="5.51,253,1526313600"; d="scan'208";a="81723097"
Received: from mail-by2nam01lp0177.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([216.32.181.177])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2018 05:27:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=L4Ftiv8V/SZEHCYWiTzNiAFiRL5sWedhxvNuWEdoffY=;
	b=nd+G2FFAEL4WN8VYFESAxOATOqpGrAuV9cyxIE6ozCnWFScq0ISEAVRIUUQ5kQsZhP95K+X3EY1oKJ7Cyfz64b3WTmIcfDKomo5rCQOxDvnX4FHGFSMqiMW7hy5Vmt7ZxTPpmzwscXZTXXnQJjycOZic1oui9R1CgthA4sYrEuI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0395.namprd04.prod.outlook.com (2603:10b6:3:9d::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.19; Thu, 21 Jun 2018 21:27:05 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2018 14:26:48 -0700
Message-Id: <20180621212648.1556-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180621212648.1556-1-alistair.francis@wdc.com>
References: <20180621212648.1556-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR04CA0152.namprd04.prod.outlook.com (2603:10b6:104::30)
	To DM5PR04MB0395.namprd04.prod.outlook.com
	(2603:10b6:3:9d::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e4091b5-17ce-41ca-824b-08d5d7bdbd05
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0395; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	3:AwstC5fRjfCsoa6r1uIGwczcyTp9fdw80FPcg/hvCCyL/tUgfW31w/rvQRxOR8Tmh/tC3vD4EK6cT/G0Dciz2q+MmNaQ77Hdva/zy7Z7LG2898PyNkm6mGShaHYNbJ24wSa7VXoQEucKfBaIRC+voLLx7mA/9WbeUDFeeBxRCbMFbNSXlsSqAzY2uo8TtMfZP/HzxcgCAUyP9Egbu4OAHSuU1dKmtSD/gH9t2Gel8EOHxKXY+5OsNvZ7jbRL1mnv;
	25:l2MXgqES5ZvBlTFcx2aqSCAgTZwuc3PGRIcVNbRhIL4KOQaiILjOVhhWc6yRi+/pzWae+4t4Rb0AyLMgD6fwRgNXfI9JW19920XsJb/Y0qjhjO0AldkoyZGNKqOGfhzaEDN56Fx9NGXVd/mwMtiEEV7cvuvM84Zzz+SndDZBobr6PpMUa4x1cRLEZnCWxJWUX+/7IurPu+oLpAtlJKvH5QqwpKEotvKlXITW3C5uA20ULfJZsh3zl///7fBpuSKYG46+ob3fy+2jEBldAUKk5SFGYH5IWQ5g6+SN+N9PObuYBLjtoYhKOcKJPndNcSyGpzYt3psCAEwd+TgrLifhig==;
	31:rbrXMS9CpRbRUPT7YbZuVxPIqfOeBpIK3Mq2mvV+QqIQ3nOeDryvdwaLdUWVhabLD2EFC7MCRSTmnPqtkXzma846IjtpM2ri9fRFqoMkXCtLMstcagOoEaqCiZ1L8j/ElXffeUhbySIFAryrFSD78bKPoE2NbeA4fAunI947ZqkNLx0J0MPvb9HroIc0vuaqHNXNtLEUnezjn1UWZhJ7f9Jmry6hzz1NHL6UUwGJQ6k=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0395:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	20:B5UVuNNbeTCd5RSDjYULDuhQvAXP1lUAf4zNbjXyKvvcZvPU8RytA99pmrBgMBihDaE7ZgWzpaVAor8MVb4+4+xBown1cym8h+QJOodDgVBnu1A2YB2PnO4+HfwPatWkkkqiWjkVHTBWLo+zs1q0aDo/wRSEduqgx7fuwxnomjOU0rR8JRBnKlHQYdOgRyvL6RK5PffVt9duXwalXhKcW5OyfFwJvbZQcoaY9D8eTptSA0rFTQqYs7BCAnqc6Q42g+5pUxYSggt74KWHybcCbfL1wLbejpJ9s1bdOD7adRvEm6PbNRpEhkumRgOH+gRzFIacOfO3HbiO2tNP39xL8MYk7OZYU8+sucG290U2VjbAvsIiL4JaLQZWHlGmayn8Z43RcTcSItCWNxpx1EnbrYzXqHb3YqSGC4AR3A0D4on2KUOxj4u6xpAQI7mmxou6wmQaz8yooeKwCrAzm1196slL4OPRRk9UMFDI78IJpee/7cyc2RErGTR4R9NK1XQN;
	4:Il0toy7Z9pSsYEDA3s14L7BPiYLb4lrxI6518v2NqPOORciflZiUB9nSTwjusszDUGwPmKwvmtKSdK7I8q1p2DGUFe8SIbfrM5IXDJZ7EVF47dYbENAfeAW6CcYSWY3bUf6g/NiRqGWpiXSV/zw/EAkJfBe3JGIVS1k66r54Eoo73Hd7tcVxEIB7LYqIxQdF56fhQP4Rw5Qq6gDxZlNx8KuOWGPSAAwzVCgn2TG59fpzXHf1d1rcgJEl37fDmeB0uvEe9vQebBVHety5qO7tE80QlwyfLsr8vZCyg1N7/fSg5J2cX/pswqp5YRk2OR36rmlAkZRZSsghYssfE1YXZw==
X-Microsoft-Antispam-PRVS: <DM5PR04MB0395002884F33EA438DE400B90760@DM5PR04MB0395.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(126947320029983)(5213294742642);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0395; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0395; 
X-Forefront-PRVS: 07106EF9B9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(39860400002)(346002)(376002)(396003)(366004)(189003)(199004)(3846002)(316002)(16586007)(25786009)(97736004)(6116002)(6666003)(106356001)(6916009)(105586002)(16526019)(186003)(1076002)(5660300001)(68736007)(86362001)(26005)(7736002)(50226002)(8936002)(81156014)(81166006)(305945005)(8676002)(50466002)(66066001)(956004)(2906002)(476003)(2616005)(47776003)(36756003)(76176011)(4326008)(486006)(446003)(72206003)(11346002)(478600001)(39060400002)(44832011)(51416003)(52116002)(966005)(6306002)(6486002)(48376002)(2351001)(6512007)(386003)(53936002)(6506007)(2361001)(357404004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0395;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0395;
	23:r8KgFPWhRWw5x9+HdMD5LeaeBiG9QnAZDYcE/vc1p?=
	=?us-ascii?Q?W1NBbVR5xkMeAN+PtBmEyUM2u+Vgq4l+YSoKpVZ5I4NRPKrgzascyAis6l6J?=
	=?us-ascii?Q?QmRHnaLBzv47UoR6CiTq8vcUOA+lNt0bejZxMkRNtuwDvxmZ9wYihJ35XgIY?=
	=?us-ascii?Q?cqDW0SIQ7Tyvf2VkCvpcbBx9RjDzbez7cMo6ItHe6IYcRFi7oeFCQbriXaBG?=
	=?us-ascii?Q?sZ1hH6HAGHsrk6ff60MPrWad4g/e/j68ekB23hPbsvneKrzGha7/bOxxkaLq?=
	=?us-ascii?Q?xQAeNjt0nUgWjEmgPNd0MGRUejJpCgqoMoIz/3iJR035/mwcZ+U5lzIGr7m/?=
	=?us-ascii?Q?sSHFOH/uAlwpP7guxLgtEWua5wOv4+w1b5j+iJ0qpNdOp+772a6uYXpDD5gs?=
	=?us-ascii?Q?cl+gw2EeecswoEMHFvhaZzvUZXQp6xKfpZB2wyJnFw8BdXOcbqJ2QEJs70TP?=
	=?us-ascii?Q?HA6oiUlF0NskmNwnm8NEv979ayD+6edRcCIZ6iu+FL5jY/f3bbbzgtz19mMW?=
	=?us-ascii?Q?FHU8VkrKbvLFbgayg1LtqjLNWzf+KX+4glHFBiro736aW6rFC5aG1yMUI3Ah?=
	=?us-ascii?Q?CdDqns9cc4wh/vYk1WYgzgu3Tkg3EoDipRnNtS7J1mzpDAg/nHFV26OrUEea?=
	=?us-ascii?Q?Mj3d5YkB6osVe0xflZrN0Madn6Q9Nadv88kC4Wee0hE8p5Y4/YfMZox7h57k?=
	=?us-ascii?Q?hhRSVMs3Y1ee/M7JBFE65JC7uPQZH4kLVUAMfMuR4YR4YawxJqy/WDtecqNn?=
	=?us-ascii?Q?AzRQR5A2YO9Rl0uw5HkSxsDcnl3oaTOmx/MOfDhNk3CZH0fStBaT3C1pG6L2?=
	=?us-ascii?Q?ZKuMmbbWgmTgN1XLar+LGHagX9om8u1DC+iyzTISjnuLLrsJOgvp8uY69LB+?=
	=?us-ascii?Q?aznS2lGOs8+RESgsPVCFHOrOYq9qewvsyLb31tzPnKbaC1F/VGMbhVWzXB4i?=
	=?us-ascii?Q?tia+RJs9/BRRS8mUkbhwUmMd4JEYY9J6eBgvT1lZ30zPFEQBr/PIZGKhYg++?=
	=?us-ascii?Q?0gNFoCjwZnPcfY71wdKhumrLm9KQy+OJtcwLbqzTXopFwBPVBroGYKq75TKj?=
	=?us-ascii?Q?aiiFWSZHrTuCtvMpGNrL4rHuVfqQypvNJtGHvN32y6hgQiqB5elTsAmvugHA?=
	=?us-ascii?Q?PK4SX8Bd4+xGog+zeynwT1VuCN/Nlu9SxfEC2LgR+VHNOpMwJWzLR0Yfx8h3?=
	=?us-ascii?Q?3Q1tRwLV/8/gxSGK3Ni7FUxLNC4RPJFaC6w7LJNahOq/p1C64h95/8rOK84R?=
	=?us-ascii?Q?PGZcJt+3DsJT5O2kSdoDR7E+pAQTwe0vtwxDhMVEWNAjcGeQuGprvJfyg5rv?=
	=?us-ascii?Q?Yv6eX2c9qRYPNUyPIZWI2010k9DtfhmcTEIKGlproITvB1QWUZcwxB5HvRu8?=
	=?us-ascii?Q?yrhYQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: 9jQ3iGs4IxTRUNCNdxknjR6s+x3VesFjGITMtj7hYfEgwNOICt0Nr7VouHIfqTyCROZT1gkmHSt8Jtms08kUBPP9A+7UltMo0+NZGu3WqoKU1M5Hd/T+L83FE039tZUwQxtRnCqsCc3YW7pVh0iDVvk9zkEz5Ao2DG04m6f21FmYAC5j7E3a/VdV1MP4gW3hrN+YhiD6rXBrqTvGqZveQNT8qfMzOBRqqxW1zhCsHLFWYTFMHAzRSi/ukBs3HtcMMNw604LWBORv/f/u6w7vLiIyt8AiKbfHUAfT0F324w9To87BGGM3ctocZ0ZIIaF3
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	6:UsqOoubWiU304DS3iVk0KWv6ZnzE2I6DdyWOJL2gPuuKwHuO0VW8MZjz3Jh5Lj0WVdIXrw5pPQA9tjRDed4TTle9mgCNbBNFLcG/j1jEx/lqfD81ubnOvmZHMEN9lgWHq8SbNkPnd0y/jVWE4pwi2SetQVys+grs/HnxbdUmqx/MlXWw0f7egfbItzGNPo70xiZGDOYFu1LYUsQTHU/T0qBEsb7svVooczQ6KaJd6HqMr/BOmYrj+VaZiuTYBNmcqfQcws2Z6daXlv36ZKdFRlCVqez9rGTfzXC5+BJPgTWkFC786mPNX+cJH+H0cf4AF8ySGDSzOS/nLaQi9OofAEirG7UGsL7QwYTCaYJJc4+JwDsq/5wXgz/yTPQmgvVJMM73SyApBVwxU01vTLJRhF5D6hOUqXz62x0A3RJcXwD5suu21sHzhdOCsJaMYUULEPDu20N89nPtxCubwmlKlg==;
	5:4zDYXGq5PHMGE1XITdjDmNRRvne/qlSzu7CziDcxj3a+ozS0cnewiTRFRMLHbqw1hJIrll6xxaroo1AiftsCNmfDp7SLPRN5rjIjZZjhK/giJqF8Ri915EHkapeluldrwUBSq1RM3zDRNkdiOWVSjUsfuJ5NmGXkVcLVRNm/6vI=;
	24:PIw0/9wTrk7m6Ofu+wB+Jdx/E5KC7np0QV1bOro4l1HvfQp3kARs8O7miUuM+GK1ir4T9n63CWQCvuVVWgXtZoPJQ1s2KVvbNwxQZao8LOk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	7:WMFabvryMQcU9XEEnq0LeWLOKU7ItoUxnQ1pCpWdJHmSjVnafZgarp/Po9CUacd71krMn0ZCLfZOKBOGAcwTWICslB/KYfHI/05tqUcr4Hr4xJAJUOD0miRyrDffmmpcZWubU7gvpPU/gqjri9Q3awl8OhKQvU9JJ4BvII/K6OfVUMJWZwY9WhVMfVSl0H3d+c8MFf0Qgzch/AqEJpLPlBuft+SwgQae5HiCAThI2BgSugfz2ZN5uFpdRyZzKk4/;
	20:hclwAX2byMg6tgkL83OXfDZNiaC1ovstO5N+PkZK+WmnS4UKA/+7/Lq9fgBQp9EPRvW9JZ5q+4kQjz5cpHoeapbwlPXMkBhjpAU/RK4x0joB5mQkuc2KNwKWkZMojCc3pSc58pQSVCAqJR6NCMwSXL8ST230LUt9sqE7tVC76sk=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2018 21:27:05.9766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4091b5-17ce-41ca-824b-08d5d7bdbd05
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0395
Subject: [PATCH v2 2/2] recipes-support/nspr: Add RISC-V support
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
X-List-Received-Date: Thu, 21 Jun 2018 21:27:06 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...initions-for-the-RISC-V-architecture.patch | 150 ++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.19.bb        |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch

diff --git a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch b/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
new file mode 100644
index 0000000000..aa32908d13
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
@@ -0,0 +1,150 @@
+# HG changeset patch
+# User Karsten Merker <merker@debian.org>
+# Date 1523974333 -7200
+# Node ID f47871e2aeb16b39d4f516690e25c81b04d6d05a
+# Parent  776db96f834cb86e8863052201d55f60a2da91cb
+Bug 1308584, Add type definitions for the RISC-V architecture, r=kaie
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+[ Changes by AF:
+ - Rebase on other Yocto patches
+]
+Upstream-Status: Merged [ https://hg.mozilla.org/projects/nspr/rev/f47871e2aeb1 ]
+
+diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
+@@ -1015,16 +1015,108 @@
+ #define PR_ALIGN_OF_FLOAT   4
+ #define PR_ALIGN_OF_DOUBLE  4
+ #define PR_ALIGN_OF_POINTER 4
+ #define PR_ALIGN_OF_WORD    4
+ 
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
++#elif defined(__riscv) && (__riscv_xlen == 32)
++
++#undef  IS_BIG_ENDIAN
++#define IS_LITTLE_ENDIAN 1
++#undef  IS_64
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   4
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   4
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    32
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    32
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   5
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   5
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    4
++#define PR_ALIGN_OF_INT64   8
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  8
++#define PR_ALIGN_OF_POINTER 4
++#define PR_ALIGN_OF_WORD    4
++
++#define PR_BYTES_PER_WORD_LOG2  2
++#define PR_BYTES_PER_DWORD_LOG2 3
++
++#elif defined(__riscv) && (__riscv_xlen == 64)
++
++#undef  IS_BIG_ENDIAN
++#define IS_LITTLE_ENDIAN 1
++#define IS_64
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   8
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   8
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    64
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    64
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   6
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   6
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    8
++#define PR_ALIGN_OF_INT64   8
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  8
++#define PR_ALIGN_OF_POINTER 8
++#define PR_ALIGN_OF_WORD    8
++
++#define PR_BYTES_PER_WORD_LOG2  3
++#define PR_BYTES_PER_DWORD_LOG2 3
++
+ #else
+ 
+ #error "Unknown CPU architecture"
+ 
+ #endif
+ 
+ #ifndef HAVE_LONG_LONG
+ #define	HAVE_LONG_LONG
+diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
+--- a/pr/include/md/_linux.h
++++ b/pr/include/md/_linux.h
+@@ -54,16 +54,20 @@
+ #elif defined(__avr32__)
+ #define _PR_SI_ARCHITECTURE "avr32"
+ #elif defined(__m32r__)
+ #define _PR_SI_ARCHITECTURE "m32r"
+ #elif defined(__nios2__)
+ #define _PR_SI_ARCHITECTURE "nios2"
+ #elif defined(__or1k__)
+ #define _PR_SI_ARCHITECTURE "or1k"
++#elif defined(__riscv) && (__riscv_xlen == 32)
++#define _PR_SI_ARCHITECTURE "riscv32"
++#elif defined(__riscv) && (__riscv_xlen == 64)
++#define _PR_SI_ARCHITECTURE "riscv64"
+ #else
+ #error "Unknown CPU architecture"
+ #endif
+ #define PR_DLL_SUFFIX		".so"
+ 
+ #define _PR_VMBASE              0x30000000
+ #define _PR_STACK_VMBASE	0x50000000
+ #define _MD_DEFAULT_STACK_SIZE	65536L
+
diff --git a/meta/recipes-support/nspr/nspr_4.19.bb b/meta/recipes-support/nspr/nspr_4.19.bb
index de2c87131f..b43c78081d 100644
--- a/meta/recipes-support/nspr/nspr_4.19.bb
+++ b/meta/recipes-support/nspr/nspr_4.19.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
+           file://0003-Add-type-definitions-for-the-RISC-V-architecture.patch \
            file://nspr.pc.in \
 "
 
-- 
2.17.1


