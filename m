Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3M5-0007eD-2G
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:03 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373227wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=iTEjPSe+tqosReheCIErEuDIHib99llYLgl3e6kjCPM=;
	b=i/BIjOthaH8CXnuHOyzLgn/uzKYqwtKInKLqQwXH8mOTX218WWp3OrFeWmRx3UMSaV
	DpRHSFKdrENeb5nMfp/SVqlVUcKLE9iIKQ0bXysH7gnvFnRmnTMXdAIJhJS3FHBirWQN
	l9mn1nOtPDKFvdSTq+vbFG3mUC5XeN20Ul14TdD5GUbTgjZSleeaBmNNvuq5TO6lN2Rv
	ocZuM/dCENtvi6UaZGrQXgKqeexvuraQMYKmxJusMi6zceXKfx8ZXIVFVlw8qtuh256X
	s4sRAzKpQzHDTxFfoYambYa/UUeyrh+V6B9vgRLqKNDI0104vZ+nXYx4uLhcQ4r0qYyU
	iCfg==
Received: by 10.180.96.3 with SMTP id do3mr11534462wib.5.1344182119883;
	Sun, 05 Aug 2012 08:55:19 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:19 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:07 +0200
Message-Id: <1344182057-15981-21-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnlnk4tAEZdg63NAUcnUa/012XHEW/FsxaEGJTgXr+sXYIQwR+O7rXJ79iXPxya59izKEDQ
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/30] x11-common: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:04 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index ddb3a1d..9567668 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -12,10 +12,10 @@ S = "${WORKDIR}"
 inherit allarch
 
 do_install() {
-	cp -R ${S}/etc ${D}/etc
-	chmod -R 755 ${D}/etc
-	find ${D}/etc -type d -name .svn -prune -exec rm -rf {} \;
-	find ${D}/etc -type f -name \*~ -exec rm -rf {} \;
+	cp -R ${S}/etc ${D}${sysconfdir}
+	chmod -R 755 ${D}${sysconfdir}
+	find ${D}${sysconfdir} -type d -name .svn -prune -exec rm -rf {} \;
+	find ${D}${sysconfdir} -type f -name \*~ -exec rm -rf {} \;
 }
 
 RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xtscal xinit formfactor"
-- 
1.7.7.6



