Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBAA60BC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 01:43:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86435154"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 09:43:07 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id F080950A996F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 09:33:00 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 09:42:55 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 09:43:04 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Mar 2020 00:16:49 -0700
Message-ID: <1584429410-1890-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584429410-1890-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584429410-1890-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: F080950A996F.A29DA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gtk+3: upgrade 3.24.13 -> 3.24.14
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
X-List-Received-Date: Tue, 17 Mar 2020 01:43:07 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-gnome/gtk+/{gtk+3_3.24.13.bb => gtk+3_3.24.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.13.bb => gtk+3_3.24.14.bb} (85%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.14.bb
similarity index 85%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.14.bb
index 025d8870e2..ab1f87c22e 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.14.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://link_fribidi.patch \
            file://sort-resources.patch \
           "
-SRC_URI[md5sum] = "f65515e7bfa2199bd2188e871d69c686"
-SRC_URI[sha256sum] = "4c775c38cf1e3c534ef0ca52ca6c7a890fe169981af66141c713e054e68930a9"
+SRC_URI[md5sum] = "62e39212fa0a84016a3392a9d291faf8"
+SRC_URI[sha256sum] = "1c4d69f93ab884fd80c6b95115bfbc12d51ecd029178b6dad3672fdc5ff91e88"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.17.1




