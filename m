Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDf8q-0006Gk-4N
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 19:29:52 +0200
Received: by wgbdq11 with SMTP id dq11so2510560wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wNzdrj/WXDHhca13SGSLum6tBt9jLiJGJKye2aBYQ6c=;
	b=EClKt7OlwRvSPYvuuUJd9lsuKPIJmLFYufXuOzVOa1LS5k56T2l73m/XUbeXWYJum3
	xIdd5R8204pIUV5hssBmZa1uzfYzCrfC61IHOIOSatacvlb3GnRqg8ADg40kstiBUI+5
	72u/zEgsfnP+mjWpLSUVDJ8pESUDwiWUxwdwBg7PFV9EO1n1ljTQb/Ce7Dp1YuNCd9Xu
	knzrFqoeujHLoSUKEmTFh3910nT7vCJbcp1a8ZcmCkufSSJVfIUQyfHkwBUHTAOzWWHE
	+ZnK9HKJWhH3epo4ZQo3rKpbysOnXmJtOzzTCJd8SsGS84u/C39PQLznjNiblQU+jmhL
	T5JA==
Received: by 10.216.241.200 with SMTP id g50mr6304859wer.79.1347902233353;
	Mon, 17 Sep 2012 10:17:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dp8sm27099988wib.3.2012.09.17.10.17.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 10:17:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 19:17:01 +0200
Message-Id: <1347902221-5221-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1347879240-17214-1-git-send-email-Martin.Jansa@gmail.com>
References: <1347879240-17214-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] libtelepathy: PR bump to rebuild after libffi5 -> libffi6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 17:29:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index a7c6667..ee131ee 100644
--- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 dbus dbus-glib telepathy-glib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://src/tp-conn.c;beginline=1;endline=19;md5=4c58069f77d601cc59200bce5396c7cb"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-${PV}.tar.gz \
            file://prefer_python_2.5.patch \
-- 
1.7.12



