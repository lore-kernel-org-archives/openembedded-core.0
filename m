Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7446AC79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9B99A2E40B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id yObGEZzsgAYi
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 36BD42E42F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 1FD52DF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 136411464
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 119A934005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHd8OU029929
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHd8xn029928
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:39:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:39:03 +0200
Message-Id: <4632023d2edf70d5a0b12e11acbc70346a6871a1.1407951483.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1407951483.git.pkj@axis.com>
References: <cover.1407951483.git.pkj@axis.com>
In-Reply-To: <cover.1407951483.git.pkj@axis.com>
References: <cover.1407951483.git.pkj@axis.com>
Subject: [PATCH 2/3] libsoup-2.4: Inherit gettext
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
X-List-Received-Date: Wed, 13 Aug 2014 17:47:13 -0000

Build fails otherwise if USE_NLS is set to "no".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb
index f062b2e..81da911 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "fa3d5574c1a2df521242e2ca624a2b3057121798cab9f8f40525aa186a
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools gettext pkgconfig
 
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
-- 
1.9.0


