Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71n-0004kh-2N
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:19 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=V6TWEayPJCSriCPdaWLlJDDPtFe5/AMUHABhT+EY4Nw=;
	b=ejsHhGTqVNxxt3ULFKWhvdHGvP7rDq2+NGpZsbJricQO8uzMGIM2ZIKCm7nvx+lYNu
	8mdfGy/MJuPkzD8xpjl8KnRL8CTy2pmup6kPS4WYdbrq6cWYzxxxHAcUu0MiUphubLbZ
	hGbm2b/jHcRuABd9J4/fbJNik+8XGw37lneiWeWqp6tJsEBbWYV0BNQMYasyx/bKNa8p
	BgJLiB7BsASlziy4VGSHC4y9CPn0p8bePprKI/bJiMwGuE5vCO6xRjj8mNr982Z8R4+A
	74ghebnQPrRrU0mfBpvQRbRqGhYu09Y0Vn8SLITw1I48mUoR7QAyb0goNYTG5l7Qo8rH
	163Q==
Received: by 10.180.92.9 with SMTP id ci9mr12315981wib.22.1344196237384;
	Sun, 05 Aug 2012 12:50:37 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:36 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:55 +0200
Message-Id: <1344196136-7643-28-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQm9sBxhRefmJvr2EdvWYowXhE6q1qYdxg5de1DpgA/KmtTx9ylGpA2XAWLfomWYzratZR9y
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 27/28] chkconfig: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:06:05 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 17987a6..9e0e1a0 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
@@ -24,6 +24,6 @@ inherit autotools gettext
 EXTRA_OEMAKE += 'MANDIR="${mandir}" BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
 
 do_install_append() {
-    mkdir -p ${D}/etc/chkconfig.d
+    mkdir -p ${D}${sysconfdir}/chkconfig.d
     rm -f ${D}${sbindir}/update-alternatives
 }
-- 
1.7.7.6



