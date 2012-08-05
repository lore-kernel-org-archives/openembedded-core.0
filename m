Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3MC-0007v6-9r
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:09 +0200
Received: by mail-wg0-f41.google.com with SMTP id ds1so822968wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=NDzwmxad2MQD9+3Qk1TsoUVYD4GhVo7Bv5QooOW8Y74=;
	b=Eb4ViA2f9NzGmfXqjqILxVMCTkCMHQPWbqKIy/qg2oHPB2FlKG8V2e6/8sqvIXcIQd
	QV9JPv5j8eh1rxuVUGJBxMBOxLhq3d1EgSR4vDxazy7TsI+/IjA8HkQb7+uCvRYDbhBu
	YtHj/MCdYdXXSbaYZo2C+PRda+AV/VA3Kfx236tI7ZcxOhCTbIp+ul7RXXlXjcrokPFO
	GG3f+kDQtsUz4CRxXcRpjUXAP0tLbPuxHpT7/sdDgvAceT6289N3r+amqY1bbJMyhvEo
	VS2XvC2wEcvMXEXFoijqbFZv6gOrRl36mEWzYRti8geh9vp1sPcDCl9hvty5wz3ekF9w
	2qKg==
Received: by 10.180.78.135 with SMTP id b7mr11477386wix.11.1344182127142;
	Sun, 05 Aug 2012 08:55:27 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:26 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:11 +0200
Message-Id: <1344182057-15981-25-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnJ6rTFti0pZLVNm/+qmx3gv0VKKJhKjYBdOlJ395jg6SGWpjrmoar0JZS0J3by4gCtLtA2
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/30] lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:12 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
index 8071916..3fef5c3 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
@@ -22,6 +22,6 @@ ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
 do_configure[noexec] = "1" 
 
 do_install(){
-	install -d ${D}/etc/init.d/
-	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${S}/rc.d/init.d/functions ${D}${sysconfdir}/init.d/functions
 }
-- 
1.7.7.6



