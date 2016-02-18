Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 580BE7422C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 05:28:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1I5Sa4w019548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:28:36 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Feb 2016 21:28:35 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2016 13:29:02 +0800
Message-ID: <e8d1bf35bf8050303f6158e4c897b84160eb695c.1455772181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455772181.git.Qi.Chen@windriver.com>
References: <cover.1455772181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] findutils: upgrade to 4.5.19
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
X-List-Received-Date: Thu, 18 Feb 2016 05:28:36 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../findutils/{findutils_4.5.14.bb => findutils_4.5.19.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/findutils/{findutils_4.5.14.bb => findutils_4.5.19.bb} (77%)

diff --git a/meta/recipes-extended/findutils/findutils_4.5.14.bb b/meta/recipes-extended/findutils/findutils_4.5.19.bb
similarity index 77%
rename from meta/recipes-extended/findutils/findutils_4.5.14.bb
rename to meta/recipes-extended/findutils/findutils_4.5.19.bb
index a58a82f..de39a89 100644
--- a/meta/recipes-extended/findutils/findutils_4.5.14.bb
+++ b/meta/recipes-extended/findutils/findutils_4.5.19.bb
@@ -8,8 +8,8 @@ DEPENDS = "bison-native"
 
 SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
 
-SRC_URI[md5sum] = "a8a8176282fd28e8d1234c84d847fa66"
-SRC_URI[sha256sum] = "0de3cf625a5c9f154eee3171e072515ffdde405244dd00502af617ac57b73ae2"
+SRC_URI[md5sum] = "1428516452520b51cf893c05500eda3d"
+SRC_URI[sha256sum] = "e9bc769d78573c91b1d4e504ad39621b870db6fa38fde923acf6896399f16f8e"
 
 # http://savannah.gnu.org/bugs/?27299
 CACHED_CONFIGUREVARS += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
-- 
1.9.1


