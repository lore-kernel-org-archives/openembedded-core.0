Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09C0771B2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 03:10:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1R3A6JO011997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Feb 2017 19:10:07 -0800 (PST)
Received: from yow-dellw-nn.wrs.com (128.224.56.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 26 Feb 2017 19:10:06 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 26 Feb 2017 22:10:01 -0500
Message-ID: <cover.1488164498.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/4] linux-yocto: kernel version updates
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
X-List-Received-Date: Mon, 27 Feb 2017 03:10:10 -0000
Content-Type: text/plain

Hi all,

Here is the latest updates to the linux-yocto kernel versions, and represents
the versions that we'd like to be included in the upcoming release.

Those versions are:

 - 4.1:  LTSI
 - 4.9:  LTS
 - 4.10: 'latest'

I've also updated the linux-libc-headers to 4.10 to match.

I built and booted this kernel and libc-headers update against qemu (all
arches, all word sizes) and I also built the same images against musl as
the c library.

After working through some issues (config and tools), everything now looks
clean and I didn't pick up any issues.

NOTES:

 - this series needs the latest lttng 2.9.x -stable release, which was
   posted to oe-core on Sunday February 26th.

 - I'll send follow up patches to poky/yocto-bsps to update the bbapends
   and kernels there.

 - You'll note that I'm not dropping the 4.8 recipes in this series, since
   there are still reference BSPs that indicate it as the preferred
   version. I need to get the reference BSP maintainers to bump the versions
   and then I'll drop 4.9.

 - As in the past, if folks are concerned about the amount of space the
   linux-yocto versions are taking up, we can investigate shallow clones, or
   I can do a versioned branching structure. Either of those options can be
   done after this version bump is in-tree, since it is a separate topic.

 - I'll also be sending -stable updates for 4.1, 4.9 and 4.10 separately
   in the next few days.

Cheers,

Bruce

The following changes since commit 3c83b56309ab419f8cda72c0711479f60f61439a:

  bitbake: fetch2/svn: change 'rsh' parameter to 'ssh' (2017-02-23 12:50:17 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto: introduce 4.10 recipes
  libc-headers: introduce 4.10 and set as default
  linux-yocto-dev: add virtio fragment for virtio targets
  linux-yocto: drop 4.4 recipes

 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...c-headers_4.9.bb => linux-libc-headers_4.10.bb} |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 ++
 ...inux-yocto-rt_4.4.bb => linux-yocto-rt_4.10.bb} | 12 +++++-----
 ...-yocto-tiny_4.4.bb => linux-yocto-tiny_4.10.bb} | 12 +++++-----
 .../{linux-yocto_4.4.bb => linux-yocto_4.10.bb}    | 26 ++++++++++++----------
 6 files changed, 33 insertions(+), 25 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.9.bb => linux-libc-headers_4.10.bb} (66%)
 rename meta/recipes-kernel/linux/{linux-yocto-rt_4.4.bb => linux-yocto-rt_4.10.bb} (77%)
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_4.4.bb => linux-yocto-tiny_4.10.bb} (52%)
 rename meta/recipes-kernel/linux/{linux-yocto_4.4.bb => linux-yocto_4.10.bb} (56%)

-- 
2.5.0


