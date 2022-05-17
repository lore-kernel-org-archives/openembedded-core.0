Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61298C433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:24:57 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1200.1652811889056370112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EqCE1lhA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id i8so4149859plr.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EUF2NSrpC4tqm44caLke+ARdn1GMHGoAMDW4Jr495Rg=;
        b=EqCE1lhAqBhI6dcmj/82+EPOkj+5swL30I7PT1VbqmROeIMT14C/ouuTxtouCPuPas
         866uFhj2G30/otRyIOirWcqTYHC+y9UEsI1GDWILzI8CFzSgDHCZrvNN9vn9xWF3YHtN
         AR9QVzMvu8LWSrSg8OqhGa+qFbAIDYfSCeuF/GGLi8bs/vu/njXiEgPuAU7JF7ph/PIJ
         Ar9jw7y7BL51FgPd1TdJB3ptyK5wvp9tU+ONVXO0Xps03S2ZLfoZgOggJcrgq8dTQz4H
         g7mf1ErLLr5yRiTE8uCyhfGOCqZy+xPy0d9U8ep3SR01Q1Kwz4UxpIjrM7gA3HDwVcpR
         m1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EUF2NSrpC4tqm44caLke+ARdn1GMHGoAMDW4Jr495Rg=;
        b=sdMHDaUXabRwLkmuMj0CSIKtnu9roo0IgrdZKySEY+ihZv/fLnZC9Mznp4o5a692O7
         9HnZ7dDiXxD9pPmnv/Y3p06S6Io2SePU+wys2HeGTAVm/c7kk4aGtrog4/tmaB6b9iTx
         3w8hf4ic5dzUMB6ZH5tXUwL/ewWYH+BtyUdts5cv7PfPqpVoXsaKZD7zK45ah8WDW/uW
         /Vfwl0jjs9jS0C1W1U5GCh00fzDQM5RPuShqqRd/V30bgzt1M3l2v6XUVzM6cF55D3S6
         S79kZTDzKxQl2IcIVYBiG2VZhJP6/8gXxUay0htqqawMvaoLOW37ZeqpciegurcOdWYY
         9sWQ==
X-Gm-Message-State: AOAM533x+2ueYS0TfiL9xOn9CMutSa10wSbup6YKmxKgX0vWmpPNVUXx
	2cft5OCVK4GzWRG6zLPZOr8xyUVUEZsRMhhS
X-Google-Smtp-Source: 
 ABdhPJznT3Dv2td+NQBMait3WGA6CV0S0/HkkLOeRDoRrBLkllbToruH4l2UaxUJyE3+dF0FRtnjdQ==
X-Received: by 2002:a17:90b:1482:b0:1df:5b39:8a4 with SMTP id
 js2-20020a17090b148200b001df5b3908a4mr11358341pjb.233.1652811885852;
        Tue, 17 May 2022 11:24:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.24.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:24:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/31] systemd: upgrade 250.4 -> 250.5
Date: Tue, 17 May 2022 08:23:52 -1000
Message-Id: 
 <43e2cd211230ea32e4903f9891fda2e4b0f63cc4.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:24:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165751

From: Alexander Kanavin <alex.kanavin@gmail.com>

Latest stable branch update

Drop 0029-network-enable-KeepConfiguration-when-running-on-net.patch as
patch merged upstream.

Changes:

4a31fa2fb0 (tag: v250.5) hwdb: run "update-hwdb-autosuspend"
e92e2d0e3b hwdb: run "update-hwdb"
e1e4395775 hwdb: make sure "ninja update-hwdb" works on f35
1fe496fc3b hwdb: fix parser to work with newer pyparsing
32e7c65372 manager: prohibit clone3() in seccomp filters
45335a3eed nspawn: fix --ephemeral with --machine
79b86adcbd nspawn: fix locating config files with --ephemeral
c202d402d9 resolve: fix typo in dns_class_is_pseudo()
9f689fda54 sd-ipv4acd: actually drop the arp packet from one of the host interface
e3d57bc301 sd-event: make inotify event work after the process is forked
a5fc32fa34 sd-event: do not kill a child process from another child
c36ab05b4f sd-event: do not update signal fd after PID is changed
e006b56c18 sd-event: set pid to event source after all setup processes finished
d2e3b5a841 sd-event: rebreak comments
6673131917 core: fix dm-verity auto-discovery in MountImageUnit()
10ee46a2ca analyze: Fix verify exit status regression
df6253cbda hwdb: fix parsing options
9727b9ee7b core: command argument can be longer than PATH_MAX
12f05b856c network: ignore all errors in loading .network files
b5dfdf0301 analyze: fix offline check for syscal filter
8ed1490de6 analyze: fix offline check for 'native' syscall architecture
72d0c6b171 missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
bba396d78c journal-remote: refuse to specify --trust option when gnutls is disabled
8d4c0d2383 calendarspec: fix possibly skips next elapse
d9ea8dab6d copy: use FLAGS_SET() in copy_xattr()
077ca08b38 journal: preserve acls when rotating user journals with NOCOW attribute set
25b3c48ec5 macro: account for negative values in DECIMAL_STR_WIDTH()
8f2f6a94d8 network: enable KeepConfiguration= when running on network filesystem
61649fbada stat-util: introduce path_is_network_fs()
3f6e62eccb network-generator: rename DHCP_TYPE_DHCP -> DHCP_TYPE_DHCP4
a7585a3a38 hwdb: Add AV production access to Elgado Stream Deck devices
18c0096ec2 Add AV production controllers to hwdb and add uaccess
2298094b2c packit: drop bfq patch
7cda67d4f4 packit: build on and use Fedora 36 spec file
056bae9f1b Packit: build SRPMs in Copr
6253eb576c journal-file: if we are going down, don't use event loop to schedule post
c901bc8680 journald: make sure SIGTERM handling doesn't get starved out
ed46ff2bd6 random-seed: hash together old seed and new seed before writing out file
6d3e2f0188 resolved: Allow test-resolved-stream to run concurrently
781b2b2e66 resolved: Read as much as possible per stream EPOLLIN event
03692af607 resolved: Avoid multiple SSL writes per DoT packet
3227f542a7 resolved: Make event flags logic robust for DoT
9c710c66c3 resolve: llmnr: fix never hit condition
d65808ef7e resolve: mention that dns_stream_update() needs to be called after dns_stream_take_read_packet()
b2f82f643a resolve: call dns_stream_take_read_packet() in on_stream_io()
fe4c208c98 resolve: make dns_stream_new() take on_packet and complete callbacks
f447648ae4 resolved: Test for DnsStream (plain TCP DNS and DoT)
88b4e8f74e resolved: Fix DoT timeout on multiple answer records
d5b871bdfe test: increase image size
c3aead5568 random-util: unify RANDOM_ALLOW_INSECURE and !RANDOM_BLOCK and simplify

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e07ba76fc78b44f338e574644a8ae3b6cddc9f08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...md-boot_250.4.bb => systemd-boot_250.5.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 .../0001-Adjust-for-musl-headers.patch        |  98 ++++++-
 ...ass-correct-parameters-to-getdents64.patch |  10 +-
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   8 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch |  20 +-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |  10 +-
 ...k-parse_printf_format-implementation.patch |  20 +-
 ...missing.h-check-for-missing-strndupa.patch | 151 +++++++++--
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  12 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |  17 +-
 ..._register_atfork-for-non-glibc-build.patch |   6 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  16 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   4 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  18 +-
 ...patible-basename-for-non-glibc-syste.patch |   4 +-
 ...uffering-when-writing-to-oom_score_a.patch |   4 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  10 +-
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |   4 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch |   4 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |   6 +-
 .../0021-test-json.c-define-M_PIl.patch       |   4 +-
 ...-not-disable-buffer-in-writing-files.patch | 239 ++++++++++-------
 .../0025-Handle-__cpu_mask-usage.patch        |   4 +-
 .../systemd/0026-Handle-missing-gshadow.patch |  16 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  11 +-
 ...eepConfiguration-when-running-on-net.patch | 253 ------------------
 .../{systemd_250.4.bb => systemd_250.5.bb}    |   1 -
 30 files changed, 499 insertions(+), 457 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_250.4.bb => systemd-boot_250.5.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0029-network-enable-KeepConfiguration-when-running-on-net.patch
 rename meta/recipes-core/systemd/{systemd_250.4.bb => systemd_250.5.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_250.4.bb b/meta/recipes-core/systemd/systemd-boot_250.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_250.4.bb
rename to meta/recipes-core/systemd/systemd-boot_250.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ac454b8afd..309105290f 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c3aead556847dd2694d559620123b65ff16afe8c"
+SRCREV = "4a31fa2fb040005b73253da75cf84949b8485175"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
index 2363679c98..c42c66786f 100644
--- a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
@@ -1,4 +1,4 @@
-From 4c2e932664ec67662f4a0306cca4a7cd82853bda Mon Sep 17 00:00:00 2001
+From 9a1841402ce3ef21a10a7314a07a615f8196d406 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
 Subject: [PATCH] Adjust for musl headers
@@ -6,6 +6,7 @@ Subject: [PATCH] Adjust for musl headers
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/libsystemd-network/sd-dhcp6-client.c      | 2 +-
  src/network/netdev/bareudp.c                  | 2 +-
@@ -29,6 +30,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/network/netdev/vrf.c                      | 2 +-
  src/network/netdev/vxcan.c                    | 2 +-
  src/network/netdev/vxlan.c                    | 2 +-
+ src/network/netdev/wireguard.c                | 2 +-
  src/network/netdev/xfrm.c                     | 2 +-
  src/network/networkd-bridge-mdb.c             | 4 ++--
  src/network/networkd-dhcp-common.c            | 3 ++-
@@ -41,8 +43,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/shared/linux/ethtool.h                    | 3 ++-
  src/shared/netif-util.c                       | 2 +-
  src/udev/udev-builtin-net_id.c                | 2 +-
- 34 files changed, 41 insertions(+), 39 deletions(-)
+ 35 files changed, 42 insertions(+), 40 deletions(-)
 
+diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
+index 84bc739bba..ff8cb6bf9d 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,7 @@
@@ -54,6 +58,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if_infiniband.h>
  
  #include "sd-dhcp6-client.h"
+diff --git a/src/network/netdev/bareudp.c b/src/network/netdev/bareudp.c
+index 8ff0eb1360..7e06b8d57d 100644
 --- a/src/network/netdev/bareudp.c
 +++ b/src/network/netdev/bareudp.c
 @@ -2,7 +2,7 @@
@@ -65,6 +71,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "bareudp.h"
  #include "netlink-util.h"
+diff --git a/src/network/netdev/batadv.c b/src/network/netdev/batadv.c
+index 15f3aee3a6..ec76428436 100644
 --- a/src/network/netdev/batadv.c
 +++ b/src/network/netdev/batadv.c
 @@ -3,7 +3,7 @@
@@ -76,6 +84,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "batadv.h"
  #include "fileio.h"
+diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
+index 5d94aa1d68..4e379a326d 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,7 +1,7 @@
@@ -87,6 +97,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "alloc-util.h"
  #include "bond.h"
+diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
+index b974f2ae0a..9a5f18d556 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -2,7 +2,7 @@
@@ -98,6 +110,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if_bridge.h>
  
  #include "bridge.h"
+diff --git a/src/network/netdev/dummy.c b/src/network/netdev/dummy.c
+index 00df1d2787..77b506b422 100644
 --- a/src/network/netdev/dummy.c
 +++ b/src/network/netdev/dummy.c
 @@ -1,6 +1,6 @@
@@ -108,6 +122,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "dummy.h"
  
+diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
+index 224c17e979..fb79cc13f6 100644
 --- a/src/network/netdev/geneve.c
 +++ b/src/network/netdev/geneve.c
 @@ -2,7 +2,7 @@
@@ -119,6 +135,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "alloc-util.h"
  #include "conf-parser.h"
+diff --git a/src/network/netdev/ifb.c b/src/network/netdev/ifb.c
+index d7ff44cb9e..e037629ae4 100644
 --- a/src/network/netdev/ifb.c
 +++ b/src/network/netdev/ifb.c
 @@ -1,7 +1,7 @@
@@ -130,6 +148,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "ifb.h"
  
+diff --git a/src/network/netdev/ipoib.c b/src/network/netdev/ipoib.c
+index e0ff9e8c62..ab085c1f6d 100644
 --- a/src/network/netdev/ipoib.c
 +++ b/src/network/netdev/ipoib.c
 @@ -1,6 +1,6 @@
@@ -140,6 +160,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if_link.h>
  
  #include "ipoib.h"
+diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
+index d15766cd7b..60728b4f94 100644
 --- a/src/network/netdev/ipvlan.c
 +++ b/src/network/netdev/ipvlan.c
 @@ -2,7 +2,7 @@
@@ -151,6 +173,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "conf-parser.h"
  #include "ipvlan.h"
+diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
+index f1a566a9ca..1f37927a83 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,7 +1,7 @@
@@ -162,6 +186,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if_ether.h>
  #include <linux/if_macsec.h>
  #include <linux/genetlink.h>
+diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.c
+index c41be6e78f..ee2660c5bf 100644
 --- a/src/network/netdev/macvlan.c
 +++ b/src/network/netdev/macvlan.c
 @@ -2,7 +2,7 @@
@@ -173,6 +199,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "conf-parser.h"
  #include "macvlan.h"
+diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
+index 8e7fe11c18..701ab2bd69 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -2,7 +2,7 @@
@@ -184,6 +212,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <unistd.h>
  
  #include "alloc-util.h"
+diff --git a/src/network/netdev/netdevsim.c b/src/network/netdev/netdevsim.c
+index 15d5c132f9..a3ffa48b15 100644
 --- a/src/network/netdev/netdevsim.c
 +++ b/src/network/netdev/netdevsim.c
 @@ -1,6 +1,6 @@
@@ -194,6 +224,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "netdevsim.h"
  
+diff --git a/src/network/netdev/nlmon.c b/src/network/netdev/nlmon.c
+index ff372092e6..eef66811f4 100644
 --- a/src/network/netdev/nlmon.c
 +++ b/src/network/netdev/nlmon.c
 @@ -1,6 +1,6 @@
@@ -204,6 +236,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "nlmon.h"
  
+diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
+index 97e534fe99..0302c1cb94 100644
 --- a/src/network/netdev/tunnel.c
 +++ b/src/network/netdev/tunnel.c
 @@ -2,7 +2,7 @@
@@ -215,6 +249,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if_tunnel.h>
  #include <linux/ip.h>
  #include <linux/ip6_tunnel.h>
+diff --git a/src/network/netdev/vcan.c b/src/network/netdev/vcan.c
+index 380547ee1e..137c1adf8a 100644
 --- a/src/network/netdev/vcan.c
 +++ b/src/network/netdev/vcan.c
 @@ -1,6 +1,6 @@
@@ -225,6 +261,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "vcan.h"
  
+diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
+index c946e81fc0..d1a6be73f9 100644
 --- a/src/network/netdev/veth.c
 +++ b/src/network/netdev/veth.c
 @@ -3,7 +3,7 @@
@@ -236,6 +274,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/veth.h>
  
  #include "netlink-util.h"
+diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
+index af3e77963e..efa4b0a164 100644
 --- a/src/network/netdev/vlan.c
 +++ b/src/network/netdev/vlan.c
 @@ -2,7 +2,7 @@
@@ -247,6 +287,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if_vlan.h>
  
  #include "parse-util.h"
+diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
+index b1b6707441..1c6d1982e1 100644
 --- a/src/network/netdev/vrf.c
 +++ b/src/network/netdev/vrf.c
 @@ -2,7 +2,7 @@
@@ -258,6 +300,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "vrf.h"
  
+diff --git a/src/network/netdev/vxcan.c b/src/network/netdev/vxcan.c
+index a0ba048eb1..875f2e5901 100644
 --- a/src/network/netdev/vxcan.c
 +++ b/src/network/netdev/vxcan.c
 @@ -1,7 +1,7 @@
@@ -269,6 +313,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "vxcan.h"
  
+diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
+index 30b0855598..a065158801 100644
 --- a/src/network/netdev/vxlan.c
 +++ b/src/network/netdev/vxlan.c
 @@ -2,7 +2,7 @@
@@ -280,6 +326,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "conf-parser.h"
  #include "alloc-util.h"
+diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wireguard.c
+index 88f668753a..5fc753384b 100644
+--- a/src/network/netdev/wireguard.c
++++ b/src/network/netdev/wireguard.c
+@@ -6,7 +6,7 @@
+ #include <sys/ioctl.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/ipv6_route.h>
+ 
+ #include "sd-resolve.h"
+diff --git a/src/network/netdev/xfrm.c b/src/network/netdev/xfrm.c
+index ef5e735b2b..419afd75f2 100644
 --- a/src/network/netdev/xfrm.c
 +++ b/src/network/netdev/xfrm.c
 @@ -1,6 +1,6 @@
@@ -290,6 +351,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "missing_network.h"
  #include "xfrm.h"
+diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-bridge-mdb.c
+index 10025a97ae..a0239ea83a 100644
 --- a/src/network/networkd-bridge-mdb.c
 +++ b/src/network/networkd-bridge-mdb.c
 @@ -1,7 +1,5 @@
@@ -309,6 +372,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
  
+diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
+index 7996960bd1..e870b9ba26 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -321,6 +386,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "bus-error.h"
  #include "dhcp-identifier.h"
+diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/network/networkd-dhcp-prefix-delegation.c
+index 7be9713d46..e830fcd575 100644
 --- a/src/network/networkd-dhcp-prefix-delegation.c
 +++ b/src/network/networkd-dhcp-prefix-delegation.c
 @@ -1,7 +1,5 @@
@@ -340,6 +407,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  bool link_dhcp_pd_is_enabled(Link *link) {
          assert(link);
  
+diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
+index 9acfd17d49..3108289602 100644
 --- a/src/network/networkd-dhcp-server.c
 +++ b/src/network/networkd-dhcp-server.c
 @@ -1,7 +1,7 @@
@@ -351,6 +420,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if.h>
  
  #include "sd-dhcp-server.h"
+diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
+index cb9c428ae9..a35d58f3f1 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -3,7 +3,7 @@
@@ -362,6 +433,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "alloc-util.h"
  #include "dhcp-client-internal.h"
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index b62a154828..75949e6094 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -3,7 +3,7 @@
@@ -373,6 +446,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if_link.h>
  #include <linux/netdevice.h>
  #include <sys/socket.h>
+diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
+index ee7a535075..ce6ed64133 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,9 +1,5 @@
@@ -396,6 +471,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int route_new(Route **ret) {
          _cleanup_(route_freep) Route *route = NULL;
  
+diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink.c
+index e00cc1e589..e392c7e1a2 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -2,7 +2,7 @@
@@ -407,6 +484,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/if_bridge.h>
  
  #include "missing_network.h"
+diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
+index 974d4292e7..fe9b8a9e07 100644
 --- a/src/shared/linux/ethtool.h
 +++ b/src/shared/linux/ethtool.h
 @@ -16,7 +16,8 @@
@@ -419,6 +498,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #ifndef __KERNEL__
  #include <limits.h> /* for INT_MAX */
+diff --git a/src/shared/netif-util.c b/src/shared/netif-util.c
+index 603d4de109..7e3531808a 100644
 --- a/src/shared/netif-util.c
 +++ b/src/shared/netif-util.c
 @@ -1,6 +1,6 @@
@@ -429,6 +510,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #include "arphrd-util.h"
  #include "device-util.h"
+diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
+index 65e003eb15..0b3dc04be0 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
 @@ -18,7 +18,7 @@
@@ -440,14 +523,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <linux/netdevice.h>
  #include <linux/pci_regs.h>
  
---- a/src/network/netdev/wireguard.c
-+++ b/src/network/netdev/wireguard.c
-@@ -6,7 +6,7 @@
- #include <sys/ioctl.h>
- #include <net/if.h>
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/ipv6_route.h>
- 
- #include "sd-resolve.h"
diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
index 03a29b5327..028f50b243 100644
--- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
@@ -1,7 +1,7 @@
-From fbc10748c7c59d82024a4d35146b8dfef8d52927 Mon Sep 17 00:00:00 2001
+From 8c8899b4641125cfe8e7baee32e5c5f452545d2c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
-Subject: [PATCH 1/2] pass correct parameters to getdents64
+Subject: [PATCH] pass correct parameters to getdents64
 
 Fixes
 ../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct dirent *' [-Werror,-Wincompatible-pointer-types]
@@ -14,6 +14,7 @@ Fixes
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/basic/recurse-dir.c | 2 +-
  src/basic/stat-util.c   | 2 +-
@@ -33,7 +34,7 @@ index efa1797b7b..797285e3be 100644
                          return -errno;
                  if (n == 0)
 diff --git a/src/basic/stat-util.c b/src/basic/stat-util.c
-index efac7b002e..9e1fe7f5a0 100644
+index c2269844f8..7cd6c7fa42 100644
 --- a/src/basic/stat-util.c
 +++ b/src/basic/stat-util.c
 @@ -99,7 +99,7 @@ int dir_is_empty_at(int dir_fd, const char *path) {
@@ -45,6 +46,3 @@ index efac7b002e..9e1fe7f5a0 100644
          if (n < 0)
                  return -errno;
  
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
index 7dfa1a0df2..15413d7a0b 100644
--- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
+++ b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
@@ -1,13 +1,14 @@
-From d16f7b37c917b91e951b9313e2c8264c72ed93e5 Mon Sep 17 00:00:00 2001
+From 4b731a5e2547b5292f9a774b849e14c0cf7b3955 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:17:37 -0800
-Subject: [PATCH 2/2] Add sys/stat.h for S_IFDIR
+Subject: [PATCH] Add sys/stat.h for S_IFDIR
 
 ../git/src/shared/mkdir-label.c:13:61: error: use of undeclared identifier 'S_IFDIR'
         r = mac_selinux_create_file_prepare_at(dirfd, path, S_IFDIR);
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/shared/mkdir-label.c | 1 +
  1 file changed, 1 insertion(+)
@@ -24,6 +25,3 @@ index d36a6466d7..63b764cd83 100644
  
  int mkdirat_label(int dirfd, const char *path, mode_t mode) {
          int r;
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 5027682df2..d109860e1a 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,4 +1,4 @@
-From 5d730902f47498a2866b46875352f6810a01d67c Mon Sep 17 00:00:00 2001
+From c542d2d93cf536e91d4edb8791fdc0de732b0a52 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
 Subject: [PATCH] don't use glibc-specific qsort_r
@@ -19,9 +19,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/shared/hwdb-util.c    | 19 ++++++++++++++-----
  3 files changed, 38 insertions(+), 31 deletions(-)
 
+diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
+index 02a6784d99..cb448df109 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
-@@ -61,18 +61,4 @@ static inline void _qsort_safe(void *bas
+@@ -61,18 +61,4 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, comparison
                  _qsort_safe((p), (n), sizeof((p)[0]), (comparison_fn_t) _func_); \
          })
  
@@ -40,9 +42,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 -        })
 -
  int cmp_int(const int *a, const int *b);
+diff --git a/src/shared/format-table.c b/src/shared/format-table.c
+index b95680b365..5ffa208615 100644
 --- a/src/shared/format-table.c
 +++ b/src/shared/format-table.c
-@@ -1324,30 +1324,32 @@ static int cell_data_compare(TableData *
+@@ -1324,30 +1324,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
          return CMP(index_a, index_b);
  }
  
@@ -99,7 +103,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          }
  
          if (t->display_map)
-@@ -2647,7 +2654,12 @@ int table_to_json(Table *t, JsonVariant
+@@ -2647,7 +2654,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
                  for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -113,9 +117,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          }
  
          if (t->display_map)
+diff --git a/src/shared/hwdb-util.c b/src/shared/hwdb-util.c
+index fe4785f3e5..827e1639c3 100644
 --- a/src/shared/hwdb-util.c
 +++ b/src/shared/hwdb-util.c
-@@ -127,9 +127,13 @@ static struct trie* trie_free(struct tri
+@@ -127,9 +127,13 @@ static struct trie* trie_free(struct trie *trie) {
  
  DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
  
@@ -132,7 +138,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  }
  
  static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -157,7 +161,10 @@ static int trie_node_add_value(struct tr
+@@ -157,7 +161,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
                          .value_off = v,
                  };
  
@@ -144,7 +150,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
                  if (val) {
                          /* At this point we have 2 identical properties on the same match-string.
                           * Since we process files in order, we just replace the previous value. */
-@@ -183,7 +190,9 @@ static int trie_node_add_value(struct tr
+@@ -183,7 +190,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
                  .line_number = line_number,
          };
          node->values_count++;
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index f3edc7d82b..18fcc6e48c 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,4 +1,4 @@
-From 3b42a888685aee1776a12cff84a5fe0063378483 Mon Sep 17 00:00:00 2001
+From a4f51ef07375466f79cb148ff1178ed11f808f0a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
@@ -21,6 +21,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  src/libsystemd/sd-journal/catalog.c | 1 +
  4 files changed, 12 insertions(+)
 
+diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
+index f6233090a9..aeaf6ad5ec 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
 @@ -10,3 +10,12 @@
@@ -36,6 +38,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 +#define __COMPAR_FN_T
 +typedef int (*__compar_fn_t)(const void *, const void *);
 +#endif
+diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
+index cb448df109..fd738a65ab 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -4,6 +4,7 @@
@@ -46,6 +50,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  /* This is the same as glibc's internal __compar_d_fn_t type. glibc exports a public comparison_fn_t, for the
   * external type __compar_fn_t, but doesn't do anything similar for __compar_d_fn_t. Let's hence do that
+diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
+index d054668b8e..d3bf55acbe 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -10,6 +10,7 @@
@@ -56,6 +62,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  #if HAVE_KMOD
  #include "module-util.h"
+diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-journal/catalog.c
+index 8fc87b131a..36a6efdbd8 100644
 --- a/src/libsystemd/sd-journal/catalog.c
 +++ b/src/libsystemd/sd-journal/catalog.c
 @@ -28,6 +28,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index d93f630752..1bd538b0c0 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From 3e0df2c22bfd37bc62bf09a01ec498e40d3599de Mon Sep 17 00:00:00 2001
+From 3d9910dcda697b1e361bba49c99050ee0d116742 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
@@ -22,6 +22,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
 
+diff --git a/meson.build b/meson.build
+index cb9936ee8b..ae53345260 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -686,6 +686,7 @@ endif
@@ -32,9 +34,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                    'sys/auxv.h',
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
+diff --git a/src/basic/meson.build b/src/basic/meson.build
+index 49e1e7f43e..4131494bfa 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -335,6 +335,11 @@ endforeach
+@@ -334,6 +334,11 @@ endforeach
  
  basic_sources += generated_gperf_headers
  
@@ -46,6 +50,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  ############################################################
  
  arch_list = [
+diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
+new file mode 100644
+index 0000000000..49437e5445
 --- /dev/null
 +++ b/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
@@ -322,6 +329,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 +
 +        return last;
 +}
+diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
+new file mode 100644
+index 0000000000..47be7522d7
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -382,6 +392,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 +size_t parse_printf_format(const char *fmt, size_t n, int *types);
 +
 +#endif /* HAVE_PRINTF_H */
+diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
+index 69d7062ec6..f55c5aab2c 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,13 +1,13 @@
@@ -399,6 +411,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  
  #define snprintf_ok(buf, len, fmt, ...)                                \
          ({                                                             \
+diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
+index 1e10ed5524..e6ceba54f9 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -2,7 +2,6 @@
@@ -409,7 +423,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  #include <stddef.h>
  #include <sys/un.h>
  #include <unistd.h>
-@@ -21,6 +20,7 @@
+@@ -25,6 +24,7 @@
  #include "stdio-util.h"
  #include "string-util.h"
  #include "tmpfile-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 36545c2f60..4b1fac06b5 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From cef23a651ea200e30e1e6ed2a2564505e3a42d46 Mon Sep 17 00:00:00 2001
+From 55d48dd81e57add5b2d4b5a7d697c575a0f37ef5 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -41,6 +41,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/core/kmod-setup.c                      |  1 +
  src/core/service.c                         |  1 +
  src/coredump/coredump-vacuum.c             |  1 +
+ src/fstab-generator/fstab-generator.c      |  1 +
  src/journal-remote/journal-remote-main.c   |  1 +
  src/journal/journalctl.c                   |  1 +
  src/libsystemd/sd-bus/bus-message.c        |  1 +
@@ -70,11 +71,13 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-builtin-path_id.c            |  1 +
  src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 51 files changed, 62 insertions(+)
+ 52 files changed, 63 insertions(+)
 
+diff --git a/meson.build b/meson.build
+index ae53345260..8c8a6c9bdf 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -507,6 +507,7 @@ foreach ident : ['secure_getenv', '__sec
+@@ -507,6 +507,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
  endforeach
  
  foreach ident : [
@@ -82,6 +85,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          ['memfd_create',      '''#include <sys/mman.h>'''],
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
+diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
+index 5a3095cbba..22cfa4d526 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -92,6 +97,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int help(void) {
          _cleanup_free_ char *link = NULL;
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index a626ecf2e2..f7dc6c8421 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -37,6 +37,7 @@
@@ -102,6 +109,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
+diff --git a/src/basic/env-util.c b/src/basic/env-util.c
+index 885967e7f3..d0b7dc845e 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -19,6 +19,7 @@
@@ -112,6 +121,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
+diff --git a/src/basic/log.c b/src/basic/log.c
+index 12071e2ebd..15254c7bbc 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -122,6 +133,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define SNDBUF_SIZE (8*1024*1024)
  
+diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
+index 8c76f93eb2..9068bfb4f0 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -140,6 +153,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 51a0d74e87..03569f71f8 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -15,6 +15,7 @@
@@ -150,6 +165,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int mkdir_safe_internal(
                  const char *path,
+diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
+index 82a33a6829..d947774b40 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -13,6 +13,7 @@
@@ -160,6 +177,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "mountpoint-util.h"
  #include "nulstr-util.h"
  #include "parse-util.h"
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index 2888ab6523..d941afec2d 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -18,6 +18,7 @@
@@ -170,6 +189,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int parse_boolean(const char *v) {
          if (!v)
+diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
+index 6fb8c40e7a..c4b59e8518 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -16,6 +16,7 @@
@@ -180,6 +201,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
+diff --git a/src/basic/percent-util.c b/src/basic/percent-util.c
+index cab9d0eaea..5f6ca258e9 100644
 --- a/src/basic/percent-util.c
 +++ b/src/basic/percent-util.c
 @@ -3,6 +3,7 @@
@@ -190,6 +213,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int parse_parts_value_whole(const char *p, const char *symbol) {
          const char *pc, *n;
+diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
+index 410b8a3eb5..f2c4355609 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -200,6 +225,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int proc_cmdline(char **ret) {
          const char *e;
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index 65f96abb06..e485a0196b 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -12,6 +12,7 @@
@@ -210,6 +237,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int procfs_get_pid_max(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index b659d6905d..020112be24 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -26,6 +26,7 @@
@@ -220,6 +249,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static clockid_t map_clock_id(clockid_t c) {
  
+diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
+index 9e4b0d1f72..d640316ff7 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -19,6 +19,7 @@
@@ -230,6 +261,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static char **arg_path = NULL;
  
+diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
+index f0d8759e85..b4c1053e64 100644
+--- a/src/core/dbus-cgroup.c
++++ b/src/core/dbus-cgroup.c
+@@ -21,6 +21,7 @@
+ #include "parse-util.h"
+ #include "path-util.h"
+ #include "percent-util.h"
++#include "missing_stdlib.h"
+ #include "socket-util.h"
+ 
+ BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
+diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
+index 5c499e5d06..e7ab1bb9a5 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -44,6 +44,7 @@
@@ -240,6 +285,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
+diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
+index 32a2ec0ff9..36be2511e4 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -9,6 +9,7 @@
@@ -250,6 +297,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
+diff --git a/src/core/execute.c b/src/core/execute.c
+index 0b20d386d3..fccfb9268c 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -102,6 +102,7 @@
@@ -260,6 +309,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
+diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
+index d3bf55acbe..63dd807b8a 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -270,6 +321,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #if HAVE_KMOD
  #include "module-util.h"
+diff --git a/src/core/service.c b/src/core/service.c
+index 87f0d34c8c..ccda3feb29 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -42,6 +42,7 @@
@@ -280,6 +333,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
+diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
+index dcf9cc03cd..8f8d992ec2 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -16,6 +16,7 @@
@@ -290,6 +345,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
+diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator/fstab-generator.c
+index 9b32383a76..f8d3397a06 100644
+--- a/src/fstab-generator/fstab-generator.c
++++ b/src/fstab-generator/fstab-generator.c
+@@ -29,6 +29,7 @@
+ #include "util.h"
+ #include "virt.h"
+ #include "volatile-util.h"
++#include "missing_stdlib.h"
+ 
+ typedef enum MountPointFlags {
+         MOUNT_NOAUTO    = 1 << 0,
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index 3e3646e45f..6a8fc60f6d 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -24,6 +24,7 @@
@@ -300,6 +369,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
+diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
+index 3c4a7c0a7a..6a792404f2 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -73,6 +73,7 @@
@@ -310,6 +381,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
+diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
+index 96529b422b..ddb5e9c698 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -20,6 +20,7 @@
@@ -320,6 +393,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index 28d8336718..5d3ce88a53 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -12,6 +12,7 @@
@@ -330,6 +405,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
+diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
+index 14951ccb33..b7f86ca501 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -28,6 +28,7 @@
@@ -340,6 +417,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define SNDBUF_SIZE (8*1024*1024)
  
+diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
+index 9e1d29cc1d..8c3165f0ce 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -43,6 +43,7 @@
@@ -350,6 +429,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
+diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
+index 317653bedc..d028216c48 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -360,6 +441,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define MAX_SIZE (2*1024*1024)
  
+diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
+index 7a6cc4aca3..b7f7cd65c5 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -41,6 +41,7 @@
@@ -370,6 +453,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define JOURNAL_FILES_MAX 7168
  
+diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
+index 10d2ed7aec..4fbe3f6b4a 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -24,6 +24,7 @@
@@ -380,6 +465,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
+diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
+index 5bd7efc3e8..282899601e 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -31,6 +31,7 @@
@@ -390,6 +477,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
+diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
+index 063ad08d80..f9823a433b 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -400,6 +489,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /*
    # .network
+diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
+index 1f58bf3ed4..8457a3b0e3 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -17,6 +17,7 @@
@@ -410,6 +501,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  Settings *settings_new(void) {
          Settings *s;
+diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
+index c64e79bdff..eda26b0b9a 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -21,6 +21,7 @@
@@ -420,6 +513,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static void setup_logging_once(void) {
          static pthread_once_t once = PTHREAD_ONCE_INIT;
+diff --git a/src/portable/portable.c b/src/portable/portable.c
+index 0e6461ba93..54148d5924 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -39,6 +39,7 @@
@@ -430,6 +525,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /* Markers used in the first line of our 20-portable.conf unit file drop-in to determine, that a) the unit file was
   * dropped there by the portable service logic and b) for which image it was dropped there. */
+diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
+index 5b3ceeff36..d36d1d57ae 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -43,6 +43,7 @@
@@ -440,6 +537,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
+diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
+index 8b4f66b22e..5926e4c61b 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -450,6 +549,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_property_get_bool(
                  sd_bus *bus,
+diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
+index 87c0334fec..402ab3493b 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -10,6 +10,7 @@
@@ -460,6 +561,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  struct CGroupInfo {
          char *cgroup_path;
+diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
+index dcce530c99..faf5a5bda0 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -49,6 +49,7 @@
@@ -470,6 +573,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
+diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
+index 4a2b7684bc..ee6d687c58 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -480,6 +585,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
+diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
+index f54b187a1b..299758c7e4 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -17,6 +17,7 @@
@@ -490,6 +597,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
+diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
+index c6caf9330a..ebe33bd44a 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -15,6 +15,7 @@
@@ -500,6 +609,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
+diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
+index cf83eb6bca..e672a003a3 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -42,6 +42,7 @@
@@ -510,6 +621,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index f75ef62d2d..530001a821 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -26,6 +26,7 @@
@@ -520,6 +633,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static pid_t pager_pid = 0;
  
+diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
+index 2c07a1b7a8..2a9d6ef4ab 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -530,6 +645,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
+diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
+index 7e9ab19666..56f619e54e 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -540,6 +657,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define BUFFER_SIZE (256 * 1024)
  
+diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
+index cc9a7cb838..a679614a47 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -7,6 +7,7 @@
@@ -550,6 +669,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "tests.h"
  
  TEST(hexchar) {
+diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
+index ae92e45205..1e6f3205cb 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -560,6 +681,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
+diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
+index a60e4f294c..571c43765b 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -35,6 +35,7 @@
@@ -570,6 +693,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  typedef struct Spawn {
          sd_device *device;
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index 1a384d6b38..0089833e3f 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -34,6 +34,7 @@
@@ -580,23 +705,3 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
---- a/src/core/dbus-cgroup.c
-+++ b/src/core/dbus-cgroup.c
-@@ -21,6 +21,7 @@
- #include "parse-util.h"
- #include "path-util.h"
- #include "percent-util.h"
-+#include "missing_stdlib.h"
- #include "socket-util.h"
- 
- BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
---- a/src/fstab-generator/fstab-generator.c
-+++ b/src/fstab-generator/fstab-generator.c
-@@ -29,6 +29,7 @@
- #include "util.h"
- #include "virt.h"
- #include "volatile-util.h"
-+#include "missing_stdlib.h"
- 
- typedef enum MountPointFlags {
-         MOUNT_NOAUTO    = 1 << 0,
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 846c01bd4f..b84fbaa67e 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From fb068403b25002156435350165ea418a6338a313 Mon Sep 17 00:00:00 2001
+From 74c664bcd6b9a5fcf3466310c07f608d12456f7f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
@@ -23,6 +23,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/tmpfiles/tmpfiles.c   | 10 ++++++++++
  3 files changed, 38 insertions(+)
 
+diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
+index e026b29478..815e56ef68 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
 @@ -12,6 +12,12 @@
@@ -46,7 +48,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flag
+@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -61,6 +63,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (k == GLOB_NOMATCH)
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
+diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
+index ec8b74f48f..d99a6095df 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
 @@ -13,6 +13,12 @@
@@ -110,6 +114,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          assert_se(r == GLOB_NOMATCH);
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index fcab51c208..fdef1807ae 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -67,6 +67,12 @@
@@ -135,7 +141,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          };
          int r = 0, k;
          char **fn;
-@@ -1981,7 +1989,9 @@ static int glob_item(Item *i, action_t a
+@@ -1981,7 +1989,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 57e18a5808..59bd81c76f 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From 7ca9887f84adba065dc2e59b3de55ace2fc72ec0 Mon Sep 17 00:00:00 2001
+From a0450f7909348e7ff1d58adc0aee4119a0519c1f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
@@ -12,13 +12,16 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 ---
- src/basic/missing_type.h | 20 ++++++++++++++++++++
- src/shared/mount-setup.c |  1 +
- 2 files changed, 21 insertions(+)
+ src/basic/missing_type.h    | 20 ++++++++++++++++++++
+ src/shared/mount-setup.c    |  1 +
+ src/test/test-recurse-dir.c |  1 +
+ 3 files changed, 22 insertions(+)
 
+diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
+index aeaf6ad5ec..3df1084ef2 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
-@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const voi
+@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
  #define __COMPAR_FN_T
  typedef int (*__compar_fn_t)(const void *, const void *);
  #endif
@@ -42,6 +45,8 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 +#ifndef FTW_SKIP_SIBLINGS
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
+diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c
+index 7917968497..cc3d5baaab 100644
 --- a/src/shared/mount-setup.c
 +++ b/src/shared/mount-setup.c
 @@ -32,6 +32,7 @@
@@ -52,6 +57,8 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  
  typedef enum MountMode {
          MNT_NONE           = 0,
+diff --git a/src/test/test-recurse-dir.c b/src/test/test-recurse-dir.c
+index 2c2120b136..bc60a178a2 100644
 --- a/src/test/test-recurse-dir.c
 +++ b/src/test/test-recurse-dir.c
 @@ -6,6 +6,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 0fc320420e..1fb84c7090 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,4 +1,4 @@
-From c7453b716ae308b89cf4b2b231a36ddd38a49752 Mon Sep 17 00:00:00 2001
+From 3ca0920429f7eaf8c59f9ac8afd30a43b83d95ed Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
 Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
@@ -12,7 +12,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 461bbfe9a5..2d06f9f60a 100644
+index c971852158..df6e85b1fc 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -18,6 +18,9 @@
@@ -25,7 +25,7 @@ index 461bbfe9a5..2d06f9f60a 100644
  
  #include "alloc-util.h"
  #include "architecture.h"
-@@ -1202,11 +1205,15 @@ void reset_cached_pid(void) {
+@@ -1161,11 +1164,15 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index 029f413aa8..3a47d09e8a 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From 856010e268a6aca8e5f02502457afe289bd877f1 Mon Sep 17 00:00:00 2001
+From 48a791aae7a47a2a08e9e60c18054071a43b8cda Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
@@ -27,9 +27,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/core/execute.c      |  4 ++--
  3 files changed, 9 insertions(+), 15 deletions(-)
 
+diff --git a/src/basic/format-util.h b/src/basic/format-util.h
+index 8719df3e29..9becc96066 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32
+@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
  #  error Unknown timex member size
  #endif
  
@@ -44,9 +46,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
+diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
+index 33dfde9d6c..e018fd81fd 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, cons
+@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, const struct rlimit *rlim) {
              fixed.rlim_max == highest.rlim_max)
                  return 0;
  
@@ -55,7 +59,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  
          return RET_NERRNO(setrlimit(resource, &fixed));
  }
-@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *r
+@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  r = free_and_strdup(&s, "infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
@@ -82,9 +86,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  
          return 1;
  }
+diff --git a/src/core/execute.c b/src/core/execute.c
+index fccfb9268c..90f00e10a5 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -5639,9 +5639,9 @@ void exec_context_dump(const ExecContext
+@@ -5633,9 +5633,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 327084bae9..7e4587cc23 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,4 +1,4 @@
-From ad395dda5db9b1ae156be121cfc8a38960de6c55 Mon Sep 17 00:00:00 2001
+From e8025c8eefdf1be4bba34c48f3430838f3859c52 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
 Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
@@ -12,6 +12,8 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/test/test-sizeof.c | 4 ++++
  1 file changed, 4 insertions(+)
 
+diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
+index f349852553..602772227e 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -55,8 +55,10 @@ int main(void) {
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 0026a7b72a..6eecd3197c 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From 5d4c6b2f4b88b69b31f967371d2a6136c65dc3fd Mon Sep 17 00:00:00 2001
+From 46fdc959257d60d9b32953cae0152ae118f8564b Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
@@ -27,13 +27,15 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 
 ---
- src/basic/fs-util.h          | 23 +++++++++++++++++++++--
+ src/basic/fs-util.h          | 21 ++++++++++++++++++++-
  src/shared/base-filesystem.c |  6 +++---
- 2 files changed, 24 insertions(+), 5 deletions(-)
+ 2 files changed, 23 insertions(+), 4 deletions(-)
 
+diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
+index 0bbb3f6298..3dc494dbfb 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -46,8 +46,27 @@ int futimens_opath(int fd, const struct
+@@ -46,8 +46,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
  int fd_warn_permissions(const char *path, int fd);
  int stat_warn_permissions(const char *path, const struct stat *st);
  
@@ -62,9 +64,11 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
+diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
+index 5f5328c8cf..d396bc99fe 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
-@@ -117,7 +117,7 @@ int base_filesystem_create(const char *r
+@@ -117,7 +117,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
          for (size_t i = 0; i < ELEMENTSOF(table); i++) {
@@ -73,7 +77,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
                          continue;
  
                  if (table[i].target) {
-@@ -125,7 +125,7 @@ int base_filesystem_create(const char *r
+@@ -125,7 +125,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -82,7 +86,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -136,7 +136,7 @@ int base_filesystem_create(const char *r
+@@ -136,7 +136,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                                          if (!p)
                                                  return log_oom();
  
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 612a535d3c..7b22d6214f 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From 1803ea271b93370fdcf7ec497277344f1e775429 Mon Sep 17 00:00:00 2001
+From d0bdce977b7acc5e45e82cf84256c4bedc0e74c4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
@@ -14,6 +14,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/machine/machine-dbus.c | 5 +++++
  1 file changed, 5 insertions(+)
 
+diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
+index 8f11afd65b..a2b57deb7a 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
 @@ -10,6 +10,11 @@
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index baf4903803..015347cb6a 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From 30b08f76ea7f5c324afedf97f0867b76dac9f128 Mon Sep 17 00:00:00 2001
+From e480d28305907c3874f4e58b722b8aa43c3ac7a2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
@@ -24,6 +24,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/basic/process-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/src/basic/process-util.c b/src/basic/process-util.c
+index df6e85b1fc..635dbb5d26 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -1489,7 +1489,7 @@ int set_oom_score_adjust(int value) {
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 878914b307..c563982607 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From 873202f63f9f117c6e5a98e444cc709057042979 Mon Sep 17 00:00:00 2001
+From 0542d27ebbb250c09bdcfcf9f2ea3d27426fe522 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
@@ -24,9 +24,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/libsystemd/sd-journal/journal-send.c | 5 +++++
  2 files changed, 10 insertions(+)
 
+diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
+index bdfa145ab7..61928f4bf3 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -409,7 +409,12 @@ static void bus_error_strerror(sd_bus_er
+@@ -409,7 +409,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
                          return;
  
                  errno = 0;
@@ -39,9 +41,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
                  if (errno == ERANGE || strlen(x) >= k - 1) {
                          free(m);
                          k *= 2;
+diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
+index e6ceba54f9..285ebbc9ef 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
-@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(co
+@@ -370,7 +370,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
                  char* j;
  
                  errno = 0;
diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index e6507c5f89..f4066d7e4f 100644
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,4 +1,4 @@
-From e7441559266074e7a33e3c11ff5cdaf5ba9c0e24 Mon Sep 17 00:00:00 2001
+From d8bf23d7a698bd3253b0cfba24bd8afd0886d82d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
 Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
@@ -17,7 +17,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index c49be29e46..90731bd7e7 100644
+index 61928f4bf3..79b698b092 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
 @@ -55,8 +55,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
index eeff693bc4..5ee212a4e7 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,4 +1,4 @@
-From 64f4d2eb976b9f23ce85b3655a876f7299eafd58 Mon Sep 17 00:00:00 2001
+From 68bb59615e91c4d3e5eb2076979c2b760f4bf027 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
 Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index 5ca5386289..1fcba7af08 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From d95330f328c23c1cd6c51aeca43f081746cf2899 Mon Sep 17 00:00:00 2001
+From e1d0210b47906dd121f936f3181092835df6a95c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
index d51ac4265a..662f8110db 100644
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
@@ -1,4 +1,4 @@
-From 2284f2f44b1b30f10b9196e0f5c6d0a2e0c1871f Mon Sep 17 00:00:00 2001
+From f1574cf91340800cf8253e922b2c613d6b9b5e4a Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:19:27 +0000
 Subject: [PATCH] Handle missing LOCK_EX
@@ -11,7 +11,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/partition/makefs.c b/src/partition/makefs.c
-index 7c94fbfedb..42f966722d 100644
+index b6979b7e4f..63d70d861e 100644
 --- a/src/partition/makefs.c
 +++ b/src/partition/makefs.c
 @@ -6,6 +6,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index 1ba5c1292b..70ac8b607c 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -1,4 +1,4 @@
-From a6a25e1ecae91f48a4f87bf0cc17eaaf0a919ffe Mon Sep 17 00:00:00 2001
+From d2f3293ceb22731e0e97945f0d1132e356b66d07 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:20:17 +0000
 Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
@@ -23,9 +23,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/nspawn/nspawn.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index a2af4948c0..fb6af295b5 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -5389,7 +5389,7 @@ static int cant_be_in_netns(void) {
+@@ -5399,7 +5399,7 @@ static int cant_be_in_netns(void) {
          if (fd < 0)
                  return log_error_errno(errno, "Failed to allocate udev control socket: %m");
  
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index dfab8fbbdf..cc20c3710a 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,4 +1,4 @@
-From 47472da6e8900773c26da8fd26699367447d97a6 Mon Sep 17 00:00:00 2001
+From e10a73de254b570bbc29b26423dbb86b4265bb05 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
 Subject: [PATCH] test-json.c: define M_PIl
@@ -14,6 +14,8 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/test/test-json.c | 4 ++++
  1 file changed, 4 insertions(+)
 
+diff --git a/src/test/test-json.c b/src/test/test-json.c
+index b385edc269..5e5830238c 100644
 --- a/src/test/test-json.c
 +++ b/src/test/test-json.c
 @@ -14,6 +14,10 @@
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index d389e1d9f9..4dd6ff6e2e 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From 0f9422780a569c79a4b28e44c79c70b4a354bd92 Mon Sep 17 00:00:00 2001
+From 414e2f97008a1f3c26a260a6dc4d51a8c1fa6900 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -20,27 +20,34 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 
 ---
- src/basic/cgroup-util.c                 | 10 +++++-----
+ src/basic/cgroup-util.c                 | 12 ++++++------
+ src/basic/namespace-util.c              |  4 ++--
  src/basic/procfs-util.c                 |  4 ++--
  src/basic/sysctl-util.c                 |  2 +-
  src/basic/util.c                        |  2 +-
  src/binfmt/binfmt.c                     |  6 +++---
+ src/core/cgroup.c                       |  2 +-
  src/core/main.c                         |  4 ++--
  src/core/smack-setup.c                  |  8 ++++----
  src/hibernate-resume/hibernate-resume.c |  2 +-
+ src/home/homework.c                     |  2 +-
  src/libsystemd/sd-device/sd-device.c    |  2 +-
  src/nspawn/nspawn-cgroup.c              |  2 +-
  src/nspawn/nspawn.c                     |  6 +++---
+ src/shared/binfmt-util.c                |  2 +-
  src/shared/cgroup-setup.c               |  4 ++--
- src/shared/mount-util.c                 |  4 ++--
+ src/shared/coredump-util.c              |  2 +-
  src/shared/smack-util.c                 |  2 +-
  src/sleep/sleep.c                       |  8 ++++----
+ src/udev/udev-rules.c                   |  1 -
  src/vconsole/vconsole-setup.c           |  2 +-
- 16 files changed, 34 insertions(+), 34 deletions(-)
+ 21 files changed, 39 insertions(+), 40 deletions(-)
 
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index f7dc6c8421..5f7a27c2c4 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -390,7 +390,7 @@ int cg_kill_kernel_sigkill(const char *c
+@@ -390,7 +390,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
          if (r < 0)
                  return r;
  
@@ -49,7 +56,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -803,7 +803,7 @@ int cg_install_release_agent(const char
+@@ -803,7 +803,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -58,7 +65,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -821,7 +821,7 @@ int cg_install_release_agent(const char
+@@ -821,7 +821,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -67,7 +74,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
  
-@@ -848,7 +848,7 @@ int cg_uninstall_release_agent(const cha
+@@ -848,7 +848,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -76,7 +83,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -858,7 +858,7 @@ int cg_uninstall_release_agent(const cha
+@@ -858,7 +858,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -85,7 +92,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -1704,7 +1704,7 @@ int cg_set_attribute(const char *control
+@@ -1704,7 +1704,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -94,9 +101,30 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
+diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
+index b9120a5ed0..78e460b75f 100644
+--- a/src/basic/namespace-util.c
++++ b/src/basic/namespace-util.c
+@@ -202,12 +202,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
+                 freeze();
+ 
+         xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
+-        r = write_string_file(path, uid_map, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(path, uid_map, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write UID map: %m");
+ 
+         xsprintf(path, "/proc/" PID_FMT "/gid_map", pid);
+-        r = write_string_file(path, gid_map, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(path, gid_map, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write GID map: %m");
+ 
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index e485a0196b..8bff210356 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
+@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -112,9 +140,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  uint64_t threads_max;
  
+diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
+index b66a6622ae..8d1c93008a 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
+@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *value) {
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -123,6 +153,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  int sysctl_writef(const char *property, const char *format, ...) {
+diff --git a/src/basic/util.c b/src/basic/util.c
+index d7ef382737..31c35118d1 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
 @@ -168,7 +168,7 @@ void disable_coredumps(void) {
@@ -134,6 +166,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
+diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
+index 18231c2618..6c598d55c8 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -29,7 +29,7 @@ static bool arg_unregister = false;
@@ -145,7 +179,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  static int apply_rule(const char *filename, unsigned line, const char *rule) {
-@@ -59,7 +59,7 @@ static int apply_rule(const char *filena
+@@ -59,7 +59,7 @@ static int apply_rule(const char *filename, unsigned line, const char *rule) {
          if (r >= 0)
                  log_debug("%s:%u: Rule '%s' deleted.", filename, line, rulename);
  
@@ -163,9 +197,24 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
+diff --git a/src/core/cgroup.c b/src/core/cgroup.c
+index f58de95a49..7a97ab6f99 100644
+--- a/src/core/cgroup.c
++++ b/src/core/cgroup.c
+@@ -4140,7 +4140,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+         else
+                 u->freezer_state = FREEZER_THAWING;
+ 
+-        r = write_string_file(path, one_zero(action == FREEZER_FREEZE), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(path, one_zero(action == FREEZER_FREEZE), 0);
+         if (r < 0)
+                 return r;
+ 
+diff --git a/src/core/main.c b/src/core/main.c
+index 57aedb9b93..7ef36d22f5 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1466,7 +1466,7 @@ static int bump_unix_max_dgram_qlen(void
+@@ -1466,7 +1466,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -174,7 +223,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                                 "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
-@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool
+@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -183,9 +232,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m",
                                    arg_early_core_pattern);
+diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
+index f88cb80834..68055fb64a 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -320,17 +320,17 @@ int mac_smack_setup(bool *loaded_policy)
+@@ -320,17 +320,17 @@ int mac_smack_setup(bool *loaded_policy) {
          }
  
  #if HAVE_SMACK_RUN_LABEL
@@ -207,6 +258,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
+diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
+index 58e35e403e..1d0beb4008 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -218,9 +271,24 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
+diff --git a/src/home/homework.c b/src/home/homework.c
+index 9fdc74b775..9858a2b415 100644
+--- a/src/home/homework.c
++++ b/src/home/homework.c
+@@ -284,7 +284,7 @@ static void drop_caches_now(void) {
+          * details. We write "2" into /proc/sys/vm/drop_caches to ensure dentries/inodes are flushed, but not
+          * more. */
+ 
+-        r = write_string_file("/proc/sys/vm/drop_caches", "2\n", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/vm/drop_caches", "2\n", 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to drop caches, ignoring: %m");
+         else
+diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
+index b163a0fb6b..fd6c5301d6 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2108,7 +2108,7 @@ _public_ int sd_device_set_sysattr_value
+@@ -2108,7 +2108,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -229,9 +297,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
+diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
+index d472e80c03..c7780c7fc6 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -240,9 +310,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index fb6af295b5..0d83f1e4d2 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2757,7 +2757,7 @@ static int reset_audit_loginuid(void) {
+@@ -2759,7 +2759,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -251,7 +323,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -4163,7 +4163,7 @@ static int setup_uid_map(
+@@ -4175,7 +4175,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -260,7 +332,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-@@ -4173,7 +4173,7 @@ static int setup_uid_map(
+@@ -4185,7 +4185,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -269,9 +341,24 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
+diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
+index 724d7f27d9..dd725cff92 100644
+--- a/src/shared/binfmt-util.c
++++ b/src/shared/binfmt-util.c
+@@ -26,7 +26,7 @@ int disable_binfmt(void) {
+         if (r < 0)
+                 return log_warning_errno(r, "Failed to determine whether binfmt_misc is mounted: %m");
+ 
+-        r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
+         if (r < 0)
+                 return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
+ 
+diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
+index 8bda66ca36..4e1e9943ee 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -345,7 +345,7 @@ int cg_attach(const char *controller, co
+@@ -345,7 +345,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -289,9 +376,22 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
+diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
+index a0b648bf79..13f921390d 100644
+--- a/src/shared/coredump-util.c
++++ b/src/shared/coredump-util.c
+@@ -70,5 +70,5 @@ int set_coredump_filter(uint64_t value) {
+         sprintf(t, "0x%"PRIx64, value);
+ 
+         return write_string_file("/proc/self/coredump_filter", t,
+-                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
++                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
+ }
+diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
+index 0df1778cb2..3b9a0c934e 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
-@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const
+@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -300,9 +400,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
+diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
+index 7064f3a905..8f2a7d9da2 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -46,7 +46,7 @@ static int write_hibernate_location_info
+@@ -46,7 +46,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
          assert(hibernate_location->swap);
  
          xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
@@ -311,7 +413,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
                                         hibernate_location->swap->device, resume_str);
-@@ -73,7 +73,7 @@ static int write_hibernate_location_info
+@@ -73,7 +73,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
          }
  
          xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
@@ -329,7 +431,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (k >= 0)
                          return 0;
  
-@@ -112,7 +112,7 @@ static int write_state(FILE **f, char **
+@@ -112,7 +112,7 @@ static int write_state(FILE **f, char **states) {
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -338,9 +440,23 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index 0089833e3f..0a6a3abbb4 100644
+--- a/src/udev/udev-rules.c
++++ b/src/udev/udev-rules.c
+@@ -2181,7 +2181,6 @@ static int udev_rule_apply_token_to_event(
+                 log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", buf, value);
+                 r = write_string_file(buf, value,
+                                       WRITE_STRING_FILE_VERIFY_ON_FAILURE |
+-                                      WRITE_STRING_FILE_DISABLE_BUFFER |
+                                       WRITE_STRING_FILE_AVOID_NEWLINE |
+                                       WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
+                 if (r < 0)
+diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
+index 50930d4af3..5efd5d3728 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *na
+@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -349,72 +465,3 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
---- a/src/basic/namespace-util.c
-+++ b/src/basic/namespace-util.c
-@@ -202,12 +202,12 @@ int userns_acquire(const char *uid_map,
-                 freeze();
- 
-         xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
--        r = write_string_file(path, uid_map, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(path, uid_map, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write UID map: %m");
- 
-         xsprintf(path, "/proc/" PID_FMT "/gid_map", pid);
--        r = write_string_file(path, gid_map, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(path, gid_map, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write GID map: %m");
- 
---- a/src/core/cgroup.c
-+++ b/src/core/cgroup.c
-@@ -4140,7 +4140,7 @@ int unit_cgroup_freezer_action(Unit *u,
-         else
-                 u->freezer_state = FREEZER_THAWING;
- 
--        r = write_string_file(path, one_zero(action == FREEZER_FREEZE), WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(path, one_zero(action == FREEZER_FREEZE), 0);
-         if (r < 0)
-                 return r;
- 
---- a/src/home/homework.c
-+++ b/src/home/homework.c
-@@ -284,7 +284,7 @@ static void drop_caches_now(void) {
-          * details. We write "2" into /proc/sys/vm/drop_caches to ensure dentries/inodes are flushed, but not
-          * more. */
- 
--        r = write_string_file("/proc/sys/vm/drop_caches", "2\n", WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file("/proc/sys/vm/drop_caches", "2\n", 0);
-         if (r < 0)
-                 log_warning_errno(r, "Failed to drop caches, ignoring: %m");
-         else
---- a/src/shared/binfmt-util.c
-+++ b/src/shared/binfmt-util.c
-@@ -26,7 +26,7 @@ int disable_binfmt(void) {
-         if (r < 0)
-                 return log_warning_errno(r, "Failed to determine whether binfmt_misc is mounted: %m");
- 
--        r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
-         if (r < 0)
-                 return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
- 
---- a/src/shared/coredump-util.c
-+++ b/src/shared/coredump-util.c
-@@ -70,5 +70,5 @@ int set_coredump_filter(uint64_t value)
-         sprintf(t, "0x%"PRIx64, value);
- 
-         return write_string_file("/proc/self/coredump_filter", t,
--                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
-+                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
- }
---- a/src/udev/udev-rules.c
-+++ b/src/udev/udev-rules.c
-@@ -2181,7 +2181,6 @@ static int udev_rule_apply_token_to_even
-                 log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", buf, value);
-                 r = write_string_file(buf, value,
-                                       WRITE_STRING_FILE_VERIFY_ON_FAILURE |
--                                      WRITE_STRING_FILE_DISABLE_BUFFER |
-                                       WRITE_STRING_FILE_AVOID_NEWLINE |
-                                       WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
-                 if (r < 0)
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index e001ed59e8..6981d70af0 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From e4f9ef547fa342102db15188544daa18e71e9c66 Mon Sep 17 00:00:00 2001
+From 8871f78c559f37169c0cfaf20b0af1dbec0399af Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
@@ -38,7 +38,7 @@ index 3c63a58826..4c2d4347fc 100644
  typedef struct CPUSet {
          cpu_set_t *set;
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 4403c0aa52..e7e4ae112d 100644
+index 602772227e..7f1ed19d77 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -1,6 +1,5 @@
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 2d06ab84a2..2c56838644 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From 66a926cf906260c2fb5ea851e55efe03edd444dc Mon Sep 17 00:00:00 2001
+From ec519727bb1ceda6e7787ccf86237a6aad07137c Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
@@ -17,6 +17,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/shared/userdb.c          |  7 ++++++-
  3 files changed, 30 insertions(+), 1 deletion(-)
 
+diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
+index 88b8fc2f8f..a819d41bac 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
 @@ -331,8 +331,10 @@ int nss_group_to_group_record(
@@ -46,7 +48,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
          r = json_build(&g->json, JSON_BUILD_OBJECT(
                                         JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
-@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct grou
+@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
          assert(ret_sgrp);
          assert(ret_buffer);
  
@@ -54,7 +56,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          for (;;) {
                  _cleanup_free_ char *buf = NULL;
                  struct sgrp sgrp, *result;
-@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct grou
+@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
                  buflen *= 2;
                  buf = mfree(buf);
          }
@@ -120,6 +122,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          if (r < 0)
                  return r;
  
+diff --git a/src/shared/user-record-nss.h b/src/shared/user-record-nss.h
+index 22ab04d6ee..4e52e7a911 100644
 --- a/src/shared/user-record-nss.h
 +++ b/src/shared/user-record-nss.h
 @@ -2,7 +2,11 @@
@@ -134,9 +138,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <pwd.h>
  #include <shadow.h>
  
+diff --git a/src/shared/userdb.c b/src/shared/userdb.c
+index 0eddd382e6..d506b8e263 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1046,13 +1046,15 @@ int groupdb_iterator_get(UserDBIterator
+@@ -1046,13 +1046,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -153,7 +159,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
                                  r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                                  if (r < 0) {
-@@ -1065,6 +1067,9 @@ int groupdb_iterator_get(UserDBIterator
+@@ -1065,6 +1067,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index f4a71be7cc..6c97a272e2 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From 6f0dd2ba75b68036d7b4ebfe47ac5eaf44d26f06 Mon Sep 17 00:00:00 2001
+From 754a16eeb255c06dbdd4655632276573f0f075ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
@@ -12,9 +12,12 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- src/basic/missing_syscall.h | 6 ++++++
- 1 file changed, 6 insertions(+)
+ src/basic/missing_syscall.h  | 6 ++++++
+ src/shared/base-filesystem.c | 1 +
+ 2 files changed, 7 insertions(+)
 
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index 793d111c55..9665848b88 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
@@ -30,6 +33,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "macro.h"
  #include "missing_keyctl.h"
  #include "missing_stat.h"
+diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
+index d396bc99fe..7e9c0c3412 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0029-network-enable-KeepConfiguration-when-running-on-net.patch b/meta/recipes-core/systemd/systemd/0029-network-enable-KeepConfiguration-when-running-on-net.patch
deleted file mode 100644
index 782b9645cb..0000000000
--- a/meta/recipes-core/systemd/systemd/0029-network-enable-KeepConfiguration-when-running-on-net.patch
+++ /dev/null
@@ -1,253 +0,0 @@
-From 6f4e84126aaa4e26cb6865b054ea5ddebd3906e5 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Thu, 3 Feb 2022 12:14:19 +0900
-Subject: [PATCH] network: enable KeepConfiguration= when running on network
- filesystem
-Cc: pavel@zhukoff.net
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/22383]
-[YOCTO #14708]
-
-network-generator: rename DHCP_TYPE_DHCP -> DHCP_TYPE_DHCP4
-
-To emphasize this is DHCPv4. No behavior is changed.
-
-stat-util: introduce path_is_network_fs()
-
-network: enable KeepConfiguration= when running on network filesystem
-
-Also, set KeepConfiguration=dhcp-on-stop by default when running in
-initrd.
-
-Fixes #21967.
----
- man/systemd.network.xml                   |  6 +++--
- src/basic/stat-util.c                     |  9 +++++++
- src/basic/stat-util.h                     |  1 +
- src/network/generator/network-generator.c |  4 ++--
- src/network/generator/network-generator.h |  2 +-
- src/network/networkd-manager.c            | 29 +++++++++++++++++++++++
- src/network/networkd-manager.h            |  2 ++
- src/network/networkd-network.c            | 12 ++++++----
- src/network/test-networkd-conf.c          |  5 ++++
- 9 files changed, 60 insertions(+), 10 deletions(-)
-
-diff --git a/man/systemd.network.xml b/man/systemd.network.xml
-index af431e4f2c..f90cff4cd6 100644
---- a/man/systemd.network.xml
-+++ b/man/systemd.network.xml
-@@ -944,8 +944,10 @@ Table=1234</programlisting></para>
-           lease expires. This is contrary to the DHCP specification, but may be the best choice if,
-           e.g., the root filesystem relies on this connection. The setting <literal>dhcp</literal>
-           implies <literal>dhcp-on-stop</literal>, and <literal>yes</literal> implies
--          <literal>dhcp</literal> and <literal>static</literal>. Defaults to <literal>no</literal>.
--          </para>
-+          <literal>dhcp</literal> and <literal>static</literal>. Defaults to
-+          <literal>dhcp-on-stop</literal> when <command>systemd-networkd</command> is running in
-+          initrd, <literal>yes</literal> when the root filesystem is a network filesystem, and
-+          <literal>no</literal> otherwise.</para>
-         </listitem>
-       </varlistentry>
-     </variablelist>
-diff --git a/src/basic/stat-util.c b/src/basic/stat-util.c
-index efac7b002e..c2269844f8 100644
---- a/src/basic/stat-util.c
-+++ b/src/basic/stat-util.c
-@@ -249,6 +249,15 @@ int path_is_temporary_fs(const char *path) {
-         return is_temporary_fs(&s);
- }
- 
-+int path_is_network_fs(const char *path) {
-+        struct statfs s;
-+
-+        if (statfs(path, &s) < 0)
-+                return -errno;
-+
-+        return is_network_fs(&s);
-+}
-+
- int stat_verify_regular(const struct stat *st) {
-         assert(st);
- 
-diff --git a/src/basic/stat-util.h b/src/basic/stat-util.h
-index a566114f7c..f7d2f12aa9 100644
---- a/src/basic/stat-util.h
-+++ b/src/basic/stat-util.h
-@@ -53,6 +53,7 @@ int fd_is_temporary_fs(int fd);
- int fd_is_network_fs(int fd);
- 
- int path_is_temporary_fs(const char *path);
-+int path_is_network_fs(const char *path);
- 
- /* Because statfs.t_type can be int on some architectures, we have to cast
-  * the const magic to the type, otherwise the compiler warns about
-diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index c081ec673c..063ad08d80 100644
---- a/src/network/generator/network-generator.c
-+++ b/src/network/generator/network-generator.c
-@@ -47,7 +47,7 @@ static const char * const dracut_dhcp_type_table[_DHCP_TYPE_MAX] = {
-         [DHCP_TYPE_OFF]     = "off",
-         [DHCP_TYPE_ON]      = "on",
-         [DHCP_TYPE_ANY]     = "any",
--        [DHCP_TYPE_DHCP]    = "dhcp",
-+        [DHCP_TYPE_DHCP4]   = "dhcp",
-         [DHCP_TYPE_DHCP6]   = "dhcp6",
-         [DHCP_TYPE_AUTO6]   = "auto6",
-         [DHCP_TYPE_EITHER6] = "either6",
-@@ -62,7 +62,7 @@ static const char * const networkd_dhcp_type_table[_DHCP_TYPE_MAX] = {
-         [DHCP_TYPE_OFF]     = "no",
-         [DHCP_TYPE_ON]      = "yes",
-         [DHCP_TYPE_ANY]     = "yes",
--        [DHCP_TYPE_DHCP]    = "ipv4",
-+        [DHCP_TYPE_DHCP4]   = "ipv4",
-         [DHCP_TYPE_DHCP6]   = "ipv6",
-         [DHCP_TYPE_AUTO6]   = "no",   /* TODO: enable other setting? */
-         [DHCP_TYPE_EITHER6] = "ipv6", /* TODO: enable other setting? */
-diff --git a/src/network/generator/network-generator.h b/src/network/generator/network-generator.h
-index dd0a58738b..0e0da2a57a 100644
---- a/src/network/generator/network-generator.h
-+++ b/src/network/generator/network-generator.h
-@@ -13,7 +13,7 @@ typedef enum DHCPType {
-         DHCP_TYPE_OFF,
-         DHCP_TYPE_ON,
-         DHCP_TYPE_ANY,
--        DHCP_TYPE_DHCP,
-+        DHCP_TYPE_DHCP4,
-         DHCP_TYPE_DHCP6,
-         DHCP_TYPE_AUTO6,
-         DHCP_TYPE_EITHER6,
-diff --git a/src/network/networkd-manager.c b/src/network/networkd-manager.c
-index 7e89366ae8..3261f289e9 100644
---- a/src/network/networkd-manager.c
-+++ b/src/network/networkd-manager.c
-@@ -398,6 +398,30 @@ static int signal_restart_callback(sd_event_source *s, const struct signalfd_sig
-         return sd_event_exit(sd_event_source_get_event(s), 0);
- }
- 
-+static int manager_set_keep_configuration(Manager *m) {
-+        int r;
-+
-+        assert(m);
-+
-+        if (in_initrd()) {
-+                log_debug("Running in initrd, keep DHCPv4 addresses on stopping networkd by default.");
-+                m->keep_configuration = KEEP_CONFIGURATION_DHCP_ON_STOP;
-+                return 0;
-+        }
-+
-+        r = path_is_network_fs("/");
-+        if (r < 0)
-+                return log_error_errno(r, "Failed to detect if root is network filesystem: %m");
-+        if (r == 0) {
-+                m->keep_configuration = _KEEP_CONFIGURATION_INVALID;
-+                return 0;
-+        }
-+
-+        log_debug("Running on network filesystem, enabling KeepConfiguration= by default.");
-+        m->keep_configuration = KEEP_CONFIGURATION_YES;
-+        return 0;
-+}
-+
- int manager_setup(Manager *m) {
-         int r;
- 
-@@ -453,6 +477,10 @@ int manager_setup(Manager *m) {
-         if (r < 0)
-                 return r;
- 
-+        r = manager_set_keep_configuration(m);
-+        if (r < 0)
-+                return r;
-+
-         m->state_file = strdup("/run/systemd/netif/state");
-         if (!m->state_file)
-                 return -ENOMEM;
-@@ -468,6 +496,7 @@ int manager_new(Manager **ret, bool test_mode) {
-                 return -ENOMEM;
- 
-         *m = (Manager) {
-+                .keep_configuration = _KEEP_CONFIGURATION_INVALID,
-                 .test_mode = test_mode,
-                 .speed_meter_interval_usec = SPEED_METER_DEFAULT_TIME_INTERVAL,
-                 .online_state = _LINK_ONLINE_STATE_INVALID,
-diff --git a/src/network/networkd-manager.h b/src/network/networkd-manager.h
-index 36313589a3..86de529124 100644
---- a/src/network/networkd-manager.h
-+++ b/src/network/networkd-manager.h
-@@ -28,6 +28,8 @@ struct Manager {
-         Hashmap *polkit_registry;
-         int ethtool_fd;
- 
-+        KeepConfiguration keep_configuration;
-+
-         bool test_mode;
-         bool enumerating;
-         bool dirty;
-diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
-index 3142be471f..edcd68d616 100644
---- a/src/network/networkd-network.c
-+++ b/src/network/networkd-network.c
-@@ -124,6 +124,7 @@ int network_verify(Network *network) {
-         int r;
- 
-         assert(network);
-+        assert(network->manager);
-         assert(network->filename);
- 
-         if (net_match_is_empty(&network->match) && !network->conditions)
-@@ -248,10 +249,11 @@ int network_verify(Network *network) {
-         }
- 
-         if (network->dhcp_critical >= 0) {
--                if (network->keep_configuration >= 0)
--                        log_warning("%s: Both KeepConfiguration= and deprecated CriticalConnection= are set. "
--                                    "Ignoring CriticalConnection=.", network->filename);
--                else if (network->dhcp_critical)
-+                if (network->keep_configuration >= 0) {
-+                        if (network->manager->keep_configuration < 0)
-+                                log_warning("%s: Both KeepConfiguration= and deprecated CriticalConnection= are set. "
-+                                            "Ignoring CriticalConnection=.", network->filename);
-+                } else if (network->dhcp_critical)
-                         /* CriticalConnection=yes also preserve foreign static configurations. */
-                         network->keep_configuration = KEEP_CONFIGURATION_YES;
-                 else
-@@ -386,7 +388,7 @@ int network_load_one(Manager *manager, OrderedHashmap **networks, const char *fi
-                 .allmulticast = -1,
-                 .promiscuous = -1,
- 
--                .keep_configuration = _KEEP_CONFIGURATION_INVALID,
-+                .keep_configuration = manager->keep_configuration,
- 
-                 .dhcp_duid.type = _DUID_TYPE_INVALID,
-                 .dhcp_critical = -1,
-diff --git a/src/network/test-networkd-conf.c b/src/network/test-networkd-conf.c
-index 4b00a98086..5f1328e39c 100644
---- a/src/network/test-networkd-conf.c
-+++ b/src/network/test-networkd-conf.c
-@@ -6,6 +6,7 @@
- #include "net-condition.h"
- #include "networkd-address.h"
- #include "networkd-conf.h"
-+#include "networkd-manager.h"
- #include "networkd-network.h"
- #include "strv.h"
- 
-@@ -166,11 +167,15 @@ static void test_config_parse_ether_addr(void) {
- }
- 
- static void test_config_parse_address_one(const char *rvalue, int family, unsigned n_addresses, const union in_addr_union *u, unsigned char prefixlen) {
-+        _cleanup_(manager_freep) Manager *manager = NULL;
-         _cleanup_(network_unrefp) Network *network = NULL;
- 
-+        assert_se(manager_new(&manager, /* test_mode = */ true) >= 0);
-         assert_se(network = new0(Network, 1));
-         network->n_ref = 1;
-+        network->manager = manager;
-         assert_se(network->filename = strdup("hogehoge.network"));
-+
-         assert_se(config_parse_match_ifnames("network", "filename", 1, "section", 1, "Name", 0, "*", &network->match.ifname, network) == 0);
-         assert_se(config_parse_address("network", "filename", 1, "section", 1, "Address", 0, rvalue, network, network) == 0);
-         assert_se(ordered_hashmap_size(network->addresses_by_section) == 1);
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_250.4.bb b/meta/recipes-core/systemd/systemd_250.5.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_250.4.bb
rename to meta/recipes-core/systemd/systemd_250.5.bb
index 15e2185dff..2cf3b7ca88 100644
--- a/meta/recipes-core/systemd/systemd_250.4.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -25,7 +25,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
-           file://0029-network-enable-KeepConfiguration-when-running-on-net.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


