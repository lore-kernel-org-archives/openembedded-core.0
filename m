Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <damien.lespiau@gmail.com>) id 1SrGLl-0002OF-Hm
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 00:34:37 +0200
Received: by wibhq4 with SMTP id hq4so3701084wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 15:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3B4gvSm50GaNIC21vOSMlP25v0xv/7WXjy/3j5X5NZs=;
	b=Ip9qXndXhXlNijtZbfKyINx9XnSX+qZr1nRBrsXo2SrvqPUXCMyDmBiPyEMz3ecasY
	cQ2VL15n+QbKydMz4ZSKPGvP7egfr93ApH3jXd0IBWE5xxN0KbIgSRNA3/LS3iNAky4K
	Ho51TEnEKeFZeVAWaEl4/FcNj1ApxsEfMZg3AC2QWpaAZ01JAiQIBDIze+UC2eEMToLi
	ztVeNm6ZCQeFW/g6/8wcy6eVq/uu1FBQbafuBSXvjArKV+SP89JJlzhJYljJZjouk+0D
	ulPSmkLnPEj+1hSj1QJ1/2v1sPXoC96b/j2D/vUBFym40XHgqRZk4LRR3jXOUHBH9Hug
	3nGQ==
Received: by 10.216.136.230 with SMTP id w80mr369410wei.199.1342563797893;
	Tue, 17 Jul 2012 15:23:17 -0700 (PDT)
Received: from localhost.localdomain ([83.217.123.106])
	by mx.google.com with ESMTPS id h9sm29260931wiz.1.2012.07.17.15.23.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 15:23:17 -0700 (PDT)
From: Damien Lespiau <damien.lespiau@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 23:23:12 +0100
Message-Id: <1342563792-17634-1-git-send-email-damien.lespiau@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Damien Lespiau <damien.lespiau@intel.com>
Subject: [PATCH] eglic: Update the svn URL
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
X-List-Received-Date: Tue, 17 Jul 2012 22:34:37 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

Apparently, you can't be checkout eglibc at this URL anymore:

STDERR: svn: E170000: URL 'svn://www.eglibc.org/svn/branches/eglibc-2_15' doesn't exist

eglibc.org does give http access to the repository, but you have to use
the http:// scheme.

So let's change both 2.15 and 2.16 recipes.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
---
 meta/recipes-core/eglibc/eglibc_2.15.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.16.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 110febf..16b3fa1 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -7,7 +7,7 @@ PR = "r12"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
+SRC_URI = "http://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 09f5dbb..bec39cf 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -7,7 +7,7 @@ PR = "r0"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
+SRC_URI = "http://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
-- 
1.7.10.4



