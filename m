Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEC076F157
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:44:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9iCAa024693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:44:12 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:44:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:51 +0800
Message-ID: <4691bff032d8536069f808068e5b477c8f47d213.1395996410.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996410.git.hongxu.jia@windriver.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/5] packagegroups: Remove toolchain *-symlinks packages
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
X-List-Received-Date: Fri, 28 Mar 2014 09:44:12 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

We are no longer producing the *-symlinks packages, so remove the dependencies
to those items.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb | 4 ----
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb         | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 74ed247..e21f8c1 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -12,13 +12,9 @@ RDEPENDS_packagegroup-core-buildessential = "\
     autoconf \
     automake \
     binutils \
-    binutils-symlinks \
     cpp \
-    cpp-symlinks \
     gcc \
-    gcc-symlinks \
     g++ \
-    g++-symlinks \
     gettext \
     make \
     libstdc++ \
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 8e3b917..5581d8e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -69,20 +69,16 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     autoconf \
     automake \
     binutils \
-    binutils-symlinks \
     ccache \
     coreutils \
     cpp \
-    cpp-symlinks \
     distcc \
     eglibc-utils \
     eglibc-gconv-ibm850 \
     file \
     findutils \
     g++ \
-    g++-symlinks \
     gcc \
-    gcc-symlinks \
     intltool \
     ldd \
     less \
-- 
1.8.1.2


