Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8G-0005pY-FH
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419453"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:39 -0800
Message-Id: <1f55b31bdc8cf1da04ef29f4e44c1be6c0286ee2.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/23] rpm_5.4.0.bb: Build rpm without xz
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:40 -0000

From: Matthew McClintock <msm@freescale.com>

This fixes the following issue:

Log data follows:
| NOTE: Creating RPM package for perf-dbg
| NOTE: Creating RPM package for perf
| NOTE: Creating EMPTY RPM Package for kernel
| NOTE: Creating EMPTY RPM Package for kernel-3.0.9-00348-gec4b357
| NOTE: Creating RPM package for kernel-image-3.0.9-00348-gec4b357
| NOTE: Creating RPM package for kernel-dev
| NOTE: Creating RPM package for kernel-vmlinux
| NOTE: Not creating empty RPM package for kernel-misc
| NOTE: Creating RPM package for kernel-devicetree
| NOTE: Creating RPM package for kernel-module-libcrc32c
| NOTE: Creating RPM package for kernel-module-crc-itu-t
| NOTE: Creating RPM package for kernel-module-sctp
| NOTE: Creating RPM package for kernel-module-pcbc
| NOTE: Creating RPM package for kernel-module-crc32c
| NOTE: Creating RPM package for kernel-module-binfmt-misc
| NOTE: Creating RPM package for kernel-module-nfsd
| NOTE: Creating RPM package for kernel-module-exportfs
| NOTE: Creating RPM package for kernel-module-msdos
| NOTE: Creating RPM package for kernel-module-nls-utf8
| NOTE: Creating RPM package for kernel-module-udf
| NOTE: Creating RPM package for kernel-module-isofs
| NOTE: Creating RPM package for kernel-module-usbhid
| NOTE: Creating RPM package for kernel-module-scsi-wait-scan
| NOTE: Creating EMPTY RPM Package for kernel-modules
| /local/home/mattsm/git/fsl-local-sdk/build_p4080ds_release/tmp/sysroots/x86_64-linux/usr/bin/rpmbuild.real: error while loading shared libraries: liblzma.so.5: cannot open shared object file: No such file or directory
| ERROR: Function 'BUILDSPEC' failed (see /local/home/mattsm/git/fsl-local-sdk/build_p4080ds_release/tmp/work/p4080ds-fsl-linux/linux-qoriq-sdk-3.0.6-r2/temp/log.do_package_write_rpm.18943 for further information)

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index d14bce4..7795914 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r24"
+PR = "r25"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -157,6 +157,7 @@ EXTRA_OECONF = "--verbose \
 		--with-build-extlibdep \
 		--with-build-maxextlibdep \
 		--without-valgrind \
+                --without-xz \
 		--disable-openmp \
 		--enable-build-pic \
 		--enable-build-versionscript \
-- 
1.7.6.4



