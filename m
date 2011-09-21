Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rnx-0001GH-G3
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:57 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123662bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=PCMKhrf++3KP5mRI/2TmnDID3/LoEbpP1xpoYCxq/eg=;
	b=bYAdGgNliiLRdEDwkGpTLSy2BgAbPy/6fPkI1CaNBTweXC80TQSjRPeA9ky1tmqRJT
	Q2gNDgAH6st+KL/FoF0RVKehXKX75GN4nkbrIjPwfC5RDwNOqiEfZikoujuh/q6HKJ9G
	7lSFwXHsQNKPZYTq1+JzP2Ng4uPWhJXPo4sx4=
Received: by 10.204.5.89 with SMTP id 25mr861225bku.16.1316630435981;
	Wed, 21 Sep 2011 11:40:35 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:59 +0400
Message-Id: <1316630404-10336-12-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 12/17] glib-2.0: include glib-gettextize stuff
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:57 -0000

glib-utils already includes glib-gettextize program. Include some files
necessary for glib-gettextize to work.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
index 26fc8fb..fed72a1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.27/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
index dce6802..24c5992 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r3"
+PR = "r4"
 PE = "1"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fdbfa54..e1b8ea9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -19,7 +19,7 @@ DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
 PACKAGES =+ "${PN}-utils "
 
 LEAD_SONAME = "libglib-2.0.*"
-FILES_${PN}-utils = "${bindir}/*"
+FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.2.5



