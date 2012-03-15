Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7zJm-00024k-5E
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 02:17:26 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 02:08:38 +0100
Message-Id: <1331773718-14372-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] parted: don't pass --disable-Werror to configure
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
X-List-Received-Date: Thu, 15 Mar 2012 01:17:26 -0000

* Fixes the following warning:

| configure: WARNING: unrecognized options: --disable-Werror

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* No PR bump required because it doesn't change anything
  apart from the log message mentioned above.

 meta/recipes-extended/parted/parted_3.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/parted/parted_3.0.bb b/meta/recipes-extended/parted/parted_3.0.bb
index 29daf01..2fba6d1 100644
--- a/meta/recipes-extended/parted/parted_3.0.bb
+++ b/meta/recipes-extended/parted/parted_3.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
 SRC_URI[md5sum] = "a94e84a9b9944715c4453f82ccc639bf"
 SRC_URI[sha256sum] = "8886eece015202f6bd5ce8414f4b68838452cef509f2e3389ad56128219837b7"
 
-EXTRA_OECONF = "--disable-Werror --disable-device-mapper"
+EXTRA_OECONF = "--disable-device-mapper"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.5.4



