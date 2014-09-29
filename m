Return-Path: <noor_ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2C06017E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 13:15:28 +0000 (UTC)
Received: from em-wv03.wv.mentorg.com ([147.34.98.30]
	helo=em-wv-03.wv.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1XYanZ-00020q-EI from noor_ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Sep 2014 06:15:29 -0700
Received: from gemini.alm.mentorg.com ([134.86.102.153]) by
	em-wv-03.wv.mentorg.com (8.8.8/CF5.40R)
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id s8TDFNRY003585; 
	Mon, 29 Sep 2014 08:15:24 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Sep 2014 18:14:53 +0500
Message-Id: <1411996493-29494-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] babeltrace: Add missing bison/flex depensencies.
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
X-List-Received-Date: Mon, 29 Sep 2014 13:15:31 -0000

From: Noor <noor_ahsan@mentor.com>

* babeltrace do_configure failed due to missing flex/bison
  dependencies.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.2.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
index a8ea4cb..dd9961c 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 inherit autotools pkgconfig
 
-DEPENDS = "glib-2.0 util-linux popt"
+DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 SRCREV = "66c2a20b4391fb5c7f870aeb0dde854f0ae1fc79"
 PV = "1.2.1+git${SRCPV}"
-- 
1.7.9.5


