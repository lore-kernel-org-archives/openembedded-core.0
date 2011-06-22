Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QZHGo-00083B-Gc
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 08:50:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5M6l3rx011530
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 23:47:03 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 21 Jun 2011 23:47:02 -0700
Message-ID: <cover.1308721296.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 22 Jun 2011 13:41:36 +0800
Date: Wed, 22 Jun 2011 14:43:01 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.28]
Subject: [PATCH 0/1] task-core-lsb: Add absent libraries and commands to task-core-lsb.bb
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
X-List-Received-Date: Wed, 22 Jun 2011 06:50:39 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

"tools-profile" and tools-testapps" which include three packages "owl-video" , "sysprof" and "alsa-utils-amixer" beside other packages were removed from variable "EXTRA_IMAGE_FEATURES" in meta-yocto/conf/local.conf.sample. The absent libraries in an lsb image depended by the above three packages will be installed into lsb image by dependence relationship.
Absent command:
|--strip
Absent Libraries:
|--libatk-1.0.so.0
|--libgdk-x11-2.0.so
|--libcairo.so.2
|--libpango-1.0.so
|--libpangoft2-1.0.so.0
|--libpangoxft-1.0.so.0
|--libpangocairo-1.0.so 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/task-core-lsb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/task-core-lsb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  task-core-lsb: Add absent libraries and commands to task-core-lsb.bb

 meta/recipes-extended/tasks/task-core-lsb.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)



