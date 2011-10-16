Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEk-0003VD-4S
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375147"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:03 -0700
Message-Id: <86c8ac5119fbe53d6c63d954645a5f4372cf2146.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 01/14] bind: update to 9.8.1
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:10 -0000

The COPYRIGHT File was updates for both Year and showing the complete
list of contributors, this change effectively adds BSD equivlant to
the licensing terms.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../bind/{bind-9.7.2-P3 => bind-9.8.1}/conf.patch  |    0
 .../cross-build-fix.patch                          |    0
 .../bind/{bind_9.7.2-P3.bb => bind_9.8.1.bb}       |   10 +++++-----
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.7.2-P3 => bind-9.8.1}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.7.2-P3 => bind-9.8.1}/cross-build-fix.patch (100%)
 rename meta/recipes-connectivity/bind/{bind_9.7.2-P3.bb => bind_9.8.1.bb} (82%)

diff --git a/meta/recipes-connectivity/bind/bind-9.7.2-P3/conf.patch b/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.7.2-P3/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.7.2-P3/cross-build-fix.patch b/meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.7.2-P3/cross-build-fix.patch
rename to meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch
diff --git a/meta/recipes-connectivity/bind/bind_9.7.2-P3.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
similarity index 82%
rename from meta/recipes-connectivity/bind/bind_9.7.2-P3.bb
rename to meta/recipes-connectivity/bind/bind_9.8.1.bb
index e3089bb..330acdb 100644
--- a/meta/recipes-connectivity/bind/bind_9.7.2-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "ISC Internet Domain Name Server"
 HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fe11ac92dcbd84134d91b6e2c2eccab5"
+LICENSE = "ISC & BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
 
 DEPENDS = "openssl"
 PR = "r0"
@@ -13,12 +13,12 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://cross-build-fix.patch \
 	   "
 
-SRC_URI[md5sum] = "b4537cbae38b2daef36775bf49f33db9"
-SRC_URI[sha256sum] = "cd945f4766be664f4528ec065df626ad3624481695316ec8e13ad272f4abfb7e"
+SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
+SRC_URI[sha256sum] = "02285dc429cb2a6687a1b2446e9ee22c1df27f2577225b05be5092395ee7c92c"
 
 # --enable-exportlib is necessary for building dhcp
 EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads \
-                 --disable-devpoll --disable-epoll \
+                 --disable-devpoll --disable-epoll --with-gost=no \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
                  --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
-- 
1.7.6.2



