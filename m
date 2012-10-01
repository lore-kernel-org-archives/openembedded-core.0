Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TIiUR-0002oz-Vk
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 18:05:04 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TIiHx-0006s0-03
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 17:52:09 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 01 Oct 2012 16:52:07 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349106729.32611.61.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] opkg-native: remove spurious dependency on curl-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2012 16:05:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

All variants of opkg are currently configured --disable-curl so there
seems no point in depending on it.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/opkg/opkg.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 10cd9d8..28cc6a6 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -7,8 +7,6 @@ BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
-DEPENDS_virtclass-native = "curl-native"
-DEPENDS_virtclass-nativesdk = "nativesdk-curl"
 
 PE = "1"
 INC_PR = "r10"
-- 
1.7.10.4





