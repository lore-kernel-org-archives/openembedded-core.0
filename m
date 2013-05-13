Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UbkJO-0002I9-Fr
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 06:24:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4D46JZ7006622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2013 21:06:19 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 12 May 2013 21:06:19 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2013 21:06:13 -0700
Message-ID: <cover.1368417050.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, otavio@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Subject: [PATCH master, dylan, danny 0/1] kern-tools: make dash compliant
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
X-List-Received-Date: Mon, 13 May 2013 04:25:05 -0000
Content-Type: text/plain

Hi all,

Here's an update of merge_config.sh for master, dylan and danny. The
changes to master and danny are identical, but we need two commits
versus one for dylan. As for danny, I ported only the changes that I
needed for dash compliance, and created a kern-tools branch to track
that change. So the patch for danny has a SRCREV update and a switch
to the danny kern-tools branch.

The patches break down like this:
 
  master: zedd/kerntools-master
    [PATCH 1/1] kern-tools: refresh and make dash compliant 

  dylan: zedd/kerntools-dylan
    [PATCH dylan 1/2] kern-tools: anchor and delimit regexs
    [PATCH dylan 2/2] kern-tools: refresh and make dash complian
 
  danny: zedd/kerntools-danny
    [PATCH danny] kern-tools: refresh and make dash compliant

The problem was this:

  The separately packaged merge_config.sh in the kern-tools package was
  missing upstream fixes, and in particular a change that ensures it is
  dash compatible.

  By grabbing that upstream commit and rebasing the existing patches on
  top of the new baseline, we are up to date and working on systems
  where /bin/sh is dash.

I've tested the kernel config on all branches, as well as busy box on
master and dylan. The before and after .configs are the same and we
are dash compliant. But it's worth doing some sanity tests, just in
case I messed up the juggling of the three branches!

cc: "Burton, Ross" <ross.burton@intel.com>
cc: Paul Eggleton <paul.eggleton@linux.intel.com>
cc: Otavio Salvador <otavio@ossystems.com.br>

[YOCTO #4473]

Cheers,

Bruce

The following changes since commit f7afeeb75993b159bb8959e0309bc5eb3978a8fb:

  bitbake: bitbake-layers/tinfoil: Catch up with status -> recpiecache rename (2013-05-12 18:00:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kerntools-master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kerntools-master

Bruce Ashfield (1):
  kern-tools: refresh and make dash compliant

 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4



