Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5F4872694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5iiJw021747
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:09 +0800
Message-ID: <66570ab9e491334596d250a4f0cc52ae261ab519.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] rpcbind: upgrade to 0.2.2
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:44 -0000
Content-Type: text/plain

Drop 0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch
which has been merged to 0.2.2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...bind-rpcuser-not-being-set-in-Makefile.am.patch | 34 ----------------------
 .../rpcbind/{rpcbind_0.2.1.bb => rpcbind_0.2.2.bb} |  5 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.1.bb => rpcbind_0.2.2.bb} (90%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch
deleted file mode 100644
index b556a46..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 914507aa6980129fefb4decaabea1a4f60c7182b Mon Sep 17 00:00:00 2001
-From: Steve Dickson <steved@redhat.com>
-Date: Wed, 21 Aug 2013 14:40:22 -0400
-Subject: [PATCH 1/1] rpcbind: rpcuser not being set in Makefile.am
-
-Upstream-Status: backport
-
-Commit 8d7a0708 cause a regression where the rpcuser id was not
-being set, which in turn cause rpcbind to immediately exit.
-This patch removes the extra ',' that was in the AC_ARG_WITH
-statement in the configure.ac file.
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2b67720..1cf42d3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -23,7 +23,7 @@ AC_ARG_WITH([statedir],
- AC_SUBST([statedir], [$with_statedir])
- 
- AC_ARG_WITH([rpcuser],
--  AS_HELP_STRING([--with-rpcuser=ARG], [use ARG for RPC @<:@default=root@:>@]),
-+  AS_HELP_STRING([--with-rpcuser=ARG], [use ARG for RPC @<:@default=root@:>@])
-   ,, [with_rpcuser=root])
- AC_SUBST([rpcuser], [$with_rpcuser])
-  
--- 
-1.8.3.2
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
similarity index 90%
rename from meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
rename to meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
index b732476..44c79eb 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
                     file://src/rpcinfo.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
-           file://0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch \
            file://init.d \
            ${UCLIBCPATCHES} \
            file://rpcbind.conf \
@@ -24,8 +23,8 @@ UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
                             "
 UCLIBCPATCHES ?= ""
 
-SRC_URI[md5sum] = "0a5f9c2142af814c55d957aaab3bcc68"
-SRC_URI[sha256sum] = "da169ff877a5a07581fad50a9a808ac6e96f0c277a3df49a7ef005778428496e"
+SRC_URI[md5sum] = "8acf839bfef2364a05fbd6be5f8edf9a"
+SRC_URI[sha256sum] = "13dbc8c796dbe0ce8df873007bea0490c8460b56202d918c9eb6fa0358a08f29"
 
 inherit autotools update-rc.d systemd pkgconfig
 
-- 
1.9.1


