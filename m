Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 958 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Jun 2018 09:41:26 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0084.outbound.protection.outlook.com [104.47.1.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8800D787CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DQyVgBBnwQby55U6eh0iAH8Q6/0W9Deq7YRUxM1gzIE=;
	b=t2SyU6RUqpBkyVDzpuSDNEF0iK3Q6RUn+yUROC43YnYr2ETSQYvOo06QadHNKqY6AXtsoP9hlLDydUVMI0eRfaaAnXoDRng5FtPB+ixyAntrTUzkq7rKR0m8KPp0tFgPD+6Tek+J0MkfBd4725Oz0Cai+6iufUAh8jhH0xTBAMo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
Received: from sun.ap.freescale.net (119.31.174.73) by
	AM0PR04MB5059.eurprd04.prod.outlook.com (2603:10a6:208:c9::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.14; Thu, 14 Jun 2018 09:25:27 +0000
From: chunrong.guo@nxp.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 17:25:01 +0800
Message-Id: <1528968301-3209-1-git-send-email-chunrong.guo@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: HK0PR03CA0095.apcprd03.prod.outlook.com
	(2603:1096:203:72::35) To AM0PR04MB5059.eurprd04.prod.outlook.com
	(2603:10a6:208:c9::24)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 119fccc3-9895-42db-b1da-08d5d1d8c4d0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR04MB5059; 
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5059;
	3:ycOs0rhdW5HsqauZmz2eaf6id5NsgQmVh+Ngu5mVZc4B+LkYkvf5m3Lov0OVzo62wVJGu9S2iVZxmWnFDeuswqh81v+mty7KJK3KLV5cXiM9ZmpqN08Hf/jElma8psPQBCqwZGM1Y5zbG3Gw3vIe1hVeKBLTcjQcZQQdyChcNpj/s4+MfCAxKkJNGYNK2n8yASP4YbQRzodiJB1Y9rtS4S0ZrzRO9woRsHIxDXAWXUbLoMCATuWfF73qPXsbksFp;
	25:NUUslqxJyCyZRuxYKdyaDGcVHwtNhMywHPgMRtwYmOWjzCe2LES62jGxucPrePFkbR412BK00rMXKr+MJdnY0CJoUTPkqbKGO4B6UKVpvmOaZuZTSQG1ur8TKcXre/1a8n6TsmPeLZfpCa809LnCbAXrwZQ2D1uqcH99WthkE2KjSZBHFUK/AqAfg4/7ceVPb0dzD1Rr4/nwV03nR4+k7r6MJTlU2HQiEYqsTtyZpadhrrykk/9svEyLUhTn9ojZ9g6sZfmb/lPkwu3vjrCrzmf+T2H4t2irsTiN2SDsEIxUA66laFYHXUZ09QLcW0eJJf5nLQ+ERklW6NJfgjEEuA==;
	31:ClnsJGAkEdmoSWzT8rEO85BrhCifqnKJnV6UAFPf7TCNnGdlI9s1qC2lGBxFpcEfQMsx34H8DpZdTeO0VjCM972AL4MLN0Sv0lwQBufOdWThQGMftvMvCdTBP6XRvMkZVLiAfc4e35amhkAdhCERe4u0/km5z/fB3biUIIvTH409EUBSNN8BNWZvVmAOA2aIezu1SbZBq4tZJPyjV2iBK4+57AHcivaT3fqNYMnSNjg=
X-MS-TrafficTypeDiagnostic: AM0PR04MB5059:
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5059;
	20:q3mBTWn8JPzfIKFOL4FcOSs2Wm/XaNKUV1jVnjpyLDlbFgbJW7gvBLCSbe5fbCwRFaZYpRz8lVMTUgWtVfAUv5EXAi6+63IhIRofzjaFUawZDDpPrHEiV3pnwo/LbN5z/xV+MgpllEyaehgcO5pcBaVU3CXUpAABxRuebhgevoeCZU75Q+NHOsySjsXxKp4XklI8cDG9eIVGmg9QVa6cRtze+GWRMJIv+AnBiiB+q66pXhs8d/9r7YKkhplqM+d7d37pvuDlC53CSqOY4GdJfP9gX/eLN82sgBE3Z2UgxK6BNaxJEtugiz/7LxokcRee8tCMLzgF31uEK8ytkFOn/hJvRPr17KfTFh8VoIQfXnPPL9Tp2yrK/qs9upfq47Pytf1q95U5YF5GCRYSo5bQboACKeqWYgGqa8a7HKyx+MvrtwddFVx39kgjtWN7UEBnpia0GKIWD5Vz3SHij+GACAlUAmFai2RWDTfBGOYAYBzqJEOnIYYLUePr2L8aLXK8;
	4:TcZHlYuIqlLHAoDdxQwSCiK5j9NE6eOjTeG2U/UBBFYe5mwPFkNIOEIJGAutGejHzAB0Al4TFvwcjhyigdUc1Q7VxE3gHaemb0oKLUSK8E+NO7zW2QvVYrXt7TXEPUMZXwFUXnwbj0gvEyAvzKlDnVuyTxjM8c+FoewVJ6HOEYXCaEtKM1fVVRkDRg15lCZ7SvJbnUvDpI/RPU4Zj/w2vV3G/aN8VzE2XU0JKQnreCnLiXcq1fVi77QMcvAp0ZVKm7eaFR+OQpoVKUudF8OiT2IjIp7kk1NeI+F7Ylq8vbxKHLqSbQ4DRpqW01itDJ5L
X-Microsoft-Antispam-PRVS: <AM0PR04MB5059CD769352EBFA3C38161E847D0@AM0PR04MB5059.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231254)(944501410)(52105095)(93006095)(93001095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:AM0PR04MB5059; BCL:0; PCL:0; RULEID:; SRVR:AM0PR04MB5059; 
X-Forefront-PRVS: 0703B549E4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(979002)(39380400002)(346002)(39860400002)(376002)(396003)(366004)(199004)(189003)(52116002)(36756003)(51416003)(478600001)(6486002)(956004)(2351001)(16586007)(2361001)(6116002)(316002)(486006)(476003)(3846002)(66066001)(2616005)(47776003)(9686003)(6512007)(1857600001)(6666003)(2906002)(97736004)(85782001)(53936002)(5660300001)(6506007)(386003)(26005)(68736007)(7736002)(186003)(33896004)(106356001)(86362001)(8936002)(81156014)(81166006)(105586002)(305945005)(50226002)(4326008)(8676002)(16526019)(6916009)(48376002)(50466002)(25786009)(85772001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5059;
	H:sun.ap.freescale.net; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM0PR04MB5059;
	23:spjvAId/LSVnTNZv3Dz0z1NHtTJlwvSkElbSzcCKS?=
	=?us-ascii?Q?JO1disWuos4rxcRoDJqB7MgiP7bLQolbDmIJvhu1tkqezAoeHziNVWmC+cFl?=
	=?us-ascii?Q?iePrlBSkpIq1604nAWNW8yAI93/zDZj++mVJecdjKQQTxXmQry5p8bMVoVjn?=
	=?us-ascii?Q?GzQMja8KSc/9kv8Hx8jL6znzqEvftUmUwUCLD44EC0oCFrsklQ6LQ1vZtHSZ?=
	=?us-ascii?Q?f+22+hPr/ezp62hdIqw0xlZzuw4HvkRhPYDFk4omyvi2oV0eMJ7VSOPbx0gF?=
	=?us-ascii?Q?OsKebXvApcycFQiUI0E+t+WcHiMmljpalv/mgL51FODE3jBBhsLeK+EP5KPo?=
	=?us-ascii?Q?Q4YNn2/wRtaU6cM+IwAL65jRLrMwg8vo1dIUAHM20mN6iJJzUDkojZga3lZ+?=
	=?us-ascii?Q?jtipXKvBCQ3At4uICKzJz7+7Z6XnYCLc8Hv1HKnOojvK/jK3GtI+FClGHdMr?=
	=?us-ascii?Q?VO4r7gaqe9tYq8NpM4X6cm3uPcXuWmNKa7h1io/UAvw5jQh3ccq2fnxcvnaQ?=
	=?us-ascii?Q?jIvDgWcgzqxlUggEwYJBqC4DxYPAH6altCDlBVKuOAZSGpmrPB7daVeifhkf?=
	=?us-ascii?Q?cF2TBZmz9n/hhVT+7Lwz0N3Y1ORaeNmfsLue2Fc3ZGpo0kNJthA1IuBG4Pab?=
	=?us-ascii?Q?ln78U9IHqXQMSbFKB48x50u/ZXWIFaLo4UFMQXL9BX98Uc/cD9y7znKkNYy9?=
	=?us-ascii?Q?jyOGEFXottQmt8rrqFn/otKZybi8zNiXNFc6S7bITAvv6xtmNcyfNPfsr7nn?=
	=?us-ascii?Q?wgec+ulrZk8w/wSv7J3rN9rrcOx6d5aOh3vQOBXEKihHMNvgdXiMIe2gC1pv?=
	=?us-ascii?Q?7JaUzXuksukYxZH5e+EOpAXJacx7Im2xuTBq4jkmxhMBUjfy5IY9tviVzc3W?=
	=?us-ascii?Q?CTNKZl47yhEZF2zIYPshNaXtiY+ip0BwhilLnYmGpM5/24wd61ITSQzVT7zd?=
	=?us-ascii?Q?mU9Eo0x0eRGEw3NrkZgd9S9XDRnCCKkE+EadoyY3+fUR9r8c7zeW5ETj4M2a?=
	=?us-ascii?Q?DweePzQ7+n3wGsazqljZd4VitAz+r2zjxmd+cBIOU/QxnN7HvcI9Wei94T+f?=
	=?us-ascii?Q?XnJQp9VVzD/ZBfQ0d9jJRZrUlJsu1zP3L+juQBKHZ8IxO/TjO16he51j8mvf?=
	=?us-ascii?Q?z5Y19WvJtaDEUq+dmGgcJ2SUvdPBhjIl8lI/rpJyBcWL4WYtuSzO5ySiicor?=
	=?us-ascii?Q?dZRn2OgHlMljyDnT4ZgB1f5vBB405kM9S4hk/nDZyDtztJfLUVSmy/B4ykMQ?=
	=?us-ascii?Q?G4k36+T4zeMeKiEU+FHpEcBtMVCQYbJy+oE5xjl/cHWXSJC49NT7I9CHNtnr?=
	=?us-ascii?Q?Nx/DzfoIGJLnTsdsOFADiV0yk4v2EXw6AD5W1FLQx9q/n85b8Dh/q/diSdqq?=
	=?us-ascii?Q?jzPhQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: +qH6hxlWG3o+Pa/0eDb9HUy6s8WflpINSerP2c3z9F1dujIo+G6Op8kD78ljv1tXdXjAjPQaxqiLLGYPppNle4KaTbRh+ufyD35fkIw1Ej8M/OryxUZkOgIPQgUr8Kzj0gOoi60Sasdgi7PRDnXKHwiieYVxvmNIF5js9kxVoDkVVar+0sZ3Tkcb2JWCFCam
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5059;
	6:2EXs2Eym7iu3QAzxCiUTQMZKB97PJrIGeFI/aj5UmYMY0+am/LXIXLIF0kDVY5Yh6jFODQ6UhST89z80u/Qbk1seXGdQQvdII7X1BLfwl2wb0bq81YKTJv9zPzWEWZNbdHKEGwgWTgwzr2rNxQetCdSOeLPkLtu1Luv2CyHAXkWWkx5idqQoVbAjVatRyMC8pP48/2QwmpazIIFZtcEim1KU1/56zwuPkP4Z7O2X0TktjnYj3pxW91KlbfGdBwSRsSIzOuy90KQ+TqyYGHP/3pnQ0rIBttUcHWREzB+QNJsHN9DFu/MudCPi+cnelgo4teRYwjtCbeWAshxA7rffMPeCEBvTTFeH5myRfsor0by8RU8zKZOXshtf6tPcvTI+TEtPb0+LtdLiA9fnkvGhyfUad4Ueq134Z/6+w+jfUyU161qDnJC9/d8EBeWO/B8iEDdOzyN73/v2V+u3uT0DCQ==;
	5:BpBniL1nlBDDnCy0BdAT4xhJFbkPLE9Hn3qutGBlJaFgjglFcvlncqjgllGKSYXiGM8mkGUaYWC5zQ7PSYyYyMbEgG1sTlwejdlzk+nflRY74AGqhryUGL2kNGmzJKS/Gf0CZRkyvHJZ1PosG6qNDJz5TE+dSpsbR87Tj4z4/O8=;
	24:NU/oAXJVHiYzjrel3UppH6k+jn2tPnXp5ntYy1tDsKXUhsAdwsD7qb9WpHNXAsLDm4ig11dScAtJC5IiMWRENpPG3j1sOaFwWPPYBfyKQuo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5059;
	7:YlZkVpsZZlfdOBeuCowfgf621ahMpqhNjtAlyZu7NTBdZ8wykIyzdrRKEEP6APKaL6mlgbe50n4DQWya7WOnUzd/k5PKXNFRe+pxlE5qoyvwV0TPX41p2krw9smbhmsHNRMxkiPC2c6kzUd8o2ZAgYUDOJLwZw2UhRYWA/AJF0NeCfJf3oXAUMMOo1HKBDH2XQhkOp4ilFA3556Lf1wF6WmQX1yJFepUQ6Fp52yqba2JZe02Tb3Ns/9k9F1ukJ1U
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2018 09:25:27.6697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 119fccc3-9895-42db-b1da-08d5d1d8c4d0
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5059
Subject: [PATCH] tune-ppce500v1: Add a tune file for PowerPC e500v1 cores
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
X-List-Received-Date: Thu, 14 Jun 2018 09:41:27 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/conf/machine/include/tune-ppce500v1.inc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-ppce500v1.inc

diff --git a/meta/conf/machine/include/tune-ppce500v1.inc b/meta/conf/machine/include/tune-ppce500v1.inc
new file mode 100644
index 0000000..509c81b
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce500v1.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "ppce500v1"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
+TUNEVALID[ppce500v1] = "Enable ppce500v1 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce500v1', ' -mcpu=8540', '', d)}"
+
+TUNEVALID[spe] = "Enable SPE ABI extensions"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v1', 'spe' ], ' -mabi=spe -mspe -mfloat-gprs=double', '', d)}"
+TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v1' , 'spe' ], 'ppc-efd', '', d)}"
+
+# spe is defined potentially in two places, so we want to be sure it will
+# only write spe once to the ABIEXTENSIONS field.
+SPEABIEXTENSION = "${@bb.utils.filter('TUNE_FEATURES', 'spe', d)}"
+ABIEXTENSION .= "${SPEABIEXTENSION}"
+
+AVAILTUNES += "ppce500v1"
+TUNE_FEATURES_tune-ppce500v1 = "m32 spe ppce500v1"
+TUNE_PKGARCH_tune-ppce500v1 = "ppce500v1"
+PACKAGE_EXTRA_ARCHS_tune-ppce500v1 = "ppce500v1"
-- 
2.7.4


