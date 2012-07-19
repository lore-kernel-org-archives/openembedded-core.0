Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVJ-00013I-8B
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:05 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:42 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so1873962wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=XYog7jqiqo9Zf+fAeZ0ZSJzuIspf5E1D1Asv4iaa6hQ=;
	b=entpyhfBRjm0uNloWIuqKSXClyRLu00HDB0YIHQZXGnpzGlnhfKdCQ+Qj1shfLGpmQ
	gQ6Dxq3bDRSyAH5AdsgUYGt3N4lrLj/aDe/v5vLHCHY6Td5sDThMqyS8W9x9C/pK4Hat
	vbQf5C14nF4J/sxQ93cSwCGG7UWGHuU/ZgmLDRyVeJQf9p4MSKibBi1DuCf7lLpcyJgd
	oh5ONxwZkHLiSAXR2368BLC8622xY/+p64P6W9NJJBbxgpEJHgFFErrEd4lYkgrtFeLz
	QY80lQAF9+Ka17r5G80DC+dNSb939p0cmK9Z+58IQxjN1SidkFIt1zNtfp/nWNhCMLYI
	Jhqg==
Received: by 10.216.136.227 with SMTP id w77mr1452828wei.111.1342714302203;
	Thu, 19 Jul 2012 09:11:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:54 +0100
Message-Id: <f6e846cb92317be29635570ad6b432440e688b38.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnKkiFwlaTbhq4BQXI2OjSPGzLjVmx5ZML6+4QTp6eyJuNnFF2H4OWyZl1zcV+qI+tGGNVB
Subject: [PATCH 07/26] gypsy: inherit gtk-doc
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:07 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/gypsy/gypsy.inc    |    6 +-----
 meta/recipes-connectivity/gypsy/gypsy_0.8.bb |    2 +-
 meta/recipes-connectivity/gypsy/gypsy_git.bb |    2 ++
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/gypsy/gypsy.inc b/meta/recipes-connectivity/gypsy/gypsy.inc
index 11a7204..0c1735e 100644
--- a/meta/recipes-connectivity/gypsy/gypsy.inc
+++ b/meta/recipes-connectivity/gypsy/gypsy.inc
@@ -8,12 +8,8 @@ LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "x11"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc
 
 EXTRA_OECONF += "--with-distro=debian"
 
-do_configure_prepend () {
-	touch ${S}/gtk-doc.make
-}
-
 FILES_${PN} += "/usr/share/dbus-1/services/"
diff --git a/meta/recipes-connectivity/gypsy/gypsy_0.8.bb b/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
index 59a34fa..e701838 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
@@ -16,7 +16,7 @@ DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
 SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz \
            file://fix-unused-but-set-variable-warning.patch \
           "
-PR = "r2"
+PR = "r3"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-connectivity/gypsy/gypsy_git.bb b/meta/recipes-connectivity/gypsy/gypsy_git.bb
index b123e11..495467e 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_git.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_git.bb
@@ -4,6 +4,8 @@ DEFAULT_PREFERENCE = "-1"
 
 SRCREV = "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
 PV = "0.8+git${SRCPV}"
+PR = "r1"
+
 S = "${WORKDIR}/git"
 
 LICENSE = "GPLv2+ & LGPLv2+"
-- 
1.7.10



