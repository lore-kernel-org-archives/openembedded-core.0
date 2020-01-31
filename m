Return-Path: <alejandro@enedino.org>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
	by mail.openembedded.org (Postfix) with ESMTP id 137F860D7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 09:54:56 +0000 (UTC)
Received: from SN4PR0201CA0043.namprd02.prod.outlook.com
	(2603:10b6:803:2e::29) by BYAPR02MB5463.namprd02.prod.outlook.com
	(2603:10b6:a03:96::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22;
	Fri, 31 Jan 2020 09:54:57 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by SN4PR0201CA0043.outlook.office365.com
	(2603:10b6:803:2e::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.23 via
	Frontend Transport; Fri, 31 Jan 2020 09:54:56 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2686.25
	via Frontend Transport; Fri, 31 Jan 2020 09:54:56 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1ixT0n-0002gH-QX; Fri, 31 Jan 2020 01:54:53 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1ixT0i-0004kY-MN; Fri, 31 Jan 2020 01:54:48 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	00V9smSj029024; Fri, 31 Jan 2020 01:54:48 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1ixT0h-0004kP-UF; Fri, 31 Jan 2020 01:54:47 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 01:54:42 -0800
Message-Id: <1580464482-27782-1-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--9.706-7.0-31-1
X-imss-scan-details: No--9.706-7.0-31-1;No--9.706-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132249380963390673;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(428003)(199004)(189003)(36756003)(316002)(26005)(5660300002)(86362001)(2906002)(498600001)(6666004)(356004)(9786002)(426003)(6916009)(8936002)(81166006)(8676002)(81156014)(2616005)(4326008)(107886003)(70206006)(70586007)(336012);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5463; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b40cfb52-db4a-4d42-8ab5-08d7a633a088
X-MS-TrafficTypeDiagnostic: BYAPR02MB5463:
X-Microsoft-Antispam-PRVS: <BYAPR02MB54633206E48AFE47B819C3DBB8070@BYAPR02MB5463.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 029976C540
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6rnCV8tXv/X9y4N8cbVuRNzM0ooYPTMRZKKe1aqUZf+/WdqVtjFCbSsbWJtVECJKsRt5e5VIM+6AOQ6hEfYwt6sJhyQt3ullOgh+bndDmKb/qVGY4559P15TsWwQuj6EQvaj26Rf8o9o7LUBvD4MNjpwY5pQmyksdyLEcheSQUr+xYFgTTf0hU+4RPe5fvMBEeTvQR7U2m1d6gQrGnSqIz6iHyEz8O1ziYGPUqGMovXhbahBuTzgna+s/N2nIHaBXVeTgEf5Kwsywwj2ualtXMs4V8YWNgU2KbhvZCgoibz+7wzOhTqe+ulLWp+8gzmP/NQtweZL/E1x+r2F0MG5Wy/ERBPIcXhNi5l7aHv7eU0Id+cnR1R0osORG50rlgTvI8H2nQPXbyHWrtT9ps0fRoCeMZdnjG2KtanF3npM0e47ozfGI0yyI7GcjS1ZywI17Fv7nrxwtcz4+lHwTq98IigLWq3TjcocuCv9TxeAY0777ozUK6WhngORKM+Nvsxlz5Dy7Q43S6jgTPQTZ2T6Q==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2020 09:54:56.1231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b40cfb52-db4a-4d42-8ab5-08d7a633a088
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5463
Subject: [PATCH v2 1/2] baremetal-helloworld: Create recipe for baremetal examples on QEMU
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
X-List-Received-Date: Fri, 31 Jan 2020 09:54:57 -0000
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

$ source oe-init-buildenv

$ bitbake-layers add-layer ../meta-skeleton

# TCLIBC="baremetal" would work as well
$ echo "TCLIBC = \"newlib\"" >> ./conf/local.conf

$ echo "MACHINE = \"qemuarm64\"" >> ./conf/local.conf

$ bitbake baremetal-helloworld

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
 .../baremetal-examples/baremetal-helloworld_git.bb | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
new file mode 100644
index 0000000..d863370
--- /dev/null
+++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
@@ -0,0 +1,105 @@
+SUMMARY = "Baremetal examples to work with the several QEMU architectures supported on OpenEmbedded"
+HOMEPAGE = "https://github.com/aehs29/baremetal-helloqemu"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
+
+SRCREV = "99f4fa4a3b266b42b52af302610b0f4f429ba5e3"
+PV = "0.1+git${SRCPV}"
+
+SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git/"
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
+EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
+
+do_install(){
+    install -d ${D}/${datadir}
+    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${datadir}/hello_baremetal_${MACHINE}.bin
+    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${datadir}/hello_baremetal_${MACHINE}.elf
+}
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


