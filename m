Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id A62166B009
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 22:00:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7QM0Ouu025737
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Aug 2013 18:00:24 -0400 (EDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 26 Aug 2013 15:00:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 26 Aug 2013 18:00:11 -0400
Message-ID: <cover.1377554229.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: add bc-native and linux-yocto-dependency
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
X-List-Received-Date: Mon, 26 Aug 2013 22:00:27 -0000
Content-Type: text/plain

Richard/Saul,

As reported by Martin Jansa, the following error happens when building in a
minimal environment:

   |   BC      kernel/timeconst.h
   | /bin/sh: bc: command not found
   | make[3]: *** [kernel/timeconst.h] Error 127
   | make[2]: *** [kernel] Error 2
   | make[2]: *** Waiting for unfinished jobs....

kernel commit 70730bca [kernel: Replace timeconst.pl with a bc script] added
a kernel dependency on bc. To support the build of linux-yocto recipes in
these configurations, we add bc-native to the common dependencies.

I didn't go so far as to add the dependency to the base kernel bbclass,
since not all kernels will be of the right version to trigger this dependency,
but we can consider doing that in the future.

I'm not packaging/native tool expert, but I think I added bc-native properly,
and it worked here. But obviously, correct me if I'm wrong.

Cheers,

Bruce


The following changes since commit dcc23c073ef936eccecdc16f973492f41c44def7:

  kern-tools: fix patch series to git tree validation (2013-08-26 13:57:20 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-bc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-bc

Bruce Ashfield (2):
  bc: add bc-native
  linux-yocto: add bc-native dependency, and move to linux-yocto.inc

 meta/recipes-extended/bc/bc_1.06.bb                |    2 ++
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    3 ---
 meta/recipes-kernel/linux/linux-yocto.inc          |    2 ++
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.7.10.4


