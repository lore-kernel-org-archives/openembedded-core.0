Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 5599 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Nov 2016 01:52:18 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0083.outbound.protection.outlook.com [104.47.41.83])
	by mail.openembedded.org (Postfix) with ESMTP id AD08F60685
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 01:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PXZnLu1u92hwvMzH1fCvU6bYSNRf4S8yqYu6moLY/CY=;
	b=iggmePOLGutIAiZBypk6eZxbQdHvKSZngfeQLsNQOM/4L6C+oA49s4zUmxgcMFu8rfW+DxDl2RrlGiL1ig+2PUmQ0Mi4HpQOmkRJ7JU7aSADzqvWdTvRSXeIcrVI3In7CL1WwEZOXZIj9EEpKtxusEMsOgKTaQ4JhvKU6WWnp+E=
Received: from CY4PR02CA0040.namprd02.prod.outlook.com (10.175.57.154) by
	CY1PR02MB1245.namprd02.prod.outlook.com (10.163.16.150) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Wed, 2 Nov 2016 23:20:35 +0000
Received: from CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by CY4PR02CA0040.outlook.office365.com
	(2603:10b6:903:117::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Wed, 2 Nov 2016 23:20:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT056.mail.protection.outlook.com (10.152.74.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Wed, 2 Nov 2016 23:20:35 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1594; Count:17
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53077
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pe-0005bP-EZ; Wed, 02 Nov 2016 16:20:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pe-00013e-Ai; Wed, 02 Nov 2016 16:20:34 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA2NKPG5032370; Wed, 2 Nov 2016 16:20:26 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pV-0000z4-NU; Wed, 02 Nov 2016 16:20:25 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2016 16:18:22 -0700
Message-ID: <1478128703-12144-2-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478128703-12144-1-git-send-email-alistair.francis@xilinx.com>
References: <1478128703-12144-1-git-send-email-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(356003)(87936001)(106466001)(63266004)(36386004)(8676002)(81166006)(36756003)(92566002)(81156014)(50986999)(5003940100001)(76176999)(229853001)(9786002)(48376002)(6666003)(586003)(11100500001)(626004)(50226002)(77096005)(33646002)(50466002)(107886002)(8936002)(5001770100001)(2950100002)(19580405001)(2906002)(4001430100002)(5660300001)(7846002)(19580395003)(305945005)(47776003)(4326007)(189998001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1245; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT056;
	1:K5gFr1apaIC73V/LOQjf5z/869hObkGeXOH1gwAltvGXG5mBbmjG70ObxUcUkzYNGnBbF79x76t582hq7I35+CXhHSP1Lms6GAQBNAFDxsD74vPbpkjOtt8UtNjV7ai/csHiGhNcWSwJl0d5N5M2vheb0FhQSlgEGHwfrKq3PJ8hbHvTxQRT/i0t/TI1vCdoGbahz+yVGLPhJILoK4sHZn9D4BEbkdSjTCCnZFapQVzgCcZwwY3CybGbbQilaMqcxTSBeZ2u9vYtqR0miBXtM2j2q40cPBC0Ukned1snvO3tr6xkHVf2+3f7pq6fRZr68x6WYF3+75rqY/FrDph9x4BsvyM2IfoMDHTTZzGjq3S5LJ0acUnHGkBK2G6F/bdRIB4WwSCb7BMc42fcLdbqdTd+5ZNeFh1H4ZbDlHVN4IuR+oEETHdtqRQ/3lVT7+yGUHU7ugKEE4zi+L6Qst9rBAN2o/j3EZ6oABkRAsoGc1jh+HDEsYoMMAYzUAiIqEAyqJBwJhF74rgUowbPbt6JNfW2Q/N2UYK6D1c2IdvrXYJl1gbbmxsUl2Mc6mTPO7G2CJEzdW0YdH/YfrdpCSMJNGj6lcA1ZLy1TjP/nRRCFCI=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c2ba60a5-e7fd-49b7-cc76-08d40376d98c
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1245;
	2:XdCmkqbdudqiGLUdtGPx3VyQ/hfKJv6TXe8Du7OpU1zA9gFMHpFmwj4wstMeIVez0UHS6L3M13/HIuFfTeyvWrcHTq69aEpEzFkyeJGy+E4AkEdOI50XgfLJzkv3neKwCvifvJ5YoFsz5uqxuo6BalD0b9CXgZg07QaXs0TrxqsMS0eJvSpjBHgRkE8wGPCH/qBzqy4+IWbtmo+O0iJHzw==;
	3:SeP8SQGyeGW/JeXcM45PkxAMwrepteVzTTK3jgB9GJuEDQXT7ZGTMPJE4SJo6yXhtBYNjtOM0StveMgQTHjT9RyUuCARR9lqRfjjRUHvbNEfFbp1JhtYzeU5EgIXDceuSLAhunMe2rgv/OLfRvneA61cVQBL5fhH3Lwc6kOJG3Z/QCYqVhGzZnmfeOUjz/Qx8GN7iceFYzoHq3WqEZz1yAuQmeTsINx0JhTOgP+sFjFq7n15BVNfp1uj4Vjnrc8rY4LsMFMu232XG1GMk2eLEQ9gc3rfZHmNaPX2rBrS4M4=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CY1PR02MB1245; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1245;
	25:bxSCY9MKmzzNMqpFIbsUnVRwl3HkvusnYDErZEkCnnvo122pqs4UZQciE0mcSVwRkToUAC7w60s684lsB9u/wK0Gybku4eeVdGNzJshvAF3K4sxp09//mkeIn6f1CosB8xUn0hgJ/T4+WuKi5lYQg/dI28UzVxe8Glh/9qWSFI5rSKTW2ghjMT/rmOnFhOsQchFZfpZzEj0b00B/b66ApFfPlmgPIQGGFeWPRw7iiKw1GbI13t1l/wytg+g0nX5ubale7/yNuOHunxluJ2mgVon7ok5gTGiqbXr67/SPh/yAorwRpb7yxQi+f2cpWws0sp/CO1oG0EumZpBAhMNQEcsr2F+wBgDxaEbquXNNh+TPMnyj5+iIY1Wc2PIG6mYEg0311CiJeSaHZ0sG6GbX453+laae3rKVejIrlgh4/jciThqzL11EeXWqY4fVfAGf;
	31:0reXbFW41yOLT7jL/ODnlR+aG0Ii1CpCdWGX9CmlgUi4X8rlX3Kf6EC7IK4qWWsexf+gT4f3UwdExy5nqDmbxWR0HKJuIKYldT7dub8+4XkYrMF53GmiynPuo7P+eMWjj0QdHdH1yjhPCDqg+qz4xUnQe3LHGo3d7ySdHSI+8CTBEwWzBI+UKHDdCxlu+rGF44l05QhPfy1+iN0lz76IldxrHB8ZNCEF74LFiD5m4M0PEGMxogZJyqh+s+aqLeoJc5eRVcL7GO8WpYKWVDI8bA==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1245;
	20:fTshsV0hFJa365tt1qvaWYvTnCkAKAAWvTQavQmEBjXSQMPsozAcbaISJBmKemaq1HIEZReILBFoVZpRj0N4q6im9Wj0yQOh01E78ZqmnwJ7nQgrn3kTD1cpgrsGwhO1DCMtM9kfC0dNvFgjdGeU9WyGuxycpVOa1mn7e41guUps/xoZoPiPFsi0Ii40VgUdf+ZyHyEZEDhIzJv7spCI8F3t6FSfdBShUAijeCrokpCae3pNEtAWtkykvgvcAV4vFSwFcSHUrYNQPHReyHk0QVQ4qG+/Riv8FhVSLSaB6YsY9SEZqCSZ2+pekTyVm9Xb0cJp8p7DyiVx+N1esQl/Pz22FJNZJNyeQFnwp8v6VHN2pmpkaWqTAp2eIy323fIc1DD8c2fh0/wMaiZHGM+sl73HJ05fkh/knlLAlzge/Ddtpeuy+WIsI6/4HJ0L+j5EEEetbEHovDoAzDQNg9KKeSHGU0Nuqsc+B7poC6FDxxhAEtiseN3P+PR5zxlisM2+
X-Microsoft-Antispam-PRVS: <CY1PR02MB1245B85A17EDE3414F47AE0ADCA00@CY1PR02MB1245.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(13024025)(13023025)(13018025)(13017025)(13015025)(3002001)(10201501046)(6055026);
	SRVR:CY1PR02MB1245; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1245; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1245;
	4:jwKXuhSHHI/oAvD7svhn28VXV3Ix8aHM0c6bsftTiSvO2r9IDedqYROwGUWtJ97rd8VfQ/JTJxp/OJijuQpMyllbcowH5j/EGOePGpcLoePhGEOPTlzaC0D6RcXDhCPQ/zFJHObutjjDNlh1YxXTYiNYWA05k8WVu+rKGjYQFSsBK+uUOz78Bo5nV++A+rswjy6DWLDLue7xhZs7OU1a00q2Jxcgc+iJ+pU6+BiMUQO2JlqO2Wop0gFoLW0S6zaskchbldvR2ylrvSyceCMy9HgocOZlKDPkzWB0zjm6AF2q9uwbyEGyD/My/XzuxiZoJydTUrxYddPGYke8oJBDR6F7LHYsN9GTBkbIvDCIyyxXuQ/TcrCRW8v3x4C/ZuZjp2lvRTAcWeDn806xuvdZdlC4aWYiZ++/luPoSQvHD3UHB+dNoz30jEMShz79u6zrP4wHcvl8SVBwpUKwNCg9PMAFxVHj69Cp7fcg/RSvdW6TC7nPFzWltiyWacJpyfbDGzwby6xk5wGrmxF4sxDG+wVyafP3YlgtzK9ylOJt2jy5sGdOC6QwiRzr+P1Ns0Pp
X-Forefront-PRVS: 0114FF88F6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1245;
	23:qO8lF+sWEqXhsGChUNoFjy/JfNFn0/ywJ2Qzww9VX?=
	=?us-ascii?Q?5/U3IWu59oRCupmQUCE6SDRvKKJqLC1jvwu2LoBgMFl3RI1+V7/K/hq4rGp6?=
	=?us-ascii?Q?iv3TbDi4n1A+d17iGrZ/qzb4w9XArgZ6gvda7hmmdWqGapLeKNEq1o0BLOjq?=
	=?us-ascii?Q?kp7tz3T54aSvMfeNLei68FZHjwgQly71yovm/MkFWk2BXu0xlbEfpqVwJI0+?=
	=?us-ascii?Q?eyTNWzz7DQdr0IwABviRysYfjiUAPB5D40Dd0h/QYdbP64NlE4SnX/psjrtu?=
	=?us-ascii?Q?aK6wn/zPfEV9eGcCxAZGdYDfI2zvkDDRUzIdsfg33UC45yRqnKq2qUyB5tIy?=
	=?us-ascii?Q?YMKdnBbBne9nu7ffwLWdVgGq86YUC+v//o26D/r/wmIJ9KwtMz9fCh4XPRoQ?=
	=?us-ascii?Q?H/G5iBeKEkt1SkZdA1zjHdFDeDN1Y3DrjZKXRi9EOlZDCrS4tOGrxqytagKG?=
	=?us-ascii?Q?KC+X8uZbQRIeOsTysDm/rK7MaTvNyToTaC8Fbc2T8KNhQq/mIzRy1HzbXzkw?=
	=?us-ascii?Q?4AokjhE+NgRhaAKwZ8G76wP5t2RBSna80Nc9wzjfFnb1z2nfOFsl7GeylC+e?=
	=?us-ascii?Q?vxOrceF7LfWVycPF16hL+fK7WgA5zxJFS1PZaumP0D1MQjAJpMVBmZG4Oq6Y?=
	=?us-ascii?Q?J45yOqZLVkNpfjEPmYRcePWETFXhrLEWPRsPdxLaBkvy05XQwMUkXVscowDO?=
	=?us-ascii?Q?rJQe9AAgugPgLNogMOsKYPstPmaWJQA9MqpO9FXmCp4kbHQ4+TnPUY+c+CaZ?=
	=?us-ascii?Q?/GTTmP5rHfwdm5OrsB1WwbHXiXP4vpCgEUP6aXXzXWcETboyDO30BeEVXvmu?=
	=?us-ascii?Q?AA/CRlLWFvqiBVVFXxwnIUURmh5XfWBcNcaFr4XDqd3pKoHY411KHE5yj98J?=
	=?us-ascii?Q?eeQQ0sDl2WsJneLihfnQ8pMEA26exAeWfcEoH/mir1RlVHhBolGFx3+Z6tDB?=
	=?us-ascii?Q?lbnw58WiwjAmbdlRidnPkuq9VPqZmb37KxkPk6qARyhL1qumomsM7mMcZX1K?=
	=?us-ascii?Q?4KuwHIITtSZSdRcM21NbYnXYkn61ah8BO7mMAeOCoNpfHwdrkiBa7D7ZPCfs?=
	=?us-ascii?Q?kpUqsHA0D3EjAQetgCJjNzyIEZScCqT6WOdQqUbKXkZ6RSltgKx8zV3huQXf?=
	=?us-ascii?Q?Wg+MT6OIGm8n6hlw8A9G88T+r85Bd7M?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1245;
	6:1llwrWGiqCmgKtlpWpGfG4WW8nQyVoD46zQaxulEV3VY7DiZLzyuaAVwCoAHeGTmyK+cTwTWNvOsndK2bkG1krfjuNe+ALz0OuSbaB26LtozUe3fJCUnDrzBaoeIzTMo1po0Be2iAF5Ogqtty2SI2FGsqaSCdQ2A7zn8o/Iv+3mnsMtzkAhQNHuwAkkXIWPWnw7ZhBtLcmg6TVgzbYJvYFgjK1J8nB7Kdb9x026IXJnp3d4Cjx9pjiDiDkHaJGyCf8H/wJw6Ij5uUrnga8NHPqYiqHRgefrksl7YYsvhODN3J2XIjkBwhjrzhDafQypjaRJIsOSxiJs+6ZOJqCi6vr4/V91p/KIG89fQCoygEzw=;
	5:m6Y47wAXrWRt5cuYgdvtTvcrDBR1uGmO3DkFxLvwKqJticPWBcNHav+EWVWXX1+b+CJvt7x9MqQoseieSyjSP9K/MixKSoMHJ/TgrFY9vDFyHul6PHTiDa47IQmCw6z9i7UEdmX7R1V31h5mpRPofg==;
	24:Pvxhep0U++qi/50QJpWBkuW2MOY/djUfpgzcN3qOxzjGMS7rj6ygJFw9NDCqqyGAy8jDw81+Gt/JrKQ6aqVlF2pz02AKLSMETI+YdjB71Ck=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1245;
	7:5UzS5+V39nQX28QoQ4f0P4N/TpnGVzEDqvmA+a2n2dXBJrZDeoWnfZl1ew1fGCx/jSLkTNAg5wgJj2XLIbyBdzurI5UUnyNyPIHMbNm9OWEr8hx95l+tdRsMXxN/Fg/iTJ6Ecp66Y/zjwRP+jp6YaDjYTO9sBttoFQ7y4qNVNIhApnIm5ZyGowiwnw6ctq5KdrWGI4R0kuf02ZpRyg2INPK27iiv1WEI0o6ZcTY3RwGvesZKr7W4hK08rsNP0I1mznYi2cK5qqbkCE2KrapPN60pz2FfmA13r5Yvk6cAEf6JcnKJormlRQgTeXdDB5Ptw+gEqgtq7rNSM8qNUTLoaaSrCUXeMTVu3325ouZ8oOQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2016 23:20:35.4177 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1245
Subject: [PATCH 1/2] runqemu: Split out the base name of QB_DEFAULT_KERNEL
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
X-List-Received-Date: Thu, 03 Nov 2016 01:52:20 -0000
Content-Type: text/plain

The function write_qemuboot_conf() in qemuboot.bbclass always inserts
the full path into QB_DEFAULT_KERNEL. Remove this path before using the
variable.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dbe17ab..922ebaf 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -478,9 +478,12 @@ class BaseConfig(object):
         if self.fstype in self.vmtypes:
             return
 
+        # QB_DEFAULT_KERNEL is always a full file path
+        kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
+
         deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
         if not self.kernel:
-            kernel_match_name = "%s/%s" % (deploy_dir_image, self.get('QB_DEFAULT_KERNEL'))
+            kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
             kernel_match_link = "%s/%s" % (deploy_dir_image, self.get('KERNEL_IMAGETYPE'))
             kernel_startswith = "%s/%s*" % (deploy_dir_image, self.get('KERNEL_IMAGETYPE'))
             cmds = (kernel_match_name, kernel_match_link, kernel_startswith)
-- 
2.7.4


