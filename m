Return-Path: <alejandr@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790085.outbound.protection.outlook.com [40.107.79.85])
	by mail.openembedded.org (Postfix) with ESMTP id 85DAA6C50F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Dec 2018 18:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ejnYY+YcB1zM55OIRTS0Gm4XwkIHnWAZnDpXvR1EtOI=;
	b=y7VxH8CJVhPBcLmrlgLTZX/SZQp7FdByExk6qbppysjhoe/212ch/riIAjNysp4XFJ3bPH+gwItvYVUaFm5VNBpYLaOxfjQjaWrOLaUY6zrQVRLxeIygq5cR/iIQB+z5r6RjKxbwq9YQiAvTQOhqQMXudg5B/iSUaRMIukayw/Q=
Received: from MWHPR0201CA0084.namprd02.prod.outlook.com
	(2603:10b6:301:75::25) by BYAPR02MB4456.namprd02.prod.outlook.com
	(2603:10b6:a03:57::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1404.22;
	Sat, 8 Dec 2018 01:34:16 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by MWHPR0201CA0084.outlook.office365.com
	(2603:10b6:301:75::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1404.19 via
	Frontend Transport; Sat, 8 Dec 2018 01:34:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1404.17
	via Frontend Transport; Sat, 8 Dec 2018 01:34:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gVRVW-0008HJ-PR for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2018 17:34:14 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gVRVR-0007x0-Lz for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2018 17:34:09 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wB81Y2gF022247; Fri, 7 Dec 2018 17:34:02 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gVRVK-0007vt-20; Fri, 07 Dec 2018 17:34:02 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Dec 2018 17:33:46 -0800
Message-ID: <1544232826-20839-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(136003)(376002)(346002)(2980300002)(189003)(199004)(5660300001)(2906002)(107886003)(6916009)(50466002)(9786002)(26005)(81156014)(8676002)(81166006)(356004)(48376002)(336012)(106002)(6666004)(4326008)(426003)(316002)(14444005)(50226002)(476003)(8936002)(63266004)(478600001)(2616005)(7696005)(126002)(305945005)(486006)(2351001)(106466001)(16586007)(186003)(47776003)(77096007)(36386004)(36756003)(51416003)(192303002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4456; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT006;
	1:vYzjPklfy7/QH8LfSBkyMuvH7KEoIlOWD58qn0DJmDDVPbyX/L6aDE/r1Ly+bgcb6nRcQulHQrl//QpF4u8tnE485QcOBjrosMG3le6oKy9MpygNZmheRIWTB+wF3N+Q
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c54abe0-f85d-444d-2dd7-08d65cad4403
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BYAPR02MB4456; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4456;
	3:TJst9X3UFQQ+9IQs5M2cgqeqijE6pCNDf1N8PoRuONFJXnGbl2saJk3wMUVh9u/00U+ekGwWxWZol08dG5OK+KO25088wkg4LcyQsrXDrBMybcvnMLzPh3Goo645V8Pr7gtGwfLRFvxDcl0LptA/I+oy3QyodIUIPMqq6MFiH1yfJORbr3nqRJWkXNVLfCsNwx6eAkiGV40jgQ8juJlBDVFTUlayBDF8uSbiqqCw2o5p4K8/yvpdoYeRVz9sYNB86pbufhKibQ4fZjYcXGsw5L9k1AyjccmD51JE46icYgYx5D+BnpMFY5W8R7+bNBKHtz+UIUHNHwEn+3nZ/LRnAFuDtREzmRSCH4bf+UtSyJc=;
	25:u3r+xYykSWhlHhUYXPTlD7XW3UTq4GJ5qxrhOMUDnk1O2Ucieq0yfWKHYxHGJTRffa18vkgIKTPtbdD3GVbfJ7ZhYTpCU8MGMkR0SPQvY+zRMGzobBZ63gga+kekfLkXJ6t5RyfKtRC8Xodq8bGfCbNdlOANkFfaSv1pfSib5azq6vbN1Vq5v+statPQojbZKiHZy7CMjVnBJo6KdRp80B2smWtddHmKYlDnUdOCZnwjipsNTUehsBH3mNyfIlP+g8xrFhS+nBsii9SIsPV2f4UOG8EeOYNaPwWC0KKtDcK2j1P1T0OMLIVSP5qORsejDoFs9oOrnr24D4n7oiayxA==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4456:|BYAPR02MB4456:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4456;
	31:sBljkPWG+CuYwzX/QLib+nzvIuO0Xga8TcX7h3mggKWhvQFHZkgVu9D/ca0hutIGaR6omITfoy3cWH/I5pTg5E/jkjJNfajhj9G/htFe3cqoeSskJaAZKTpFZqkYCnVcSDXPIS58OSCsmBOgOneNLytmONM0zPcS48kuPH7qtYOucX4csyNVnTQYg2sTUXECA7cy8SVzWdGknew52EPlc9oemkaYZ5T8Lp67bmmDLl8=;
	20:9DRUu300Z/wZZXOTSwvbXKTCuegieJviroVtXoe6eAbCv8HBM7buRDSL/TDnkXlCkfFhz/Po2P0CSzrukwinGT/nUpcTdRcsi0+sV2vUXlx1CtANWwM6UdF4zCDr/2IgpXbAKX+FXPBdXmHop/+/SpC99y9NT1LR5UOOPNt3SHe4Y1Hbl7flkqIGUGSTH+UlZ2dulJ1+lK+d/Jdcf2zmCt0vEwH91NHkN52og1CLMKRtkM0Dl9++haoNC5uByzy+VUmpppxMPvFiXDkHe3Fqx+g4Mk0xHIA4uGSIl3YL8Bk34VUsEE0LcqiVczq8oF9RkgFXWfRI6C9B7rpmeSf2pClq7T0SRBUwHjuM55rCSqqU074tgIVjCVWgNGTmYnCbzcbywTj4CyTmOvbrOUuWFW1+ehd60AnLqOVEZONxb1O6t1FkOUCpUVhJCq1ru9fcTixrVvccLfVJ4WB9PrJWoArMbExMPrRvtcRhZJ3bZQi5IPDZ+0gZB7tpVbAciyao
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB4456A2328C487F85202D8234ACAB0@BYAPR02MB4456.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231455)(999002)(944501520)(52105112)(93006095)(93004095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4456; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4456; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4456;
	4:Jj1s7Pu/l3gyhTqIV6SMBrG+LM32I49TtXK12kMjbE//Rcm+/d3NUSBce2GYbpQFyBsyeY4Mbwl+ShBGkLQ/qb+ETa4fILKA1Qg4sl62e6dqKfokSXtlnxwQRg2SZBdpvpYKYeQFVdsKI0z48blBfOHmrXrLe5dMlyQsSarPI2aDHTs8TVydVbcLSekusxPMI9OuCRQXzo/gxJNhbGH3T//sVB7p9YxHafSqw8buGPcqORxCkvRy2KC6HKVChub82zG4w9qGhieHR+5KYl5A6w==
X-Forefront-PRVS: 0880FB6EC1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4456;
	23:ce9M3pVlsdp6tFTsuVFoGsAfTDKshIR6Oohb1Oa6T?=
	=?us-ascii?Q?XlcFYQVORSzDVzorR2M5n/duG9RUbA7sWFvQOQceztHEp8RXTBCGL9eZ+X+k?=
	=?us-ascii?Q?ouvBMj5eMeMV4pjLBCCzORCbzwQXpiKQc7v9TSiYUZ9yTTEik7fupNfkcbUX?=
	=?us-ascii?Q?9rrZ6+EBQxIiC0KppUitKceYidxnBwSIXTPsAC7PFZVKQT+oT2nNLtd2GKnH?=
	=?us-ascii?Q?qVl4BU0ANZx57ETFjN7NNzC22xw/HuhbVz5qQq7HUrPHrQgj2keh5yoi7CaE?=
	=?us-ascii?Q?vb060mS4jI46pONr1+bVZFxtYWO6+/qY7FOT6Vxpek0km2Atk3Mmr5N1cUTZ?=
	=?us-ascii?Q?v8w3nyWRzgasgDB1IaAR8aIHoJvP2jOtIj/hZA2SFveWn5oOSaSMRbWXAhj9?=
	=?us-ascii?Q?HZ89y8VEHUcUzAtRMyFn/dyysEgkYM5V6tpvIanX+ydvKMBsybg03d2RGUuM?=
	=?us-ascii?Q?m5bQAux96sEVbA/NrHlEKPX8sD5iJrpnUSnxRV0BOENxLe8zIOxRUY+YRx7U?=
	=?us-ascii?Q?JxNdwA64jaIc+yuTfigqI9QlwThLaNZCHuWq7dOQIjcae29Xeo2h8/bETW59?=
	=?us-ascii?Q?XSh9+aU1O406guuTd8sE5ENcqafTFoKAcqYBYvOx68NAvycrnHRsU3SkAV99?=
	=?us-ascii?Q?s5YPjn8TP+dLLKC1JbBNpzp3Bn/kF1NwT+P2xgzs8jwLDhdUPlts9ih1Td7r?=
	=?us-ascii?Q?T1ihb9YTdHlab9dE6pHHqxe/3rsvJYQddHid/YvLpVO2dSVC5JjCv/d48/oK?=
	=?us-ascii?Q?uCadgAwg+vPp3Y/2mqRRRvH9QY/Ylwn9i1fga8Aom2fCAx4MU5MDUWztmLIx?=
	=?us-ascii?Q?iUI+brWxKuhRlab4s5/xWBHDwteCx/9InXM9HvsCCxj0MtuSilfWuWGp9tC7?=
	=?us-ascii?Q?9kMevZ8eXuhe6EsbasQqxUu78TMm10hR3r31AwAYxhZirzE5R7xKgN7/lgce?=
	=?us-ascii?Q?FifsTNGr2JuK/3LF+41iFESvmaT7UU0TdwCQvOcasjtZE15DHxAUlJnTdpJ2?=
	=?us-ascii?Q?UKiuN4AuD7qi68TXEBGHLvrBbcjuD4T4rzqZiMrpfXOroMTmgDzhPnayR28d?=
	=?us-ascii?Q?l9LmAHT9PR3rYSEq/wa/nA2QMMO?=
X-Microsoft-Antispam-Message-Info: 5545S6xhTcfmKBEklsYumRBCL6cOTpSY1aTnlhkfFwNZl8QlVQkfHqu0ili/elMd8rS7+FWE5aa/XySFKq5Ccc6E6NyTaR3wCK2JRzvmY/f0jT1UYEaCqqLZKJvF3t6n5aYAfB9WkhjEJpS9TYd2MJCRe24xwsK/18m6AN4+mqNEfroafOogGK/ijC0k5NqyVFhBPqOBn08JZbbWaTX8RI+CSI/Q84bpzSSzPxA28eRGouRZHKOTgoi6ee8n5toSeURfxH5qFreEs0IMi2bHHOzbUONwWARJvtbtQwX6tB3FJU17p3RwkXKbw2J/SbLkNh12iwv4Cx/OA4JnF/CQQkeIG4N+po9Ne44V/lLbhns=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4456;
	6:+t/dG7cQPr6ztR4hPRV+R4G+hx/V/J6f1JuGr9CzPoJZGd+yNC6sm//ecs1GZz7yWtW4Y/sPRvg87geq64z5MWZ864gntzYQrro8IjYkbKvBewOsKDgZekDwRr40bR0Df0lLXrMMYVHOEKfhUdWGlMF3mV4Gfr8uiz79YsAK9pzUh7fLaVwC2dAf3sLJOA+LP1SZ7Z7qaSAv8+2ljPRYwJ3FidfLpNR92cqWWBmPw1BD45C3J4op75mOqoL6xcti0Zb/IzKaK02LnByRCm7r8z20ySeV1ErTZvPVO5CKiFCdEDtIRHX4omyK/U0ATSKuDJlRmM3uxdU+9qA4BRKiFesX9RfQ3VXV66VfkQ64CxEuSJzWNdFnmCMvpfe4COImsHN/Tzx8jzWIzXbIOS0Sd1Ml5zfr2S7jJbglr6YklG5aUgfph6I2NfHZaPB2PVVZE34pBfXz1j1Ru+SvlQswMw==;
	5:vU2sZ/D3EC2PXRBTne0BLNXwWq+pxqaS00/noSalcJ9oEWXJcgy5m9DtsiIPge3AY4xNx56a0ucwTwMwKzDZKTbAUBthi7d3MyeFcQxkWxZ9P1Nd5EWZWo0a1jFCZF07hPWbUkumuLag4LxVq2Wts/Zm9p226PYxXyBA56rnrMA=;
	7:gLSCsq5Ttn00pCNqZjKbGXkIZQ9hJwxzJYuXZsTJp9aFXl+6MxHozsRcXRWRBx8UaspaEDj0cj3CQlfzHDHPxlMVXmpvirC95zVGpsOcdM20z8YcQGsxo1pAzpBEzBBbnrmNnk9aWrm2u6xeG6IObg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2018 01:34:15.5129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c54abe0-f85d-444d-2dd7-08d65cad4403
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4456
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4456;
	23:J9CUhHSe5gDJ8AtCcjHKpyIu/6h4v3p23MlNCP3sysSX2u7h452nOZc7zWbK18MhpXPj9EeWXPTz1j5xb5scVktzHTGbDo4EtGoNs1AlcEWoEM6cdopNjatvRX4GIsgtQPIQqzICY4+U3XhXSVwiZQ==
X-OriginatorOrg: xilinx.com
Subject: [PATCH 2/2] create_manifest3: Dont match filenames which contain the directory name for new manifest
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
X-List-Received-Date: Sat, 08 Dec 2018 18:45:51 -0000
Content-Type: text/plain

When creating a new python3 manifest, there is a corner case on which
the filepath for a certain dependency that was found, could contain
the path of an existing folder, e.g. ${libdir}/python3/xmlrpclib.py
module path contains ${libdir}/python3/xml, this causes an issue where
the dependency doesnt get eventually added on FILES for that module.

This patch checks if the dependency that was found is a directory, if it
is, it checks if it matches one of the existing directories on the
manifest, if it is not, then it checks if the dependency's path (without
the filename) matches one of the directories.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/recipes-devtools/python/python3/create_manifest3.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index f7d4587..4da02a2 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -310,7 +310,13 @@ for pypkg in old_manifest:
             pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
             inFolders = False
             for folder in allfolders:
-                if folder in pymodule_dep:
+                # The module could have a directory named after it, e.g. xml, if we take out the filename from the path
+                # we'll end up with ${libdir}, and we want ${libdir}/xml
+                if isFolder(pymodule_dep):
+                    check_path = pymodule_dep
+                else:
+                    check_path = os.path.dirname(pymodule_dep)
+                if folder in check_path :
                     inFolders = True # Did we find a folder?
                     folderFound = False # Second flag to break inner for
                     # Loop only through packages which contain folders
-- 
2.7.4


