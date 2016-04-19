Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F67F6FF01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:09:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3J29a10000488
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:09:37 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 19:09:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2016 19:09:35 -0700
Message-ID: <890a9c103c72589bd02b09f807fcb628bccfbe07.1461031719.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461031719.git.liezhi.yang@windriver.com>
References: <cover.1461031719.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] buildtools-tarball: set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Tue, 19 Apr 2016 02:09:37 -0000
Content-Type: text/plain

The recipe doesn't need any default deps.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index ee86881..e9578ca 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -67,3 +67,6 @@ create_sdk_files_append () {
 
 # buildtools-tarball doesn't need config site
 TOOLCHAIN_NEED_CONFIGSITE_CACHE = ""
+
+# The recipe doesn't need any default deps
+INHIBIT_DEFAULT_DEPS = "1"
-- 
2.8.0


