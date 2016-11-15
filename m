Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9CC6093E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 19:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B0CC811A010
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:10:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id fqOhBt3ko1bm
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:10:40 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 0976111A00E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:10:40 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E67A91E08A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:10:39 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB8911E089
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:10:39 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:10:39 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id CFC512C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:10:39 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id C22549C09F; Tue, 15 Nov 2016 20:10:39 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 20:10:39 +0100
Message-Id: <1479237039-20297-1-git-send-email-olofjn@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH] licenses.conf: Fix variable name in comments (FOSS_NO_COPYRIGHT)
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
X-List-Received-Date: Tue, 15 Nov 2016 19:10:40 -0000

A FOSSology related variable was renamed from FOSS_COPRYIGHT to
FOSS_NO_COPYRIGHT, but the comment block describing the variable
in licenses.conf was missed.

Besides fixing this, this change also removes a redundant comment
about where the variable is defined (it's right there! ;-)).

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/conf/licenses.conf | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 9917c40..d210a0e 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -133,11 +133,10 @@ DATA_LICENSE = "CC0-1.0"
 # You can set option to control if the copyright information will be skipped
 # during the identification process.
 #
-# It is defined as [FOSS_COPYRIGHT] in ./meta/conf/licenses.conf.
-# FOSS_COPYRIGHT = "true"
+# FOSS_NO_COPYRIGHT = "true"
 #   NO copyright will be processed. That means only license information will be
 #   identified and output to SPDX file
-# FOSS_COPYRIGHT = "false"
+# FOSS_NO_COPYRIGHT = "false"
 #   Copyright will be identified and output to SPDX file along with license
 #   information. The process will take more time than not processing copyright
 #   information.
-- 
2.1.4


