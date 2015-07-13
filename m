Return-Path: <umut.tezduyar@axis.com>
X-Greylist: delayed 565 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Jul 2015 07:37:42 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB2E865C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2E015180D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:28:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OvwYvmLgGP6Y
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:28:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id AC35518058
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:28:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 94859F02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:28:13 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 88319D8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:28:13 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 85BE434005
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:28:13 +0200 (CEST)
Received: from lnxumuttl.se.axis.com (10.92.7.1) by smtp-x.axis.com
	(10.0.5.74) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 13 Jul 2015 09:28:13 +0200
From: Umut Tezduyar Lindskog <umut.tezduyar@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 09:28:04 +0200
Message-ID: <1436772484-5662-1-git-send-email-umut.tezduyar@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: Umut Tezduyar Lindskog <umuttl@axis.com>
Subject: [PATCH] systemd: update the status of configurable root patch
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
X-List-Received-Date: Mon, 13 Jul 2015 07:37:43 -0000
Content-Type: text/plain

---
 .../systemd/0010-Make-root-s-home-directory-configurable.patch       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
index b65fe42..76a9481 100644
--- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
@@ -7,7 +7,10 @@ OpenEmbedded has a configurable home directory for root. Allow
 systemd to be built using its idea of what root's home directory
 should be.
 
-Upstream-Status: Pending
+Upstream-Status: Denied
+Upstream wants to have a unified hierarchy where everyone is
+using the same root folder.
+https://github.com/systemd/systemd/issues/541
 
 Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-- 
2.1.4


