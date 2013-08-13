Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 761B860664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 06:11:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7D6Bs1R024692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 23:11:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 12 Aug 2013 23:11:53 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2013 14:11:48 +0800
Message-ID: <cover.1376363071.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 0/3] makedevs: support using user/group names
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
X-List-Received-Date: Tue, 13 Aug 2013 06:11:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit f63e7f4323368c0d6fe7a1d44393a7e15652d4f2:

  subversion: Add patch to use neon 0.30 (2013-08-07 07:43:47 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/makedevs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/makedevs

Chen Qi (3):
  makedevs: support using user/group names in device table files
  image.bbclass: create device table after package installation
  device_table-minimal.txt: use user/group names instead of uid/gid

 meta/classes/image.bbclass                         |    8 +-
 meta/files/device_table-minimal.txt                |   42 ++--
 .../makedevs/makedevs-1.0.0/makedevs.c             |  207 +++++++++++++++++---
 3 files changed, 202 insertions(+), 55 deletions(-)

-- 
1.7.9.5


