Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96FF26D7EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:23:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD1Nvlj021599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:23:57 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 12 Nov 2013 17:23:57 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Nov 2013 19:23:23 -0600
Message-ID: <45df65463082ec2d397cf71a940cf87dee97ec4f.1384305535.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1384305535.git.mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/6] packagegroups: Remove toolchain *-symlinks packages
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
X-List-Received-Date: Wed, 13 Nov 2013 01:23:56 -0000
Content-Type: text/plain

We are no longer producing the *-symlinks packages, so remove the dependencies
to those items.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
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
index 108e678..8e43201 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -70,20 +70,16 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
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
1.8.1.2.545.g2f19ada


