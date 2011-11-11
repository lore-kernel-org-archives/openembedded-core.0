Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1ROokU-00048b-Md
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 11:54:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pABAlx00023949
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 02:47:59 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 11 Nov 2011 02:47:59 -0800
Message-ID: <cover.1321006415.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 11 Nov 2011 18:13:35 +0800
Date: Fri, 11 Nov 2011 18:56:18 +0800
To: <openembedded-core@lists.openembedded.org>
CC: 
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] directfb: update to 1.4.5
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
X-List-Received-Date: Fri, 11 Nov 2011 10:54:19 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I update it to 1.4.15 because directfb at 1.5 or higher need instruction set of armv6.
Some codes are realized with assemble language for new directfb but the current qemuarm base on armv5.
Some error will appear like "No xxx instruction ..." when compiling directfb at 1.5.3 for qemuarm.
For directfb running on more platform I update it to 1.4.15. 
I will seek some patches to use instrcutions of armv5 instead of armv6 for new directfb on platform qemuarm.
It could take some time for me. Please share your experience with me if you know. I will appreciate you very much.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/directfb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/directfb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  diretfb: update to 1.4.15

 .../{directfb_1.4.12.bb => directfb_1.4.15.bb}     |    9 ++++-
 .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 +++++++++----------
 2 files changed, 24 insertions(+), 21 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb => directfb_1.4.15.bb} (63%)



