Received: from [209.85.212.177] (helo=mail-wi0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.72) id 1S8Kj5-0000A5-Kg
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:08:59 +0100
Received: by wibhj13 with SMTP id hj13so31785wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 17:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=XPBnPQUpfB2gMNwrVxq4T+48YpW4vKNq68+BER1YQc4=;
	b=ln7QUty78Z2g7Dd260iIZxd70JhrICp6+uAMD7m7+mZR3elnZWtJhdYjCXPRKH7hoq
	I+U5eLRMim949KVqb7JzqmOyTy/pa9/p2TBCVK9yYa0S95Jj/1hj0ZNjWRQdG+GyF+0j
	gz6SLUEv4dEO335rBpOFY5pU5J0cEoav6M1jCbGoDR3fGKfhRU5vLBI3OUd0gt18MYDu
	4FGBkWwpBSyvQ7O+OH+H41PNfzOnyb3va5Gbjpbj6TGU8Tl78tiGwOTa2GyNaC+v1O5D
	174VgO2klFz2Z/OhcNlkmXsorJGDTUte32nHZ+dGSLPXSV8JkI8K3MVIp0iFNMTxkgcp
	IBKA==
Received: by 10.180.91.10 with SMTP id ca10mr30541199wib.17.1331856012876;
	Thu, 15 Mar 2012 17:00:12 -0700 (PDT)
Received: from localhost.localdomain (93-142-247-48.adsl.net.t-com.hr.
	[93.142.247.48])
	by mx.google.com with ESMTPS id l5sm9100883wia.11.2012.03.15.17.00.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 17:00:12 -0700 (PDT)
From: Marko Katic <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 01:00:06 +0100
Message-Id: <1331856008-21536-3-git-send-email-user@dromedary>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1331856008-21536-1-git-send-email-user@dromedary>
References: <1331856008-21536-1-git-send-email-user@dromedary>
Subject: [PATCH 3/5] xcb-util-keysyms: Add recipe that provides libxcb-keysyms.
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
X-List-Received-Date: Fri, 16 Mar 2012 00:08:59 -0000

Xcb-util was split into separate packages in the 0.3.6 -> 0.3.8 transition.
This library was previously provided by xcb-util and is now a separate package.
---
 .../recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb

diff --git a/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb
new file mode 100644
index 0000000..ed1eb7a
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb
@@ -0,0 +1,11 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://keysyms/keysyms.c;endline=30;md5=2f8de023ed823bb92f0b47900574ea9e \
+					"
+PR = "r0"
+
+SRC_URI[md5sum] = "c75bb20e709093580a67eaf263251b50"
+SRC_URI[sha256sum] = "913d32f7afe380c580da7636ee13f2728790237bb5c03def536363f552686121"
+
+
-- 
1.7.4.1



