Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.1872.1591063683837142890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 19:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 052280Tq004967
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 1 Jun 2020 19:08:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 1 Jun 2020
 19:07:54 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] vulkan-headers: change upstream src url to master branch
Date: Tue, 2 Jun 2020 10:07:52 +0800
Message-ID: <20200602020752.25290-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

The upstream has removed branch sdk-1.2.135 which causing do_fetch
failure, switch to master branch, the commit(SRCREV) of branch
sdk-1.2.135 is at tag sdk-1.2.135 of master
...
commit fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90 (tag: v1.2.135, tag: sdk-1.2.135.0)
Author: Jon Leech <oddhack@sonic.net>
Date:   Tue Mar 17 05:03:58 2020 -0700

    New include file with provisional extension interfaces (those interfaces
    not aliased by promoted-from APIs, at least).
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
index 54cee96cce..c5e0608036 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;"
 
 SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
 
-- 
2.18.2

