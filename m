Return-Path: <peter.marko@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id C2E846FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 06:05:16 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v5765C5K013877
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jun 2017 08:05:12 +0200
Received: from dev.sbt.siemens.com ([163.242.44.98])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v5765CF0020506;
	Wed, 7 Jun 2017 08:05:12 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 1706F1CB951;
	Wed,  7 Jun 2017 08:05:12 +0200 (CEST)
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 08:04:27 +0200
Message-Id: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
References: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
Subject: [PATCH v2 0/4] cve-check improvements
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
X-List-Received-Date: Wed, 07 Jun 2017 06:05:18 -0000

Hi,

this series of patches fixes some issues with cve-check functionality.

v2: drop patch for RM_OLD_IMAGE handling

Peter Marko (4):
  cve-check: add do_rootfs dependency on cve-check
  cve-check: do not parse error output
  cve-check: clean cve-check recipe result before re-building
  cve-check-tool: fix crash on exceptions

 meta/classes/cve-check.bbclass                     |  8 +++-
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  1 +
 ...01-Fix-freeing-memory-allocated-by-sqlite.patch | 50 ++++++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch

-- 
2.1.4


