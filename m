Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 475E7745AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:29:06 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w8QDT78s012560
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 15:29:07 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.201])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w8QDT7Ra028378;
	Wed, 26 Sep 2018 15:29:07 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 6835598F568;
	Wed, 26 Sep 2018 15:29:05 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 15:28:47 +0200
Message-Id: <20180926132848.6632-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <7f369514-092a-6a76-0262-ac9a84309b10@siemens.com>
References: <7f369514-092a-6a76-0262-ac9a84309b10@siemens.com>
Subject: [PATCH 0/1] kernel-devsrc: fix searching for non-existing
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
X-List-Received-Date: Wed, 26 Sep 2018 13:29:07 -0000

I have tested your proposal fix and it works.
I have removed the _setscene, because _sysroot is enough.
To make recipe consistent, I have also changed the rest of [noexec]s.

Andrej Valek (1):
  kernel-devsrc: fix searching for non-existing manifest files

 meta/recipes-kernel/linux/kernel-devsrc.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.11.0


