Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26B63610FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 03:55:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8N3tla9009645
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Sep 2013 20:55:47 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 22 Sep 2013 20:55:47 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 22 Sep 2013 23:55:43 -0400
Message-ID: <cover.1379908369.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto: yocto-bsp-tools custom qemuppc fix
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
X-List-Received-Date: Mon, 23 Sep 2013 03:55:48 -0000
Content-Type: text/plain

Richard/Saul,

Every relase, TomZ's BSP tools manage to uncover something up with kernel
management tweaks .. they are a great regression test.

This time is no exception. We found an issue with BSPs that inherit and branch
from qemuppc. The fix is in the tools, and is a minor tweak to the way that
a series of non "git am" patches are handled when importing them to the
tree.

I did regression tests via my other patching layers, and all shows fine with
this fix in place.

Cheers,

Bruce

The following changes since commit bf6b0d95db3863a2cfbccb154c0c7ad5b3bbf0b0:

  glib-2.0: fix broken python script header on machines using buildtools (2013-09-22 12:23:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  kern-tools: fix multi patch application without headers

 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4


