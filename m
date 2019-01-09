Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 142936C10B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 01:52:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,455,1539619200"; d="scan'208";a="51597032"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2019 09:52:03 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 25E324BAC827
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 09:52:01 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 9 Jan 2019 09:52:07 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 09:52:23 +0800
Message-ID: <20190109015224.14076-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190109015224.14076-1-hongl.fnst@cn.fujitsu.com>
References: <20190109015224.14076-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 25E324BAC827.AF944
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] python3-pbr:Upgrade to 5.1.1
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
X-List-Received-Date: Wed, 09 Jan 2019 01:52:04 -0000
Content-Type: text/plain

Upgrade python3-pbr from 4.2.0 to 5.1.1.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-pbr.inc                   | 4 ++--
 .../python/{python3-pbr_4.2.0.bb => python3-pbr_5.1.1.bb}     | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pbr_4.2.0.bb => python3-pbr_5.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python-pbr.inc
index 5a295c5f33..bfe3030b07 100644
--- a/meta/recipes-devtools/python/python-pbr.inc
+++ b/meta/recipes-devtools/python/python-pbr.inc
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "6619780896ca81c7cd19c6e2f439b6c9"
-SRC_URI[sha256sum] = "1b8be50d938c9bb75d0eaf7eda111eec1bf6dc88a62a6412e33bf077457e0f45"
+SRC_URI[md5sum] = "dbc94417a8ff0432d6244501a7f1bd49"
+SRC_URI[sha256sum] = "f59d71442f9ece3dffc17bc36575768e1ee9967756e6b6535f0ee1f0054c3d68"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-pbr_4.2.0.bb b/meta/recipes-devtools/python/python3-pbr_5.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-pbr_4.2.0.bb
rename to meta/recipes-devtools/python/python3-pbr_5.1.1.bb
-- 
2.17.2




