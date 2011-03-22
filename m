Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q26FV-0006ho-EM
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 19:24:09 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q26Dk-0001f2-SL from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 11:22:20 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 11:21:28 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 12:22:19 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 11:21:55 -0700
Message-Id: <3c41c3e7dc35b364f0c16d3694397adea2aa184a.1300817337.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300817337.git.tom_rini@mentor.com>
References: <cover.1300817337.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Mar 2011 18:22:19.0611 (UTC)
	FILETIME=[14887AB0:01CBE8BE]
Subject: [PATCH 1/2] coreutils: Switch to disabling gmp support
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
X-List-Received-Date: Tue, 22 Mar 2011 18:24:09 -0000

Coreutils can optionally build with libgmp support and for our uses
it's fine to just not build it rather than add the dependency.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-core/coreutils/coreutils_8.9.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.9.bb b/meta/recipes-core/coreutils/coreutils_8.9.bb
index 4b9a655..d75c080 100644
--- a/meta/recipes-core/coreutils/coreutils_8.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.9.bb
@@ -7,9 +7,9 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r0"
+PR = "r1"
 DEPENDS = "perl-native gmp"
-DEPENDS_virtclass-native = "perl-native gmp-native"
+DEPENDS_virtclass-native = "perl-native"
 
 inherit autotools gettext
 
@@ -18,6 +18,8 @@ SRC_URI = "http://ftp.gnu.org/gnu/coreutils/${BP}.tar.gz"
 SRC_URI[md5sum] = "36909ae68840d73a800120cf74af794a"
 SRC_URI[sha256sum] = "aa991fa4296b22ff929a31a5cb5528bb783c84cdef4503c4ff311cfbeaebf50a"
 
+EXTRA_OECONF_virtclass-native = "--without-gmp"
+
 # [ gets a special treatment and is not included in this
 bindir_progs = "base64 basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
-- 
1.7.0.4



