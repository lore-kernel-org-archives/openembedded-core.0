Return-Path: <matt@madison.systems>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8D94B6AC00
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 20:23:29 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e64so2969564pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CdhwVS39B3Qha/O2wgl45GpihMxGWZzfV7BFhzU7amY=;
	b=cyBmvRwMtDEw2TLe56GN3qtcmTHHUMzdkXYIlvmk+N5M4gMfVmLZF6SC9M6elobu1z
	yPMfiGhAwYxM4J44Ly8tgYcNV02IIe8ygIizvxe4RWQ3U32WVO2N8p5TA65uqnzsYYBr
	Xn/VOUCfLyQRvZt0KhtqZE268qX79EOkp6Y7+7uwY1A3uo3MaeBGkDy0CNnFmj7VcQN4
	ECys7RJMQjdH/exHUMqHgHZFa8Gu+DhqiQWbXFV/OF6hVkJXmTmvIwS3KS7CicLvTixF
	Zogr7QlEHSDTGGER99/lI+n7cV8J4ecMvaSvkXpHgQO4ujyaetoQUTr85HEAwKsR1W9b
	VSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CdhwVS39B3Qha/O2wgl45GpihMxGWZzfV7BFhzU7amY=;
	b=MVEy5MKjyMtLJXbDvoc1A+F9pNv6WYiCWaMhhieRFKdIdr/9q3Zwm91GYcV/zCmgXY
	CAzmNyTYIfNHTI5T4K1imgg9TZrXBi4fEaJ8h+AA0GxWBLPrumZqAcUUOPwcWYvQiymP
	LHdVuurNjls5I/99jZ38DHULrtXWsBK7nHonZL8Tq0RUQDUAOfE0KZ2S8IgmqLdh/nNn
	hiVhSw4ytUDgZenlCNlIATzILFTdqUsNOnb6iM1m45wFbKmw9RNsX8wOrhN8swByLiA7
	4lZnRQ/MrZ8oqRk5mYj5JQguiL7igySTXTPQ47zMDFnFUhHRe+GI17pWkWP+Eu3w8AxC
	mOPA==
X-Gm-Message-State: AMCzsaVdwWskUhkWZZAw+fLRDM7Z4uwLsmullT+R5YI/uZfVS6byK5sy
	P/lxWstawA8YugkrmoEvKLguFWRV
X-Google-Smtp-Source: ABhQp+RFZsNTYdlHxhMREoOtcLrne+kuAGdg+GHGn7zH3MvfuwJPWAJgq6TlAD/rYQ29Yuj+wdVHMQ==
X-Received: by 10.101.69.76 with SMTP id x12mr8368154pgr.284.1509740610187;
	Fri, 03 Nov 2017 13:23:30 -0700 (PDT)
Received: from workhorse.madison.systems
	(c-67-170-200-185.hsd1.ca.comcast.net. [67.170.200.185])
	by smtp.gmail.com with ESMTPSA id
	q77sm12996005pfd.84.2017.11.03.13.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 13:23:29 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 13:23:05 -0700
Message-Id: <1509740585-20536-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] go: update to go1.9.2
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
X-List-Received-Date: Fri, 03 Nov 2017 20:23:29 -0000

Update to the go1.9.2 minor release, which includes
fixes to the compiler and runtime.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-1.9.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 65adaa8..7daf266 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -1,6 +1,10 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.9"
+MINOR = ".2"
+
+PV = "${GO_BASEVERSION}${MINOR}"
+
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -16,5 +20,5 @@ SRC_URI += "\
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
 "
-SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
-SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
+SRC_URI[main.md5sum] = "44105c865a1a810464df79233a05a568"
+SRC_URI[main.sha256sum] = "665f184bf8ac89986cfd5a4460736976f60b57df6b320ad71ad4cef53bb143dc"
-- 
2.7.4


