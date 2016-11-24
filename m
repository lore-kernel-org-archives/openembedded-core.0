Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 563D660291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 01:44:02 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3Am/SMkxYFbJ+vm+RlBPQt6G//LSx+4OfEezUN459i?=
	=?us-ascii?q?sYplN5qZr8q+bnLW6fgltlLVR4KTs6sC0LuN9fqwEjdfqb+681k6OKRWUBEEjc?=
	=?us-ascii?q?hE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRo?=
	=?us-ascii?q?LerpBIHSk9631+ev8JHPfglEnjSwbLd8IRmsswnctcYajIVgJ60s1hbHv3xEdv?=
	=?us-ascii?q?hMy2h1P1yThRH85smx/J5n7Stdvu8q+tBDX6vnYak2VKRUAzs6PW874s3rrgTD?=
	=?us-ascii?q?QhCU5nQASGUWkwFHDBbD4RrnQ5r+qCr6tu562CmHIc37SK0/VDq+46t3ThLjlS?=
	=?us-ascii?q?EKPCM7/m7KkMx9lKJVrgy8qRJxwIDaZ5qYOOZicq7HYd8XX3ZNUtpXWidcAo28?=
	=?us-ascii?q?dYwPD+8ZMOtGtYb9vV8OrRylBQKxGO7vziRHiWHs3a0m1OQqDAfI3As4H90QsX?=
	=?us-ascii?q?Xfsc/7O7kIUe+rzajD0DLOYO9S2Tf68IjHbBEgrOqNXbJ/a8XRzUgvGBnfglqM?=
	=?us-ascii?q?rozlOiqY2+IQuGaV6OpgUPigi28hqwxprDmg2NwjiorIhoIJxVDE6SZ5zJwyJd?=
	=?us-ascii?q?2iR052Z8OvHphItyyCM4Z6X9kuT3x1tCs40LELvZq2cDIXxJknxxPTc/iKf5WS?=
	=?us-ascii?q?7h7+SeqcIy10iG9qdb6lmhq/91WrxPfmWcmuyllKqzJIktzLtn8QyRPe8tOHSv?=
	=?us-ascii?q?5h/ke53jaPyhzT5vlEIU8qkarbLIYswrAqmZoVsEXDHyn2l1vsgK+XeUUr4Oyo?=
	=?us-ascii?q?6+X9bbn8upCcMIp0hhn/MqQohMO/Hfw1PwwTU2SB5Oiwyb/u8Vf9TbhOlPE6j6?=
	=?us-ascii?q?nUvZDCKcQevKG5AgtV0og56xa4CjeryMgXnX0ALFJdZh2GjpPkO1DBIP/iCfe/?=
	=?us-ascii?q?gk6jnC13yPDBO73tGo/NIWTbkLf9YbZ97FZRyA0rzd9B4ZJbFLQBL+ntVUDsqd?=
	=?us-ascii?q?PXEAI2PxWozObgEtVyyJgTWWaOAq+CLKPSqkWE5uU3I+aSYo8apjP9JOM76PHz?=
	=?us-ascii?q?kHA2h0IScbOu3ZsNZ3DrVshhdkKBbHzhh90MHWsHsk81S/bnoFmDSiJIIXGqUq?=
	=?us-ascii?q?Qx4zs2BI6rAcHEXI/+rqaG2XKQF4dSYXsOI1SGHG30cM2gXO8BemqqL9VsgHRQ?=
	=?us-ascii?q?XrymU4Iz/RChvQv7wvxsKe+CqX5Qjo7qyNUgv76brho17zEhV8k=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CSAgDIRDZY/5tjdVteHgYMGQYMgw0BA?=
	=?us-ascii?q?QEBAR9YgQKkB3oBkj6CDoIIGAyIGT8UAQEBAQEBAQEBAQFhKIIzGIJvAXwBgQE?=
	=?us-ascii?q?JiGgBCZ1ukiWEEgGHd4Y+iXCCAAuDCgWaT4ZHijkCgXCOPQKHUookHjd1EwyCf?=
	=?us-ascii?q?QxHG4FecQGIRgEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2CSAgDIRDZY/5tjdVteHgYMGQYMgw0BAQEBAR9YgQKkB3o?=
	=?us-ascii?q?Bkj6CDoIIGAyIGT8UAQEBAQEBAQEBAQFhKIIzGIJvAXwBgQEJiGgBCZ1ukiWEE?=
	=?us-ascii?q?gGHd4Y+iXCCAAuDCgWaT4ZHijkCgXCOPQKHUookHjd1EwyCfQxHG4FecQGIRgE?=
	=?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.31,689,1473112800"; d="scan'208";a="198872225"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 Nov 2016 02:44:02 +0100
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=trinity.local.igalia.com) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim)
	id 1c9j50-0007YI-Vf for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 02:44:03 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 02:43:47 +0100
Message-Id: <1479951827-6249-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] webkitgtk: update to 2.14.2
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
X-List-Received-Date: Thu, 24 Nov 2016 01:44:04 -0000

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.14.1.bb => webkitgtk_2.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.14.1.bb => webkitgtk_2.14.2.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
index 1f2166c..373df17 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            "
 
-SRC_URI[md5sum] = "8d6c60dc41604d3bbd43165a674c07e5"
-SRC_URI[sha256sum] = "2e2d76c328de65bed6e0e4f096b2720a366654b27fc1af0830ece90bc4b7ceb5"
+SRC_URI[md5sum] = "2fe3cadbc546d93ca68a13756c2be015"
+SRC_URI[sha256sum] = "2edbcbd5105046aea55af9671c4de8deedb5b0e3567c618034d440a760675556"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.1.4


