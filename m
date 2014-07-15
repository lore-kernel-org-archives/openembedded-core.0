Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6947A701C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJfRt022782
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:41 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:10 -0700
Message-ID: <a5eccbf8c34a541522e2676e702bb9b93035fd88.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/38] quilt: add bash and perl to RDEPENDS
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:40 -0000
Content-Type: text/plain

Perl scripts:
quilt/usr/share/quilt/scripts/edmail is a perl script, but perl is not in RDEPEND_quilt
quilt/usr/share/quilt/scripts/remove-trailing-ws is a perl script, but perl is not in RDEPEND_quilt
quilt/usr/share/quilt/scripts/dependency-graph is a perl script, but perl is not in RDEPEND_quilt
guards/usr/bin/guards is a perl script, but perl is not in RDEPEND_guards

Bash scripts:
quilt-ptest/usr/lib/quilt/ptest/quilt/unapplied
quilt-ptest/usr/lib/quilt/ptest/quilt/push
quilt-ptest/usr/lib/quilt/ptest/quilt/fork
quilt-ptest/usr/lib/quilt/ptest/quilt/patches
quilt-ptest/usr/lib/quilt/ptest/quilt/upgrade
quilt-ptest/usr/lib/quilt/ptest/quilt/delete
quilt-ptest/usr/lib/quilt/ptest/quilt/applied
quilt-ptest/usr/lib/quilt/ptest/quilt/rename
quilt-ptest/usr/lib/quilt/ptest/quilt/pop
quilt-ptest/usr/lib/quilt/ptest/quilt/new
quilt-ptest/usr/lib/quilt/ptest/quilt/remove
quilt-ptest/usr/lib/quilt/ptest/quilt/series
quilt-ptest/usr/lib/quilt/ptest/quilt/setup
quilt-ptest/usr/lib/quilt/ptest/quilt/grep
quilt-ptest/usr/lib/quilt/ptest/quilt/previous
quilt-ptest/usr/lib/quilt/ptest/quilt/mail
quilt-ptest/usr/lib/quilt/ptest/quilt/edit
quilt-ptest/usr/lib/quilt/ptest/quilt/top
quilt-ptest/usr/lib/quilt/ptest/quilt/revert
quilt-ptest/usr/lib/quilt/ptest/quilt/diff
quilt-ptest/usr/lib/quilt/ptest/quilt/graph
quilt-ptest/usr/lib/quilt/ptest/quilt/refresh
quilt-ptest/usr/lib/quilt/ptest/quilt/annotate
quilt-ptest/usr/lib/quilt/ptest/quilt/fold
quilt-ptest/usr/lib/quilt/ptest/quilt/next
quilt-ptest/usr/lib/quilt/ptest/quilt/add
quilt-ptest/usr/lib/quilt/ptest/quilt/files
quilt-ptest/usr/lib/quilt/ptest/quilt/import
quilt-ptest/usr/lib/quilt/ptest/quilt/header
quilt-ptest/usr/lib/quilt/ptest/quilt/snapshot
quilt-ptest/usr/lib/quilt/ptest/quilt/scripts/inspect
quilt-ptest/usr/lib/quilt/ptest/quilt/scripts/backup-files
quilt-ptest/usr/lib/quilt/ptest/bin/quilt
quilt-ptest/usr/lib/quilt/ptest/bin/patch-wrapper
quilt-ptest/usr/lib/quilt/ptest/compat/awk
quilt-ptest/usr/lib/quilt/ptest/compat/sendmail

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/quilt/quilt-0.63.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt-0.63.inc b/meta/recipes-devtools/quilt/quilt-0.63.inc
index f375785..50593a9 100644
--- a/meta/recipes-devtools/quilt/quilt-0.63.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.63.inc
@@ -26,7 +26,8 @@ FILES_guards = "${bindir}/guards"
 FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
 FILES_guards-doc = "${mandir}/man1/guards.1"
 
-RDEPENDS_${PN} = "bash"
+RDEPENDS_${PN} = "bash perl"
+RDEPENDS_guards = "perl"
 
 EXTRA_OE_MAKE_ARGS_darwin ?= ""
 EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
@@ -55,5 +56,5 @@ do_install_ptest() {
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
-                        perl-module-text-parsewords \
+                        perl-module-text-parsewords bash \
 "
-- 
1.7.9.5


