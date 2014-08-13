Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08EFC617B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F2A2C1805A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id iKIJqz68Anio
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id C278C18079
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A604A1467
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 9ACF01464
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 98C353E049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHkQpb003074
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHkQN6003073
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:46:26 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:46:22 +0200
Message-Id: <92f2c324eb564aa6b3b9c130c9d248a05bc98de0.1407951828.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1407951828.git.pkj@axis.com>
References: <cover.1407951828.git.pkj@axis.com>
In-Reply-To: <cover.1407951828.git.pkj@axis.com>
References: <cover.1407951828.git.pkj@axis.com>
Subject: [PATCH 1/1] libgcrypt: Do not remove m4 files so aggressively
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
X-List-Received-Date: Wed, 13 Aug 2014 17:46:35 -0000

Removing all m4 files in the m4 directory led to a number of non-fatal
errors while running configure when the expected m4 macros could not
be found.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index fa2bc38..43e0291 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -23,8 +23,8 @@ inherit autotools-brokensep texinfo binconfig-disabled pkgconfig
 EXTRA_OECONF = "--disable-asm --with-capabilities"
 
 do_configure_prepend () {
-	# Else these could be used in prefernce to those in aclocal-copy
-	rm -f ${S}/m4/*.m4
+	# Else this could be used in preference to the one in aclocal-copy
+	rm -f ${S}/m4/gpg-error.m4
 }
 
 # libgcrypt.pc is added locally and thus installed here
-- 
1.9.0


