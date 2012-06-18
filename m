Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SgiFv-00009r-QS
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 22:09:00 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0504830466
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 15:58:10 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 12:57:59 -0700
Message-Id: <0dd9446aa82dd1baaf0109a4e2dc001a0ceca2a3.1340038108.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0504830466.B855E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 5/6] quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS
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
 meta/recipes-devtools/quilt/quilt_0.51.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt_0.51.bb b/meta/recipes-devtools/quilt/quilt_0.51.bb
index 4e51b49..81a7a9a 100644
--- a/meta/recipes-devtools/quilt/quilt_0.51.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.51.bb
@@ -4,7 +4,10 @@ RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-PR = "r4"
+PR = "r5"
+
+
+CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
 
 PERLPATH = "${bindir}/env perl"
 PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
-- 
1.7.9.5



