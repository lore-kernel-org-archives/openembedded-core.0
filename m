Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7BD6010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 20:14:24 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id p10so3226705lfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u1yAhIGio5LYhLUBQwA/PKRjC/OCVA0EVUt7KpkTiAM=;
	b=S+ooVyJoQ0AHXSpDkQBGHOQX9SaP8qbOP2dldG1K8CYCfmx5Tb/cNcVAeMD/k+IjgG
	/w725uswIT8hp0HbloQjjqRPNCE/kWITD2++Ehy0T8QsH8xNJUoHf6cTLrAbXXlPJWZd
	pwbYLCt88x22W/q46adwKupePFxKqz4LzNyx+IgciLEZW38QtyWNclaafPYR2YbVVktn
	N2LbLNQEh7C51z/Xle1OuEj3vn/YXCjYRibT24Ik5YkI4pf5y1p8J2r/7IuQYl18Itxj
	eSgwL8YjfWRdC0GExv2g62XUFHLFq/6X8N+orWoVCYsDPs3i7iJ1tcN1p90FOl+kX813
	NCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u1yAhIGio5LYhLUBQwA/PKRjC/OCVA0EVUt7KpkTiAM=;
	b=mUjtK5/JahodJ1ftCio5rerqhlzDD2qnZ0FNG/VXB4av+fVCdQa2TOySWFnP6qT+5A
	SPKUWXfQsxQws4eVN+JcSXlw2Vwo1Yj6OOKMoiWjLzFATNQ77KMdxlq/owiHTDeh/4Ze
	wWdHVFtRODQG73pD6Us/vzoiD35MKTS5q1tiLTeKe7zVp5x6yTOyE2K7ao0PXZ/iG/ct
	k8Ox6rk90JfQlJof4v91gkv5Regw0YborQLQcgwD0CyDIVejFil/ImhahzU5YX4JMHGR
	w02BhyzvxCkAlJ3uJwWyHsBgX0vaL8ShQEaX21WKuY4GrA5bO8S+zRtskVAmerVGtW4z
	3MLw==
X-Gm-Message-State: AOPr4FXvKy4WcITQceY4+WCuTSLAAiAW1l4JWg/A52yD7RTWANWNLurTNf1amJ39+GBkrA==
X-Received: by 10.25.159.211 with SMTP id i202mr1830720lfe.76.1463775264499;
	Fri, 20 May 2016 13:14:24 -0700 (PDT)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	po7sm3616939lbb.16.2016.05.20.13.14.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 May 2016 13:14:23 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 22:14:20 +0200
Message-Id: <1463775260-17504-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] build-appliance-image: use 'lnr' instead of 'ln -sr'
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
X-List-Received-Date: Fri, 20 May 2016 20:14:26 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

For portability, not all hosts are running sufficiently new coreutils.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/images/build-appliance-image_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_14.0.0.bb b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
index 2a1a56b..d6de67c 100644
--- a/meta/recipes-core/images/build-appliance-image_14.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
@@ -54,7 +54,7 @@ fakeroot do_populate_poky_src () {
 	cp ${WORKDIR}/README_VirtualBox_Guest_Additions.txt ${IMAGE_ROOTFS}/home/builder/
 
 	# Create a symlink, needed for out-of-tree kernel modules build
-	ln -snr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
+	lnr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
 
 	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
@@ -84,7 +84,7 @@ fakeroot do_populate_poky_src () {
 	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
 
 	# Load tap/tun at startup
-	ln -sr ${IMAGE_ROOTFS}/usr/sbin/iptables ${IMAGE_ROOTFS}/sbin/iptables
+	lnr ${IMAGE_ROOTFS}/usr/sbin/iptables ${IMAGE_ROOTFS}/sbin/iptables
 	echo "tun" >> ${IMAGE_ROOTFS}/etc/modules
 
 	# Use Clearlooks GTK+ theme
-- 
1.9.1


