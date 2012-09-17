Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDYoT-0008LM-Ol
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 12:44:25 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so1894453wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Qq4PN+Xa8yTBT5bkz8Zb4p5WAtc0KokrugQVGNufOUU=;
	b=CO7tG07J5BHglcFv/K8ftLRdN8LwwhhqHsYsUsPy/s56eMp9aL5JifdHi8KRFJeWBu
	o/VEBANle6XKvervSAlHiZP/YsfMEOmhvRkf0/qrnX2xxH3KcW6zUbHSWhz56CXnOD6G
	R28+cTRV7SYRoHPomxztEua3eIiLnfKg//9pQi9gf05FSocCdlqjLX1jDc+iJ2kbjG3k
	O4oMGejSY6jyyEJimDwk2xA49qRH/1T2acLfvFSfnq+JJoWvAJoSj7ykA1RWObiJmcta
	z24VLWgUqiFqUwLXMrM2OpFYaSpZ/W2g5KrNnGOxmHxYLfN0x4kfPUp4K+X6knLm7lc0
	VMJg==
Received: by 10.216.243.203 with SMTP id k53mr1645624wer.90.1347877909521;
	Mon, 17 Sep 2012 03:31:49 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id t7sm24968727wix.6.2012.09.17.03.31.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:31:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:30:53 +0200
Message-Id: <1347877853-30738-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
References: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlEinlJ/ub618lvY84AcITXwR+fI6nIqtpZB6IiKMgxam1lMwxJ0/t/t5nuEGM/TJbnYuV7
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][bluez-updates 5/5] bluez4: fix packaging issue after update
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
X-List-Received-Date: Mon, 17 Sep 2012 10:44:25 -0000

From: Saul Wold <sgw@linux.intel.com>

WARNING: QA Issue: bluez4: Files/directories were installed but not shipped
  /usr/share/dbus-1
  /usr/share/dbus-1/system-services
  /usr/share/dbus-1/system-services/org.bluez.service

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.101.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index a2ba66f..4a360b6 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch"
@@ -22,7 +22,7 @@ ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/"
+FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
-- 
1.7.7.6



