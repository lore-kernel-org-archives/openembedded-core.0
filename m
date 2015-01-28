Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECEB72C6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0S6qR6I001033
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 22:52:28 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 22:52:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 22:52:16 -0800
Message-ID: <8d049f51223919207001ff232421c681f4631dd0.1422427700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422427700.git.liezhi.yang@windriver.com>
References: <cover.1422427700.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] dpkg: add perl to RDEPENDS
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
X-List-Received-Date: Wed, 28 Jan 2015 06:52:28 -0000
Content-Type: text/plain

perl scripts:
packages-split/dpkg/usr/bin/dpkg-parsechangelog:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-mergechangelogs:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-architecture:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-vendor:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-shlibdeps:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-scanpackages:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-buildpackage:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-genchanges:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-gensymbols:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-distaddfile:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-buildflags:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-checkbuilddeps:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-gencontrol:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-scansources:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-source:#!/usr/bin/perl
packages-split/dpkg/usr/bin/dpkg-name:#!/usr/bin/perl
packages-split/dpkg/usr/lib/dpkg/parsechangelog/debian:#!/usr/bin/perl

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index c3c51eb..9ad86e3 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -6,7 +6,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
 RDEPENDS_${PN}_class-native = "xz-native"
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.7.9.5


