Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 991416CF8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 08:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 0E81119DCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q+ZGt4GjWYQW
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 8A0E319CF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6A05BA03
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 5F1509F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 5D96E3E06F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r9A8qBJM027886
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r9A8qBOq027885
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Oct 2013 10:52:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 10:52:06 +0200
Message-Id: <355273a51c66495b635703627d588940a9c9c7d4.1381395083.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1381395083.git.pkj@axis.com>
References: <cover.1381395083.git.pkj@axis.com>
In-Reply-To: <cover.1381395083.git.pkj@axis.com>
References: <cover.1381395083.git.pkj@axis.com>
Subject: [PATCH 1/1] kernel-yocto: Add a missing '['
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
X-List-Received-Date: Thu, 10 Oct 2013 08:52:15 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 97a5fa7..8f79932 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -298,7 +298,7 @@ do_validate_branches() {
 	set +e
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
 	# check and we can exit early
-	if [ "${SRCREV_machine}" = "AUTOINC" ] || "${SRCREV_machine}" = "INVALID" ] ||
+	if [ "${SRCREV_machine}" = "AUTOINC" ] || [ "${SRCREV_machine}" = "INVALID" ] ||
 	   [ "${SRCREV_machine}" = "" ]; then
 		return
 	fi
-- 
1.8.4


