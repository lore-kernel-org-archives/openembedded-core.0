Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 057FC6E672
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 15:27:32 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id F38635C0CAE;
	Tue,  9 Oct 2018 17:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1539098853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=yQ+0oRYd6aHl37N70iBf9t4NYEa5WDj7FjBTRUhwKNo=;
	b=h7/jGOnslOf671/48IKN+WlccpBNyI3+E4FLoWMFO9Lig1euY4EjJR/1+iIgYjdxNahD5y
	Vs80e1jcMtZPy5zz43rRXpvBW2wznqzNJZRasGqfp22e7QSi1uetI5e/+ZW4XSAlFBRP+X
	EEAGWa0wrcFExCKG8PsjxFKHfYxyAN4=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 17:27:29 +0200
Message-Id: <20181009152729.51409-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] linux-firmware: use ${nonarch_base_libdir} for all firmware
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
X-List-Received-Date: Tue, 09 Oct 2018 15:27:33 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Replace the remaining hardcoded '/lib' in kernel firmware installation
path with ${nonarch_base_libdir}.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 7829c24579..2525545bdd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -811,9 +811,9 @@ LICENSE_${PN}-ibt-misc    = "Firmware-ibt_firmware"
 FILES_${PN}-ibt-license = "${nonarch_base_libdir}/firmware/LICENCE.ibt_firmware"
 FILES_${PN}-ibt-hw-37-7 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.7*.bseq"
 FILES_${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bseq"
-FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi /lib/firmware/intel/ibt-11-5.ddc"
-FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi /lib/firmware/intel/ibt-12-16.ddc"
-FILES_${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi /lib/firmware/intel/ibt-17-*.ddc"
+FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc"
+FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc"
+FILES_${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc"
 FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/ibt-*"
 
 RDEPENDS_${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
-- 
2.13.6


