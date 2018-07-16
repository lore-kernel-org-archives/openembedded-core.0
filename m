Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC767504B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 15:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CAF0C18153
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UpXeE30H1HK3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:06 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9439D1843D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 577451A082
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B4E21A080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:06 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:06 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 3EDCF386;
	Mon, 16 Jul 2018 17:06:06 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 3568A9C0AD; Mon, 16 Jul 2018 17:06:06 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:05:53 +0200
Message-Id: <20180716150556.16415-2-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180716150556.16415-1-olofjn@axis.com>
References: <20180716150556.16415-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 1/4] spdx.bbclass: Replace deprecated string.replace with str.replace
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
X-List-Received-Date: Mon, 16 Jul 2018 15:06:10 -0000

The string.replace function is removed in python3. Instead, the str
method "replace" should be used instead.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index c5f544d2a4f..ab2eaa5c0c1 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -226,7 +226,7 @@ def run_fossology(foss_command, full_spdx):
     except subprocess.CalledProcessError as e:
         return None
 
-    foss_output = string.replace(foss_output, '\r', '')
+    foss_output = foss_output.replace('\r', '')
 
     # Package info
     package_info = {}
-- 
2.11.0


