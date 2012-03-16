Received: from [74.125.82.175] (helo=mail-we0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.72) id 1S8Kj6-00009v-3e
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:09:00 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so3449215wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 17:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Za+auCfUCMlFp5fz0RLHEAceD1zOSXlCt3+GCV7f2rI=;
	b=VdtY+e8A+qHSYLzDemQYswHoz8UinB9VK5736Bpru14GOSyHYW4Wwy+8WAbVAtEm8l
	Bt3Ff+VpEBVhYsd9oEUYnnr/riLLnV5uazT9wkUGGsehuHPc7ks0cIAjPtTnFklCU/1M
	vuMSxXlTJfU1JJqNwBwWHUM/j+xVkyKl2Unn0EqPgK7mKqCJcGhRyuSM3A1OhBc90XQv
	j/c1nbA264V5sRatyXjDqq56o3959rD001cE1dJdT09HrGUzXkY72/ZHvFWvKRK4oSN+
	hH1QOUbaagS4g3Tt9qnw4zhl3ZC6kpLRh3b5vKu0FZ3Gu1Wqe9enmma24off5bjLSkbG
	Ca5A==
Received: by 10.180.87.8 with SMTP id t8mr30576171wiz.15.1331856015395;
	Thu, 15 Mar 2012 17:00:15 -0700 (PDT)
Received: from localhost.localdomain (93-142-247-48.adsl.net.t-com.hr.
	[93.142.247.48])
	by mx.google.com with ESMTPS id l5sm9100883wia.11.2012.03.15.17.00.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 17:00:14 -0700 (PDT)
From: Marko Katic <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 01:00:08 +0100
Message-Id: <1331856008-21536-5-git-send-email-user@dromedary>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1331856008-21536-1-git-send-email-user@dromedary>
References: <1331856008-21536-1-git-send-email-user@dromedary>
Subject: [PATCH 5/5] xcb-util-wm: Add recipe that provides libxcb-icccm and libxcb-ewmh
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
X-List-Received-Date: Fri, 16 Mar 2012 00:09:00 -0000

Xcb-util was split into separate packages in the 0.3.6 -> 0.3.8 transition.
These libraries were previously provided by xcb-util and are now a separate package.
---
 meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb

diff --git a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb
new file mode 100644
index 0000000..91f9a81
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb
@@ -0,0 +1,12 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://ewmh/ewmh.c;endline=27;md5=63fd80552d7dc886f4eb267610d5bb9d \
+					file://ewmh/xcb_ewmh.h;startline=4;endline=30;md5=7bcd2d64f5615707f95ea8826a93561f \
+					file://icccm/icccm.c;endline=28;md5=e2b3240a0c197e8977adde2a5cf18d50 \
+					file://icccm/xcb_icccm.h;startline=4;endline=31;md5=0af3f37474085b0517dbbae4cb4ce13c \
+					"
+PR = "r0"
+
+SRC_URI[md5sum] = "dda47289bc846a6a3e07824e9ec3aef8"
+SRC_URI[sha256sum] = "c557abbe4c7d45268f0541ee3d8f9a1a8799692fcc28aa33f39db93cc2e65007"
-- 
1.7.4.1



