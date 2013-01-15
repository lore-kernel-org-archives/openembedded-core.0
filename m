Received: from mail-ie0-f182.google.com ([209.85.223.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvDHG-0000GK-Lb
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:38:35 +0100
Received: by mail-ie0-f182.google.com with SMTP id s9so1021512iec.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Ga54e7zCCaffUwYMprnwcPQISZNwRN8FycjL4285uQY=;
	b=dpHbpRXKKQ28QZJqrhYGxJKKqzcNRmz+1cuh0lFbAxzX5iQyDAio41EaJHuPtLg7Tq
	TZkL3HabywPtZNy79Ava/6J+O/GySYo6yRP7ccLoB+wysBj9bVF9VkoGv8jKyGaw4so6
	vgQLVNCnekAvFRHxmrKbr0jUE2pnSZsBO8UUFwgP8lCztvktO28CpaufaJo7qXmyiqbi
	6XAvq9fzGsEVatS0HuUcRzPBzoAxCSicAqYPmHJBZ33mNKsxSAIOCLf2LiE0mBUTD8TF
	6sY+uhqLWt8f3y/l/E7E6j/f9zno0g1Pqy+y6tNQZbsiRLw2hJMMeiDki7bNIunjDgKD
	7/Wg==
X-Received: by 10.50.196.162 with SMTP id in2mr2813442igc.70.1358281389771;
	Tue, 15 Jan 2013 12:23:09 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qn10sm2655187igc.15.2013.01.15.12.23.05
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:23:07 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 13:22:49 -0700
Message-Id: <97d25cc304e927722b97829b5a9b3326c130a057.1358281118.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0.3
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/6] linux-firmware: use LICENSEs which can actually be parsed
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
X-List-Received-Date: Tue, 15 Jan 2013 20:38:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

: is an invalid character for our license format.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 98a2d07..8700ca4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
 SRCREV = "0d6729f2b0bc6254d3628eb831bc80a36b5a17db"
 PE = "1"
 PV = "0.0+git${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
 
@@ -51,31 +51,31 @@ do_install() {
 
 PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
 
-LICENSE_${PN}-ralink = "Firmware:LICENCE.ralink_firmware.txt"
+LICENSE_${PN}-ralink = "Firmware-ralink"
 FILES_${PN}-ralink = " \
   /lib/firmware/rt*.bin \
   /lib/firmware/LICENSE.ralink_firmware.txt \
 "
 
-LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
+LICENSE_${PN}-sd8686 = "Firmware-libertas"
 FILES_${PN}-sd8686 = " \
   /lib/firmware/libertas/sd8686_v9* \
   /lib/firmware/sd8686* \
   /lib/firmware/LICENCE.libertas \
 "
 
-LICENSE_${PN}-rtl8192cu = "Firmware:LICENCE.rtlwifi_firmware"
+LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192cu = " \
   /lib/firmware/rtlwifi/rtl8192cufw.bin \
   /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
 "
 
-LICENSE_${PN}-rtl8192ce = "Firmware:LICENCE.rtlwifi_firmware"
+LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192ce = " \
   /lib/firmware/rtlwifi/rtl8192cfw.bin \
 "
 
-LICENSE_${PN}-rtl8192su = "Firmware:LICENCE.rtlwifi_firmware"
+LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192su = " \
   /lib/firmware/rtlwifi/rtl8712u.bin \
 "
@@ -87,4 +87,3 @@ FILES_${PN}-wl12xx = " \
 "
 
 FILES_${PN} += "/lib/firmware/*"
-
-- 
1.8.0.3



