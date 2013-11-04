Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA0A6CEF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 07:14:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA47E1rO019972
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 23:14:01 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 23:14:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2013 15:13:52 +0800
Message-ID: <cover.1383549031.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/4] fix WARNING: QA Issue on kmod/udev/nfs-utils (unsafe references [/ references to /usr/lib])
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
X-List-Received-Date: Mon, 04 Nov 2013 07:14:03 -0000
Content-Type: text/plain

The following changes since commit f3541226b8b1187e79dec0f6f9f3c58cedf9ac9b:

  bitbake: hob: do not display the "Package list may be incomplete!" dialog (2013-11-01 17:59:31 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-qa-issue
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-qa-issue

Hongxu Jia (4):
  insane.bbclass: support to skip  unsafe references in binaries qa
    check.
  kmod: fix QA issue
  udev: fix  QA issue
  nfs-utils: fix QA issue

 meta/classes/insane.bbclass                            | 4 ++++
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb | 2 ++
 meta/recipes-core/udev/udev.inc                        | 3 +--
 meta/recipes-kernel/kmod/kmod_git.bb                   | 1 +
 4 files changed, 8 insertions(+), 2 deletions(-)

-- 
1.8.1.2


