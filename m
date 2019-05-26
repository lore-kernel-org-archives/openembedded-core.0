Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id A92317E3B0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 11:07:07 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 7E187A0030
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1558868808; bh=MkEnoEuMtJW72fj
	OBsF78v3rX8qOr1DPXOGQ6IZbPYc=; b=m49rv+7TbM6s+JTdYpupF+Xnf2cnw+t
	g1NUv+DGpq4nsthX2cWp3lxN6shAQZJ5x5KOfPQ2CCfk6HM5YouOodjbldDBw3HM
	rGgxQzBXxgf9nHjZWezRW/7f8oMfNk9gxR3F7udIARhREWBXsMzRYYyTrb7BEZuU
	nE4/75kQ/ngvJca0dNzDGKDY2oe2SL8Z1MFsqLKMxucv+u8zvViJgYSlWbeetVj0
	+AUXzI8OEE8Si745+oBy7/FsxzmlDo+pG/IddbTlLdei3icTBUhml9fql8LWtw70
	nUoxO1RKbxaCYNsrONBPT2LItv/yQM+/0Z6EgdjRiLgqm478VNub/Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1558868818; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=1prAS+4W0Lf6nCwkkHdkQ+WAkXUBF3TYMvAU1qc4PCM=;
	b=OLY7gCp6RBnPNGU2EHAzxBgfFLexOZ2T/jdcx7t5r0oIx0JOWDvnmwRS/V9PQAXhHjq6ZK
	LpOc+kYw4vPNJsERZzf7fA9nLSLdfkTbDZNAgkU1/ybCPR3oV9D5J5lhcLl4+uvQ5SS/8l
	vn/yKJCNll4mxk1P/SHWtSSt048D7NjpOHpQEqfSkaG0KBVntJePf241HrKdOSlBzQQmN8
	9p70jmaQl8OXoJ4z1AM7sVXbyEDS2fOmZn77lMtBUa0TGSXqq2+iiECfnRNtmZRQ1vQbJX
	vGzsMP7lupJxflzCXuqqhCIN54+UghnR9hnXYxUq3HOT7Uu9rp1zgFzyUMQ5zw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
	[80.241.56.123]) (amavisd-new, port 10030) with ESMTP id Na46e6fsyJ6F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:48 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2019 13:06:37 +0200
Message-Id: <20190526110642.5341-6-crg7475@mailbox.org>
In-Reply-To: <20190526110642.5341-1-crg7475@mailbox.org>
References: <20190526110642.5341-1-crg7475@mailbox.org>
Subject: [PATCH 06/11] gstreamer1.0-omx: upgrade to version 1.16.0
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
X-List-Received-Date: Sun, 26 May 2019 11:07:08 -0000

From: Philippe Normand <philn@igalia.com>

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...{gstreamer1.0-omx_1.14.4.bb => gstreamer1.0-omx_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.14.4.bb => gstreamer1.0-omx_1.16.0.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
index 39ca1e3854..d94bad36f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "81e67ea03be607b7c548ce911598d754"
-SRC_URI[sha256sum] = "969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4"
+SRC_URI[md5sum] = "c6f8554513980682099a2a9832250b01"
+SRC_URI[sha256sum] = "fef77cddc02784608451c46b9def880b63230a246decf8900f2da2ed54a8af4a"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.17.1


