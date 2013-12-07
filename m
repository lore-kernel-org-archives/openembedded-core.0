Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 75E496C6EB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 18:12:08 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so839428eei.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2013 10:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=etKo8pdx9DQIAw71rCdvpy0Lw2bRJ+6bA33XH6XhSFs=;
	b=MyiCtbK4RTr1vm2mYNZK66lprEr/7arMV2nEAgu2tjqx4YzFykkzAdJkGal+u51gE9
	4B59Ogp7tUqzWG7noeJ++hywLUPtGMOvMQmj7P9FZ5mgVED+d6KWpvyb6WDhthQ0yIxG
	kyO1Q0Wt261PUwjBadWZ/VJ01vZCs0o+vvvlYIMOeuj/DlnNX7RtuNSomVmgtid9fWXY
	2CaYKDaFwq3sfpmgBWxy2ZIbbBnj6aIY24Uotv0Brjpj3PBf+tYgSD4uWNnI+Dsw2s+s
	BqUlTyLR2gM4ZoX9TuwjQGCWrNYy2c1pJWbs7uKzDBFuxAkd5mnA5VyoXhgBUQJoaGnV
	ryjw==
X-Gm-Message-State: ALoCoQl1g17nE/RArnmEVZnHaYfK4hJjdQpUgDuZldA8r4+YEFzBf856/gqUeMU595hCW2b4SOZn
X-Received: by 10.14.108.134 with SMTP id q6mr440089eeg.96.1386439927717;
	Sat, 07 Dec 2013 10:12:07 -0800 (PST)
Received: from localhost.localdomain (5-13-147-220.residential.rdsnet.ro.
	[5.13.147.220])
	by mx.google.com with ESMTPSA id 44sm8831336eek.5.2013.12.07.10.12.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Dec 2013 10:12:07 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2013 20:12:01 +0200
Message-Id: <1386439921-11748-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH V3 1/1] libav: Add v9.10
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
X-List-Received-Date: Sat, 07 Dec 2013 18:12:10 -0000

This version includes libavresample needed for packages like xbmc.
To use this version add:
PREFERRED_VERSION_libav = "9.10".
Removed git version as being an older version of a 9.X release.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-multimedia/libav/{libav_git.bb => libav_9.10.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/libav/{libav_git.bb => libav_9.10.bb} (65%)

diff --git a/meta/recipes-multimedia/libav/libav_git.bb b/meta/recipes-multimedia/libav/libav_9.10.bb
similarity index 65%
rename from meta/recipes-multimedia/libav/libav_git.bb
rename to meta/recipes-multimedia/libav/libav_9.10.bb
index 951baa9..48bab7d 100644
--- a/meta/recipes-multimedia/libav/libav_git.bb
+++ b/meta/recipes-multimedia/libav/libav_9.10.bb
@@ -5,12 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-PV = "9.8+git${SRCPV}"
+SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
 
-DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "9aaca159bd220582c698f13d081a455f398c9975"
-SRC_URI = "git://git.libav.org/libav.git"
-
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "4b49d1d8734815ca095bb0600d41c5cb"
+SRC_URI[sha256sum] = "83dbe640779da1c1e8d8836c99575f57f749d18407494ebca451578afee9300d"
 
+DEFAULT_PREFERENCE = "-1"
-- 
1.8.1.4


