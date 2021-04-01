Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.web09.4048.1617297955467647279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 10:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=S0dpc5Z6;
 spf=none, err=permanent DNS error (domain: linux.vnet.ibm.com, ip: 148.163.156.1, mailfrom: klaus@linux.vnet.ibm.com)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 131H4OXm109847
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Apr 2021 13:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aHgw5Qkw+8g9SSz1eECcY6oUhCBArwEMTWocFuzEZQI=;
 b=S0dpc5Z6loe9UBd80xKEV1sAwE1TX0dyuIkIy/ofhoKRoienxA5eeUzLmY5YFS9nHyZK
 niHFMtbks/AJ19eKnSLYI+QXLv9+Ap7vmiWsWGABhKNQcUNtM3pjtxxr8Wb1UxoHTdaz
 sz7rqLj8r6OwgHH20CdnqDM8A/YSVUNmp2kATHTMuZ61oPUbPqKs2rPephkGcHDajekD
 WTS7IvdsVugPknJdtUvjdVxBQKoxwynGmv4L5hYpsC4iVrbryoiphbRxXHTd2ENnEhaU
 iu7xE9+ezHYZXyC7mPLHTM2VzyGyjWe9UXREUVPf/MKtDNHXTaTp1tbFrNzsas9mJwRE /w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com with ESMTP id 37n8r0jxm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 13:25:54 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 131HIdfS019242
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Apr 2021 17:25:53 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma01wdc.us.ibm.com with ESMTP id 37n2905r8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 17:25:53 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 131HPrf728377526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Apr 2021 17:25:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BDC4112064;
	Thu,  1 Apr 2021 17:25:53 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72B9D112063;
	Thu,  1 Apr 2021 17:25:52 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.80.234.42])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu,  1 Apr 2021 17:25:52 +0000 (GMT)
From: "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Subject: [PATCH] uboot: Deploy default symlinks with fitImage
Date: Thu,  1 Apr 2021 14:25:41 -0300
Message-Id: <20210401172541.30934-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A7LK8JQRRx7mezK7Sx81i-6InVPFzn3l
X-Proofpoint-GUID: A7LK8JQRRx7mezK7Sx81i-6InVPFzn3l
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-04-01_09:2021-04-01,2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxlogscore=912 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010109
Content-Transfer-Encoding: 8bit

Some image recipes uses ${DEPLOY_DIR_IMAGE}/${UBOOT_BINARY} to create
their images. Force the re-creation of those symlinks pointing to the
u-boot-fitImage in case UBOOT_FITIMAGE_ENABLE is set.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 meta/classes/uboot-sign.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 85304d452e..d11882f90f 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -473,6 +473,15 @@ do_deploy_prepend_pn-${UBOOT_PN}() {
 
 }
 
+do_deploy_append_pn-${UBOOT_PN}() {
+	# If we're creating a u-boot fitImage, point u-boot.bin
+	# symlink since it might get used by image recipes
+	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" ] ; then
+		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	fi
+}
+
 python () {
     if (   (d.getVar('UBOOT_SIGN_ENABLE') == '1'
             or d.getVar('UBOOT_FITIMAGE_ENABLE') == '1')
-- 
2.25.1

