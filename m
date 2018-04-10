Return-Path: <prvs=631cadb47=Alistair.Francis@wdc.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Apr 2018 17:19:38 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id CDCCD600EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1523380780; x=1554916780;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=dD13fwQx7+CIVn2zbKhielv5SRZT2hj8lMdDs1pqMRg=;
	b=C69P6RwZBi0cyQ+Ho512h5MQ8T2+bg7O0lisHwvBfiZ554L5Yvr69+i7
	g8Y0BYyLs+Q+oXeIGpjVqbPHN47HvylOsl30/2X0FC6LFK28vBARr21Zp
	Tu126jXEaof3M5lMYMxKIvqb+pr6g67C7BWrZFvOXvODCHrHhSpBM1lqq
	5F1SYrP6A127800IpcD9Dsi0eYxkkDxwv71W4DiJ74hjCyA95xR5uJdYV
	S2t+o1FGXXBCJ+YoHkih9lnPowTDxhDr6gGJIzc3UFSEl6zGp5YXq3ru1
	+boGHk6xldRXs9ILNso7/994l6dQMZeLsTRMa5sCIWoML1iRiLbPGpncB Q==;
X-IronPort-AV: E=Sophos;i="5.48,433,1517846400"; d="scan'208";a="178695420"
Received: from mail-sn1nam01lp0115.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([207.46.163.115])
	by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2018 01:10:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tGBQ5n9XOXleVyRPhYnchQAbQb8jUYM6ri75g1DZ23Y=;
	b=NXWYd6/itMVJhrH8StdWyhpII6i82c2b4KreeQ+cSBTANlfs0Lw7dhbxtckANRZaBj64hh0fuPNGc6yaEUfYysh11YTCV1Uv/0akIi/hWiHQgFdcCV8R13MOykMweutf1JDPqWzwRmoY4QkCk7GFaa9gxqRP4gZevWwMbpYpNtM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from localhost.localdomain (199.255.44.172) by
	MWHPR04MB0414.namprd04.prod.outlook.com (2603:10b6:300:70::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.653.12;
	Tue, 10 Apr 2018 17:10:03 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 17:09:57 +0000
Message-Id: <1523380197-2763-1-git-send-email-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [199.255.44.172]
X-ClientProxiedBy: BYAPR03CA0030.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::43) To MWHPR04MB0414.namprd04.prod.outlook.com
	(2603:10b6:300:70::19)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0414; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0414;
	3:tZp5o2GN/kjgbmUNBcMxqbJ+XQaAqfPAugwGG6iY3zu2/U7DLs1XG5D04mTpkmfD/4t+hvTOcrdmG2rIRp0uysAJfidOWmXWwz4siHLuFWDJ1VhlBiXH8C8xGnAPD5OJwsb/KVPjMZrHL4LoHW7al7X+5Ky1b4q5VsYNBeuDuTW4QNEVw5nSKfnQXMS2CBbaihpi8z4A2wjzLfrBITyOANXpujf1ewz8wSvdxG6EKqBZvI2n+0xFwLS8Gealj8JN;
	25:P3PTPD60JSr4yjVIR9KDSRaZPF0yZlnbWc0e6HtFyr1xaMBtxUtc8w8ZStSpzJUJ/iSL4c7YXnryuoqsSPQ1Wi9mskJLq1yrxvLSpbVPuZbX0wgrQmOvOTZ38jpBZgP0zkpDLO8OawhYa1oIO/aAXaN9318MuJfCg8a3tg9NiKu/wW/W0rAMXemAC1At5lmK98Zcmix3ZmCc0e4QHqFpQvzqYB+ZpB+hUrYiWQ2PPgv3a8zaXn7GnnZXk+GmtkXvAxbhmnr02S5o0wM7On4erzBeCipCI3i/gGFaqpkiJ2yiasqQNnJX/YSRzYp3kVirx+8OhKJcjWf5jAaZCHDsJw==;
	31:hy6kfAlSQnQW7+vPL3BZ876zueb1DBOGLevo6BEhdtrvZbs5COXa/jJORIgHmPsGiwNkGGcOHo2fH6uC5Sp07VHx4ma8GaLfuEmilAsCjJc/Ggf7CyXCo/BrOjp2N2GzNCAoO1Jc2oMyqd3lJpfDJZQpcxHqzeLBhsXNPSchrbSysvf7X+vwfoSOyGVVZaZ1ZPtcoujdGfNz+QIDvbsDxpFk/uIME0XrJvTzV1d9S3g=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0414:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0414;
	20:Nd4CEz5CdxU0Y6OZTcD/FaMNc/1eA7iTA96+0xJ4sxG2PEwXkWdDtv1Xo5Sw0A6D0rMA/j2Jh4YdQaYyLi1mjqGI2FqA2zN4iFJ0+7lzHraUgjWGpagbEamr4Jj4ovQjwEX4P1bzj6nW3+JtF/6a+3HFVV7Kgi/QN/Zp9vuS5g3p6dQIBXRkR19xcA7luxL/03Zn2Pw97CeK0RQxwSawKH+cpBlV+1X/zPE7FLxP+CYKuMeHRSI9DM+gCWNTPoKq31paPX1uv6aJx+6DMIiaOpFOn5NEIJNrgjYaQURy95hyiDaA8+zGM7hEFR84ZHiDraTndTeDqO8xtbm84KejeoIlEaKzeIvc5pOmHcFSlmsg9fjs2VGPljhqTlWH8XNUdz2OimnZvdu0neAk7O3xN8pknpxyW5H0eioXLh18qJJE69UbEE8uyOCN5JsTC5z2S9eLXvbnWEUyttPZj+YtSUFBc3VNhE3Dg3IzNVffHuoYh3bW7GYuuuvNQRiPdV+s;
	4:vCB5yOKf2uGyW5IPgJdBAUdz5NYITOmxPTq+U7097QDD8T4JnrNcPMeLBoHlpPkuLzt2nBwsUq9nFZ9Ye9jsfSbsYSbSBAwBP5gl9O5fSWdE4g+sBEo1Xj1w5UijU2IKufiffXcHAXUnKbSHQF1JawNJ2MycyiQ7+wbjcDHHvtpY+GErK4/ISuI+ko/0pF6ApZtKkFg1un+zq/3dYqv/pXBlcfgLuTV5t7KSn5JtU5gzefVj+b0FT2U0ciXVMx0CgyFvyIY9E3I0doMd97OC3nbmvoIURPfKPj8Lm5+aDH9o+6ZKLkbfqn4l8UkcK930
X-Microsoft-Antispam-PRVS: <MWHPR04MB0414E474A0E663B807BCAC2190BE0@MWHPR04MB0414.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231221)(944501327)(52105095)(93006095)(93001095)(6055026)(6041310)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:MWHPR04MB0414; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0414; 
X-Forefront-PRVS: 0638FD5066
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(396003)(39380400002)(376002)(346002)(366004)(39860400002)(189003)(199004)(2616005)(476003)(956004)(25786009)(53936002)(6916009)(48376002)(4326008)(6666003)(6512007)(97736004)(106356001)(6486002)(105586002)(486006)(66066001)(16586007)(8936002)(47776003)(7736002)(81166006)(2351001)(16526019)(68736007)(186003)(8676002)(26005)(81156014)(1857600001)(52116002)(6116002)(2906002)(36756003)(305945005)(50226002)(2361001)(51416003)(39060400002)(72206003)(5660300001)(316002)(478600001)(3846002)(86362001)(50466002)(386003)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0414;
	H:localhost.localdomain; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0414;
	23:01WYuv7o2EHfuZG9Hi3dNiOV/wDvHzMdTY5A2UvPI?=
	=?us-ascii?Q?THRxya6dAjdTEH67DbcjQ8FAwcLN0H7bkr+6wqsxA105MFnzoah4O+31S3kM?=
	=?us-ascii?Q?16YYeQAg4LN9Y5Oh3gpwHHcHaCbF4K1IZVW80NaDfm5B24Eg7RPiYfzMPKdq?=
	=?us-ascii?Q?17TLIni81/ECZ3Zw6ONr1rTeZ3xgpvQ9hI5GPZ/VkKMWuUnN4p/37gYb9go/?=
	=?us-ascii?Q?+SSj5ga0Cu9fZV0ojwKgrVWDGDf2Gzy1TotOnNgP8Y11ecsVXu3+PFW0Y9VN?=
	=?us-ascii?Q?Kej3WCwFQ/DGAdO4JkUTR7r9XNcha7k5BB4kk9DjYpRDpCv5QProybwDrOYg?=
	=?us-ascii?Q?+jf+0NldkytdTzZcsnIgNnzAkW5iVJ4WLWqLldU1UTm673LHOxMGbz5dcV44?=
	=?us-ascii?Q?8SOh76yHsHQIAWpuhYTiToMSQ0GBSTA4PWaczpzAEr7xqzNjpfJjc68xnf4Q?=
	=?us-ascii?Q?sKOu2ouE7GPns5947fr4QadozKN4i/IHU5FZvVbOrAY4doOyfL/VujPn5/X+?=
	=?us-ascii?Q?kZCL0JqOC+nvQQszWlOp6Kb5psJhqWnfG06nYRq0QO1Aym/B5BZQ+VpiATpR?=
	=?us-ascii?Q?prkGAbLQNze3CdCHRhkHHibBvsp6AtgYSOsFm8/VjC7d2ZDkRUc/SF0fQYu+?=
	=?us-ascii?Q?tl/da1vZz1ol9JSHX+zfEGnbmJDG4W5eD2QkInrROgk3sO7MHqWE6NVyzFGg?=
	=?us-ascii?Q?t+D+4koAAPOsZ3uE5NBEnFBcmVXBOUCAowJEC7FIZNue+ilo3FQEMyqXVh18?=
	=?us-ascii?Q?IsVG1oKLtT0jMS7ZZK1JguAS7rc57qesNMeq7WLOQtK+7GRcnP3pNX6uCyzV?=
	=?us-ascii?Q?o1jlrdUF0j8XtW3P9me03qnGy5Q32aabWWcioyf96j+yFMj/Ex1eRn+pq4Qx?=
	=?us-ascii?Q?rK8g8SKETL4kl+/e3nry3XVPOQqmgvsWktl6lU9X93eKi60yxckO10xj1q4l?=
	=?us-ascii?Q?q4qEItunBw+mcyxf2a8jxycUAWQ0b0TIcUke4R3PhmhoIWRfuG9o88QCUDlx?=
	=?us-ascii?Q?+XVNfahfaZwXuYaW23+smQTfFQ8Ct4KtANT1vh8B0cw8zgV0alf1gnUBG3aT?=
	=?us-ascii?Q?EebiET39j7r5BpaOFAd+jRQ+ZXH1DY0ljRJ5Ldko1iikqqK/c7AFnvm4CwKr?=
	=?us-ascii?Q?l9RlnjBOWcjH6pIK2vspKvyvcfzRfOM56sGbVrE+yDiKGBL4Zg7uTcsna0EA?=
	=?us-ascii?Q?q97yiIVqgJOnloUtHvo4M49u1teIgjNDlFu00Neo6HRroYBm3VauyYKZytZc?=
	=?us-ascii?Q?WgbZ4t+ot0sq6ljZzw=3D?=
X-Microsoft-Antispam-Message-Info: 1mWmswSp1emMZGGoHtjNdCnjiJDIicLhuZVep1djRHBkYP70cZlNW4rjokKLSjlL/ap9IlDFVXkc6Id1j638y5ngPnytFg2R17cOD+Kzksj6Qk13ybszOXWuTyG3iLFVtv29kReRuVwfFsdZCplECr4OMeVWGXCQ59cavKKtXIZD7efTNJ9trjDM6rM6xA91
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0414;
	6:BhxPIjIPQAqzLV8E/7FDk6dDw/n+GsUKX3EA+kt71Ur2zV9zrm7+WufXP/dWc4PMhupeJE9lI7oU5OQLoTNo7j8R0G1S4nPGtiHuDxodzMERPUm/1lwaRhGrNkNlx5mjiPe4p/33O76sUlbhw0C1tUcx2gaOrEmXcplCczGS2uIAYa3YHyLBcle8yiJJWXx3kkkQ0fiE2aRyQZrv8mkevBdpqHzuE0EJhC5cNeP0a+h9m/QUgRFgDO4Z83okOqhq3tVU0GvWJq2YkKD7yJSfQJxsw7Rr9KVNVgLZLXE+jrv11N8Mr6ISAwFKE5Tpqw4sQWHqtNPl/mfq3Bskwj5Kj0TsD496w0XdFm73k/khVC+RoChQjvco+G7ve455JncgzvRml+yn9aHkPA8QjR4bQNVzpUmfXPaP08j/CLC2aoEiChLOytyCGKOkk1mGV/oAq7ybF5dFKc697JL/zb5Jow==;
	5:S4QC59671t/QEHeIagfTpDtz0KgAEEWrQKPHEahdhLtTQvOvJa+we8YisKEkajOwgamjplAeqoi3+su6I0jy7tzHukmS7in0xnnNAKFpupOvWQYaAq3WwQhoF9O6An0tLh1ah5W41lk+5GEiVBaGP1IGQmWQywq1INewSw/gTno=;
	24:JQbM9BDOmSoS1NMMyPt09zGYqm1KhDM1liqvl29p0mGQ8ruuDSmez3/zTxqqCFVjpgw0pRXBBIfaTzRU2bbE7fsZmCLgTojchuI+cN8adfE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0414;
	7:wrsiiiqjzLoecGQcF8UWPLLsI7V2g8QqkIF3a3B5DY2Bz0EzgBdHm/6e0sZEKDul5AXphvVADMqc9j+NZ9P7+2MSAVuFf7LRCQuK/Sa4CURrYYMMy1P8m9iq2JX/wzp3V8GHXGxVo20RO3fQvTwIiIDJtv56szCDO+mYIMzq7EO2Pf3Yxr0+PtNV6wrAfCU5s78mZ/0TXvNYqqMESiIf/PH1N9dR+SwFl1HtkLEwFJDEBMH+2zC2fiJIAZneySNZ;
	20:OrHLkHupM/PGfVpysHuDrKHPTIjYpr9reL8igGlZCqYEZqiUtpQoBNdax3pQ+69343oXLK+Gg5IXmSf3shGaXThbY1NzXhqiB9KRzbFm/6NT7Yuw7Fq5aFLizhHpQXNaB/oJBvnv0BUoBJOdygIWu1ipzL5Hj0YQGaBYAfIqN7A=
X-MS-Office365-Filtering-Correlation-Id: a639b39a-c250-4f04-aa9d-08d59f05e673
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2018 17:10:03.1536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a639b39a-c250-4f04-aa9d-08d59f05e673
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0414
Subject: [PATCH] meta-oe/numactl: Enable NUMA in the kernel config
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
X-List-Received-Date: Tue, 10 Apr 2018 17:19:39 -0000
Content-Type: text/plain

If a user has specified numa in their DISTRO_FEATURES then they should
have NUMA support enabled in the kernel. Without kernel support the
numactl program is not very useful.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-kernel/linux/linux-yocto.inc           | 2 ++
 meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend | 1 +
 meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend | 1 +
 meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend | 1 +
 meta-oe/recipes-support/numactl/numactl/numa.cfg       | 2 ++
 meta-oe/recipes-support/numactl/numactl_git.bb         | 1 +
 6 files changed, 8 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto.inc
 create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
 create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
 create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
 create mode 100644 meta-oe/recipes-support/numactl/numactl/numa.cfg

diff --git a/meta-oe/recipes-kernel/linux/linux-yocto.inc b/meta-oe/recipes-kernel/linux/linux-yocto.inc
new file mode 100644
index 0000000..9533eb6
--- /dev/null
+++ b/meta-oe/recipes-kernel/linux/linux-yocto.inc
@@ -0,0 +1,2 @@
+KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
+
diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
new file mode 100644
index 0000000..161f9d3
--- /dev/null
+++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
@@ -0,0 +1 @@
+require linux-yocto.inc
diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
new file mode 100644
index 0000000..161f9d3
--- /dev/null
+++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
@@ -0,0 +1 @@
+require linux-yocto.inc
diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
new file mode 100644
index 0000000..161f9d3
--- /dev/null
+++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
@@ -0,0 +1 @@
+require linux-yocto.inc
diff --git a/meta-oe/recipes-support/numactl/numactl/numa.cfg b/meta-oe/recipes-support/numactl/numactl/numa.cfg
new file mode 100644
index 0000000..fe1394d
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl/numa.cfg
@@ -0,0 +1,2 @@
+CONFIG_NUMA=y
+CONFIG_ACPI_NUMA=y
diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
index b9cbcf0..ef2dab2 100644
--- a/meta-oe/recipes-support/numactl/numactl_git.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/numactl/numactl \
     file://run-ptest \
     file://0001-define-run-test-target.patch \
 "
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


