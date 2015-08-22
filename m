Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id A873E75794
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 15:58:39 +0000 (UTC)
Received: by iodb91 with SMTP id b91so109849807iod.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wRTEanJltvN9C3ctZYBUTt5OmNjbzwelAPUD0ILAITo=;
	b=wyStTvk0UamMfENl2769VQZF5MqXJqLjqW+yHUDx97HIettzxQ9xpDYI1nVnQBshBZ
	DHgch7bZ0HUcY1BWgSjr1bjF13cQ/b3JQ1DUjlu+alLNkng1iMQZsdY8BVbjfFcfGVAO
	xDx1woCoa9LVo8xaMuwH0D1A4/YhTljnSHmLWm07D8kTqNXLG/Zw9vpdmowhfwgMDu2s
	FE8Pq814rdh3K/i3/iLw/iWXesZuhaumRgkUuLxAHvCdUf5gbswqIOZVCHJCwsNIe9pj
	6BDzqEQkYIz4KFgbQ81bh7LRGIXr62GVD8vUQiE0OlA8D9Wh3a+B/ssy0XCfiS3kvMSP
	BjDg==
X-Received: by 10.107.150.80 with SMTP id y77mr11352978iod.188.1440259119382; 
	Sat, 22 Aug 2015 08:58:39 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id r8sm8726088ioi.10.2015.08.22.08.58.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Aug 2015 08:58:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Aug 2015 08:58:13 -0700
Message-Id: <1440259095-24566-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
References: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/6] libvorbis: Update libvorbis_1.3.4.bb -> libvorbis_1.3.5.bb
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
X-List-Received-Date: Sat, 22 Aug 2015 15:58:39 -0000

Licence years have changes causing checksum changes

-Copyright (c) 2002-2008 Xiph.org Foundation
+Copyright (c) 2002-2015 Xiph.org Foundation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libvorbis/{libvorbis_1.3.4.bb => libvorbis_1.3.5.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.4.bb => libvorbis_1.3.5.bb} (78%)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
similarity index 78%
rename from meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
rename to meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
index 0788c94..b7a0667 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -6,14 +6,13 @@ HOMEPAGE = "http://www.vorbis.com/"
 BUGTRACKER = "https://trac.xiph.org"
 SECTION = "libs"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ca77c6c3ea4d29cb68dce8ef5ab0d897 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=7d2c487d2fc7dd3e3c7c465a5b7f6217 \
                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "55f2288055e44754275a17c9a2497391"
-SRC_URI[sha256sum] = "2f05497d29195dc23ee952a24ee3973a74e6277569c4c2eca0ec5968e541f372"
+SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
+SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


