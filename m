Return-Path: <anoo@linux.ibm.com>
X-Greylist: delayed 954 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Mar 2020 18:25:08 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB5E60C6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:25:08 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	02GHpVG7018597 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 14:09:14 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
	[169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2yrtk6x6ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 14:09:14 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	02GI1wmn032153 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:09:13 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
	[9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 2yrpw61xka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:09:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
	[9.57.199.110])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	02GI9C6p47251880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 16 Mar 2020 18:09:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEA7EAE066;
	Mon, 16 Mar 2020 18:09:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74223AE05F;
	Mon, 16 Mar 2020 18:09:12 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 16 Mar 2020 18:09:12 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 13:09:10 -0500
Message-Id: <1584382150-6636-1-git-send-email-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
	definitions=2020-03-16_08:2020-03-12,
	2020-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	impostorscore=0
	malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
	mlxscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 spamscore=0
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003160078
Cc: anoo@us.ibm.com
Subject: [meta-oe][PATCH] bootconfig: Add recipe for bootconfig kernel tool
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
X-List-Received-Date: Mon, 16 Mar 2020 18:25:09 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The Boot Configuration kernel feature provides a tool named
bootconfig to add a config file to an initramfs. Reference:
https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/bootconfig.rst

Add a recipe to meta-oe/recipes-kernel/ where other kernel
tools reside to build it. Add a native option so that this
tool can be used during the build process to add the config
file to the initramfs which can then be used on a system.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 .../recipes-kernel/bootconfig/bootconfig_git.bb    | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/bootconfig/bootconfig_git.bb

diff --git a/meta-oe/recipes-kernel/bootconfig/bootconfig_git.bb b/meta-oe/recipes-kernel/bootconfig/bootconfig_git.bb
new file mode 100644
index 0000000..8b8945e
--- /dev/null
+++ b/meta-oe/recipes-kernel/bootconfig/bootconfig_git.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Boot configuration kernel tool"
+DESCRIPTION = "Adds a boot configuration file to the initrd that expands the \
+kernel command line."
+LICENSE = "GPLv2"
+
+inherit kernelsrc kernel-arch
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+EXTRA_OEMAKE_class-target = '\
+    -C ${S}/tools/bootconfig \
+    AR="${AR}" \
+    ARCH=${ARCH} \
+    CC="${CC} ${CFLAGS} ${LDFLAGS}" \
+    CROSS=${TARGET_PREFIX} \
+    DESTDIR="${D}" \
+    LD="${LD}" \
+    O=${B} \
+'
+
+EXTRA_OEMAKE_class-native = '\
+    -C ${S}/tools/bootconfig \
+    AR="${AR}" \
+    ARCH=${ARCH} \
+    CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" \
+    DESTDIR="${D}" \
+    LD="${LD}" \
+    O=${B} \
+'
+
+EXTRA_OEMAKE_class-nativesdk = '\
+    -C ${S}/tools/bootconfig \
+    AR="${AR}" \
+    ARCH=${ARCH} \
+    CC="${CC} ${CFLAGS} ${LDFLAGS}" \
+    CROSS_COMPILE=${HOST_PREFIX} \
+    DESTDIR="${D}" \
+    LD="${LD}" \
+    O=${B} \
+'
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake install
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1


