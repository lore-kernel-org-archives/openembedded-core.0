Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QMjjx-0004qY-E0
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 18:36:59 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4IGX8HK015331;
	Wed, 18 May 2011 09:33:10 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 May 2011 12:33:01 -0400
Message-Id: <571a38c8159faa54135bc73a485567462e87de75.1305736112.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1305736112.git.bruce.ashfield@windriver.com>
References: <cover.1305736112.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1305736112.git.bruce.ashfield@windriver.com>
References: <cover.1305736112.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto/meta-yocto: fix gcc 4.6.0 compilation failures
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
X-List-Received-Date: Wed, 18 May 2011 16:36:59 -0000

Fixes gcc 4.6.0 compliation issues by importing the upstream change:

    Author: Michal Marek <mmarek@suse.cz>
    Date:   Mon May 2 12:13:01 2011 +0000

        kbuild: Fix passing -Wno-* options to gcc 4.4+

        Starting with 4.4, gcc will happily accept -Wno-<anything> in the
        cc-option test and complain later when compiling a file that has some
        other warning. This rather unexpected behavior is intentional as per
        http://gcc.gnu.org/PR28322, so work around it by testing for support of
        the opposite option (without the no-). Introduce a new Makefile function
        cc-disable-warning that does this and update two uses of cc-option in
        the toplevel Makefile.

        Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
        Signed-off-by: Michal Marek <mmarek@suse.cz>
        Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
        Integrated-by: Bruce Ashfield <bruce.ashfield@windriver.com>

    :100644 100644 0ef00bd... 1d8e7e9... M  Documentation/kbuild/makefiles.txt
    :100644 100644 7bd863e0.. 74bac80... M  Makefile
    :100644 100644 ed2773e... ba25c44... M  scripts/Kbuild.include

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../recipes-kernel/linux/linux-yocto_git.bbappend  |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend b/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
index 052831d..e053fe9 100644
--- a/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
+++ b/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
@@ -3,11 +3,11 @@ KMACHINE_routerstationpro = "yocto/standard/routerstationpro"
 KMACHINE_mpc8315e-rdb = "yocto/standard/fsl-mpc8315e-rdb"
 KMACHINE_beagleboard = "yocto/standard/beagleboard"
 
-SRCREV_machine_emenlow = "c3bbcb676f929c4fc0511a6e66494b8770d015a1"
-SRCREV_machine_atom-pc = "b906f358fd404a1e74a961f25079274e0d933ee1"
-SRCREV_machine_routerstationpro = "95ca94d2e71ca2db6822a37a7f575fa79c3d05d0"
-SRCREV_machine_mpc8315e-rdb = "53c800c244e73d81d2832f6da306eeae3b09e5dc"
-SRCREV_machine_beagleboard = "b906f358fd404a1e74a961f25079274e0d933ee1"
+SRCREV_machine_emenlow = "5d0d346c0e4b2d837cd98dccbf043f1988e2058a"
+SRCREV_machine_atom-pc = "79d6188d99bdf63da9a0ba27c010792266e337f9"
+SRCREV_machine_routerstationpro = "d6aadb767fdcbb9886c430e90b92f49cd3a9ddcc"
+SRCREV_machine_mpc8315e-rdb = "e5c67f6a64b8b7393ca3a9c80b3ac197be0a8d5f"
+SRCREV_machine_beagleboard = "e53debfc6896bb89174ebb74154ed9b3bc72b59c"
 
 COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
 COMPATIBLE_MACHINE_routerstationpro = "routerstationpro"
-- 
1.7.0.4



