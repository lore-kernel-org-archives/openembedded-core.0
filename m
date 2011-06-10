Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QV6k1-0002be-67
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 20:47:33 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5AIhoLL001815;
	Fri, 10 Jun 2011 11:43:53 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 10 Jun 2011 14:42:23 -0400
Message-Id: <4de906e7aa8555db80c6af8709c66145ed7b502a.1307730764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1307730764.git.bruce.ashfield@windriver.com>
References: <cover.1307730764.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1307730764.git.bruce.ashfield@windriver.com>
References: <cover.1307730764.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: rename recipes to explicitly indicate version
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
X-List-Received-Date: Fri, 10 Jun 2011 18:47:33 -0000

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
---
 ...x-yocto-stable_git.bb => linux-yocto_2.6.34.bb} |    0
 .../{linux-yocto_git.bb => linux-yocto_2.6.37.bb}  |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-kernel/linux/{linux-yocto-stable_git.bb => linux-yocto_2.6.34.bb} (100%)
 rename meta/recipes-kernel/linux/{linux-yocto_git.bb => linux-yocto_2.6.37.bb} (100%)

diff --git a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
similarity index 100%
rename from meta/recipes-kernel/linux/linux-yocto-stable_git.bb
rename to meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
similarity index 100%
rename from meta/recipes-kernel/linux/linux-yocto_git.bb
rename to meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
-- 
1.7.0.4



