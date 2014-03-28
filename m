Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F39006F7E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:44:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9iERF004557
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:44:14 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:44:14 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:52 +0800
Message-ID: <3ac712e3b9c2e6138fd34865a98a051ae16a45bf.1395996410.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996410.git.hongxu.jia@windriver.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/5] packagegroup-self-hosted: Use packagegroup-core-buildessential
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
X-List-Received-Date: Fri, 28 Mar 2014 09:44:14 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

Instead of manually specifying build dependencies, use the
packagegroup-core-buildessential.  This ensures there is only one place
that needs to be modified when toolchain items and dependencies change.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 5581d8e..fe49fb4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -66,33 +66,23 @@ RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
 
 # eglibc-utils: for rpcgen
 RDEPENDS_packagegroup-self-hosted-sdk = "\
-    autoconf \
-    automake \
-    binutils \
     ccache \
     coreutils \
-    cpp \
     distcc \
     eglibc-utils \
     eglibc-gconv-ibm850 \
     file \
     findutils \
-    g++ \
-    gcc \
     intltool \
     ldd \
     less \
     libssp \
     libssp-dev \
     libssp-staticdev \
-    libstdc++ \
-    libstdc++-dev \
-    libtool \
-    make \
     mktemp \
+    packagegroup-core-buildessential \
     perl-module-re \
     perl-module-text-wrap \
-    pkgconfig \
     quilt \
     sed \
     "
-- 
1.8.1.2


