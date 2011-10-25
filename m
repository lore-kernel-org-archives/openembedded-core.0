Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RIbZx-0006Kv-AE
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 09:37:45 +0200
Received: by bkat8 with SMTP id t8so169438bka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=EDY4BAmfzoEHChA6DKTWvbmfd+ot4U4+xVHgKChvwic=;
	b=USpO6nFsWbxXEUYyr5//rzZOzKBAZ8dGn5elRHoYfHHKRSaJN08hETBC+oh8k7IFGu
	QX1laPeVmPZxXyUE3w4UqSVZRyag0G8pKRu/O83AW3hMNZnRLefrpB1rcHf7iPFG17Dx
	JBOb9QkNKiFLZzKLrkqj8bfVM/x37qQqMM7Ow=
Received: by 10.204.7.81 with SMTP id c17mr19700091bkc.25.1319527903141;
	Tue, 25 Oct 2011 00:31:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm26469470bks.11.2011.10.25.00.31.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 00:31:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 09:31:35 +0200
Message-Id: <1319527895-3628-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1319527042.26563.38.camel@ted>
References: <1319527042.26563.38.camel@ted>
Subject: [PATCH] libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: bump PR to rebuild after perl upgrade
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
X-List-Received-Date: Tue, 25 Oct 2011 07:37:45 -0000

* this isn't probably complete list.. just what failed here

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/expat/expat_2.0.1.bb             |    2 +-
 meta/recipes-devtools/git/git_1.7.7.bb             |    2 ++
 .../perl/libxml-parser-perl_2.41.bb                |    2 +-
 .../perl/libxml-simple-perl_2.18.bb                |    2 +-
 .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/expat/expat_2.0.1.bb b/meta/recipes-core/expat/expat_2.0.1.bb
index a675922..30b5684 100644
--- a/meta/recipes-core/expat/expat_2.0.1.bb
+++ b/meta/recipes-core/expat/expat_2.0.1.bb
@@ -1,6 +1,6 @@
 require expat.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "ee8b492592568805593f81f8cdf2a04c"
 SRC_URI[sha256sum] = "847660b4df86e707c9150e33cd8c25bc5cd828f708c7418e765e3e983a2e5e93"
diff --git a/meta/recipes-devtools/git/git_1.7.7.bb b/meta/recipes-devtools/git/git_1.7.7.bb
index 486e2e5..d383c10 100644
--- a/meta/recipes-devtools/git/git_1.7.7.bb
+++ b/meta/recipes-devtools/git/git_1.7.7.bb
@@ -1,5 +1,7 @@
 require git.inc
 
+PR = "r1"
+
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
 SRC_URI[md5sum] = "5d645884e688921e773186783b65ce33"
 SRC_URI[sha256sum] = "5a977bc01e4989b9928345e99aab15ce896cf5897c6e32eb449538574df377f6"
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index caf5704..ff61078 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e
 
 DEPENDS += "expat expat-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
 SRC_URI[md5sum] = "c320d2ffa459e6cdc6f9f59c1185855e"
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
index f2abf9d..205aa4d 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
@@ -2,7 +2,7 @@ SECTION = "libs"
 LICENSE = "Artistic"
 LIC_FILES_CHKSUM = "file://README;beginline=70;md5=94aa5d46682b411a53a5494cfb22640e"
 DEPENDS += "libxml-parser-perl"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
index 28e0e9f..1b612c0 100644
--- a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
+++ b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://search.cpan.org/src/DMEGG/SGMLSpm-1.03ii/DOC/HTML/SGMLSpm/sgm
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.cpan.org/authors/id/D/DM/DMEGG/SGMLSpm-${PV}.tar.gz \
            file://combined.patch"
-- 
1.7.7



