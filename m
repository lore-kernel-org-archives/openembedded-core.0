Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1A97877A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 11:02:27 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id g19so11935469wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=96x07rmwXIgEzyFrOUlDhbhuODTh1VRGwUXloUbmKhc=;
	b=UHMf9yBjMbn1nHSCCaVwJ72q+NMzwm3YXqj46hpNK39xsIS/sQedFoisRj9GwvipYJ
	bjNyWWRdOxTU09xVR6/w1uTXk5Cv+cYswDIXJ/fShrJQn6bd045H4eHNpJuuwqdW74dP
	N5Oy2R19omO0wHtI5fqUR4JC/9E9JfGAv4gRaRcSsJVdJE/AAbKYrdD8/wkabclmC5yx
	+0JR/0lWRa9IgprE1K/uHXcOC9VaHzks/tXceIsEjSiM9DGUkGwoB85x+KX74sCgZZRB
	of75IRcDe0jKCjmFw4MRlzZFHBHdKtBobNz6aAfz7ilg1b5sBeZcx73C9lwo20kRD8Er
	2Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=96x07rmwXIgEzyFrOUlDhbhuODTh1VRGwUXloUbmKhc=;
	b=NIsezzcLrOx+FG5pCU3wMNZ7P+fo57KQf+C2KFaL70iquj1rTwy+xElR8ecW6LqAfE
	M3oqYhJKfCbIwUQED3h6+IIMJ9B17XLm4i7v1Nsyfxllc1cBX8gV/nBcRPNyobkHyUmw
	i8Ids/H/XaHrK0ui8/ZNTazvje/DyyeqHMaGoK3O1ZJsmW46ybZI5JGsMwNtcAmhL8uU
	9hph0TzLFulHxuOCamtJ2gFAE8bFwrQMtMdEOuOO73Tpuda12xBfb6JYUZadOk8pLvIf
	DLNadd31w1oyyvRl+Z+E2JdxG0N32YArH/yGQfl09tZE5S8QfgpGDBuSjbxlAqTC2KzH
	stpw==
X-Gm-Message-State: AFeK/H2CIyqsNkCSg4w1Io1uNzm8DfwziOkuMlBrewhH+/fSmYWv7f3F040y2ZqlSXupmw==
X-Received: by 10.223.150.149 with SMTP id u21mr10309671wrb.195.1491476548678; 
	Thu, 06 Apr 2017 04:02:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t68sm1678871wrc.55.2017.04.06.04.02.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Apr 2017 04:02:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 13:02:27 +0200
Message-Id: <20170406110227.11809-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] eudev: set LGPL-2.1+ for libudev package
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
X-List-Received-Date: Thu, 06 Apr 2017 11:02:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.1.bb b/meta/recipes-core/udev/eudev_3.2.1.bb
index 4a1a26aade..bdfb5441ad 100644
--- a/meta/recipes-core/udev/eudev_3.2.1.bb
+++ b/meta/recipes-core/udev/eudev_3.2.1.bb
@@ -1,6 +1,7 @@
 SUMMARY = "eudev is a fork of systemd's udev"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
-LICENSE = "GPLv2.0+"
+LICENSE = "GPLv2.0+ & LGPL-2.1+"
+LICENSE_libudev = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
-- 
2.12.2


