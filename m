Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F38CE6F800
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 01:57:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2C1vu3d015909
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 18:57:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 18:57:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 09:57:48 +0800
Message-ID: <cc2a0f3eb8ee38699f9d862d63f54cd184aad037.1394589334.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394589334.git.Qi.Chen@windriver.com>
References: <cover.1394589334.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gettext: upgrade from 0.18.3.1 to 0.18.3.2
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
X-List-Received-Date: Wed, 12 Mar 2014 01:57:56 -0000
Content-Type: text/plain

Upgrade gettext from 0.18.3.1 to 0.18.3.2.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../parallel.patch                                 |    0
 .../COPYING                                        |    0
 .../Makefile.in.in                                 |    0
 .../Makevars.template                              |    0
 .../aclocal.tgz                                    |  Bin 37591 -> 37591 bytes
 .../config.rpath                                   |    0
 ...conv-m4-remove-the-test-to-convert-euc-jp.patch |    0
 .../remove-potcdate.sin                            |    0
 ...8.3.1.bb => gettext-minimal-native_0.18.3.2.bb} |    0
 .../{gettext_0.18.3.1.bb => gettext_0.18.3.2.bb}   |    4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.18.3.1 => gettext-0.18.3.2}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/Makefile.in.in (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/Makevars.template (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/aclocal.tgz (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/config.rpath (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/iconv-m4-remove-the-test-to-convert-euc-jp.patch (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.3.1.bb => gettext-minimal-native_0.18.3.2.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.18.3.1.bb => gettext_0.18.3.2.bb} (97%)

diff --git a/meta/recipes-core/gettext/gettext-0.18.3.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.18.3.2/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.18.3.1/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.18.3.2/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/COPYING
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.1/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.18.3.2/COPYING
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makefile.in.in
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.1/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makefile.in.in
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/Makevars.template b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makevars.template
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.1/Makevars.template
rename to meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makevars.template
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/aclocal.tgz b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/aclocal.tgz
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.1/aclocal.tgz
rename to meta/recipes-core/gettext/gettext-minimal-0.18.3.2/aclocal.tgz
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/config.rpath
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.1/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.18.3.2/config.rpath
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/iconv-m4-remove-the-test-to-convert-euc-jp.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.1/iconv-m4-remove-the-test-to-convert-euc-jp.patch
rename to meta/recipes-core/gettext/gettext-minimal-0.18.3.2/iconv-m4-remove-the-test-to-convert-euc-jp.patch
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/remove-potcdate.sin
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.1/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.18.3.2/remove-potcdate.sin
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.2.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.18.3.2.bb
diff --git a/meta/recipes-core/gettext/gettext_0.18.3.1.bb b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
similarity index 97%
rename from meta/recipes-core/gettext/gettext_0.18.3.1.bb
rename to meta/recipes-core/gettext/gettext_0.18.3.2.bb
index 1a31ab0..553d522 100644
--- a/meta/recipes-core/gettext/gettext_0.18.3.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
@@ -18,8 +18,8 @@ PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--
 
 LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 
-SRC_URI[md5sum] = "3fc808f7d25487fc72b5759df7419e02"
-SRC_URI[sha256sum] = "0d8f9a33531b77776b3dc473e7940019ca19bfca5b4c06db6e96065eeb07245d"
+SRC_URI[md5sum] = "241aba309d07aa428252c74b40a818ef"
+SRC_URI[sha256sum] = "d1a4e452d60eb407ab0305976529a45c18124bd518d976971ac6dc7aa8b4c5d7"
 
 inherit autotools
 
-- 
1.7.9.5


