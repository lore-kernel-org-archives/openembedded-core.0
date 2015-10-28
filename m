Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA33060232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 06:41:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9S6fHxi008236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 23:41:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 23:41:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 14:41:15 +0800
Message-ID: <cover.1446013329.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] rsync:Use usleep() for msleep() if it is available
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
X-List-Received-Date: Wed, 28 Oct 2015 06:41:18 -0000
Content-Type: text/plain

The following changes since commit f787b688f2884ce3fa888b4041030538c7d2bf55:

  oeqa/utils/decorators: fix missing keyword arguments on decorators (2015-10-27 07:22:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/rsync-usleep
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/rsync-usleep

Chen Qi (1):
  rsync:Use usleep() for msleep() if it is available

 ...rsync-use-usleep-for-msleep-when-possible.patch | 55 ++++++++++++++++++++++
 meta/recipes-devtools/rsync/rsync.inc              |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-use-usleep-for-msleep-when-possible.patch

-- 
1.9.1


