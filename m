Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6097FCA4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:25 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d7so4552159pls.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=s0U58Y+R+PHwTk11BMKVmZhSjxmj37aIcdzJOSZJFUI=;
	b=tkzOw1fLgrp7BT0ZcQgPXQN1WEaM0rFVtfTAyNsRTriV6eetdfb+gABkEGzISEpL9o
	qMR3wVxvLMdPQHtFKk+kuiW1C00LL2kUhpmGuEtRkTNuYv65dT2zMVc6yRsGHMMCM2pH
	WtyVkQFBMvkhyvrhNL/Dfn8GbRFhfiDlQY7NS28fmoNPhMjSNSIYfERl614AnUP1bl1B
	J26EuSjP2t/XJhlC4yOtYgOl9ajjCcE5GMrbUG8UDoLzWGfViZIOL60atVYDXG7YkNJf
	ZGMd6AD79p0u95d6wF4GPTElb3MaD96TYHhy6JFIHaG3LcveQp2KpscDOTrh8RN3nTQy
	Ga5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s0U58Y+R+PHwTk11BMKVmZhSjxmj37aIcdzJOSZJFUI=;
	b=BROVv58HPcQ05H+v8n58WigcSLbsa9nuuRiZPEaro09WyF2CiWpotTN3blTvIXcTyZ
	4PNpC4xWeERHulUitJq2vZ0x+hZLuhNIAjLhYamSvTGvSzHxxZ2ct8BJNI58+JEXMQym
	d6fKjUnGXg8A8cMuiO57fIO1ICUk5TA1sxcUyIX5xJuzzr2SsIadW/J7OZ+yFaHNwuQD
	/dFW73Vqwf9sM0BRweJfiIsP1o7dmM5v1vCmHD6E2Dn0Sb5gfyAimTCc0JISckOyDSM0
	tgL8q+XLSxkQx5ZDKeuTr3l9dwtkyY9+mg9HWs/LNbsRX8Jyw2pq/gkelLa7jJtMTkm9
	37Bg==
X-Gm-Message-State: APjAAAVwFTNpWz36mAT3bFFJXDdSjnoIYj7yxlR2msEFIZqhueztg/cV
	AhCacGnwLJZ+RJgkSbcHRZ2XL+i5
X-Google-Smtp-Source: APXvYqy/jP362tSLBGG7QyxiE77Ky7Q1VjSEzIDG/NI2fN6tt2ZQFo+6R1CUDugjpDWr2C9zBqce0g==
X-Received: by 2002:a17:90a:353:: with SMTP id
	19mr27932521pjf.128.1574525486888; 
	Sat, 23 Nov 2019 08:11:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:15 -0800
Message-Id: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH 01/11] gstreamer1.0-plugins-base: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:26 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1.0-plugins-base_1.16.0.bb => gstreamer1.0-plugins-base_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.0.bb => gstreamer1.0-plugins-base_1.16.1.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
index 1d6f15e..9df67e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
@@ -18,8 +18,8 @@ SRC_URI = " \
             file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
             file://link-with-libvchostif.patch \
             "
-SRC_URI[md5sum] = "41dde92930710c75cdb49169c5cc6dfc"
-SRC_URI[sha256sum] = "4093aa7b51e28fb24dfd603893fead8d1b7782f088b05ed0f22a21ef176fb5ae"
+SRC_URI[md5sum] = "b5eb0651bab70bf1714f103bdd66ce47"
+SRC_URI[sha256sum] = "5c3cc489933d0597087c9bc6ba251c93693d64554bcc563539a084fa2d5fcb2b"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.7.4


