Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF0D78A26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 10:07:20 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id E261315CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 12:07:20 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 12:07:14 +0200
Message-Id: <20180719100714.9639-6-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180719100714.9639-1-dv@pseudoterminal.org>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
MIME-Version: 1.0
Subject: [PATCH v2 6/6] gstreamer1.0-libav: Replace German umlaut to avoid parsing problems
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
X-List-Received-Date: Thu, 19 Jul 2018 10:07:20 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

The umlaut can cause issues related to encoding; avoid by replacing it

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../workaround-to-build-gst-libav-for-i586-with-gcc.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
index 36abf8607e..5355480aa4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
@@ -1,5 +1,5 @@
 Description: Workaround to build libav for i586 with gcc 4.9.2 by avoiding memset
-Author: Bernhard Übelacker <bernhardu@vr-web.de>
+Author: Bernhard Uebelacker <bernhardu@vr-web.de>
 
 ---
 Bug-Debian: https://bugs.debian.org/783082
-- 
2.17.1


