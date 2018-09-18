Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 820FE795E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 15:16:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z96-v6so2536488wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0vXzuCoLxDbJzWqA3EpzQtNIJej7dwuR1eI5MybLZTE=;
	b=uwmjziZqK9hf+NYnA15qGnZlKnbemIVfxdhIIrVtlhYNyE63COa/eDaabVZ0l9jkK7
	X+LTf6uigY0Lih4lBK2pC7hqVvMcGhZNj6/0gCh5aVKW62ZQjh7+QygbmjKGwefs7fJn
	5rgxzheMi2Hqttw5+Q9Xj5ye0EtJAi50tI1HSlMn2OcN4eRUQghG0M5/7ePHppmRD3Cq
	pDxwt+hwn2b3ysVYSSHHYZ/hpn5hEouTsJAre2YG07bzzdEzuf6wqp4ouy46W/A2+hMT
	N6NLQSG1aT+mmTa1WIY2yEKvbkJm7krIPXOyAAmvc/4JocG9nRy3M15ZekNrnyWsFm7T
	Iggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0vXzuCoLxDbJzWqA3EpzQtNIJej7dwuR1eI5MybLZTE=;
	b=Juib5FYLXh7JBGVeDZ/FCasaNabpXkqaHIOcau7sRqJo+S5x0hBUjHQ37NEC3QLNZq
	8gFxlah+PI7zpANz90nEjSmZtNz1vDWh0Fxnv4iLAvwKukH29KQsRYnjGQSKkKwDKpzJ
	TokFM7hpiKFNBOjXERAHfqgM6ntXfc4TVYA4SFBVnMYH2jpBTEhr5AntxWsSd3cdNoUN
	Mf7HYJNemY2D5kp5FviZ9y6etTebAxCGNa/kA4fOpVoKa+C9BCIipH/wUScKxzC7yUHE
	EePNTlOsEtjiowfPvSLzclB5idlJxEL2Kr+CfbuH3AWIbdjSSAGMNZFgExXmxEScQip6
	LAag==
X-Gm-Message-State: APzg51ATrBjzdofWN4OkiW5W9Pg/6fkm2bAxxp06K8K63y7J6gaKbdaa
	OavQy6fQGUCre2CDvt4aPJhEjf1D
X-Google-Smtp-Source: ANB0Vda+3C7I4Y+oHfBubhWaU7jViWcW1/O0TmM26MsTgvNyxip02P6y3laFXfV67UEdyhVpwf1phg==
X-Received: by 2002:adf:a196:: with SMTP id
	u22-v6mr24771397wru.50.1537283776890; 
	Tue, 18 Sep 2018 08:16:16 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	142-v6sm1904838wme.35.2018.09.18.08.16.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Sep 2018 08:16:16 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 15:15:19 +0000
Message-Id: <1537283723-27429-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] Revert "kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that."
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
X-List-Received-Date: Tue, 18 Sep 2018 15:16:16 -0000

This reverts commit 65cded55fa96b1ba72149a31689c081ac27af7f7.

The fitImage deployed here is the one generated in kernel-fitimage.bbclass,
whereas the one deployed by kernel-fitimage.bbclass is a raw image, so we
need the one deployed here keeping.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel.bbclass | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bfb424396949..6b734be2b675 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -667,11 +667,8 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		# kernel-fitimage class deploys fitImages, skip here
-		if [ "$imageType" != "fitImage" ]; then
-			base_name=${imageType}-${KERNEL_IMAGE_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
-		fi
+		base_name=${imageType}-${KERNEL_IMAGE_NAME}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
@@ -688,13 +685,10 @@ kernel_do_deploy() {
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		for imageType in ${KERNEL_IMAGETYPES} ; do
-			# kernel-fitimage class deploys fitImages, skip here
-			if [ "$imageType" != "fitImage" ]; then
-				initramfs_base_name=${imageType}-${INITRAMFS_NAME}
-				initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
-				install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-				ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
-			fi
+			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
+			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
+			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
 		done
 	fi
 }
-- 
2.7.4


