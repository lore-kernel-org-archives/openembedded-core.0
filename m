Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B426C712AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:55:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s88JtjKR027429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 12:55:45 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 12:55:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 8 Sep 2014 15:55:26 -0400
Message-ID: <ecbc1bdf74823830c30f17afa3b950ac39a091fe.1410205901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/3.14: configuration updates and feature merges.
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
X-List-Received-Date: Mon, 08 Sep 2014 19:55:49 -0000
Content-Type: text/plain

Updating the 3.14 meta and machine SRCREVs to pick up the following changes:

meta/config:

    a94680bfeb0e drm-gma500: build GMA500 DRM driver as kernel module
    21783e2e6be2 intel-common: intel-core-32: use tunnelcreek.scc
    0b46240ac3b3 soc: tunnelcreek: create tunnelcreek scc
    c7207d9c0e6a qemuppc64: create bsp config
    8f553f77e0ad meta: Create kernel config and scc for CRIU
    dacb1c1ab011 meta: common-pc: add support for booting via EFI
    b85e4cb574d6 meta: Add CONFIG_TTY to common-pc-drivers.cfg
    33f2c8d2ba33 meta: Add CONFIG_TTY to 8250.cfg
    e6f31e4894d5 GRE: enable gre feature.

Features:

    b85edae6fd61 net: e1000e calls skb_set_hash
    b45e6dec1972 net: ppp: use sk_unattached_filter api
    d310945fb6d8 tracing: accelerate tracing filters with BPF
    6742a0d5e218 net: filter: x86: internal BPF JIT
    66f2b151dd09 net: filter: x86: split bpf_jit_compile()
    3c82c5d1fc49 net: filter: Fix redefinition warnings on x86-64.
    5ad74ef546a4 net: filter: additional BPF tests
    f097814fc305 net: filter: BPF testsuite
    1bcefe39e229 net: filter: make BPF conversion more readable
    e75a3abd0c6f net: filter: misc/various cleanups
    f5cd96317979 net: filter: make register naming more comprehensible
    2f485870e68b net: filter: simplify label names from jump-table
    d381512d96f0 bpf_dbg: fix wrong register usage
    d99d91c2c5a9 sched, cls: check if we could overwrite actions when changing a filter
    8a03c23319dc net: filter: initialize A and X registers
    77a8a3fb86cb filter: added BPF random opcode
    a9bb9bcd5a04 net: filter: seccomp: fix wrong decoding of BPF_S_ANC_SECCOMP_LD_W
    724096236a68 filter: prevent nla extensions to peek beyond the end of the message
    41bdf9a8c75f net: filter: be more defensive on div/mod by X==0
    2f908136e311 net: filter: minor: fix kdoc in __sk_run_filter
    2c733311d285 net: filter: rework/optimize internal BPF interpreter's instruction set
    40155402aff6 net: filter: move filter accounting to filter core
    2635af59e1b6 net: filter: keep original BPF program around
    97147dbf46f8 net: filter: add jited flag to indicate jit compiled filters
    676d895e105a net: Rename skb->rxhash to skb->hash
    1e4f73c14307 tools: bpf_dbg: various misc code cleanups
    47956b735bf6 timerfd: Implement timerfd_ioctl method to restore timerfd_ctx::ticks, v3
    26b3ef638e06 docs: Procfs -- Document timerfd output
    af3430a5fdc8 timerfd: Implement show_fdinfo method
    5dd4e59bf04b mm: softdirty: clear VM_SOFTDIRTY flag inside clear_refs_write() instead of clear_soft_dirty()
    c2a643b6da96 mm: softdirty: don't forget to save file map softdiry bit on unmap
    8a98c67f7124 mm/memory.c: don't forget to set softdirty on file mapped fault
    5886c8ea1f26 mm: softdirty: make freshly remapped file pages being softdirty unconditionally
    8f4adad45df3 proc: show mnt_id in /proc/pid/fdinfo
    d7e814681dd4 gre6: Call skb_checksum_simple_validate
    f17fe1ff70a1 net: Generalize checksum_init functions
    b6d250d7bead ip6gre: add x-netns support
    aebe8ead74e5 gre: allow changing mac address when device is up
    98268e587a24 gre: add x-netns support
    923b14472945 yaffs: fix yaffs_vfs.c warnings.
    1cc6b7d49394 yaffs: Avoid setting any ACL releated xattr

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 3b80c5326a41..1d69fc687bde 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "12f9e966eb249c3bdcc935612e2a372e90bad950"
-SRCREV_machine_qemuppc ?= "52ceb28926768c49f06db4e7e08d2226c2a473fd"
-SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
+SRCREV_machine ?= "cf214eea750707e6261818837e5c508ac1299b19"
+SRCREV_machine_qemuppc ?= "3d5a421fc5c171cd5d322b092e78e0e0dd4f340e"
+SRCREV_meta ?= "a94680bfeb0e8e3025b57f8b42d0825ba743376b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 5580e445d221..9f78951c52bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.17"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "5a47bbc4c3c2472f3746a8cf1485db7134cf9245"
-SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
+SRCREV_machine ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
+SRCREV_meta ?= "a94680bfeb0e8e3025b57f8b42d0825ba743376b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index e88e31a2badf..e06b191673e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5130b21b5ef3562c3cb03ad401bc9960fdedf49a"
-SRCREV_machine_qemumips ?= "ef22686356ce614f4bb3637ce6ee0dab068ea5e7"
-SRCREV_machine_qemuppc ?= "c7fed96ea15a49706582d84866f6552a33b3cac4"
-SRCREV_machine_qemux86 ?= "e0f04763abba7d487357f98f4267117fd5e79262"
-SRCREV_machine_qemux86-64 ?= "5a47bbc4c3c2472f3746a8cf1485db7134cf9245"
-SRCREV_machine_qemumips64 ?= "2af2cebe7e8c3755ac1f031c241b0cacad032d93"
-SRCREV_machine ?= "5a47bbc4c3c2472f3746a8cf1485db7134cf9245"
-SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
+SRCREV_machine_qemuarm ?= "c32a2e1190325f685a61196f38fc03ceff2645bf"
+SRCREV_machine_qemumips ?= "1ff50c529b49ceb55a670258f7cb8233c8006c6c"
+SRCREV_machine_qemuppc ?= "12e9828a5b78891374375233b4075f682b9fbd0e"
+SRCREV_machine_qemux86 ?= "58d49fe770ad642e2bc0616159195ba837dc513b"
+SRCREV_machine_qemux86-64 ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
+SRCREV_machine_qemumips64 ?= "dcd579737386fca4d7bcf224bc118b14eb3c1d55"
+SRCREV_machine ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
+SRCREV_meta ?= "a94680bfeb0e8e3025b57f8b42d0825ba743376b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


