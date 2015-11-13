Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30FF877288
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:34:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD9YHuY028508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:34:17 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 01:34:16 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 17:24:04 +0800
Message-ID: <cover.1447406020.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Don't expand vars which starts with multilib prefix already
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
X-List-Received-Date: Fri, 13 Nov 2015 09:34:21 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Test steps:
1 set MACHINE and multilibs in local.conf

===============================================
MACHINE = "qemux86-64" 

require conf/multilib.conf                                                                                   
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"
===============================================

2 bitbake lib64-meta-ide-support core-image-sato

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/multilib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/multilib

Kai Kang (1):
  toolchain-scripts.bbclass: do not expand vars which starts with
    multilib prefixes

 meta/classes/toolchain-scripts.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.6.1


