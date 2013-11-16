Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD906D9AC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 06:17:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAG6HS2c005158
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Nov 2013 22:17:28 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 15 Nov 2013 22:17:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 16 Nov 2013 01:17:23 -0500
Message-ID: <cover.1384582409.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] kernel.bbclass: fix hardlink test
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
X-List-Received-Date: Sat, 16 Nov 2013 06:17:28 -0000
Content-Type: text/plain

Richard/Saul,

It's sometimes nice when you get to clean up your own mess. While all my
build tests passed on Friday to fix the "vmlinux" and "usr/src/kernel/vmlinux"
are the same file, it was because the install failed in all cases, not just
the one we wanted to prevent.

I bumped into a build failure when assembling xen hdmimage, since it could
find the bzImage in the kernel source directory. I tracked it back to 
the hardlink fix, and on debugging, noticed that the test wasn't good on
all machines.

An extra space fixes everything up, and I'm now able to build my xen image
AND build linux-yocto for qemumips, and another other target you should
favour.

Take this for spin .. since it is late at night when I did this, but it
should be fine :)

Cheers,

Bruce

The following changes since commit db7f8d4114267ed34c19dc66dd56c2372354b43f:

  kernel.bbclass: test for hardlinks before installing (2013-11-15 15:27:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  kernel.bbclass: fix hardlink test

 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.2


