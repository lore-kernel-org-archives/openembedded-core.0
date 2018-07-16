Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A41797550F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 15:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id BC84C18409
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id pygObwVqlOvk
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:05 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4E62518346
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C6501E07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 112B71E07E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:05 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:05 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 051AAFB6;
	Mon, 16 Jul 2018 17:06:05 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 981209C0AD; Mon, 16 Jul 2018 17:06:04 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:05:52 +0200
Message-Id: <20180716150556.16415-1-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 0/4] Small spdx.bbclass fixes
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
X-List-Received-Date: Mon, 16 Jul 2018 15:06:05 -0000

This patch series contain small adaptions, primarily for the spdx bbclasss to
work with Python3. But with that said, I was unable to get it working when it
came to interfacing with Fossology.

Olof Johansson (4):
  spdx.bbclass: Replace deprecated string.replace with str.replace
  spdx.bbclass: Fix undefined variable error
  spdx.bbclass: Make use of bb.utils' sha1_file()
  spdx.bbclass: Encode strings before passing to hashlib

 meta/classes/spdx.bbclass | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.11.0


