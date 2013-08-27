Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 143AF61F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:01:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7RH1RgK027519
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2013 10:01:27 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 27 Aug 2013 10:01:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Aug 2013 13:01:13 -0400
Message-ID: <cover.1377622745.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto-rt: add qemumips and qemuppc to COMPATIBLE_MACHINES
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
X-List-Received-Date: Tue, 27 Aug 2013 17:01:29 -0000
Content-Type: text/plain

Richard/Saul,

Not trying to pile on more changes, since I know we are
still digesting recent changes.

But as promised, I continued my stability and feature testing
with the 3.10 kernel and qemumips/ppc now work fine with 
3.10 -rt.

This won't put any more strain on the build resources, so it is
worth enabling them in the 3.10 recipe.

Cheers,

Bruce   

The following changes since commit 325ee9b5fcebe902dfea78750502d8f6667d0a97:

  gcc-4.8.inc: Allow lto to be configurable (2013-08-27 13:48:47 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto-rt: add qemumips and qemuppc to COMPATIBLE_MACHINES

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
1.7.10.4


