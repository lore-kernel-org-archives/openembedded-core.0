Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id D0C8A732A5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 23:46:48 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 211FC8B; Tue, 10 Feb 2015 00:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id D32827E;
	Tue, 10 Feb 2015 00:46:46 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Tue, 10 Feb 2015 00:46:40 +0100
Message-Id: <1423525604-18344-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] More wic cleanup and features
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
X-List-Received-Date: Mon, 09 Feb 2015 23:46:53 -0000

Hi,

This series depends on my 5 previous patches:

[PATCH v2] wic: allow creation of partitions not in table
[PATCH 1/4] wic: add rawcopy source plugin
[PATCH 2/4] wic: allow to configure extra space per partition
[PATCH 3/4] wic: allow to configure overhead factor per partition
[PATCH 4/4] wic: remove useless calls to __write_fstab

Alexandre Belloni (4):
  wic: fix empty btrfs partitions
  wic: remove useless calls to __write_fstab
  wic: properly label filesystems
  wic: add GPT support

 scripts/lib/wic/imager/direct.py                   |  8 ++--
 .../lib/wic/kickstart/custom_commands/partition.py | 45 ++++++++++++++++------
 scripts/lib/wic/utils/partitionedfs.py             |  9 ++++-
 3 files changed, 45 insertions(+), 17 deletions(-)

-- 
2.1.0


