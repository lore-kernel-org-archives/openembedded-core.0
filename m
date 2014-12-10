Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B80272559
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:38:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAcof0005869
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:38:50 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:38:50 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:38:39 -0500
Message-ID: <cover.1418207729.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Wed, 10 Dec 2014 10:39:01 -0000
Content-Type: text/plain

Richard,

Here are the pending series of kernel updates. I've kep the commits to the
granulatary that I did the version bumps, since they represent known good
working points in time.

Nothing too exciting, these are standard kernel -stable updates (and the
typical lttng build fix for a tracepoint changing).

The only item of note is that the 3.14 tree now has LTSI content merged into
a dedicated branch and also into all BSPs.

I've built this everywhere that I can, and I still have more builds running,
but there's no sense sitting on this longer .. so I'm sending it out now, and
will monitor for any issues that pop up.

Cheers,

Bruce

Bruce Ashfield (9):
  linux-yocto/3.17: update to v3.17.1
  linux-libc-headers: update to 3.17
  linux-yocto/3.17: update to v3.17.2
  linux-yocto/3.10: update to v3.10.59
  linux-yocto/3.14: update to v3.14.24
  lttng-modules: fix mm_compaction_isolate_template build
  linux-yocto/3.17: update to v3.17.6
  linux-yocto/3.10: update to v3.10.62
  linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates

 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 .../linux-libc-headers/linux-libc-headers_3.16.bb  |  7 ----
 .../linux-libc-headers/linux-libc-headers_3.17.bb  |  7 ++++
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++-----
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++-----
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++-----
 ...-fix-mm_compaction_isolate_template-build.patch | 41 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |  1 +
 13 files changed, 94 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch

-- 
2.1.0


