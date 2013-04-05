Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1UO1Kr-00079C-Ic
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 09:45:49 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0C2402232548
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 09:23:00 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6DBA12232544
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 09:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052225030.adsl.alicedsl.de
	[78.52.225.30]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 09:22:59 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 81C673C50F; Fri,  5 Apr 2013 09:22:58 +0200 (CEST)
From: "Henning Heinold" <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 09:22:58 +0200
Message-Id: <1365146578-14129-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1365146578-14129-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1365146578-14129-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] scripts/sstate-cache-management.sh: fix return value by adding exit 0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 07:45:54 -0000
X-List-Received-Date: Fri, 05 Apr 2013 07:45:54 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>

* usefull for jenkins jobs, which will otherwise fail
  because 1 was returned

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 scripts/sstate-cache-management.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 24384ef..e2baf17 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -422,4 +422,4 @@ done
 [ -n "$stamps" ] && rm_by_stamps
 [ -z "$rm_duplicated" -a -z "$stamps" ] && \
     echo "What do you want to do?"
-
+exit 0
-- 
1.7.10.4


