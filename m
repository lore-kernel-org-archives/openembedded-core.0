Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SIdym-0005zD-Qe
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 12:43:48 +0200
Received: by mail-qa0-f54.google.com with SMTP id 25so2321614qao.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 03:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=MsFi07iP4/ASwmNAqnGcRciZ9uuEcaLKITHKUdG5Z4M=;
	b=RvCwQKn+I2Xa2IQlLqfjxoYY6iN8nScjCQFCl91G0XUY3LIgP2GN9iKz+blGKc+FW6
	05ucVhD0OqbtPY9q9Xs3Y4MUyFMuoaUXXlsdBGRFNnNltbTWUP4nK/zSBM6O+8dlHLiH
	+809ybmLfuj5FCOozVqE9p+y9qY3pdikTmNDKOQ5qUAToLNwsfragMvYCTCloDofsN6v
	BtmZxaq/DTN3/XiuW+CwEyNNdp9aOw86I2/61ECY887ZAfZsa1Uvr2E5IRlVjnhku0KV
	F5hgutoRGHio+XfFjDcFp0pwnuWbq57+mNfwvsfMKmAUan/0Ild45A64R7Ol9XnUYYt5
	c/Mw==
Received: by 10.229.201.105 with SMTP id ez41mr421118qcb.39.1334313269534;
	Fri, 13 Apr 2012 03:34:29 -0700 (PDT)
Received: from localhost.localdomain ([93.114.75.57])
	by mx.google.com with ESMTPS id i12sm16864210qad.9.2012.04.13.03.34.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 03:34:28 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 13:34:18 +0300
Message-Id: <8ef395eb05e1acafcf4ea012c281911a1f5e71ad.1334313002.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334313002.git.andrei@gherzan.ro>
References: <cover.1334313002.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmB652p+suPFXZWpzkfdyBPpBwu5fPH40LeUEiuKMBsYMhE8D63kvuXPONnuqqugnB37kBS
Subject: [V5 1/2] gdbm: Package compat libs in gdbm-compat
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
X-List-Received-Date: Fri, 13 Apr 2012 10:43:49 -0000

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



