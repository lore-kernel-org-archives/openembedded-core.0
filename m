Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 17979 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Jan 2019 13:50:46 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8876071A8D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LnMVVQAeqLXycHloN9tiXU+RATCQ4xUP+fQkyHVSqRM=;
	b=hg9ACLhOApmysQnqu0gl1hwHnqN/UUzNSNNhHJVe3hI8S0eO3Xoy1EtwLjDP6IosYR9gET3Ewo+PbO03L6cSHGYHbXYZPQ+fp3O0yKa2HZTs65ggM8TN8AnA0iAjUUlmyKksj64ZxIIplsvZJiUuy1omxbeA0VAm9gbA4RyeR5E=
Received: from BYAPR02CA0063.namprd02.prod.outlook.com (2603:10b6:a03:54::40)
	by CY1PR0201MB1897.namprd02.prod.outlook.com
	(2a01:111:e400:527e::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1495.6;
	Wed, 2 Jan 2019 05:48:34 +0000
Received: from CY1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by BYAPR02CA0063.outlook.office365.com
	(2603:10b6:a03:54::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1495.6 via
	Frontend Transport; Wed, 2 Jan 2019 05:48:33 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT012.mail.protection.outlook.com (10.152.75.158) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1471.13
	via Frontend Transport; Wed, 2 Jan 2019 05:48:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1geZOK-00044l-5X for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2019 21:48:32 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1geZOF-0004yk-0w for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2019 21:48:27 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x025mIZ4026639; Tue, 1 Jan 2019 21:48:18 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1geZO5-0004y8-Uv; Tue, 01 Jan 2019 21:48:18 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jan 2019 21:48:17 -0800
Message-ID: <1546408097-27055-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(136003)(376002)(396003)(2980300002)(199004)(189003)(47776003)(77096007)(9786002)(7696005)(51416003)(6916009)(476003)(2616005)(50466002)(186003)(126002)(4326008)(107886003)(486006)(63266004)(426003)(356004)(36756003)(50226002)(106466001)(36386004)(72206003)(336012)(2906002)(2351001)(16586007)(6346003)(316002)(26005)(48376002)(8936002)(305945005)(106002)(81156014)(8676002)(81166006)(5660300001)(478600001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB1897;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT012;
	1:qRKJ4BN27Elo3YuD6KKvK2H8w6V0isbbAwxWreHl+DpHITWh/8ipDTbs2ag2mHVWw/Lm1VARyaAnphiIhocanGUG18c1+Vcf3NWQa5F4oe6oJqN6GBOui5tWCMxuYXBJ
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25c41ab0-9b0a-4468-6134-08d67075ee72
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:CY1PR0201MB1897; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1897;
	3:3EqYSUM5z+wNAHQ+jwY7R+60RKSR1IifqNZljyZtnwdbwu46+A6jiUeDIuMw80wL/aV0D+PBk1Yc8zEA3KCDZuux/FUMRyAjmVGxscde2jj3OxYRlQreTRFeczv8sLnklpNPE7BuSMonhJ58Lav3VGOuBwrNT9o4i0iKZstf3vq1ZKcEDL/gdi1CJxDAPu4sAwg7SkXtR28QBgDUBgVsCbyWCI1uOn9BF1piPUKxTF1qIJhSVr9omUgE89f1EvI6CRr4kRsVCPzKijHF6mP4NV+7cm+SEC6KmZAFrADhdKFHM2nxeFmWA0TcRotsNtKYrNit8J5uslzDhmBfoDFXJ6dGD2SUrjry7p7+YSKYsvBlccuYCycLJAiZlq9lUbQx;
	25:A7MHkjQWp0yejjnZ+PGmzjlgEAU+W59S2oUEqFDTqrg5PRSV+J7ROWWCCBx7jLG8N1nWXcaltabR4y0iXmdzb+H63e/yMB6K4RG3FZtCd/r1QnFlVwMGkSyZREa3YlHb7qM3DhGfChQE9cOxCdBChlKD+u7y3vhSqruWVjWW1rHcgPUNpeiX7llUAennshksL/+gmPsa7OhqlNfxus8iXT14q4l2ZUYkpDVXjSGhFPZjiUfigc1VYW8Bhj5yIQ8JzUm+eFLfgz5ID+3zfRtazBN+RweYKDM0CyKB1PMqSicVXst7uNj5m+m0xR5E1QCg4LdxJ4KeiVYzBCXaX/SQ1w==
X-MS-TrafficTypeDiagnostic: CY1PR0201MB1897:|CY1PR0201MB1897:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1897;
	31:5lr+GJUZPN5id7/wTpmaNmNsNn9KdAOyiRnp/zypIZGUJXPM3uJHpbEI5Ko2j9JwasWa0sNkVNKX3CTsikbyxCCoKPP1z/3pzv+fF2S5GbeuWxrb9j4sHK1m0y6nWgz4CbuJftMlO4MWqh3kqKvktCS8Aw85f1wXQEt3QKxjvoc+XdIeMcnb+VSnByYGLXAurYG3NzjqhR9yq1+kPO220qeQWJFNiAP1jZqmS/CcCwI=;
	20:5EejyovBOi6BY6YnrUvhXKDbKiPFDF0musgL/2xsiA1RG9LBpBTk2Y2MyfmbNvMQjQsXcuQ8XUMWyT4gYRCqKqx9OwCWJgn6HZnQWqOQY2AV3/g8eHClMEGY3pHxGyBb6x8D97TOGsloPxoxG7cJBPN+qZ164cP60QuzJkrMhZIJjyuDup3SuEra1XhBxn/nRPc9Sd5PTct/KsvTwHEUDxZ1Fu7+H1UABUCeRQImS4p8XxGgZPaCyApAvzMzh5sq+RCUUettbM8CBv/zsiC54zoGP5NXkLPmm08odJJn1nFUGcdkuBvjBq+LWemQW7/y+kjzfsR7btxdyKvqqHNWuibFv8+s46e/BBHbLcguuaFJs/N9U4zI0bG+wynEKMdF2QvPLUsESyqn6mtZmFKDnC6pQmftbdFz7L6cHnwNpJz/dGCe/kHc/dhNcayDswdxHSwQb33626yYv2Rv+Z4vyBnaOB/O/YmXroXdNFB3UV9HVJMSiuyJBnrW0wfJB80H
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR0201MB18979E51BBDD9D0080D1A92BB98C0@CY1PR0201MB1897.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(93006095)(93004095)(10201501046)(3231475)(944501520)(52105112)(3002001)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:CY1PR0201MB1897; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0201MB1897; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1897;
	4:PxE+Yi2c1MQQqeAlNyNMwcOvM2a55DQu+K/d9HvDbWYx5s1Wihpcd/pLLDMpVVe0r98vu8vxLo8Bc2LFex/O8XLHqdqogI/x7aNFRRVMoZMyOLc0A2MHGfdnPcrmgdAhY9uFgJp8c23IkNE52AltZrmcVoh/wo5Umd2vec0EYpVFYjx3WIo/oX2VwUmQhR0NAnlvCgptRrNkQQKPsl3txeWNbrZqswGo62e7g7mdXFvZC9l9BBU+VcNnrmEmSvc8uNFmL0kNyaHxyEQ3lNem4wtzW4swLoaCqEeanLdCELo=
X-Forefront-PRVS: 0905A6B2C7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0201MB1897;
	23:Wf/79WW4+GZmmWjaBug8yCcwiMZBzOHf3hioFFz?=
	=?us-ascii?Q?uZNG8QxCs6yP5EHb178QMbpISp3h3MmeWUfcbtqLzybe7/TJqLXkHZKU9RoM?=
	=?us-ascii?Q?xjmfecwpCSJih0wVrMBeYK17GL/AX/IwspYHMHT2kpH5dskDn5m5+NWazo5Y?=
	=?us-ascii?Q?0IaI78SG/LzqhpG2WBBUm5cR4i0+T07ttxKVV4atRZas4s+XQDFuwjpGt3b8?=
	=?us-ascii?Q?8SGy0BsWX3zmlfDa63VZuif4f+R4L4/CYlLKB1wlXT6trF65/s5KnQK4t1FW?=
	=?us-ascii?Q?py2TPFe9yANF/3byplVKG20Z0TOqKYheEuck4VYmnAXcVXWfTaKFRoaN8a5k?=
	=?us-ascii?Q?BLwV90QpPqB7l47NkD/IEqTgjrrsG2MmXg5Ea4KKdBLipGcI/S4f8srQ8NZ3?=
	=?us-ascii?Q?Y0Fu1nA5k52i0S5h0gs64xqeLFhRrnSry4qkXabPGrXYMnty+xGbBMwcaHxp?=
	=?us-ascii?Q?Gzqrao/k9SsCEEpEyq1yh01r9bMNVry4Y/8G6W9c5dv7STzFaPXZpPW1+R1k?=
	=?us-ascii?Q?kXRW02ISn8FM3q0HjbuT8gdQJieZe92bEDmBXQjh7CJI5Nxm5LnyHFLN7Udv?=
	=?us-ascii?Q?Xw1XiylNgyKR4R/tLL4OCOImvWO7SyrWAnQrtsuhiCDXijLYAFcTIV+S2RA2?=
	=?us-ascii?Q?U3HP+RGK61flypHQIMK/R9EuN7Si9V2FaifBDZaZnm/qr7owpRrdScwkAr4h?=
	=?us-ascii?Q?n0ro/OY29Vz0Cw5rpTfwny9PTwhbTYmftUFeChadLNRis6wCiNcQ2+5NAEFo?=
	=?us-ascii?Q?DBgN8x/scMdPorDHauloXThaa6tJ9fhuIxZ+bKNX0Jcl6pkpOnjZeeMzaqlz?=
	=?us-ascii?Q?XNTVd7ASViGeNW+4sh0xZic+UWxcJcTBDfMEL0JD47opsC3FgBnE9XTeip4S?=
	=?us-ascii?Q?VpaNI/FJvsX9mjB2GDBMaywhlMniuSimCON1dFmLiPsRta18ai7gyb64edVl?=
	=?us-ascii?Q?lB8qU42jNLjbVqj5xgkDYbEDtAcUWTcr9VFodeWaGVShx1hqRc/9X+ezpYc5?=
	=?us-ascii?Q?ii9KfHhbNe78i0LSLOhnLazerpAo6T86fdTI8FBiJfc3nLw+jTCUtFhdaPMz?=
	=?us-ascii?Q?uRF/GZVs=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dXTma8QliCwPwIIDD1M9f4XLI9SCKzsTvRt0aJL8kn+p3PRUNhOkZ43HfaNVrQ/fX9r2LoBsyASQZs/JBt448fjieOlRfu3SkHrhoSO69O8M7zocwwe5qGHxLrMsBf+Ar01XxzX89bXnD9VmgIVlUwU57jo387S1J/qnmtuZxcqyM13qfDX05MQH3OJB+fXt4Qd2kQKOJLqmmx9YLNxREXnrHQN6ZAzKukGGOGqKNfr9sVNmAk1MCbFveaC0tP8DG9v62388g7jK0bcLW+axUfytgmoMsBwoAnDZGw1SlgbXH+JvlStcgIuxD16YBPHz
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1897;
	6:dskVEBp/dJQ4A01ICFMHUKfoOtdN6eqpf8gSwlqqucfmCw13/RGw/8j85actxhtHnMlCPrG2b7cZRDaNcfI/hicXRqYGJ9Zbsx0nUi/b5pjxX1V4plzPASzW/8AsPNV1Pk7J7MoKwSmTMKc52z+io8Tw7+g9iW0Gi6utiKDmCSndqdxJgO92dn69GB7saxL7QD6H3kYBRIepYAtnAl/TF9dASDfQ3y0j1uHXp6h+8mi6HEy6aNuFCQke6JnBhguqgpT4YAe6XlGwLuTeyrMe1jt+0AigsCL4aapOsVUcDXrArt9xPKiMfyJpGjZDluiGlhw/pAxiSORDLw9x1p7Zn9hBU25EBI4nVq93XENuaixIaihbVBAFjY2FS9NvpZ60Pn/11r9SLbDGt7B7iEHt7iAUJuQDHG/WgdrX18GO1GYgL9VI+ybl18jM3k52jQpEfpbotS0k28H5xIHQ0T0nCg==;
	5:Q1ZdodW7gXGUZXwgjNMoOdofBXybrCw969qjExV7JyGCa87D3YpEjDD1BpH9AVdcdNqPLAxIpxPQhTYG8N0bTJJPCtARhGXIpJqavpOBiOtqVKACk6SC9ZIwaTtWZWFeSUQCrXji/yHUIiHAStLbTe3R4hh2LfT2ZTtfIDsnak1D0X3djccSTvD8SIamct2pUozvCPiTeOU9SaqMVZunWA==;
	7:WjTPDn3sNS33pNSPqaXKdSor8htVMPML/wKz5JQY3SU7YnQfxrCVskHIJZwfBmgH8rUTa0yKhU4jgMxsS1b+2vuIHIZbUyW8bCokwQkj2XbiDELS42g9mD/027mjI4Z1IPTV4pX2lZqJaBquPMckAg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2019 05:48:32.9086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c41ab0-9b0a-4468-6134-08d67075ee72
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB1897
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1897;
	23:F2/uqIX7Mi2XeBv8MVL1L46T9qh5rv6326WkqoRy7Va1+1cY7MIsVkF8L2z7HVkCMhTFdF4X2WpR5He4MnZfBwo962GVR7R3MkB5SAp9jJ+Ta62wqBcXBRmcybeS6vLjqAhzqyFCnjM4dMasMOx8Gg==
X-OriginatorOrg: xilinx.com
Subject: [PATCH] u-boot.inc: Support menuconfig for u-boot
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
X-List-Received-Date: Thu, 03 Jan 2019 13:50:47 -0000
Content-Type: text/plain

u-boot mainline supports menuconfig, this patch enables menuconfig for
u-boot using cml1.

u-boot recipe in OE-core handles multi configuration of u-boot using
UBOOT_CONFIG. Since we cannot determine on which u-boot config the
menuconfig should run, the patch limits when UBOOT_CONFIG is not
defined.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 48fbc57..2b33c42 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,9 @@ B = "${WORKDIR}/build"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy
+DEPENDS += "kern-tools-native"
+
+inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1
 
 DEPENDS += "swig-native python-native"
 
@@ -66,6 +68,28 @@ UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
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
+    if [ -z "${UBOOT_CONFIG}" ]; then
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
@@ -105,7 +129,6 @@ do_compile () {
         done
         unset  i
     else
-        oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
         oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
     fi
 
-- 
2.7.4


