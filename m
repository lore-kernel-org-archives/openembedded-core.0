Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RAQfc-0003Zr-Jn
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 20:21:49 +0200
Received: by yxj17 with SMTP id 17so2819477yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 11:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=LmObYtPiD+QRWxPOFqmsMbWKHN7nhZg2pc9llF7pleM=;
	b=KhDB3eeaOlFwJEf/vcdiZ+Avyk+1cZO2AIBQtV0oQVSkcLjwrfI//Z8HWWamSYU5Kh
	9uvvY+EajdMDhILz9QzftGnmAs1uPLBeNJyOl7U7TvMAboBFEiJMJoVmjxgti5HreucZ
	dHF9PNe36HEUKag3PczJvw0Q4SV7IFN4pXQeY=
Received: by 10.236.124.11 with SMTP id w11mr2949241yhh.130.1317579376562;
	Sun, 02 Oct 2011 11:16:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r30sm13093379yhj.20.2011.10.02.11.16.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Oct 2011 11:16:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Oct 2011 18:15:56 +0000
Message-Id: <8619b1806c0c26bb5f42a066d582d79ba92a2452.1317579313.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1317579313.git.otavio@ossystems.com.br>
References: <cover.1317579313.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1317579313.git.otavio@ossystems.com.br>
References: <cover.1317579313.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] image-live.bbclass: allow images to override ROOTFS and INITRD
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Oct 2011 18:21:49 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image-live.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index c910488..1d184a1 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -1,11 +1,11 @@
 
 AUTO_SYSLINUXCFG = "1"
-INITRD = "${DEPLOY_DIR_IMAGE}/core-image-minimal-initramfs-${MACHINE}.cpio.gz"
+INITRD ?= "${DEPLOY_DIR_IMAGE}/core-image-minimal-initramfs-${MACHINE}.cpio.gz"
 APPEND += "root=/dev/ram0 "
 TIMEOUT = "10"
 LABELS += "boot install"
 
-ROOTFS = "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
 
 do_bootimg[depends] += "core-image-minimal-initramfs:do_rootfs"
 do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
-- 
1.7.2.5



