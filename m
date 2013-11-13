Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD976D7E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:23:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD1Nwd6024250
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:23:58 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 12 Nov 2013 17:23:57 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Nov 2013 19:23:24 -0600
Message-ID: <98f0d4cd58376bacc39e6e1358b1b33d0bed5cce.1384305535.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1384305535.git.mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/6] packagegroup-self-hosted: Use packagegroup-core-buildessentials
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

Instead of manually specifying build dependencies, use the
packagegroup-core-buildessentials.  This ensures there is only one place
that needs to be modified when toolchain items and dependencies change.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 8e43201..e91a8d9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -67,33 +67,23 @@ RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
 
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
1.8.1.2.545.g2f19ada


