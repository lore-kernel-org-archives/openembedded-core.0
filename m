Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1C9F61957
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 05:20:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA25KxeY007139
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 22:20:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 1 Nov 2013 22:20:57 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Nov 2013 13:21:58 +0800
Message-ID: <cover.1383369426.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] sysvinit: adjust the boot sequence and fix missing of boot log
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
X-List-Received-Date: Sat, 02 Nov 2013 05:21:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit f3541226b8b1187e79dec0f6f9f3c58cedf9ac9b:

  bitbake: hob: do not display the "Package list may be incomplete!" dialog (2013-11-01 17:59:31 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/sysvinit-bootlogd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/sysvinit-bootlogd

Chen Qi (2):
  bootlogd: create log file if not present
  sysvinit: adjust boot sequence and remove hack from udev

 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init  |    4 ++--
 meta/recipes-core/udev/udev.inc                    |    2 +-
 meta/recipes-core/udev/udev/init                   |    4 +++-
 .../modutils-initscripts/modutils-initscripts.bb   |    2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)

-- 
1.7.9.5


