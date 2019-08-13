Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9227E9CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 19:52:44 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f9so4138145ljc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cj9VXIQJtBOxABE9d/YiWMQe3HLnDRgNmAgNttP4k7U=;
	b=hdnxj5Uk5j/WX2ZiphEY9tRhTi9UaxWjxH2rF0Nt9BFT9I67X93SxyFS7ckYbsUohK
	63RC5N/SAlMFXC5bfNklxpgxR/SKF88jM+mp8GV00RHv7oNlNevEltCIgWiib69/BLZ9
	KO19nPPiFxFrfb0GPlT8m86ldE2NoWtwkofFzfur6o/7M7HnfBxpKJnQvaEVJyNtHcfu
	ox9hKdCX9yvqhlpgNoe1KNzvrO0a3eP7xziaUrZgvtkO5wWOEKdL1xiaZwAfXEuY9n0P
	VP2IaMr6NYdhd5kAeXATuIkF9vjWjfsDA8zWKFt9LbXnpp800F+HUxU//GbRtG5Ya/fC
	WtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cj9VXIQJtBOxABE9d/YiWMQe3HLnDRgNmAgNttP4k7U=;
	b=eTqf9GpdL2/QJ/md6cdNikdpd3YAY8asWSPJ/klbdgNlyGPAwizCKJKfc+6p9sJfZO
	xTZMdiOlLn6vhagdng3//L5S4Shq4UmcexdBqpmX6cDQGvUB54CrvOs5L8hh7LW8DWlA
	tIsH4z9bhruLPHjHaFbOi48klVTuzywoX7kmtPL60rmZZY264BHnTw97vAfwcv8DiqTe
	xklrqxN3U1R3Uf7Xkb6QFAKGYusPWCEfBklB7XrW1ExVmzxD5zdVBOlkU0gJav/bBGkJ
	xteMa2uscnNrnE1wN/Ma3v/lo4oauwr9bYas7FdLkjzFRQIqFaQy9LBn+7gxcb74PYF4
	aaiA==
X-Gm-Message-State: APjAAAUkqNoxFgSUB40ISJeEawodc7GJ7FoKGHbaocYyhGFVtlQklGsS
	WpfYsvCeJ7aXmRKB+4QcjgiTUF6OWgo=
X-Google-Smtp-Source: APXvYqzyMdsVy/UWyzbOsTGNPl82ZtWBvhqJwSDizHlT3YHfQXscrjJS79US1Sc2D09clXRj9+SiRg==
X-Received: by 2002:a2e:9f02:: with SMTP id u2mr7761770ljk.4.1565725964622;
	Tue, 13 Aug 2019 12:52:44 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j3sm19789795lfp.34.2019.08.13.12.52.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 12:52:43 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 21:52:39 +0200
Message-Id: <20190813195239.30048-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] xrandr: update to 1.5.1
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
X-List-Received-Date: Tue, 13 Aug 2019 19:52:46 -0000

SRC_URI was moved from xorg-app-common.inc, since it has hardcoded file
extension (tar.bz2), but upstream stopped publishing tar.bz2 archives
for newer versions of the packages.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-app/{xrandr_1.5.0.bb => xrandr_1.5.1.bb}           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.5.0.bb => xrandr_1.5.1.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.0.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-app/xrandr_1.5.0.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
index ea6897948d..6583ea2371 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
@@ -11,5 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
 
-SRC_URI[md5sum] = "ebffac98021b8f1dc71da0c1918e9b57"
-SRC_URI[sha256sum] = "c1cfd4e1d4d708c031d60801e527abc9b6d34b85f2ffa2cadd21f75ff38151cd"
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "fe40f7a4fd39dd3a02248d3e0b1972e4"
+SRC_URI[sha256sum] = "7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762"
-- 
2.17.1


