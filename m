Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC0B70436
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 21:07:19 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so263030wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cjIPs5Yeu55fPBBENyyopC4E/x0eMIcNrstap/03bHM=;
	b=L3Nw1EKgduwbY8SGiCfE3hI3xLVW/W1lmEnYA62vZWDJQ/c4Cxk45JPUYa2czp30ri
	HxIilmcLcLZbGxy2YaHGYBakGB21nIjVdWCbt6ckIQa4pFD+wOjsp6pnnhAkGo4nCiBQ
	WFeLeiEc2ajGZ3N03zy8F6nGN9O8gU0WyRAz0kmUuFs2i6RCUPf7QW3I+30XWMK897BQ
	Jj5ThwiSSROGwidFjB+f1uEMQXHSduGTDVBhEx7aE58TSf8O/UJI7xyR8viXN4Fsc2Lp
	ACnYlSv7S8BWqeFLUFVkNupNArGZXDAw+kLTheSlVMQI+tOQXyEFWwEX76rRlEyHxYlM
	VrNQ==
X-Gm-Message-State: ALoCoQmzPg5zntiP3TJ5kyrMt8wuE+CqgIkSqkowhp0+hZD2DReFWa7gDo9Du+32Z/f8RviR4Moa
X-Received: by 10.180.189.234 with SMTP id gl10mr8384690wic.56.1405458440247; 
	Tue, 15 Jul 2014 14:07:20 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id fg1sm501379wic.17.2014.07.15.14.07.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Jul 2014 14:07:18 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 23:07:11 +0200
Message-Id: <1405458431-17805-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.0.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [PATCH] libdrm: upgrade to 2.4.54
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
X-List-Received-Date: Tue, 15 Jul 2014 21:07:31 -0000

Version 2.4.54 was released a couple of months ago, see [1] for list of
changes.

The upgrade is required for using recent freedreno X11 driver on QCOM SoC. This
was tested on IFC6410 board.

[1] http://lists.x.org/archives/xorg-announce/2014-May/002426.html

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/drm/libdrm_2.4.53.bb | 8 --------
 meta/recipes-graphics/drm/libdrm_2.4.54.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.53.bb
 create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.54.bb

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.53.bb b/meta/recipes-graphics/drm/libdrm_2.4.53.bb
deleted file mode 100644
index 323bef5..0000000
--- a/meta/recipes-graphics/drm/libdrm_2.4.53.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libdrm.inc
-
-SRC_URI += "file://installtests.patch \
-            file://GNU_SOURCE_definition.patch \
-           "
-SRC_URI[md5sum] = "342886a137ddd9ed4341675d132388ad"
-SRC_URI[sha256sum] = "1b0c28fd2f2b92d2df0a73d1aed88f43cb0dee1267aea6bc52ccb5fca5757a08"
-
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.54.bb b/meta/recipes-graphics/drm/libdrm_2.4.54.bb
new file mode 100644
index 0000000..12eefc7
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm_2.4.54.bb
@@ -0,0 +1,8 @@
+require libdrm.inc
+
+SRC_URI += "file://installtests.patch \
+            file://GNU_SOURCE_definition.patch \
+           "
+SRC_URI[md5sum] = "56e98a9c2073c3fab7f95e003b657f46"
+SRC_URI[sha256sum] = "d94001ebfbe80e1523d1228ee2df57294698d1c734fad9ccf53efde8932fe4e9"
+
-- 
2.0.1


