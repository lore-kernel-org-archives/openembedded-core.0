Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id D27596C491
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:34:59 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 32so6265479ota.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D5dIf1zg+3A5TN76DxkzBzPSeDMnNGDytnrFntFW84U=;
	b=aVTl8Nx3WM/fnTTMc9jn1RNj7zt/CeZl+38e5agNSZcIBPsaT1hqDQYG8nBi63m9An
	TwjXg+f5jzFfWWfohEvewwe92Ymdw6qY9+PS7afXtysM+JsAA+fPK1zQWkDLN793pQ5J
	8wnIxGez36ikoCCNCwymwMT6W2zJRRCbQmAQvnbd5LmUA6d41hTywj/WaK6ynosOtMfW
	cy8OqumRAWISx3LKqZY0rZyMB65CuCwDvZCsLQQ+kEZ1lZkkJ8JoC8vo7mNj2hfwdn29
	vfG1mKkuOEmKh09VrxXWT5zN8jojMNNFxnDPwgESLiCR6BdeTm+LAWcMqCpULCaolD2L
	2Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D5dIf1zg+3A5TN76DxkzBzPSeDMnNGDytnrFntFW84U=;
	b=tec0+Zo1nWpObyf+WAuT0dGT+N7is5aNMarv61mG3wL9cpdz4O40QEjDJL7hRWLv6j
	0MwozC5WXX6LbP9qx/OPcLy/dYiv+gw0GYbbTmwmrgMAS7E5t6OkN62ydssYMGzUeYa/
	94VsdS89+RqUotFJh83bSc/n89rT+Z4AcFAIRjFBus9Y+ETi/F1U2SW81pSKBv+r4VJ7
	t+lid1aLJk+nx8r28W3wlf2AyLvTrNfyQ4neSYCqPf6HqcsGww7NuhbdYaMbDrY+FfuJ
	TEM8fNdDnifqykq8xRfk16lJacV1lk/19U6lLF1ccZdNyPf9DT1p8e6yCjclOfKHvaNd
	NRVA==
X-Gm-Message-State: AHQUAuZyRbUdAxGiXY915ksyUFV0ju3jsSd816hgn0OdLjUKua0QrP/B
	oz02sBRCHKlVZmOOAEQDwah1tRlDNBo=
X-Google-Smtp-Source: AHgI3IZHfMP/irvUWFsVhZm9ZbztjjJ+7p+j2f0OU+OXGo0lG4m5oEFBm1K+u396JPyi8aPu/emPkg==
X-Received: by 2002:aca:720a:: with SMTP id p10mr2720373oic.169.1549380900350; 
	Tue, 05 Feb 2019 07:35:00 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	l108sm8132263otc.23.2019.02.05.07.34.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 07:34:59 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 09:31:44 -0600
Message-Id: <20190205153144.26220-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Dustin Bain <dustin.bain@garmin.com>
Subject: [master/thud][PATCH] busybox: update to 1.29.3
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
X-List-Received-Date: Tue, 05 Feb 2019 15:35:00 -0000
Content-Transfer-Encoding: 8bit

From: Dustin Bain <dustin.bain@garmin.com>

Updates busybox to version 1.29.3 to fix a bug related to parsing of
config files: 2993551ef ("Revert "libbb: remove unnecessary variable in
xmalloc_fgets"")

Upgrading the recipe was chosen instead of backporting the fix as a
patch because the only difference between version 1.29.2 and 1.29.3 is
this revert.

Signed-off-by: Dustin Bain <dustin.bain@garmin.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../{busybox-inittab_1.29.2.bb => busybox-inittab_1.29.3.bb}  | 0
 .../busybox/{busybox_1.29.2.bb => busybox_1.29.3.bb}          | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.29.2.bb => busybox-inittab_1.29.3.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.29.2.bb => busybox_1.29.3.bb} (91%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.29.2.bb b/meta/recipes-core/busybox/busybox-inittab_1.29.3.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.29.2.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.29.3.bb
diff --git a/meta/recipes-core/busybox/busybox_1.29.2.bb b/meta/recipes-core/busybox/busybox_1.29.3.bb
similarity index 91%
rename from meta/recipes-core/busybox/busybox_1.29.2.bb
rename to meta/recipes-core/busybox/busybox_1.29.3.bb
index df3ea5906b..6064e9fdc6 100644
--- a/meta/recipes-core/busybox/busybox_1.29.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.29.3.bb
@@ -44,5 +44,5 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "46617af37a39579711d8b36f189cdf1e"
-SRC_URI[tarball.sha256sum] = "67d2fa6e147a45875fe972de62d907ef866fe784c495c363bf34756c444a5d61"
+SRC_URI[tarball.md5sum] = "0a367e19cdfd157e8258d87f893ee516"
+SRC_URI[tarball.sha256sum] = "97648636e579462296478e0218e65e4bc1e9cd69089a3b1aeb810bff7621efb7"
-- 
2.20.1


