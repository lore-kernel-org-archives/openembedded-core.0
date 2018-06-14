Return-Path: <prvs=696fae14a=Alistair.Francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 7317B75485
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1529006278; x=1560542278;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version;
	bh=CnwWglzQoAGwKmoPyqFBPMmEegLMIBenCqqe27RZoz4=;
	b=EpFsAl2sYavBV5bWMlz2RW7pTxzmzTAVk3llEmBHTkPSvSq4QruLx9BQ
	DOl4tqoaPYaIdmCj8f0Cqm7yTLjxMvIz1F4r1rBuGG3yJzhA9riDBfE0z
	lWuU1yhrRXBtkYX7Gzs/ID6L3mQD3Ea+T/dhL0CKzLZkQZfPxN5T4DsMm
	Y1VbLLogg3RO6Uy8TBLYI3O+vXKjIc8Wxzp0JXh3EZmyub6o0TbUoZXym
	VZRrjK6lpSOa8Az+xkouzXlJt1Xb4LdkawuqeyKI4h/VxA89KhkVK0Sbj
	lazQji56g3LAXd6GL6655RX87vUBm+Flq+ky6VbH6USJPxIZ0qp3En+oa g==;
X-IronPort-AV: E=Sophos;i="5.51,224,1526313600"; d="scan'208";a="177386685"
Received: from mail-dm3nam03lp0020.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.20])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jun 2018 03:57:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZkGeSvifQ0Zi4DeIXKLA9oFoMbniY+pulN2Ww8IE7F8=;
	b=CUEqozhkV9RLuJZs78kop3YCKdpW/flFZoG0PYiHDsfc5AqT1ov/5DjWKiZMPTDqSzRF2WUVi9QGx39BnFesup76kG8xrek5qoSmGvVBP4kSei67Zh6rfhmd2cY4ZKgU816I0k2ODTHbjHTu/uKwfFOKqH0a1LznWy63fCiCG7c=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	CY4PR04MB0391.namprd04.prod.outlook.com (2603:10b6:903:b1::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.14; Thu, 14 Jun 2018 19:45:16 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 12:45:06 -0700
Message-Id: <20180614194507.93168-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180614194507.93168-1-alistair.francis@wdc.com>
References: <20180614194507.93168-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR04CA0113.namprd04.prod.outlook.com
	(2603:10b6:104:7::15) To CY4PR04MB0391.namprd04.prod.outlook.com
	(2603:10b6:903:b1::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4153abac-041a-4c5d-dcb4-08d5d22f5ab4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0391; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	3:5E1bZlmn67VZTm9XfgD57IjQLmzeNcrmOXN2eUbEdiez7Xlv3PYKjcHjogQ0y/H7EijWwyVmY+vfxjg33b2N+vi+SRElaIo1WVid2yDorLgMl08KQP+rzMIKIed15WXtoSI78smQ+WbamsChxlTIiJTHw+yS1dluC8gMliAI1+G+PxN8frxadsovl3h8IZ5xuFldtv5E4MW6DZIWl+4NDViNPuvsJtHRBNWjq3ipMDSJ06AuO754EINKK/U0IyIZ;
	25:G5hZN0zEBvy6T2hODJ3z1NPzsrYlOxEMHRSm8xhoI9MYurCZkw4i6VAiBnNp/a7aAjl1QI3KpxFgXIFA5SoDwXbU0fxVF9Oo8TSBqJO4JW6y8B1NYlQiocqtw6BHgS2P0u8UqnnoxR2Pie2H2xSXDW/bktrRKd6cjjXv1o1u76dI8WIc367rG8SGmo2hmRDoH40JdMcoGUjCN6thVRTVF0dCfhPf0BsxJBG1qUWpGzDZovNUqe3Er8ZWy9cgZzp0yp9uz5Eo0IoVtcnBA9LMSO+alTfIrltPzOg8UgPsRmeQf9iPc8lk50ib2unTUUbs6skPnaleE3tjMOTJyaNFrg==;
	31:rMJax/BtE3DMHxGb1e7N77y5T0XbkhxJQ3cpppwKjTHVYMyX2fKVmcr2ZNCFZdNdzdM+QjUjg6pxnz9xx97wTXe2G3LZBBCKnJfmh8AlQmhrHukGM+czuNy2GNw2P0MCGTc82cbOnmbtZaqbu9WuiTOoKJFDh+yXCKgVj6GLvhd8kGA8yEDajUSxkC8GKWWZQ5phNAjOXJtS6G9eiTHObniwFdFFFf5OPLs2yEdhuLw=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0391:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	20:UCDqr3SkkQX/9zDrW6IpdM6oXFZfH8FSK5Jvlr/dqi44UeGkeQ/R5TknRiClg8BvqatMRzTLMk1cXrU2/vLU9QDzzNlqLpqVBJ/HEei/98xaKj4KrxJhGrs+FE0pQ3bIh7HVZIEtdPbw5QTh1KIqee4EPcOB0ChVbuyXgwNTV0bRY5cOQIqZZifbljl9z/Gwga3LOwiVvQLZGxrOn7yGgzq6hfQtnvP6ORUzOEGoWsQN1OZEkBVzcnV0g8H0ebTH8Vii0KqzZ1uJnUeMcnkkwLQOMoiaVAifd5gdA1JdFOEtRhESsyIVid1ULaICffk8Zvl62Ya7e4ylJie7rfIrlr3SU8cd4CURFqgoR/T9nVgfuETTpKx7fGOxd33ULRFXGnocJnN54Muup2d/uQtzI/k+de0gnSj99eWA02DTtNzxHD/9LfYV0s2wB9VprkphYDkZNw+MtZsfbgyze3knmCI5rYADk8fRlQVsgZ/QuCtBNQpqFZliTPd2ZpOHHotM;
	4:QDRI4/r20kMrTXKuue0kWZx9br1prxTGK57buwCXz2g0JA27fNOY7hq0qrnEUL8YxfAw/uxrdY5jP/PjbkxcaDrswo5QDL0cvuthiTyIuOyZfOWG2d0y3AMZykNEYllOkRVYgbzgfzzOG9tRcMcpc+NMsOlLTY3tl9hEHIG92weQjkFiiC2ZlwUkW33By/zpf7qQaXWuqeJ7ubDFHnLA0C3ddZ7XpeMDw28c4UEawvOyRnMnlWRS02mlu6XVR6JGlQC7e9yP5bih97JJ+PTNR+mi98IbwYb8fwvaAISHC+WF4hRqt623FmgYfNRrx4zNDXgOHSqdCM58QfXA/xl7SC8cZBlGoUgMiNtaFN0Qsa0=
X-Microsoft-Antispam-PRVS: <CY4PR04MB0391690B337C94461559F7DA907D0@CY4PR04MB0391.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(126947320029983);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR04MB0391; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0391; 
X-Forefront-PRVS: 0703B549E4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(39380400002)(366004)(376002)(39860400002)(396003)(199004)(189003)(36756003)(50466002)(316002)(6116002)(2906002)(81156014)(305945005)(8676002)(7736002)(97736004)(5660300001)(81166006)(86362001)(575784001)(16586007)(68736007)(3846002)(486006)(6916009)(6666003)(8936002)(50226002)(1076002)(59450400001)(956004)(476003)(2616005)(105586002)(44832011)(53936002)(25786009)(6306002)(26005)(6512007)(51416003)(47776003)(186003)(66066001)(48376002)(2361001)(52116002)(2351001)(478600001)(72206003)(39060400002)(76176011)(446003)(6506007)(11346002)(106356001)(16526019)(386003)(4326008)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0391;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0391;
	23:U+tqhKHvtq9f0hx9BD6hjS1UU/0htYEEATbtib4CQ?=
	=?us-ascii?Q?ZNbdkfKiWvKje22gppF4Q3ElVSoHq65dx1WcGRWArlv8UWcchvgdWQUKXj3+?=
	=?us-ascii?Q?BkveF7x4llTJA2PjuA7pr5Pj66voYU7xFyzBogXgIPz8AEz08iXEq4CDINUx?=
	=?us-ascii?Q?5B5YLbv4OCbeWSPc0aWkHwANmiXr6StHoDuAakc6muPMaxjl1RJVgOVLsqaQ?=
	=?us-ascii?Q?eww7+Ix65bmnLzXJWbemzn0YCocyE+5h9TwguWn4F3AwuNllFnPx7pBHyWPT?=
	=?us-ascii?Q?ST1/K2SQTDqt/NaIOLwPyXT5LsSfKxSDvm6uqmhp5KqP+qLJP03vxS7DxBhc?=
	=?us-ascii?Q?jnbSCTy1hOCiiA0a8p4eOwiePSN13c+5LlWmzTf1RBTdOweIx0gc7dbxAja7?=
	=?us-ascii?Q?l2VM/ne1gaJj+5Z+Gm6VvKKR2MKEMfGmhCLQVeVtjiW/NDlKCy+g+AbX5Fdu?=
	=?us-ascii?Q?F1YgsHa/9iU4qW9p5ZeMlRdxJLlHUgt37r9kI+INa1orTkHuFkuedqFfaSwH?=
	=?us-ascii?Q?RfPBvueTCHmo64BG+AwqzpSMXaFeuloP7psn7wnBNA7/bWGUIKSl+AnPeZed?=
	=?us-ascii?Q?dbUPo9GF41geqhFwzM/2MjOvEbLJuHjakYANeSC/8NLKcbiClv8pnc/gyYZR?=
	=?us-ascii?Q?8lghizw0rzT/kFicKTBegln+r1/HUvnNhOLmgZ0MAcvepkcQiHPZh5kW9DVm?=
	=?us-ascii?Q?R85yUFowapekslpLGuqgnXNyiz+B+adsZ9Ds9QZcetr4tKM5CxKPSkcjidAL?=
	=?us-ascii?Q?6ZpvZUHeJ+M48YFxFJc6DqKtvWPboVfvwBz72xuLDHNmQ0j6LKpk/pEvGHdd?=
	=?us-ascii?Q?ecvqOWnvV9N5hG5led5rrv9IRgDsZHj86ezzzaryx1fVCI9Aq83YnrR6HenD?=
	=?us-ascii?Q?Ot6pWBCyN9OdLf9rghDZydXTXZZ+Gwpof9Rok+FPR0UGBP/kKVRGEzLQipdY?=
	=?us-ascii?Q?O3y0TXni8ytbFsXW3BtysT3heW008Op9IDE29vw2DtMzyUp+dMGk68AvdyzQ?=
	=?us-ascii?Q?2LYHw0OgAOJZB4K8QDgIlQRxH7dNnhRYTKVRj/wzEBjsD2mb9P9QYYfh4WRS?=
	=?us-ascii?Q?4jIvWF6KuZYvtiQ86OpwpdHdnNMSEdx77lSRgeQEZcJERryKnAfXm2uNaXJy?=
	=?us-ascii?Q?dsSh+pbfl7KfhxOgEP9X/ANLXaO5+nFnb77hsJoM1dG3EyloZv0BEsFYE1M1?=
	=?us-ascii?Q?Bt3DhauU/OUPkJCcgG1qYSTOyOP7sZMxLuZRqMS7gzMBcOPP5D7aLliltcbG?=
	=?us-ascii?Q?lUIBdNUKL97LiiiCw6C7bD0wVejVGgwOI2PnS4I5wVAIhM9zA670cnLXsWVh?=
	=?us-ascii?Q?9p7rsu7JTsGp/Bq6JvqkTqU0aVQi05KuWXne6GGafQfL0krYA5HFtrrteVMg?=
	=?us-ascii?Q?0vKlOvDsxRUNqVuyFCvIvqjg3s=3D?=
X-Microsoft-Antispam-Message-Info: bsJ0zCDx7LBFuqvAJ6gSkyfwc2pf2AeOOiM+DQgLuCAH3nAvyDtNLC/I8ZBLOwna/Hy+04lSQZBdLHzWt4VKSA2atoXirLX9252TZ11hMn8DYKkVWhuRwD9jvF4e4X0xBLvA/MbjmNGgNCm8nwThgj8rwYc4cmCIkE4VAikZmpM492jYvtSJ6csPzvwJTJI4
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	6:ZpVmFgC9gWwQOD6nVvuAChNZlIXSsCav9YfGqlYdU1CkrDqM9LRwUQidscMiuULwgNyDoK3xsltdREPrgU4rBFeWtp7zT7MeJ0suwEYLLdq/zcqn9b5XlgoL0PBTOByhi7ziLTRBblU7RFUx1oWGEp630i+00yW1mUwKroy0MX4RT/5trcCWNHWiL1uDdUhlmdZYiz5sVnbFx3mBDLa6SS8E6VmKtwb5GL4edQqWX6iacYNbhGN938n3Ngju/YnCjOCvrvoXxlwd8wn2yTAEUAjyBOdLkDQcUhXwB2SYAf+zGW4WqJUlLX2C0XxMN4N/qNPo3L2tDU8CCZZCpOgDpnIbqspeeAoEuHPeJ0BxMjCVqIIUr4cpN0uwRe4hWuQ8U6oDRqLFI8iCv1l/QaRKVhYBM98lkvHKOoVp/9pPKr/d6WutBL0lJab+ZFJt/KbqnhuwSPw//sB6yFXhKwFwdA==;
	5:jRnBm/o755p7kOHcTdDvcC0j1gT9FBxVUqUgsxbgI0fT05BL2Z3ikg8gcIZAKzBxWBhdJnle6dlunJS7k2PWg5xn3xYTbbhQdpPdjFeVGwZ9RkJtfJ/YKjfiIElMpkgsRlSmLO8wRsBB3pJgiQi8ZXnjQ92OvaWv9Yku0HYte7g=;
	24:Azcr8QmNBQtWEgQyfvERCtIUzIPSVwoLOYpbgWvvSh7Hn/M7jpsjc4zBzOrL2Ufe7Pz2Y7E8P/g8O3GnKemiegk89Hg4MW3qAZrI+oIFCHY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	7:71ybmv+POgruEZpl9cIy77XOxwfhtXEd4zxilfC3ex/Lol5DyFPRRsU8IujPoT5lG0IcHoModEW19g1dgYPt01Ghr3gjPuJTen+SzaOGrnBIUXmNGMQTueZWYAAZcfJM8x+o08WyD7zmM2cBDz+qXTOHGZ1Jsv3fKI5ousVKKgVtVVinwU46kmbZKj+Z/NWnpnZ8iTg9uFIiQDnzU9VQL2PB28obJ//0PrT0Cr+6otZGoyZE1K3vco2MQBqvcfA8;
	20:WtUHD5JxOKUGNEuTT8VzSKAGp4NQCHR7pWWae2LCDuxsKIninokw51RdI+U59dE/CrnM+8eZdpWV4k2skGCwxNDcU7uoWlxLRol8fVKjAmzi+fdnKLo943YwdpcqKXiwebEhqV2yX86bvZMnOJbkkO13LM5eL4nXEtQwsPwXp6w=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2018 19:45:16.7529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4153abac-041a-4c5d-dcb4-08d5d22f5ab4
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0391
Subject: [PATCH 3/4] recipes-support/nspr: Add RISC-V support
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
X-List-Received-Date: Thu, 14 Jun 2018 19:45:17 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../0003-Add-riscv-architecture-support.patch | 103 ++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.19.bb        |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0003-Add-riscv-architecture-support.patch

diff --git a/meta/recipes-support/nspr/nspr/0003-Add-riscv-architecture-support.patch b/meta/recipes-support/nspr/nspr/0003-Add-riscv-architecture-support.patch
new file mode 100644
index 0000000000..14911440bd
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0003-Add-riscv-architecture-support.patch
@@ -0,0 +1,103 @@
+From ff3d77742bd3b0272c48ff7472a45e9c537709f2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 Oct 2017 11:55:10 -0700
+Subject: [PATCH] Add riscv architecture support
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pr/include/md/_linux.cfg | 46 ++++++++++++++++++++++++++++++++++++++++++++++
+ pr/include/md/_linux.h   | 14 ++++++++++++++
+ 2 files changed, 60 insertions(+)
+
+diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index 31296a8..d0dde57 100644
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
+@@ -360,6 +360,52 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
++#elif defined(__riscv) && __riscv_xlen == 64
++
++#undef	IS_BIG_ENDIAN
++#define	IS_LITTLE_ENDIAN 1
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
++#define PR_ALIGN_OF_INT64   8
++#define PR_ALIGN_OF_LONG    8
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  8
++#define PR_ALIGN_OF_POINTER 8
++#define PR_ALIGN_OF_WORD    8
++
++#define PR_BYTES_PER_WORD_LOG2   3
++#define PR_BYTES_PER_DWORD_LOG2  3
++
+ #elif defined(__sparc__) && defined (__arch64__)
+ 
+ #undef	IS_LITTLE_ENDIAN
+diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
+index 551918f..3a3cc2e 100644
+--- a/pr/include/md/_linux.h
++++ b/pr/include/md/_linux.h
+@@ -31,6 +31,8 @@
+ #define _PR_SI_ARCHITECTURE "x86-64"
+ #elif defined(__mc68000__)
+ #define _PR_SI_ARCHITECTURE "m68k"
++#elif defined(__riscv) && __riscv_xlen == 64
++#define _PR_SI_ARCHITECTURE "rv64"
+ #elif defined(__sparc__) && defined(__arch64__)
+ #define _PR_SI_ARCHITECTURE "sparc64"
+ #elif defined(__sparc__)
+@@ -151,6 +153,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRInt32 *val, PRInt32 newval);
+ #endif
+ #endif
+ 
++#if defined(__riscv)
++#if defined(__GNUC__)
++/* Use GCC built-in functions */
++#define _PR_HAVE_ATOMIC_OPS
++#define _MD_INIT_ATOMIC()
++#define _MD_ATOMIC_INCREMENT(ptr) __sync_add_and_fetch(ptr, 1)
++#define _MD_ATOMIC_DECREMENT(ptr) __sync_sub_and_fetch(ptr, 1)
++#define _MD_ATOMIC_ADD(ptr, i) __sync_add_and_fetch(ptr, i)
++#define _MD_ATOMIC_SET(ptr, nv) __sync_lock_test_and_set(ptr, nv)
++#endif
++#endif
++
+ #if defined(__powerpc__) && !defined(__powerpc64__)
+ #define _PR_HAVE_ATOMIC_OPS
+ #define _MD_INIT_ATOMIC()
+-- 
+2.14.2
+
diff --git a/meta/recipes-support/nspr/nspr_4.19.bb b/meta/recipes-support/nspr/nspr_4.19.bb
index de2c87131f..5c37509b1b 100644
--- a/meta/recipes-support/nspr/nspr_4.19.bb
+++ b/meta/recipes-support/nspr/nspr_4.19.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
+           file://0003-Add-riscv-architecture-support.patch \
            file://nspr.pc.in \
 "
 
-- 
2.17.1


