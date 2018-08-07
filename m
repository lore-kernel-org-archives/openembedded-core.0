Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0FEA978A8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 09:32:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="43166956"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2018 17:32:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3E8C04B6ADEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 17:32:24 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 7 Aug 2018 17:32:25 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Aug 2018 17:31:46 +0800
Message-ID: <20180807093148.17801-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180807093148.17801-1-hongl.fnst@cn.fujitsu.com>
References: <20180807093148.17801-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 3E8C04B6ADEB.AF499
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] vala:0.40.4 -> 0.40.8
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
X-List-Received-Date: Tue, 07 Aug 2018 09:32:35 -0000
Content-Type: text/plain

Upgrade vala from 0.40.4 to 0.40.8

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/vala/{vala_0.40.4.bb => vala_0.40.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.40.4.bb => vala_0.40.8.bb} (64%)

diff --git a/meta/recipes-devtools/vala/vala_0.40.4.bb b/meta/recipes-devtools/vala/vala_0.40.8.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.40.4.bb
rename to meta/recipes-devtools/vala/vala_0.40.8.bb
index 7597813..dba9f0d 100644
--- a/meta/recipes-devtools/vala/vala_0.40.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.40.8.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "a690209e202be7aa6234aaa4e48fe3fb"
-SRC_URI[sha256sum] = "379354a2a2f7ee5c4d6e0f5e88b0e32620dcd5f51972baf6d90d9f18eb689198"
+SRC_URI[md5sum] = "3e3177692fb5d81a7b8aaa6b95a30bdd"
+SRC_URI[sha256sum] = "5c35e087a7054e9f0a514a0c1f1d0a0d7cf68d3e43c1dbeb840f9b0d815c0fa5"
-- 
2.7.4




