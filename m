Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE0C73EFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 02:09:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="92011796"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 May 2015 10:05:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t4C27xij003456
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 10:07:59 +0800
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 12 May 2015 10:09:23 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 May 2015 10:09:13 +0800
Message-ID: <1431396553-1813-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
Subject: [PATCH] coreutils_6.9.bb: Fix LSB NG Cases.
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
X-List-Received-Date: Tue, 12 May 2015 02:09:21 -0000
Content-Type: text/plain

-/tset/LI18NUX2K.L1/utils/sort/T.sort #1/3/17/19/33/35
-/tset/LI18NUX2K.L1/utils/comm/T.comm #1/2

The LSB test require comm can handle multibyte characters and
sort can interpret blank and alphanumeric character according
to the current locale and so on.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 9189426..4ff1d50 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -30,6 +30,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
 SRC_URI[sha256sum] = "89c2895ad157de50e53298b22d91db116ee4e1dd3fdf4019260254e2e31497b0"
 
+EXTRA_OECONF += "ac_cv_func_getgroups_works=yes \
+                 ac_cv_func_strcoll_works=yes"
 
 # acl is not a default feature
 #
-- 
1.8.4.2


