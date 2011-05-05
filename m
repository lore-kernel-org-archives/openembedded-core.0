Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QHqaW-0008Pz-Am
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 06:54:56 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p454q5rL013993;
	Wed, 4 May 2011 21:52:11 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  5 May 2011 00:53:24 -0400
Message-Id: <f3217350764c369cda717c4da00da1ad1d5408fb.1304570401.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1304570401.git.bruce.ashfield@windriver.com>
References: <cover.1304570401.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1304570401.git.bruce.ashfield@windriver.com>
References: <cover.1304570401.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org, saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: update SRCREVs
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
X-List-Received-Date: Thu, 05 May 2011 04:54:57 -0000

Updating the linux-yocto/2.6.37 SRCREVs to pickup:

    perf tool: Fix gcc 4.6.0 issues

    1/1 [
    Author: Kyle McMartin
    Email: kyle@mcmartin.ca
    Subject: perf tool: Fix gcc 4.6.0 issues
    Date: Thu, 5 May 2011 00:06:01 -0400

    commit fb7d0b3cefb80a105f7fd26bbc62e0cbf9192822 upstream.

    GCC 4.6.0 in Fedora rawhide turned up some compile errors in tools/perf
    due to the -Werror=unused-but-set-variable flag.

    I've gone through and annotated some of the assignments that had side
    effects (ie: return value from a function) with the __used annotation,
    and in some cases, just removed unused code.

    In a few cases, we were assigning something useful, but not using it in
    later parts of the function.

    kyle@dreadnought:~/src% gcc --version
    gcc (GCC) 4.6.0 20110122 (Red Hat 4.6.0-0.3)

    Cc: Ingo Molnar <mingo@redhat.com>
    LKML-Reference: <20110124161304.GK27353@bombadil.infradead.org>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>
    [ committer note: Fixed up the annotation fixes, as that code moved recently ]
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
    [Backported to 2.6.38.2 by deleting unused but set variables]
    Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
    [Backported to linux-yocto kernel git version]
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_git.bb |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index 8a46e02..3b4e77e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -18,20 +18,20 @@ KMETA = meta
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "e5ca41def834db9d18b28393a45d53a8d18f3d05"
-SRCREV_machine_qemumips = "9bbc8e3432406429923fab0de038af5d3e647901"
-SRCREV_machine_qemuppc = "f0ff494e62bfaa921e844c1ec7fe6cf4a977980a"
-SRCREV_machine_qemux86 = "cb0537a40dadea20f12bc10e0986fd2a70290b42"
-SRCREV_machine_qemux86-64 = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-SRCREV_machine_emenlow = "2215a346eb4f9e09053d00bdf61ed999ff80e029"
-SRCREV_machine_atom-pc = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-SRCREV_machine_routerstationpro = "8db69980d76e1f863af409e70175963f23de83ab"
-SRCREV_machine_mpc8315e-rdb = "6861d8a4d58f8aa75997f7678cc454791544507a"
-SRCREV_machine_beagleboard = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-SRCREV_machine = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_machine_qemuarm = "b0375c21e29453458f9aa9986dc3f1ec69bf1aef"
+SRCREV_machine_qemumips = "f5d26f2eda2be8b942172cda8f27de33ebf38ec3"
+SRCREV_machine_qemuppc = "7eb6c68d977d9039a2b5a734172b064a9d19cdc1"
+SRCREV_machine_qemux86 = "ad62d1aab734513cd96c8f4517f816420a218e77"
+SRCREV_machine_qemux86-64 = "b906f358fd404a1e74a961f25079274e0d933ee1"
+SRCREV_machine_emenlow = "c3bbcb676f929c4fc0511a6e66494b8770d015a1"
+SRCREV_machine_atom-pc = "b906f358fd404a1e74a961f25079274e0d933ee1"
+SRCREV_machine_routerstationpro = "95ca94d2e71ca2db6822a37a7f575fa79c3d05d0"
+SRCREV_machine_mpc8315e-rdb = "53c800c244e73d81d2832f6da306eeae3b09e5dc"
+SRCREV_machine_beagleboard = "b906f358fd404a1e74a961f25079274e0d933ee1"
+SRCREV_machine = "b906f358fd404a1e74a961f25079274e0d933ee1"
 SRCREV_meta = "ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5"
 
-PR = "r16"
+PR = "r17"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
-- 
1.7.0.4



