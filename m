Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW164-0002Fr-O8
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500606"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:18 -0700
Message-Id: <342c6ca81d2e2213b977b66c036b31f1fffc8d0b.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Subject: [*RFC CONSOLIDATED PULL RFC* 08/23] linux-yocto: rename recipes to explicitly indicate version
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:05 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

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
1.7.3.4



