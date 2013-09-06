Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6C861566
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 19:47:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r86JlX8a004845
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Sep 2013 12:47:33 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 6 Sep 2013 12:47:32 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Sep 2013 15:47:27 -0400
Message-ID: <cover.1378496685.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel-yocto: 3.10.x bug fixes
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
X-List-Received-Date: Fri, 06 Sep 2013 19:47:34 -0000
Content-Type: text/plain

Richard/Saul,

The 1.5 kern tools managed to break TomZ's bsp script's generated patches,
so I've included a fix here for that issue.

The second one is a usablity fix for the tgz support for linux-yocto
based kernels, with this, misconfigurations are detected and reported
rather than some arcane error messages.

Bruce

The following changes since commit ed3ef0823fde89371a473d20c0127c0bd16d062b:

  qemumips: fix keyboard entry in graphical boots (2013-09-05 16:27:54 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  kernel-yocto: improve error checking on non-git repos
  kern-tools: support no author patches

 meta/classes/kernel-yocto.bbclass                       |   13 ++++++++++++-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

-- 
1.7.10.4


