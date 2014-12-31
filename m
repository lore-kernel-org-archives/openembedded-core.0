Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9E160557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 04:12:31 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id bj1so20535759pad.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 20:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EEccFTJRLXOuRLcHUYYRsfJVH3ZBx02G6Iw1emJK6r0=;
	b=y1AyJQuVn0KZ0ECd0G8iaH/4FhqzeHvDxiX6oCkRj8Q50qJerdC2NhJBjOg0hCCdM5
	68KTAQXonxKgFk1FfI1PCPISokz0rB4IQ7Uxhfq7nkUhV50RzfW/YEU0aFgSVv5a/BYB
	aYNXVg4h0YmcfeuZ/JL4KbgnXRJgBEPyAG+SYGy9N7A1o/EZtoZIpsmB+rMzXLcbjKJu
	q5aqUSSFWHMjFnYq66fl4BHe34nHimmwRQx4kVf6cbRF91m2oGB23aXvwRYbjB9gDCiu
	1FF58UvpcVFoLptLjDTPd9hFkKs1Vo1L7+YV4j0+zgXQpX9kzPP2o1jwWo24jWs3IgNB
	9JTQ==
X-Received: by 10.66.163.129 with SMTP id yi1mr102228914pab.149.1419999151973; 
	Tue, 30 Dec 2014 20:12:31 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id t4sm18909122pdh.9.2014.12.30.20.12.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Dec 2014 20:12:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 20:12:24 -0800
Message-Id: <1419999144-6278-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419999144-6278-1-git-send-email-akuster808@gmail.com>
References: <1419999144-6278-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] libinput: update to 0.7.0
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
X-List-Received-Date: Wed, 31 Dec 2014 04:12:38 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-graphics/wayland/{libinput_0.6.0.bb => libinput_0.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_0.6.0.bb => libinput_0.7.0.bb} (72%)

diff --git a/meta/recipes-graphics/wayland/libinput_0.6.0.bb b/meta/recipes-graphics/wayland/libinput_0.7.0.bb
similarity index 72%
rename from meta/recipes-graphics/wayland/libinput_0.6.0.bb
rename to meta/recipes-graphics/wayland/libinput_0.7.0.bb
index c3bbb7b..98d2942 100644
--- a/meta/recipes-graphics/wayland/libinput_0.6.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_0.7.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "3afaf9f66d8796323a79edb879c10ba3"
-SRC_URI[sha256sum] = "30b555771e7cb921ccb9430c4a86940aa3938d05506e81d2417c03e30451bfbc"
+SRC_URI[md5sum] = "381b61396de28c12716ef7a5475fea50"
+SRC_URI[sha256sum] = "129f485afe5e4a9394641293991c97cb99f5f3338340d0d65b704ff463d1579e"
 
 inherit autotools pkgconfig
-- 
1.9.1


