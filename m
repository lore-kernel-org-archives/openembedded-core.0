Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE61DD2069E
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 14:04:36 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44492.1764857066929107916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 06:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=cm48vlXg;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=426627091=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1764857067; x=1796393067;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lWpLu3TjYtzGvL3X4Kst2Pb2W8CE16prawPfaBPbmzI=;
  b=cm48vlXg9H73EWQ87cSM674UtTl7VYEVTOvJh/nEXrJJW3SrZNYDqiJX
   YEmg/Re/dngXKTdUct2lOuq7twslvW2XHwJBpS0yzD7FHVI8dJnODjIrq
   bOvG2cCic9Ig/633uCDstgxFQ3KYbVaNf9dNxK3jYM3kOHcBw4dm7JT71
   ppayoRULE59ZcgY9R2Mi3xVkReabfBEt9KFZBtCvKS2GatQx1iIHuiV+b
   DaEMi3bg5V2DkMOONshLM2krsr+CVx40Zq7xvr57wfuLHp9V+sAiYjC5U
   I7tomashP+82GcQVv7vugMQp5hxGFzdWbPJxE0Lb3iqgsuuBpEo9VfLps
   g==;
X-CSE-ConnectionGUID: U/nBwGaVSICfPATbNMMLzg==
X-CSE-MsgGUID: YFC4bSR1Qpa05wK0CCuYpg==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:X9Ozu6pFIYuj+xXHIsW57iVH6JleBmIcZBIvgKrLsJaIsI4StFCzt
 garIBmBPPeNamfxLtF3b4Wx9BkA7MWGndRqTAA+/isyESIX9pacVYWSI3mrMnLJJKUvbq7FA
 +Y2N4OcdpBkFhcwgj/3b9ANeFEljfngqoLUUbCCYmYpA1c5FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSss9JOGjt8B5mr9lU15JwehBtC5gZjPKoT4AeE/5UoJMl3yZ+ZfiKQrrZ8TrbSq
 9brlNmR4m7f9hExPdKp+p6TWlEKWLPbIT+VgXNQXaW46jAazsDl+v9mXBa0QR4/ZwShx7id+
 v0U3XCDYV5B0pn3pQgoe0Iw/xeSn0Fx0OSvzXCX6aR/xqBdGpfm660G4EoeZeX09gvraI3nG
 DNxxD0lN3i+a+yKLL2Td65qrNsMJffQHagRglhcxxf8KNI0TsWWK0nKzYcwMDYYvOtiNrP7T
 us9MmIpZxPae1tDO1oXDNQ1m+LAanvXKmUe8Q/O4/FxujOLpOBy+OGF3N79dtGMRN4TmV2Eq
 3jC9mL1Kh0bOdybjzGC9xpAg8eWxn6gCNJDS+HQGvhCsXO4mmYoMkQvTVLj/Oaa0mWVRuNHJ
 BlBksYphe1onKCxdfH6RxC+rXuOsxIQVtYVGOog5SmJy7HI+ECeHmUCQztLZdAqucNwQiYlv
 neAk8noDDopvqeYSHKa+LqOhSizNC0YK3REbigBJTbp+PG6+Mdq00mJFZA6S/bdYsDJJAwcC
 gui9EAW74j/R+ZSv0ln1TgrWw6Rm6U=
IronPort-HdrOrdr: A9a23:o9uBpq/IlArfpDHbBa9uk+DWI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+Mjyt3fP4gr5PUtMpTnuAtjkfZqxz/FICOoqTNWftWvdyQiVxehZhOOI/9SHIUzDH4VmuZ
 uIHZIRNDSJNzhHsfo=
X-Talos-CUID: 9a23:TV2Hgm34/Xcb0H7HxopRrbxfJ4cjWGLyxUnrAmS2MU9VQpuwbHuC9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AR+p+Ww0bh/WyQZs+cUmivXZgnjUj0oqFVEo2q8w?=
 =?us-ascii?q?/o8DcaDNTYxy2kQWvTdpy?=
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="135388974"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "adrian.freihofer@siemens.com"
	<adrian.freihofer@siemens.com>
Subject: AW: [EXT] [OE-core] [PATCH v7 11/20] kernel-fit-image.bbclass: add a
 new FIT image implementation
Thread-Topic: [EXT] [OE-core] [PATCH v7 11/20] kernel-fit-image.bbclass: add a
 new FIT image implementation
Thread-Index: AQHb1GD7ifSFsKXPwEygZg0ERfU1UrUSnwPA
Date: Thu, 4 Dec 2025 14:04:22 +0000
Message-ID: <0d773cb9aace446eb588342c42d17916@diehl.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
 <20250603082419.409564-12-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-12-adrian.freihofer@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-disclaimerprocessed: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-GBS-PROC: ygQ48MzXEw9pRTxtaiHdsWzFxg8V846y04G5zYIJPPiuNwthw7vZhw+J5y0HCUw1+5j/GJ25mr/9Z+k84JjTLH8gBiBbo4z0uqhOsfGIOqY=
X-GBS-PROCJOB: EMUfuwIH6hTmPDa/3KGzu+rsTbgP0ivWpLwBnO2o2vrWeZ5LH99dFnKPbA4NeZvy
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 14:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227297

Hi Adrian,

I try to use the new fit image implementation in conjunction with meta-open=
embeddeds signing class.
In this case PKCS11 URI is used instead of crt/key files and the sanity che=
ck fails.
Shall I add an additional variable to switch of the checks?

Regards Denis

-----Urspr=FCngliche Nachricht-----
Von: openembedded-core@lists.openembedded.org <openembedded-core@lists.open=
embedded.org> Im Auftrag von Adrian Freihofer via lists.openembedded.org
Gesendet: Dienstag, 3. Juni 2025 10:23
An: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Betreff: [EXT] [OE-core] [PATCH v7 11/20] kernel-fit-image.bbclass: add a n=
ew FIT image implementation

[EXTERNAL EMAIL]


From: Adrian Freihofer <adrian.freihofer@siemens.com>

The new recipe linux-yocto-fitimage.bb and the new
kernel-fit-image.bbclass are intended to become successors of the
kernel-fitimage.bbclass.

Instead of injecting the FIT image related build steps into the kernel
recipe, the new recipe takes the kernel artifacts from the kernel recipe
and creates the FIT image as an independent task.

This solves some basic problems:
* sstate does not work well when a fitImage contains an initramfs. The
  kernel is rebuilt from scratch if the build runs from an empty TMPDIR.
* A fitImage kernel is not available as a package, but all other kernel
  image types are.
* The task dependencies in the kernel are very complex and difficult to
  debug if something goes wrong. As a separate, downstream recipe, this
  is now much easier.

The recipe takes the kernel artifacts from the deploy folder. There was
also a test implementation passing the kernel artifacts via sysroot
directory. This requires changes on the kernel.bbclass to make it
copying the artifacts also to the sysroot directory while the same
artifacts are already in the sstate-cached deploy directory.

The new class kernel-fit-extra-artifacts.bbclass generates and deploys
the kernel binary intended for inclusion in a FIT image.
Note that the kernel used in a FIT image is a stripped (and optionally
compressed) vmlinux ELF binary - not a self-extracting format like
zImage, which is already available in the deploy directory if needed
separately.
The kernel-fit-extra-artifacts.bbclass can be used like this:
    KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts"
(if uImage support is not needed, or with :append otherwise)

The long story about this issue is here:
[YOCTO #12912]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../kernel-fit-extra-artifacts.bbclass        |  19 +
 meta/classes-recipe/kernel-fit-image.bbclass  | 187 ++++++
 meta/classes/multilib.bbclass                 |   1 +
 meta/lib/oe/fitimage.py                       | 547 ++++++++++++++++++
 .../linux/linux-yocto-fitimage.bb             |  13 +
 5 files changed, 767 insertions(+)
 create mode 100644 meta/classes-recipe/kernel-fit-extra-artifacts.bbclass
 create mode 100644 meta/classes-recipe/kernel-fit-image.bbclass
 create mode 100644 meta/lib/oe/fitimage.py
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-fitimage.bb

diff --git a/meta/classes-recipe/kernel-fit-extra-artifacts.bbclass b/meta/=
classes-recipe/kernel-fit-extra-artifacts.bbclass
new file mode 100644
index 00000000000..385fe9895a3
--- /dev/null
+++ b/meta/classes-recipe/kernel-fit-extra-artifacts.bbclass
@@ -0,0 +1,19 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Generate and deploy additional artifacts required for FIT image creation=
.
+# To use this class, add it to the KERNEL_CLASSES variable.
+
+inherit kernel-uboot
+
+kernel_do_deploy:append() {
+# Provide the kernel artifacts to post processing recipes e.g. for creatin=
g a FIT image
+uboot_prep_kimage "$deployDir"
+# For x86 a setup.bin needs to be include"d in a fitImage as well
+if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
+install -D "${B}/${KERNEL_OUTPUT_DIR}/setup.bin" "$deployDir/"
+fi
+}
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-re=
cipe/kernel-fit-image.bbclass
new file mode 100644
index 00000000000..6d80cd4bb47
--- /dev/null
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -0,0 +1,187 @@
+
+inherit kernel-arch kernel-artifact-names uboot-config deploy
+require conf/image-fitimage.conf
+
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+DEPENDS +=3D "\
+    u-boot-tools-native dtc-native \
+    ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') =3D=
=3D '1' else ''} \
+"
+
+python () {
+    image =3D d.getVar('INITRAMFS_IMAGE')
+    if image and d.getVar('INITRAMFS_IMAGE_BUNDLE') !=3D '1':
+        if d.getVar('INITRAMFS_MULTICONFIG'):
+            mc =3D d.getVar('BB_CURRENT_MC')
+            d.appendVarFlag('do_compile', 'mcdepends', ' mc:' + mc + ':${I=
NITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+        else:
+            d.appendVarFlag('do_compile', 'depends', ' ${INITRAMFS_IMAGE}:=
do_image_complete')
+
+    #check if there are any dtb providers
+    providerdtb =3D d.getVar("PREFERRED_PROVIDER_virtual/dtb")
+    if providerdtb:
+        d.appendVarFlag('do_compile', 'depends', ' virtual/dtb:do_populate=
_sysroot')
+        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/dev=
icetree")
+}
+
+do_configure[noexec] =3D "1"
+
+UBOOT_MKIMAGE_KERNEL_TYPE ?=3D "kernel"
+KERNEL_IMAGEDEST ?=3D "/boot"
+
+python do_compile() {
+    import shutil
+    import oe.fitimage
+
+    itsfile =3D "fit-image.its"
+    fitname =3D "fitImage"
+    kernel_deploydir =3D d.getVar('DEPLOY_DIR_IMAGE')
+    kernel_deploysubdir =3D d.getVar('KERNEL_DEPLOYSUBDIR')
+    if kernel_deploysubdir:
+        kernel_deploydir =3D os.path.join(kernel_deploydir, kernel_deploys=
ubdir)
+
+    # Collect all the its nodes before the its file is generated and mkima=
ge gets executed
+    root_node =3D oe.fitimage.ItsNodeRootKernel(
+        d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
+        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CO=
NF_PREFIX"),
+        oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE')), d.getVar("UBOOT_S=
IGN_KEYDIR"),
+        d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
+        d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"=
),
+        d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_=
PAD_ALG'),
+        d.getVar('UBOOT_SIGN_KEYNAME'),
+        oe.types.boolean(d.getVar('FIT_SIGN_INDIVIDUAL')), d.getVar('UBOOT=
_SIGN_IMG_KEYNAME')
+    )
+
+    # Prepare a kernel image section.
+    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bi=
n")
+    with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_=
f:
+        linux_comp =3D linux_comp_f.read()
+    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_=
comp,
+        d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
+        d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL=
"))
+
+    # Prepare a DTB image section
+    kernel_devicetree =3D d.getVar('KERNEL_DEVICETREE')
+    external_kernel_devicetree =3D d.getVar("EXTERNAL_KERNEL_DEVICETREE")
+    if kernel_devicetree:
+        for dtb in kernel_devicetree.split():
+            # In deploy_dir the DTBs are without sub-directories also with=
 KERNEL_DTBVENDORED =3D "1"
+            dtb_name =3D os.path.basename(dtb)
+
+            # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE=
 directory
+            if external_kernel_devicetree:
+                ext_dtb_path =3D os.path.join(external_kernel_devicetree, =
dtb_name)
+                if os.path.exists(ext_dtb_path) and os.path.getsize(ext_dt=
b_path) > 0:
+                    continue
+
+            # Copy the dtb or dtbo file into the FIT image assembly direct=
ory
+            shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_=
name)
+            root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LO=
ADADDRESS"))
+
+    if external_kernel_devicetree:
+        # iterate over all .dtb and .dtbo files in the external kernel dev=
icetree directory
+        # and copy them to the FIT image assembly directory
+        for dtb_name in sorted(os.listdir(external_kernel_devicetree)):
+            if dtb_name.endswith('.dtb') or dtb_name.endswith('.dtbo'):
+                dtb_path =3D os.path.join(external_kernel_devicetree, dtb_=
name)
+
+                # For symlinks, add a configuration node that refers to th=
e DTB image node to which the symlink points
+                symlink_target =3D oe.fitimage.symlink_points_below(dtb_na=
me, external_kernel_devicetree)
+                if symlink_target:
+                    root_node.fitimage_emit_section_dtb_alias(dtb_name, sy=
mlink_target, True)
+                # For real DTB files add an image node and a configuration=
 node
+                else:
+                    shutil.copyfile(dtb_path, dtb_name)
+                    root_node.fitimage_emit_section_dtb(dtb_name, dtb_name=
,
+                        d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT=
_DTBO_LOADADDRESS"), True)
+
+    # Prepare a u-boot script section
+    fit_uboot_env =3D d.getVar("FIT_UBOOT_ENV")
+    if fit_uboot_env:
+        root_node.fitimage_emit_section_boot_script("bootscr-"+fit_uboot_e=
nv , fit_uboot_env)
+
+    # Prepare a setup section (For x86)
+    setup_bin_path =3D os.path.join(kernel_deploydir, "setup.bin")
+    if os.path.exists(setup_bin_path):
+        shutil.copyfile(setup_bin_path, "setup.bin")
+        root_node.fitimage_emit_section_setup("setup-1", "setup.bin")
+
+    # Prepare a ramdisk section.
+    initramfs_image =3D d.getVar('INITRAMFS_IMAGE')
+    if initramfs_image and d.getVar("INITRAMFS_IMAGE_BUNDLE") !=3D '1':
+        # Find and use the first initramfs image archive type we find
+        found =3D False
+        for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
+            initramfs_path =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), =
"%s.%s" % (d.getVar('INITRAMFS_IMAGE_NAME'), img))
+            if os.path.exists(initramfs_path):
+                bb.note("Found initramfs image: " + initramfs_path)
+                found =3D True
+                root_node.fitimage_emit_section_ramdisk("ramdisk-1", initr=
amfs_path,
+                    initramfs_image,
+                    d.getVar("UBOOT_RD_LOADADDRESS"),
+                    d.getVar("UBOOT_RD_ENTRYPOINT"))
+                break
+            else:
+                bb.note("Did not find initramfs image: " + initramfs_path)
+
+        if not found:
+            bb.fatal("Could not find a valid initramfs type for %s, the su=
pported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('FIT_S=
UPPORTED_INITRAMFS_FSTYPES')))
+
+    # Generate the configuration section
+    root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB"=
))
+
+    # Write the its file
+    root_node.write_its_file(itsfile)
+
+    # Assemble the FIT image
+    root_node.run_mkimage_assemble(itsfile, fitname)
+
+    # Sign the FIT image if required
+    root_node.run_mkimage_sign(fitname)
+}
+do_compile[depends] +=3D "virtual/kernel:do_deploy"
+
+do_install() {
+    install -d "${D}/${KERNEL_IMAGEDEST}"
+    install -m 0644 "${B}/fitImage" "${D}/${KERNEL_IMAGEDEST}/fitImage"
+}
+
+FILES:${PN} =3D "${KERNEL_IMAGEDEST}"
+
+
+do_deploy() {
+    deploy_dir=3D"${DEPLOYDIR}"
+    if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
+        deploy_dir=3D"${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
+    fi
+    install -d "$deploy_dir"
+    install -m 0644 "${B}/fitImage" "$deploy_dir/fitImage"
+    install -m 0644 "${B}/fit-image.its" "$deploy_dir/fit-image.its"
+
+    if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
+        ln -snf fit-image.its "$deploy_dir/fitImage-its-${KERNEL_FIT_NAME}=
.its"
+        if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+            ln -snf fit-image.its "$deploy_dir/fitImage-its-${KERNEL_FIT_L=
INK_NAME}"
+        fi
+    fi
+
+    if [ -n "${INITRAMFS_IMAGE}" ]; then
+        ln -snf fit-image-its "$deploy_dir/fitImage-its-${INITRAMFS_IMAGE_=
NAME}-${KERNEL_FIT_NAME}.its"
+        if [ -n "${KERNEL_FIT_LINK_NAME}" ]; then
+            ln -snf fit-image.its "$deploy_dir/fitImage-its-${INITRAMFS_IM=
AGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+        fi
+
+        if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
+            ln -snf fitImage "$deploy_dir/fitImage-${INITRAMFS_IMAGE_NAME}=
-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
+            if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+                ln -snf fitImage "$deploy_dir/fitImage-${INITRAMFS_IMAGE_N=
AME}-${KERNEL_FIT_LINK_NAME}"
+            fi
+        fi
+    fi
+}
+addtask deploy after do_compile before do_build
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index a4151658a62..b959bbd93c0 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -21,6 +21,7 @@ python multilib_virtclass_handler () {
     bpn =3D d.getVar("BPN")
     if ("virtual/kernel" in provides
             or bb.data.inherits_class('module-base', d)
+            or bb.data.inherits_class('kernel-fit-image', d)
             or bpn in non_ml_recipes):
         raise bb.parse.SkipRecipe("We shouldn't have multilib variants for=
 %s" % bpn)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
new file mode 100644
index 00000000000..f3037991558
--- /dev/null
+++ b/meta/lib/oe/fitimage.py
@@ -0,0 +1,547 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# This file contains common functions for the fitimage generation
+
+import os
+import shlex
+import subprocess
+import bb
+
+from oeqa.utils.commands import runCmd
+
+class ItsNode:
+    INDENT_SIZE =3D 8
+
+    def __init__(self, name, parent_node, sub_nodes=3DNone, properties=3DN=
one):
+        self.name =3D name
+        self.parent_node =3D parent_node
+
+        self.sub_nodes =3D []
+        if sub_nodes:
+            self.sub_nodes =3D sub_nodes
+
+        self.properties =3D {}
+        if properties:
+            self.properties =3D properties
+
+        if parent_node:
+            parent_node.add_sub_node(self)
+
+    def add_sub_node(self, sub_node):
+        self.sub_nodes.append(sub_node)
+
+    def add_property(self, key, value):
+        self.properties[key] =3D value
+
+    def emit(self, f, indent):
+        indent_str_name =3D " " * indent
+        indent_str_props =3D " " * (indent + self.INDENT_SIZE)
+        f.write("%s%s {\n" % (indent_str_name, self.name))
+        for key, value in self.properties.items():
+            bb.debug(1, "key: %s, value: %s" % (key, str(value)))
+            # Single integer: <0x12ab>
+            if isinstance(value, int):
+                f.write(indent_str_props + key + ' =3D <0x%x>;\n' % value)
+            # list of strings: "string1", "string2" or integers: <0x12ab 0=
x34cd>
+            elif isinstance(value, list):
+                if len(value) =3D=3D 0:
+                    f.write(indent_str_props + key + ' =3D "";\n')
+                elif isinstance(value[0], int):
+                    list_entries =3D ' '.join('0x%x' % entry for entry in =
value)
+                    f.write(indent_str_props + key + ' =3D <%s>;\n' % list=
_entries)
+                else:
+                    list_entries =3D ', '.join('"%s"' % entry for entry in=
 value)
+                    f.write(indent_str_props + key + ' =3D %s;\n' % list_e=
ntries)
+            elif isinstance(value, str):
+                # path: /incbin/("path/to/file")
+                if key in ["data"] and value.startswith('/incbin/('):
+                    f.write(indent_str_props + key + ' =3D %s;\n' % value)
+                # Integers which are already string formatted
+                elif value.startswith("<") and value.endswith(">"):
+                    f.write(indent_str_props + key + ' =3D %s;\n' % value)
+                else:
+                    f.write(indent_str_props + key + ' =3D "%s";\n' % valu=
e)
+            else:
+                bb.fatal("%s has unexpexted data type." % str(value))
+        for sub_node in self.sub_nodes:
+            sub_node.emit(f, indent + self.INDENT_SIZE)
+        f.write(indent_str_name + '};\n')
+
+class ItsNodeImages(ItsNode):
+    def __init__(self, parent_node):
+        super().__init__("images", parent_node)
+
+class ItsNodeConfigurations(ItsNode):
+    def __init__(self, parent_node):
+        super().__init__("configurations", parent_node)
+
+class ItsNodeHash(ItsNode):
+    def __init__(self, name, parent_node, algo, opt_props=3DNone):
+        properties =3D {
+            "algo": algo
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, None, properties)
+
+class ItsImageSignature(ItsNode):
+    def __init__(self, name, parent_node, algo, keyname, opt_props=3DNone)=
:
+        properties =3D {
+            "algo": algo,
+            "key-name-hint": keyname
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, None, properties)
+
+class ItsNodeImage(ItsNode):
+    def __init__(self, name, parent_node, description, type, compression, =
sub_nodes=3DNone, opt_props=3DNone):
+        properties =3D {
+            "description": description,
+            "type": type,
+            "compression": compression,
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, sub_nodes, properties)
+
+class ItsNodeDtb(ItsNodeImage):
+    def __init__(self, name, parent_node, description, type, compression,
+                 sub_nodes=3DNone, opt_props=3DNone, compatible=3DNone):
+        super().__init__(name, parent_node, description, type, compression=
, sub_nodes, opt_props)
+        self.compatible =3D compatible
+
+class ItsNodeDtbAlias(ItsNode):
+    """Additional Configuration Node for a DTB
+
+    Symlinks pointing to a DTB file are handled by an addtitional
+    configuration node referring to another DTB image node.
+    """
+    def __init__(self, name, alias_name, compatible=3DNone):
+        super().__init__(name, parent_node=3DNone, sub_nodes=3DNone, prope=
rties=3DNone)
+        self.alias_name =3D alias_name
+        self.compatible =3D compatible
+
+class ItsNodeConfigurationSignature(ItsNode):
+    def __init__(self, name, parent_node, algo, keyname, opt_props=3DNone)=
:
+        properties =3D {
+            "algo": algo,
+            "key-name-hint": keyname
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, None, properties)
+
+class ItsNodeConfiguration(ItsNode):
+    def __init__(self, name, parent_node, description, sub_nodes=3DNone, o=
pt_props=3DNone):
+        properties =3D {
+            "description": description,
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, sub_nodes, properties)
+
+class ItsNodeRootKernel(ItsNode):
+    """Create FIT images for the kernel
+
+    Currently only a single kernel (no less or more) can be added to the F=
IT
+    image along with 0 or more device trees and 0 or 1 ramdisk.
+
+    If a device tree included in the FIT image, the default configuration =
is the
+    firt DTB. If there is no dtb present than the default configuation the=
 kernel.
+    """
+    def __init__(self, description, address_cells, host_prefix, arch, conf=
_prefix,
+                 sign_enable=3DFalse, sign_keydir=3DNone,
+                 mkimage=3DNone, mkimage_dtcopts=3DNone,
+                 mkimage_sign=3DNone, mkimage_sign_args=3DNone,
+                 hash_algo=3DNone, sign_algo=3DNone, pad_algo=3DNone,
+                 sign_keyname_conf=3DNone,
+                 sign_individual=3DFalse, sign_keyname_img=3DNone):
+        props =3D {
+            "description": description,
+            "#address-cells": f"<{address_cells}>"
+        }
+        super().__init__("/", None, None, props)
+        self.images =3D ItsNodeImages(self)
+        self.configurations =3D ItsNodeConfigurations(self)
+
+        self._host_prefix =3D host_prefix
+        self._arch =3D arch
+        self._conf_prefix =3D conf_prefix
+
+        # Signature related properties
+        self._sign_enable =3D sign_enable
+        self._sign_keydir =3D sign_keydir
+        self._mkimage =3D mkimage
+        self._mkimage_dtcopts =3D mkimage_dtcopts
+        self._mkimage_sign =3D mkimage_sign
+        self._mkimage_sign_args =3D mkimage_sign_args
+        self._hash_algo =3D hash_algo
+        self._sign_algo =3D sign_algo
+        self._pad_algo =3D pad_algo
+        self._sign_keyname_conf =3D sign_keyname_conf
+        self._sign_individual =3D sign_individual
+        self._sign_keyname_img =3D sign_keyname_img
+        self._sanitize_sign_config()
+
+        self._dtbs =3D []
+        self._dtb_alias =3D []
+        self._kernel =3D None
+        self._ramdisk =3D None
+        self._bootscr =3D None
+        self._setup =3D None
+
+    def _sanitize_sign_config(self):
+        if self._sign_enable:
+            if not self._hash_algo:
+                bb.fatal("FIT image signing is enabled but no hash algorit=
hm is provided.")
+            if not self._sign_algo:
+                bb.fatal("FIT image signing is enabled but no signature al=
gorithm is provided.")
+            if not self._pad_algo:
+                bb.fatal("FIT image signing is enabled but no padding algo=
rithm is provided.")
+            if not self._sign_keyname_conf:
+                bb.fatal("FIT image signing is enabled but no configuratio=
n key name is provided.")
+            if self._sign_individual and not self._sign_keyname_img:
+                bb.fatal("FIT image signing is enabled for individual imag=
es but no image key name is provided.")
+
+    def write_its_file(self, itsfile):
+        with open(itsfile, 'w') as f:
+            f.write("/dts-v1/;\n\n")
+            self.emit(f, 0)
+
+    def its_add_node_image(self, image_id, description, image_type, compre=
ssion, opt_props):
+        image_node =3D ItsNodeImage(
+            image_id,
+            self.images,
+            description,
+            image_type,
+            compression,
+            opt_props=3Dopt_props
+        )
+        if self._hash_algo:
+            ItsNodeHash(
+                "hash-1",
+                image_node,
+                self._hash_algo
+            )
+        if self._sign_individual:
+            ItsImageSignature(
+                "signature-1",
+                image_node,
+                f"{self._hash_algo},{self._sign_algo}",
+                self._sign_keyname_img
+            )
+        return image_node
+
+    def its_add_node_dtb(self, image_id, description, image_type, compress=
ion, opt_props, compatible):
+        dtb_node =3D ItsNodeDtb(
+            image_id,
+            self.images,
+            description,
+            image_type,
+            compression,
+            opt_props=3Dopt_props,
+            compatible=3Dcompatible
+        )
+        if self._hash_algo:
+            ItsNodeHash(
+                "hash-1",
+                dtb_node,
+                self._hash_algo
+            )
+        if self._sign_individual:
+            ItsImageSignature(
+                "signature-1",
+                dtb_node,
+                f"{self._hash_algo},{self._sign_algo}",
+                self._sign_keyname_img
+            )
+        return dtb_node
+
+    def fitimage_emit_section_kernel(self, kernel_id, kernel_path, compres=
sion,
+        load, entrypoint, mkimage_kernel_type, entrysymbol=3DNone):
+        """Emit the fitImage ITS kernel section"""
+        if self._kernel:
+            bb.fatal("Kernel section already exists in the ITS file.")
+        if entrysymbol:
+            result =3D subprocess.run([self._host_prefix + "nm", "vmlinux"=
], capture_output=3DTrue, text=3DTrue)
+            for line in result.stdout.splitlines():
+                parts =3D line.split()
+                if len(parts) =3D=3D 3 and parts[2] =3D=3D entrysymbol:
+                    entrypoint =3D "<0x%s>" % parts[0]
+                    break
+        kernel_node =3D self.its_add_node_image(
+            kernel_id,
+            "Linux kernel",
+            mkimage_kernel_type,
+            compression,
+            {
+                "data": '/incbin/("' + kernel_path + '")',
+                "arch": self._arch,
+                "os": "linux",
+                "load": f"<{load}>",
+                "entry": f"<{entrypoint}>"
+            }
+        )
+        self._kernel =3D kernel_node
+
+    def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=
=3DNone,
+                                  dtbo_loadaddress=3DNone, add_compatible=
=3DFalse):
+        """Emit the fitImage ITS DTB section"""
+        load=3DNone
+        dtb_ext =3D os.path.splitext(dtb_path)[1]
+        if dtb_ext =3D=3D ".dtbo":
+            if dtbo_loadaddress:
+                load =3D dtbo_loadaddress
+        elif dtb_loadaddress:
+            load =3D dtb_loadaddress
+
+        opt_props =3D {
+            "data": '/incbin/("' + dtb_path + '")',
+            "arch": self._arch
+        }
+        if load:
+            opt_props["load"] =3D f"<{load}>"
+
+        # Preserve the DTB's compatible string to be added to the configur=
ation node
+        compatible =3D None
+        if add_compatible:
+            compatible =3D get_compatible_from_dtb(dtb_path)
+
+        dtb_node =3D self.its_add_node_dtb(
+            "fdt-" + dtb_id,
+            "Flattened Device Tree blob",
+            "flat_dt",
+            "none",
+            opt_props,
+            compatible
+        )
+        self._dtbs.append(dtb_node)
+
+    def fitimage_emit_section_dtb_alias(self, dtb_alias_id, dtb_path, add_=
compatible=3DFalse):
+        """Add a configuration node referring to another DTB"""
+        # Preserve the DTB's compatible string to be added to the configur=
ation node
+        compatible =3D None
+        if add_compatible:
+            compatible =3D get_compatible_from_dtb(dtb_path)
+
+        dtb_id =3D os.path.basename(dtb_path)
+        dtb_alias_node =3D ItsNodeDtbAlias("fdt-" + dtb_id, dtb_alias_id, =
compatible)
+        self._dtb_alias.append(dtb_alias_node)
+        bb.warn(f"compatible: {compatible}, dtb_alias_id: {dtb_alias_id}, =
dtb_id: {dtb_id}, dtb_path: {dtb_path}")
+
+    def fitimage_emit_section_boot_script(self, bootscr_id, bootscr_path):
+        """Emit the fitImage ITS u-boot script section"""
+        if self._bootscr:
+            bb.fatal("U-boot script section already exists in the ITS file=
.")
+        bootscr_node =3D self.its_add_node_image(
+            bootscr_id,
+            "U-boot script",
+            "script",
+            "none",
+            {
+                "data": '/incbin/("' + bootscr_path + '")',
+                "arch": self._arch,
+                "type": "script"
+            }
+        )
+        self._bootscr =3D bootscr_node
+
+    def fitimage_emit_section_setup(self, setup_id, setup_path):
+        """Emit the fitImage ITS setup section"""
+        if self._setup:
+            bb.fatal("Setup section already exists in the ITS file.")
+        load =3D "<0x00090000>"
+        entry =3D "<0x00090000>"
+        setup_node =3D self.its_add_node_image(
+            setup_id,
+            "Linux setup.bin",
+            "x86_setup",
+            "none",
+            {
+                "data": '/incbin/("' + setup_path + '")',
+                "arch": self._arch,
+                "os": "linux",
+                "load": load,
+                "entry": entry
+            }
+        )
+        self._setup =3D setup_node
+
+    def fitimage_emit_section_ramdisk(self, ramdisk_id, ramdisk_path, desc=
ription=3D"ramdisk", load=3DNone, entry=3DNone):
+        """Emit the fitImage ITS ramdisk section"""
+        if self._ramdisk:
+            bb.fatal("Ramdisk section already exists in the ITS file.")
+        opt_props =3D {
+            "data": '/incbin/("' + ramdisk_path + '")',
+            "type": "ramdisk",
+            "arch": self._arch,
+            "os": "linux"
+        }
+        if load:
+            opt_props["load"] =3D f"<{load}>"
+        if entry:
+            opt_props["entry"] =3D f"<{entry}>"
+
+        ramdisk_node =3D self.its_add_node_image(
+            ramdisk_id,
+            description,
+            "ramdisk",
+            "none",
+            opt_props
+        )
+        self._ramdisk =3D ramdisk_node
+
+    def _fitimage_emit_one_section_config(self, conf_node_name, dtb=3DNone=
):
+        """Emit the fitImage ITS configuration section"""
+        opt_props =3D {}
+        conf_desc =3D []
+        sign_entries =3D []
+
+        if self._kernel:
+            conf_desc.append("Linux kernel")
+            opt_props["kernel"] =3D self._kernel.name
+            if self._sign_enable:
+                sign_entries.append("kernel")
+
+        if dtb:
+            conf_desc.append("FDT blob")
+            opt_props["fdt"] =3D dtb.name
+            if dtb.compatible:
+                opt_props["compatible"] =3D dtb.compatible
+            if self._sign_enable:
+                sign_entries.append("fdt")
+
+        if self._ramdisk:
+            conf_desc.append("ramdisk")
+            opt_props["ramdisk"] =3D self._ramdisk.name
+            if self._sign_enable:
+                sign_entries.append("ramdisk")
+
+        if self._bootscr:
+            conf_desc.append("u-boot script")
+            opt_props["bootscr"] =3D self._bootscr.name
+            if self._sign_enable:
+                sign_entries.append("bootscr")
+
+        if self._setup:
+            conf_desc.append("setup")
+            opt_props["setup"] =3D self._setup.name
+            if self._sign_enable:
+                sign_entries.append("setup")
+
+        # First added configuration is the default configuration
+        default_flag =3D "0"
+        if len(self.configurations.sub_nodes) =3D=3D 0:
+            default_flag =3D "1"
+
+        conf_node =3D ItsNodeConfiguration(
+            conf_node_name,
+            self.configurations,
+            f"{default_flag} {', '.join(conf_desc)}",
+            opt_props=3Dopt_props
+        )
+        if self._hash_algo:
+            ItsNodeHash(
+                "hash-1",
+                conf_node,
+                self._hash_algo
+            )
+        if self._sign_enable:
+            ItsNodeConfigurationSignature(
+                "signature-1",
+                conf_node,
+                f"{self._hash_algo},{self._sign_algo}",
+                self._sign_keyname_conf,
+                opt_props=3D{
+                    "padding": self._pad_algo,
+                    "sign-images": sign_entries
+                }
+            )
+
+    def fitimage_emit_section_config(self, default_dtb_image=3DNone):
+        if self._dtbs:
+            for dtb in self._dtbs:
+                dtb_name =3D dtb.name
+                if dtb.name.startswith("fdt-"):
+                    dtb_name =3D dtb.name[len("fdt-"):]
+                self._fitimage_emit_one_section_config(self._conf_prefix +=
 dtb_name, dtb)
+            for dtb in self._dtb_alias:
+                self._fitimage_emit_one_section_config(self._conf_prefix +=
 dtb.alias_name, dtb)
+        else:
+            # Currently exactly one kernel is supported.
+            self._fitimage_emit_one_section_config(self._conf_prefix + "1"=
)
+
+        default_conf =3D self.configurations.sub_nodes[0].name
+        if default_dtb_image and self._dtbs:
+            default_conf =3D self._conf_prefix + default_dtb_image
+        self.configurations.add_property('default', default_conf)
+
+    def run_mkimage_assemble(self, itsfile, fitfile):
+        cmd =3D [
+            self._mkimage,
+            '-f', itsfile,
+            fitfile
+        ]
+        if self._mkimage_dtcopts:
+            cmd.insert(1, '-D')
+            cmd.insert(2, self._mkimage_dtcopts)
+        try:
+            subprocess.run(cmd, check=3DTrue, capture_output=3DTrue)
+        except subprocess.CalledProcessError as e:
+            bb.fatal(f"Command '{' '.join(cmd)}' failed with return code {=
e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\nit=
sflile: {os.path.abspath(itsfile)}")
+
+    def run_mkimage_sign(self, fitfile):
+        if not self._sign_enable:
+            bb.debug(1, "FIT image signing is disabled. Skipping signing."=
)
+            return
+
+        # Some sanity checks because mkimage exits with 0 also without nee=
ded keys
+        sign_key_path =3D os.path.join(self._sign_keydir, self._sign_keyna=
me_conf)
+        if not os.path.exists(sign_key_path + '.key') or not os.path.exist=
s(sign_key_path + '.crt'):
+            bb.fatal("%s.key or .crt does not exist" % sign_key_path)
+        if self._sign_individual:
+            sign_key_img_path =3D os.path.join(self._sign_keydir, self._si=
gn_keyname_img)
+            if not os.path.exists(sign_key_img_path + '.key') or not os.pa=
th.exists(sign_key_img_path + '.crt'):
+                bb.fatal("%s.key or .crt does not exist" % sign_key_img_pa=
th)
+
+        cmd =3D [
+            self._mkimage_sign,
+            '-F',
+            '-k', self._sign_keydir,
+            '-r', fitfile
+        ]
+        if self._mkimage_dtcopts:
+            cmd.extend(['-D', self._mkimage_dtcopts])
+        if self._mkimage_sign_args:
+            cmd.extend(shlex.split(self._mkimage_sign_args))
+        try:
+            subprocess.run(cmd, check=3DTrue, capture_output=3DTrue)
+        except subprocess.CalledProcessError as e:
+            bb.fatal(f"Command '{' '.join(cmd)}' failed with return code {=
e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}")
+
+
+def symlink_points_below(file_or_symlink, expected_parent_dir):
+    """returns symlink destination if it points below directory"""
+    file_path =3D os.path.join(expected_parent_dir, file_or_symlink)
+    if not os.path.islink(file_path):
+        return None
+
+    realpath =3D os.path.relpath(os.path.realpath(file_path), expected_par=
ent_dir)
+    if realpath.startswith(".."):
+        return None
+
+    return realpath
+
+def get_compatible_from_dtb(dtb_path, fdtget_path=3D"fdtget"):
+    compatible =3D None
+    cmd =3D [fdtget_path, "-t", "s", dtb_path, "/", "compatible"]
+    try:
+        ret =3D subprocess.run(cmd, check=3DTrue, capture_output=3DTrue, t=
ext=3DTrue)
+        compatible =3D ret.stdout.strip().split()
+    except subprocess.CalledProcessError:
+        compatible =3D None
+    return compatible
diff --git a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb b/meta/recip=
es-kernel/linux/linux-yocto-fitimage.bb
new file mode 100644
index 00000000000..6ce1960a871
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "The Linux kernel as a FIT image (optionally with initramfs)"
+SECTION =3D "kernel"
+
+# If an initramfs is included in the FIT image more licenses apply.
+# But also the kernel uses more than one license (see Documentation/proces=
s/license-rules.rst)
+LICENSE =3D "GPL-2.0-with-Linux-syscall-note"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-2.=
0-with-Linux-syscall-note;md5=3D0bad96c422c41c3a94009dcfe1bff992"
+
+inherit linux-kernel-base kernel-fit-image
+
+# Set the version of this recipe to the version of the included kernel
+# (without taking the long way around via PV)
+PKGV =3D "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
--
2.49.0

Diehl Metering GmbH, Donaustrasse 120, 90451 Nuernberg
Sitz der Gesellschaft: Ansbach, Registergericht: Ansbach HRB 69
Geschaeftsfuehrer: Dr. Christof Bosbach (Sprecher), Dipl.-Dolm. Annette Geu=
ther, Dipl.-Kfm. Reiner Edel, Jean-Claude Luttringer

Bitte denken Sie an die Umwelt, bevor Sie diese E-Mail drucken. Diese E-Mai=
l kann vertrauliche Informationen enthalten. Sollten die in dieser E-Mail e=
nthaltenen Informationen nicht f=FCr Sie bestimmt sein, informieren Sie bit=
te unverzueglich den Absender per E-Mail und loeschen Sie diese E-Mail in I=
hrem System. Jede unberechtigte Form der Reproduktion, Bekanntgabe, Aenderu=
ng, Verteilung und/oder Publikation dieser E-Mail ist strengstens untersagt=
. Informationen zum Datenschutz finden Sie auf unserer Homepage<https://www=
.diehl.com/metering/de/impressum-und-rechtliche-hinweise/>.

Before printing, think about environmental responsibility.This message may =
contain confidential information. If you are not authorized to receive this=
 information please advise the sender immediately by reply e-mail and delet=
e this message without making any copies. Any form of unauthorized use, pub=
lication, reproduction, copying or disclosure of the e-mail is not permitte=
d. Information about data protection can be found on our homepage<https://w=
ww.diehl.com/metering/en/data-protection/>.

