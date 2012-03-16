Received: from [209.85.212.177] (helo=mail-wi0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.72) id 1S8Kj4-00009x-D4
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:08:58 +0100
Received: by wibhj13 with SMTP id hj13so31765wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 17:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7Cnnp5mqxoqVq31pIkaD8vg57Yr8n3nCivVii5jyS4k=;
	b=hexV4Uk9IL/aaWoY5SYYtTi/bcnmcyIatqWflv0fcdlVd4qLBk1OdORCLgdW54P9+G
	GHwbwOipcTC/w+VBkY0imOxsAevp75CxYm6TVO/GPG9H8yl7+nTji3xZ9TIeHKZHdMOZ
	5/An+ttHN+z2tY5qrrl+ePY14vFcWuv0Cb17DNv8vl8BzMTxH8bAdpgQ1QswNjaFjIGx
	C9eaMYYdeoX8/DMdh5a6CBrnAf6eZRCINBpQM8x/CE2IePejwmhIwosxHcapir3mCULb
	3rNTTMlwh7jcZM+OW1olB/aeMeQC59dE5DC411cP0hcUmAxrpT0ZBbLdewTPIU4tQyK9
	MH2g==
Received: by 10.216.136.232 with SMTP id w82mr250935wei.119.1331856011587;
	Thu, 15 Mar 2012 17:00:11 -0700 (PDT)
Received: from localhost.localdomain (93-142-247-48.adsl.net.t-com.hr.
	[93.142.247.48])
	by mx.google.com with ESMTPS id l5sm9100883wia.11.2012.03.15.17.00.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 17:00:10 -0700 (PDT)
From: Marko Katic <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 01:00:05 +0100
Message-Id: <1331856008-21536-2-git-send-email-user@dromedary>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1331856008-21536-1-git-send-email-user@dromedary>
References: <1331856008-21536-1-git-send-email-user@dromedary>
Subject: [PATCH 2/5] xcb-util-image: Add recipe that provides libxcb-image.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 00:08:58 -0000

Xcb-util was split into separate packages in the 0.3.6 -> 0.3.8 transition.
This library was previously provided by xcb-util and is now a separate package.
---
 meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb

diff --git a/meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb
new file mode 100644
index 0000000..2fb350e
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb
@@ -0,0 +1,10 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://image/xcb_image.c;endline=24;md5=eafdf965cfb89955fdedf75054223fb4 \
+                    file://image/xcb_image.h;startline=4;endline=27;md5=4e4f1b0fae5694beed407dea01f38212"
+PR = "r0"
+
+SRC_URI[md5sum] = "245a96041f373b05764148e52d2e0211"
+SRC_URI[sha256sum] = "40390528c26e8231132540f16579b821de68bb2e9152918f72182d5a4038a6d9"
+
-- 
1.7.4.1



