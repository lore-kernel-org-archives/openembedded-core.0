Return-Path: <huangqy.fnst@cn.fujitsu.com>
X-Greylist: delayed 635 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Aug 2017 03:06:30 UTC
Received: from heian.cn.fujitsu.com (unknown [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 655E26093E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 03:06:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,304,1498492800"; d="scan'208";a="22024317"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Aug 2017 10:55:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0A79C402BB71
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 10:55:52 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 1 Aug 2017 10:55:50 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Aug 2017 10:55:30 +0800
Message-ID: <1501556130-748-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 0A79C402BB71.A31C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] librsvg: 2.40.17 -> 2.40.18
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
X-List-Received-Date: Tue, 01 Aug 2017 03:06:31 -0000
Content-Type: text/plain

Upgrade librsvg from 2.40.17 to 2.40.18.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-gnome/librsvg/{librsvg_2.40.17.bb => librsvg_2.40.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.17.bb => librsvg_2.40.18.bb} (91%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.17.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.18.bb
similarity index 91%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.17.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.18.bb
index 74777e9..21a0dc2 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.17.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.18.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-ev
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "d6fcedf86c5c271abb36da5acc7eb987"
-SRC_URI[archive.sha256sum] = "e6f6c5cbecc405bb945c7cd15061276035ae3173bbb3bb25e8a916779c7f69cc"
+SRC_URI[archive.md5sum] = "eaa5c8a8bbe2600ab5194c0d3b1b621b"
+SRC_URI[archive.sha256sum] = "bfc8c488c89c1e7212c478beb95c41b44701636125a3e6dab41187f1485b564c"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.7.4




