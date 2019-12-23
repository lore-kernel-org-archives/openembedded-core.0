Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9857FBBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 01:18:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Dec 2019 17:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,345,1571727600"; d="scan'208";a="299536372"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2019 17:18:48 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Dec 2019 17:18:36 -0800
Message-Id: <20191223011837.4646-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191223011837.4646-1-timothy.t.orling@linux.intel.com>
References: <20191223011837.4646-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [RFC][PATCH 1/2] nativesdk-buildtools-perl-dummy: add dependencies for autoconf and automake
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
X-List-Received-Date: Mon, 23 Dec 2019 01:18:48 -0000
Content-Transfer-Encoding: 8bit

* For buildtools-extended-tarball, where we are adding all of build-essentials
  to the nativesdk, we need additional perl modules for autoconf and automake.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 5bc11b9daf1..cfa41c4ae63 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -15,12 +15,15 @@ DUMMYPROVIDES_PACKAGES = "\
     nativesdk-perl-module-file-find \
     nativesdk-perl-module-file-glob \
     nativesdk-perl-module-file-path \
+    nativesdk-perl-module-file-spec \
     nativesdk-perl-module-file-stat \
     nativesdk-perl-module-getopt-long \
     nativesdk-perl-module-io-file \
+    nativesdk-perl-module-overloading \
     nativesdk-perl-module-posix \
     nativesdk-perl-module-thread-queue \
     nativesdk-perl-module-threads \
+    nativesdk-perl-module-warnings \
 "
 
 DUMMYPROVIDES = "\
-- 
2.20.1


