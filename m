Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 575486E666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:58:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0BGwSMe026648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jan 2016 08:58:28 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 11 Jan 2016 08:58:27 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Jan 2016 11:58:25 -0500
Message-ID: <cover.1452531312.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto: introduce 4.4 named/versioned recipe
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
X-List-Received-Date: Mon, 11 Jan 2016 16:58:29 -0000
Content-Type: text/plain

Richard/Ross,

The 4.4 kernel has been released for about 20 hours, so it is about time
we get a named recipe in oe-core master :)

This is a quick update and re-test of what has already been in linux-yocto -dev.
Nothing blew up in my smoke testing, so hopefully that means a smooth
integration.

This is just the kernel part of the updates, I'll be following up with
preferred version bumps, and a rev of libc-headers shortly .. but there's
no need to wait on this.

Cheers,

Bruce


The following changes since commit 1ee08426d792ce27213dd411a885595d8435ae33:

  sstatesig: Handle special case of gcc-source shared-workdir for printdiff (2016-01-11 15:41:47 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: introduce v4.4 standard/preempt-rt/standard kernel

 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 27 +++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 23 +++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 42 +++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.4.bb

-- 
2.1.0


