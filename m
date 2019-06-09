Return-Path: <adrian.freihofer@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 610016011C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 12:04:06 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x59C47oa021681
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Jun 2019 14:04:07 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.33.94])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x59C44Aj018566;
	Sun, 9 Jun 2019 14:04:05 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 9135E2325006;
	Sun,  9 Jun 2019 14:04:04 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 14:03:39 +0200
Message-Id: <20190609120342.5475-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH v4 0/3] runqemu: support non-bootable wic images
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
X-List-Received-Date: Sun, 09 Jun 2019 12:04:07 -0000

Compared to V3 this is a new implementation, as suggested by Richard.
Thanks for the hint, it makes perfect sense.

Adrian Freihofer (3):
  qemurunner: fix undefined variable
  testimage: consider QB_DEFAULT_FSTYPE
  runqemu: QB_FSINFO to support fstype wic images

 meta/classes/testimage.bbclass    |  6 ++++-
 meta/lib/oeqa/utils/qemurunner.py |  1 +
 scripts/runqemu                   | 49 +++++++++++++++++++++++++++++++++++----
 3 files changed, 50 insertions(+), 6 deletions(-)

-- 
2.11.0


