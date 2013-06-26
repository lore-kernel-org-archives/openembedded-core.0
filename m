Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC87F6AC48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 13:40:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5QDeVId004824
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2013 06:40:31 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 26 Jun 2013 06:40:31 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 26 Jun 2013 09:40:25 -0400
Message-ID: <cover.1372253710.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
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
X-List-Received-Date: Wed, 26 Jun 2013 13:40:32 -0000
Content-Type: text/plain

Richard/Saul,

Here's a collection of four patches that I've queued in the
past few days. My normal smoke testing passed here.

These are a collection of version refreshes, and configuration
changes. Nothing major. Once these are merged, the stage is 
set for more 1.5 development items. 

Everything is pretty self explanitory, or was discussed on
the mailing list, so I'll keep it to a summary here. Let me
know if there are any concerns.

 [PATCH 1/4] linux-yocto/3.4: allow kernel feature _appends to be overriden
 [PATCH 2/4] linux-yocto/3.8: add USB screen configuration and net sched options
 [PATCH 3/4] linux-yocto/3.4: ltsi: sync to LTSI commit 5f05247ed
 [PATCH 4/4] linux-yocto-dev: bump version to 3.10+

Cheers,

Bruce

The following changes since commit 8e9501ffa8726d69412d669580d787ffedb88d34:

  populate_sdk_base, adt_installer: abort install if path contains spaces (2013-06-25 17:59:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/3.4: allow kernel feature _appends to be overriden
  linux-yocto/3.8: add USB screen configuration and net sched options
  linux-yocto/3.4: ltsi: sync to LTSI commit 5f05247ed
  linux-yocto-dev: bump version to 3.10+

 meta/recipes-kernel/linux/linux-yocto-dev.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   17 +++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |    2 +-
 7 files changed, 16 insertions(+), 15 deletions(-)

-- 
1.7.10.4


