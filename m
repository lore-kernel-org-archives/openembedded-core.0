Return-Path: <prvs=6763bdb70=Alistair.Francis@wdc.com>
X-Greylist: delayed 390 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 May 2018 16:03:29 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 2682B74812
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1527264933; x=1558800933;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=ULLGmjapx9lI/1/oct1udPVnF6mComgkikyHMvD3ym4=;
	b=NNjrXYRYRlceTHFdGpnncWGCjVChdBP3q07CeToN+p2ISJIV+fJqOwPv
	VZ4jGC4mGZXFFayZpLBVrd0H2cXzpdLUj0KZPGR719vTDbwtrHYa/nE8w
	uB5MdmwoisY00DDKzMJ7erTt/z32Yh4ptJGbEw0Gl3iwwd6UXsRU3Rfca
	liI+1BprKY3avjRdWRz2Eoo1rkEzRtyzdCTw3tGuVXPuhTZpUn1fBrDpW
	V9T4mPR9hjTp4WzhZUoi6lrJEHIpuWu8EWMKe3G/fh/yatJra7+oMd8gK
	u2ZJyD2eahyaNlBinbWjFdnEou/8hzq5PIRJH3dT3T6qs3/8OT2yRiqMq A==;
X-IronPort-AV: E=Sophos;i="5.49,440,1520870400"; d="scan'208";a="175766628"
Received: from mail-bn3nam01lp0177.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([216.32.180.177])
	by ob1.hgst.iphmx.com with ESMTP; 26 May 2018 00:05:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PzFLvRbC5SXjUTXw6txZx1VBiAjfzyNkkfLHR8wrfO8=;
	b=aQoROgxmS6l0uXJ4dGW1T7zf0HYEtaXvk4qZnXmtdWYMOVB6I0h7Sqq7L8boqM4oaUCN1oV6RmMEhZ4/4FZWlCmrA9IlvLuoztsexbM9vvSTAxBOCN8krTbAR3w34SUHDsK9dHd1GFL52ndv5pij1uyq5rPL8+mKUuvFZQmi4Us=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.250) by
	BN6PR04MB0388.namprd04.prod.outlook.com (2603:10b6:404:91::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.797.11; Fri, 25 May 2018 15:56:56 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 08:56:36 -0700
Message-Id: <20180525155636.116866-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [199.255.44.250]
X-ClientProxiedBy: AM6PR0402CA0021.eurprd04.prod.outlook.com
	(2603:10a6:209::34) To BN6PR04MB0388.namprd04.prod.outlook.com
	(2603:10b6:404:91::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0388; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0388;
	3:BuZkcmPCn2l2nj4+e6QAFKmZlY5VrL7S+yJh0Q9+pWv1X/ZX9LFjSTLqYr8Qi0BYzC1h2gRtQiDVf2cJse8DfHGdZGxEbRNJqKXoES3e9JYeIJAzrwsTX6eDnfbMQjE+h5A/7ECWAFr7WXRRz4rakxSivLBp7fVmnnM1Zkkg2nLYZGmmcB98xLzx9KrGU60oMLFdduZRG/lJNRJlt2yzS+hHvcuzCkoZ+xJevmftna1A0f3ElA5ytxaiYawWAC2P;
	25:usf1c13NYueBPnGVvZEjsgECGcvQb1ERB95m0wqzYPID6wcBxw9H5S/6RuVi1mbagChNYlZOG89/xMRFTUuWTsG9sJmZkgf8I8lvlVLJzU/LKsfJANlHRh9irOVlHUxBHTs/tVwSLl0tbsLz329Pye5Go+Dv02/LV7YHAUVJ5PRbhKmpM+z0+a5UJ46zYDqUzZgn0AdP1MFSjysH2zsUO//p62IvrisqC2LYbnwfwtcqoG6wDi39lBzMvhHFMZJFxaX0rVZlSOP8mB5+44FfACkrDWzeVs48pNAOC+YSZ5FOmekwCi3Lq278FjIKe5Flezr9DRuap9gS3xOG3sryeA==;
	31:fzHjHw18ezh3kOYi7EliZDIC4squO645G/b7WHGapbQSJlQ2cLmhT8e4DkT6FLuBjPn2BTuQ29/IHBBLCXpNrDAYlaQGIanydrgXzsCB6tGf7DWfhJfInBGKxeZFPmwcNUXEb4ILCGfGb9KNdt4bKsRCEUw2CuDWsk+zQTIiboPd98LO4RUSF7JvYbLsv/WHzSddW5YAQoNxiM5XdWoyPODaNhNOQhmMi3JQRVHVsb4=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0388:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0388;
	20:zN+OsHci32xvn28s7Iyz8N+E3C45BaxJlr58m0EUEq7jyglzsC5YPcjXdbYUMpYmUd20eortdha2piR8qWVMtHlJ5pa9+FEBTCppqEdx9VnxOX7bKYvBMhUZ7bd7AD4waWqqJxvk/ME21fUBbXx64gN+ewzMVjRye8vKE9Y05gR85g8I4Tkqu45RHB8c3GDs0nB/blAeK3dfsm8hLBpKlFHJrTE9hepIkMQ3HAICVCP3FaXZPsVmCXA71QULL1Le+xisK/zhbkPCnosOtvV88BE9pEnS7bgXcN4TGw3wrZBCfvwM2700EVp4CThKsmzNryGp8NWGgeGr1UNlzV4Zw333h72YDtyxs6LzZQ5D2RWzgZRSKjInSzdabOkVNmBEFn95gTyfWqfI8+/s29OxV8QwbjTbkAGsVnOlzUvhK0jpDNH2YH8yN9zk1oj7LzHpvkyzK1OaHhmdJ+ENDtrEXNxF9r/io4Pwq1WREPkN2ljSqWVEFvicSQ/ZM3UIHP3d;
	4:xOEafOB3pbTt182kL7V63FFfIKWHKJtdCZtMBvL8pfeZFqu7+kplyBTu+IkcYDwo3bl1Y1yHGSSJVeNnq5dUSC/rw8cw879GngpdRSwrLxhYZGMYI56w73fO4cnOMWdXDqlzqgpTyqYKhHp0nMTKwdkMdjhQHTgoMyD0ph1mnXyeTBLsMjrikWnkFaqV2K8XccsJKgeeR7SAJ7hX24kyYjLoJCWOenHjWq0Txh/Db5Se7xlTabXTZQSZEdRm2ZCgwKLn8QGNSxZ4jcdqh+22cA==
X-Microsoft-Antispam-PRVS: <BN6PR04MB0388D2D58ECA6C83A40C32B690690@BN6PR04MB0388.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(93006095)(93001095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:BN6PR04MB0388; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0388; 
X-Forefront-PRVS: 06833C6A67
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(366004)(376002)(346002)(396003)(39380400002)(199004)(189003)(4326008)(486006)(476003)(26005)(86362001)(6512007)(16526019)(186003)(39060400002)(2616005)(956004)(6506007)(386003)(97736004)(81166006)(81156014)(1857600001)(305945005)(53936002)(44832011)(8936002)(50226002)(7736002)(8676002)(478600001)(316002)(25786009)(47776003)(6116002)(3846002)(16586007)(68736007)(72206003)(2351001)(2361001)(52116002)(51416003)(105586002)(2906002)(6486002)(106356001)(5660300001)(1076002)(6916009)(66066001)(36756003)(6666003)(48376002)(50466002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0388;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0388;
	23:M/W/RcR4gpXrxKoRC0jouJg+Cg+Is+A37sO6RUas2?=
	=?us-ascii?Q?xqRz3AZZljpGaV3x0ugvCArUcEDFCqilMUb2f0oMvxFJWMmUG55NULuoYDvQ?=
	=?us-ascii?Q?bsAr4NskRxUEjfRZYDI/6LXhVUL9me52ySB9VMJhcLlu+NMv49cYvfENnd3w?=
	=?us-ascii?Q?9S1TKFM5wRQ5Gxq21Q8Ib2v3qhcT80JClN1cDIYF6MqBfwo1KajP38CM2Nes?=
	=?us-ascii?Q?x/RadicIcEMpBUv9Gp+MQYizu8jIxVV98rWRWX/8XJkVNgLEI39tKvgRX8ph?=
	=?us-ascii?Q?mQgBJdDXe/757vOINOOrbp3n2oPiximlL3sx8emfPV9FD+IJuQA14I9SuJOW?=
	=?us-ascii?Q?AGcLpqgG4rKA0F8Hzx5UqOh5erOqhbfvdi2xqPNbaDcm5GT/UG5islRrG3ux?=
	=?us-ascii?Q?Qnaxb3KERgVaRzOlng6vSbyRrb7XPLcGEgguxw0+wQCoG/1gyW9NouOgbLEb?=
	=?us-ascii?Q?Sli88vWBFf313ROLbf6l1xir34n1HN7wXjFnWnd78Ifhw9c+6fyOYhQZ/rMT?=
	=?us-ascii?Q?8I7a36xVYd7p419vFALKX0BDff/ianD/+40+dMoTn7ZBzb7TMyP0l7Y1MSHs?=
	=?us-ascii?Q?mINC1qu1nDYxSbjzkyhCAJ/e2SCHBgbww7QFlTSYBGxu9Umun072LC6N90eX?=
	=?us-ascii?Q?EDg+V5JuSJHsYjszxXrHvSp/Cvmo/STwRsVfkAjQj0sHxv+ZoEy2Ihr0AS2s?=
	=?us-ascii?Q?/irfEaw+c3t8Lnfa62jxJsV15x65XH4Sb8DDV/yzAL8KNje0RmGG607grPl0?=
	=?us-ascii?Q?P3ppd7KlNPd5l2Cri0nIvoIw5nxA1IYC/oXQExR0LcY/ptk7Vnxgl8M5uqL9?=
	=?us-ascii?Q?92xODwSLwq4bFT26/xI0J7CxIY9f3JdMiUVgbbOCSzblFQDYi5eExFguaY4L?=
	=?us-ascii?Q?4L1B+m6cVYlQm9mne7UAlM1r/0lsoLCXfYhm1obP3aliquao1IJu7qSmGD6z?=
	=?us-ascii?Q?qVQ0vftRuY6uDtrbKav+wmjPJt9JrtrnytXqn/GzwNhJw5gi8up62xgzYhvt?=
	=?us-ascii?Q?Ue+PtjSlttFg1mutM0zpjSF2CT0C/d8OcLxWTU4k1aYdB961m3rjRPbx7du2?=
	=?us-ascii?Q?teZUCiJxSmYZfVGzPPnHiBzaoQewZarhMtIJPVL1BgSFnH8A5owRgvQN5aAM?=
	=?us-ascii?Q?BPkaFaaaxN8GH9XPRpxaIUWwq/ZZOavdBRmDX9vFQfJ7L4kHpoIdF600g8Cz?=
	=?us-ascii?Q?k9ITZNpuG04M8seR0eAiYIFC8Zz7vMG1T1quQuDCM7ng7aEVpw0lMtLFpnzk?=
	=?us-ascii?Q?66OAcP1BuMNSS8Vj3UwoSyOvy31qZVUkGRhdD8A?=
X-Microsoft-Antispam-Message-Info: eGAJZkrZ69YAcOYgwdfxEwWU/PAwgqQWwUqW26+gW0sLMYtfLlqUTpbV6WocnBw3ebTXW8fn/kHqhSb4ytf1CTFpXdL7YS6C3KWli53B4DzEdXGLiIJE0MoTDsSgTlPxwLtnxJaqzvMxsddxVq+I8nLfcP2N5C8LqvP0GNQjt2+o5SS3T5rCjZK2KKQ4nBOj
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0388;
	6:Q8Uy5hgSjW6uk1r8U2GFqIP5zIU06WbnErvrbXs2zXVbCz01jLvJWqeLjpPI3ZqHMSfkWoXnydhYMnbX5mw7Q3xvBSaV1GRn0coMOVQaTltadCk21jQWhbCQ25aVxek1fqp2RCuEuAJO29KShd0ohD3D2wZ5S3DchO+5nwPl0PSbVFDsXj4AK9H3ZlLk/OeHb1UaTetrJAmRE8UmrrBXgnteiJ9HYIeBj7/MqUih64rMp0fj4I8GQoGkknj4U0eTIcbXl9aGT7D54C4K3INvrHIYMf59dH/TSkWZH3zfK5BVY4r7LnBegif+dU7SAglVDUlU6kU3ddCRMVKFgRileDrjN6cB1x8wj8KhKK3JfQ5yPrUL+tyS1VoX101cMhGKop3bXvy8o0XGPOMxvsYYjd9cw/mdJQIPLnnjids+YqT6joUAAyWVP8PdT6d8Jqo5FQvLT2x7jJVV0HyKPlSpBA==;
	5:Nlbfg5MqvzFGUoR92oEo7fNHy5hv00dFQ0oBwe+0HTnCr9BHFpQzOtSOb6BTxre88Xx5Uf5U0c5NaIxQvoMR3Pcpoh24wCKMx6aLEeYKa0W70+z2pSP2BPIhyFFE5EUgf/isJ6aJOlz6xrFkKcgNHllAa9YfLVC82jWrRHy/JHc=;
	24:3ym23NEQbw43FcIyLW0BHj4j60nXee+tospnA/yGgPm8rXaEhXSSfyHhMPmn2wuOBMH9ciHHaPmiIzIx1uZcH5pDyr9vJKp7R8jozYjtEhE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0388;
	7:RbYV1Jb1UXoM/msiRUz8Wg5ZxgFkVqWEgVjQhQ4rRbJf3+JCgxXWxSLu2H1JFj+oSUq2jk58w/AheU1hE23ctKr2PE7rQLUhNBunKSZkGuv/8uOmedpBu3/5+W/MCIwQAF3rGCi8dA9rpqBF+LnPiI8opl2F4f0o+1f0RBNQUUnEAVuwSSRoN/OOYsRtGj07HcOQgxScvbfxbdBQeu6Hw1et8CbGs0kSBNd651o+3moWjNh7weMQH47QFBS0Kx9i;
	20:Mjgo0UkvJUs0BvCnUiivAkuRnqIbSbxKCu9tIGtuL3SCtji64nEGNVrMzV1AD41Xr0gfaNIjkeUY9W2dBbqoornY1wR1lwr5GoX3aXv/w6XrY+G4I3T6dRI6vv5aE+8NBZUm/dIq+uq7JXEtSqxB6tcGY4B0Va8W/EoBvlV/9dk=
X-MS-Office365-Filtering-Correlation-Id: 767dcfe9-ee14-4e2f-5aa1-08d5c258256e
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2018 15:56:56.4316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 767dcfe9-ee14-4e2f-5aa1-08d5c258256e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0388
Subject: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Fri, 25 May 2018 16:03:29 -0000
Content-Type: text/plain

If the user has set numa in their MACHINE_FEATURES we should enable
NUMA support in the kernel config.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 3bb872a32a..a8ac237656 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -28,6 +28,8 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 
 KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
 
+KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.17.0


