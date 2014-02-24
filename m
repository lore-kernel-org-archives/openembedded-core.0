Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 06A2C6F335
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:11:46 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 798CFF811F6; Mon, 24 Feb 2014 10:11:47 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C43EDF811F6;
	Mon, 24 Feb 2014 10:11:44 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 10:11:49 -0700
Message-Id: <1393261909-14802-4-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
References: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 3/3 v2] .templateconf: New file for customized template defaults
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
X-List-Received-Date: Mon, 24 Feb 2014 17:11:51 -0000

This file will allow easy customization of the build tools,
in particular the default setting of TEMPLATECONF, which
should reduce the need to fiddle with scripts in the future.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .templateconf |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .templateconf

diff --git a/.templateconf b/.templateconf
new file mode 100644
index 0000000..0bf5ecf
--- /dev/null
+++ b/.templateconf
@@ -0,0 +1,2 @@
+# Template settings
+TEMPLATECONF=${TEMPLATECONF:-meta/conf}
-- 
1.7.9.5


