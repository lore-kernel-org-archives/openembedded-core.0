Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1SznbB-0007T7-Us
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 13:41:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7ABTxR9001795
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 04:29:59 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Fri, 10 Aug 2012 04:29:59 -0700
From: <xin.ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2012 19:29:57 +0800
Message-ID: <1344598197-3592-1-git-send-email-xin.ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] gettext-0.18: explicitly disable acl.
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
X-List-Received-Date: Fri, 10 Aug 2012 11:41:50 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

gettext-0.18 gets a new option for acl, but we do not place acl
into DEPENDS.
So, explicitly disable acl for deterministic builds.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 09a9465..ae3e28b 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r15"
+PR = "r16"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -32,6 +32,7 @@ EXTRA_OECONF += "--without-lispdir \
                  --disable-java \
                  --disable-native-java \
                  --disable-openmp \
+                 --disable-acl \
                  --with-included-glib \
                  --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
                  --without-emacs \
-- 
1.7.9.5



