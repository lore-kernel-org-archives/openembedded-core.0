Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
	by mail.openembedded.org (Postfix) with ESMTP id 518156D56C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cnfQ8iNqs0ow+/tJ6V3qOiCl1gmpvmIG0mNvXrE4jVo=;
	b=g+0IFOu23a6Cfb1VdccHpbMnq85laK+1O/qz0+449+8tk3rtwQ7G+hM61Ghc+A48oi3GIBp+SuIpr1vRPkcAqt7HUYK3VnnjUDXHcR3b4KAJjmi8SK9IfExEVfoJGKU2+6qwmW8MyvsR/s8RWA/73erDtl9ViXtL5QPFWHyG4MY=
Received: from BN7PR02CA0004.namprd02.prod.outlook.com (2603:10b6:408:20::17)
	by BLUPR0201MB1892.namprd02.prod.outlook.com
	(2a01:111:e400:58af::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1495.6;
	Thu, 3 Jan 2019 16:53:31 +0000
Received: from SN1NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BN7PR02CA0004.outlook.office365.com
	(2603:10b6:408:20::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1495.6 via
	Frontend Transport; Thu, 3 Jan 2019 16:53:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT030.mail.protection.outlook.com (10.152.72.114) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1471.13
	via Frontend Transport; Thu, 3 Jan 2019 16:53:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:43609
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gf6FO-0001kv-8C for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2019 08:53:30 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gf6FJ-0004nH-4w for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2019 08:53:25 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x03GrN73013188; Thu, 3 Jan 2019 08:53:23 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gf6FH-0004n0-Lf; Thu, 03 Jan 2019 08:53:23 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jan 2019 08:53:22 -0800
Message-ID: <1546534402-29063-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(396003)(136003)(39850400004)(346002)(2980300002)(189003)(199004)(36386004)(107886003)(72206003)(8676002)(81156014)(81166006)(426003)(336012)(77096007)(26005)(36756003)(4326008)(7696005)(51416003)(186003)(50226002)(478600001)(16586007)(9786002)(305945005)(50466002)(2616005)(356004)(2906002)(48376002)(6916009)(476003)(106002)(316002)(47776003)(5660300001)(8936002)(106466001)(486006)(63266004)(126002)(2351001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0201MB1892;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT030;
	1:z2FbPgllzf9YMnTcj0mdTnzKiaIgUnsmmakYQhMCADLqgnG6hTpkN7t0pCDKmMEREkvJIao0gpIMI83U+CmJqgZeIUa+PphUyZKMTASuEnrUY9++pjGJDtuWhKjSMRWQ
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83009232-d316-4b1c-79a1-08d6719bfdd9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BLUPR0201MB1892; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1892;
	3:OGo0Edr7NabEEm7ALst15sTQxHqHJcZhY/BRThG1jr+UpuuNhBj5AzUBq6l0SyaTOwKsQKkcxduLnzfiuG93fXODWcc1takU7AghBg0ppNQGYZ3T4VeTdU5Te9pB/Qp67CoaUBLFUXMpg4yPC/tZSTb2YqrHmAt8KqbclYwX1HH3TXOTTKaPGdd9g+sLv0h/I7pN8Sg87KhPdl7AQjuI0T4BjejVcEjtNEZzG9ypLmTX1Zkh633LdwUM+iSQ+w7eLnnvvSU4MJciko9lz7YQsLEe+MkeVL5ioUP8oM1RdOKFbq7XROE0KYQrgdyEFa4cV9mNVoK/xVszSHM1oz2OX2v9GL9SQ8HDLoPCx1kMVYPx4GAEb8YhON0Ro0y1hyms;
	25:W1Rzx30FmOjwfS/IRtM9IGqraQxV1iDEialycJ+iTD/shBLGcwhhYGLLW/J30hoKnZkMkggc87tv4jU2UX8ipQAPDdR9GmICcLI4oHPWKp6cunqKldnQbCg0raek2Sg8Qhl4NsNiN242OQyi5cVqX+83CLAe4GfgmFiwDU9YaoII/azWAtco8JKXXHWGU3QLIvKWYbiXzq2vTLYi7TBuR013aeUntSvLVQhHRvOT2JlroEptF3WHI9cUKqBdUuck/gR1XAXyV3szvr+p2SXRqVe0vFkIutz9ELpSYAM8opYJlk+yOu0733PUU2NpJiNjifGuB2538b5RdlFaUDcTsA==
X-MS-TrafficTypeDiagnostic: BLUPR0201MB1892:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1892;
	31:Zw+wHcV5SttdGgRK7E2UXa8G2HogCsKGCX3mfFr7fg3omdO32NypznLkJuryNpMD/sNmmCBonohhR7mFJSGrXe59GikH4gmQEM/5hTS+R2OjQsAY+WmLTel/jRlEszAWpe920v219YpU+fz1dxMw7GS1Lg8D5XV+ujEucNnCb5HAjDyoBpIAd434DW9JW3IZXoaTpKHlGrYBYVf8EpFoUrThUmFFHdn2wx3XmRilloM=;
	20:MkONKz/I1Db9fkVDdJ0vKvJMxxKvwBOLKKTb6ooyaIrV9lNU93yCbxW+o9+z0ZMfH5phNo6n+fk8cP8cRB72ZCw03uPp1rWoMy2ZZ733ogN2O+q5u9fxjzE/okYHNIu/3bizVoPpRDBg4D2AmQzXrKc3tkFFP43AsfeKtuj4HNTSkeBWQ8MUiZyzzImPEA788RYay7C5Cpo4PJMX9uq9Il8k5rXrXh08BKghP50NDOj+mAs4J8icWeeda6UKTUR+md1IL5W7Uz0InuLhqouO1V/jGO9aOww3V1D2ZVHMmBU9bCGl1oH2rkkDiMXvc6UvFNz135CMrEk4X+HL1brYRaUk4tgS+tDD1qhs8d5lD8/hEczI8oWAFXIdagwgZxu2sZuVmvzeXNzfO3YM3BrOxzK/ccNy4r3g8k+kHLpiecKALqzxBftRUWv57fKna10082QYlsoxLHnIMIO99nYMvIBkEt5+SfwC3LR7p6IRyVZOi3Mjn/iWHlTfn8kAZ9CP
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BLUPR0201MB1892C0DE8DB67A6CB29A78BEB98D0@BLUPR0201MB1892.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93004095)(6055026)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:BLUPR0201MB1892; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0201MB1892; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1892;
	4:L/4VCBLycrMlADT0KixWLhnUGZL8EcsvcCQvajbGJZ9vu7tN1K2avaOU+fY6ls5OS+Ui6DkXtPRRMKsesSNrwExEYh6WB3GVMKS1e56WDfCt6/E6OyV3aiNTaqCePSaHvY079q9yimTfBlpAx/LT4DeZSNQdRNCB2iLB3/vB/FnJ9cXqpa5/RDEFgPh21KfE5g2uCzMC0pALjCXRt1wtBdc6UeFjsDq0RfOL75lNoWCoCDj1ms9WKtqzoQismRrqlCmi8ayfyltWm46dg2PS2oRLqmVEN3VtJlRIFe0lbpW19hHb0Rn3qFxepkZPBCtK
X-Forefront-PRVS: 0906E83A25
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1892;
	23:HBOxnCQKggPjxqcR6+/C7WN7kAgMEpmU/7GSw0Y?=
	=?us-ascii?Q?hwp1UusfSAyOHahtvMO00IN7KNwAj60FgiUB8pMXu5PU2NlknAuepoRnsr8E?=
	=?us-ascii?Q?5JGKhjfo8rD3Pzx2qhMvLvWjYoA9VCsFj3R8xbuDTdEyQjw1eYXDOPz9croI?=
	=?us-ascii?Q?jAk73FXrghkXkqILxMuuCLEZxc987tYa6/qInCA3ygDqnNGN8cOyhx/pS00p?=
	=?us-ascii?Q?gWaS4WsH1/l8bDPhTyNrXkeya7FT6J3GE3D+vTyU3X9/S2x+6ZvE7ZFsRdVs?=
	=?us-ascii?Q?ZaWAgHqUQhB2qjvSqRm7vtWCTokFBkodmg4m5euyJ6+PNiCRASUQAmkLMao9?=
	=?us-ascii?Q?u9NUbWZUhc44rYu4Z+LfdnnyXJ3Evkl7w0aEodh7om3cIHfSTpKHxfsUGNF4?=
	=?us-ascii?Q?G8U7N5uCZuWVT6BxXEbslxjG1swU/KSMgLSDXgHrXGbna7/lrbcHusCqG8QS?=
	=?us-ascii?Q?GZT7mlMHon/f9a4iqdH3HO/aWEgAkrHF4Kw6Skfj2XEIqrWabxg1lq8t5AoB?=
	=?us-ascii?Q?ZiKe8xiW3UnasuLPgTaTeh1vJ1csPuXPgWW8z0qBcBHz5ph5oDYvDRnz+teo?=
	=?us-ascii?Q?ATqPbJfkHktrWufsmDqWuKTuFERvySww4AW6jsrxekHNeq9NzNlu75Nf7D6h?=
	=?us-ascii?Q?8zseMv490Bvbpziey0du0RwcSKNKbexMyqwd6XYNRP5zlJnid3gMeLAM172x?=
	=?us-ascii?Q?YOHPp45QlS6CRaWS1ThGHkXd0o+ITFqsjvMd/mO4P2h+Ve+BlBWaX35WPajd?=
	=?us-ascii?Q?D9bhBGP3VlJAvdSpRJq4JtRpX/tTTOcTKWQcXdYK0z5SyfOJG24nHMdmdb+b?=
	=?us-ascii?Q?Ebk42bXc+9FJg0o1SmDLgZdan4cQ0/AvuKguC+oPY79f/p4jGSgoPFAFW4Ub?=
	=?us-ascii?Q?N+yT5N/R4Dfw0sErdl4mAVs0kWsjlVa35/eEp47rLe7BwIO7B7Q85j8ycmtR?=
	=?us-ascii?Q?jWWjRVHRkQ6/5zM+lK8e4wMWcf0uByWAFgH8HcFKcFXssrqK3XYQVMU3ZX7I?=
	=?us-ascii?Q?3gfHVZdvpIg3n+9R+V4Prtqro8qS6Nij537wNJFG/3nHvETBL/VQ/guFk2yE?=
	=?us-ascii?Q?P2+xRer0=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: acnIDBYNQRs6sr4xWXTkcJWK0fSS45LexrPothnKwgljQBFTePo2GJZDvcJTzLKN3cEuBGlRfl0QXIl6Lub/jQYO4RHyU2VfkoLzRvr7RmbUnPhxqpPSZGByXfBzRwFM9ZT4shKibTmZw7g+0ZA2R3NNNFKNA3aqZTrN83/AhpiN4SR9rFq7aq32NL0aAT7K5vBPLxXjU4GpkxrdKyiDkOfIjw802CzW/DZsFp39CU9pS1BD2RO+NhdLFyTghaLGpRj1dchsylGJs/AREr/mVb9kYL/hWS6+E5JEtMP3Hq/P/GJvKTNdpmnFI6y4mPBO
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1892;
	6:w/Qkt69tj1soap89ze9aBpjJ0bOJsm3qB0CicNx4jn0aaQ1ffGiCnn9o1I6uT0krNv2C6d3fNHWKeE4hNh9st0EiZi19X3KvFX0+ZmaJfWvVCvIWbvSDaqYXUyxgbIl2my86KlHI6ZnsyLcQBTVK3DPMvS27lpqlZwSdaigOgdkIoxw5KuieVuBtVwFhO+lQQ4OeQM69LNDTGw2Rxsvk7VXbqxzlTy7Urc8/gJ17e5NunFKcpXAVQKmlsnOjECk/QlD0phl9GXtDjcfWGlQvgBbfw4dw/TG6P7qgvrJUs37zcpWD0uUYkLL2ArP3+wAZMvLfSqgICiqofCFb/xqKJrl0BSE8MbpE+J+OCDq4UUfwzf/pfNk2VeFttp69rORXaQU/M/kbgFYWrz/Jv/E4rOdyk5fhcOVjGz8Vtglu0TucYl9qpKOU8E36VF1t3JJtBQSNQpYdTxhH3h2I4rL1iw==;
	5:/GxEB+PZEFy9OgoMIyVXKV+4fmhkbFyMMXowJBvTXrfzthQSNkH4JqhteVpw7M9M5KuIAS15CiM0NVGm1Z8utD1X8KeR6tOnz0EsJP9k9BZoGWRyNroqQ2axFRRl4WwUQGfUc4OTqYo4tUf3UP8nbgyytdM0CWHcCyf1Hxy+VWB3MaFTvGCe2ymWbP2/a9BVHQv6iLBP0tkr/K7bGrBrqg==;
	7:KQhlr2q798eMlGrY5HQYgE9v/RPlAG3oRlgYdY/VqP5oDBVtb+k6/iL1DoT6E6We+sxarj7+zZWZy5tLdVoCz1vibdgy2S18HDnm9j2QQxj0te3rKsEzAQArkO84t2i/xNRu7l3Ysc55NiPyQp+GJA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2019 16:53:31.1011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83009232-d316-4b1c-79a1-08d6719bfdd9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1892
Subject: [PATCH v2] kernel.bbclass: Fix incorrect deploying of fitimage.initramfs
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
X-List-Received-Date: Thu, 03 Jan 2019 17:08:51 -0000
Content-Type: text/plain

When kernel-fitimage and initramfs is enabled using
INITRAMFS_IMAGE_BUNDLE = "1", kernel do_deploy tries to deploy
fitImage.initramfs with following error

| install: cannot stat 'arch/arm64/boot/fitImage.initramfs': No such
file or directory

Skip deploying fitimage.initramfs, since fitimage does not
create fitimage.initramfs

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
Changes since version 1:
Fix the compare operator to be = instead of ==
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e04d2fe..985ceb3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -682,6 +682,9 @@ kernel_do_deploy() {
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		for imageType in ${KERNEL_IMAGETYPES} ; do
+			if [ "$imageType" = "fitImage" ] ; then
+				continue
+			fi
 			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
 			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-- 
2.7.4


