Received: from ra.se.axis.com ([195.60.68.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <peter.kjellerstedt@axis.com>) id 1UOAG7-0001rH-Ej
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:17:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id D29E4261362
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9DZ33VP4vWSW
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by ra.se.axis.com (Postfix) with ESMTP id C1CA5261350
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C00483EB51
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r35Gxmi1015950
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Apr 2013 18:59:48 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r35GxmkQ015949
	for openembedded-core@lists.openembedded.org;
	Fri, 5 Apr 2013 18:59:48 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 18:59:46 +0200
Message-Id: <572541c9fc531bb219696c36f64052af21ea4b1f.1365179842.git.pkj@axis.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1365179842.git.pkj@axis.com>
References: <cover.1365179842.git.pkj@axis.com>
In-Reply-To: <cover.1365179842.git.pkj@axis.com>
References: <cover.1365179842.git.pkj@axis.com>
Subject: [PATCH 3/3] oe-init-build-env: Make it use the correct $OEROOT with zsh
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
X-List-Received-Date: Fri, 05 Apr 2013 17:17:03 -0000

Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
---
 oe-init-build-env | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/oe-init-build-env b/oe-init-build-env
index 67eddcd..68af7b5 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -30,6 +30,8 @@ if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./oe-init-build-env" ]; then
 else
    if [ -n "$BASH_SOURCE" ]; then
       OEROOT="`dirname $BASH_SOURCE`"
+   elif [ -n "$ZSH_NAME" ]; then
+      OEROOT="`dirname $0`"
    else
       OEROOT="`pwd`"
    fi
-- 
1.7.11.7



