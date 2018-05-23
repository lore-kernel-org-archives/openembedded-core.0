Return-Path: <VINEETHC@xilinx.com>
X-Greylist: delayed 1969 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 May 2018 15:57:44 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0084.outbound.protection.outlook.com [104.47.33.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE2F74759
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 15:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3Mt1YPPpF/FMzc+OVzjcT6XJFJkKoyxtcbhv5g46Afs=;
	b=QL7M5yhzw1e+QKvL2SvmV82JMFmZ4DC6Hrxfus24QZPGvViSH8hL7TJ3vv307ktVUwFDUiyL8nfA5BX3Y6omi+oeRfeXLkJSogTB2YzMIdKvLv0KiKrToD6H4Vty44LNwLQWsepawPJ35Iv26/NoP+yH2+4wy6K4PrQGIL/tB+s=
Received: from BN6PR02CA0028.namprd02.prod.outlook.com (2603:10b6:404:5f::14)
	by DM5PR02MB2860.namprd02.prod.outlook.com (2603:10b6:3:109::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.776.11;
	Wed, 23 May 2018 15:24:55 +0000
Received: from BL2NAM02FT010.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by BN6PR02CA0028.outlook.office365.com
	(2603:10b6:404:5f::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.776.16 via
	Frontend Transport; Wed, 23 May 2018 15:24:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT010.mail.protection.outlook.com (10.152.77.53) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.797.11
	via Frontend Transport; Wed, 23 May 2018 15:24:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42368
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <vineeth.chowdary@xilinx.com>) id 1fLVdF-00056J-Tc
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2018 08:24:53 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineeth.chowdary@xilinx.com>) id 1fLVdA-0002cM-QM
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2018 08:24:48 -0700
Received: from [172.23.37.95] (helo=xhdvineethc40.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineeth.chowdary@xilinx.com>)
	id 1fLVd1-0002bE-OF; Wed, 23 May 2018 08:24:40 -0700
From: Vineeth Chowdary <vineeth.chowdary@xilinx.com>
To: <manjukum@xilinx.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2018 20:52:09 +0530
Message-ID: <1527088929-24317-1-git-send-email-vineeth.chowdary@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(39860400002)(39380400002)(376002)(2980300002)(438002)(199004)(189003)(126002)(1857600001)(63266004)(44832011)(106466001)(36756003)(486006)(356003)(186003)(26005)(77096007)(36386004)(476003)(106002)(51416003)(9786002)(305945005)(336012)(426003)(50226002)(478600001)(2906002)(8936002)(5660300001)(110136005)(2616005)(48376002)(8676002)(6666003)(81166006)(107886003)(16586007)(47776003)(316002)(4326008)(50466002)(81156014)(7696005)(72206003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2860; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT010;
	1:nZMo6VezVZwHwoZJZO4jgmuEEUJ0E5RMPY1xD5UqWSaQy4xxqNCSTNJoUdrMueP51tEUPjlpKx9MpCP7lEyFa47WJvnPeMS/UvcWYqjwOsa17yLgG5/AH6QPLAkkKkZR
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:DM5PR02MB2860; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2860;
	3:/zirqHFiTFDb2r+G7j6U346968cVjbDgbrh8p6suuzr9lmOrpQ9C5HWVA0yUZu0lYh6SQipcL97XO9CtLV6twlrgjvUDnnefaeNXNmRkWHI9Sf2GPCibKErXRk9Kec40Dur4XB6tyOEFmt+D+mwAucd6fSLlhQL6Ke/+XhGK76MF1kcu+kxa7NnYMlqO9z+Xq/j3obar1DHq4iiaNVk3tOywPdCTYYoPjw+bo7xnj92DD8RT70gE9twLseaFdycsJj5htHtZD0hG4L537LXnxLdlOyF+RXBV+uDogse/SidIFesF/eiYJ9JBcNpbeOz4FUV6jprzFr+LVTqv9kjkDpG9x5Pjqgyh0v0DkYbVJmk=;
	25:6f3BGacr1MWeRTkZLE9ckRLb+/gNi/SqTDirYxRqTrwYFuRdAFVOdgftHEGupaKH+k9zvUWPEo9ej0mRjBkkdJMH6wShBIw78HgqUgZgx+oIKX92mBAo/VERuIxcxXjnlgd3+tl2zYXNLOpvPFG1Vxubzv63ENsX4I14lyiskrJjuAG6PMtaP+OaTfHAThZ7CzN/riu80wWJHQ/UASNs8rY1KEQB16mTCeHGO3C8Zx+BFIClNTYNO6gGIBwOZ6AE22s1ooX8x71fnPVyFUT3qdyMnQj7XGwUOOEqekVsG0crCUj4z3LKfwPssTmQeax5pm3DVxM9XH06qarApiLFEw==
X-MS-TrafficTypeDiagnostic: DM5PR02MB2860:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2860;
	31:WJVAo9ZC8n4CIvUpqsylQ1OVjuT3IyhaB+XYVPz9KZJg1uuZQBoD0iK3svKblrFvQCi6XKiVr3XbKUFSyQrYNVmagYVfFlho33VbAN0Xxw569iI1HrrW1hS4Z+NZHIgPiTyzlyGLuTA0+DD/T1ofANHaRcTjcybbxUv5oywUuMFs6eWjgufWjDwYfi+uF5+l9nE9YqyKdwXXRNYUWykqw6S4/0JAGENDkxA3iTQXD/U=;
	20:mF7GHDyfYj5ak5ygfWWP3pvtp5j/N6Llbclq4SA/LIf7ohcsdm8/Yd5aOL4AEmGe1T7cJfFR2oIvZuW3qBlPzzaA5lCmx+ekvCSs2aHAa/NIejg/7xjth1qtKDugh23LWJP8sXUDf+bLpXw+OHqX4piZ9nwLMTdIG33mD8PytrJJWhjmiF/J3BUPIbLVdxgz54rYC+fiTu6IzvdM2dpdI+4eNF48UkWR7Dq89IZBQWkVMM+rRvxtLPLx83a0LmTgMJOVv+5zozBm7LBo/A9QxB2xJkuTbQkEr/6EdQ+r2uqKA+7EF1wJWEdPj0iYtNi3OR8XRaPaOFZAFBEBuHkkBNhs7JHoLDjOiR2dBMzFZkzfmpj0N1kTCEhNiIlaigO9YB3t6b9P+7UnoROnEv2zUqT/5l59JQmXx03/gEXTyrTezVa9q28Q9HCOUjkAY3VZ4P+cEXFc2wEl1dZ6/YfGSqjfJt+XFeTJ61KSeZZY0D0Gfqygl9t+44sIyi4iPlOl
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB28602B0F8D7A222530741424B96B0@DM5PR02MB2860.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(10201501046)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR02MB2860; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2860; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2860;
	4:murbtisOKSCrsWtW7Jk1Twlx97LX3ZuypdXwP6k1e+ckwOUWXAmhW6IjPrFQhoa8rB3AEgPxBm/QxvIT31XutywImxfR28gadvr/LSgi7lcRPlNkZq7azbsXRoTfER4rgjnj7FIn72kvMirFl/+FmsDyD5rQ1BIy8jRUJxYwPJrK0R8zdq+KPfJ2J/vdU7IJw9Sa7YpqcPrQP/TIw6a/mWXMPemAzoFm4vZ46MCquDUSvm5+GkuEIIuwLryxLV3dv43sYk7es7ztmr6+DB2KJwQEM+InZRnySnYe7s0jTaN5IReu8b7VcjZ5RdWXdVa+
X-Forefront-PRVS: 06818431B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB2860;
	23:mOO4OG+V+OUYulE4lIxa3PGrOllivvOnK/Czlq8kY?=
	=?us-ascii?Q?7e9sGE0YZHls35xo3SiBqB5ircAv0EV7Jl5YSnxLcCz3K0HcN4+Lti4L9VaG?=
	=?us-ascii?Q?+KT+uftmELL+SdmdjwPvl6bnCqgfsfMT4YGoqIiO5iZ4ihgHnzNJOvDSvKkZ?=
	=?us-ascii?Q?pwiX6m7Q743g1spaAfX8ILFvtuk0J5HTdnweFImHWYj12IkLcOVYdzdlYPn/?=
	=?us-ascii?Q?nTwtzb/44grL56dMF58SgIkEcmPRejJR9rEMTV/vFOWly3J5XgkWBv2Ax3px?=
	=?us-ascii?Q?nwX/L0i7xja9nt4sE4EG7cM6pisqtobsWwRCc//Xo8DIq41lG1sxXam4fkeI?=
	=?us-ascii?Q?y93OkvQIj9e8rbe7XLTNJlQJzTsqvdMM8snn8/R+PVdwW91i8jAZKq0IHzEy?=
	=?us-ascii?Q?7wm9pFGAAKCSYpebeON2cPiqGRAHCY4NdH1rwsW0aiTbZ8rRndtiEaP/+ZnY?=
	=?us-ascii?Q?Zdhrz/1W0IGqVSCffkDNkndmPDnTJhQhKqm8nL1lC6zKcdxpin/n0QYwTsm0?=
	=?us-ascii?Q?+wGUFZtHi6BdXEvA6wq3VGP6mSKRXgxQ7bDaveBaW80og661g9kUpYC6WueE?=
	=?us-ascii?Q?Mlt0pRYgvexMod/ovKX9bqGkgNdaQ0Yf4uUg2YxYBMjyzetKdGSDlbXF5hmw?=
	=?us-ascii?Q?NkPfXfpiEojxuvXoAhLslF1fiuPjBaTYcZoAgGp5fJ/5XgBObQ4M0Lpk5tzs?=
	=?us-ascii?Q?KE5W4SoGqZY6t1YsiXRezCOND2qAVbziClYZUXWdbNsfpP0x3rBbWN5QszLB?=
	=?us-ascii?Q?fx4r199lAWnaTJ05d6ZOUMGSxtcWO/jTSQLhi5Hlg9H4fK0qLVG1nSI9YizF?=
	=?us-ascii?Q?IZWfH4Wex6hLn0MxFHixbmk8hUsERTPjQIqwpQwIQNgX4ZlSPEOSaog62KIK?=
	=?us-ascii?Q?yseJXn/BHXhTWd4/C7oMOF6ZaDzgjjDNBObPHUmxiEfT/fkZXrGbK+1JrXVm?=
	=?us-ascii?Q?BTnbDNLUXNBmMbVA4ky6yLVswxJpWwm1PRJGzm9/RljNsLCw4b4rnVqO4eI0?=
	=?us-ascii?Q?Z/y8hwZVVrXDIsnz9G/f5gqcWnGk/2RHc67Gaa9sj+Jl6oC/3Pjqp5RByZJ3?=
	=?us-ascii?Q?3aNgShBZs7ojcx55fVXkSw41215RcqpB/2F0FX95XkELe5xBsjZcqLHbvu2i?=
	=?us-ascii?Q?/jxBSl7Zl2H7nqz7dAzYhtvBCkfMm6M?=
X-Microsoft-Antispam-Message-Info: aUpQQgICX1FAuI8QzwTKvvmaJ564jx1wrgeLdY4XqmsjbWpqcxPKv7PnS2HO5/hh74gTU4DNpdlJRjbbRIU+dKGSqIT62s8TxioQwFYduchhLbprSwN6U/x04xE6K18yCCPWDR/K2QMBP7cEC5kutkdR+hnyONfbpZb6Lye/JVn9EVEF82a4Lr0+KfWpoxIk
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2860;
	6:ig7QTPIXLH/s8iAVTt638yWqb+K7zNsAOH3ke0Q0pkl39nq7A+xIOUgnRzCm7u6m3rJfx4psVZLOp/jmmppMn6KlqpcX+gjWsHCrUEH5m12SxlbFKloz0Xs4rjn3yJmUm+XKA3Mj9p7jD7iVFIEG/K3ZLN1fLkEXgvr9DMlkkR5aBHBfVv1pwjkZ2QCELAghbz9wu9raK5h3bB1PLLuLW9HJdrZflBbdMBTaB74pg7m1mnrQukfQtkFhNfTvEDgQ37KI/NTzeOSbSIfjpmLIS7rV+3LKPsn86RZlTn/jKYYlvXb3hKXxvmz1FookwcDB6itKx9Dyidwe7o2KqM89+jsEUidBsK5I5FCTv0HwJyULuZ3j6YV+C+KCWyv4NzVLfKaXtSaUffluM0fenqAlZw+kH1i2q7E/cgwDxjzUrPcjpyBPwCxntPCw1sX6s5Mti1EsgM/KuSxcD1Y/IBRCCw==;
	5:V+liZr0wU/u0/QKMcUOrEkNs2a0eCLkQsmG0RrXhM40ksbGKYryssK6eFKDO0u0A8Jl7kAkOXF+2bMIgbxxEMuxaAQbyQquasPXaeAf8fQ4T8NvV1KTEtUPqjqnXEuGmC1GYpdvgJ6cM6ncDd4mCcP2MXU2u+OwVgtiOXijpmTY=;
	24:tVG25a1Hbkbi4VlHxMiYEKl/Z2lw/2l7xbx/6F/rD3JmPZR/vv612NF6YK4F8VUonr8ET9EN8dBrlxxnx7HuYVJZYsjfbdg7j/2uQHWj3wA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2860;
	7:UWMDol4JlUsgELty8Dnumr+S7lrcthodLpljPKKzTFc/iUkhOckoO7bkRhdPDPPKv+gapR7AxAiFC4Bn98cLlV5XQunANEsbah9CpRRGTTvT4uGZIUK2mDkhjkqW7QZanJPHh0D3bqSrbYXSJuYUhIxNePv/m5KytrfC27RtJGgokSccBgh+l0IUcZai6pt/q+8PmjXv/n/2voD7KAxap5H7lanfiaUfWNLdzGftXyvpky55NnWQWgPHiwWuGAUZ
X-MS-Office365-Filtering-Correlation-Id: b0379b32-f574-4289-a0aa-08d5c0c155f7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 15:24:54.4587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0379b32-f574-4289-a0aa-08d5c0c155f7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2860
Subject: [PATCH] kernel-fitimage.bbclass: Deploy fitImage without rootfs
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
X-List-Received-Date: Wed, 23 May 2018 15:57:45 -0000
Content-Type: text/plain

This patch deploys fitimage without rootfs
(linux.bin + dtb). This fitimage can be used in
case of rootfs on sperate partition.

Signed-off-by: Vineeth Chowdary <vineeth.chowdary@xilinx.com>
---
 meta/classes/kernel-fitimage.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 50a91e1..7b93680 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -464,6 +464,9 @@ kernel_do_deploy_append() {
 		linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
 		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
 		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
+		fitimage_base_name="fitImage-${PV}-${PR}-${MACHINE}-${DATETIME}"
+		fitimage_symlink_name=fitImage-${MACHINE}
+		install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${fitimage_base_name}.bin
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
@@ -478,6 +481,7 @@ kernel_do_deploy_append() {
 		cd ${DEPLOYDIR}
 		ln -sf ${its_base_name}.its ${its_symlink_name}.its
 		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
+		ln -sf ${fitimage_base_name}.bin ${fitimage_symlink_name}.bin
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.its
-- 
2.7.4


