Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QV6kG-0002cu-Iz
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 20:47:48 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5AIhoLK001815;
	Fri, 10 Jun 2011 11:43:51 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 10 Jun 2011 14:42:22 -0400
Message-Id: <cover.1307730764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: recipe renames
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
X-List-Received-Date: Fri, 10 Jun 2011 18:47:49 -0000

Richard/Saul,

Here's the completion of a long standing 'nit of ours
where the kernel version isn't all that obvious from
the name of the linux-yocto recipes. As we finally 
cycle a kernel version out the bottom (2.6.34) the
issue came to a head (did you mean the old -stable
or the new -stable? .. etc).

So here are the recipe renames to fix things. I'll
quote the patch here:

[
   linux-yocto: rename recipes to explicitly indicate version
    
    The existing recipe names for the linux-yocto kernel builds
    worked well when there was a single, or two versions of the
    kernel available. But with the impending kernel updates and
    retirement of older kernels, the re-use of the same recipes
    for different kernel versions violates the principle of least
    surprise.
    
    To address this, the recipes are being renamed as follows:
    
        linux-yocto_git.bb -> linux-yocto_2.6.37.bb
        linux-yocto-stable_git.bb -> linux-yocto_2.6.34.bb
    
    There continue to be versionless recipe names that feed into
    versioned recipes at the appropriate points. They are:
    
         linux-yocto-dev.bb (tracking the latest yocto dev kernel)
         linux-yocto-korg_head.bb (tracking korg kernels)
    
    There are no existing users of linux-yocto-stable in the master
    branches to convert to the new naming, so these changes work
    in isolation.
    
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

I'm sending follow up patches to any other users that I know
of, but I can't say that I know of any and everyone with a 
bbappends that will no longer match.

So I'll leave it up to you for how you want to go about the
transition, but let me know, so I can get the known users
synchronized when this goes into master.

If you'd rather not jave the renames, I can simply add the new recipes
and we can remove the old ones at some more distant point in
the future when we know it to be safe. The more I think about it,
this may be the best option to keep things from breaking, but I'll
wait to hear before resending with that as the change.

Cheers,

Bruce


The following changes since commit b30cb584a738915113e88b7db1028d53b2bae5f9:
  Richard Purdie (1):
        Revert "gcc: rebase the patch to avoid patch rejection"

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: rename recipes to explicitly indicate version

 ...x-yocto-stable_git.bb => linux-yocto_2.6.34.bb} |    0
 .../{linux-yocto_git.bb => linux-yocto_2.6.37.bb}  |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-kernel/linux/{linux-yocto-stable_git.bb => linux-yocto_2.6.34.bb} (100%)
 rename meta/recipes-kernel/linux/{linux-yocto_git.bb => linux-yocto_2.6.37.bb} (100%)



