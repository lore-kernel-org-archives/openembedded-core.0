Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0066.outbound.protection.outlook.com [104.47.38.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3D998746A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 06:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7bDeG9xe7fcU5F8fm3kVQsSmPtHtAcPtLSg1suAkGcI=;
	b=oGd9W5Vqe8IiWLWUT+k4kNDbXUIhsOt7sj66TPiTY75PUcrkA87rPE9bPyFWb4MSvIJ6xFy5pqfWZPnGFWV07CpiPuKvjGVA/E/WJ/Aw1ojjv7z58HrqBRe/EIZqqdcgLiRScsGulla2ubHezXoCVIxPTmK49JQahasZzWqjyvA=
Received: from BN7PR02CA0025.namprd02.prod.outlook.com (2603:10b6:408:20::38)
	by BL2PR02MB2100.namprd02.prod.outlook.com (2a01:111:e400:c74b::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Tue, 29 May 2018 05:45:08 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BN7PR02CA0025.outlook.office365.com
	(2603:10b6:408:20::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.797.11 via
	Frontend Transport; Tue, 29 May 2018 05:45:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.820.8
	via Frontend Transport; Tue, 29 May 2018 05:45:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fNXRT-0004JV-Fc for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2018 22:45:07 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fNXRO-00063K-8J for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2018 22:45:02 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w4T5iwCU020265; Mon, 28 May 2018 22:44:59 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fNXRK-00061W-Pu; Mon, 28 May 2018 22:44:58 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 May 2018 22:44:57 -0700
Message-ID: <1527572697-22019-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(346002)(376002)(39380400002)(2980300002)(438002)(189003)(199004)(478600001)(1857600001)(9786002)(107886003)(356003)(106002)(4326008)(63266004)(305945005)(2351001)(81166006)(81156014)(8676002)(72206003)(106466001)(8936002)(16586007)(6916009)(50226002)(36386004)(2906002)(486006)(476003)(2616005)(48376002)(50466002)(316002)(336012)(426003)(126002)(5660300001)(47776003)(77096007)(186003)(7696005)(36756003)(51416003)(26005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2100; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT046;
	1:BBZ4FH+rUUcXpY7TgkazYcEoxcWUzTnNq9TWvia8s+6XnimKyTSe777CJsgVJyN+JiCAF8aJU7QubEXgXfCvLID4WYPZ929NQduxwhAmVII7oCQ+sW8vhCvKSvfqcfDr
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BL2PR02MB2100; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2100;
	3:yEnsioSoTwmft4EmhDDJAU+tUWmv7cMEOqgIdpx4BEOCp3rcS/sfE0A3KvQlx0ERseX9OU7/8YlEubc43ljANBlg1cN6aWaX4P49f6fm7VNRfoVDCSuIjleUq2WZpudQy966d3pWTqbnqBSvw6KUo1h1aTq8pDBmCjX07uxB/SJO3fkOCMM29p9qPIwTbgprB5ofgr/84pwq+sPx/qsqyFL//ZM4RNrGfSPVS9gLlndNZEZmyOI6IQUIz3EV+GO5GkMMmjtDbymj2JjDUUV3q0UWGMkP8l2e1l3F9RdINQGVXUbhs1eDirzviU3q6CnyVV9Nh4rZajg8sA4sEwdqNEzf0sK9p4eYGto7G8QgLLo=;
	25:wyOZUHAoKxbdoYjGAZ9ci8jEu1hZjO7RAgIbgMJ6SIDQxjCryV85zZi23tdRl8cCYibUfK71l5ORxPKjXMa7dzXiB25AbvyanPCvJnKa6uJbs5cl1A0fl7okn8Cv8SR36mUpxZaAkKOYcyhRRTtYyF9sIkmWcg520hQ99LyTgeZsx696D1QwFwQ8guMSLCb1+VHOyJZgggunNQKL1gbhM9L22d+DC1qTPIVFweyXEH7pG1CT7dgc9/9UytSK48jFfFodSveiBKceCp7wcGOdP3/iD5vuv93RY1AU0b3yPe98CxzGQtzkO77e+kAfHraEcd7UR5oasF220SYFbcffxg==
X-MS-TrafficTypeDiagnostic: BL2PR02MB2100:
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2100;
	31:ZCGOt+e16Tx0Q9yksA+dbAdDXg9/T11BN8jPgexUa2Rh8o0uDQebkR7t3lqC8WdavdymqNBzupPsuL4wqyL2vZAgL/H20tG/LPEtk8v+WhbesSAnh0wLvw8hHoJJZkmCM1fNyCcro5G1rMHI5mu+BE72XQjtoEkSbyAL+uB96qOL1NJrgr7GEmaNJgXiIlmzanTgRHsY+jbzDwWghMdLZTyqc+H3hEy/WbRV56VW67U=;
	20:Yr0idlyJ6wPjUvSvg73BWiRsBN3z+CVY1C6vr9l1Mua8WiM+mKF8yblMHQu/rAaV+55og35KMs4Ood1UaBdECTj/JeMBRKf8uf68G3wVI15vKmVpz9V/GfAZOIBPXA0fg1oaeIPvFnnDaeb2sOTyummfcqm4dngQY+Md2rCB6CHg8Oj2NHH4TSFYDiSD5sZXjJoEGC4VNmB+dT9SdTIjVrS3I3luq0rhjWi4F3dkw0y27Dhu2tmdPD4oFL4Hg2+oZbj1KNMx4HhcM9zjfDx9r14NSycEmSMBjJ5en3iQ+oLsKvt9YpGif5zt8lcxo/ve0o9T6rouiE5fEazLrZKWO4sNbts2DuB+FdcWNXDZFT8yetzQNPJaLLBlBrTm/Fciu33I/HHtDHTfGNYQ7fD0vrgjoaovEQA0w//u57YFwSFOQSaeo+CG3eALll86nf+DiTVo0aN2FHCRnQ7JHrIihIz41K+9KoFcbfI8MY3pMAoEbIHjE/NHxGxhYNhPnKWU
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL2PR02MB21006510AFC1ECC4217F637BB96D0@BL2PR02MB2100.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(131327999870524)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:BL2PR02MB2100; BCL:0; PCL:0; RULEID:; SRVR:BL2PR02MB2100; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2100;
	4:yyQzMHWF9PRp4lfov2mKBWjfdpJzZ3rqyC8rQnMnANu8mba6n4FQDxjpk/nDL0VJaQfx/2V7LvEQE+7+9KM70TeihgbPgxAMHP1lguqwnJmpjAQf8JT2FkD5VXyHrSBzTMcYL1cf9BACYTyjb6EzItSeT0m30fHYKe9dF9FMJrfm2/t5MGIjJSCNmyA+nMluZtPw3S/dEBNw+x17LRt1u9Wo+lvDY5e3H6ERus3yuuwbuqH58YB25XCb4+EQG2O2sv2XYYPaR9MBzGNTzxKxmz2FCTmETlY4TItox/8n/XUwjBrK5KcbJuMulEKr5mBLCXzVIR7S0Wfds5K/If2zXks/iD7oy0EOfYj75O1JPCA=
X-Forefront-PRVS: 0687389FB0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR02MB2100;
	23:a8xNKoEaRueE+oW3M7CisEXBFUxFgYNKxTT1qYO6Y?=
	=?us-ascii?Q?RmjdvD4qcMbJ23cl1yHo8WwsBjk1wdiUoT/S6S2SXgIaW57dh/1lwWdF8C+O?=
	=?us-ascii?Q?mdMnnw3YdEja+67lHXb+i7SX5dioJdsvw1tbZZXDWkSw3N9FDDmgva0yY/1z?=
	=?us-ascii?Q?ksFlpuqQnW2Xt+p45AZDKhUEuuvRK4WsV1GeAS6T8/rJeEK/nZxhPp1GCbdz?=
	=?us-ascii?Q?X/qVytNIko9G1ysPeocD9SFBKNejHcgK40AjXsyptYoWHrHpRGs5Y06l2Ykt?=
	=?us-ascii?Q?5XyslmVnLOM2VbBNLVDqE1GCzIGSO8JJ1A5cDDkyJWPWLksJOdqakzIhPAkw?=
	=?us-ascii?Q?W0nr3C2isevzRG15E/MI4wxbUWI4erps2uwDQT2v2sxlOMgCMXrjT4mVf6vL?=
	=?us-ascii?Q?vvM9zP90AMZFsxPeCV0oIywUFMjYL4/Qv9uJiElqq96aePBXzAdqrAdWiniP?=
	=?us-ascii?Q?2oJTgnBUHSH+MIOH1u2ddd0ub2e5Dq3kjAmCh5wQBynpZYD8qVOynFVpIMZv?=
	=?us-ascii?Q?eIG/r3vsbcHHyFYEI20cKe+sQruZYEt4d78zyreMCpcX7k+M+EhmZRmanJgl?=
	=?us-ascii?Q?eh952zFtJ6KAxwsoVg3wMoEavH4I8zEGhcXQN4lTfN2jWPVqDfHmr0nv68M7?=
	=?us-ascii?Q?X2HhKZPXUNSpTLHmgS6ByrH9T4MxYq3EZyUURGBAouZgWpRwHzlELWBhrcBu?=
	=?us-ascii?Q?pDIvuSH3ajgP3/gLvWp325C0+0mkS9vzlwuBLppB9G1+o7LQ6lKG2/o2vWZ3?=
	=?us-ascii?Q?Z47kgNEEw3JWYTbjO81kQmwJSsb1iIotazs3KxBF6VFZKNInlcTC45IHW1/c?=
	=?us-ascii?Q?NGmE3pV9AP6FwjfS6BOwHzdFvgHoApmpsfosZrs0jf72ZYiVxSz5c6N40MPg?=
	=?us-ascii?Q?CAKIQu9N5JiDo2S35W9+i+8Rs//IrBum21qqNaMoa0EhIF3w3pWIrQ+QSLha?=
	=?us-ascii?Q?Oa085PBRyZj+t76ZU09FOYXOIbIDgFn0nr2W8tZCJOzCz/VpaiTtVw5TrhnA?=
	=?us-ascii?Q?hqbcx219fEOUKOo5cFCJGT2heD4qj0teONh5Sa7yi5lX0HBqYtEoI5OAYcto?=
	=?us-ascii?Q?tRTBrP7lV0ljKLubQYGjj6GBfVh?=
X-Microsoft-Antispam-Message-Info: 2Suzn9nJgtUMDppclMBXaxPKoeZZo3VztKJy3cyXL2bRpbyjp4/CgeGZVuSDWXnQpVtC/4xjwF+LzBv/COW3mY44XdX4ThvRtWuhfMR6CrMF9eWvzTWPs3bw6eEn82Mx7CIYQBFSi5Z8uUbkst/H5iEf8oJjr/rwulx8Vn1m5doUfU+kTT5sWAJmQC2ppfzI
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2100;
	6:/V5nb1ln1kkwyuTVTWL0n/CGH1FRHCjmkXgjxkP6PU/zQVUIkfssDiW6WueFG9Q8PATs9uvJfROh46li+P98WWXI0o2R3JO+LsKnwrXWqw735anrztjbJdzUzVX1VjyFhet/6jpKbcnoZ1NNbwuQeKsn+KudHrNtixSBuZ5mnEcUimMqpjJjuz+HGt9ecsPwmojF817iZRfan90ZA7n/PX67SM+CbWlyqBmKcmX+TxTx0/3DRoVM1qAimi9clKqglmP5WS3GI37p5zFAYPKEJS08nGEeAnhFPwVXS4wl5pSSnvMcli9Z1udvYaGZTyuimAAdiWq8YDYTh9h+iyWIIvIpFoRavjLRTTM0Q6skcna0l7sI4xuVfnxGdxKOLxhqC1cPm+f8O6hpmSWqJhLUOl0322iTbrsWBqfzLGrFbJDkeEvQKzRrkC4tSUfBKT/h+O7NOIO0zThQwqbyo8Qc7A==;
	5:zHmNNR6H5AAYQ9XFp0DtmfdKmcfU/aPMf9UEL9zMTSDUOjwFU+YDMmjxQJpRkVENKTge+QWhI0Mtjg4B3bbsBcY4P0al9lagKFJdPNiN+ug9lEpg6CigyJopCRx20C6SGR1fwgT3ihjAP89kEmgP3d5Jmaku59Hhrduumd4FLTI=;
	24:7ta8j+9TV4H5WJVfT0qLjUCamsYKMfTwdoCm7vpF1arXbyltYQVhQAIUZBwg5Cy7aZSVD0EueTv3wGvtBdufNbDmZ4vk+D3dvwy4Aqo+ks8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2100;
	7:x8ljpShtExjPjB4mLJScr8EqyM18Xzo+1qfP4Qo2sLY/BCzQNluT3OQo/gAM+8zSr7dWMFKfougTPWUB1Jt4yquFMKR17Wr/yE+WVACM1osWXv3bey1lAU3ZOjrIDgQyKtVnpRsKEe8bmp2xAkXzn+j1vjepTs7sVEmjS+Q6Mw99IOrhK1zV4+MAJY83L0LMzCiNsVfike7L4aAfDXVkJWHvw7Fl4oBa02sgN9zZSXoNHRmvmo9/UpLljFRtXS7G
X-MS-Office365-Filtering-Correlation-Id: 342bfdd6-74c4-42f0-4034-08d5c527561f
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2018 05:45:08.0203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 342bfdd6-74c4-42f0-4034-08d5c527561f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2100
Subject: [RFC] u-boot.inc: Support menuconfig for u-boot
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
X-List-Received-Date: Tue, 29 May 2018 06:18:51 -0000
Content-Type: text/plain

u-boot mainline supports menuconfig and is slowing moving drivers to be enabled
using menuconfig. This patch enables menuconfig for u-boot using cml1.

However using menuconfig in conjuntion with UBOOT_CONFIG cannot happen.
When you run menuconfig it is against a particular defconfig, while using
UBOOT_CONFIG, you can have different defconfig.

Tested with beaglebone-yocto machine and zcu102-zynqmp machine in meta-xilinx
layer.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c2bcf99..cd8b8d3 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,9 @@ B = "${WORKDIR}/build"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy
+DEPENDS += "kern-tools-native"
+
+inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
@@ -63,6 +65,29 @@ UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
 UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
 UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
 
+# returns all the elements from the src uri that are .cfg files
+def find_cfgs(d):
+    sources=src_patches(d, True)
+    sources_list=[]
+    for s in sources:
+        if s.endswith('.cfg'):
+            sources_list.append(s)
+
+    return sources_list
+
+do_configure () {
+    if [ -z "${UBOOT_CONFIG}" ]
+    then
+        if [ -n "${UBOOT_MACHINE}" ]; then
+            oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
+        else
+            oe_runmake -C ${S} O=${B} oldconfig
+        fi
+        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
+        cml1_do_configure
+    fi
+}
+
 do_compile () {
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
 		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
@@ -102,7 +127,6 @@ do_compile () {
         done
         unset  i
     else
-        oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
         oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
     fi
 
-- 
2.7.4


