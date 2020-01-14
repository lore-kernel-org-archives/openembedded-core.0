Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id D832C7FC14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:12:44 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g17so11334179wro.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 01:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=D3t2zQ1qWam8f98kJk99eNmWM+IsyF6vVzwOEjST5zc=;
	b=T2MoZ/Su3MQys1+m4zG4vPz0hRT5GWG+PXaQ2xpdec8KiBOTd29bwyggmR+/8TB16F
	oYQUfVx3JgA/oMhVoR1Z3AGb0N+gT+KV6nRgI2nKZS6NFIFRCMkzWXsRxrDN3yR3Mh30
	XY5ks7woHhGUALyDuKGfNcd/QydeFsOxl0XFs3VJwvE4w0eY3oY1tSCskJfnyD0nQY8R
	mQMVj5jr/HUGxlOt67X6dSxpMkJYJNKbrikLr+LggXu5Qjwhn1kooq6eySaqrUSIJ5CP
	gQPc731nBE1W9itamXHZz/6s1QDiCeGLqCuXcvG7SpOhrHGYaKsx990vXIWbm/ILWxUk
	ZZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D3t2zQ1qWam8f98kJk99eNmWM+IsyF6vVzwOEjST5zc=;
	b=LWZekBBoPpjvILO0vRGCqJQGd5qE0uNA+/Jtpm4PQi732bw672+vF/39m0LnLQNR2K
	wzmd3KYcBfEtD14o0gf0BeAcz/JVALWFpEGlQkhSZlz83M78U9joKtk2xZ31e9Rspn/b
	Hl7qPdgVryZMViYwnreIaonHbShuDd8BcIneZo3i42RGsUt5y0sHsKpXpzfSGdEwNd0e
	VHMVpH9BjOJfzk1xWH7k/919U1k1HjUbV5SIpD0/zz6p/nBW0KWqhTQwTVKhSeMttg4y
	StyinQ1Oufio4AegEfaZhWH1FRs+t59kWn6DX7i3c84X5NEkVFPs4UKT9/5zEA6jnnvb
	Wu/Q==
X-Gm-Message-State: APjAAAUhW58TSPZhQvhRBZWqyieQbWgwwcVJoKUlkPBnLjQ3D2a1Yhw/
	uc1VN0rnQr36tJhzu9a/cgei/J8v/oM=
X-Google-Smtp-Source: APXvYqyhtS335DVnNP9UmXWTpa7Y8Md3fB3cz93Og/qf+G7BKGdV6MhQFtvWcud8qSolA3XgGgxDMQ==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr23470084wrs.222.1578993165239;
	Tue, 14 Jan 2020 01:12:45 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	q14sm18312523wmj.14.2020.01.14.01.12.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 01:12:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:12:27 +0100
Message-Id: <dff0960ba2cbcb1ee58dd0eeeeb294641e3c84de.1578993027.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv5 8/8] images: respect IMAGE_NAME_SUFFIX also for *-testdata.json and *-qemuboot.conf files
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
X-List-Received-Date: Tue, 14 Jan 2020 09:12:45 -0000
Content-Transfer-Encoding: 8bit

* it might be cleaner to move these including the suffix into
  image-artifacts.bbclass

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/image-live.bbclass          | 10 +++++-----
 meta/classes/qemuboot.bbclass            |  2 +-
 meta/classes/rootfs-postcommands.bbclass |  2 +-
 meta/classes/syslinux.bbclass            |  2 +-
 meta/classes/testexport.bbclass          | 10 ++++++----
 meta/classes/testimage.bbclass           |  5 +++--
 6 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 9ea5ddc312..a20a409721 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -130,14 +130,14 @@ build_iso() {
 	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
 		# PCBIOS only media
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
+		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
 			$mkisofs_compress_opts \
 			${MKISOFS_OPTIONS} $mkisofs_iso_level ${ISODIR}
 	else
 		# EFI only OR EFI+PCBIOS
 		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
+		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
 			$mkisofs_compress_opts ${MKISOFS_OPTIONS} $mkisofs_iso_level \
 			-eltorito-alt-boot -eltorito-platform efi \
@@ -146,7 +146,7 @@ build_iso() {
 		isohybrid_args="-u"
 	fi
 
-	isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
+	isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.iso
 }
 
 build_fat_img() {
@@ -238,13 +238,13 @@ build_hddimg() {
 			fi
 		fi
 
-		build_fat_img ${HDDDIR} ${IMGDEPLOYDIR}/${IMAGE_NAME}.hddimg
+		build_fat_img ${HDDDIR} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.hddimg
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_install
 		fi
 
-		chmod 644 ${IMGDEPLOYDIR}/${IMAGE_NAME}.hddimg
+		chmod 644 ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.hddimg
 	fi
 }
 
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index fbcd1f8098..7924b27689 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -85,7 +85,7 @@ do_write_qemuboot_conf[vardepsexclude] += "TOPDIR"
 python do_write_qemuboot_conf() {
     import configparser
 
-    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
+    qemuboot = "%s/%s%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'), d.getVar('IMAGE_NAME_SUFFIX'))
     qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
     finalpath = d.getVar("DEPLOY_DIR_IMAGE")
     topdir = d.getVar('TOPDIR')
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 14fe0d2f80..00f57bcc06 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -330,7 +330,7 @@ python write_image_test_data() {
 
     deploy_dir = d.getVar('IMGDEPLOYDIR')
     link_name = d.getVar('IMAGE_LINK_NAME')
-    testdata_name = os.path.join(deploy_dir, "%s.testdata.json" % d.getVar('IMAGE_NAME'))
+    testdata_name = os.path.join(deploy_dir, "%s%s.testdata.json" % (d.getVar('IMAGE_NAME'), d.getVar('IMAGE_NAME_SUFFIX')))
 
     searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
     export2json(d, testdata_name, searchString=searchString, replaceString="")
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 894f6b3718..fab7bc0972 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -72,7 +72,7 @@ syslinux_hddimg_populate() {
 }
 
 syslinux_hddimg_install() {
-	syslinux ${IMGDEPLOYDIR}/${IMAGE_NAME}.hddimg
+	syslinux ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.hddimg
 }
 
 python build_syslinux_cfg () {
diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 59cbaefbf9..c5f0bb768f 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -49,8 +49,9 @@ def testexport_main(d):
     from oeqa.runtime.context import OERuntimeTestContext
     from oeqa.runtime.context import OERuntimeTestContextExecutor
 
-    image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+    image_name = ("%s/%s%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
+                               d.getVar('IMAGE_NAME'),
+                               d.getVar('IMAGE_NAME_SUFFIX')))
 
     tdname = "%s.testdata.json" % image_name
     td = json.load(open(tdname, "r"))
@@ -122,8 +123,9 @@ def copy_needed_files(d, tc):
             shutil.copy2(json_file, cases_path)
 
     # Copy test data
-    image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                            d.getVar('IMAGE_LINK_NAME')))
+    image_name = ("%s/%s%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
+                               d.getVar('IMAGE_NAME'),
+                               d.getVar('IMAGE_NAME_SUFFIX')))
     image_manifest = "%s.manifest" % image_name
     tdname = "%s.testdata.json" % image_name
     test_data_path = os.path.join(export_path, 'data')
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index a1d0ddbb47..68b5bd8ce6 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -183,8 +183,9 @@ def testimage_main(d):
 
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
 
-    image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+    image_name = ("%s/%s%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
+                               d.getVar('IMAGE_NAME'),
+                               d.getVar('IMAGE_NAME_SUFFIX')))
 
     tdname = "%s.testdata.json" % image_name
     try:
-- 
2.20.1


