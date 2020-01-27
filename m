Return-Path: <alejandro@enedino.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE5A7FD2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 10:00:28 +0000 (UTC)
Received: from SN4PR0201CA0001.namprd02.prod.outlook.com
	(2603:10b6:803:2b::11) by MN2PR02MB6654.namprd02.prod.outlook.com
	(2603:10b6:208:1de::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.23;
	Mon, 27 Jan 2020 10:00:27 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by SN4PR0201CA0001.outlook.office365.com
	(2603:10b6:803:2b::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.20 via
	Frontend Transport; Mon, 27 Jan 2020 10:00:27 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2665.18
	via Frontend Transport; Mon, 27 Jan 2020 10:00:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1iw1By-0000Bq-Jc; Mon, 27 Jan 2020 02:00:26 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1iw1Bt-0007dE-5r; Mon, 27 Jan 2020 02:00:21 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1iw1Bs-0007c2-GD; Mon, 27 Jan 2020 02:00:20 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 02:00:13 -0800
Message-Id: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--10.666-7.0-31-1
X-imss-scan-details: No--10.666-7.0-31-1;No--10.666-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132245928271966640;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(428003)(189003)(199004)(8936002)(316002)(81156014)(26005)(36756003)(81166006)(8676002)(9786002)(6666004)(2906002)(86362001)(107886003)(356004)(70206006)(70586007)(4326008)(6916009)(5660300002)(498600001)(2616005)(426003)(336012);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR02MB6654; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d10ad2e-53a4-4f20-8726-08d7a30fbc1a
X-MS-TrafficTypeDiagnostic: MN2PR02MB6654:
X-Microsoft-Antispam-PRVS: <MN2PR02MB66549484DE751A52CF85F413B80B0@MN2PR02MB6654.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02951C14DC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Osb1+k999j3RexK2EG8/UMkRUbL6NU/nh8rFwglzPybABmuOTyQONPbUpYwd5ITJzoxXLna6Ge4nmCq734gA6z/jTu1gIXUd43SvX0i4b28KzHKtxTjQi3hFXJDhiY858UftSsQmJHOu/dZN0TnzLSr8cOkgk4n2CnQcSXv36C3sW3lJmSEdJf1PcYAM/EUzEm3q4chHQSdBxHAA7SEO+nyTy9lnutE+sVaouMG5Nz+YDHohsU9aK7vVij8jfdX78X5T5tejtE9ZXHbCJQ7hv9j9NhKF18JGTWc1Boqr5iBUPlmrqjWlaCqf2HlxxzTEFebhFGzFxKQ4STHWiPmo099mcStWKvzd/mR4xDg79vs873QpfKrgdd1OiSlwJzSpbDTFLtZOJvAri+KpfJgwbDomyDub/A54EKGU5gdo6fPbnFcqbdncyklYGpIC/wtkEeu5kKCMwOXSI3a7OYrPhJRmL2i1awFXXX9WUbA7pmYOzBhUNWyXIatLJ5jc4unFahC9tc9UszTW6OhCdtV6w==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2020 10:00:27.0175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d10ad2e-53a4-4f20-8726-08d7a30fbc1a
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6654
Subject: [PATCH 1/2] baremetal-helloworld: Create recipe for baremetal examples on QEMU
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
X-List-Received-Date: Mon, 27 Jan 2020 10:00:29 -0000
Content-Type: text/plain

Create HelloWorld examples that run on several of the QEMU architectures
supported by the build system.

This recipe can be used by anyone to understand how baremetal applications
can be built using OpenEmbedded and how the wiring to set them up could be.

This should also facilitate creating/extending the OE testing infrastructure
to allow baremetal applications or RTOSs to be tested in the same way that
Linux currently is.

This can easily be extended to work on other MACHINES in the future.

To run this example:

# Source the oe environment as usual
$ source oe-init-buildenv

# Set TCLIBC to either newlib or baremetal
$ echo "TCLIBC = \"newlib\"" >> ./conf/local.conf

# Use one of the supported architectures (qemuarm64, qemuarm or qemuarmv5)
$ echo "MACHINE = \"qemuarm64\"" >> ./conf/local.conf

# Build
$ bitbake baremetal-helloworld

# Launch QEMU
$ runqemu

runqemu - INFO - Running bitbake -e ...
runqemu - INFO - Continuing with the following parameters:
KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
MACHINE: [qemuarm64]
FSTYPE: [bin]
ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
CONFFILE: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.qemuboot.conf]

Hello OpenEmbedded!

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 .../baremetal-examples/baremetal-helloworld_git.bb | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 meta/recipes-extended/baremetal-examples/baremetal-helloworld_git.bb

diff --git a/meta/recipes-extended/baremetal-examples/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-examples/baremetal-helloworld_git.bb
new file mode 100644
index 0000000..aab48b1
--- /dev/null
+++ b/meta/recipes-extended/baremetal-examples/baremetal-helloworld_git.bb
@@ -0,0 +1,114 @@
+SUMMARY = "Baremetal examples to work with the several QEMU architectures supported on OpenEmbedded"
+HOMEPAGE = "https://github.com/aehs29/baremetal-helloqemu"
+LICENSE = "CC-BY-SA-4.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4084714af41157e38872e798eb3fe1b1"
+
+SRCREV = "fe81742f1159725408dd7305e40e7bd4dfd1e264"
+
+SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https "
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+# These examples are not meant to be built when using either musl or glibc
+COMPATIBLE_HOST_libc-musl_class-target = "null"
+COMPATIBLE_HOST_libc-glibc_class-target = "null"
+
+# This will be translated automatically to the architecture and
+# machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
+# but the examples can also be run on other architectures/machines
+# such as vexpress-a15 by overriding the setting on the machine.conf
+COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64"
+
+BAREMETAL_QEMUARCH ?= ""
+BAREMETAL_QEMUARCH_qemuarmv5 = "versatile"
+BAREMETAL_QEMUARCH_qemuarm = "arm"
+BAREMETAL_QEMUARCH_qemuarm64 = "aarch64"
+
+
+EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH}"
+
+do_configure(){
+    # Avoid building on the source directory
+    cp ${S}/* ${B}
+}
+
+do_install(){
+    install -d ${D}/${datadir}
+    install -m 755 ${B}/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${datadir}/hello_baremetal_${MACHINE}.bin
+    install -m 755 ${B}/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${datadir}/hello_baremetal_${MACHINE}.elf
+}
+
+# Make sure there are no race conditions when
+# assembling compiling and linking steps
+PARALLEL_MAKE = ""
+
+# Borrowed from meta-freertos
+inherit rootfs-postcommands
+inherit deploy
+do_deploy[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
+do_rootfs[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
+DEPLOYDIR = "${IMGDEPLOYDIR}"
+IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
+IMAGE_NAME_SUFFIX ?= ""
+
+do_deploy(){
+    install ${D}/${datadir}/hello_baremetal_${MACHINE}.bin ${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin
+    install ${D}/${datadir}/hello_baremetal_${MACHINE}.elf ${DEPLOYDIR}/${IMAGE_LINK_NAME}.elf
+}
+
+do_image(){
+    :
+}
+
+FILES_${PN} += " \
+    ${datadir}/hello_baremetal_${MACHINE}.bin \
+    ${datadir}/hello_baremetal_${MACHINE}.elf \
+"
+
+python do_rootfs(){
+    from oe.utils import execute_pre_post_process
+    from pathlib import Path
+
+    # Write empty manifest testdate file
+    deploy_dir = d.getVar('DEPLOYDIR')
+    link_name = d.getVar('IMAGE_LINK_NAME')
+    manifest_name = d.getVar('IMAGE_MANIFEST')
+
+    Path(manifest_name).touch()
+    if os.path.exists(manifest_name) and link_name:
+        manifest_link = deploy_dir + "/" + link_name + ".manifest"
+        if os.path.lexists(manifest_link):
+            os.remove(manifest_link)
+        os.symlink(os.path.basename(manifest_name), manifest_link)
+    execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
+}
+
+# QEMU generic FreeRTOS parameters
+QB_DEFAULT_KERNEL = "${IMAGE_LINK_NAME}.bin"
+QB_MEM = "-m 256"
+QB_OPT_APPEND = "-nographic"
+QB_DEFAULT_FSTYPE = "bin"
+QB_DTB = ""
+
+# This next part is necessary to trick the build system into thinking
+# its building an image recipe so it generates the qemuboot.conf
+addtask do_deploy after do_write_qemuboot_conf before do_build
+addtask do_rootfs before do_deploy after do_install
+addtask do_image after do_rootfs before do_build
+inherit qemuboot
+
+# Based on image.bbclass to make sure we build qemu
+python(){
+    # do_addto_recipe_sysroot doesnt exist for all recipes, but we need it to have
+    # /usr/bin on recipe-sysroot (qemu) populated
+    def extraimage_getdepends(task):
+        deps = ""
+        for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
+        # Make sure we only add it for qemu
+            if 'qemu' in dep:
+                deps += " %s:%s" % (dep, task)
+        return deps
+    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_addto_recipe_sysroot'))
+    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_populate_sysroot'))
+}
-- 
2.7.4


