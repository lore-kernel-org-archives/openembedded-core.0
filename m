Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D118F6E446
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:56:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2VHueS5016724
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 10:56:40 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 31 Mar 2014 10:56:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 31 Mar 2014 13:56:28 -0400
Message-ID: <cover.1396288310.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] lnux-yocto: 3.14 updates
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
X-List-Received-Date: Mon, 31 Mar 2014 17:56:42 -0000
Content-Type: text/plain

Richard/Saul,

Here are the remaining changes from my previous pull request for linux-yocto
updates.

Now that 3.14 has been released, we have the full 3.14 kernel and associated
libc-headers .. with no PV games.

There is one new change in the libc-headers series, to adapt to the xz compression
of new headers, but otherwise, it is the same as before.

[
   Subject: [PATCH 2/5] linux-libc-headers: make compression format configurable

   As of the 3.13 kernel bz2 compressed tarballs are not available. To support
   older header tarballs, and newer ones that require the 'xz' compressed
   bundles, we can break out a variable that allows versioned libc headers to
   select the archive format that works.

   Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

I've built and booted qemu* for this, so everything appears to be sane.

Cheers,

Bruce


The following changes since commit 4f80de9a568bcf0280c7e8b8f89ee6c2adfa477d:

  linux-yocto/3.10: fix qemuarm build failure (2014-03-30 23:53:00 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/3.14: introduce versioned recipes
  linux-libc-headers: make compression format configurable
  linux-libc-headers: add 3.14 libc headers
  libc-headers: set TC default to 3.14
  linux-libc-headers: remove 3.10 recipe

 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |  4 +-
 ...1-ptrace.h-remove-ptrace_peeksiginfo_args.patch | 50 ------------------
 ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch | 34 -------------
 ...efile.headersinst-install-headers-from-sc.patch | 59 ----------------------
 .../linux-libc-headers/linux-libc-headers_3.10.bb  | 11 ----
 .../linux-libc-headers/linux-libc-headers_3.14.bb  |  7 +++
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 21 ++++++++
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 37 ++++++++++++++
 9 files changed, 69 insertions(+), 156 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.14.bb

-- 
1.8.1.2


