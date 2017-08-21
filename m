Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 682A278323
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:00:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L80hPx008146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 01:00:43 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 01:00:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 01:00:38 -0700
Message-ID: <b89bb0943627957c110d08ff170188d045830cb2.1503302375.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503302375.git.liezhi.yang@windriver.com>
References: <cover.1503302375.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] libbsd: 0.8.5 -> 0.8.6
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
X-List-Received-Date: Mon, 21 Aug 2017 08:00:43 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libbsd/{libbsd_0.8.5.bb => libbsd_0.8.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.8.5.bb => libbsd_0.8.6.bb} (92%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.8.5.bb b/meta/recipes-support/libbsd/libbsd_0.8.6.bb
similarity index 92%
rename from meta/recipes-support/libbsd/libbsd_0.8.5.bb
rename to meta/recipes-support/libbsd/libbsd_0.8.6.bb
index 6a6b669..182543f 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.5.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.6.bb
@@ -42,8 +42,8 @@ SRC_URI_append_libc-musl  = " \
     file://0002-Remove-funopen.patch \
 "
 
-SRC_URI[md5sum] = "f1a0dc285f5d21ea40ef5bfc9b647346"
-SRC_URI[sha256sum] = "7647d024f41389305272c263da933a6f2a978213c1801592f47e68d83ac05b28"
+SRC_URI[md5sum] = "4ab7bec639af17d0aacb50222b479110"
+SRC_URI[sha256sum] = "467fbf9df1f49af11f7f686691057c8c0a7613ae5a870577bef9155de39f9687"
 
 inherit autotools pkgconfig
 
-- 
2.10.2


