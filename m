Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TVPgR-0000Rn-24
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 17:37:55 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Nov 2012 08:23:37 -0800
Received: by mail-lb0-f197.google.com with SMTP id b5so4515873lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2012 08:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=H30afBdjAlzaixSd71jcB60KsUU1t7SZ3KDjCKJHP0o=;
	b=QSF2Rcq/LAAVXmMu8rw20umYXlmuL/Y0Zh6iqF9Rhs36A53wi8jgDYmscm+Mw/iL0G
	dDSYk9fFJ9ZsaHInej5M738iernQ+dZFgapvE/s5po/RbU6x1N0spCMzWxrrRu0jAnKY
	EkhqQbahRufwXqGx6qs1CBpLR5qQo0E+Ql0UVLVk+SlwJW6VA7v5yqdJQkvb08uNDVgd
	JMxvjsrXKPLgnaZFAuoZVJMO93hWSKPEaXAYgvB0kPVV05aQuJUYBCsSg62af7kcPTh9
	exckEi/uzY0/PRbVYvtjZzK8ra4W/Gxem3KBizgrYHsAzaPnKluzt1wUgVUxt10EpMJp
	QMEw==
Received: by 10.180.87.230 with SMTP id bb6mr14222029wib.6.1352132647518;
	Mon, 05 Nov 2012 08:24:07 -0800 (PST)
Received: by 10.180.87.230 with SMTP id bb6mr14222010wib.6.1352132647289;
	Mon, 05 Nov 2012 08:24:07 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ey2sm12345074wib.9.2012.11.05.08.24.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Nov 2012 08:24:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2012 16:22:47 +0000
Message-Id: <1352132568-6476-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnIP7LsLwlujNQDiKQnhXf5alkqfAwgfMJv/SbdzEXhhJUvPvainmWFr6yPdFWEPWINI+TRULrQdTC88OhV9vELlEb9UnZCXiBAN3VCFfv1um725DYwdm4tEBWYrJ0Al7Xr2MngQAPgDWRcMXE8wZ7l/rPDUOKI0CMkqhDxdXUA54mqO1xM7EC1r3dzmTQ3VQd+Pfzz
Subject: [PATCH 1/2] glib-2.0: remove zip build dependency
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
X-List-Received-Date: Mon, 05 Nov 2012 16:37:55 -0000

This dependency mysteriously appeared a long time ago for no good reason, remove
it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 6e2b5d2..586e45a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0-native zip virtual/libiconv"
+DEPENDS = "glib-2.0-native virtual/libiconv"
 DEPENDS_class-native = "pkgconfig-native gettext-native"
 DEPENDS_class-nativesdk = "nativesdk-libtool"
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
-- 
1.7.10



