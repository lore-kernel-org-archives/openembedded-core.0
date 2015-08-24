Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id DEBE576B49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:44 +0000 (UTC)
Received: by iodb91 with SMTP id b91so161610601iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wRTEanJltvN9C3ctZYBUTt5OmNjbzwelAPUD0ILAITo=;
	b=hEeqZCZQ+Z8LhRfCFye4tyYuK3vqri2MhLx/3f6htF+FIeqgn9EP90OAqqunoAy3x0
	7NgsxdiR+ctXqSZsPtfk7xvab9ghfcHXVeAuRgErLiLbVhS8wmbAx1GnmPqUdzeWFWUL
	xgFhk9FskAr0qxnPfAfRdgd4wGo6B2+kkMTmpVAjGbtqOXTNUPq5ccaI3mL8xWuncYFX
	2P2UXtxP0BFz/dded9bahLyINHBMXZv6Bghrk8Q4Ia27UXDK5uS56zocZSsyyE97pZu3
	QuSPmXIliJdC1eKNkrZ/aoYKHIZEfa0BgAWvTewOCDo6A2o+utaYoYNLjzO5WiTDLhEB
	sWCA==
X-Received: by 10.107.157.133 with SMTP id g127mr21073683ioe.102.1440446624717;
	Mon, 24 Aug 2015 13:03:44 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:26 -0700
Message-Id: <a0c8ca382615a48e01946d50187559d45cd6e097.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 08/17] libvorbis: Update libvorbis_1.3.4.bb -> libvorbis_1.3.5.bb
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:45 -0000

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


