Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71m-0005d7-L5
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:18 +0200
Received: by wgbds1 with SMTP id ds1so903531wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=E5ltl2KH1BJ8M2IcTt6ZxWektbwHosEwnbSbW5hYiD8=;
	b=BflQLsvpxjFsnwWWEU2SNDMlGssAhQSEVQ2hyE8ILY11cxMMImZrHHex3ewjGOCU3M
	n5KlTeUmTzhVwjHUcTRexQSnAPMd6bvAiHeo4jvoOQNiG2f6XS+LhbtmxdZ8EiT59K8J
	chSlefhbYRTbwc3H7/yc2ETY/Dv9XP4vDyBN1RDFPHdp98eP//BXoH0rtzLRhX8OwS/S
	oz+9i8/GkOgJmy52+I1qMmVBC89HSi6L+0K19XiFNE5U1Z9WyNkAQY25L54/O3Pi0K1F
	SRX1mCAoQx5a+I5zvb5z1aeMPsoDVnU9X7kfDOCOcyh75P2RtamYL5rUxpbfsQ7N55JZ
	6JhQ==
Received: by 10.180.81.38 with SMTP id w6mr12387426wix.10.1344196235222;
	Sun, 05 Aug 2012 12:50:35 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:34 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:54 +0200
Message-Id: <1344196136-7643-27-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkeu1LH11cGihMK1yWkYNDx/5QH4Z5ZHaJImgEBopSbdtZFatfvUcr6eeWFt+JR4ikyrtrJ
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 26/28] rsync: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:02:18 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-devtools/rsync/rsync_2.6.9.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
index 74d10e4..54feada 100644
--- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
+++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
 inherit autotools
 
 do_install_append() {
-	install -d ${D}/etc
-	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}/etc
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
 EXTRA_OEMAKE='STRIP=""'
@@ -22,4 +22,4 @@ EXTRA_OEMAKE='STRIP=""'
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6d5a9d4c4d3af25cd68fd83e8a8cb09c"
 
-PR = "r3"
+PR = "r4"
-- 
1.7.7.6



