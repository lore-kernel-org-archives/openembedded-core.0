Return-Path: <niko.mauno@iki.fi>
Received: from tulikuusama2.dnainternet.net (tulikuusama3.dnainternet.net
	[83.102.40.155])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2377F7C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 20:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id DCECC20836;
	Thu,  5 Dec 2019 22:05:31 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from tulikuusama2.dnainternet.net ([83.102.40.155])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id Tsl8QZYgSuZa; Thu,  5 Dec 2019 22:05:30 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id C9BDF20797;
	Thu,  5 Dec 2019 22:05:30 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id AF1FA93;
	Thu,  5 Dec 2019 22:05:25 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 22:05:16 +0200
Message-Id: <20191205200518.82007-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [zeus][PATCH 1/3] iptables: Cosmetic fixes to recipe
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
X-List-Received-Date: Thu, 05 Dec 2019 20:05:33 -0000
Content-Transfer-Encoding: 8bit

Introduce cosmetic changes to recipe content, most notably
 - Change indentation style to four spaces in task statements
 - Reorder several entries according to oe-stylize.py suggestions

(From OE-Core rev: c1d162b6165f11b7b5ae5c6066e7683d5e1379fc)

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../iptables/iptables_1.8.3.bb                | 60 +++++++++----------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb b/meta/recipes-extended/iptables/iptables_1.8.3.bb
index ff9fcb1b53..563c8ae354 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
@@ -4,8 +4,9 @@ filtering code in Linux."
 HOMEPAGE = "http://www.netfilter.org/"
 BUGTRACKER = "http://bugzilla.netfilter.org/"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-                    file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc \
+"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
@@ -13,16 +14,16 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://iptables.service \
            file://iptables.rules \
 "
-
 SRC_URI[md5sum] = "29de711d15c040c402cf3038c69ff513"
 SRC_URI[sha256sum] = "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
 
+SYSTEMD_SERVICE_${PN} = "iptables.service"
+
 inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 # libnfnetlink recipe is in meta-networking layer
@@ -32,9 +33,19 @@ PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--disable-libnfnetlink,libn
 PACKAGECONFIG[libnftnl] = "--enable-nftables,--disable-nftables,libnftnl"
 
 do_configure_prepend() {
-	# Remove some libtool m4 files
-	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
-	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
+    # Remove some libtool m4 files
+    # Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
+    rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
+}
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/iptables
+    install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
+
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
+
+    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/iptables.service
 }
 
 PACKAGES += "${PN}-modules"
@@ -47,30 +58,6 @@ python populate_packages_prepend() {
         d.appendVar('RDEPENDS_' + metapkg, ' ' + ' '.join(modules))
 }
 
-FILES_${PN} += "${datadir}/xtables"
-
-# Include the symlinks as well in respective packages
-FILES_${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
-FILES_${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
-
-INSANE_SKIP_${PN}-module-xt-conntrack = "dev-so"
-INSANE_SKIP_${PN}-module-xt-ct = "dev-so"
-
-ALLOW_EMPTY_${PN}-modules = "1"
-
-do_install_append() {
-
-        install -d ${D}${sysconfdir}/iptables
-        install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
-
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
-
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/iptables.service
-}
-
-SYSTEMD_SERVICE_${PN} = "iptables.service"
-
 RDEPENDS_${PN} = "${PN}-module-xt-standard"
 RRECOMMENDS_${PN} = " \
     ${PN}-modules \
@@ -84,3 +71,14 @@ RRECOMMENDS_${PN} = " \
     kernel-module-nf-nat \
     kernel-module-ipt-masquerade \
 "
+
+FILES_${PN} += "${datadir}/xtables"
+
+# Include the symlinks as well in respective packages
+FILES_${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
+FILES_${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
+
+ALLOW_EMPTY_${PN}-modules = "1"
+
+INSANE_SKIP_${PN}-module-xt-conntrack = "dev-so"
+INSANE_SKIP_${PN}-module-xt-ct = "dev-so"
-- 
2.20.1


