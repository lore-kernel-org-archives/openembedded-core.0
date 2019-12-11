Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F1B6A7FC08
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 01:02:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Dec 2019 17:02:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="220328344"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2019 17:02:17 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2019 17:01:35 -0800
Message-Id: <20191211010135.22547-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] go: upgrade 1.13.3 -> 1.13.5
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
X-List-Received-Date: Wed, 11 Dec 2019 01:02:16 -0000
Content-Transfer-Encoding: 8bit

go1.13.4 (released 2019/10/31) includes fixes to the net/http and syscall
packages. It also fixes an issue on macOS 10.15 Catalina where the non-
notarized installer and binaries were being rejected by Gatekeeper.
See the Go 1.13.4 milestone on our issue tracker for details.

https://github.com/golang/go/issues?q=milestone%3AGo1.13.4

go1.13.5 (released 2019/12/04) includes fixes to the go command, the runtime,
the linker, and the net/http package. See the Go 1.13.5 milestone on our issue
tracker for details.

https://github.com/golang/go/issues?q=milestone%3AGo1.13.5

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/go/go-1.13.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.13.inc b/meta/recipes-devtools/go/go-1.13.inc
index 2afe8b69cd..39dbd742ec 100644
--- a/meta/recipes-devtools/go/go-1.13.inc
+++ b/meta/recipes-devtools/go/go-1.13.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.13"
-GO_MINOR = ".3"
+GO_MINOR = ".5"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,6 +19,6 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "94ae8bf6a4fe623e34cb8b0db2a71ec0"
-SRC_URI[main.sha256sum] = "4f7123044375d5c404280737fbd2d0b17064b66182a65919ffe20ffe8620e3df"
+SRC_URI[main.md5sum] = "ecd1729313608d3ef352ea4fd9ea42cd"
+SRC_URI[main.sha256sum] = "27d356e2a0b30d9983b60a788cf225da5f914066b37a6b4f69d457ba55a626ff"
 
-- 
2.24.0


