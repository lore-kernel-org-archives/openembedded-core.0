Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id E379C7ED5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 09:04:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f72so1907575wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 02:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cd/gu3PzbQroZmo45TBgLsv9cizxzfK6lkEN2iwLWBM=;
	b=H19L4zhZVvD7plxNsJQxvvxmGD+tiug3tv/5zEuv+Vw/zSM0ARIHC4zRs+mwohpZ/W
	+WeEYBpgWd2ubK/oz5f65nLFdavKn4vZh0Qp/rkefg4HmFPxLhouPuoyYZI1D3qjICNU
	m/6wQDywVbkvoVPxVw/rn06RmIjoOPrufDnltIW7BmZkZvGyfrj6BJjU2MUZaX8xJCsV
	obbc4sh9BbHLPL4DE6Be4ycXfclJsMPnMQ8nSDcUicKxzbN8EUuGURP6BvuOyrHL3BfH
	mpHy/KJd9FP8MeNOmLVD8+K2ZTZ0CZHT+mRn329Co/USEMpGEquFmiuOzopkQCjBtLas
	TUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cd/gu3PzbQroZmo45TBgLsv9cizxzfK6lkEN2iwLWBM=;
	b=e2y3uf907CQydyma1oYuSP8BXRbc7lesuyIxxCRFYg+cZe4nwIVADv2KamFvmOP4i9
	jyVzrM/ST/zQOj+JolNhGXxOw02aLZbr/b2t8Sd8UfH0xL5SaSJRBHLvFekPGk0nKCTS
	zlXln/Y39Ia8FEtOAJv704mWW8n6lCbwf7d0WejT5Gyr+0kW17yP6v482Wu+UwcYREEW
	rYfjllyqSlpG/mtwNS+B8lrtXW3dnIsPB3Pj7PEQOqxElKNzGZHIEzTsykA8m4+Yb7mC
	aTd/qJzYeN5B3a4w/KDDQBF0NrKqiUV3o8fj4aEekmTBlWBFOxqodQy0bC2fGV5HLLdv
	DDeg==
X-Gm-Message-State: APjAAAUoTRRFl9ztmJOIs+c6M11IsbMSjm3FKQWab9L41oJQ9hhCU7Rs
	vCAGSXEeDk35EJaVAXQyqQiIRt+EgCk=
X-Google-Smtp-Source: APXvYqw/JKOCrR8yK3Gn6gmYKq+VMehsfWKoPz4J0S1piL9eps+xeowezuABgcOn/m0FGZIZw+rOQA==
X-Received: by 2002:a1c:7c06:: with SMTP id x6mr25114049wmc.133.1566291884256; 
	Tue, 20 Aug 2019 02:04:44 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	a141sm2603610wmd.0.2019.08.20.02.04.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Aug 2019 02:04:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 09:04:42 +0000
Message-Id: <20190820090442.20-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820090442.20-1-Martin.Jansa@gmail.com>
References: <20190820090442.20-1-Martin.Jansa@gmail.com>
Subject: [warrior][PATCH 3/3] powertop: import a fix from buildroot
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
X-List-Received-Date: Tue, 20 Aug 2019 09:04:44 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-wakeup_xxx.h-include-limits.h.patch  | 55 +++++++++++++++++++
 meta/recipes-kernel/powertop/powertop_2.10.bb |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch b/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch
new file mode 100644
index 0000000000..7bfca8abfd
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch
@@ -0,0 +1,55 @@
+From 4c24fdd8e0a42359df7308155b2d43c28a5e02fd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 20 May 2019 20:25:00 +0200
+Subject: [PATCH] wakeup_xxx.h: include limits.h
+
+limits.h must be included to define PATH_MAX otherwise build will fail
+on:
+
+In file included from wakeup/wakeup_ethernet.cpp:45:0:
+wakeup/wakeup_ethernet.h:35:16: error: 'PATH_MAX' was not declared in this scope
+  char eth_path[PATH_MAX];
+
+In file included from wakeup/wakeup_usb.cpp:45:0:
+wakeup/wakeup_usb.h:35:16: error: 'PATH_MAX' was not declared in this scope
+  char usb_path[PATH_MAX];
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a0b3337cf4a827e6566f8b15b6bb180f0dcef7a3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Submitted [https://lists.01.org/pipermail/powertop/2019-May/002052.html]
+---
+ src/wakeup/wakeup_ethernet.h | 1 +
+ src/wakeup/wakeup_usb.h      | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/wakeup/wakeup_ethernet.h b/src/wakeup/wakeup_ethernet.h
+index 682bf95..e0fa628 100644
+--- a/src/wakeup/wakeup_ethernet.h
++++ b/src/wakeup/wakeup_ethernet.h
+@@ -25,6 +25,7 @@
+ #ifndef _INCLUDE_GUARD_ETHERNET_WAKEUP_H
+ #define _INCLUDE_GUARD_ETHERNET_WAKEUP_H
+ 
++#include <limits.h>
+ #include <vector>
+ 
+ #include "wakeup.h"
+diff --git a/src/wakeup/wakeup_usb.h b/src/wakeup/wakeup_usb.h
+index f7a1f7e..15898e3 100644
+--- a/src/wakeup/wakeup_usb.h
++++ b/src/wakeup/wakeup_usb.h
+@@ -25,6 +25,7 @@
+ #ifndef _INCLUDE_GUARD_USB_WAKEUP_H
+ #define _INCLUDE_GUARD_USB_WAKEUP_H
+ 
++#include <limits.h>
+ #include <vector>
+ 
+ #include "wakeup.h"
+-- 
+2.20.1
+
diff --git a/meta/recipes-kernel/powertop/powertop_2.10.bb b/meta/recipes-kernel/powertop/powertop_2.10.bb
index d943ba9f6e..5be8d23111 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -7,6 +7,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "http://01.org/sites/default/files/downloads/powertop-v${PV}.tar.gz \
+    file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
 
 SRC_URI[md5sum] = "a69bd55901cf919cc564187402ea2c9c"
-- 
2.17.1


