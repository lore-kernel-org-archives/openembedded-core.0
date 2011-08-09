Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qqi5U-00078w-S5
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 10:55:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p798oTqC003712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 01:50:29 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 9 Aug 2011 01:50:29 -0700
Message-ID: <cover.1312878559.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 9 Aug 2011 16:29:19 +0800
Date: Tue, 9 Aug 2011 16:50:31 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] qt3: Solve the failure to compile qt3 on platform arm
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
X-List-Received-Date: Tue, 09 Aug 2011 08:55:01 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul,

The variable "TARGET_OS" has different value when building qt-x11-free-native and qt-x11-free. 
The different cause failure to compile qt3. 

$ bitbake qt-x11-free-native -e | grep ^TARGET_OS 
TARGET_OS="linux" 
$ bitbake qt-x11-free -e | grep ^TARGET_OS 
TARGET_OS="linux-gnueabi" 

Use "TARGETOS = linux${LIBCEXTENSION}${ABIEXTENSION}" in place of TARGET_OS for solving this bug. 

Pull URL: git://git.pokylinux.org/meta-qt3.git
  Branch: xiaofeng/meta-qt3
  Browse: http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt3/commit/?h=xiaofeng/meta-qt3

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  qt3: Solve the failure to compile qt3 on platform arm

 recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)



