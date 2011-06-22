Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCXP-00034i-9k
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:47:27 +0200
Received: by pzk2 with SMTP id 2so236586pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=w+CwDrK0zDksLqUn8QJkvdjbT+GKnQcY5b8u/U5Ohag=;
	b=HbmhtLGD+lbTPUq2BuM5ZNjM7DcwBohJ1m1YQorJLOeXP+2HVOwaHS9dHPsQqYZDxa
	9Jha5zxc9gPiSDRes1ZWkmVksNmmOv6enA0seoHDJP2PUBjaFio1tMxOlBwb+Ll9qQ23
	u/fxRaTKr8rF1CggutHYd368gdk+QbGSUVwec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=t/GPRZchhLceoMw3HTib9fuVF6zR8Rk1R0Vq07IRcCnwuOJs4oY92K2JCMcrQKkQBo
	4obqIVpEm/euncaZbNo8gKTzH6sqb2ScwbxpVsSCkh64wou8Y0WJ4rmoIzglb0sviEST
	VkdjpbmjWl05FuQgj9AcepEWZ5p9t2Oyy3Kaw=
Received: by 10.68.32.101 with SMTP id h5mr42117pbi.158.1308707032866;
	Tue, 21 Jun 2011 18:43:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o2sm64885pbj.17.2011.06.21.18.43.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:43:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:43:42 -0700
Message-Id: <b20f3a51e085c9f75b62eb32ccc76b0e2341ec70.1308706423.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <c51f708783d1e320787117e68f2f98aa53ed292e.1308706423.git.raj.khem@gmail.com>
References: <c51f708783d1e320787117e68f2f98aa53ed292e.1308706423.git.raj.khem@gmail.com>
In-Reply-To: <cover.1308706423.git.raj.khem@gmail.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] eglibc-package.inc: Package newly added sotruss and supporting libraries
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
X-List-Received-Date: Wed, 22 Jun 2011 01:47:27 -0000

2.14 has a new utility which can trace through PLTs of shared libraries
We package the library separately and the script is already packaged in
eglibc-utils so we create a RDEPEND so that the library is pulled in
if someone isntalls eglibc-utils

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 76ebdc3..b5531ab 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -37,7 +37,7 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile libsotruss${PKGSUFFIX}"
 
 PACKAGES_DYNAMIC = " \
 		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* \
@@ -84,14 +84,16 @@ FILES_libmemusage = "${base_libdir}/libmemusage.so"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "/sbin/sln"
 FILES_eglibc-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
+FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
 FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
 	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
 FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
 FILES_eglibc-gconv = "${libdir}/gconv/*"
-FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/gconv/.debug"
+FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/gconv/.debug ${libdir}/audit/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
+EDEPENDS_eglibc-utils = "libsotruss"
 FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db*"
 FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
@@ -108,6 +110,7 @@ DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each prog
 DESCRIPTION_localedef = "eglibc: compile locale definition files"
 SUMMARY_eglibc-utils = "Miscellaneous utilities provided by eglibc"
 DESCRIPTION_eglibc-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
+DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 
 inherit libc-package
 
-- 
1.7.5.1



