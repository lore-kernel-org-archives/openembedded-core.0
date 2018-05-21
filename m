Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id E49626067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 21:50:59 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id e8-v6so20912474qth.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 14:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=MX4f3JUyP+NdNuAu3n34SyiEGXtx/KmqB24NOiRvDds=;
	b=nINI2ZTemmdU2N7vEXsxWV7UQE7i1ltGUMjIcR92spSzL2PKxr1H10f1j0lMLP64xR
	V6X6OucQZxKBc1QNAfcLYlMvxl6+uu9jGxpDI2nAw67s/FODVfZ9JlRg+k1EJPSxB2nn
	s7MpYx4aS8pZ4ns5oVma2GUqh8BlSe5oyc45vys2z4Y0mB/R5fGw6C40dU1LFLlAPS45
	1e8I3z1TxgZ/V6xGk49bwQpsoi1zHvPwcHmL+t8v+S1OjspFHaBMvuosjwahiS70rsn0
	YZ2rpCsjmAtbeMVmyGTwMyMIZz0HzLSHPNKbj4ckd5c6ZuFsw5NR0btASXofLPKFxba1
	0LUA==
X-Gm-Message-State: ALKqPweQ9wH4eMFfnwMxPrJJkShDrXsmYMW2Lil9ta9U1bVZYltZpRVn
	gVijqvPACIw/UIyVLrvJvAo5YA==
X-Google-Smtp-Source: AB8JxZpXLBu51GYKHlekXWbrGJ8IwyZk0MweRx6O7oQkJeoVesRySu+z9cNYQF2N7yfh9P5ebinZBw==
X-Received: by 2002:a0c:dc0c:: with SMTP id
	s12-v6mr19625980qvk.130.1526939460232; 
	Mon, 21 May 2018 14:51:00 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	b10-v6sm10626314qti.45.2018.05.21.14.50.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 May 2018 14:50:59 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 21 May 2018 18:50:51 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2018 18:50:49 -0300
Message-Id: <20180521215050.30322-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] linux-firmware: upgrade to 8fc2d4e5 revision
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
X-List-Received-Date: Mon, 21 May 2018 21:51:00 -0000

8fc2d4e Merge git://git.marvell.com/mwifiex-firmware
e1abab6 linux-firmware: update Marvell USB8997 firmware image to add WPA2 vulnerability fix
c38c231 linux-firmware: update Marvell SD8897-B0 firmware image to add WPA2 vulnerability fix
0686ec7 Merge branch 'firmware-update' of https://github.com/intel/opa-firmware
bb7f773 Update Intel OPA hfi1 firmware
397a604 qed: Add firmware 8.33.12.0
40d4117 linux-firmware: Add firmware file for Intel Bluetooth,9560
bf3934f linux-firmware: Add firmware file for Intel Bluetooth,9260
f865934 linux-firmware: Update firmware file for Intel Bluetooth,8265
7dab503 Merge branch 'for-upstream' of git://git.chelsio.net/pub/git/linux-firmware
0caed67 cxgb4: update firmware to revision 1.19.1.0
0783fb9 nfp: add symlink for mixed mode Agilio CX 2x25GbE cards
380957e nfp: update Agilio SmartNIC flower firmware to rev 5701
b562d2f linux-firmware: update wil6210 firmware to 5.2.0.18
c1aa76a linux-firmware: rsi: update firmware images for Redpine 9113 chipset
1621614 Merge tag 'iwlwifi-fw-2018-04-06' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
50c1323 iwlwifi: update firmwares for 3160, 3168 and 7265
c711ea5 iwlwifi: add some new FW versions and update older ones
8c1e439 amdgpu: update vce firmware for Polaris
31accdf linux-firmware: Add firmware file for Intel Bluetooth,9560
89139e8 linux-firmware: Add firmware file for Intel Bluetooth,9260
58cdb52 linux-firmware: Update firmware file for Intel Bluetooth,8265
9cb49be linux-firmware: Update firmware patch for Intel Bluetooth 8260
a3be6d4 Merge https://github.com/Netronome/linux-firmware into netro

License-Update: new files and version update. Same terms.
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index c96588473b..8d6f2f2dbd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -118,7 +118,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=ec6f70c8a1104ff87f6aa144d926f0dd \
+    file://WHENCE;md5=6f46986f4e913ef16b765c2319cc5141 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -181,7 +181,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "4c0bf113a55975d702673e57c5542f150807ad66"
+SRCREV = "8fc2d4e55685bf73b6f7752383da9067404a74bb"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.17.0


