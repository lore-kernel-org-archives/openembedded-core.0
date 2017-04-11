Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C845F77CD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:53:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17599905"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Apr 2017 16:53:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 10EFD47CE222
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:53:01 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 11 Apr 2017 16:53:00 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 16:52:29 +0800
Message-ID: <1491900749-732-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 10EFD47CE222.A7779
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] coreutils: 8.26 -> 8.27
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
X-List-Received-Date: Tue, 11 Apr 2017 08:53:06 -0000
Content-Type: text/plain

Upgrade coreutils from 8.26 to 8.27.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch    | 0
 .../0001-local.mk-fix-cross-compiling-problem.patch               | 0
 .../0001-uname-report-processor-and-hardware-correctly.patch      | 0
 .../disable-ls-output-quoting.patch                               | 0
 .../{coreutils-8.26 => coreutils-8.27}/fix-selinux-flask.patch    | 0
 .../man-decouple-manpages-from-build.patch                        | 0
 .../remove-usr-local-lib-from-m4.patch                            | 0
 .../coreutils/{coreutils_8.26.bb => coreutils_8.27.bb}            | 8 ++++----
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.26 => coreutils-8.27}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.26 => coreutils-8.27}/0001-local.mk-fix-cross-compiling-problem.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.26 => coreutils-8.27}/0001-uname-report-processor-and-hardware-correctly.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.26 => coreutils-8.27}/disable-ls-output-quoting.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.26 => coreutils-8.27}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.26 => coreutils-8.27}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.26 => coreutils-8.27}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.26.bb => coreutils_8.27.bb} (94%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.26/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-core/coreutils/coreutils-8.27/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.26/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-core/coreutils/coreutils-8.27/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch b/meta/recipes-core/coreutils/coreutils-8.27/0001-local.mk-fix-cross-compiling-problem.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
rename to meta/recipes-core/coreutils/coreutils-8.27/0001-local.mk-fix-cross-compiling-problem.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.26/0001-uname-report-processor-and-hardware-correctly.patch b/meta/recipes-core/coreutils/coreutils-8.27/0001-uname-report-processor-and-hardware-correctly.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.26/0001-uname-report-processor-and-hardware-correctly.patch
rename to meta/recipes-core/coreutils/coreutils-8.27/0001-uname-report-processor-and-hardware-correctly.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.26/disable-ls-output-quoting.patch b/meta/recipes-core/coreutils/coreutils-8.27/disable-ls-output-quoting.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.26/disable-ls-output-quoting.patch
rename to meta/recipes-core/coreutils/coreutils-8.27/disable-ls-output-quoting.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.26/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils-8.27/fix-selinux-flask.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.26/fix-selinux-flask.patch
rename to meta/recipes-core/coreutils/coreutils-8.27/fix-selinux-flask.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.26/man-decouple-manpages-from-build.patch b/meta/recipes-core/coreutils/coreutils-8.27/man-decouple-manpages-from-build.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.26/man-decouple-manpages-from-build.patch
rename to meta/recipes-core/coreutils/coreutils-8.27/man-decouple-manpages-from-build.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.26/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.27/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.26/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.27/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.26.bb b/meta/recipes-core/coreutils/coreutils_8.27.bb
similarity index 94%
rename from meta/recipes-core/coreutils/coreutils_8.26.bb
rename to meta/recipes-core/coreutils/coreutils_8.27.bb
index 52ef101..667e0af 100644
--- a/meta/recipes-core/coreutils/coreutils_8.26.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.27.bb
@@ -23,10 +23,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
           "
 
-SRC_URI[tarball.md5sum] = "d5aa2072f662d4118b9f4c63b94601a6"
-SRC_URI[tarball.sha256sum] = "155e94d748f8e2bc327c66e0cbebdb8d6ab265d2f37c3c928f7bf6c3beba9a8e"
-SRC_URI[manpages.md5sum] = "b58107f532f7beffcb2f38e2ac1f2da3"
-SRC_URI[manpages.sha256sum] = "9324ec412ffca3b0431e6299720c33ac98e749e430f72a7c6e65f3635c86aa29"
+SRC_URI[tarball.md5sum] = "502795792c212932365e077946d353ae"
+SRC_URI[tarball.sha256sum] = "8891d349ee87b9ff7870f52b6d9312a9db672d2439d289bc57084771ca21656b"
+SRC_URI[manpages.md5sum] = "1b31a688d06764e0e94aa20b7ea08222"
+SRC_URI[manpages.sha256sum] = "1f615819e9167646c731636b6c5ecbe79837e82a18666bacc82c3fb1dfcfaea3"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
-- 
2.7.4




