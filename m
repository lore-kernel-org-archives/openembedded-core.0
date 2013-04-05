Received: from anubis.se.axis.com ([195.60.68.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <peter.kjellerstedt@axis.com>) id 1UOAG7-0001rG-DW
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:17:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 2FB6E19E6B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PgZH00-3ULH1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by anubis.se.axis.com (Postfix) with ESMTP id ABC9719E25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A9E3B34A69
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r35GxmAV015942
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Apr 2013 18:59:48 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r35GxmYH015941
	for openembedded-core@lists.openembedded.org;
	Fri, 5 Apr 2013 18:59:48 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 18:59:44 +0200
Message-Id: <78acebef86ede91d5513876f9723fbc5e5849131.1365179842.git.pkj@axis.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1365179842.git.pkj@axis.com>
References: <cover.1365179842.git.pkj@axis.com>
In-Reply-To: <cover.1365179842.git.pkj@axis.com>
References: <cover.1365179842.git.pkj@axis.com>
Subject: [PATCH 1/3] oe-setup-builddir: Allow $OECORENOTESCONF to not exist
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
 scripts/oe-setup-builddir | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 76e1778..d5d8d98 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -118,5 +118,5 @@ EOM
 if [ "x" = "x$OECORENOTESCONF" ]; then
     OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
 fi
-cat $OECORENOTESCONF
+[ ! -r "$OECORENOTESCONF" ] || cat $OECORENOTESCONF
 unset OECORENOTESCONF
-- 
1.7.11.7



