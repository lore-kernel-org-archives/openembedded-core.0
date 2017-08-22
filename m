Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01F3E78296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 06:35:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M6Z6dT000772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 23:35:06 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 21 Aug 2017 23:35:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Aug 2017 14:34:23 +0800
Message-ID: <cover.1503383077.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/2] systemd: fixes for debug-shell service
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
X-List-Received-Date: Tue, 22 Aug 2017 06:35:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This fixes the following error when selinux is enabled:

# systemd-analyze --man=false verify /lib/systemd/system/debug-shell.service
debug-shell.service: Command /sbin/sushell is not executable: No such file or directory

--
The following changes since commit 5c9ef0734d23909b5694ed43cdbb205c2ba9ca95:

  devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation. (2017-08-19 22:15:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_debug-shell_170822_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_debug-shell_170822_0

Jackie Huang (2):
  initscripts: split sushell into sub package
  systemd: add dependency on initscripts-sushell for selinux

 meta/recipes-core/initscripts/initscripts_1.0.bb | 5 +++--
 meta/recipes-core/systemd/systemd_234.bb         | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.9.1


