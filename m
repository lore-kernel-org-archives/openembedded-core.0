Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SjuIG-0001NH-Ue
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:36:37 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5RFPdth017601;
	Wed, 27 Jun 2012 08:25:40 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 27 Jun 2012 11:25:15 -0400
Message-Id: <cover.1340741590.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/3.0: update BSP descriptions
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
X-List-Received-Date: Wed, 27 Jun 2012 15:36:37 -0000

Saul,

Here's the fix for the 3.0 mpc 8360 build issue on the autobuilder.
A few boards were missed when updating the BSP descriptions to a new
format. This completes the effort.

On a related note, we'll bump this to 3.4 support shortly so the tweak
to the meta data is the best short term fix.

Cheers,

Bruce    
    
The following changes since commit fae565d2bc9090cbb083d44ea5de6b2b80622118:

  linux-yocto/3.4: -rt build fixes + configuration audit (part2) (2012-06-26 14:34:22 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/3.0-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/3.0-fix

Bruce Ashfield (1):
  linux-yocto/3.0: update BSP descriptions to new kern-tools format

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



