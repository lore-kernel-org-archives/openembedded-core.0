Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3M8-0007ds-PZ
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:05 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373222wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Y5D/cv94C23X2LhzicqMRoFDKoaOuSmBiWCD8vw0B2g=;
	b=h0owj669bKWA2P/iIk1HGGuqLnteggZYit57vH9BRqX722E7uAHbSpxCvdHO9GQveK
	yFRR8urShRCbMby7Jb/7NIqn09qK/W6kSiR3WwC6Vm/AFiEJnq0kShPRhd+0iGqFG8su
	liJWD53bXN+whZiz0CbiITdQknL5HpM5aacG4z7OmDfdhHdb9ZBuvCNnnRFGS6oENbNU
	GaAqsSLPU23uupbsq8TPfTKzsMaStsZalpu3CJJVDUbYS5yJlRPa799WrTK5IbC6HXMb
	EKQo+zkKD45ac4BlNjy/gEV6RCyo9OYlcK+becmsXwXJL/jLDZFM8e2MRtgKSpf47vIT
	NgMw==
Received: by 10.180.86.106 with SMTP id o10mr11421560wiz.22.1344182123624;
	Sun, 05 Aug 2012 08:55:23 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:22 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:09 +0200
Message-Id: <1344182057-15981-23-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkQBc4kvyTzMSwFGpEmRU8yxCG/bE8K72ELtNu6BTOoo4DvfZJdLyZRfRFjFjOUOpMAx8zo
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/30] builder: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:06 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-graphics/builder/builder_0.1.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index cb5f440..88c8287 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -21,10 +21,10 @@ USERADD_PARAM_${PN} = "--system --create-home \
                        --user-group ${PN}"
 
 do_install () {
-	install -d -m 755 ${D}/etc/mini_x/session.d
-	install -p -m 755 builder_hob_start.sh ${D}/etc/mini_x/session.d/
+	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
+	install -p -m 755 builder_hob_start.sh ${D}${sysconfdir}/mini_x/session.d/
 
-	chown  ${PN}.${PN} ${D}/etc/mini_x/session.d/builder_hob_start.sh
-        install -p -m 755 please_wait_dialog.py ${D}/etc/mini_x
+	chown  ${PN}.${PN} ${D}${sysconfdir}/mini_x/session.d/builder_hob_start.sh
+        install -p -m 755 please_wait_dialog.py ${D}${sysconfdir}/mini_x
 }
 
-- 
1.7.7.6



