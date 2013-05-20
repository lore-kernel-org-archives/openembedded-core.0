Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC7F6A2F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 23:07:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4KJUhfo003091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 12:30:43 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 20 May 2013 12:30:43 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 May 2013 12:30:41 -0700
Message-ID: <1369078242-4032-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: adjust hwclock ALTERNATIVE_PRIORITY
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
X-List-Received-Date: Mon, 20 May 2013 23:07:32 -0000
Content-Type: text/plain

I don't know if nslu2 even exists, but I think
we should not defeat using util-linux hwclock everywhere because
of it.  I don't know python, so maybe there is a not so ugly way
to compute the priority.

As to agetty -- it's an ALTERNATIVE_TARGET, so we might as well
include it in what we put on the target.

Joe Slater (1):
  util-linux: adjust hwclock ALTERNATIVE_PRIORITY

 meta/recipes-core/util-linux/util-linux.inc |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.7.3.4


