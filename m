Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SH9QG-000613-R7
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 09:54:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q397igP8009809
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 00:44:42 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 9 Apr 2012 00:44:42 -0700
Message-ID: <cover.1333957247.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 9 Apr 2012 15:40:47 +0800
Date: Mon, 9 Apr 2012 15:48:17 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] opkg: Add the condition for the content of arch.conf when enable multilib
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
X-List-Received-Date: Mon, 09 Apr 2012 07:54:01 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

After successfully installed some lib32 multilib packages into the
x86-64 image, we just found that the file content of /var/lib/opkg/status in
rootfs changed after the very 1st boot, many lib32 related packages information
are missing in that file.

The missing arch "x86" in arch.conf cause the above problem. Adding the
condition for the content of arch.conf when enable multilib. If build
multilib image, "ALL_MULTILIB_PACKAGE_ARCHS" will be used instead of
"PACKAGE_ARCHS".

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/multilib
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/multilib

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  opkg: Add the condition for the content of arch.conf when enable
    multilib

 meta/recipes-devtools/opkg/opkg-config-base_1.0.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)



