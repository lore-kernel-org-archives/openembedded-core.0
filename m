Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E89D745D1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 21:16:33 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id o15-v6so13605285qtk.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 14:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=gOeK41tpNbjlWypPkiwp8Ro7E/7X++9LpXmZ4/iKGaU=;
	b=ZLfaGCbn0dkle3o/Pf6rl6JoFVs1KBkTtl0muxk4x8dNnHAWApLWqDmOv8FYwBJRD+
	BrrJ+veyA29zeaExM9XM00YbGuQ16+deUl63g03WqYhp8uYKmVUi4y7YHdwIZbXLYXZr
	9HZYZHkG4pwQBUwCC3p++v0FcGzU7xXMz3H+g5bMMHSJ3qCi9iNDRpDL9HT3juFGP8Id
	Upnc26oqHEyBtam9jserWP4dR7hK13Fn4FGzSYvOsF4K6kjXiMRaZdvMCUX7hsuPDQOI
	YpwOGuAScH4UGK8IfYgTzp5j9/DNtXgyEWLwECsG/32/DfQszYdaGhEJf3LNuwHZY84u
	6IaA==
X-Gm-Message-State: APzg51Bkj5Qo2GYl7mtxgefTlatGvnqJWJatYeB2gp53mcg/I2Cd8utg
	Y+kVPDx2XIq6J5xWbuqN6PzKfJtnbPA=
X-Google-Smtp-Source: ANB0VdagKU3f7Kn8KrR/+x3AWFnZcWXWNRlCFxlOPYZIlJOEIJFBUkLcS1YmxA/5uid2Il0ym4jQEA==
X-Received: by 2002:a0c:d5d3:: with SMTP id
	h19-v6mr16166696qvi.218.1537132593829; 
	Sun, 16 Sep 2018 14:16:33 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	c21-v6sm6959154qtj.22.2018.09.16.14.16.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Sep 2018 14:16:33 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 16 Sep 2018 18:16:27 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Sep 2018 18:16:22 -0300
Message-Id: <20180916211625.18597-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] linux-firmware: Bump revision to 44d4fca
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
X-List-Received-Date: Sun, 16 Sep 2018 21:16:33 -0000
Content-Transfer-Encoding: 8bit

44d4fca Merge https://github.com/pmachata/linux-firmware
253a573 brcm: update firmware for bcm43362 sdio
3cee728 Mellanox: Add new mlxsw_spectrum firmware 13.1703.4
ccab6c7 rtl_bt: Add firmware and configuration files for the Bluetooth part of RTL8822CU
75d2b12 Mellanox: Add new mlxsw_spectrum firmware 13.1703.4
85c5d90 nvidia: switch GP10[2467] to newer scrubber/ACR firmware (from GP108)

License-Update: new firmware files additions
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 1b6be054a2..7829c24579 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -122,7 +122,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=feb25f3efdbe10fcc121005d02d407d6 \
+    file://WHENCE;md5=36ef3e9887bb8b38ff265c602de6740e \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -188,7 +188,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "fea76a04f25fd0a217c0d566ff5ff8f23ad3e648"
+SRCREV = "44d4fca9922a252a0bd81f6307bcc072a78da54a"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.19.0


