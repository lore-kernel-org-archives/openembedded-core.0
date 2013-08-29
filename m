Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0C56BCC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 02:36:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7T2aJKr011408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 19:36:19 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 28 Aug 2013 19:36:19 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2013 10:36:16 +0800
Message-ID: <cover.1377674089.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] syslinux.bbclass: pull files from correct places for multilib
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
X-List-Received-Date: Thu, 29 Aug 2013 02:36:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

fix the failure when building lib32 hdd/iso image:
| install: cannot stat `/buildarea/jhuang0/yp/y_x64_0705/tmp/sysroots/lib32-qemux86-64/usr/share/syslinux/ldlinux.sys': No such file or directory

tested info:
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
IMAGE_FSTYPES += "live"

$ bitbake lib32-core-image-minimal
$ bitbake core-image-minimal

--
The following changes since commit 2ac7783e04f5e8e6005f967e1a6dd65d2fc6a19a:

  lib/oeqa/runtime: smart: add checks for smart output (2013-08-26 16:28:55 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_bootimg_0828_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_bootimg_0828_0

Jackie Huang (1):
  syslinux.bbclass: pull files from correct places for multilib

 meta/classes/syslinux.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.4.1


