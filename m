Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TRKIC-0002CG-TT
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 12:04:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9P9oU66023131
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Oct 2012 02:50:30 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Thu, 25 Oct 2012 02:50:30 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 25 Oct 2012 17:50:58 +0800
Message-ID: <6568219d957b11739d325f2573df9266cfe228a6.1351155183.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1351155183.git.kai.kang@windriver.com>
References: <cover.1351155183.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] perl: update dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2012 10:04:01 -0000
Content-Type: text/plain

Update dependencies for perl modules again. When only install
perl-module-file-glob, run perl script with "require File::Glob;" will
fail. Update dependencies to fix that.

[Yocto 3069]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc |    2 ++
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
index 2707fe8..39972ca 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
@@ -13,8 +13,10 @@
 
 # Some additional dependencies that the above doesn't manage to figure out
 # Please take care that exporter depends exporter-heavy, not reverse
+RDEPENDS_${PN}-module-dynaloader += "${PN}-module-carp"
 RDEPENDS_${PN}-module-exporter += "${PN}-module-exporter-heavy"
 RDEPENDS_${PN}-module-file-glob += "${PN}-module-feature"
+RDEPENDS_${PN}-module-file-glob += "${PN}-module-file"
 RDEPENDS_${PN}-module-file-path += "${PN}-module-cwd"
 RDEPENDS_${PN}-module-file-spec += "${PN}-module-file-spec-unix"
 RDEPENDS_${PN}-module-file-stat += "${PN}-module-fcntl"
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 3ede831..1e1eb04 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r13"
+PR = "r14"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
-- 
1.7.5.4



