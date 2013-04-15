Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URglm-0002H3-EL
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:36:33 +0200
Received: by mail-wi0-f173.google.com with SMTP id l13so787621wie.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=7jzJGRKJylZzRpzT6aASJa8NHyJJad8vj7kTYQGfsQk=;
	b=GrvGC9MtB/+eHsZYIqmszHCeJ+KItPE7Iuvn+wac0dUGQdCmQjqwPZNztp8NWAsXGd
	UrWbaipPvX3XyeeDjnVYLRCRJ9del1VXv+e+kJykP/PRbi7PStdvaiR/RcZtGKzSlvat
	7NdMIwmG3xysECCrr3lEskp940mgnii5nIS8X50MAHdgicSYBW7R0oYsGdFPu658gC2y
	YVZ706L1F7ZafwB1B6T34KtoM7KqzA5TwhHwq+Tv/WRrsXMF2lNJSCAhIcdV34xfiMPk
	1HiRwHN8cwgHNXMiZiddgmEpg1wv4ahfTk1KrG1xnB4fvGBreN2GPErtwSjgshdzvqwO
	nAVQ==
X-Received: by 10.180.13.34 with SMTP id e2mr10917112wic.29.1366021129780;
	Mon, 15 Apr 2013 03:18:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm12565372wij.2.2013.04.15.03.18.48
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:18:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 11:16:01 +0100
Message-Id: <1366020961-8549-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQl8ql6/9zZkFBY8QVVtBJ+m/YxHW7aVcMX7ljYRiGfJGxLjnL2qpqZmeZVpPgoefwKH9DC6
Subject: [PATCH] initramfs-live-boot: explicitly depend on udev-extraconf
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
X-List-Received-Date: Mon, 15 Apr 2013 10:37:26 -0000

init-live.sh depends on udev performing automounting, which happens in
udev-extraconf.  Explicitly depend on it so that we always have it installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 1e674a4..0cbfe02 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A live image init script"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 DEPENDS = "virtual/kernel"
-RDEPENDS_${PN} = "udev"
+RDEPENDS_${PN} = "udev udev-extraconf"
 SRC_URI = "file://init-live.sh"
 
 PR = "r11"
-- 
1.7.10.4



