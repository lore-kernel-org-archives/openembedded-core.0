Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id B9CF67E46F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 16:42:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 9B974A107D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1559234525; bh=uSqdY/wxkizouEh
	ChjIXSXCayM3VfQLyhPAZBWGTCSg=; b=Wq5MkAGhC3/icxl2Hu5MABH9z/gl/zc
	qjUzsyYrBQQJ6T8V9VNHGMvSdfS8mySWWHxhDW/LxlA3N1Zx7Cb3I/eHT80tglPz
	FVAPfn2qt1kwAZwdT+wfOmlg68kiw2Kw8g/vRfQ154CIn3bywQvtoOSRrkU+KpVu
	FRqnp1az0nm4o+hxqEWYq7lAjjOp3Qw60V8S9jVVeg65ORfCxOZjV8POFdgxbmJy
	B0e+cKCcJXo2nk3uwwD2x1Y9u5eKr2Ks41qU/ljtkfDRpfCJhbmW1NOLLy5d6TB/
	Xelc++eCrM1S037OftUxC5azWtoU/BwzaopwNsHJo2u7POWlwuptJKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559234534; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=vFa14X6qmT1wZKHwrrkyByaj4cHSVybC01jrClqfHK8=;
	b=D1PQsu/fUKTBw/GlRgnSu0IHPZSdEcVD5p6Gv4Wr+NoyHu/tp75XQtYkdgrRJA8dsNUlPA
	zBQAGvfAOBF1I5e/WE0cHFi4cgvQz1QNDJOE6EOdL8rJSi35ryjdaIm7TziJVUbWw+I7Ji
	clMvv1jeeZ2vYVCVEFCX79eVlOC2uGipLr/S12GAqDp36AbI2BvkvIAFVCHLjw09t5Zm6K
	DoVqdQOr5IV6ncwMiB34K8l783eE4XQZCuIcOw3oTXXlbHvo4TTjGrtQMPQ3xtQc6Werjl
	U3GG+DmCK129g2uIfCgcIA4RAGmIrcxvHsnER5YbQII558oLAfvi+M2MjKrdVg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
	[80.241.56.116]) (amavisd-new, port 10030) with ESMTP id Y7j6fcm7tP3e
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:05 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 18:41:44 +0200
Message-Id: <20190530164150.27038-5-crg7475@mailbox.org>
In-Reply-To: <20190530164150.27038-1-crg7475@mailbox.org>
References: <20190530164150.27038-1-crg7475@mailbox.org>
Subject: [PATCH v2 05/11] gstreamer1.0-plugins-ugly: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 16:42:14 -0000

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...ins-ugly_1.14.4.bb => gstreamer1.0-plugins-ugly_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.14.4.bb => gstreamer1.0-plugins-ugly_1.16.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
index 168e64d84c..11a0e790ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
-SRC_URI[md5sum] = "90768a0074db071175ce980064d9a1ac"
-SRC_URI[sha256sum] = "ac02d837f166c35ff6ce0738e281680d0b90052cfb1f0255dcf6aaca5f0f6d23"
+SRC_URI[md5sum] = "1ec343c58d4b17d682f7befa8453c11c"
+SRC_URI[sha256sum] = "e30964c5f031c32289e0b25e176c3c95a5737f2052dfc81d0f7427ef0233a4c2"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.17.1


