Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 16C5B7C864
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 11:28:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i12so2403131wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3ZTS6lrQcJFmyR6+j4zCbYxhgDdweFTR0cqRNbmsw04=;
	b=UhAnmAuTIuX1QHieonRSyQ+qUr5wKDZ0dgilA/R4uTv5O0A8Zj+psc7tnaBq0ryVZ8
	rfY46IuAd3Mzaw+mfGNoIjDYZnuj542Dq/Gc/tyUu7XnBppRZeZfxXoVSp4sQ7+3uBaC
	iZMKt7yem0Hy7GNtcHqZl8xpR4xwQB5DKHcUIT0sktWE2IBgFy4KweKCI4yU++amS5dA
	rHpiqZ9CAcaoLbUDCh4Xi/Vi2ExYnsJsphLJ3yRENVid5mU0D5Sug359X30fNtqlflCr
	8D7jt7foIWG5V3JcgbrWB57Y1a/38WhIwg34NneXivfzlxFH8nazRcR2ZusWkeKNe7yG
	47nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3ZTS6lrQcJFmyR6+j4zCbYxhgDdweFTR0cqRNbmsw04=;
	b=KBQqrHcCoNjOyhsBs9CTW6WN4cdNhIbMa/CkjPyupTxJrVZ2+dTOJlzOQGfr9EMWV5
	CVTmrb7uHf1DuPeNeA8/7PhNdnsCuUUh5h9rMLqfFqO/TF5+uDH5XZfTV+L3PlkO0k4M
	mi+lSLpDwbLaJIug7Hk6FneRMBcCSchAKPOSnqn3x1TPX9UgCGscFzXcnWg0r205AGJZ
	G1Eye5S4JUSpAKpyjtSnlpNtsXyA31Wt4wUE+KX/p/Gg0n3JfJXUtUroQG82KL0mAUaH
	xriv0tU5NgAEPvDFVyhggP6uNzKiJ3Z/jxOBoXrfH5pSjGGqFxoAvFaXU0/A9nyZoLxp
	mFWA==
X-Gm-Message-State: APjAAAUIJQBQpM/XdRSKTWUHeJ4Ye6qr3Axe4IxG2wS8n9GQrwmEP4Hy
	zjLfCDOfqGlBjZmiKSI4KryRtwrW
X-Google-Smtp-Source: APXvYqxbfIDQoG8oUfy/Jp1opW/plEZtnd3e6xRw/qJMiONdAcDZ9vFjGotXizMHi2uxc4deDKcW5w==
X-Received: by 2002:a5d:5544:: with SMTP id g4mr9032876wrw.269.1551612484568; 
	Sun, 03 Mar 2019 03:28:04 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id r6sm3773462wrx.48.2019.03.03.03.28.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 03:28:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 12:27:49 +0100
Message-Id: <20190303112752.16353-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190303112752.16353-1-alex.kanavin@gmail.com>
References: <20190303112752.16353-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/9] qemu: remove support for building against host sdl
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
X-List-Received-Date: Sun, 03 Mar 2019 11:28:04 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 985289f5426..a9d28bf5a38 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -80,14 +80,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


