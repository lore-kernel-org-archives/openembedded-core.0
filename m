Return-Path: <marcus.cooper@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36F9D7C391
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7C00918423
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:36 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id VwJMCw27lrFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id CA5D51842A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C101E075
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A3AC1E06E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from lnxmarcusc.se.axis.com (lnxmarcusc.se.axis.com [10.92.157.1])
	by seth.se.axis.com (Postfix) with ESMTP id 6CD201D5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: by lnxmarcusc.se.axis.com (Postfix, from userid 11391)
	id 517EB943E6; Mon, 28 Jan 2019 12:17:35 +0100 (CET)
From: Marcus Cooper <marcus.cooper@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 12:17:29 +0100
Message-Id: <20190128111732.16387-1-marcusc@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH v2 0/3] systemd: Fixes Security fix CVE-2018-16864 - CVE-2018-16866
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
X-List-Received-Date: Mon, 28 Jan 2019 11:17:37 -0000

Changed in v2:
 - Added CVE tag, Upstream-Status tag and Sign-off-by tags.
 - removed the verification of the entry length in the header
 - squashed CVE-2018-16865 patches into one
 - CVE-2018-16866 patch now taken from systemd-stable and includes
   an additional heap buffer overflow fix.

Marcus Cooper (3):
  systemd: Security fix CVE-2018-16864
  systemd: Security fix CVE-2018-16865
  systemd: Security fix CVE-2018-16866

 ...-not-store-the-iovec-entry-for-process-co.patch | 208 +++++++++++++++++++++
 ...rnald-set-a-limit-on-the-number-of-fields.patch | 139 ++++++++++++++
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |  49 +++++
 meta/recipes-core/systemd/systemd_239.bb           |   3 +
 4 files changed, 399 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch

-- 
2.11.0


