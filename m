Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F28616D147
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 17:26:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0LHQrNh016934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Jan 2019 09:26:53 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 21 Jan 2019 09:26:53 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 21 Jan 2019 12:26:49 -0500
Message-ID: <cover.1548091536.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 21 Jan 2019 17:26:55 -0000
Content-Type: text/plain

Hi all,

Here is the latest set of changes to linux-yocto. There are some other changes
pending, but I wanted to get this smaller set out now, so RP can run some tests
against the qemuarm refresh.

Cheers,

Bruce

The following changes since commit 676705765ad58db79c23fddd6a53f5907a5812bd:

  ref-manual: Update to SDK_VERSION variable. (2019-01-21 16:11:43 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/4.18: update to v4.18.25
  linux-yocto/4.19: fix qemuarm KBRANCH specification
  linux-yocto/4.19: integrate qemuarm refresh changes

 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |  2 +-
 6 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.5.0


