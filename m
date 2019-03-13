Return-Path: <lars.persson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE8F17C611
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 13:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6F96518544
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:09:05 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id a_an3uNre190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:09:04 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id DAE141853B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:09:04 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C94561E0D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:09:04 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD5411E0C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:09:04 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:09:04 +0100 (CET)
Received: from pc32929-1845.se.axis.com (pc32929-1845.se.axis.com
	[10.88.129.17])
	by thoth.se.axis.com (Postfix) with ESMTP id B158D1E1;
	Wed, 13 Mar 2019 14:09:04 +0100 (CET)
Received: by pc32929-1845.se.axis.com (Postfix, from userid 20456)
	id ABAB4409C8; Wed, 13 Mar 2019 14:09:04 +0100 (CET)
From: Lars Persson <lars.persson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 14:08:58 +0100
Message-Id: <20190313130858.27586-1-larper@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Lars Persson <larper@axis.com>
Subject: [PATCH] iproute2: add tc to the alternatives list
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
X-List-Received-Date: Wed, 13 Mar 2019 13:09:05 -0000

The tc command is provided both by busybox and iproute2.

Signed-off-by: Lars Persson <larper@axis.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index b283589063..1aa1eec0de 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -52,3 +52,7 @@ ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
 ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
 ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-tc = "tc"
+ALTERNATIVE_LINK_NAME[tc] = "${base_sbindir}/tc"
+ALTERNATIVE_PRIORITY_${PN}-tc = "100"
-- 
2.11.0


