Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RQzyF-0005Vi-UY
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 12:17:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAHBB644024901
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 03:11:06 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 Nov 2011 03:11:06 -0800
Message-ID: <cover.1321527995.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 17 Nov 2011 19:06:35 +0800
Date: Thu, 17 Nov 2011 19:10:23 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] tslib:Set open mode for ts_calibate.c
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Nov 2011 11:17:32 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Get patch from: http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/27614 There is a potentially "unsafe" use of open(). Ubuntu 8.10+, for instance, by default enables the compiler flag -D_FORTIFY_SOURCE=2 which throws an error of ts_calibrate.c. To fix this, set a mode in the open() call, patch patched ts_calibrate.c to set 0644 (S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH) and it compiles fine 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/ts_lib
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/ts_lib

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  tslib: Set open mode for ts_calibate.c

 .../tslib/set-open-mode-for-ts_calibrate_c.patch   |   30 ++++++++++++++++++++
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    5 ++-
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/tslib/tslib/set-open-mode-for-ts_calibrate_c.patch



