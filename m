Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2C5C6EB1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 10:55:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1KAtCQE026655
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 02:55:12 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 20 Feb 2014 02:55:12 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2014 18:55:09 +0800
Message-ID: <cover.1392893636.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] insserv: enable ptest support
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
X-List-Received-Date: Thu, 20 Feb 2014 10:55:13 -0000
Content-Type: text/plain

The following changes since commit 54562006c1327c5b99daa4cc05a3ba7e38412da1:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:38:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/insserv
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/insserv

Chong Lu (1):
  insserv: enable ptest support

 meta/recipes-devtools/insserv/files/run-ptest   | 17 +++++++++++++++++
 meta/recipes-devtools/insserv/insserv_1.14.0.bb | 14 +++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/insserv/files/run-ptest

-- 
1.8.1.2


