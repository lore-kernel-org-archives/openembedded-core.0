Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SgiFv-00009t-Gu
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 22:09:00 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CE28F30467
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 15:58:13 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 12:58:00 -0700
Message-Id: <eedf8f8d9a7324b33dec71a5c52f8d980dc78752.1340038108.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CE28F30467.D3931
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 6/6] eglibc: added ac_cv_path_ to CACHED_CONFIGUREVARS
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
X-List-Received-Date: Mon, 18 Jun 2012 20:09:00 -0000

From: Saul Wold <sgw@linux.intel.com>

On Fedora 17, bash has moved to /usr/bin/bash and the configure process finds it
on the host machine there, this ensures that it is set correctly for the target.

[YOCTO #2363]

Signed-off-by: Saul Wold <sgw@linux.intel.com>

Reworked commit to fix merge conflicts with denzil branch.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/eglibc/eglibc.inc     |    2 ++
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 8e3fe50..51061bc 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -32,6 +32,8 @@ require eglibc-options.inc
 
 LEAD_SONAME = "libc.so"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_KSH=${base_bindir}/bash \
+                       ac_cv_path_BASH_SHELL=${base_bindir}/bash"
 GLIBC_EXTRA_OECONF ?= ""
 GLIBC_EXTRA_OECONF_virtclass-nativesdk = ""
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 73cd0aa..690f99d 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r27"
+PR = "r28"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 713efc3..f5219d1 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r6"
+PR = "r7"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-- 
1.7.9.5



