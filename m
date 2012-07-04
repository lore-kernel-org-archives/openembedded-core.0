Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmTbp-0004A0-Cz
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 19:43:25 +0200
Received: by wibhq4 with SMTP id hq4so4974966wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/InI2tNN+0SG9kUn/kaIT+3DZEoycqcIdiyFa0FZ5EU=;
	b=B2/PFBfQL71KAAZLE0uikasDA7EZspyXV1V4D4XHQ+aX4golTzbLy+Mb8MsIg1mz2B
	ZAKlX1llRTL3ajrCCA5HiBl6glhy/1zp0seQuaVLIP5XdEh0AhWCDVL5rCeG7t2usDa0
	BjfJrWt+ojbJRBHpgOE+5hCtiiR7o0DwLQmeYbQNMLl/cKLeW6S8VxJUt7N+3KH54Ytp
	irmbL7xJx+BT6FBNNKM3Q7spe068I5Mc2ifSY/fIHTWTnJa+XTKMs2QPq3aTwJdRdLzp
	MzJxB2GoS4wYk5jFnVpNrSA3mxpKvtyD1oDBLEpjz/HRIzs9YQLvOb3La0jXyhTaBEuV
	TfwA==
Received: by 10.216.182.70 with SMTP id n48mr1941720wem.196.1341423142256;
	Wed, 04 Jul 2012 10:32:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm37867965wib.5.2012.07.04.10.32.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 10:32:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 19:32:12 +0200
Message-Id: <1341423133-6634-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120704172446.GG15100@jama.jama.net>
References: <20120704172446.GG15100@jama.jama.net>
Subject: [PATCH 1/2] startup-notification: bump PR because libxcb-util soname was changed
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
X-List-Received-Date: Wed, 04 Jul 2012 17:43:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../startup-notification_0.12.bb                   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index 0fc18b1..5598187 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a2ae2cd47d6d2f238410f5364dfbc0f2 \
                     file://libsn/sn-common.h;endline=23;md5=6d05bc0ebdcf5513a6e77cb26e8cd7e2 \
                     file://test/test-boilerplate.h;endline=23;md5=923e706b2a70586176eead261cc5bb98"
 
-PR = "r1"
+PR = "r2"
 
 SECTION = "libs"
 
-- 
1.7.8.6



