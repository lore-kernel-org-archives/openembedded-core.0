Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E118C772A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:42:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD2gwsL026883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 18:42:58 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 18:42:57 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 10:32:46 +0800
Message-ID: <cover.1447379573.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Update classextend file to support multiple multilib item
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
X-List-Received-Date: Fri, 13 Nov 2015 02:43:00 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add following configure to local.conf, then failure appears.

===============================================
MACHINE = "qemux86-64" 

require conf/multilib.conf                                                                                   
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"
===============================================

Run:
$ bitbake lib64-meta-ide-support                                                                   [10:38:25]

Loading cache: 100% |#########################################################################| ETA:  00:00:00
Loaded 3126 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/lib32-lib64-libc'. Close matches:
  virtual/lib64-libc
  virtual/lib32-libc
  virtual/lib32-libgl
ERROR: Required build target 'lib64-meta-ide-support' has no buildable providers.
Missing or unbuildable dependency chain was: ['lib64-meta-ide-support', 'virtual/lib32-lib64-libc']


The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/multilib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/multilib

Kai Kang (1):
  classextend.py: update filter to support multiple multilib items

 meta/lib/oe/classextend.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

-- 
2.6.1


