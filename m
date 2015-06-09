Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC67757C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Epwmb015173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:51:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:51:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:47 -0700
Message-ID: <1ba8161fbd06902204a3982ac7a1ccd9c516b943.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] clutter-gst-3.0: 3.0.4 -> 3.0.6
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:04 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...mple-binary-needed-for-core-image-clutter.patch |    0
 .../enable-tests.patch                             |    0
 ...r-gst-3.0_3.0.4.bb => clutter-gst-3.0_3.0.6.bb} |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0-3.0.4 => clutter-gst-3.0}/0001-Install-example-binary-needed-for-core-image-clutter.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0-3.0.4 => clutter-gst-3.0}/enable-tests.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.4.bb => clutter-gst-3.0_3.0.6.bb} (58%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/0001-Install-example-binary-needed-for-core-image-clutter.patch b/meta/recipes-graphics/clutter/clutter-gst-3.0/0001-Install-example-binary-needed-for-core-image-clutter.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/0001-Install-example-binary-needed-for-core-image-clutter.patch
rename to meta/recipes-graphics/clutter/clutter-gst-3.0/0001-Install-example-binary-needed-for-core-image-clutter.patch
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/enable-tests.patch b/meta/recipes-graphics/clutter/clutter-gst-3.0/enable-tests.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/enable-tests.patch
rename to meta/recipes-graphics/clutter/clutter-gst-3.0/enable-tests.patch
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.4.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.6.bb
similarity index 58%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.4.bb
rename to meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.6.bb
index dbc66e1..27beed9 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.4.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.6.bb
@@ -3,5 +3,5 @@ require clutter-gst-3.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
 
-SRC_URI[archive.md5sum] = "0b4283e6ccf5ee5d9f5fb635230fc714"
-SRC_URI[archive.sha256sum] = "c61011732428c74923a52cc7629903bd910ecad22634d58f7b0c1dc55235162a"
+SRC_URI[archive.md5sum] = "3100f52225d8be92f57efe246943e3a2"
+SRC_URI[archive.sha256sum] = "d6d5493ae57cc175deee479304569c419d2bb90de3be124e6f3350ae7e73df76"
-- 
1.7.9.5


