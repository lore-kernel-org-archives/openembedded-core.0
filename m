Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D427787A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 07:06:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36008409"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2018 15:06:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AD6DE49F19B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 15:06:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 26 Jan 2018 15:06:31 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jan 2018 15:06:31 +0800
Message-ID: <1516950393-15372-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516950393-15372-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516950393-15372-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: AD6DE49F19B7.A7945
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] librsvg: 2.40.19 -> 2.40.20
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
X-List-Received-Date: Fri, 26 Jan 2018 07:06:34 -0000
Content-Type: text/plain

Upgrade librsvg from 2.40.19 to 2.40.20.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-gnome/librsvg/{librsvg_2.40.19.bb => librsvg_2.40.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.19.bb => librsvg_2.40.20.bb} (91%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.19.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
similarity index 91%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.19.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
index 6aeeb6b..4dbd66e 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.19.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-ev
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "934eff469b34c732fb91ddb9afd40638"
-SRC_URI[archive.sha256sum] = "612b4d8b8609036f5d899be3fe70d9866b5f6ac5c971154c1c0ef7242216c1f7"
+SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
+SRC_URI[archive.sha256sum] = "cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.7.4




