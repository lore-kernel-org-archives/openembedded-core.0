Received: from [74.125.82.175] (helo=mail-we0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.72) id 1S8Kj4-00009v-ST
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:08:59 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so3449215wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 17:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=r9qCexsPSYsDwQP9E5rembxeiSay1FwCSU4j0bXfeco=;
	b=DTuNbPQgACCT3GsNPcXns/yI2mKAULwwHpGHRiuJ/GbTsVpr9QQ/l6+O3lBK4nv3E6
	pUqI3dq5lyjgLUMIXi07I973ArX/RmbAzuSN21Ong9IKjJzindMcidGRHxLyGwkKZ64f
	nEzsHxErjR4DkCK6uXRAhP2KoABmsMeCpo0tvocuqkpAnY+4/jOBx4mAZy61zgOz4EFX
	YRHvmTElRQoc637+chUsZSq/xHCu4zUYTHz4g3JXb+GtJUxJBRAezNv7wKQUHboKgbzm
	YifYNm2arQgaTe5DR8M/iFzla7AjbNimaLRUDHRQj009RPpvHKZYMxM7BmjYpD4pXVRR
	Qxug==
Received: by 10.216.132.98 with SMTP id n76mr263049wei.101.1331856014167;
	Thu, 15 Mar 2012 17:00:14 -0700 (PDT)
Received: from localhost.localdomain (93-142-247-48.adsl.net.t-com.hr.
	[93.142.247.48])
	by mx.google.com with ESMTPS id l5sm9100883wia.11.2012.03.15.17.00.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 17:00:13 -0700 (PDT)
From: Marko Katic <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 01:00:07 +0100
Message-Id: <1331856008-21536-4-git-send-email-user@dromedary>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1331856008-21536-1-git-send-email-user@dromedary>
References: <1331856008-21536-1-git-send-email-user@dromedary>
Subject: [PATCH 4/5] xcb-util-render: Add recipe that provides libxcb-render-util
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
 .../xcb/xcb-util-renderutil_0.3.8.bb               |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb

diff --git a/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb
new file mode 100644
index 0000000..c729db8
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb
@@ -0,0 +1,14 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://renderutil/glyph.c;endline=24;md5=c517c483b8d726234ec94f9169236661 \
+					file://renderutil/util.c;endline=20;md5=6e0bfc44fb13298c0f4694eb70dc80d4 \
+					file://renderutil/xcb_renderutil.h;md5=c8732d30d204d3b55e956489f635cefb \
+					"
+PR = "r0"
+
+SRC_URI[md5sum] = "b346ff598ee093c141f836fbc0f8f721"
+SRC_URI[sha256sum] = "9789a5c55728fa7bae374d9fdf1c61095869bdc68561911760879095644c7452"
+
+
+
-- 
1.7.4.1



