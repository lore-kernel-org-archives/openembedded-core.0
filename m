Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0AF71BB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 08:51:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7A8ox4a011097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Aug 2018 01:50:59 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 10 Aug 2018 01:50:59 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 10 Aug 2018 16:14:25 +0800
Message-ID: <cover.1533888808.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Fri, 10 Aug 2018 08:51:00 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


The following changes since commit da24071e92071ecbefe51314d82bf40f85172485:

  bitbake: toaster/orm/management/commands/lsupdates.py: Use new layerindexlib module (2018-08-02 10:18:27 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/disable-allarch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/disable-allarch

Kai Kang (1):
  allarch: disable allarch when multilib is used

 meta/classes/allarch.bbclass         | 4 ++++
 meta/classes/icecc.bbclass           | 2 +-
 meta/classes/multilib.bbclass        | 3 ++-
 meta/classes/multilib_global.bbclass | 4 +---
 meta/classes/package.bbclass         | 9 ++++++---
 meta/classes/staging.bbclass         | 2 +-
 6 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.18.0


