Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PwcgB-0006Qx-K9
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Mar 2011 16:49:10 +0100
Received: by ewy8 with SMTP id 8so1277377ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2011 07:45:48 -0800 (PST)
Received: by 10.216.140.147 with SMTP id e19mr3576367wej.49.1299512346471;
	Mon, 07 Mar 2011 07:39:06 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id u2sm1329605weh.36.2011.03.07.07.39.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2011 07:39:05 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2011 16:37:20 +0100
Message-Id: <1299512240-693-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libgpg-error: extend to nativesdk to catch up with metadata changes
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
X-List-Received-Date: Mon, 07 Mar 2011 15:49:10 -0000

libgpg-error was introduced into the dependency tree for meta-toolchain-qte without the needed nativesdk extend

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libgpg-error/libgpg-error_1.9.bb               |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
index 479a11f..7f26dbd 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
@@ -24,3 +24,5 @@ FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${bindir}/*"
 
 inherit autotools binconfig pkgconfig
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.6.6.1



