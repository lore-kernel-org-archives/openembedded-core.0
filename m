Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16E446D899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 21:55:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0GLtmxp001911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jan 2014 13:55:48 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 16 Jan 2014 13:55:48 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 16 Jan 2014 16:55:47 -0500
Message-ID: <cover.1389909212.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto-dev: update to 3.13-rc8+
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
X-List-Received-Date: Thu, 16 Jan 2014 21:55:50 -0000
Content-Type: text/plain

Richard/Saul,

I've bumped the linux-yocto-dev kernel to 3.13-rcX, so it is worthwhile having
the version of the recipe reflect that.

I case anyone is wondering, I've built and booted all the reference boards with
this -dev kernel (minimal and sato) and everything is in order for my tests.

Other version bumps like libc-headers will follow in the future.

Cheers,

Bruce

The following changes since commit cfd1520b4b492ab27b2900ba3510abe6f288097e:

  oe-selftest: separated the SStateBase and SStateTests in different modules (2014-01-16 12:18:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto-dev: bump version to 3.13+

 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.2


