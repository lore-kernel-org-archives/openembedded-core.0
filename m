Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5d5-0003Sd-UU
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:47:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 14:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437102458"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 14:44:14 -0700
Message-Id: <2300342f946984fd66fe15b72bda8e31560c27ef.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Mon, 16 May 2011 15:29:48 -0400
Date: Mon, 16 May 2011 14:44:14 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 14/14] linux-yocto: update meta SRCREV
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
X-List-Received-Date: Mon, 16 May 2011 21:47:15 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the meta branch to pickup two recent commits for
BSP support:

[
    commit 79669230fd82a3e7e254cf8b596a2388a4333e62
    Author: Tom Zanussi <tom.zanussi@intel.com>
    Date:   Fri Apr 22 15:55:12 2011 -0500

        bsp/crownbay: merge emgd branch

        Add scc commands to merge the yocto/emgd branch into the crownbay BSP.

        Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>

    :100644 100644 89a0725... 0d02b98... M  meta/cfg/kernel-cache/bsp/crownbay/crownbay.scc

    commit ceb1744ec55408cb637929a3f154379e42642890
    Author: Tom Zanussi <tom.zanussi@intel.com>
    Date:   Mon Apr 25 18:15:14 2011 -0500

        meta/romley: create initial BSP infrastructure

        Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>

    :000000 100644 0000000... 54ec614... A  meta/cfg/kernel-cache/bsp/romley/romley-standard.scc
    :000000 100644 0000000... 61e5506... A  meta/cfg/kernel-cache/bsp/romley/romley.cfg
    :000000 100644 0000000... 1c4a657... A  meta/cfg/kernel-cache/bsp/romley/romley.scc

    commit ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index f54033d..3e828c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -20,7 +20,7 @@ SRCREV_machine_qemuppc = "7eb6c68d977d9039a2b5a734172b064a9d19cdc1"
 SRCREV_machine_qemux86 = "ad62d1aab734513cd96c8f4517f816420a218e77"
 SRCREV_machine_qemux86-64 = "b906f358fd404a1e74a961f25079274e0d933ee1"
 SRCREV_machine = "b906f358fd404a1e74a961f25079274e0d933ee1"
-SRCREV_meta = "ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5"
+SRCREV_meta = "79669230fd82a3e7e254cf8b596a2388a4333e62"
 
 PR = "r18"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.1.1



