Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 22520 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 03:42:33 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740047.outbound.protection.outlook.com [40.107.74.47])
	by mail.openembedded.org (Postfix) with ESMTP id D30F36D23A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 03:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2oqXHWXS7dJWpCO/NtIISMTrCFeiOB2AzyPcxkkx2O8=;
	b=2rhGK7IheSq7uIJEB96pZ1BTxZ8FP0+JISRUxI1oRtoeITdwk92EDtRJRCao7nQq1LAmKKO9z+cT/0k7wDVyfsfTeFgWHaf0AS70LM5KqBAleiZ9lyDTGYo/eAENt8ABH8EXEZBzzjVgw/bsCaOGwWO3srs+nSPR03a5qHhhay8=
Received: from SN4PR0201MB3518.namprd02.prod.outlook.com
	(2603:10b6:803:44::16) by SN4PR0201MB3518.namprd02.prod.outlook.com
	(2603:10b6:803:44::16) with TransportReplication id Version 15.20
	(Build 1382.22); Wed, 5 Dec 2018 02:07:33 +0000
Received: from MWHPR0201CA0015.namprd02.prod.outlook.com
	(2603:10b6:301:74::28) by MWHPR0201MB3513.namprd02.prod.outlook.com
	(2603:10b6:301:77::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1382.21;
	Tue, 4 Dec 2018 19:54:59 +0000
Received: from BL2NAM02FT037.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by MWHPR0201CA0015.outlook.office365.com
	(2603:10b6:301:74::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1382.22 via
	Frontend Transport; Tue, 4 Dec 2018 19:54:59 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT037.mail.protection.outlook.com (10.152.77.11) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1382.18
	via Frontend Transport; Tue, 4 Dec 2018 19:54:57 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54975
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gUGmW-0006RR-Uk
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 11:54:56 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gUGmR-0003Uz-RD
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 11:54:51 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gUGmP-0003Ue-D9; Tue, 04 Dec 2018 11:54:49 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 11:54:39 -0800
Message-ID: <1543953282-1856-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(2980300002)(199004)(189003)(4326008)(51416003)(63266004)(5660300001)(77096007)(16586007)(316002)(36386004)(36756003)(81166006)(8936002)(107886003)(81156014)(486006)(106466001)(6916009)(54906003)(305945005)(126002)(50226002)(6666004)(2351001)(336012)(2906002)(426003)(9786002)(2616005)(476003)(8676002)(356004)(7696005)(478600001)(14444005)(47776003)(50466002)(48376002)(106002)(26005)(186003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0201MB3518;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT037;
	1:klOyrF6me5OtEFzpasDy2boWUEBVNlfdwyIb0M6KfFHMy/Tu4H28hSIo8nBNL3p8+ZRs4pe4bqL5RKJBODeqOwhxtb7CcSr0NfpBjwGT3BzjFDhPJWk6eKjUOu7qtdyI
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1539988b-b63a-465b-d756-08d65a225ec3
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:MWHPR0201MB3513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	3:NjlMzYExZyLttWZ5F8pBw7GBeTFhs6/3rgHiUGZ1pB3yfwIt7AqJik1gHWSvfIsKsSgABcWJevl2maIzWAgRoWh/5t2Xj21tVqrcPaQvKqqeWtIwFm41CAsLc/3KpiBD76lm43eYOXJlZnwhINIAp02NW8AIViLOOv+f6CwSTw/n+8us29lAghfkWO4tu3jTiNLkQnPG1Oe40lj4PfmEH5r/X+Jm78XpJd2Wen5LysIVtKwlQtx2incS42VxeRSy2RB1YwBKhijpvEv+Jy9TqJrYdxiMjDrluc11J3eJuaUPxL68fQcgCgXflDLYmeFGRO+aXkHlIrDZdkIfYMjTgnXfTjHRD+DbJkA1pGfEc0A=
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3518:
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3518;
	25:oKD+E1LPXruev+B4Ux0sA9fY5LcThQuoKTLJ92cNHM+pSyt3FdNOXegmtvoZTM/DY4xBnPvOHLh1yM9IvuPx1g26IsH+s6C1s9aYMN2yx9yUPs4LbPMVkKXWLG6udegCYCRkk3M8jdFhIEWbwYFvEgz1LA4fS8Y9XzG+tXPmJzlRNDWASYQrGzmrUQldsoWi1f9kkKmeZXYToVCcAf3h1CpcyQf2uKMF9LGABpJljrHhyM3k9EcOBD2nOy9vOiGIySDW8n45OgiLm1vBvhL6CoiQVx0VKRV6Atdff0EadI3PJuDzGXwZd/OeRh71Vgl05MCNHKkFG5fkUGcytSW03w==;
	31:fDcEMSXDf3mKBFXSdh0bm5UiG6sovXtFvs2d8DT5qpVnIvRf0sjFTo+hji3B5KckeE+ebAiP0gmc8Nf12TSwKvcmn+gTWseHTjAotFs/pudrKp5vnBMJ3Hl9QnhzISa2Y+g1Vdfxy3/m2u9rkVgrJE7uTBOYaLpwpGU/KZA/n7p1RCobI8J3Asc/TH2JkA131gKMEAIAgqbNEJ4S6GB8XxTBBogjMx81I6OTpmHlPt0=
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3518;
	20:T5gh1QyCcKxLnkwp3pNxYWMIAuis8oOGR+kZXrY9qwQlDCkUobqzNREf1SHlFZV0JvP3IczBCkbbmsbN5ZFSarM6MCKmE6Go+wA1pACAundq4h7vAYJJedM1ohZE4x3YFQ/+fywQRJD2TaCJrEJdCfGL2iIv7Hw4FJbaw2N4WrgggpRObrDvblDv4+Rc6NFaA6wcehCFl5bcgxL1tDQQnqEyzBEbCB+U5QB30Etm3UdiVdjCxoxlwAqmncKio+Qkg3XUfQREeINd2rB1gmoUw0zHW9+r67rjh6TkvBK+JI/XZMUXLNSWC3WsGYTaOdnVDkekwI3HJt3/GrzjZ1q/d6wenYxEmfXXOeZQ5OXk6gDgH4dgTbF8HzV4cdmCEybTUsEU9lD5ryYDzHT6pQuk8Mc3R2LKWADYrX/Cr8O4nPcL8bbtNNsaqu5ZUePOamMSjsK6u51NZuipzGlcg70UzllEWXTzTLhadCZ2pJP0hroJP3fvMRPJhjOc/h/TKJmO;
	4:JaXU2wxQi9XWhScKgV/pkVMP7l1PIXNMzUi1Mp7V8VVwhyUUJPDtU1R1yAels9VwvCLwZieFq8OJ0PGDRGt8NFUwYq1IKT9KCwaCLmwG7PgFcKyZYM9otnlYMgoD/Hj1QPzcu4Vo1mtXimS9YF5OdaIIseBRMeIiEn6M32rO1bRLbCuWwAIAqDa3VailnDNxf477H5iGujQlB2t+7gWpBqVlpKFd8MPvVtfoIMdQ3sNqXOJuuGO+9Kf1bl7CaO35wk0TFV5y46LsPziJzfSXDw==
X-Microsoft-Antispam-PRVS: <SN4PR0201MB35183FAB616FDF378121F62EB0A80@SN4PR0201MB3518.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231455)(999002)(944501520)(52105112)(93006095)(93004095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:SN4PR0201MB3518; BCL:0; PCL:0; RULEID:;
	SRVR:SN4PR0201MB3518; 
X-Forefront-PRVS: 08770259B4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN4PR0201MB3518;
	23:EbFU0ul4bokb/gGs8PdkWybtQEh3Zs4BYMabk9+?=
	=?us-ascii?Q?/3xKR/xzQ5jGGQGqByh40U9lH1vJZMp/UOoCy8b4ozyGMpw851JsCperRyf9?=
	=?us-ascii?Q?mmi72hXOVhfc0xnRHm2I5q6hKqan56gZYYwOO+2r5sFVHla1qrP6Xo07Gn7E?=
	=?us-ascii?Q?MMPUqfsDNsReuPcdNeGiB0oMooc8on2YGhN43+5dxRx+zkO1/sTsA0mlNWN7?=
	=?us-ascii?Q?58Yoh4xLQSexMi7Rwumu9chAbUsI1vHCXTXfI57H4dfoA/7YS5foP+GHMo3j?=
	=?us-ascii?Q?qXUz8TOwrVDWhFUyVnetiXHCc/MHUFm7DEyWdPLY38h22jR0poeRn2dXvJDL?=
	=?us-ascii?Q?VaRGkNIgCf04X/hRGY9QVivfx8KLqcmThyOgYWTq3Mjd1ARx7di3y8u4I/ad?=
	=?us-ascii?Q?779LG2AfBoIZ1vDX7IIHwmeQ8f5zS97zOBDk3HVw2RM4fHlRR92UPO31Y9T0?=
	=?us-ascii?Q?a7w2TP1tGNj1h91tUNmPvetb5YAt+joA6zZExO1qouUlzMA32JkTng/YichL?=
	=?us-ascii?Q?1C7L4o5F1h8eNLk1EaIcuWET3kkIsDf3TeN6V4AJN9+YN2+yHJ3Yjjk7/9EC?=
	=?us-ascii?Q?Q89F1pIvYXPpJO4BevqT2roF0p3W6N4yAWU5ONCYCGVxy+h9c+R11YYHjQ+X?=
	=?us-ascii?Q?IeBb5y23PDL+42YMmNr4cXiZAz5rQPK2TjWpKDKkKqGVjeYvmAC1HJt8xz1G?=
	=?us-ascii?Q?EkhspQitQ9ZroLcipFpFF1lltafcvzB+DqLOSE4tB921+5fYXwvsjyHQ3Gv0?=
	=?us-ascii?Q?9ytM/Kc0TORjMCfnYKbKt0c8rXyJPMhr5/Ft6Z0AC9KHgWEpJiBksg8yOZU3?=
	=?us-ascii?Q?oZI2LqMWa5O/NQ4spBMh/ltYR3RhZm/hCWIB/My0fIawu1s+tiXL2Wp2VHkA?=
	=?us-ascii?Q?lEw3yMXMDpPtxWSnS+618mm4+9UjgeptHW9u5bmmFZjfhKgff4/ORFQ+Mr0j?=
	=?us-ascii?Q?+vtRfFtjD6kOG9jf7py4d/xF8L+wkGU4fgagzht0lZPOH90U8yMrp9PwpzzS?=
	=?us-ascii?Q?o7PSxg2CYpqKHzabsYhPkHN+gqKKDRoHNWhBodzBN1KhBFJip59jU26EZBGG?=
	=?us-ascii?Q?J2ybVA1DSjQRmSX4Xi4eO5U+ZXVdnXlf0Kvkq6xX5TCPymb5EZA=3D=3D?=
X-Microsoft-Antispam-Message-Info: R+oKAOKGmIKeyKhe9115IVD/Fo9nw+yA/vvAMz6j0yLC8tDq4kC40T+aMTqvKoRlfAjf6Wi7dFYz7uVQtWhlCfLsz2Zk8mfIhEI6xAynB31LXoDFxht3ltWSUBU43Z4/dYJPrhtndDwE37hqs6KrB9HwS93ucdGGTQnw4KUIRO4ZErjISu9XLPxcfPP75vIVh1zijvTwlGJslFzsnWXdcj+lO08tnX4hjfq6oEz+/rspENPm2lYvZtoncYDdkhfjxmVoJW2EJnxZEz7D3XlCv5o6Rs9ruWdGpZHOpLUCqd25VqD5bwobfC8TNr+FClgktNiutrT9NOc+2JPWHPBPJCwF0pGir3k441YPGigPQWw=
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3518;
	6:6+Khmv7cNfqjqJMgQhOl84norjCc7yjqdR0SLsnD8rhQUazwnjXM8qRvB5Z/CmTPs7HonLCrYhq8mdo/H7KHN/NGSQdFNPM/RayPtuFcCR//f0CEQ1Z9A3B63TDDlpn9JUKVLBKM3WmAwKRtSJiiFcjjJLcd09lZkCxT4trLqeL4j7H5cw5JV67aNpnyjlKxglPqYTwpWCDwhDMmGZDt1lec4JsgF2JehnbKYa6BEJmpBWXiCU4QxqYP4lOrtDWOUZZe7/0ZoTGPeogC+cjwlbuNevDDT7EpfhsMVsCRaQYm0M/TGjoDqVmCBta21oQ00xk2SdSZaxmP9eEmCJZpOjyjTmKomMeWd+L1WapYqZ4AXe6oY1+SREMO0tzY+T4dI8LYTaE+1JpKo0wvajSEZLZt3JrffDML6l9SOWkl6zJGD2KolBX1aLUCnes6221T7AgCU6F3FEV3/nKYA/FpXg==;
	5:7kqEshU5THnwq2j8h78vqUkyJvKrLv5CghqsdUYZb9L7B5SOpVSxifrGMxGPmGvpR8ZJvQpErdcNkdiQ6ruT6njPyYsXA4MpG3gfQ79mUby8HRJH2KDBHomTbiy+A4itcQbh2BD45gUHdGOutUGGiAqnawI30snXWYDfVfyr9KQ=;
	7:FhBtsPyx0ePMo7aCff2vTgdxujYBNMfgvAe+nSE3f5RSdI+3HHhlESx+fD+Xg7qpMTEqvPmFCV9N2Z5gi9z0eHPEYvlVsheFyO3+pElfkjVUMG03IWz6En9XEr3H+mdamnDLOtgXLA4yzwzjh4HlOA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2018 19:54:57.9784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1539988b-b63a-465b-d756-08d65a225ec3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3518
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH 0/3] Devtool: provide easy means of reconfiguring the kernel
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
X-List-Received-Date: Wed, 05 Dec 2018 03:42:34 -0000
Content-Type: text/plain

This patch series provides support for the user to run menuconfig command in the 
devtool flow. This would allow the user to modify the current configurations and 
generate a config fragment to update the recipe using devtool finish. Devtool
menuconfig command will work on all packages that contain menuconfig as a task.

1. The implementation checks if devtool menuconfig command is called for a valid
package.
2. It checks for oe-local-files dir within source and creates one if
needed, this directory is needed to store the final generated config fragment so
that devtool finish can update the recipe.
3. Menuconfig command is called for users to make necessary changes. After
saving the changes, diffconfig command is run to generate the fragment.

Currently, when the user runs devtool modify command, it checks out the entire
source tree which is a bit of an over head in time and space. This patch series
also provides a way to create a copy(hard links) of the kernel source, if
present, from work-shared to workspace to be more efficient .

Also, if the kernel source is not present in the staging kernel dir and the user
fetches the source tree in workspace using devtool modify, then this patch
series creates a copy of source from workspace to work-shared. This is
necessary for packages that may use the kernel source.

[YOCTO #10416]

Sai Hari Chandana Kalluri (3):
  devtool modify: Update devtool modify to copy source from work-shared
    if     its already downloaded.
  devtool modify: Create a copy of kernel source within work-shared if
    not     present
  devtool: provide support for devtool menuconfig command.

 scripts/lib/devtool/menuconfig.py |  80 +++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 134 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 209 insertions(+), 5 deletions(-)
 create mode 100644 scripts/lib/devtool/menuconfig.py

-- 
2.7.4


