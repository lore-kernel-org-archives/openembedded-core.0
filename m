Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Ud8BP-0006Jk-O7
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 02:06:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4GNlkLI004305
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 May 2013 16:47:46 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 16 May 2013 16:47:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 16 May 2013 16:47:39 -0700
Message-ID: <cover.1368733883.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.8: set qemumips64 SRCREVs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 00:06:19 -0000
Content-Type: text/plain

Richard/Saul,

The patch says it all:

   When qemumips64 was enabled, its machine specific SRCREV was missed.
   Without it, qemumips64 builds from the wrong branch and we miss important
   oprofile/ftrace fixes that are required for boot.

This has been confirmed by everyone testing qemumips64 and gives us
a working baseline.

Cheers,

Bruce

The following changes since commit 6520bab2ffe865ccef428604a46d968719864cc1:

  poky-lsb: make NFS kernel server support specific to linux-yocto (2013-05-16 05:46:10 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.8: set qemumips64 SRCREVs

 meta/recipes-kernel/linux/linux-yocto_3.8.bb |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.10.4



