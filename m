Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lw-0007cz-1P
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:52 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1751842wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=kQYnFInfrnf3745af9nIXnQMHrAf9yI28l4xhC03qBk=;
	b=n3K7i0joYVBHK/TStrg0nC95GtuXHAOy41Oyao+XPGACD61FvVyKjnXtaP6d5cUe/4
	rx8lxZz78kN0GY78WzZBxYn+uYUf/NVmb8NRG9plXZA1yMBedrcEhh7hq2ZMQ6liT62w
	mgzTUWyLmGwRB3k5295ZelC8f+rD5x5JJw8WJitVm5V9wVa6gmW6MsVspKSnuRNgu/oL
	IQBOclTmuqMUCF9VXykjgJFTd9SfzZ3DeL5hSpfI+jCkn48j/eLqF7ZBBS/mkmlMONbA
	wv7zEI4O4baczWG9K+guC/DMJPfcwqCk8xbkJwUjrGmmzr358EfQzLcFB8jRxEqNThbf
	Q9MQ==
Received: by 10.216.192.85 with SMTP id h63mr357388wen.7.1344182110790;
	Sun, 05 Aug 2012 08:55:10 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:10 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:02 +0200
Message-Id: <1344182057-15981-16-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmwNuIcIfwXmE7hhailbZkjqHZFnieAEMNM11aUq+p0AvYB6tNVYRJWRsMMRT4Zsz26Dbry
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/30] at: use ${base_sbindir} instead of /sbin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:56 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/at/at_3.1.13.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
index 9af3569..1afcda2 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -51,8 +51,8 @@ do_install () {
 	install -d ${D}${sysconfdir}/rcS.d
 	install -m 0755    ${WORKDIR}/S99at		${D}${sysconfdir}/init.d/atd
 	ln -sf ../init.d/atd ${D}${sysconfdir}/rcS.d/S99at
-	cp -r ${D}/usr/doc/at ${D}${docdir}/
-	rm -rf ${D}/usr/doc
+	cp -r ${D}${prefix}/doc/at ${D}${docdir}/
+	rm -rf ${D}${prefix}/doc
 
 	for feature in ${DISTRO_FEATURES}; do
 		if [ "$feature" = "pam" ]; then
-- 
1.7.7.6



