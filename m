Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCC3731A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrRYH005705; Thu, 19 Jan 2017 22:53:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ej0AfrnnmoCm; Thu, 19 Jan 2017 22:53:27 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrOuc005676
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:25 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa8-0004jE-0P; Thu, 19 Jan 2017 22:53:24 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:53:10 +0000
Message-Id: <1484866395-17971-28-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 28/33] gsettings: Add PACKAGE_WRITE_DEPS for postinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2017 22:53:39 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

glib-compile-schemas is needed during postinstall.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/gsettings.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
index e6d1c8a..eae3dc7 100644
--- a/meta/classes/gsettings.bbclass
+++ b/meta/classes/gsettings.bbclass
@@ -7,12 +7,13 @@
 
 # TODO use a trigger so that this runs once per package operation run
 
-DEPENDS += "glib-2.0-native"
 
 RDEPENDS_${PN} += "glib-2.0-utils"
 
 FILES_${PN} += "${datadir}/glib-2.0/schemas"
 
+PACKAGE_WRITE_DEPS += "glib-2.0-native"
+
 gsettings_postinstrm () {
 	glib-compile-schemas $D${datadir}/glib-2.0/schemas
 }
-- 
2.7.4


