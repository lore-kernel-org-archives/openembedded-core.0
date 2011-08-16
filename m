Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtKE1-0002I3-S4
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:02:37 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	15:57:53 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2011 15:57:50 +0200
Message-ID: <6edf056ece0c99a30e5ca4c1984c5fdcc16c88fa.1313503017.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313503017.git.anders@chargestorm.se>
References: <cover.1313503017.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [PATCH 3/5] connman: use DISTRO_FEATURES to enable wifi and bluetooth
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
X-List-Received-Date: Tue, 16 Aug 2011 14:02:38 -0000
Content-Type: text/plain

As wifi and bluetooth is set in DISTRO_FEATURES, connman should respect this during configuring.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-connectivity/connman/connman_0.75.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_0.75.bb b/meta/recipes-connectivity/connman/connman_0.75.bb
index aeff439..5a7b284 100644
--- a/meta/recipes-connectivity/connman/connman_0.75.bb
+++ b/meta/recipes-connectivity/connman/connman_0.75.bb
@@ -8,8 +8,8 @@ EXTRA_OECONF += "\
   --enable-threads \
   --enable-loopback \
   --enable-ethernet \
-  --enable-wifi \
-  --enable-bluetooth \
+  ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
+  ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
   --enable-dnsproxy \
   --disable-dhclient \
   --enable-test \
-- 
1.7.5.4



