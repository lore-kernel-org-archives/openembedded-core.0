Return-Path: <VINEETHC@xilinx.com>
X-Greylist: delayed 43994 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Mar 2018 15:59:39 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0059.outbound.protection.outlook.com [104.47.40.59])
	by mail.openembedded.org (Postfix) with ESMTP id 287F56FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HJUD1kjZbRgu5Guh/MZa3Qnmr8wsPVa4sA01ZtMvfPs=;
	b=NgR689isChCiPQ0adKrh6YEyFTJGqIhO65OoEoRYgIfPZFrbipmd59xNR8gSsCt8sV/RmtbnJoHskCB8MAY23WFbhb2YUH+/MbiKidDnq/9b3XiR7G3STgDAGhMY4vvSA2sGt1s44wf3jPjzGi6kp1LsvvCpo/L/kb/Q2go8vTA=
Received: from SN4PR0201CA0021.namprd02.prod.outlook.com (10.161.238.159) by
	BY2PR02MB1298.namprd02.prod.outlook.com (10.162.79.17) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.548.13; Thu, 8 Mar 2018 15:59:38 +0000
Received: from BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by SN4PR0201CA0021.outlook.office365.com
	(2603:10b6:803:2b::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.548.13 via
	Frontend Transport; Thu, 8 Mar 2018 15:59:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT020.mail.protection.outlook.com (10.152.77.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Thu, 8 Mar 2018 15:59:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etxxB-0004iY-1e; Thu, 08 Mar 2018 07:59:37 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etxx5-0004xW-UW; Thu, 08 Mar 2018 07:59:31 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w28FxTGq006766; Thu, 8 Mar 2018 07:59:29 -0800
Received: from [172.23.37.95] (helo=xhdvineethc40.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etxx3-0004xG-8C; Thu, 08 Mar 2018 07:59:29 -0800
From: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
To: <ross.burton@intel.com>, <manjukum@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Mar 2018 21:29:09 +0530
Message-ID: <1520524749-18647-1-git-send-email-vineethchowz.chowdary@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(39380400002)(396003)(39860400002)(2980300002)(438002)(189003)(199004)(50466002)(4326008)(305945005)(356003)(6666003)(316002)(77096007)(26005)(72206003)(36386004)(336012)(59450400001)(1857600001)(36756003)(2906002)(107886003)(2201001)(48376002)(47776003)(50226002)(106002)(110136005)(8746002)(106466001)(186003)(9786002)(5660300001)(81156014)(8676002)(81166006)(7696005)(51416003)(5890100001)(63266004)(8936002)(478600001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1298; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT020;
	1:Hbd6WURB11H9VvHLwU7EFWokGzRYauWymRfThrSbbeGttyZwDCsYWI2TmDqL8qpg2MyPZEEHXRXXcR4EEdk9rwFZGc4pqW8w23OshduFxyLJEEmWZrvd4lfGNBlTw2Bk
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eed1c5c-1709-4c54-177e-08d5850d986c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BY2PR02MB1298; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1298;
	3:Ove4aYPmClRJAZdNNavoSx9lCdLUupnAknd8sZqTuXT/avxchh4f8XV5AfKhk6IRriOQYejSRlH0SU80RxNPuj2J1ZbOvk4UfVZlRi+M1EMR3yHn1guV3ZiTmMd5mdZJ/AiQXTM1uNgcWfzrAmJ8TV0j832eFPtkrS07nDIppbTmd1rKVGngyHj/dctUTDGf9jjuzCTsvbL6nzny2MTVUlBIXjMkw79IJYJ7V8TcCJkdPl7STP/ynW6SSUrX1QHNX02gD1OHylfiJ38+g1neEOHr5LWiu/zqg+f4Fs3o7iDeivQKA3f3H3T0L41Oa6B5nVovvZpuJuMbesfTUfzhkR9L9KQ7ky4EjpFOuSHv+5o=;
	25:tGUVk85M4qjYFOz5VQ0TMboOhQccJdTDlE9Z/LzWP8EQOaWVUBAR++IVSEvYyN2hfFSG5rxC0eOr6lhfUXOs7EgLsMBcyiBz4iZ+gH1VOQqXmtH4xSt5fb8PXrKyqSB4Hv/TmAlkrX1RacU2utL2rYT6r5cNZAbaXYVW7TqX7b/rX48vS93pP5b7lC1zgL/8bTVJl8sfI0BC9eqBjetGwmrutRsa2+LV/LqlbazQr+N4jI7kXP3JRJniRU+Oru8/EQpa4J0l80Ij6bYKOf6z6uINCiG0C1sBAWkoQyHHeICUB6MTl3WBplw+mgAs6apZdeW5t+kTwwaIlYkN46TV9A==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1298:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1298;
	31:0K+RkqD2Fcfjl4e77VnbY9VXo13lz+bHSGVzz3mnB1FMWDbcZEE4hwEir2pwvaA0YLyW/gk5bel5uz+2hdfmcUWVRS1GYiohLS5cW5PV83l+YRP5DEXWRtYz+VxnJlzPIdptRghI+fTzOJ+W1xQETi5Wh7KarPERI6U8D497MEjkhCSujqreSAQbCotcIr9zNeafQbLHOW7Lc6ALZ/ODmkmWzpwk2d/Vb2YsaKPYmVg=;
	20:3IjElmCdolfDBAFs2odVEqczIirioTE3Wo0DpnKeHeCMFrFTJ4HkAjpIZsCMr9JmPC+IHCsxOpR3aOrh9GhdmI10u6SIaxVAqmcK1C8wEI+/BIljJBgARF/AmCh5co5cvVB0Nd0nPINGRmHB43xRoTVUvHz+JCHZeZvwfmiHjpz43kjsG3zqoRhZ3Dre65NL2+kYltlNWYlO0pNLuhTXO8PDbg1VHvp7e3EIxxzenzyUfFdYYi/yOa1k3LQ1M2jlswp+MX/+Zzg82Kz4O/VfAu1t5JQaa6lStfrkZos9PqsuSFE3xKtaRxuRhO24CkvsNkSWKvWZnrc1RGZppY8ju5z5Jx17lkYHCDLk35s6EMqGO6KYLRpIz18aKo/opFp3VpvX662z04njtIeS9fMp2/bJidy1znYIBldAp+3vKh5JGImhBhyo0gE4WbfLsXk1O9ev8fbpvlUDMHLz0iGHbbHkGoYfqgpCoE0H0VH+AYqqrUPq3N+hyvULZm78XG5z
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB1298E68F4DF348A91FBF0DB5B9DF0@BY2PR02MB1298.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231220)(944501244)(52105095)(3002001)(6055026)(6041288)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1298; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1298; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1298;
	4:vTIfSVDA9hlsyBhrMchqB6HLMREFpAL2aT58VDyUbuulZM0fWKZJsumxny3E3zTmFkUZyd6z9UN6w2LvGjsopDl9gyWOImEumrRLceV7cGcYoFNLTRy2MU7WnkMAVGNeQeK4jsan4a4jpYKWVoFyn5CQzGX+B5GKRJ77/HUwpQ/w+wiDUbrBPQ0Yt1OZTFcjtINaVPcRj6Eu+YF9XISHwUO4eV8bbB4PT7nCc5LEsgIx9I/tW2KBUdnD3RVzmyZj4ajTwX1egHam5v0Nrc2PW8i0GGlBXbmRb5l6EphjfzHGowjMcGVmPCeWtj497vIb
X-Forefront-PRVS: 060503E79B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1298;
	23:jHVe//ESTXjPflaN0NXfboMqASE8JPFkqHk0Tw16/?=
	=?us-ascii?Q?N13Csx4CKBKvum3qDQ/J7Mbo4gJJkKpx+JTJNuQAeisymvs7xkrGzGFQNw7k?=
	=?us-ascii?Q?zt1oP6zK35xiaQEQj5XIMVQN4kQZR3YzQbippkcCyrBZ1P5u68RXJXKVp7/u?=
	=?us-ascii?Q?s7i74hgG92glnKANLbEMXqzw3pg564m+U6QNOsgYX0Xdt897L4XHe8cZGtM5?=
	=?us-ascii?Q?u9f4a9y07JOirLjfSGU2Od96MrqIHzF73/kHGA6Uunwh7n3aTn7mLPhWfgXf?=
	=?us-ascii?Q?EJYZcE1cAaQqIsrZnPFYvMXyKjuojeuS9t5juiMvhL9Njig/pGosLx0JSxCw?=
	=?us-ascii?Q?Sl21EBGg7b+1tNxOGFMRZ9tYgwljB1+zxuRVqZFLnazGUoT3fqwbL0PB+qf7?=
	=?us-ascii?Q?o9Qh06tRaI4475sUDri/z9TFEbrFNpwUNcZtlp0WwWPcDUVyj1nmUKbWb54F?=
	=?us-ascii?Q?lp4Ax70Inf2jxthFYchvLQztz0BG6LbXuDkPDY9S1P0uAHJZfZd+nEuWYDsV?=
	=?us-ascii?Q?bn/qoy1brCTqg0OZCJPuUzD8pKMSe+l7VM/UI4Z7psdkmaYRgsdrYpBDjz8L?=
	=?us-ascii?Q?/hs4/cI3qgLHk96md0hvZ94BAc6cwfrZV85G+hLa2XDvlUvVCezgV8vLbsrX?=
	=?us-ascii?Q?P360JVSPgsvLBCYY5bXlhPdRfOUvIu8uKruljHP8onkmNra8P7k/ezuWNoCN?=
	=?us-ascii?Q?4kDxUfouFzg7APFgDYxcXtuU4EpyE5JjwExNf26B6qsC4Ck8vd0KEQ41UyVk?=
	=?us-ascii?Q?iaTe9rpU4C1x2NKz5FefHP6lGl+9WLn/DR/2nWpT4i+BeB+02JU68liSHnb8?=
	=?us-ascii?Q?DAXMKJ94LPZrEMMFoY3LQgtys9KhkOpjBShQjfzKI252qb0wmdzOj6DbhEY+?=
	=?us-ascii?Q?c7WB3XUVJyJvz4cE/6285k69BFglHjcOEtiQFCKdwOgguB6ZiVzOYoiLd+H9?=
	=?us-ascii?Q?jVbspCU+HcrbQ/ZoXLrnJTnE4qtNfyUYJIrntOro+M7gJXRkFsdECUka7Cll?=
	=?us-ascii?Q?TEDcoeMNKJv7eERlwNslhlBXGUQBn+XGC8Cs1THQCaCjAIJe6ayKyrfZBYXh?=
	=?us-ascii?Q?6WTw0+PlWoIzcHND35wHa7p4s2s?=
X-Microsoft-Antispam-Message-Info: YMyXv6spRDuRxC9vBBovFgePrP3dqGWqvFX48WrpR9+YCsfRgVSFCWsdCKX0Z9C5Lh/pyUWD3sjWu45igvxLVYEZAI1ys1yh9WPFv7x0nuVcOfRi6z8Evn8BfwJ8jn4xuP4rNYHr98xQuo0C52ytSnFMgr7iWNz1WEEVwPUrYsXY2JXkJfFLXbzl0qQ32TCL
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1298;
	6:nTGQ1xfqPtY1L6koSSVmFQ21+MnLnWdJb8S4ZL26xvo0TJ5xDK9aUr5g7jdrChZTjh0SFY1eA2DqOGU09jLzShKdvRCT/t6j57QzcZqPbxdiQEljoW3Gch/xWTThQQn2/e8PX4o/alEd07Lw8f9lNa4mRTC/53H4GHjwNRQCd+HTM1vH80NSWn/R45W62CYzejOHPkHjygMOmdvPmkbPskRpeS4VuJfEMoqlr9AdiOzyS4lnoYhcwN8+ZzlJBEQojvKUXxpZBvKWgU/vhPSQ4m27dRKat5elT//7IEdIODCEtQeO7WITAO+QQhcAila2/e7PdLvl5zYtCwvq8u8A0fyaSrFg9TXcCsDcxHyUIS8=;
	5:lWbkcEMFcdXAtM0DnZmVRKiPT1qq5r06d0lRJZt6Gn5J7zQVsEZx6tIerDB7o/VfZJGXAkvGILnCheKH9KGl1R2qj/9JB1gSaE08HawoliBtL2xvKvuvWkxcYgucME3HLJZx/Mv9l4Ucv4k+0K7/l+FrOiuzOiTddt2dIQ3lrh0=;
	24:w2Kyvz66EW5jIE1UlhfSDfHNaPzLt4be6FjruKdoRYiY6MTXE6wtMXix78vwiXOkXQKqoDyNX6ajDUzYS88M4L32ebaGnKxU/9CFLORdK0U=;
	7:4tv2eVIEWE+6OqMkvxSHbOXA3V7X5ulHA6xLoLikuLXOaKRKyY2eqW/nXUuf9Ondqx5zXVKu1XdNLfB/BOmGqH9iUDbc1uAgb7C4p8ENLZt8hJ+NkuFhhQY6hszk7ufvt88jwwImTa4ypFVNSyzDTlVjyHLuGbqm1RuUcwS9fUJshHp5wlYryssN8FysrDqU9V3LFL+GPxPREArG6kHT3bubFTJLvdisPb1IX1mrKG7eEvqvRFIXb3OXZLGBaDaH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2018 15:59:37.9364 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eed1c5c-1709-4c54-177e-08d5850d986c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1298
Cc: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
Subject: [PATCH] kernel-uimage.bbclass: Build uImage with Initramfs
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
X-List-Received-Date: Thu, 08 Mar 2018 15:59:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds support for building uImage with Initramfs.

Signed-off-by: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.co=
m>
---
 meta/classes/kernel-uimage.bbclass | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimag=
e.bbclass
index 1d8656e..9e776a1 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -18,10 +18,18 @@ python __anonymous () {

             # Enable building of uImage with mkimage
             bb.build.addtask('do_uboot_mkimage', 'do_install', 'do_kernel_=
link_images', d)
+
+            if d.getVar('INITRAMFS_IMAGE_BUNDLE') =3D=3D '1' :
+                bb.build.addtask('do_uboot_mkimage_initramfs', 'do_deploy'=
, 'do_bundle_initramfs', d)
+
 }

 do_uboot_mkimage[dirs] +=3D "${B}"
 do_uboot_mkimage() {
+
+       local uimage_name=3D"$1"
+       [ -z "$uimage_name" ] && uimage_name=3D"uImage"
+
        uboot_prep_kimage

        ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
@@ -30,6 +38,14 @@ do_uboot_mkimage() {
                        awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print "0x"$1;e=
xit}'`
        fi

-       uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}=
" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE=
}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+       uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}=
" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE=
}" -d linux.bin ${B}/arch/${ARCH}/boot/$uimage_name
        rm -f linux.bin
 }
+
+do_uboot_mkimage_initramfs() {
+       if echo ${KERNEL_IMAGETYPES} | grep -wq "uImage" && \
+               test -n "${INITRAMFS_IMAGE}" ; then
+               cd ${B}
+               do_uboot_mkimage uImage.initramfs
+       fi
+}
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

