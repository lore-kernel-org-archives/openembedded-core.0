Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFFA4610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 00:02:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9402PYq003124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Oct 2013 17:02:25 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 3 Oct 2013 17:02:24 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 3 Oct 2013 20:02:20 -0400
Message-ID: <cover.1380844647.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] kernel: provide scripts in the sysroot
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
X-List-Received-Date: Fri, 04 Oct 2013 00:02:29 -0000
Content-Type: text/plain

Richard/Saul,

Khem noticed that he was seeing frequent "modpost missing" messages in his
logs for out of tree builds. This is due to the missing kernel scripts, which
we remove for packaging reasons.

Rather than jiggle the kernel install rule itself, experience shows that just
heading to the sysroot and re-creating the scripts is easy enough to do.

   [PATCH 1/1] kernel: restore scripts in the sysroot

   When building against the sysroot, out of tree modules can require modpost
   and other utilities normally found in the kernel's scripts directory. For
   the kernel source in the staging dir, these scripts have been removed to
   avoid mixing archiectures when packaging kernel-dev (among other things).

   Rather than further complicate the kernel's install rule, or its packaging,
   we can jump into the sysroot and restore the scripts by building them, hence
   making them available to packages that need them.

Khem confirmed that the same fix worked for him.

cc: Khem Raj <raj.khem@gmail.com>

Cheers,

Bruce


The following changes since commit e7a20238dc73bb449f15feaf0dead51daf796184:

  maintainers: Add some maintainers (2013-10-03 10:22:30 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (1):
  kernel: restore scripts in the sysroot

 meta/classes/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
1.8.1.2


