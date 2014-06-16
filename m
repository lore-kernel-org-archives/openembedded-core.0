Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7D86FEFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:49:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5GDnL8s009153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:49:21 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 16 Jun 2014 06:49:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 06:49:20 -0700
Message-ID: <e79079ad10954af18bad63ad1ab8939ceda7fbac.1402926503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402926503.git.liezhi.yang@windriver.com>
References: <cover.1402926503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] guile: depends on texinfo-native
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
X-List-Received-Date: Mon, 16 Jun 2014 13:49:22 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Fixed this error on Fedora19-x86_64:

[snip]
| ./api-control.texi:1616: must be after `@deftypefn' to use `@deftypefnx'
| ./api-utility.texi:518: warning: node `C Hooks' is next for `Hook Reference' in menu but not in sectioning
| ./api-utility.texi:626: warning: node `Hook Reference' is prev for `C Hooks' in menu but not in sectioning
[snip]

We can use the texinfo-native to fix this error.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/guile/guile_2.0.11.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index d19460a..8a3bf28 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c6
 inherit autotools gettext pkgconfig texinfo
 BBCLASSEXTEND = "native"
 
-DEPENDS = "libunistring bdwgc gmp libtool libffi"
+DEPENDS = "libunistring bdwgc gmp libtool libffi texinfo-native"
 # add guile-native only to the target recipe's DEPENDS
 DEPENDS_append_class-target = " guile-native libatomics-ops"
 
-- 
1.7.9.5


