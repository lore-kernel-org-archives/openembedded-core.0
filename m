Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lf-0007ds-O2
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:35 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373222wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=730IsZobNDI+FO4WyCDPITO8IL3KgQsRxBBxsPkgRQw=;
	b=e7/hUE6KFqa/mzhPLO+kEZXEsHnGtAuIlQ6S97jVNuGGWErWvMVX9KJ6XsHNzmFVOh
	6em1QSDJddcKmmmD//PqLav45Gnp++LEO62qNj1lRUGBnEJBa31lRoHFz4Oiun7E/LTo
	mBwhTmczzfvxYHhyJsXSEAG2qphjXDNHr/4TrzK51Hztj9IlSeNvoGsgoJrN6ibVFcFw
	L474+yu7AGwcbNJtzh3VNQFiPJfuKGOm11+yzv3WpEMg9YiuFGJWuFY/Q40VjdAaRkp/
	hFUd0Z0XUUjW04DEgvHj7lSkdwh2zyB2BRAVsWG2f6nrpIsVibrXWMfwH96JSEnQhY6F
	iV2Q==
Received: by 10.216.243.10 with SMTP id j10mr4144047wer.211.1344182094568;
	Sun, 05 Aug 2012 08:54:54 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:53 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:53 +0200
Message-Id: <1344182057-15981-7-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnRTvoN4posl+Ig7+wV7GLpw+NYSw6XyN44wuxej5cEOrZQqKJNrCrbCoxQQcokG1cZUcXm
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/30] cronie: use variables instead of hardcoded paths
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:35 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/cronie/cronie_1.4.8.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.8.bb b/meta/recipes-extended/cronie/cronie_1.4.8.bb
index 2d25627..74203ed 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.8.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.8.bb
@@ -61,14 +61,14 @@ do_install_append () {
 	# below setting is necessary to allow normal user using crontab
 
 	# setgid for crontab binary
-	chown root:crontab ${D}/usr/bin/crontab
-	chmod 2755 ${D}/usr/bin/crontab
+	chown root:crontab ${D}${bindir}/crontab
+	chmod 2755 ${D}${bindir}/crontab
 
 	# allow 'crontab' group write to /var/spool/cron
-	chown root:crontab ${D}/var/spool/cron
-	chmod 770 ${D}/var/spool/cron
+	chown root:crontab ${D}${localstatedir}/spool/cron
+	chmod 770 ${D}${localstatedir}/spool/cron
 
-	chmod 600 ${D}/etc/crontab
+	chmod 600 ${D}${sysconfdir}/crontab
 }
 
 FILES_${PN} += "${sysconfdir}/cron*"
-- 
1.7.7.6



