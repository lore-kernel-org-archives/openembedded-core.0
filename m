Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 42458 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 16:27:35 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA5A6BA8F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=h5tvAC6PdBU/NrDGqH/8pEmfXs3B36RAmq/NNNccMNw=;
	b=k4ImnIHkUDDxxIX8xYIBXwOBWOJyodsQQJD5bCtXMusmmC2BL4B6WGh5YGHmK3g+t91XueYGLxIneiuiig+n48gDQzmoKe0EvSY2rHMyuZ5WbcJYeo3zy9bW9hF83HdrSCdmyUfkvXmEgFvRK18qteQ90ETSPcdNpnvtUoKmRD4=
Received: from BN6PR02CA0039.namprd02.prod.outlook.com (2603:10b6:404:5f::25)
	by SN4PR0201MB3520.namprd02.prod.outlook.com (2603:10b6:803:44::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1382.22;
	Tue, 4 Dec 2018 19:55:08 +0000
Received: from CY1NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by BN6PR02CA0039.outlook.office365.com
	(2603:10b6:404:5f::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1404.17 via
	Frontend Transport; Tue, 4 Dec 2018 19:55:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT005.mail.protection.outlook.com (10.152.74.117) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1382.18
	via Frontend Transport; Tue, 4 Dec 2018 19:55:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gUGmh-0004dz-8e
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 11:55:07 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gUGmc-0003aA-4k
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 11:55:02 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gUGmP-0003Ue-G2; Tue, 04 Dec 2018 11:54:49 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 11:54:42 -0800
Message-ID: <1543953282-1856-4-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543953282-1856-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1543953282-1856-1-git-send-email-chandana.kalluri@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(136003)(376002)(346002)(2980300002)(189003)(199004)(107886003)(8936002)(426003)(106002)(81166006)(9786002)(81156014)(8676002)(305945005)(4326008)(2906002)(186003)(54906003)(77096007)(26005)(6916009)(50226002)(316002)(36756003)(7696005)(106466001)(51416003)(76176011)(16586007)(336012)(50466002)(476003)(2616005)(446003)(48376002)(47776003)(6666004)(478600001)(356004)(36386004)(486006)(5660300001)(126002)(14444005)(2351001)(63266004)(11346002)(107986001)(2004002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0201MB3520;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT005;
	1:syXBKDDs1x9k1684OAcU4MYE9/k35eu7jrchPBjyHQoGW8g0ihmDrwVTPjBwKq1yZ2qNh0fw8L/m+Nn1/HWmhWxEMGbEq2KTnjyHTMY200OO/ksKC1pWG09OqXgRglWd
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9b034b4-4768-42f9-82df-08d65a226457
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN4PR0201MB3520; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3520;
	3:m7nuzq/bRoKk5NU/sf+kdoJcQkTicR6LOxKvgugmjjgFCH9VmLLYX2djRchg9KLjtFyJaR/jSyRXkQi4gKFgcMaUHZVJPVL9WFmQViGeRT2IXlACnFrmogNXrG4cL7UTTYFAEcayKzWCTh5WzixQS1TrpN7OgaLgVkOG4bmmwIa2ANCnpUunzSn8nNkBq/zHSMQ7onzJr5/I2V1gtltmAX2B6JCaMPVqKxQn12vY5g9nmi6YIWqjc4ltQZLhkTVQ6IJcV3mcKasa1AYmCwuhguxtaxazE4qu1Y2QQd+Q1IeqR/8tOIImHMV0lTVv5RVL8/hMO4tlTnpQH3d1EDommxTwMe2fofAW5qvf0HBgJM4=;
	25:sYVSTppOpjilGPEMQxf+9d6PaUbqIEdAeIbvKcrWRhpyduWH4grKYUTqUDpc0+3VM6Z0qo44JBee2P3dyG93tL1qzxvnbtEhrePwLYKbUuUHehViow4jxZSOfdP7N2W11R2OF7PLEIB0JrYwVIEMk2RJ+Y4LSQc7RGXrnaNK48vVmD+AgoTgMo37gxlY7mEbBX1ZnsM9d7RIrvnw4KO3RXGkoozjAvVGBvy7Ypg+y7Ts8p0ElGjXTPhzM/Pab/Xs+M39LOEqGBI/K1n9ePpYFA5n0cY6ZQGGYmtguC8LWZsfqz0O9dun24MsVkAzs8ykoLN7Au2a6LjZ330RoDf5Uw==
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3520:
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3520;
	31:Zm/mxg7HTyPGcG3KRdl+GHCO4zrKox/ZL0oaPy97wdPFlOk8E5gcZzxDNsOeDF8Hh79KDB5XMtl5Sn8mf24B8H15oMasUiM98hQVXh3LlSSLdCRmLDB+eEJkh1LvtMSORkNfndEqH5hDla3enjtxF1xUY9unosMrzG+sWfcff+5DHKCEY3jsIj3QFJv4LvUA/tP2fYmd2Vfu+hF7CHdZR9D7uNa4acNjmYbk4Vgr2pc=;
	20:BQFGELI4gFqTnWKSlAEA9U6QnQ1ko+0DfI/vivl3wSjbUuBL2aextMjRbQdH94ibQxDhmVmRmEpatDVR9egN09v5e1rLiIHHb4vYz/+AqhG0He0PQNTZTso1nd+j103yBmCbZJKI7SvoNRm4sV9WiZInFJMqd60oAKFkLDP8aR8RW+H7ZkFK4/8K1meMwrpvdH8tm/eWmEz72vYs47ztlWKOykcwFeoF6bpk2I2Qsie9D2hhza+QtVsUUgapzsMcqarRvwbUxVik1aCGsJhZ4R2h3l8id6arTaZ6wOZIlvQIl1i8xCwtPY9nxBJz6v/u+7MCK1CgliHGeAwA+MuDJFkq8IhFQBjqYl83ho2zbIiNea0fhuaAy9M/QmpPBGA189dOi04CeqmsncqBdNoA5vm65Lt2+IWPH4yOBFK0QUkI06pFfaCJjceqC7GF0LG9cv66LQ0AHzd1qFM8u9vc4ZYP6Z3tlbmKoLo3oQ/YQIw66bIx+tQUCsHvpqsxGmKl
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3520FCDFE6286D9F62FCB7D0B0AF0@SN4PR0201MB3520.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93004095)(3231455)(999002)(944501509)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:SN4PR0201MB3520; BCL:0; PCL:0; RULEID:;
	SRVR:SN4PR0201MB3520; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3520;
	4:bCHulTOLxSCuy8RwcNLjFovA6hHdWkisoAPi9yv+mUGF30eJaS/cJaUabSiPbSOS9IGbSvHgXMld6fun9J0Sj8brrA2chnxEcVsAe3CDK//lToVM7aRAt8+M343KR6TXPdpVTpRxjz1Vnx4BEvVE9HoKcwygcAWldq1xvj1V99wVH6Y1mtt//JhV4tw+rD5edw47j+DG042mmA4fdx5Hf+NDL4Bn+bT3xBf8HfZGVMQFXbuTFhcu7wEyYDV6diIYO+2LeKY61ztTkc0IAV9O0A==
X-Forefront-PRVS: 0876988AF0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN4PR0201MB3520;
	23:dDj9goGi5w8yJtsTNJKHkhvXUEhQDJEV1wnCa+X?=
	=?us-ascii?Q?jINqXyYGGw9yXb5DdSSPwCZ+2a1uVoP1PTu0qGwCPR+LG8Aqdkq1Z2JZdKJj?=
	=?us-ascii?Q?3nHMYjaRbfTpGGBRK8ni+cr5SUnxvwfCTEOOLNzDOuycNSlXhZf9W+CGWI1G?=
	=?us-ascii?Q?H25C8NQjHVq7bm7ZZPdSlyhBuwSGnsQVImw3rF2avBHeBIZKbiAXuVOefaeh?=
	=?us-ascii?Q?xk/FG6eU+rzK4Zm/iAHO0+YWofS7LoJVaOAb7FuyHHbUMsezh9ICCtLTE/H9?=
	=?us-ascii?Q?8IYdgtktqCa5rLAkc3anboF2XDfwkr4GSBoid1ADUuP3PNtUEG/646eosS0N?=
	=?us-ascii?Q?gJQxol204DmH2NxeKL02W5tucxnPqwYFYiG/smxtJkJLJSrsGOZYTARvtw5b?=
	=?us-ascii?Q?cH+J9i97JO+5hUvsUnh+uPUKW6oAX3IIXZqEAizWvTYKi+PrAw3MnRV2AXs3?=
	=?us-ascii?Q?QsslwnwzE/WOntchaBMElFvQYSpySvMmPlh9JrEtroCE6DR6p/AI7s5OFVkL?=
	=?us-ascii?Q?ED6kEY6mS4hf3AAaAVeyQv63CHrCzlqJRGQm1CyZciBPXQCZFt5J3moWSgcw?=
	=?us-ascii?Q?jPBqA31D9Bkhsikw8HY2mTCqBwS692X1ATUahhDQyx3woUasWGQFTV4VOXpH?=
	=?us-ascii?Q?3slKY2HT5XpK4hzemU+KM5D5dFq+5lbf3vBmWavel9agnEIKIzA3a3R/jXUS?=
	=?us-ascii?Q?aO+aYZg2LB8AR4Yc1aOc/0v0ujDePz5Fj4F0u0DSRqFWldaHMn28v/U2fgOS?=
	=?us-ascii?Q?AO9irI/y/kpKlsmKmPDMyzyyTLbP7j8T+25oqw7LXQp1p5/ri1oEqLspbq6n?=
	=?us-ascii?Q?XJlYcIzW1ZqvPAd+GmH2KMKRnXKDEFgaBqW2k68ltgSxgSqPOVKoJ1hvVp9B?=
	=?us-ascii?Q?XM8dU8ve+qn/UeF4Cg613vPtGW3wNXY/VQSdjgVQUEgRguO53cl83EVbVC1k?=
	=?us-ascii?Q?/5raRLB5Jk1Czfl4GW558QGghyptPkdZGbqQt+gvJDw4jVw5kj4SL9yucrxI?=
	=?us-ascii?Q?S+20fEMLQc2kJjaRA/hl1DhseOGAHbPXBtNLpJTtxRK9FOqvGAPjrcmmmX0E?=
	=?us-ascii?Q?qTeGiHrNysOmZxTfGra8XPjFAvVOz9wchyiLLbdGrGhR4zlQzpZZTiDxX/ga?=
	=?us-ascii?Q?s1wK0jevH0uia63KOH8kUYJTnNX8yNlCs?=
X-Microsoft-Antispam-Message-Info: 5Tt9YEx+bsRgB0Pcyvgaq5AVpiY1WR3TbxUkT4muVR522bQLm8+dv67mL0ECiZtDPrf85PDg2v3wkX7fIdpaKuDDq2sEv3kq0IwQgAWmObV8ZH1qc41AhKCBKGtLdun6y+a7Y5kQ2F1WQr3xVeDbfRGRZBklytNRv3N9hvbXDabhqapxE8iIJ/eruvBJNwD8VHrmmWv7BA1W0jTvw+bIKTwrll4D/u8YmJuNhVxSOiE2IHkWWFs0cjb+vAfy3SCoU7yckEXpKWlovWPOJPtBFQBvdDYZ6V2n8LEd18jv4eB2aScXM7gntTKvGpXVXEHGp+FOftmyAxDWYGrwP5iUvG7P4WlZ41e5EeHtpO5nVys=
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3520;
	6:ZsUgmYQo6FeZnMVwzB/wHlX4971w9JMHgBH+1gy8fmbA2A92Yg8Ve0BIa1gn2TjBYy3tFFaAMC4hmSH7XUpBqzpQo9JH9VdgX+ZzxAXhNYlHDkcIU2ZU6XjoDs14aiECdGNyJVSk05Ll57wgsqvHykomC+rxg6h/NJmvPOK8nhxCZxYSAo19kQPpMERnOH2v2DHsjtGH6PeeC8rPixgHL259s7CZn0Qs2Me+mS31mJMIZ0fzqWfrOb4E0KtUBNfc6PE8rYU1y5OAyOkWqDQd4sIEMRJ5XhYXO1JtJe4lyQO8y4ykSF42IkE3D6ncrFE7WSFJMOWBcISApAH/hrjBHO32VKdifPLMY5i9ENgkq1pJm73Gu8EpTLQrnVspTDhX1fmH838vXUelJJF1qyTag/WGmQwQdZRX+ecR9UDvPuaArZPNH6SIZTl8GB2XvrCrRVpCTKEh+SQzDGte6cJohA==;
	5:2o56xbVnoU0TvLRYmYbzAo3AZ6y9r2B1QQ1CRBOJB2MCRX/ZuXfVSBGj1hvc1Pf+BBB3pUnmVD6od58S5JTqLUFmuxaf8rDlIZmFLLKVNrf1zYkk4D9ldI8rMQFJo4f+UWfShyg3ExviKJMExrfxynLmjzRp211J3cZpzviDZGE=;
	7:WV92H7o+ts1JT18iMAZLft7TO51+IvfpNI4jjD0AZ37uWxJVNHvKPnxevaGfvquqSke/QyhbbbcUQ9Yx5Jf8HK1rouOB+DvkRJA8J9bY/ncFlN8QpwTPxEhisgOkEh6tKzSwhI/lW1VdhPb6gnRBDA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2018 19:55:07.6629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b034b4-4768-42f9-82df-08d65a226457
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3520
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH 3/3] devtool: provide support for devtool menuconfig command.
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
X-List-Received-Date: Wed, 05 Dec 2018 16:27:35 -0000
Content-Type: text/plain

All packages that support the menuconfig task will be able to run devtool
menuconfig command. This would allow the user to modify the current
configure options and create a config fragment which can be added to a
recipe using devtool finish.

1. The patch checks if devtool menuconfig command is called for a valid
package.
2. It checks for oe-local-files dir within source and creates one
if needed, this directory is needed to store the final generated config
fragment so that devtool finish can update the recipe.
3. Menuconfig command is called for users to make necessary changes. After
saving the changes, diffconfig command is run to generate the fragment.

Syntax:
	devtool menuconfig <package name>
	 Ex: devtool menuconfig linux-yocto

The config fragment is saved as devtool-fragment.cfg within
oe-local-files dir.

	Ex: <workspace_path>/sources/linux-yocto/oe-local-files/devtool-fragment.cfg

Run devtool finish to update the recipe by appending the config fragment
to SRC_URI and place a copy of the fragment within the layer where the
recipe resides.
	Ex: devtool finish linux-yocto meta

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/menuconfig.py | 80 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 scripts/lib/devtool/menuconfig.py

diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
new file mode 100644
index 0000000..38133db
--- /dev/null
+++ b/scripts/lib/devtool/menuconfig.py
@@ -0,0 +1,80 @@
+# OpenEmbedded Development tool - menuconfig command plugin
+#
+# Copyright (C) 2018 Xilinx
+# Written by: Chandana Kalluri <ckalluri@xilinx.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+"""Devtool menuconfig plugin"""
+
+import os
+import bb
+import logging
+import argparse
+import re
+import glob
+from devtool import setup_tinfoil, parse_recipe, DevtoolError, standard, exec_build_env_command
+
+logger = logging.getLogger('devtool')
+
+def menuconfig(args, config, basepath, workspace):
+    """Entry point for the devtool 'menuconfig' subcommand"""
+
+    rd = "" 
+    kconfigpath = ""
+    pn_src = ""
+    localfilesdir = ""
+    workspace_dir = ""
+    tinfoil = setup_tinfoil(basepath=basepath)
+    try:
+      rd = parse_recipe(config, tinfoil, args.component, appends=True, filter_workspace=False)
+      if not rd:
+         return 1
+
+      pn =  rd.getVar('PN', True)
+      if pn not in workspace:
+         raise DevtoolError("Run devtool modify before calling menuconfig for %s" %pn)
+
+      if not rd.getVarFlag('do_menuconfig','task'):
+         raise DevtoolError("This package does not support menuconfig option")
+
+      workspace_dir = os.path.join(basepath,'workspace/sources')
+      kconfigpath = rd.getVar('B')
+      pn_src = os.path.join(workspace_dir,pn)
+
+      #add check to see if oe_local_files exists or not
+      localfilesdir = os.path.join(pn_src,'oe-local-files') 
+      if not os.path.exists(localfilesdir):
+          bb.utils.mkdirhier(localfilesdir)
+          #Add gitignore to ensure source tree is clean
+          gitignorefile = os.path.join(localfilesdir,'.gitignore')
+          with open(gitignorefile, 'w') as f:
+                  f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n')
+                  f.write('*\n')
+
+    finally:
+      tinfoil.shutdown()
+
+    logger.info('Launching menuconfig')
+    exec_build_env_command(config.init_path, basepath, 'bitbake -c menuconfig %s' % pn, watch=True) 
+    fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
+    res = standard._create_kconfig_diff(pn_src,rd,fragment)
+
+    return 0
+
+def register_commands(subparsers, context):
+    """register devtool subcommands from this plugin"""
+    parser_menuconfig = subparsers.add_parser('menuconfig',help='allows altering the system component configuration', description='launches the make menuconfig command, allows user to make changes to configuration. creates a config fragment', group='advanced') 
+    parser_menuconfig.add_argument('component', help='compenent to alter config')
+    parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
-- 
2.7.4


