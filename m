Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66CB07182C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 07:06:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9V762TI004008
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Oct 2014 00:06:02 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 31 Oct 2014 00:06:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<Martin.Jansa@gmail.com>
Date: Fri, 31 Oct 2014 15:05:57 +0800
Message-ID: <cover.1414738674.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] package_manager.py: fix rpm based do_rootfs failed while IMAGE_INSTALL_append = " python3"
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
X-List-Received-Date: Fri, 31 Oct 2014 07:06:11 -0000
Content-Type: text/plain

vim local.conf
...
IMAGE_INSTALL_append " python3"
...

bitbake core-image-minimal

//Hongxu

The following changes since commit dacc4ce59e48129a1a1e5316e10780f7358e29ef:

  nativesdk-cmake: Adjust toolchain paths dynamically (2014-10-24 21:59:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-rootfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-rootfs

Hongxu Jia (1):
  package_manager.py: fix rpm based do_rootfs failed while
    IMAGE_INSTALL_append = " python3"

 meta/lib/oe/package_manager.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
1.9.1


