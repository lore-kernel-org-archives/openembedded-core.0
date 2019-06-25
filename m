Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9530E7E3B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 17:26:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45YCkY0mtgz8H
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 19:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561483589;
	bh=R+csXbmJPM4EM0hjO656nMeMjBY6iShUZ3G37aTcW2c=;
	h=From:To:Subject:Date:From;
	b=WHP/k6BKCl6QyGtpvsUOLFCBGUnFT+fdx5X8oCNyTZX3Lm3fwyQw7gKpZTpR4nGQj
	npdnsOi0rQW0y6QfG8+48utbjb4I0jz/iwKyXahY81HaBeMnNAX0v338pQ5pq/SO0+
	pPIcmRohk1pih+8+moHmtJFvaG38nLBu9a4GWGUTTBqY4gMkfZEHJfvK3SlKSlABlz
	cF24IX0ga3vC1tx8ob7xDo7Fg+aR7T0ay0ao7uBh2P9u/jqzAQqigxEzkC81DLjvTy
	5B68B5ET8aRasixIFpIcLi7j/uI+L27Mxps8h02FZlztjQylSNmzx4Mj2b6y0Ew+f6
	8Vt9arEKspV/L6JzWxxmIZya0StEjBQJXBmFd6MNvnKyKTEbTbYLG9//F51+eWu23C
	U9RObDd/wDkX5gnFItFVekVyi7tKaHReJxt0VGaHdJiCQDnkHiB0AVHw9o7PkYx3aj
	goTIsdJXqaOmN9mGTxXLdBfEKVF49DH/JbQ+mKaTAY8g8GG1xD2aJa7Ux5Ak2OcE63
	Dsb5Gua1xrnsogBkxhCsWIaXGbzkEj0ceQLQ2rJCaio8cYi1ygSJ8sXlfA4drI/XbZ
	WuPSRZ6D9eDqxhtlmLfwUGGyUmU6nLOOjDDkDRXeJPQuWde7mw8fKEWQGnA7qkVLOl
	7nUNFbE33lZ9lABbvdb58T/o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 20:26:25 +0300
Message-Id: <20190625172627.24662-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3-dbus: Remove obsolete dependency on dbus-glib
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
X-List-Received-Date: Tue, 25 Jun 2019 17:26:28 -0000

Upstream stopped using it in 1.2.6.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python3-dbus_1.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.8.bb b/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
index c9bf8df42d..923da3c00a 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4"
-DEPENDS = "expat dbus dbus-glib virtual/libintl"
+DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
-- 
2.17.1


