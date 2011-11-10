Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROcPV-0002iy-1v
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 22:43:49 +0100
Received: by ggnq4 with SMTP id q4so153575ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 13:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=yVCLqVv2wTI/z7okNCW9nkkLoqCBmVYsRTvj1XPgHxs=;
	b=e329J+fmnvd03vPlE5YDXf49rGiNFIWrPJKtFU1tdLq+pg0HGjvg+ksAi8UJWdOHyE
	rhJr5c3wF5p1PFQ031kdUkTUqkHVDs4/5mRXCiA0/gg1JIAB0B9K2I9tSheT2LSLG42b
	hMEnw2oOeqSwi2jSCVZECU8wkrGCTPkRkwuuo=
Received: by 10.146.48.37 with SMTP id v37mr947552yav.6.1320961051230;
	Thu, 10 Nov 2011 13:37:31 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d5sm13778798yhl.19.2011.11.10.13.37.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 13:37:30 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 21:37:17 +0000
Message-Id: <970a806acfb6964c839411164ba0d2613417393a.1320961001.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320961001.git.otavio@ossystems.com.br>
References: <cover.1320961001.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320961001.git.otavio@ossystems.com.br>
References: <cover.1320961001.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] util-linux: split mcookie onto a package
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
X-List-Received-Date: Thu, 10 Nov 2011 21:43:49 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4db577c..dcf0ed9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -30,7 +30,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-	     util-linux-chkdupexe util-linux-mkfs"
+	     util-linux-chkdupexe util-linux-mkfs util-linux-mcookie"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
  --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
@@ -45,6 +45,7 @@ FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
 FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${PN} ${sbindir}/swapoff.${PN}"
 FILES_util-linux-losetup = "${base_sbindir}/losetup.${PN}"
 FILES_util-linux-mount = "${base_bindir}/mount.${PN}"
+FILES_util-linux-mcookie = "${bindir}/mcookie"
 FILES_util-linux-umount = "${base_bindir}/umount.${PN}"
 FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${PN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index fb5637e..e2fb727 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r9"
+PR = "r10"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.2.5



