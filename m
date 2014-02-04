Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 517FC6C73A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 17:34:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s14HYRXO023973
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Feb 2014 09:34:28 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 4 Feb 2014 09:34:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Feb 2014 12:34:24 -0500
Message-ID: <cover.1391534980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel: consolidated pull request
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
X-List-Received-Date: Tue, 04 Feb 2014 17:34:29 -0000
Content-Type: text/plain

Richard/Saul,

Consolidated is a bit of a strong word here, since there are
only two patches .. but I'd rather send them as a series of
my pending changes versus two separate pulls.

Once is an update of the 3.10 tree to include the 3.10 LTSI
content, this gets us new BSP support and a few features. The
merge was smooth, but I did build and boot all qemu boards to
be sure.

The second change is a tweak I made to speed up the kernel
installation phase. It's a simple change that saves nearly a 
minute on my local tests. As the patch states, I kept things
simple instead of getting really arcane with find and mixing
multiple options (it is already getting unreadible, and I
didn't want to make it worse).

From the patch:

    Time for install before this change:

     real    2m48.563s
     user    0m35.220s
     sys     0m33.036s

    Time for install after this change:

     real    1m21.301s
     user    0m33.160s
     sys     0m28.388s

I've been running with the install change for quite some time
now, and haven't seen any breakage.

Bruce

The following changes since commit 82f9c2bcff3e977beefde6048d2ba32d17acbbd0:

  wic: Hook up --debug option (2014-02-04 12:57:36 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  kernel: stop using -exec rm for deleting files
  linux-yocto/3.10: integrate LTSI

 meta/classes/kernel.bbclass                        | 18 +++++++++++++++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 4 files changed, 25 insertions(+), 13 deletions(-)

-- 
1.8.1.2


