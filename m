Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1S4wO2-0001g8-0O
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 16:33:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q26FOYIm017897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2012 07:24:34 -0800 (PST)
Received: from yow-bashfiel-l1.wrs.com (147.11.118.51) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 6 Mar 2012 07:24:34 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2012 10:24:31 -0500
Message-ID: <cover.1331047183.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto/3.2: minor -rt increment and fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 15:33:14 -0000
Content-Type: text/plain

Richard/Saul,

This is another kernel SRCREV update that should be stacked on the
end of my other pending patches. I've kept everything separate so
we can track the incremental changes.

This one is a minor update to the 3.2 tree.

  - there were a few config files that moved between 3.0 and 3.2
    and I'm adjusting the BSPs to match
  - 3.2.9-rt16 came out with a fix we want, so I've bumped the
    3.2 rt BSPs to pick it up.

cc: Darren Hart <dvhart@linux.intel.com>

Cheers,

Bruce

The following changes since commit 3e07ca64df8b16348520fa72d88f0ef54b5fee77:

  linux-yocto/meta-yocto: v3.2.9, v3.0.23 + fixes and updates (2012-03-06 10:18:11 -0500)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-3.2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-3.2

Bruce Ashfield (2):
  linux-yocto/meta: fix incorrect config references
  linux-yocto/rt: udpate SRCREVs to 3.2.9-rt16

 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.4.1



