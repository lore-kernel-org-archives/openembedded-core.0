Return-Path: <sergeimir@emcraft.com>
X-Greylist: delayed 3141 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jul 2016 09:18:55 UTC
Received: from ocean.emcraft.com (ocean.emcraft.com [185.75.190.205])
	by mail.openembedded.org (Postfix) with ESMTP id 80B2460119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 09:18:55 +0000 (UTC)
Received: from sergmir.emcraft.com ([172.17.0.19] helo=sergmir.localdomain)
	by ocean.emcraft.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.76)
	(envelope-from <sergeimir@emcraft.com>)
	id 1bJzD6-00033l-Ja; Mon, 04 Jul 2016 11:26:32 +0300
From: Sergei Miroshnichenko <sergeimir@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 11:25:47 +0300
Message-Id: <1467620748-20129-1-git-send-email-sergeimir@emcraft.com>
X-Mailer: git-send-email 2.1.0
Cc: WolfgangDenkwd@denx.de, Alexander Dyachenko <sasha_d@emcraft.com>,
	Roger Meier <r.meier@siemens.com>,
	Sergei Miroshnichenko <sergeimir@emcraft.com>
Subject: [PATCH v2 0/1] license: Add support for SPDX 2.0 operators
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
X-List-Received-Date: Mon, 04 Jul 2016 09:18:59 -0000

Composite SPDX license expressions can be constructed using "OR",
"AND" and "WITH" operators: map them to "|" and "&" operators
accordingly.

Recognize long form license identifiers: "[DocumentRef-XXX:][LicenseRef-]YYY".

Tested on the following expressions:
LICENSE = "Artistic-1.0"
LICENSE = "LicenseRef-Artistic-1.0 AND NASA-1.3"
LICENSE = "(LicenseRef-Artistic-1.0 WITH GPL-3.0-with-GCC-exception)
           OR (DocumentRef-spdx-tool-1.2:LicenseRef-NASA-1.3 AND GPL-2.0+)"

Reference:
https://spdx.org/sites/spdx/files/SPDX-2.0.pdf Appendix IV: SPDX License Expression

Sergei Miroshnichenko (1):
  license: Add support for SPDX 2.0 operators

 meta/classes/license.bbclass | 17 ++++++++++-------
 meta/lib/oe/license.py       | 21 ++++++++++++++++-----
 2 files changed, 26 insertions(+), 12 deletions(-)

-- 
2.1.0


