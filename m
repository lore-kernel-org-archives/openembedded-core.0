Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 840B37123F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4clIq007794
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:47 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:47 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:18 -0400
Message-ID: <7db56df1056d04c9d57d1093c5a890ea541a0cc8.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/18] linux-yocto/3.14: vhost, vxland, openvswitch and block/bfq updates
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:47 -0000
Content-Type: text/plain

Updating the linux-yocto/3.14 SRCREVs to integrate more feature additions
and backports to the LTSI kernel base:

   42477caf6bfd block, bfq: add Early Queue Merge (EQM) to BFQ-v7r5 for 3.14.0
   349aa3f0848d block: introduce the BFQ-v7r5 I/O sched for 3.14
   121ed2738c47 block: cgroups, kconfig, build bits for BFQ-v7r5-3.14
   9925795a3e54 vhost-scsi: Include prot_bytes into expected data transfer length
   68fe340cb836 vhost: move memory pointer to VQs
   72fa27bcf526 vhost: move acked_features to VQs
   757680234478 vhost: replace rcu with mutex
   050c1440ac73 vhost-net: extend device allocation to vmalloc
   d68641313156 vhost/scsi: Enable T10 PI IOV -> SGL memory mapping
   fb89a8df7f1c vhost/scsi: Add T10 PI IOV -> SGL memory mapping logic
   5caf8475ee8a vhost/scsi: Add preallocation of protection SGLs
   c0785b9490a8 vhost/scsi: Move sanity check into vhost_scsi_map_iov_to_sgl
   bd947327cdf6 vhost: don't open-code sockfd_put()
   83fab2df94c6 openvswitch: Use exact lookup for flow_get and flow_del.
   9c185c40f7a8 openvswitch: Fix tracking of flags seen in TCP flows.
   0d2455332847 openvswitch: supply a dummy err_handler of gre_cisco_protocol to prevent kernel crash
   4513a2fd2703 openvswitch: Fix a double free bug for the sample action
   1acf10deff18 openvswitch: Simplify genetlink code.
   9ea6a4dea3f5 openvswitch: Minimize ovs_flow_cmd_new|set critical sections.
   9e76764432cf openvswitch: Split ovs_flow_cmd_new_or_set().
   7bafcd59a838 openvswitch: Minimize ovs_flow_cmd_del critical section.
   67980f929444 openvswitch: Reduce locking requirements.
   347f9442b559 openvswitch: Fix ovs_flow_stats_get/clear RCU dereference.
   c7aa7c522ec0 openvswitch: Fix typo.
   b244c7b19a55 openvswitch: Minimize dp and vport critical sections.
   21883a3ffdb6 openvswitch: Make flow mask removal symmetric.
   ffa173197cf5 openvswitch: Build flow cmd netlink reply only if needed.
   f3e8e5c07505 openvswitch: Clarify locking.
   df42a8f505c2 openvswitch: Avoid assigning a NULL pointer to flow actions.
   91b07542da22 openvswitch: Compact sw_flow_key.
   24bb1a576332 net/openvswitch: Use with RCU_INIT_POINTER(x, NULL) in vport-gre.c
   808868318939 openvswitch: Use TCP flags in the flow key for stats.
   a57851bae1cf openvswitch: Fix output of SCTP mask.
   8b70125106ee openvswitch: Per NUMA node flow stats.
   606497442f52 openvswitch: Remove 5-tuple optimization.
   01e74b175909 openvswitch: Use ether_addr_copy
   b5d02cfdc985 openvswitch: flow_netlink: Use pr_fmt to OVS_NLERR output
   4da9e8d176f9 openvswitch: Use net_ratelimit in OVS_NLERR
   ee8f673dd798 openvswitch: Added (unsigned long long) cast in printf
   b67f35f8b0aa openvswitch: avoid cast-qual warning in vport_priv
   3e01428f6e0c openvswitch: avoid warnings in vport_from_priv
   069ee359a487 openvswitch: use const in some local vars and casts
   cbec86356a89 vxlan: add x-netns support
   a51970560923 vxlan: ensure to advertise the right fdb remote
   696068dca072 vxlan: remove unused port variable in vxlan_udp_encap_recv()
   e94003f3b58d sched/deadline: Fix sched_yield() behavior

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 59918d77e1cf..4d26d3307cdc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH ?= "standard/preempt-rt/base"
 KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "77d54dcdf1e078290d88e85adbbe3f90d41f4c9e"
-SRCREV_machine_qemuppc ?= "ba132753cc6688c1c22d7147b02e434a3441833c"
-SRCREV_meta ?= "3c987080bc943b8eae37fb6672368bb74978e484"
+SRCREV_machine ?= "21561a4c2865f79bd3489087eed19b26839e33f1"
+SRCREV_machine_qemuppc ?= "61cd09f76a3632ccc02a9e471220f7b5fcb61b93"
+SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 34341d7a016a..ebb85058f33f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.13"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "d2f8bdb8818bf2b83ac75b6b5e8428be61242d19"
-SRCREV_meta ?= "3c987080bc943b8eae37fb6672368bb74978e484"
+SRCREV_machine ?= "42477caf6bfda5ca7439121d348e474cff44ab5c"
+SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 9f154b6775aa..f78699db0f2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "92de8060e113e4a13f16c6b4b5333f538e291c6d"
-SRCREV_machine_qemumips ?= "313647599dd3cd7f42374d918a9397f82eed36fb"
-SRCREV_machine_qemuppc ?= "45ef97bc22532a5a2d2fb94df3eec0aca27d0335"
-SRCREV_machine_qemux86 ?= "edec15a07d310c4368b8149496da0548b564a413"
-SRCREV_machine_qemux86-64 ?= "d2f8bdb8818bf2b83ac75b6b5e8428be61242d19"
-SRCREV_machine_qemumips64 ?= "474fc6753d80afbd4483ea5531b03bc5b9c1ac18"
-SRCREV_machine ?= "d2f8bdb8818bf2b83ac75b6b5e8428be61242d19"
-SRCREV_meta ?= "3c987080bc943b8eae37fb6672368bb74978e484"
+SRCREV_machine_qemuarm ?= "65c9b3a3996f541eb26e5918de0ce02ec81a36e2"
+SRCREV_machine_qemumips ?= "e6a4a3bd2e332e2d1b01b4008497775d1ccfea19"
+SRCREV_machine_qemuppc ?= "05e7be95eb9d48590cf7e8dea2538b927a8ba1c6"
+SRCREV_machine_qemux86 ?= "3270ea3cf75d58316913b42ea51ad85068a595de"
+SRCREV_machine_qemux86-64 ?= "42477caf6bfda5ca7439121d348e474cff44ab5c"
+SRCREV_machine_qemumips64 ?= "f2317d326cce17a7a595e0c346e0f15b1a1df981"
+SRCREV_machine ?= "42477caf6bfda5ca7439121d348e474cff44ab5c"
+SRCREV_meta ?= "ccad961c4cb6be245ed198bd2c17c27ab33cfcd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


