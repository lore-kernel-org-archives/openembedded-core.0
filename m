Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id B47806074F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 12:55:53 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w99Ctrxl003111
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 14:55:53 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.93])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w99CtrWs028994;
	Tue, 9 Oct 2018 14:55:53 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 9716B9550DC;
	Tue,  9 Oct 2018 14:55:52 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 14:55:28 +0200
Message-Id: <20181009125531.11405-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181004104147.14644-1-andrej.valek@siemens.com>
References: <20181004104147.14644-1-andrej.valek@siemens.com>
Subject: [PATCH v4 0/3] busybox: refactor
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
X-List-Received-Date: Tue, 09 Oct 2018 12:55:54 -0000

Changes:

[v2]
 - split into 3 commits
 - fix indent

[v3]
 - remove missed runlevel script

[v4]
 - sync changes with current master

Andrej Valek (3):
  busybox: fix conflict with runlevel applet
  busybox: do not write grep outputs into log
  busybox: unify recipe style

 meta/recipes-core/busybox/busybox.inc       | 114 ++++++++++++++--------------
 meta/recipes-core/busybox/busybox/init.cfg  |   1 +
 meta/recipes-core/busybox/busybox_1.29.2.bb |   1 -
 meta/recipes-core/busybox/files/runlevel    |  11 ---
 4 files changed, 57 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/files/runlevel

-- 
2.11.0


