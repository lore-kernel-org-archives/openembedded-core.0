Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A44A60191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 11:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0577A181C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:35:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id c6At-6U7Hou7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:35:28 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 61DA1181B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:35:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F73C1A095
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:35:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 448971A091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:35:28 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:35:28 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 38451331
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:35:28 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 19 Oct 2016 13:35:28 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2016 13:34:28 +0200
Message-ID: <1476876868-4819-1-git-send-email-tobias.hagelborn@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH] buildhistory-collect-srcrevs: Fix multiple SRCREV definitions
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
X-List-Received-Date: Wed, 19 Oct 2016 11:35:29 -0000
Content-Type: text/plain

From: Tobias Hagelborn <tobiasha@axis.com>

Fixed copy & paste error causing error when extracting SRCREV
for packages containing multiple SRCREV definitons.

Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---
 scripts/buildhistory-collect-srcrevs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index 8a03580..d375b04 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -101,7 +101,7 @@ def main():
                 for name, value in srcrevs.items():
                     orig = orig_srcrevs.get(name, orig_srcrev)
                     if options.reportall or value != orig:
-                        all_srcrevs[curdir].append((pn, name, srcrev))
+                        all_srcrevs[curdir].append((pn, name, value))
 
     for curdir, srcrevs in sorted(all_srcrevs.items()):
         if srcrevs:
-- 
2.1.4


