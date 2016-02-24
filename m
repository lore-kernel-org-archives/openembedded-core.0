Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95E6577296
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 09:23:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1O9NxBa023538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 01:23:59 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Feb 2016 01:23:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 01:23:55 -0800
Message-ID: <cover.1456304688.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] make vm + live images can build together
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
X-List-Received-Date: Wed, 24 Feb 2016 09:23:59 -0000
Content-Type: text/plain

Hello,

These patches can make vm and live images build together, and also make
the images easier to use.

I'd like to combine the following classes if you are fine with it:
* boot-directdisk.bbclass and image-vm.bbclass into image-vm.bbclass.
  They are used for making vm images.
* bootimg.bbclass and image-live.bbclass into image-live.bbclass.
  They are used for making live images.
Combine them can make them easier to understand and also make the
structure clearer.

// Robert

The following changes since commit 205b446f3fc4a9885179a66a8dab9d81bcc63dca:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/syslinux
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/syslinux

Robert Yang (4):
  image-live/boot-directdisk.bbclass: remove AUTO_SYSLINUXCFG
  boot-directdisk.bbclass: drop IS_VM chechking
  syslinux.bbclass: make vm and live can be built together
  sanity.bbclass: remove conflict checking for image vm and live

 meta/classes/boot-directdisk.bbclass |   21 ++++++++-------------
 meta/classes/bootimg.bbclass         |    1 +
 meta/classes/image-live.bbclass      |   17 ++++++++---------
 meta/classes/image-vm.bbclass        |   15 +++++++--------
 meta/classes/sanity.bbclass          |   12 ------------
 meta/classes/syslinux.bbclass        |   23 ++++++++++++++++++-----
 6 files changed, 42 insertions(+), 47 deletions(-)

-- 
1.7.9.5


