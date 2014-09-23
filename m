Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC1D6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:57:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEvnZ8029654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 07:57:49 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:57:49 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 23 Sep 2014 10:57:38 -0400
Message-ID: <cover.1411483823.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 23 Sep 2014 14:57:50 -0000
Content-Type: text/plain

Hi all,

Some parts of this request are repeated from one I sent a while ago, since
they didn't make it into the tree. 

These are the release 1.7 kernel updates. For 3.10 and 3.14 they represent
the pickup of -stable fixes (in particular CVEs) and -rt fixes.

For 3.17, we follow the march to the release and are up to -rc6 after this
series. I'm also switching to the dedicated 3.17 repository.

Cheers,

Bruce

The following changes since commit bff185f6252751a97dcdf7ddfe86b808a714fdc5:

  dev-manual: Added a note to the EXTERNALSRC example about the class (2014-09-22 13:04:44 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/3.10: update to v3.10.54 and -rt55
  linux-yocto/3.14: update to v3.14.18 and -rt9
  linux-yocto/3.17: update to v3.17-rc5
  linux-yocto/3.17: switch to dedicated 3.17 repository
  linux-yocto/3.17: bump to v3.17-rc6
  linux-yocto/3.10: update to v3.10.55
  linux-yocto/3.14: update to v3.14.19

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 24 +++++++++++-----------
 8 files changed, 47 insertions(+), 47 deletions(-)

-- 
1.8.1.2


