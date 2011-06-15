Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWr7a-0005LC-KJ for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 16:31:06 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWr4I-0005js-EJ
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 16:27:42 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 15 Jun 2011 15:27:41 +0100
Message-ID: <1308148061.25285.1764.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] tinylogin: use angstrom mirror for SRC_URI
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
X-List-Received-Date: Wed, 15 Jun 2011 14:31:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

since busybox.net no longer seems to be hosting the tarball

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/tinylogin/tinylogin_1.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
index 0b51b25..b73b5b7 100644
--- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
+++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM="file://LICENSE;md5=f1060fa3a366f098b5b1d8c2077ba269"
 PR = "r6"
 
-SRC_URI = "http://tinylogin.busybox.net/downloads/tinylogin-${PV}.tar.bz2 \
+SRC_URI = "http://www.angstrom-distribution.org/unstable/sources/tinylogin-${PV}.tar.bz2 \
 	file://cvs-20040608.patch;patch=1;pnum=1 \
 	file://add-system.patch;patch=1;pnum=1 \
 	file://adduser-empty_pwd.patch;patch=1 \
-- 
1.7.2.5





