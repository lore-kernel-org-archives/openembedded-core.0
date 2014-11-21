Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0B76FC68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 08:01:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL8124T006352
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 21 Nov 2014 00:01:02 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 00:01:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 21 Nov 2014 16:00:54 +0800
Message-ID: <cover.1416556713.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] package_manager.py: check the result of create_index
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
X-List-Received-Date: Fri, 21 Nov 2014 08:01:11 -0000
Content-Type: text/plain

The following changes since commit c09e56168ea5a9e4ff3e7f38d7da79e5d883021b:

  bitbake: bitbake-worker: exit normally when SIGHUP (2014-11-20 14:15:32 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-package_manager
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-package_manager

Hongxu Jia (1):
  package_manager.py: check the result of create_index

 meta/lib/oe/package_manager.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
1.9.1


