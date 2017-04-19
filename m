Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8CB71A54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 07:06:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3J76AuM004018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Apr 2017 00:06:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 19 Apr 2017 00:06:10 -0700
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Wed, 19 Apr 2017 15:03:56 +0800
Message-ID: <cover.1492583858.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1][V2] libsdl2: backport patch to fix build failures on powerpc
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
X-List-Received-Date: Wed, 19 Apr 2017 07:06:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

I didn't find out this patch, so add a gcc option in V1. Thanks for Ross's help.

The following changes since commit def638ebd69cef217ca567352bc08920b79ca03d:

  poky.ent: Removed "python3-expect" package from 3 distros. (2017-04-18 15:51:44 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/libsdl2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/libsdl2

Kai Kang (1):
  libsdl2: fix build failures on powerpc

 .../libsdl2/libsdl2/fix-build-failure-on-ppc.patch | 50 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch

-- 
2.10.1


