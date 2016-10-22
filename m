Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6F971AA1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 03:47:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9M3lcl9007290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Oct 2016 20:47:38 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Oct 2016 20:47:37 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 21 Oct 2016 23:47:35 -0400
Message-ID: <cover.1477107618.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: 4.1/4.4 -stable and CVE fixes
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
X-List-Received-Date: Sat, 22 Oct 2016 03:47:40 -0000
Content-Type: text/plain

Hi all,

While preparing the 4.8.3 update, and looking more at the dirtycow CVE it
was worthwhile to also speed up the refresh of 4.4 to pick up the -stable
fix for the CVE.

I've also done my own backport of the CVE fix to 4.1 (and will also do an
update when a 4.1 -stable picks up the same change).

I've built and booted both 4.1 and 4.4 to make sure everything is sane,
and I have more builds running for additional coverage.

I'd consider these two commits as candidates for the 2.2 release if there
is another -rc build, they are also safe for backporting to the -stable
branches that have the linux-yocto 4.1 and 4.4 kernels, since these are
not new features and bug/CVE fixes.

Cheers,

Bruce

The following changes since commit 1f75397b7244e989b3cec138e6b2ec0b0eaea42c:

  linux-yocto/4.8: update to v4.8.3 (2016-10-21 11:29:30 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/4.4: update to v4.4.26
  linux-yocto/4.1: fix CVE-2016-5195 (dirtycow)

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 6 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.5.0


