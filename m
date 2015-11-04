Return-Path: <cyril.chemparathy@xilinx.com>
X-Greylist: delayed 3567 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Nov 2015 00:10:18 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0086.outbound.protection.outlook.com [207.46.100.86])
	by mail.openembedded.org (Postfix) with ESMTP id B589777115
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 00:10:18 +0000 (UTC)
Received: from BN1AFFO11FD007.protection.gbl (10.58.52.32) by
	BN1AFFO11HUB035.protection.gbl (10.58.52.146) with Microsoft SMTP
	Server (TLS) id 15.1.318.9; Wed, 4 Nov 2015 22:38:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD007.mail.protection.outlook.com (10.58.52.67) with Microsoft
	SMTP Server (TLS) id 15.1.318.9 via Frontend Transport;
	Wed, 4 Nov 2015 22:38:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <cyril.chemparathy@xilinx.com>) id 1Zu6hL-0002oA-AA
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Nov 2015 14:38:31 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <cyril.chemparathy@xilinx.com>) id 1Zu6hL-00052b-5s
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Nov 2015 14:38:31 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	tA4MbmpW005525; Wed, 4 Nov 2015 14:37:48 -0800
Received: from [172.19.74.178] (helo=xsjcyrilc50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <cyril.chemparathy@xilinx.com>)
	id 1Zu6hD-00051s-Rk; Wed, 04 Nov 2015 14:38:23 -0800
From: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Nov 2015 14:38:22 -0800
Message-ID: <1446676702-26773-1-git-send-email-cyril.chemparathy@xilinx.com>
X-Mailer: git-send-email 2.6.1.120.g24a00ef
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21920.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD007;
	1:01gmOEE1PuB1EWd0auKlpk+rJiydBqpAioVCSQNCMZjYcb7MeL2IBS6EA7rEjbFOFaG8kvkEzc4bSUweD6rTVqQGtMSTpqidAbzfCktaRHOpxNiuUnJ+FZ2uGmG45BXgSjgXqVeAz18T2vu8IoqWjBMGElHW2Xn2+AnnpyltC30DVS2vaq5oPKtx2NkSyMMOwqW20wC+pdj9Ze3aq2nsAAE5o8ds7xnBBrcgwMb1PYHkTIko34JhEODDMxRade03dKgTeySEMQTlTENPctMljNEQ6CWDernUHTdsW4HApzDHm0T6XFPTNVTawvXwLNRj6zIyjSeuVcN5l/H7t7TjjTAEH3isDteyo/vkVbifoyaonHJAiPHass0QSMYT2utH
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(189002)(199003)(5001960100002)(107886002)(36756003)(110136002)(48376002)(50226001)(5007970100001)(47776003)(450100001)(11100500001)(92566002)(5003600100002)(5003940100001)(4001430100002)(77096005)(50466002)(33646002)(6806005)(5008740100001)(189998001)(19580405001)(81156007)(19580395003)(50986999)(106466001)(36386004)(229853001)(2351001)(87936001)(86362001)(63266004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB035;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB035;
	2:T+3iK8mL9/RQ8oIlyxkKlBUpi/Rk65mY1s8Rhh5GbEzFAbSQwmcAQXjyH0wR5WV2p0ILrNis1Iq9IebcJxXBpJrG0TEzyqwdbCFg27FrCsGYABDhk7pNwCbIbfKeBuIm+xFCKKr5YwyiWjCDqWUBJSLP5zvF+eYTvZGIng74WJM=;
	3:SWa5K7d+jhOk2eU+Dz/fa0TvuCCr2I5AKJap9t5a3bVNw9vSb2i6KoqYbzCtHD9SpZWku7uzp649+63IgWaUvxP71LD2RCfvL3g/PUNVQi0I4vl9Z9V/WD+p+bJgxnB/IEIJTEo6r0bXrflcKnfNR3fI1nr3koCL6cxvSLL2vEj1lTe/v0UzT1F1eFPecF/IJsGdCUgkypxd1OtGxHFPo3vHRjq9R6mEHgD5Zi7JWjXVQjaREC6gcMFh9WrnKW4EOplXjKCnUGLEogkNHqfZLA==;
	25:NBnvnW1GolYJpoY0nb+mvgKg2W49uQqlEYfq0ita42hLJxeJNmXFf/RWoA7qWctuIaC5ofdTVk96nVLG2tbe76ZlUoCorWqFOc2wuM6v/ZDx8nNm5onnT5RelcfbxfeYVTnHR/+sMTdOfBBdNcmEuvV007DR2S2SsorSeU90X5nhUL5w6Vqe5UGWgmc4cv4ev6kd73ylPXVlMGvbBIXkKzcCKoltY5E2udL2qT8imMdrM1hxgyEJgBwHls6ZgRfgtyPItqhGDxsCDDwZ227ivw==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1AFFO11HUB035; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB035;
	20:XuBgZkFz66nHmazV3HSRLxNp6/o0DjETeMrCTK4r6rPs1ghphl9f6loYqUZdPIPJfA/6l9g1PHRPmrS35t36F9gTibvIaNjg4dJLB8h3DksBi5pniShV8GhpdgKrWXASys0jvS9rjzMpRp6CdbQ0/Dj/feArNONYOr7UNZciI5y7/IsjnTv5DpLY26y0zZXI7ywvTxvTckezdmfn3JRxHjzSOEZSciL0gMJE+sSEmt5fFw1WBRdZMiyYZZxBQIsI4f10MMQK/n9Lv9YuruHbr3fqAHowvpyGIMiNwEsLc+MqmWy5YM02swsN1eKwZhOadPWwmAfGrdnKWLMh/zlumkz6fTBLEDQQHaUR2sXbCDxDzL6Cp01xggFRyG30p5Nw5yckmq9E08qdxIOXdbuP1o4AkIZA/UbjKtTPTjTpjFZyQAoL2qmtNwzWqY2qZuBHb2mDExNp6+YKOzHOjY4n5St2l2znwTB9nUCrmsFcl9Uy8eAe0axXQRyPD5SDC4vU;
	4:cB8sci0W4jz+QyzHmShngGvAl9uspPIwuXLAYDuj+7c7o7AFkcp6JotD8WKIGSTu4uDB1LY04lf+rgXIi7pTgFfy3n4bPfAKn8nG+CAMeokVYoe2AHNNADgtXwUtU7cshllIiuvWg058au5abFegw0U4KqNEXJWpuUVw7tPpMqAgggc+CqzK1PO2rhX8XI2tdDuFKOFoo/KABgLa/SCdyVnGPUkXdMcME6HBh01PEeW89xcqtWYiCJEBFlSyzpdlSN94k+QxZw+xVxoy5FOZ2QhT6+q85KV+RbX+h53PmtihYDQSUf0v2HC+/fILs1khv8M8mw3q9jzReOawEvvUHDTpcI/Qd4IDcBj4rXoR8AM7pnhLKN9ysgMe8K62qEvh
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB03534693655498F79773775902A0@BN1AFFO11HUB035.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(10201501046)(3002001);
	SRVR:BN1AFFO11HUB035; BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB035; 
X-Forefront-PRVS: 0750463DC9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1AFFO11HUB035;
	23:/P4/1y317524cDmsq9as4DwzVLxnZHmaWUU1dNW?=
	=?us-ascii?Q?o7VmYa4HJP00z4XHvJeswJY70z0IPONrjwVFz6s04P/wqg5iZd2wWYrUMmns?=
	=?us-ascii?Q?MCSBQOd5Eop77r6q+9FzdRp57nQOdQtr4HnB3Y+s2hSZqQJSCMdUU97Gwm1L?=
	=?us-ascii?Q?bSwUHqGejSIqnpDRKDXkdfxLeGreWm52ocJQGj3NvV3ijaXGAyvc1WgDG7R6?=
	=?us-ascii?Q?6JMa3PmqTSGK+2wOAINfuCz557cyg86RcKwLkjmJXDBQJ76keuuMfE3CwN9X?=
	=?us-ascii?Q?+YlemN4yFnDirJT+xZC3W7l7ax1rUkVprzWeo00Yb8whE5HathTb28VNYbwo?=
	=?us-ascii?Q?j2YiLhn7emQpIOJL6q4/PvoLkRwL0ouoUyoj7rDXSHvnTPxC5WGEGMGHj39g?=
	=?us-ascii?Q?fHl4jTj1N+0NaBvRHQy0OnmzPWGp3z2u7tSXm/3g9VeDZaiGVUvnt467F5NH?=
	=?us-ascii?Q?DEoX6wL00CYOPA0jLXNhh31p2pq4W+r/bXdbHYxEDOySyZ0pyMysQrUZO3RK?=
	=?us-ascii?Q?EIAIbmmlnXzLl35L6lYCYK1MTI7jEYZeJOF4K+h5K45EfCDb1p0Duz1cS1LN?=
	=?us-ascii?Q?5JkpSUxCY48CX4PHFAkIFPRT+BaKlK067O7+i1fpgX1KTwGj5/otqa9utCVm?=
	=?us-ascii?Q?QCv9tGT/oSS2cF1M7Hrc6q8lj+lmjLrBRpq0oHfwBCyELkYJ6aGJEo7ucrNC?=
	=?us-ascii?Q?nzC1Y0wPDfmWgMBFaojAao+tfU8/mBdq/Xc/84Qu02yOuUl76EeBj8jP1tCf?=
	=?us-ascii?Q?CvKXT3gdaIqhTknyHOyBDbWwHgrw0fIquEKxSrqy+h1wUnuBXVr5WNwvSXgb?=
	=?us-ascii?Q?B3dvACT4e2SRWDOlMg7TycvHc9B6/c5bDomM+lFC/NOwPH2udqBltqK/CY6H?=
	=?us-ascii?Q?aq9RhdH1S4npBACN6vLeNehZu+ENEIgCv0d7/ccEaSTx9TLTrNpBXUVCApkj?=
	=?us-ascii?Q?xGCCVe8kf8uyXUHxRTlerJZlITo7CriHqsNMlF6ovkwuqkq+IZG25xL9bJo+?=
	=?us-ascii?Q?MZeJB4w7jOp/W8MRB3HGSWhyoPAGIKG6IalHUVncKXIx2Ug=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB035;
	5:pkToaRZqsXGOmQbN98bjGPB72t9R7rMgAK6AIFpGKe+c3ZM9wu0UT5mgPd+XlBdWkpsTlyNKVADDx8yh0DLi6wVZNavXY5NPVGd0UjQDx8shYVMVm2hSufLOmYpfN0UmHqBGBztC1hWEReL3MkoVAQ==;
	24:st/HTFQMxDYR1RKHBZoae6d5Gv5mbHesKM+tpWQnzxXqTj0F1LaULfoZiptwo2Ptt3Qam+L9OGWfn1czgnASn5BS7cLXZURIy9GyULwsqHk=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2015 22:38:32.0699 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB035
Subject: [PATCH] u-boot.inc: allow externalsrc u-boot builds
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
X-List-Received-Date: Thu, 05 Nov 2015 00:10:23 -0000
Content-Type: text/plain

When building with EXTERNALSRC u-boot repositories, S != B, and
therefore the following changes are required.

Signed-off-by: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 39 +++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index e66ffd1..52e085f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -87,17 +87,22 @@ do_compile () {
                 j=`expr $j + 1`;
                 if [ $j -eq $i ]
                 then
-                    oe_runmake O=${config} ${config}
-                    oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
-                    cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
+                    oe_runmake -C ${S} O=${B}/${config} ${config}
+                    oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
+                    cp  ${B}/${config}/${UBOOT_BINARY}  ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
                 fi
             done
             unset  j
         done
         unset  i
     else
-        oe_runmake ${UBOOT_MACHINE}
-        oe_runmake ${UBOOT_MAKE_TARGET}
+        if [ "${S}" = "${B}" ]; then
+            oe_runmake ${UBOOT_MACHINE}
+            oe_runmake ${UBOOT_MAKE_TARGET}
+	else
+            oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
+            oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
+	fi
     fi
 
 }
@@ -112,7 +117,7 @@ do_install () {
                 if [ $j -eq $i ]
                 then
                     install -d ${D}/boot
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                 fi
@@ -122,7 +127,7 @@ do_install () {
         unset  i
     else
         install -d ${D}/boot
-        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+        install ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
     fi
 
@@ -136,7 +141,7 @@ do_install () {
                     j=`expr $j + 1`;
                     if [ $j -eq $i ]
                     then
-                        install ${S}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        install ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                     fi
@@ -145,7 +150,7 @@ do_install () {
             done
             unset i
         else
-            install ${S}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
+            install ${B}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
             ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
         fi
     fi
@@ -165,7 +170,7 @@ do_install () {
                     j=`expr $j + 1`;
                     if [ $j -eq $i ]
                     then
-                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         install ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARY}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARY}
                     fi
@@ -174,7 +179,7 @@ do_install () {
             done
             unset  i
         else
-            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+            install ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
             ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
         fi
     fi
@@ -200,7 +205,7 @@ do_deploy () {
                 if [ $j -eq $i ]
                 then
                     install -d ${DEPLOYDIR}
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
@@ -213,7 +218,7 @@ do_deploy () {
         unset  i
     else
         install -d ${DEPLOYDIR}
-        install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
         cd ${DEPLOYDIR}
         rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
@@ -230,7 +235,7 @@ do_deploy () {
                     j=`expr $j + 1`;
                     if [ $j -eq $i ]
                     then
-                        install ${S}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        install ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
@@ -241,7 +246,7 @@ do_deploy () {
             done
             unset i
         else
-            install ${S}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
+            install ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
             ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
             ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
         fi
@@ -258,7 +263,7 @@ do_deploy () {
                      j=`expr $j + 1`;
                      if [ $j -eq $i ]
                      then
-                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         install ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
                          rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARY}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARY}
@@ -270,7 +275,7 @@ do_deploy () {
              done
              unset  i
          else
-             install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+             install ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
              rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
              ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
              ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
-- 
2.6.1.120.g24a00ef


