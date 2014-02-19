Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC60E6E904
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 03:18:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1J3IELc003291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 19:18:15 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 19:18:14 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Feb 2014 11:18:11 +0800
Message-ID: <cover.1392779759.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] libpcre: enable ptest support
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
X-List-Received-Date: Wed, 19 Feb 2014 03:18:15 -0000
Content-Type: text/plain

The following changes since commit 54562006c1327c5b99daa4cc05a3ba7e38412da1:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:38:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/libpcre
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/libpcre

Chong Lu (1):
  libpcre: enable ptest support

 meta/recipes-support/libpcre/libpcre/Makefile  | 183 +++++++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre/run-ptest |   3 +
 meta/recipes-support/libpcre/libpcre_8.34.bb   |  19 ++-
 3 files changed, 203 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre/Makefile
 create mode 100644 meta/recipes-support/libpcre/libpcre/run-ptest

-- 
1.8.1.2


