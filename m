Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA059731FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 05:28:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1I5Sbtv022028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:28:37 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Feb 2016 21:28:37 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2016 13:29:03 +0800
Message-ID: <53a450da51e7f6c8f216bfefdfb3aeca01bf0540.1455772181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455772181.git.Qi.Chen@windriver.com>
References: <cover.1455772181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] coreutils: upgrade to 8.25
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
X-List-Received-Date: Thu, 18 Feb 2016 05:28:36 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch    | 0
 .../{coreutils-8.24 => coreutils-8.25}/fix-selinux-flask.patch    | 0
 .../man-decouple-manpages-from-build.patch                        | 0
 .../remove-usr-local-lib-from-m4.patch                            | 0
 .../coreutils/{coreutils_8.24.bb => coreutils_8.25.bb}            | 8 ++++----
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.24 => coreutils-8.25}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.24 => coreutils-8.25}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.24 => coreutils-8.25}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.24 => coreutils-8.25}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.24.bb => coreutils_8.25.bb} (94%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-core/coreutils/coreutils-8.25/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-core/coreutils/coreutils-8.25/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.24/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils-8.25/fix-selinux-flask.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.24/fix-selinux-flask.patch
rename to meta/recipes-core/coreutils/coreutils-8.25/fix-selinux-flask.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.24/man-decouple-manpages-from-build.patch b/meta/recipes-core/coreutils/coreutils-8.25/man-decouple-manpages-from-build.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.24/man-decouple-manpages-from-build.patch
rename to meta/recipes-core/coreutils/coreutils-8.25/man-decouple-manpages-from-build.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.24/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.25/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.24/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.25/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.24.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
similarity index 94%
rename from meta/recipes-core/coreutils/coreutils_8.24.bb
rename to meta/recipes-core/coreutils/coreutils_8.25.bb
index 6a09c59..650008e 100644
--- a/meta/recipes-core/coreutils/coreutils_8.24.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -20,10 +20,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[tarball.md5sum] = "40efdbce865d2458d8da0a9dcee7c16c"
-SRC_URI[tarball.sha256sum] = "a2d75286a4b9ef3a13039c2da3868a61be4ee9f17d8ae380a35a97e506972170"
-SRC_URI[manpages.md5sum] = "728a91a5c1095a33cffb9959bb891963"
-SRC_URI[manpages.sha256sum] = "cf0333b5f134a331e0b46e2ddf90666f8bdc3281c1ca2c7ccbb75b437589ce37"
+SRC_URI[tarball.md5sum] = "070e43ba7f618d747414ef56ab248a48"
+SRC_URI[tarball.sha256sum] = "31e67c057a5b32a582f26408c789e11c2e8d676593324849dcf5779296cdce87"
+SRC_URI[manpages.md5sum] = "415cc0552bc4e480b27ce8b2aebfdeb5"
+SRC_URI[manpages.sha256sum] = "2ee31c3a6d2276f49c5515375d4a0c1047580da6ac10536898e0f0de81707f29"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
-- 
1.9.1


