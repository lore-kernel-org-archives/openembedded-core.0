Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 189D278518
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 21:40:04 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1dLyyL-0001tK-Sm from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Jun 2017 14:40:05 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 16 Jun 2017 14:40:02 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jun 2017 16:39:51 -0500
Message-ID: <20170616213952.35679-3-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170616213952.35679-1-nathan_lynch@mentor.com>
References: <20170616213952.35679-1-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 2/3] lttng-tools: update to 2.9.5
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
X-List-Received-Date: Fri, 16 Jun 2017 21:40:04 -0000
Content-Type: text/plain

Miscellaneous fixes.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../lttng/{lttng-tools_2.9.4.bb => lttng-tools_2.9.5.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.9.4.bb => lttng-tools_2.9.5.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-tools_2.9.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
index fbf3ae985167..6e92c22bec2b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
@@ -31,8 +31,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "10f47abfa214b167580358388428770d"
-SRC_URI[sha256sum] = "3c72456bceef961fad1d0861f07478db16b7659efa69099ba36645da89ca2cc5"
+SRC_URI[md5sum] = "051224eb991aee07f8721ff1877d0b96"
+SRC_URI[sha256sum] = "77839eb6fc6c652125f08acfd9369701c2516eb05cc2084160e7efc7a3fb731c"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages
 
-- 
2.9.4


