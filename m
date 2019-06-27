Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id C05E87E985
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:31:30 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y198so1888834lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6/F/nXL85QEeAYgZ+oP/OVPtKPKULe4eDxpTLl8A79k=;
	b=pbBHdOKp0XLdtD6ZKPWhzKmG1XbZXDAwNIah3Q5ZlGVORMYcgRQGChCBPVcSeAMbkY
	JfviivwyoWYNLlFk3VK5I6g894XJVdp+d/aUHYNMj/JxIXSDi3C9Fd33+hGC6d9EFhB0
	nZEh+U5xVv3yo+NJcr2PC7jHC8AjH+UMYvx0t5tpDqjiy1L/WttvkVDPDLrkUarwQM42
	p0eOh7IGoSP5BsMDEGfEJ0eDtdJTgEBVIcEKOgWqz13qWBcKtTj/DQeCrTEJP4226qKM
	c7S/LSdnMLZcgEZ566ajqbhcibGEWh+jdKLrmejh7FD58Els4/eokEroxNWkScPHETRT
	nV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6/F/nXL85QEeAYgZ+oP/OVPtKPKULe4eDxpTLl8A79k=;
	b=j9WtOcdLch+GTmoG53Qwbuh6qQLJCmVRP0pluw9B2Qis6kRv9EXwiHeEpi4fmUYfIi
	dOhvRanWlL6VwPp/ULCeJ9O/VSRXZmsHb7AXp06NmMlwcGXpKevxZ43gpN4D7BdW7lx8
	7ovJuEXWkc8p+dSPl1LkdJ3Pbk72qOzEohV1KR9YcUDRmXzBb8S3HLGDg2IhpQpljCD4
	9aFRERG30en4lfS7OyJtNXCzHnYqQC/grXfQQqYwMWGekbnVy3JbQtpgShNGWMbhchVA
	R0Hu+ktnSFlH/KcT5RbZ/oh4XvjCyySNulyq/caOR0b4DKfFj3wA6wLS6HKI5jTg5iea
	l2hg==
X-Gm-Message-State: APjAAAUIrolx2MKBArg/Ybm7eBcXbDagG5zYquxXy0ouSgOzaIKAxz1P
	0tSop7KWZm6999aK2CxnwD5F3LVJ5BU=
X-Google-Smtp-Source: APXvYqwMLw7eBjQldmxkUvZ2FxZEZwdG3+5sQnoZbPxZL+/YCOrkEfiYKRssG0/Xir8howg7TB+2Zg==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr2304887lfd.27.1561649491019;
	Thu, 27 Jun 2019 08:31:31 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	h131sm451999lfe.80.2019.06.27.08.31.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 08:31:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 17:31:28 +0200
Message-Id: <20190627153128.11535-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libinput: update to 1.13.3
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
X-List-Received-Date: Thu, 27 Jun 2019 15:31:31 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wayland/{libinput_1.13.2.bb => libinput_1.13.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.13.2.bb => libinput_1.13.3.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.13.2.bb b/meta/recipes-graphics/wayland/libinput_1.13.3.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.13.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.13.3.bb
index 049674c098..87e25ab70b 100644
--- a/meta/recipes-graphics/wayland/libinput_1.13.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.13.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "8b745894f5d1b2e883bfc686aebadcfe"
-SRC_URI[sha256sum] = "1d9fa0698348dea46f75321d98788f8ac7181c069b70c4d10736910a12bb6a6d"
+SRC_URI[md5sum] = "0205d720ae0b1caef1faeb4bba7f8c0f"
+SRC_URI[sha256sum] = "f3ff113023a28631d83971c059c1f3057d51a90aa3746428776f3b3462131092"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.17.1


