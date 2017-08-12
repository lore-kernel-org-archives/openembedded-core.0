Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0250278625
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:40:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t138so8065731wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VqAwmdW3J38syJ+xu7wKGpX0/j4gsd5TVTKW2KPtU94=;
	b=B5o/cijPi2lfLfUR8hHiqfIer7z9DJih3SYgJAytwkX1DeSvg7k1ALRj/nEsqR3JCY
	Rzmb1KjBwx9YT0her5Fx/prs7ahXGqpYIgF7rBZRgLdUdgwrc2CmHLLeJZP8xfsNgWQK
	6qPBtcwHRBufAo+Tx8X+gnoZ9z2KmaGDK8mYa2yG9Q2npeGXoqdMbG8RO+O1mhikJtQb
	adjdnpKremMAvBONbl2yweluVDESgIPcks/Ej7rC3LAEaH92/TVyrl2aXw4K3TnEVQ0K
	lqyuAl6G9Ls2phlvBhzEKcHuxTSP0nM4qftlkDbNnYpBnBBUcibzplI8YQJ33C3kCFsk
	swGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VqAwmdW3J38syJ+xu7wKGpX0/j4gsd5TVTKW2KPtU94=;
	b=St+VaS95/o0zyzdQpSinZkojdFenT7p7oi96kEXDmTwO72N3ETabNhCdoFJxu94f1Z
	CndnfmaTItte5JZaf9IN/23wufAay828rWod683Te/SbuulkevaldU/UmuJrrmFgjevc
	OgpZsqiKZnDOOXJVJ+B1kSRwvYSV7wP/4tkz685HEPjj1upd45sI93QZPvNTynUzGYP6
	Df+6MJsj9Lu9kBiYBOVz0J+ntxXYhXXrVoYKSzCd8iXf6YG8MMj8paO8UVzVBsbiQSE7
	yCSV4Y603j0fXBChujqUL7gCmlWZfPt/ztoz2Bg9VbqYqvioJn1YdH83CStkYXAPeslm
	rn8A==
X-Gm-Message-State: AHYfb5iFS+LZIDBwPim1sJeE9c1+5w3n5vYd2ZWy9waHgfBXDWwavFJn
	4J+e3FbN71ZmTeV7
X-Received: by 10.28.63.18 with SMTP id m18mr220452wma.79.1502498419588;
	Fri, 11 Aug 2017 17:40:19 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q10sm2044451wrb.3.2017.08.11.17.40.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:40:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:41:43 +0200
Message-Id: <20170812004145.12654-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170812004145.12654-1-Martin.Jansa@gmail.com>
References: <20170812004145.12654-1-Martin.Jansa@gmail.com>
Subject: [PATCH][morty 3/5] eudev: set LGPL-2.1+ for libudev package
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
X-List-Received-Date: Sat, 12 Aug 2017 00:40:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.bb b/meta/recipes-core/udev/eudev_3.2.bb
index 211252cebc..857d20db78 100644
--- a/meta/recipes-core/udev/eudev_3.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.bb
@@ -1,6 +1,7 @@
 SUMMARY = "eudev is a fork of systemd's udev"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
-LICENSE = "GPLv2.0+"
+LICENSE = "GPLv2.0+ & LGPL-2.1+"
+LICENSE_libudev = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
-- 
2.14.0


