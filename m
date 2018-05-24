Return-Path: <VINEETHC@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0056.outbound.protection.outlook.com [104.47.33.56])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3D474749
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 05:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jq+Sg68qDctdL5WEMVjnWQaagmykCbOdu1h1JrCe7XE=;
	b=TnNsoZIuQPF1QjfF2xJuD/0SFn+/AmEnspCmAL134VaiXDoq4/SybQ5PM/gNOy//7TvR8lhfEZq3hH6QqlNxiK4LsLL9FWBQsLJBj50lCHCVAeO7HzJxpwcATINkW0B0JzeIeY8egvP/kT+uK1Thy2xI8GNo1506o7c1tH0XmE8=
Received: from MWHPR02CA0011.namprd02.prod.outlook.com (2603:10b6:300:4b::21)
	by BYAPR02MB4485.namprd02.prod.outlook.com (2603:10b6:a03:10::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.776.11;
	Thu, 24 May 2018 05:51:40 +0000
Received: from CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by MWHPR02CA0011.outlook.office365.com
	(2603:10b6:300:4b::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.797.11 via
	Frontend Transport; Thu, 24 May 2018 05:51:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT052.mail.protection.outlook.com (10.152.74.123) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.797.11
	via Frontend Transport; Thu, 24 May 2018 05:51:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:35438
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <vineeth.chowdary@xilinx.com>) id 1fLjA3-0002P5-QQ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2018 22:51:39 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineeth.chowdary@xilinx.com>) id 1fLj9y-0003sD-NM
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2018 22:51:34 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w4O5pPC4011312; Wed, 23 May 2018 22:51:26 -0700
Received: from [172.23.37.95] (helo=xhdvineethc40.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineeth.chowdary@xilinx.com>)
	id 1fLj9p-0003rD-Ed; Wed, 23 May 2018 22:51:25 -0700
From: Vineeth Chowdary <vineeth.chowdary@xilinx.com>
To: <manjukum@xilinx.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2018 11:18:54 +0530
Message-ID: <1527140934-12152-1-git-send-email-vineeth.chowdary@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(376002)(39860400002)(39380400002)(2980300002)(438002)(199004)(189003)(5660300001)(1857600001)(48376002)(26005)(2906002)(77096007)(106466001)(36386004)(478600001)(63266004)(4326008)(50466002)(107886003)(72206003)(336012)(186003)(16586007)(486006)(316002)(476003)(305945005)(47776003)(106002)(426003)(36756003)(9786002)(6666003)(126002)(7696005)(81156014)(81166006)(110136005)(2616005)(44832011)(59450400001)(50226002)(8936002)(356003)(51416003)(8676002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4485; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT052;
	1:eypxFEhqQoBs9udSTIkIX5dR1ii9n61QVzY2hzmGbuG9iKo/jfUtJESF9600jdVcrJfSo4F2ek/D5yKJwuef+01jRkgNtvje305weRHmP8O2Umgyl8K9zPqvfoxPkCCL
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BYAPR02MB4485; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4485;
	3:zvEzCIa3iAQ+bEZrEq1VdwhesWUOr4ANgOA1jiMpMw39vhe8xMZYP4euOSYOkGkfFAqX6veSRBu1poexpw+7L3jYTZJgGzA7C0XKP0+vUCn0XfiRZ1TySOv5ItMoXbIuSL28EhkmuP8Xb+z8/J9by91dU5wYvLNROtd3d4wZ8w3/0PkXyHlL25SbfUMbOurDc7hU5PPfbjzqRTS067jg/2qASLAIG4HIilcRs3e3yiQ4dg3if7bDdDNgsMUPE4VS56YzgfVvvYX2EbQCUZDu0NXb1LYz2QPZ66NlfeaXR4WYqq9KvlmYiKiYLvEztl/OlAFKf6pFxTm7TltMuwz+pTLBCNYFC8l88P/X0r32fZ0=;
	25:kbP8XS8uDBBJ/uIqpRPGgXnGcuUXNMSOfg7FHEAxNWkh0UhLE9Q4plzhOdlbrfmigaKVZTXixV44V8NOZgPQJdswUTP9Cuoh2CeAFyTEe/v0FSSNAJCvOuj17XZ1RGqVxfpTYuJ9r8VGxxKZ18HWYwqD0Yb4FDBSDTHjhBvb6vYtRliWl9qWIn+MLgqG8jHLI8LjEjD1AMT4dA9ljC2s+HyUanRM/vt9NSl7mHwV/U9R0GxnRHIuyLMT8Z+Dr9CjWhMO3wxHnGJZhGolvalr0uVQ9jfMV8t93VSFRbsBPk4NtEE0mNeiAJ6B10+LZyhetVQ28Ubt1sw+Hp2Xswb/9A==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4485:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4485;
	31:BgrFK7WXrPBAZLEArMKdgeO3Hajf4tvAXJQAh81P4OaIPjWJQe4ggZ63ZsgAc2eLyDcNWH295AUbEzUDb2FigyQinAGVU7rG0P2M2iTgsfXoDie0hn67slw8/JfaF9Q3iZ+b8OMte3kUBQO7Qrbc0Hw79W7bEyw4wkobG8uK6GrLGJx4JAKD0pJ5AAZ9SUFElzmqOm9SG3/Ux6X4BpytMfPBMUPYm8ioC17weiw4Eaw=;
	20:05mMdEcExQkopDaMDcuXr6EFuFeubzHVcaYU2r4r95eTkZXlCHCnJtWWiFbDGn04OqruAii8NVAM8LdTLlzVhOAyzBfk3v7h3ja6r2vw8H1BLPlY/BlDUaLUpPdOCJpa8JIYYGUuSVRZqud6+p+0IZl3lAcsa8q5vWaAiyORfislBp6gRY+56yGCcxSbOzTjpR/iI5M2t4eNzefBpEweQAvGOxJ3GMdxvZR5fUHmxpe2gY2NQ3NwuAm87uJdHAoBaDK41orr+K2O4LT21XAz82S35gW00W3i4pXu/icUwCQDmbEkTfz+lbmmwVLS0mjlIUe2meDCm7ptXK8tC45XfavX0nGWqOK+DlMhkJSYzXStyfn/+oIeOvpHe4RWwR5qq8syOS/9bnVbU7D9Gopmd7WNhukmTCSkEJlaZkcmS+S2GpNMbTEy+oEIGzo71t70d6UjHf/eyKSS/F6jo2oxrJGMVWc4p4WWhvUb820WyTy/pVqGudUFfl0vR05t/WAK
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB4485098175F1854F7120287AB96A0@BYAPR02MB4485.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(93006095)(93004095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB4485; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4485; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4485;
	4:hk4Ur/ZjHxyXiimAH/szso/G+Pi6Vs1f4ewjdW1zkuQIxbQ4+fIvofaO6lVDm+bb38XspSbhb3unUyleImHOuEeXNuI9aMkRjt7nom387EayQV6C4eMsT9U6l1/NUM141nGi7D+Y8rRxt9onuNqGr2hBkT7doTRFlA8AWS5MORBjdWr0oYOo1epETu5Fp3EGzlX38Slb3wMuo5A5lXPn7hTf/DfwrZTpubrMr8S0bavmZhq777Rt5M0S70EmC8hHmWe0d2MIAj/Q0h3Df11Ih9yh22fjbqLDL9OyOPc93BgZp2BQdtSWwSHeTv/7QZCF
X-Forefront-PRVS: 0682FC00E8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4485;
	23:FXHdfyDfq5anU5F8//HeBUkVa56pMjuOA6ji5XDv0?=
	=?us-ascii?Q?Ld+i8wZ+zzh0qA+8BNQrhBoixNvpkBCI4FDR3qR1R9PaL9+e+JFh4wuWOF3l?=
	=?us-ascii?Q?aeh068g+/fRWt8z7X4KWubK5KoPPa29+GoiSwiLJA9iJF0V4ExCe1R+VigPN?=
	=?us-ascii?Q?WxHtqsxgoVaJTRX5XFFe5Jc57gacbtE8ijbJJ03DComR/bZOWmCjq3+gRPgY?=
	=?us-ascii?Q?ATUJy7NnEokugjnW++B2G3bzyszQTZq424I8CO7z4Adq9IA7+k/Vu05UwGLX?=
	=?us-ascii?Q?MlvkCzs+uAavxNgnFMp8zun5EzynToCZzNR4Ub8koo7IQcwDeFDkOEwKS7Zf?=
	=?us-ascii?Q?oM797uBRiq95F2jVk8UdrHApGmSNhhDtpav9MB1o0koDGzDseAntTQOm1EBU?=
	=?us-ascii?Q?g9mwznit5+9N5r8zr7R/UQewo0SXMZPeykrU6ClIs2UuhwxPk4cfG/CDR2Qe?=
	=?us-ascii?Q?eQh/OWRgk4/Sel9Qk+33CT+Ya172PfQ9iF89IWoxWlJpZQOrKzO9/Hu4bTYx?=
	=?us-ascii?Q?VV+eX7hBA5b12kFuNL4BjpDgg+TrDQTlRpBUlinGQ4lrYLoHyOXnRavP7GuR?=
	=?us-ascii?Q?TH+6s8u/+rW2CktngRLn2eAC9jI9yIkxDWGiSq02yLoL4yawfgCPkjlJAiUA?=
	=?us-ascii?Q?UauaAWQjrtX1kyJGoAgOskxWqXXXRclA9Jph2Tn2jQPMrv/tDYK0Ho/S45K9?=
	=?us-ascii?Q?wM/IHHVpYXVhyCmNSAuwZuDVEg5fbZw7gDBdS3k5bCglinAJQSyaYwlIy/m8?=
	=?us-ascii?Q?D6cKM3/bYvLXKqWIw2rYL2IrTFcdRUyPP0/Y19/2maj+ayX93aFX8eqS5V4y?=
	=?us-ascii?Q?ZSrdwapJdYA0cFCRieJY1/2n7m3EPKBegxcAgkqGHCZUr+RqWfCiEJgF7Sgq?=
	=?us-ascii?Q?12L1geci6A25v3sg0yIVEv3sbcTrMMpNVQd7HGk8Gu9Cpt3blhqJmG0Usm2m?=
	=?us-ascii?Q?DmxU2cZFLmXShoRypADN7DNufjFF9oKBLm++5jkTsaGazqGsdxqB+65c8pQl?=
	=?us-ascii?Q?NKwkKhr2uw57c6LEKYg/WpfHL1NIWING/9SUqRjdAyapezO2H44HkjxB38g9?=
	=?us-ascii?Q?PGqNBNQatYsYIR9UrlhZLgH5a8nPZCXODr7P5W/t0zahdXBjak44dhunJ8IF?=
	=?us-ascii?Q?gKAChN+hsToy795JQzQFY4lTbDJboZGGvrM2SaeSJeHzHlkmEhu4g=3D=3D?=
X-Microsoft-Antispam-Message-Info: k8l6CQsfQ40BsZche0eXGBnmCICboyvPqGWfznqjJIXaldPMvIVyXOGEfXMFjZGlIf3L2cyLYZos2d2DSs9ijji1o2rHXMyMhEd9WPH+9WL954lQHd/xHUGKLthOeNai1JFQK+k7B4zXsqXBYojcsVTPYLHAwMiREN6rg8rj7JqWmG4NhsxkKqG643l+exIn
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4485;
	6:TL2Th3Y1xUWlAPHHJ/sse/tz75VZZuD3tL8e930m/RW50F5TwEjI5FdFQnYSt9Lmctutx1tcQpsrid9bcXm6htLnLILuiKcPZBKOonC1tjj3qdDJ+uLhu5f2yua/spERhpxNJkZi9ZxefHKI/r833DQKI4eK7mD0XPMe3t1YJ6Ijcbxyd7IJTWB7V/1JnBeBztRTZ29G+zJqqHTDo3iqnPxalVBijvIGrNBA0VhtdtTBSoplDua+9RXCkqINcpQUHkPzTYZKFUQNIwqd8b79yuAuMV4Uvej9kLxlxRqgKbMMQU+AqTiSFM+N7zWyBWSNM6QM9NSgyABhiKsCexDqVfDb1V6gz4gTotKbOcwGWWeXND4WfeXwX1fwoVswqs6L885vj1G5lBO+4Nr5Q79kAfIllLyeiMy4z6G81DUFm9bWmm4p2pn/L2ksS6E4XabHz1UEnDj6vOytvYgaqEe6+Q==;
	5:MvzetugJiuqHkQU7n4sy9JHbPv6KJUdtkHrliex0DxHMF0UZWxwxB9qirUVczpjZwnunorLFwNew0szEtbeGgy3qrQ5EJNSxkjKrL2sthPiUXrgV62ZPaf+zwpbhAnUhIUPOTHmNTeDCTIVRROGrF6vubgPDhR1uHnaVAollHHg=;
	24:YHyt5g0K2PT5JTVw47Pk7Ul7qV2IWIPuEIAMTTUgUlxuYt2b7uNQ5D90YsQmpt0peXmcIrJBtzXVb117CpH6k2QT5Ou+INsQmgiMw+wxLrM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4485;
	7:x0yPniEo1le38xtnjVoQrDchCdRG6Uf5ReudU6m6zKksZQVSMhoE/OgT9XWldcWydGIGAeBijtRLXiAi02hUlzRKBEyQHva7zEokXAY656xLpuvOGwQBe0dNaV+cNyYMPTyCyyhl+2EE0ZDaqMrF4MZGlUNcsO6dJXgUIXLlvjPEIwCS9yK+aqmVy6Upg/OMC0hSdJ6ZBIdQOnGxituYtwcZHNi7vGYX0f/cG4m0zoBo0SKS9bvHk+/mX0MBwe7J
X-MS-Office365-Filtering-Correlation-Id: de9fb305-7388-45a3-b29a-08d5c13a6bc6
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2018 05:51:40.1834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de9fb305-7388-45a3-b29a-08d5c13a6bc6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4485
Subject: [PATCH] kernel-uimage.bbclass: uImage with initramfs
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
X-List-Received-Date: Thu, 24 May 2018 05:51:42 -0000
Content-Type: text/plain

This patch adds support for building
uImage with initramfs

Signed-off-by: Vineeth Chowdary <vineeth.chowdary@xilinx.com>
---
 meta/classes/kernel-uimage.bbclass | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 1d8656e..399098d 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -18,10 +18,18 @@ python __anonymous () {
 
             # Enable building of uImage with mkimage
             bb.build.addtask('do_uboot_mkimage', 'do_install', 'do_kernel_link_images', d)
+
+            if d.getVar('INITRAMFS_IMAGE_BUNDLE') == '1' :
+                bb.build.addtask('do_uboot_mkimage_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+
 }
 
 do_uboot_mkimage[dirs] += "${B}"
 do_uboot_mkimage() {
+
+	local uimage_name="$1"
+	[ -z "$uimage_name" ] && uimage_name="uImage"
+
 	uboot_prep_kimage
 
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
@@ -30,6 +38,11 @@ do_uboot_mkimage() {
 			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
-	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/$uimage_name
 	rm -f linux.bin
 }
+
+do_uboot_mkimage_initramfs() {
+	cd ${B}
+	do_uboot_mkimage uImage.initramfs
+}
-- 
2.7.4


