Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3MJ-0007cz-Jg
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:15 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1751842wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=sO3VTvqn8UW/Sf5b7Xs9e5JYkJsz6HmnPDDQuqsOIUQ=;
	b=VLS+ArJxqkXhkYb+9wazzbLigDjXFqUrZjv2YSI8YtI1tVCLT5/JgUctRRknagC6a2
	082awBprhBw5L+ZD8ER+vjy8XPV3BeqhnS+tJpOsoqhcMMWbwxqVCVMNL38DavyGls/5
	b1uticjXL8fdTtoGWXJ/OljG55ZdU0PvTB7rwD/b/QiyarEEIxniTGlN1wY2+mtDOE/8
	jZ/dc99jwIA792jDVfiosui4PemtyI4RwdWVc795N/hf9Er0kW8zceQj1aifr2WEGb3/
	lNiw6WzaUHLPwwFD7Bg+BlmDR/A+sgcBNb8uvBYJazvkEZCPlWCRDH8MnKHNFnqNFJMk
	gknw==
Received: by 10.216.54.146 with SMTP id i18mr3977628wec.187.1344182134247;
	Sun, 05 Aug 2012 08:55:34 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:33 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:15 +0200
Message-Id: <1344182057-15981-29-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmFU47VUSEOP/qAbHGCyqwFBvlYV6UQcJpCwBunG3ZPAlHPYZtEdIVDXf7ImGmPCxun2DBi
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/30] rsync: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:15 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-devtools/rsync/rsync_2.6.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
index 74d10e4..634ad1a 100644
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
-- 
1.7.7.6



