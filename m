Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHz86-0005bm-Ur
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 17:06:43 +0200
Received: by wgbdr12 with SMTP id dr12so827854wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=MsFi07iP4/ASwmNAqnGcRciZ9uuEcaLKITHKUdG5Z4M=;
	b=W/a+e6TxE+AAXoDHQZgoLCt03KtlMPgOcWDdws2Xm+zU+wfec7BNlxa9JFnbIBWB8t
	xNb78m+R+SfaRHuCj1plg+N2z+lrYAqwbTos2yqsEjQf/D0L+Ysl2QYXgZ9jVWKgOWhF
	838QnNvZfYXCtAZWKjZclVYG4BibgNLKxgImeztwlL8dVp/uxrL1FJYBJW2iixhqpDc5
	1/EwWl2MLoisV57Yem/fdGNiJGUbx5K4GEI1f/2BalGmdIOTSA0PLFVc52w/MuWuhckf
	b4mqLwIcywLFKP4oH5bOOkwmeq4MlokI4V8k2/D4/7erh8mPZga94AzTove9ija0gfsv
	NJSA==
Received: by 10.216.139.129 with SMTP id c1mr8786904wej.48.1334156244096;
	Wed, 11 Apr 2012 07:57:24 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id w10sm10431300wiy.3.2012.04.11.07.57.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 07:57:23 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 17:57:02 +0300
Message-Id: <1334156222-6701-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQmVomYzy81Sm191O0u91MrsgP0IAujp+JavHXh/uexRiN9ShGMeK65eMzmV4eprbqMLfRhN
Subject: [V3 1/1] gdbm: Package compat libs in gdbm-compat
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
X-List-Received-Date: Wed, 11 Apr 2012 15:06:43 -0000

In order to avoid breaking packages which depend on old package name libgdbm4 (>= 1.10),
compat libs are packaged into a separate package named gdbm-compat.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-support/gdbm/gdbm_1.10.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-support/gdbm/gdbm_1.10.bb
index 26b8009..6b68d27 100644
--- a/meta/recipes-support/gdbm/gdbm_1.10.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
 
@@ -25,3 +25,8 @@ do_install_append () {
     ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
     ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
 }
+
+PACKAGES =+ "${PN}-compat \
+            "
+FILES_${PN}-compat = "${libdir}/libgdbm_compat${SOLIBS} \
+                     "
-- 
1.7.5.4



