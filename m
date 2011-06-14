Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOcw-0001K8-8W
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283871"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:16 -0700
Message-Id: <46f631b0c46e86d855ce06e19512bf443e8b9baa.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/51] linux-yocto: rename recipes to explicitly indicate version
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:34 -0000

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



