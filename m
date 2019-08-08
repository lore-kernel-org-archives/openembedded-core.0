Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9034C60291
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 17:45:28 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y17so65128621ljk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TJo44fbAt/LuHUfEt/NetizjLDPjI3KABgYBdTj66wI=;
	b=bvmCpKu/7Tm3xpNkeGqt65OG48yNNCm/e/Q0Lts7sq/zE7aJPg2UNIwowGiVikFdVc
	/3+sFXUlK0WbbBPMGvgFs8PxbKXPkfqlc8WaMyxZg8KC6ruIhjkhPro/c5jnKiJ7R67v
	Xam88d+Tt8+6Bsqgj8jzZXz7L7p0xToDjsb67D7nMS+gYUIxQJfCTof2PHMWB8ARn2QS
	I8ua1TcLMCNcHMIc57+p3U2hP9VXgw0vhoA7WPAm7miyCSa/oBNrXHJ7pUCds5NAIO8g
	H5/Ja4Kgyjs/c34upzTa1v6ZfrvLtexYgbtFMpTMDuQkMogLaxN+TQ9KRUqpbROex4DD
	ZEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TJo44fbAt/LuHUfEt/NetizjLDPjI3KABgYBdTj66wI=;
	b=IUBqC/euEe2nyKdrvhR6Krpq3KTts11JunMLD81FFmFuewk6V7+pAC0d4wO+uzh8TH
	jjaIEUwFQkPdhJ5qFg0Msi5fxfPLF5dvU/w8y3+DSB6wrkbuPZFLk56wf2ORabCqfAIe
	srgYyDn1UhJcpAmxIT4qByrYT3mIUQGXSYX1bo/Nl/SuD8l+PJD1y0OS0xtbF9l17OP4
	Wbsvf/ZZDOcRSS+VYEqgQliFWvQEszCHCVrw/nQWhychOKyG1VQBwDT0F6npL+kQ8fYc
	EGaFOLi90vhQYRs1Z/KFLetVJRm1e5DNphlAswvFZypTSWl6a2nFMx6TbQXDVrmRdVLL
	nzGQ==
X-Gm-Message-State: APjAAAVEMRLTgHb7wRpvLDAQICp6Oxxh5eubopoJsuemwSG67sUPcS80
	+zBR65af5moibt2MWgZlZbDvGzAKypY=
X-Google-Smtp-Source: APXvYqy9XdFkfFFHQkzO/PA4sz7adPQiaZqOVVADUaXHwQYg2YaQ4KpPzV+3eu568R4H5UAyaNOhFQ==
X-Received: by 2002:a2e:3a05:: with SMTP id h5mr9100836lja.114.1565286328622; 
	Thu, 08 Aug 2019 10:45:28 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d3sm4149334lfj.15.2019.08.08.10.45.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 10:45:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 19:45:25 +0200
Message-Id: <20190808174525.4837-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libinput: update to 1.14.0
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
X-List-Received-Date: Thu, 08 Aug 2019 17:45:28 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wayland/{libinput_1.13.4.bb => libinput_1.14.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.13.4.bb => libinput_1.14.0.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.13.4.bb b/meta/recipes-graphics/wayland/libinput_1.14.0.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.13.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.14.0.bb
index 73d692573d..d236f3fa08 100644
--- a/meta/recipes-graphics/wayland/libinput_1.13.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.14.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "9ef817774bb5b4006cba95e34103e82c"
-SRC_URI[sha256sum] = "d3eb57c714683b117aae29f6c0be76dd46de259f0a48f20cb43b9fa9f2e1401d"
+SRC_URI[md5sum] = "1c33d49fc7985926eab877e3de9c17eb"
+SRC_URI[sha256sum] = "7cb85c24f8920b81bc5360220107e267ab4e0e718704c7690a8c7b03fa14fc67"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.17.1


