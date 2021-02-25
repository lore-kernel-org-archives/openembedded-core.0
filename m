Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.5699.1614217729023729314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 17:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11P1mbCN006948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 17:48:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 17:48:31 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 24 Feb 2021 17:48:31 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/7] rust: update the README to conform to being in oe-core
Date: Wed, 24 Feb 2021 20:48:20 -0500
Message-ID: <20210225014823.397741-5-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225014823.397741-1-Randy.MacLeod@windriver.com>
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/rust/README-rust.md | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/rust/README-rust.md b/meta/recipes-devtools/rust/README-rust.md
index 400baf700d..68540b478d 100644
--- a/meta/recipes-devtools/rust/README-rust.md
+++ b/meta/recipes-devtools/rust/README-rust.md
@@ -1,7 +1,7 @@
 ## Introduction
 
-This OpenEmbedded layer provides the rust compiler, tools for building packages
-(cargo), and a few example projects.
+This provides the Rust compiler, tools for building packages (cargo), and 
+a few example projects.
 
 ## What works:
 
@@ -12,7 +12,7 @@ This OpenEmbedded layer provides the rust compiler, tools for building packages
 
 ## What doesn't:
 
- - Using anything but x86_64 as the build environment
+ - Using anything but x86_64 or arm64 as the build environment
  - rust (built for target) [issue #81](https://github.com/meta-rust/meta-rust/issues/81)
 
 ## What's untested:
@@ -24,13 +24,14 @@ This OpenEmbedded layer provides the rust compiler, tools for building packages
 When building a rust package in bitbake, it's usually easiest to build with
 cargo using cargo.bbclass.  If the package already has a Cargo.toml file (most
 rust packages do), then it's especially easy.  Otherwise you should probably
-get the code building in cargo first.
+get the code building in cargo first. 
 
 Once your package builds in cargo, you can use
 [cargo-bitbake](https://github.com/meta-rust/cargo-bitbake) to generate a bitbake
 recipe for it.  This allows bitbake to fetch all the necessary dependent
 crates, as well as a pegged version of the crates.io index, to ensure maximum
-reproducibility.
+reproducibility. Once the Rust SDK support is added to oe-core, cargo-bitbake
+may also be added to the SDK.
 
 NOTE: You will have to edit the generated recipe based on the comments
 contained within it
@@ -51,18 +52,6 @@ On the target:
  - Any `-sys` packages your project might need must have RDEPENDs for
  the native library.
 
-## Maintainer(s) & Patch policy
-
-Open a Pull Request.
-
-The master branch supports the latest master of poky. When poky creates releases, we will create a branch with the same name as the poky release. This release branch should always work with that poky release. Note that these release branches will typically be less tested than the master branch.
-
-All new patches against rust, rust-llvm, and cargo must have referenced
-upstream issues or PRs opened or an explanation why the patch cannot be
-upstreamed. This cooresponds to the OpenEmbedded policy for other meta layers.
-
-More info can be seen on the wiki.
-
 ## Copyright
 
 MIT OR Apache-2.0 - Same as rust
-- 
2.27.0

