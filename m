Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A78C773BB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 03:08:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6738EVQ012342
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 20:08:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 20:08:14 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jul 2015 11:08:51 +0800
Message-ID: <3db01c6686b85677a8256956c39eb1075a7009e1.1436238493.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436238493.git.Qi.Chen@windriver.com>
References: <cover.1436238493.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: upgrade to 8.24
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
X-List-Received-Date: Tue, 07 Jul 2015 03:08:14 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch    | 0
 .../{coreutils-8.23 => coreutils-8.24}/fix-selinux-flask.patch    | 0
 .../man-decouple-manpages-from-build.patch                        | 0
 .../remove-usr-local-lib-from-m4.patch                            | 0
 .../coreutils/{coreutils_8.23.bb => coreutils_8.24.bb}            | 8 ++++----
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.23 => coreutils-8.24}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.23 => coreutils-8.24}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.23 => coreutils-8.24}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.23 => coreutils-8.24}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.23.bb => coreutils_8.24.bb} (94%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.23/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.23/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.23/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils-8.24/fix-selinux-flask.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.23/fix-selinux-flask.patch
rename to meta/recipes-core/coreutils/coreutils-8.24/fix-selinux-flask.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.23/man-decouple-manpages-from-build.patch b/meta/recipes-core/coreutils/coreutils-8.24/man-decouple-manpages-from-build.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.23/man-decouple-manpages-from-build.patch
rename to meta/recipes-core/coreutils/coreutils-8.24/man-decouple-manpages-from-build.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.23/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.24/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.23/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.24/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.23.bb b/meta/recipes-core/coreutils/coreutils_8.24.bb
similarity index 94%
rename from meta/recipes-core/coreutils/coreutils_8.23.bb
rename to meta/recipes-core/coreutils/coreutils_8.24.bb
index 70c04a5..eb7500b 100644
--- a/meta/recipes-core/coreutils/coreutils_8.23.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.24.bb
@@ -20,10 +20,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[tarball.md5sum] = "abed135279f87ad6762ce57ff6d89c41"
-SRC_URI[tarball.sha256sum] = "ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d"
-SRC_URI[manpages.md5sum] = "ce49bc8360e16afe67581d136606efc7"
-SRC_URI[manpages.sha256sum] = "d1b16e74b3dba4f313aeebae2c69da205f7d2e6e1c2aa8d39026c860d314ecca"
+SRC_URI[tarball.md5sum] = "40efdbce865d2458d8da0a9dcee7c16c"
+SRC_URI[tarball.sha256sum] = "a2d75286a4b9ef3a13039c2da3868a61be4ee9f17d8ae380a35a97e506972170"
+SRC_URI[manpages.md5sum] = "728a91a5c1095a33cffb9959bb891963"
+SRC_URI[manpages.sha256sum] = "cf0333b5f134a331e0b46e2ddf90666f8bdc3281c1ca2c7ccbb75b437589ce37"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
-- 
1.9.1


