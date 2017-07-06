Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7E75A719E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:43:57 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id 77so25476232wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8UYIQoQMxc4GzE46HNZKbq95FZfCE1naf6FpP8kG+5Q=;
	b=VX0u2flTpEf7DfNmgrLthpTpz+Dph1mngWH95sq6FcHVIzZIQSIclsVwGVS4SoR+oi
	IZwCFMqTlkPB/IPXgVM8tJeK+/6AJXqQn2A3/BEgwJYO8nLKaXuCwIE8/xY86HJ4Ifnk
	5pY2uKboN2vNtWyIcdc0uJR/raB0m1Jo/g8GzOv7QkWjDnT7MTjBDeXhfxNdplVKEabZ
	iH52BMK7hFcLHeOtwXxpHFafuZSdG4VSxNQEX+SOiULUtXYKxmzLoiFszmv8xy0YqExh
	DJpW3et/bwpOMlhjihLBltS2BWn7MGdHO4F/XzGPo6bzOgs6hXwdmUDm9Pb/caGcp4Hy
	erIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8UYIQoQMxc4GzE46HNZKbq95FZfCE1naf6FpP8kG+5Q=;
	b=bB/XwI6MfanRz8hAYpaxrFryPe00ZegpmZ5qlFj5sfhT/Qzv6rrwOMGm1fdLvnDFrU
	z/TweArHkifwRfsWuY4sx+gxC1Ek7JdaHGESgXpLlUWycGAxwGG0sRqi6aCuJycyxh8a
	IhR5BcDfi+8ZREc4Q0aM6RZh0XBwlRgeG0NciYUtVH2bD2NpWiGFM6MCm7md38PmRvyx
	KH6Rbvu+754MYyTwfJlunvK4+x2wivTO5PHMHvkqrj/biaOmMeQsUxEFoZYaH6AGy1pZ
	gWlb+FDz+c9cv/1NhdfPqzFnU20kC3LW4xLMBx0x9yGO36MVj46u9/PlyO1Awbl9WHs5
	fKNw==
X-Gm-Message-State: AKS2vOxkQ0c13LUscc402gnur84SLyU9iK8TIjmpszqmkx8SG6Wa5kbw
	1/iCCktcK18+//MxNJM=
X-Received: by 10.223.166.139 with SMTP id t11mr41644384wrc.39.1499341437840; 
	Thu, 06 Jul 2017 04:43:57 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 79sm89230wrc.34.2017.07.06.04.43.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 04:43:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 12:43:55 +0100
Message-Id: <20170706114355.17393-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] speex: update SRC_URI
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
X-List-Received-Date: Thu, 06 Jul 2017 11:43:57 -0000

The US download mirror appears to be down, so use the main host instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/speex/speex_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-multimedia/speex/speex_1.2.0.bb
index cc69bb50672..19636bb202e 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
                     file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${PV}.tar.gz"
+SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "8ab7bb2589110dfaf0ed7fa7757dc49c"
-- 
2.11.0


