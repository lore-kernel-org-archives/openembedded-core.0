Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 85EBF60053
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 19:58:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3JJw9eY027866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 12:58:10 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 19 Apr 2019 12:58:09 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Apr 2019 12:58:09 -0700
Message-ID: <20190419195809.25716-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] gdk-pixbuf: add timeout to run-ptest
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
X-List-Received-Date: Fri, 19 Apr 2019 19:58:09 -0000
Content-Type: text/plain

The default timeout of 300 seconds is far too low for qemu bsp's.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
index 8f90723..b4f982b 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
@@ -1,3 +1,5 @@
 #! /bin/sh
 
-gnome-desktop-testing-runner gdk-pixbuf
+# The default timeout of 300 seconds is far too low for qemu bsp's.
+#
+gnome-desktop-testing-runner -t 2400 gdk-pixbuf
-- 
2.7.4


