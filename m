Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9ED61843
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3ZDj9025957
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:13 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:34:53 -0500
Message-ID: <6b9521940fcccdd830259cf646abf82df5b7b8ec.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/14] dpkg: fix/remove unrecognised options
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:12 -0000
Content-Type: text/plain

Fix/remove the following unrecognised options:
* --without-static-progs: can't find anything about this in the history,
  so remove it.
* --without-dselect -> --disable-dselect
* --with-start-stop-daemon -> --enable-start-stop-daemon
* --with-bz2lib, typo, should be --with-bz2
* --without-sgml-doc: the sgml doc had been removed from dpkg, so
  remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index b1da4fb..d5dc412 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -22,14 +22,14 @@ PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 export PERL_LIBDIR = "${libdir}/perl"
 PERL_LIBDIR_class-native = "${libdir}/perl-native/perl"
 
-EXTRA_OECONF = "--without-static-progs \
-		--without-dselect \
-		--with-start-stop-daemon \
+EXTRA_OECONF = "\
+		--disable-dselect \
+		--enable-start-stop-daemon \
 		--with-zlib \
-		--with-bz2lib \
+		--with-bz2 \
 		--without-liblzma \
 		--without-selinux \
-		--without-sgml-doc"
+		"
 
 do_configure () {
     echo >> ${S}/m4/compiler.m4
-- 
1.7.10.4


