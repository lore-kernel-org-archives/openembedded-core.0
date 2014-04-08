Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 352EB6F7D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 05:32:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s385W3BH027650
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Apr 2014 22:32:03 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 7 Apr 2014 22:32:02 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Apr 2014 13:32:00 +0800
Message-ID: <cover.1396935045.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] libx11: fix invalid preprocessing directive errors
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
X-List-Received-Date: Tue, 08 Apr 2014 05:32:04 -0000
Content-Type: text/plain

The following changes since commit bb66113bde5361b869dce2bdaece5b938f077ea8:

  bitbake: fetch2: Fix bug in file checksum generation (2014-04-06 11:31:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/libx11
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/libx11

Chong Lu (1):
  libx11: fix invalid preprocessing directive errors

 ...use-XCOMM-instead-of-for-comments-in-Comp.patch | 101 +++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb     |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch

-- 
1.8.1.2


