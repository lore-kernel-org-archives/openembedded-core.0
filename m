Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E116C6EAFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9hSpE004536
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:28 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:05 +0800
Message-ID: <dd4ee35b41c3112e609bd59441718105f80b54ec.1395996194.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996194.git.hongxu.jia@windriver.com>
References: <cover.1395996194.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/7] guile: add texinfo-native to DEPENDS
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:29 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Use texinfo-native instead of host command

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/guile/guile_2.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
index 60318e7..1e907ba 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -32,7 +32,7 @@ SRC_URI[sha256sum] = "f70a38c8d9751f442679bfe61852bba8545af4d4355d037630997c2f37
 inherit autotools gettext
 BBCLASSEXTEND = "native"
 
-DEPENDS = "libunistring bdwgc gmp libtool libffi"
+DEPENDS = "libunistring bdwgc gmp libtool libffi texinfo-native"
 # add guile-native only to the target recipe's DEPENDS
 DEPENDS_append_class-target = " guile-native libatomics-ops"
 
-- 
1.8.1.2


