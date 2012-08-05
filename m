Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lu-0007eD-6w
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:50 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373227wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=YCbgqQPjmVBtZ8T3EUKonmmgktw5btbwN4xEO/7WzQY=;
	b=kh6r1L0Q5/Z5ZKZUO9vVSMqdLdiax1i91uUxk+elG7ulFAP55f2SOjC2hyusRW6Rnz
	hGv0Izs92GpARQxODxPhccU0sVIjBplFiV1emeNdxxGnmqit5vdAu+ixxwYEYwSmFi9x
	UAPXlgALZ1ySkMlZgfTDafJ+kpfXOVmew2DNTl6P6DeMHoarrVd5xV4GpMH91jcAtGec
	K9hBcmgkHcTFxhqCx1WXpY4Ps1heirSnuzMJqV0cxZoMqjoKI386jbf3/rUAHssZw0vo
	rCuk2EABwrGyqPxQcdqLwbzuwLXo5Z0lk/xBmYwi2WP+aWVoTnsIqLCh6LibgTL6qB0V
	2S/g==
Received: by 10.216.139.15 with SMTP id b15mr4218989wej.169.1344182109037;
	Sun, 05 Aug 2012 08:55:09 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:08 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:01 +0200
Message-Id: <1344182057-15981-15-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlL5xgIOhdwN2WtfihXFWjX4Bg+W8ybPlTz9M35WBWTa5sMzHdUlSc0n9+m60/YPADkSScn
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/30] rpm: use ${localstatedir} and ${libdir} instead of /var and /usr/lib
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:51 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index e276cc3..d93bd4d 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -421,8 +421,8 @@ do_install_append() {
 	rm -f ${D}/${libdir}/rpm/bin/dbconvert
 	rm -f ${D}/${libdir}/rpm/bin/pom2spec
 
-	rm -rf ${D}/var/lib/wdj ${D}/var/cache/wdj
-	rm -f ${D}/usr/lib/rpm/bin/api-sanity-checker.pl
+	rm -rf ${D}${localstatedir}/lib/wdj ${D}${localstatedir}/cache/wdj
+	rm -f ${D}${libdir}/rpm/bin/api-sanity-checker.pl
 }
 
 do_install_append_virtclass-native() {
-- 
1.7.7.6



