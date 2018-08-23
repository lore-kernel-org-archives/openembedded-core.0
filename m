Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1580879533
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:00:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N80t6Z010229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:00:55 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:00:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:25 +0800
Message-ID: <501e6969ca33d68b1b6be46b0ca8becf8c3b420c.1535011774.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011774.git.liezhi.yang@windriver.com>
References: <cover.1535011774.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] elfutils: 0.172 -> 0.173
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
X-List-Received-Date: Thu, 23 Aug 2018 08:00:54 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../elfutils/{elfutils_0.172.bb => elfutils_0.173.bb}                | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.172.bb => elfutils_0.173.bb} (95%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.172.bb b/meta/recipes-devtools/elfutils/elfutils_0.173.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.172.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.173.bb
index 1cdff40..03144dc 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.172.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.173.bb
@@ -30,8 +30,9 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/0001-disable_werror.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
-SRC_URI[md5sum] = "01e87ab4c5a6a249c04e22a97a4221d3"
-SRC_URI[sha256sum] = "779c99e6344c4982bbab60b8d276cec3d468151c758905f9a44ba6b6edaa0e24"
+
+SRC_URI[md5sum] = "35decb1ebfb90d565e4c411bee4185cc"
+SRC_URI[sha256sum] = "b76d8c133f68dad46250f5c223482c8299d454a69430d9aa5c19123345a000ff"
 
 inherit autotools gettext
 
-- 
2.7.4


