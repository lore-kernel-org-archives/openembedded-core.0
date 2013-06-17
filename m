Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD65616D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 06:30:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5H6UOP8000598
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 23:30:24 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 16 Jun 2013 23:30:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 14:30:22 +0800
Message-ID: <1371450622-3850-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] libproxy_0.4.7 do_unpack failed of qemuppc_world
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
X-List-Received-Date: Mon, 17 Jun 2013 06:30:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The tarball from upstream shows many lines of....

   tar: Ignoring unknown extended header keyword
      `LIBARCHIVE.xattr.security.selinux'
   tar: Ignoring unknown extended header keyword `SCHILY.dev'
   tar: Ignoring unknown extended header keyword `SCHILY.ino'
   tar: Ignoring unknown extended header keyword `SCHILY.nlink'

Replacing it with the .zip file from upstream

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.7.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index 89f22b8..30abc27 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -8,16 +8,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \

 DEPENDS = "gconf glib-2.0"

-PR = "r5"
+PR = "r6"

-SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
+SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
            file://g++-namepace.patch \
            file://libproxy_fix_for_gcc4.7.patch \
            file://libproxy-0.4.7-CVE-2012-4504.patch \
           "

-SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
-SRC_URI[sha256sum] = "8fe0a58810139ba3c2e186deccf3e68adcd127aa0e972b0862b30b3dde493797"
+SRC_URI[md5sum] = "62585570de17d10f03a5a63b701ffd52"
+SRC_URI[sha256sum] = "429a19c57d9990349d622beecc805b23051caa62a478066bff5d9a312a8937be"

 inherit cmake pkgconfig

--
1.7.4.1


