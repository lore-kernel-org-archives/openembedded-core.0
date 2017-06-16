Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A855578477
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 21:39:58 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1dLyyG-0001pi-4B from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Jun 2017 14:40:00 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 16 Jun 2017 14:39:57 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jun 2017 16:39:50 -0500
Message-ID: <20170616213952.35679-2-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170616213952.35679-1-nathan_lynch@mentor.com>
References: <20170616213952.35679-1-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 1/3] lttng-ust: update to 2.9.1
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
X-List-Received-Date: Fri, 16 Jun 2017 21:39:58 -0000
Content-Type: text/plain

Miscellaneous fixes.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 meta/recipes-kernel/lttng/{lttng-ust_2.9.0.bb => lttng-ust_2.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.9.0.bb => lttng-ust_2.9.1.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.9.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-ust_2.9.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
index 9cdefddf16bd..f7e01bb403af 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.9.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
@@ -23,8 +23,8 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
           "
-SRC_URI[md5sum] = "77f3378ba37a36801420bce87b702e9c"
-SRC_URI[sha256sum] = "4d541a863f42dfc685ca05024027a442c70d03594c154a43e62bc109b1ea5daf"
+SRC_URI[md5sum] = "5a5636fc3d9aa370f65b25a802a79e6e"
+SRC_URI[sha256sum] = "b891d267cdbbbd11cf34751f66c21c4a7fdc0eec3c1b53be2c40dca073b7daa4"
 
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 
-- 
2.9.4


