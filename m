Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1S3A8r-0000mP-O2
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 18:50:13 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id B9083F812F0; Thu,  1 Mar 2012 10:41:44 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2012 10:41:38 -0700
Message-Id: <1330623698-25148-3-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1330623698-25148-1-git-send-email-gary@mlbassoc.com>
References: <1330623698-25148-1-git-send-email-gary@mlbassoc.com>
Subject: [PATCH v2 2/2] busybox: Restore 'date' compatability
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
X-List-Received-Date: Thu, 01 Mar 2012 17:50:14 -0000

Restore CONFIG_FEATURE_DATE_COMPAT so that all versions of 'date', 
whether from busybox or coreutils, agree on the format when
setting the date from the command line.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index ca49671..372d7b5 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -172,7 +172,7 @@ CONFIG_CAT=y
 CONFIG_DATE=y
 # CONFIG_FEATURE_DATE_ISOFMT is not set
 # CONFIG_FEATURE_DATE_NANO is not set
-# CONFIG_FEATURE_DATE_COMPAT is not set
+CONFIG_FEATURE_DATE_COMPAT=y
 CONFIG_ID=y
 CONFIG_GROUPS=y
 CONFIG_TEST=y
diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
index 45e284f..49ac859 100644
--- a/meta/recipes-core/busybox/busybox_1.19.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.7.6



