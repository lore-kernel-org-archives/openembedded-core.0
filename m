Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E64D733B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 03:02:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D32wMa019195
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 19:02:59 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 19:02:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 19:02:57 -0800
Message-ID: <09095c6cb2d748c7f28ef21880337cd9dafca471.1423796513.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423796513.git.liezhi.yang@windriver.com>
References: <cover.1423796513.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gettext 0.6.1: disable native
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
X-List-Received-Date: Fri, 13 Feb 2015 03:03:02 -0000
Content-Type: text/plain

ERROR: The recipe gettext-native is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
   sysroots/x86_64-linux/usr/share/gettext/config.rpath
 Matched in manifest-x86_64-gettext-minimal-native.populate_sysroot
 sysroots/x86_64-linux/usr/share/gettext/po/remove-potcdate.sin
 Matched in manifest-x86_64-gettext-minimal-native.populate_sysroot
 sysroots/x86_64-linux/usr/share/gettext/po/Makefile.in.in
 Matched in manifest-x86_64-gettext-minimal-native.populate_sysroot
Please verify which recipe should provide the above files.

We have 0.19.4, so disable it rather than fix.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 892194c..97acf7b 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -7,9 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ea3144f04c41cd2eada5d3f472e6ea5"
 
 PR = "r6"
 DEPENDS = "virtual/libiconv"
-DEPENDS_class-native = ""
 PROVIDES = "virtual/libintl virtual/gettext"
-PROVIDES_class-native = ""
 
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://gettext-vpath.patch \
@@ -106,4 +104,4 @@ remove_sysroot_m4_macros () {
     rm -r "${SYSROOT_DESTDIR}${datadir}/aclocal"
 }
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5


