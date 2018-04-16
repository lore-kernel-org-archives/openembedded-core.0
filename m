Return-Path: <prvs=6370ab3ea=Alistair.Francis@wdc.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Apr 2018 20:12:32 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 61FE974503
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 20:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1523909555; x=1555445555;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=+CsRVP86/gQnbuEOVdkASi23goBFKapXW+P7zE3+ZAg=;
	b=JIV++SAMgfahNMno5qcqMVQYXFheBO6Z1/CeqpDvvlIi01zdFHUdnM/T
	u1u6LT7J136bq3/jEotKOCWGo10+pPQydsGVbFLOWS5qLQrqG1nNmAM+t
	FhMsJgpocFQ0c7MeRtG3KqSabapnfwGUvgNdGusW8stW2Pdfy02j9lC7a
	vLHmWDljgVDBabTkpQFLDJiUMHGJPuG3cna3kVgSqf8fDvmXPCAt3MMKn
	O3I3mwvQPSfmgBpmDJLI7UCbVwcxs5Iymlb5+etc8CImHzSHw5allrZ8c
	b7m5VK3SJooubdu6Tng7QxG9/XFTllf1rAntW8yTpxU5Yd6kF6f9RYAS/ Q==;
X-IronPort-AV: E=Sophos;i="5.48,460,1517846400"; d="scan'208";a="76768832"
Received: from mail-dm3nam03lp0021.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.21])
	by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2018 04:03:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=h7adqd1z94lph2tQSPUKkcMQ9X49GBj7vuXgOvB9v4Q=;
	b=nqfdhpkvihNFQthtfXroQRSmRHb8rWc7k6OKxyJXpTWkHjeYVEdFjObGjJexzgKkyusACGaHPUEqIAdG4PHWXerCQ73jNz5S3fnW6qI8158DJtXcIdpVpJnQGpC2UjMRehOvzE65j8Pm55GxzRn6hrUM8ADew+49TMsQ61HHJD0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from localhost.localdomain (199.255.44.172) by
	BN6PR04MB0404.namprd04.prod.outlook.com (2603:10b6:404:91::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.675.10; Mon, 16 Apr 2018 20:03:05 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2018 20:02:59 +0000
Message-Id: <1523908979-32369-1-git-send-email-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [199.255.44.172]
X-ClientProxiedBy: MWHPR2001CA0008.namprd20.prod.outlook.com
	(2603:10b6:301:15::18) To BN6PR04MB0404.namprd04.prod.outlook.com
	(2603:10b6:404:91::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0404; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0404;
	3:KcEEnG4Qb/cTCGIRZOdelLJW/MPZxuwHetr/ioopuqo4onJRqa130Y70Y1JGdc1XTgufrQ6yCSkNACRLUQuBDxtsBxubAMIAdHQhchYJFYx90ce42X9M2HmiR4201KtRqlWuSnkVVFp2lsxICsUl1VMY/9t9tr/t28TAVypuOdRECq0XYlqZ2o3pzcydnSa5i9hCemki597UAo1v40Z+DhaORcBl30M9Gs5+9D3mNJw5YuvivKVnJAMsJKt3NDzr;
	25:D9oWdGCu31zMT/JAm613dWZHQ2uAXQg8rTjpZvn8qeOlcWrKHyalxT5hx8qUHKbpq4zG0lgVuetfDxAHH6KBDRx/3rYijgNTkhc18eHmYR4fZC1VRgnVeZ3iKqQ3IhbkIDg6iMybrVwoVTi6s5jV96tAYerOSxNRk6clphzFpT8wEc5r25U+7anm3BZoMsLPqsZPKtJ6hmMIc36ZZn1T8CxXCUp+ZdCVa5FlYlWppH6dfAs2Q4J9r1dr8eSE0vGzHACvOiX3KADgMcaWwcWK6C7AZrgg6T9ESJqCcw3U4SYcH2h8Xegctfs4uP2ZPW3p+c03Nj7WZ7uvASxDMBlyhg==;
	31:IM3RaOxQNXP54awVo9+aJN7TJXg6zCeyen8x5a10I/GP+ljlIf1tRiH8EX4U+qcN92vcAa+2st1VJOiQaA63h1NK0lZ/F0e69WI1OoWxCrAF18sCAnv2qQHVMzZF4Ul5jg3Nw9/gaUKU+XOcCXTKncfPe0L/vmwTIrIXcg1UgHGDsT/xR6lSH7PJc00qOdIPHm9x4gcUfQtc7poEU7WicxbR2ngsfBiVYGnUOTC9HIc=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0404:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0404;
	20:bxk15ZvQWmVZXcAPH3OVEcABuwrfQPrcomYIQDN8xCFh9Oc4lYOc5ht2FdLL7MdAnlupOA00CpIB+mAhFY7N5ZtwpdJPxrW6m71AdCY0ETIsnzYBLEch/WW1TbWia4CN2mx8izKUC2ntsb68XHIkDQq0S3wrx4iZWmUSUj7Q43gx01VdC3dm8lGKOpRC4b7ikA0Vqics4RNo1K2FKj5A6rs2vMxRJkWc0y0y3o0fjuerzWoTgOpeVvh5muv5hR/mG2Wawhof019yYLdTM5xjoOrzcnPGmOiTABKdf3gGHKnzV0Mi28zXTDUeRWYw4ZOgZ432pT2tADZDqcVrY/2VkeGionMRwYxXFcv7XoIl5u/L1d7aGbUM11vkIQrAaRxbuC15IhS6Y4kjVcTTebSzhZhovgDpqB6Ga0Lzm2iXfIdpdXMFGPkooqgtajcRSPH843tmjU5KQF19s4jJJEJpeLn+fP9T/8P798re/ENDgltawrQQZf7CFBUoIbdZU7zT;
	4:VYz8xHfsuhUq/M8UMeFYuXr1onF2VMtwS9o5JsmN4avwg9czcIdQvp2TFfgZnhczPo4CTQhDfMausF5siTpWzMt8XfzYekZt8r28STsmboPJJ5ECOz51nitkYUyoNJ86mD6PDCcGZCGeD724G2sEE9xzzoMopNU7jC6KfRekZt8CvKN/Xb0uSxYJ7IFbWEIalFvlgaiTJooRzpwewpW+PgO+goF7tkPEKrCTYlkHzSNzA22Xqw2Rb6liRkC097mu5Q4OmNNg0ZIlPHXihZ4T/Q==
X-Microsoft-Antispam-PRVS: <BN6PR04MB0404835166C46B76798FD03390B00@BN6PR04MB0404.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231232)(944501327)(52105095)(3002001)(93006095)(93001095)(6055026)(6041310)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR04MB0404; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0404; 
X-Forefront-PRVS: 0644578634
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(396003)(346002)(39380400002)(376002)(366004)(39860400002)(199004)(189003)(4326008)(106356001)(39060400002)(52116002)(51416003)(53936002)(16586007)(486006)(36756003)(6116002)(3846002)(186003)(16526019)(2906002)(97736004)(6486002)(86362001)(575784001)(25786009)(6512007)(105586002)(476003)(26005)(1857600001)(5660300001)(386003)(305945005)(81166006)(6506007)(8936002)(7736002)(8676002)(81156014)(50226002)(316002)(2361001)(956004)(50466002)(2616005)(66066001)(47776003)(68736007)(48376002)(2351001)(6916009)(478600001)(6666003)(72206003)(44832011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0404;
	H:localhost.localdomain; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0404;
	23:vV3CxOo1cBe3O7Dhyiblx8XiCTr1X+sF1tREtSPjy?=
	=?us-ascii?Q?dmC80gndFZXAgmvTMBhaHNfTs4NuwnGSi3/l3YHVUbKPx6+BfUYCGqysWTnN?=
	=?us-ascii?Q?htnfT6Oy9LNKr4y/E9IyCdTtlD2ipwXRmNVnnCKloxqWXsWJJ2cPnz9+E+oW?=
	=?us-ascii?Q?NXJ0EU02BElGla/UGKutx5y7pTtMIY+h6FkDQLlPy66HIAzcegfBtcgtANyT?=
	=?us-ascii?Q?aXnW+z96WlT/FKYJxxXNrs774yx6fyV4f6awEpOxCBOff+ptiPlMJn+BpcMh?=
	=?us-ascii?Q?AMfvPYNJ7xAPtjn7gCdpeAqbl6WJNxpmNqNPwVfkQ+11XMjLwVApzQ0TeSVz?=
	=?us-ascii?Q?+1NgTeuMll96rIiHgWuBZsDd+15EurfPqMQZ10pvt7DxyoZw89jplsUA2IKj?=
	=?us-ascii?Q?VeIDJdSc0iMxwsZBLL6BHs32x0TDv7zgjipRybQTqBPNMqrC37uEJ3XI/bKb?=
	=?us-ascii?Q?SAkOuP0O3zsGqoSWlaR14dzswyAG8KMTd1Gc70AVSIidkpxYdqJy9hKZJuy4?=
	=?us-ascii?Q?4AsAhK5ECp+aRmdRoNmPOSNosKvrexa+jG/etT07kjbn+H6srQQSBIvpmcQF?=
	=?us-ascii?Q?A3G5XWKOT1N9xzooqk75lNMz2TRtwJpRjIk/tf7iCYkxr6oJYgczq8KAzQVr?=
	=?us-ascii?Q?bedE9ARRwApzs4Jc3T8G1hF3rnTeoWvaQW2e+9L5bWE+2FarD+FkZImk2dl6?=
	=?us-ascii?Q?MXzikoA8SEIZp+TTqB4CRL4ZgnAdfL5TDMw4HrXwppciw2jt7Ny/Sdjr1t6F?=
	=?us-ascii?Q?7zcazmSUxYpoFSkGz9r0w0jXTpmFMTcPbs0flGVqOJ7nGD4wov2RRWyZ3SHM?=
	=?us-ascii?Q?sySzbT4ujngMDGuOzs1NlolkxR0Z/uYlf03dvcV9G/8Vhdu7t4L5paCUpiNT?=
	=?us-ascii?Q?go5sy6TWf50e0BZtQmuO4ZJAm988W11DjI8IZME9dWVVGVgGay1abHu174RN?=
	=?us-ascii?Q?Z4+WD590MW1I0NZe5F+LXCMcecmJRDaS4/zUGYrOGmd2MW9walsQhpq2RVio?=
	=?us-ascii?Q?bkt6N0n2iY/CTh/SZobX6bcIFxlFCdss37mzvpVQ2UGbCI50hP5Z8x/EHdwd?=
	=?us-ascii?Q?ITqC5EQkFBIKE3JjXrzTxYQ2CuCsxWxaUfVdW6C9TE8SRRUwPvy6hoTwxJox?=
	=?us-ascii?Q?hU5A32bgLJhVdwa7yqwrbrcMyUzDy0195hXTEUgNF25QJQMQs2+CHdPUb/xK?=
	=?us-ascii?Q?t6xyvMr7tubDqZj+1cc0GpgK5sqJQ+WMzEET+x7z7AbWxVLUaEt7CWYjvJdQ?=
	=?us-ascii?Q?j9oVQHN6NBo4MGCUhcF6srjcrgFI+LCpL2mzvd8L3+5Ac531/iuodAjhaSBj?=
	=?us-ascii?B?QT09?=
X-Microsoft-Antispam-Message-Info: KF65H2AUK/5yE5gCjMiFUFokXSp63863H4egdzOSP9zmbAoPDLO/NRXFymaFxZvYs0eesd8D5jXk2MQHie8aqfLKzi03f4kFU8vyFlygIrwVQaxK8fFECupGmApvdu1B1YufF91oD4paU9SfvxT77kV1ekVJNqYMWNmX3t4nefYDHGF9fAT1bRZ64mJ9k/a2
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0404;
	6:idZAgR2Eh1tbV14r0vveUb39qcEMmUvX73nG98aPbHmgNO6ctHBuYUuGueCHJXBPTJBPUBZj0dqttTp9+ENR7NmLtbTCqcwUAsVoLGWm3CTn8eSTVjK64NuPK7AqZHwnvFGyU8C6NkjQvfFIzBOFtKA0HJ7zpikkdQUWH6nRG+hIwDpYaERlaikDPjZsTjLgVQySPrEZa03vVmrdBPXIfmsaqhx/A/elBAQr1l4yiHhDrUHO9lzyhS1eMyuLXuOdOSThljrfqLg5A95qnW+NrFxR5DuMALz7Ekfu/xNXQf0OYd4DKsBFSZxxehvGn5ekGAPLC6EhGuNTCmG45dVMaf2T4/aA1pWMEMuXgfvND1dwxMQn0vOMjx4FzjthG0W4Lj3PFrexfFeHuto7iNC+8K+G9EZlCtDLxlWEzzJ0EXuHDwOEnSU5eL5+aQo8l3mPjCNzyghFr9lGFlsaB5uEgw==;
	5:/MWsC4SkWxFCMpHsazE+1WEOi4weetOCzrakjBOpWonlAsr+xcUn6YeIlYo13NvhtbDeQWgOsz/YzQvcnDvqm3hwxBV5xPDllh+EoIxp+gLNivSYTh/p2+oAVTQliabtdez6m8YRTVJHiuf1AlfCwE/ib/qwrx83g0FLDiOls3Q=;
	24:SIZ02+q75FbAiUCbVWmWlmT0p86K44ygn5gJmutWDGJ7B6yMluKFCfs+CmD7ZNarEISWVZjGWcq1zmNURx7Lqdie6ahGt81i50yT8GOhSrM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0404;
	7:b0FoBopHuQbGqAoDt52SsyLVNyk6L0q1HlDt467VAacKKVlV7vXq6px+D9QvrON5i7pxoLWGiMuF4bQigc8a/ADkSyp4d0rPe3CfMHbBYMWy9E64lEMMQxo08RqCeLxVtRgWAWYgaLacd7HtRbbicgYKdj2jGHT4wNgKVggDDJYPiIkVDRo4Q+lZ6LEYcjgwTIOmGvxt3XOq5JHi59ntz7fiZo2/KDFrK797t5vpF2+UJn93G8ZzgA54svpOXqk+;
	20:Cq20pa/jn9M/YbBk0hG1IJ4arrRQpEZHTVmXv3nsbTGLtHYk04uYAQp3/Q+aCAN+8x5RNwJHbojuxX5mmYxxeHWk6fKAjYNBcIcrsnHERhlvyhFKB/APR9SE92PX4zv9KUx71qd5MPIZypoMIgWJ6FK4Z0hgS8lkVLn5q/Rt6s4=
X-MS-Office365-Filtering-Correlation-Id: 5e7e6c41-d965-4f5f-2b8b-08d5a3d51177
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2018 20:03:05.4463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7e6c41-d965-4f5f-2b8b-08d5a3d51177
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0404
Subject: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from DISTRO_FEATURES
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
X-List-Received-Date: Mon, 16 Apr 2018 20:12:33 -0000
Content-Type: text/plain

If the user has set numa as a distro feature enable NUMA support in the
kernel config.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-kernel/linux/files/numa.cfg  | 4 ++++
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 2 files changed, 7 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/numa.cfg

diff --git a/meta/recipes-kernel/linux/files/numa.cfg b/meta/recipes-kernel/linux/files/numa.cfg
new file mode 100644
index 0000000..bb0f9ab
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/numa.cfg
@@ -0,0 +1,4 @@
+CONFIG_NUMA=y
+CONFIG_ACPI_NUMA=y
+CONFIG_NUMA_BALANCING=y
+CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 3bb872a..cf97cd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -28,6 +28,9 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 
 KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
 
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.7.4


