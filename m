Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3C5744D2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 09:00:56 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w9390upW000799
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Oct 2018 11:00:56 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.201])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w9390t9U024079;
	Wed, 3 Oct 2018 11:00:55 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 97851997B1D;
	Wed,  3 Oct 2018 11:00:55 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 11:00:35 +0200
Message-Id: <20181003090036.508-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/1] feat(dbg-packages): possibility to add packages to debug rootfs
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
X-List-Received-Date: Wed, 03 Oct 2018 09:00:56 -0000

This is my solution for http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156340.html .
Please let me know if this is going in the right direction.

Andrej Valek (1):
  feat(dbg-packages): possibility to add packages to debug rootfs

 meta/classes/image.bbclass             | 4 +++-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/lib/oe/package_manager.py         | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.11.0


