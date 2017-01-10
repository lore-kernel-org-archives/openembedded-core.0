Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AA580719B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 23:07:28 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1cR5Vp-0002x8-I9 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2017 15:07:29 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 10 Jan 2017 15:07:27 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 17:07:00 -0600
Message-ID: <1484089620-19725-6-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
References: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 5/5] babeltrace: upgrade to 1.5.1
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
X-List-Received-Date: Tue, 10 Jan 2017 23:07:28 -0000
Content-Type: text/plain

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../lttng/{babeltrace_1.5.0.bb => babeltrace_1.5.1.bb}               | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.0.bb => babeltrace_1.5.1.bb} (81%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.0.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.1.bb
similarity index 81%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.0.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.1.bb
index 695b61f9c4a2..c22b3a01b4ac 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.0.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.1.bb
@@ -15,6 +15,5 @@ SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "43696383e44d1b85173db7cbd0335f06"
-SRC_URI[sha256sum] = "354e75d74562f5228ab89e5fa16a3b4dffa95e7230c5086b74ffcf11fef60353"
-
+SRC_URI[md5sum] = "3f7d29ba2821a966d24759a928a15cdf"
+SRC_URI[sha256sum] = "379e96f1cf867f0a198cf1c315c52ec7d7ad67898402bbe22d1404fc38d19d98"
-- 
2.7.4


