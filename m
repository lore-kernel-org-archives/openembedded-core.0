Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1T4c9C-0001mi-5k
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 20:28:50 +0200
Received: by pbcwy7 with SMTP id wy7so1957387pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=W/JdFO2+SVyZB/UfNOW8eZZLqGLpV2t+Ud7oYWO//M0=;
	b=Wx4Q6zr3dceJA4GZHS+sn0M0HWAfHbQpZ/+WLJtN2xF9UcDvWr8Dl338OYCpyJDkQ2
	XgHNu8bFLoGHG8yOxDmUFxsOp7Iuq3zCMVWjl8xLyCv/1kGmlEAMOV0B8NZ49rY1EV4C
	xe9aS7ONUh3yiRUpU2+zaz4qCtvzyj0w/DnXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=W/JdFO2+SVyZB/UfNOW8eZZLqGLpV2t+Ud7oYWO//M0=;
	b=N3Jjuyfby5P/tG7SuWk0UJuzI45NnfC8+/bOapyc6UEoYTAgr6dnfbWYAaKSSmeYfc
	trUTvs5K5D/4vpnkQt1pSkQhM63xzauB7C/PswEqY/xXGzm3yBfc8xoSgNWMwACKzKdS
	Xj4frgIXNWIPIChwHtiRprB1bPzL78Ps6sLiHO3yH0ws4mLbid8Yg1CNxu5uxILYLjA5
	T/K3+K4dtTmBdLoqO5V8V+E947GUWtpDdlMZdJpXWP8V0DcvaeVGdv0zuOVjEP5kT2BF
	0NGcSF/eMaPkhVJeHDofrF+ToD+lTRP11GBCa8N2cdeCSSV9PZhISPMPKILKp6pfcOu2
	Y9QQ==
Received: by 10.68.239.135 with SMTP id vs7mr6708314pbc.38.1345745802704;
	Thu, 23 Aug 2012 11:16:42 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id rz10sm6474431pbc.32.2012.08.23.11.16.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 11:16:41 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 11:16:04 -0700
Message-Id: <1345745765-22194-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk2KsTrMw/pLb8uzXHgGb8vCBYgzOFsf3kaxdKPjYO3mOkdDg2j2Qwrike1rHvhtI6WR9qp
Subject: [PATCH - Denzil 1/2] build-appliance-image: rename from self-hosted-image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 18:28:51 -0000

From: Valentin Popa <valentin.popa@intel.com>

(-) renamed self-hosted-image to build-appliance-image
(-) replaced build-appliance-image description

[YOCTO #2636]

(From OE-Core rev: 04096f31778886479dac479132bded57e717653e)

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/multilib.conf                           |    2 +-
 meta/recipes-core/images/build-appliance-image.bb |   70 +++++++++++++++++++++
 meta/recipes-core/images/self-hosted-image.bb     |   70 ---------------------
 3 files changed, 71 insertions(+), 71 deletions(-)
 create mode 100644 meta/recipes-core/images/build-appliance-image.bb
 delete mode 100644 meta/recipes-core/images/self-hosted-image.bb

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 3b47c48..950f7cb 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -581,7 +581,7 @@ BBCLASSEXTEND_append_pn-sat-solver = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-screen = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-scrnsaverproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sed = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-self-hosted-image = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-build-appliance-image = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-service = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-setserial = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-settings-daemon = " ${MULTILIBS}"
diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
new file mode 100644
index 0000000..2b7906f
--- /dev/null
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -0,0 +1,70 @@
+DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.  For more information, see the<a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
+IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r15"
+
+IMAGE_FEATURES += "x11-mini package-management"
+
+# Ensure there's enough space to do a core-image-sato build, with rm_work enabled
+IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
+
+# Do a quiet boot with limited console messages
+APPEND += "quiet"
+
+IMAGE_FSTYPES = "vmdk"
+
+inherit core-image
+
+SRCREV = "3ab5d73f0c49df9fefa2a46031d33436bbd7d7d8"
+SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
+
+IMAGE_CMD_ext3_append () {
+	# We don't need to reserve much space for root, 0.5% is more than enough
+	tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
+}
+
+fakeroot do_populate_poky_src () {
+	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
+	# will become invalid in the target.
+	rm -rf ${WORKDIR}/git/.git
+	rm -f ${WORKDIR}/git/.gitignore
+
+	cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
+
+	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
+	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
+	cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
+
+	# Remove the git2_* tarballs -- this is ok since we still have the git2/.
+	rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
+
+	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
+	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
+	mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
+	echo "export PSEUDO_PREFIX=/usr" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+
+	chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
+
+	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
+
+	# Allow builder to use sudo to setup tap/tun
+	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
+
+	# Use Clearlooks GTK+ theme
+	mkdir -p ${IMAGE_ROOTFS}/etc/gtk-2.0
+	echo 'gtk-theme-name = "Clearlooks"' > ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
+}
+
+IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
+
+python do_get_poky_src () {
+    bb.build.exec_func('base_do_fetch', d)
+    bb.build.exec_func('base_do_unpack', d)
+}
+addtask do_get_poky_src before do_rootfs
diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
deleted file mode 100644
index aef1507..0000000
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ /dev/null
@@ -1,70 +0,0 @@
-DESCRIPTION = "Version 1.0-r6 of the self-hosted image."
-IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PR = "r15"
-
-IMAGE_FEATURES += "x11-mini package-management"
-
-# Ensure there's enough space to do a core-image-sato build, with rm_work enabled
-IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
-
-# Do a quiet boot with limited console messages
-APPEND += "quiet"
-
-IMAGE_FSTYPES = "vmdk"
-
-inherit core-image
-
-SRCREV = "3ab5d73f0c49df9fefa2a46031d33436bbd7d7d8"
-SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
-
-IMAGE_CMD_ext3_append () {
-	# We don't need to reserve much space for root, 0.5% is more than enough
-	tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
-}
-
-fakeroot do_populate_poky_src () {
-	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
-	# will become invalid in the target.
-	rm -rf ${WORKDIR}/git/.git
-	rm -f ${WORKDIR}/git/.gitignore
-
-	cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
-
-	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
-	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
-	cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
-
-	# Remove the git2_* tarballs -- this is ok since we still have the git2/.
-	rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
-
-	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
-	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
-	mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
-	echo "export PSEUDO_PREFIX=/usr" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-	echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-	echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-
-	chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
-
-	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
-
-	# Allow builder to use sudo to setup tap/tun
-	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
-
-	# Use Clearlooks GTK+ theme
-	mkdir -p ${IMAGE_ROOTFS}/etc/gtk-2.0
-	echo 'gtk-theme-name = "Clearlooks"' > ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
-}
-
-IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
-
-python do_get_poky_src () {
-    bb.build.exec_func('base_do_fetch', d)
-    bb.build.exec_func('base_do_unpack', d)
-}
-addtask do_get_poky_src before do_rootfs
-- 
1.7.9.5



