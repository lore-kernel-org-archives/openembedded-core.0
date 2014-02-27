Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2526F2FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 21:12:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1RLClHN029680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Feb 2014 13:12:47 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 27 Feb 2014 13:12:47 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Feb 2014 16:12:34 -0500
Message-ID: <cover.1393535348.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 27 Feb 2014 21:12:51 -0000
Content-Type: text/plain

Richard/Saul,

While I put the finishing touches on the 3.14 -dev kernel (and versioned
linux-yocto recipe), here are pending updates to the other supported
kernel versions, and a minor change to create consistency in branch
validation process.

I've kept all the incremental version (And LTSI) updates intact in this
series, since they represent build and validation points that I used
during the merges, and should be maintained in the history.

Sanity has passed across all the qemu* platforms, as well as builds for
the hardware references.

Cheers,

Bruce

The following changes since commit 5ab9d7e28f987fba8bab03bb7851c263f746c208:

  security-flags: Avoid lttng-tools issue on arm (2014-02-26 13:48:21 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  kernel-yocto: always checkout machine branch when existing
    validate_branches
  linux-yocto/3.10: update to v3.10.32
  linux-yocto/3.4: update to v3.4.82 and latest LTSI
  linux-yocto/3.10: integrate latest LTSI changes

 meta/classes/kernel-yocto.bbclass                  | 37 ++++++++++------------
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  8 ++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       | 16 +++++-----
 7 files changed, 47 insertions(+), 52 deletions(-)

-- 
1.8.1.2


