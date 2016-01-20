Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7055065CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 16:31:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0KGVQdL027343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 20 Jan 2016 08:31:26 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 20 Jan 2016 08:31:25 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Jan 2016 11:31:23 -0500
Message-ID: <cover.1453304929.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] libc-headers: update to 4.4
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
X-List-Received-Date: Wed, 20 Jan 2016 16:31:29 -0000
Content-Type: text/plain

Now that the 4.4 kernel is in oe-core, we can bump the libc-headers to match.
I've built core-image*, sato and boot tested across qemu* using systemd as
the init manager.

Saul found that 4.4 broke udev, and hence sysvinit systems, so his patch

  [udev: Add 2 patches to support 4.4 kernel]

Must be applied for sysvinit system to build with this change applied.

I'll follow up with a preferred version bump to the qemu* machines once
this is proven to be sane.

Cheers,

Bruce

The following changes since commit 68c7113a746694e25df2ac5d86171ed96b7c2e94:

  poky.conf: Delete BB_SIGNATURE_HANDLER settings (2016-01-19 23:02:01 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-libc-headers: update to 4.4

 meta/conf/distro/include/tcmode-default.inc                      | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb | 4 ----
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb

-- 
2.1.0


