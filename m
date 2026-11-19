Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8802.1795065450818160681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 21:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U3jCLStE;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9212aaefc11so2157776d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 21:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795065450; x=1795670250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQsNunpKtXkl5gvMDvD3GmGHjESJuHYhgKATAW1o3FE=;
        b=U3jCLStEtv0VSGxhGKh9Jqgoz2L9vhq0O14uRJ7jxp10OaluwtS2VXGI+JLlKKHQpD
         oM2XPjUPQO7qzeNjGQlY/zrPbn9PH/8YkhTwjigFt4IDAMtFczaJmADQ3iLlKdeBZkly
         eE54s98ZufUmOUAcvL819cO/Y4q4BOblmswiEn/OhMULBgrp3QOUtSPJITTIuw5ImMZn
         /5i7zRX1/Od6hE6ePorpPAxTHs7S2M8gKUc7S/dLTYhHjizMs82bYwOI+W2O3VPuoYWS
         USyN3tRbGhO+7/9igksP/36MyoIRAC19nD+tyQtnE6BGjbE+DOHB8zxQ85WRoj9EoPPC
         YQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065450; x=1795670250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xQsNunpKtXkl5gvMDvD3GmGHjESJuHYhgKATAW1o3FE=;
        b=vv7niqAce5G2mAV86k37Z+8rvdZ5WNL0T2kMFZtm+rqolKf3XdDoLdlLMf0hxNBcLh
         kLM/M4jYmmcy6T0keXplm5GJXl+lI6QRRdFwC9fM+7DzZgKnKA4fIft8z3ncAGN7A5Od
         dBVOiOCPLjWVLO23tkoFoX+Q7JRNmiz5yOrM1pMIwC51ISHpsR/5j2w2UfHlkvBhPq6H
         GwaoaXl0aHQ3m6M0tBBzd7N8DENkWiCM1ZNJB2jHNydD45wL9B7FcrZD008rSy4MChpc
         338Uw7VBuaM8cUUWQlRNTGiFKtjo7VW78pZxP/Vwvmd9MKLsDAdILNrZEArF2E2suWZH
         z5qw==
X-Gm-Message-State: APuU4Z/emmp1WWsWJASp7o7rzwj/r6BWNir+i44pCAHSg3pV33q1Uk7F
	2JFzBu9ID+flLYeu0ryaWhdQ6ghNSSUEbG2HqOxlPnGvFf38q3Ok6epinnaJK9lR0eM=
X-Gm-Gg: AZFdTZd94nUH5bkk6qhUIxgnKHWosIKqjF9qkNoipMJi3TVlmVOJIZn7BKKVBc4V4zX
	EDUu9iIW8W/QEUvDXtOkbW8qXTnQbuOD0VjBFYI+zt/EeWjmrYa7uLLUYoYHNbfPFvF/OCt4MUi
	2A1c0XetkzJkbNhD4VKeCG7GSVU61DoacdKYGz3PSUYKcB/Eul7ahOKEFKaa0OEgq9qbDFY52DB
	C/b2Xeg5ysLsr/qcFgbBaPyaQq0bxp+b6H6ZL2NPu9VHNBAP0PBZ2kBnBRtOsQJ0h4X82iY4BQN
	1j7GFCMNhPk57/ebgsxHPJ9ThELhMSgsLros5xPYVo3/s3gt4LQllFQ07k+qyOkXlZhyGAHDPM5
	5MnXo/jZ8TZ8dY5go9TEci7gsNpajXhuqEutJF3C/NcJdra4F91GboohxUYJVxqmogXPgZNHrkr
	tQo6r8sTq0bTRoi//ay4vKGU1PWvJ8CslNzo4O6hTjpiO15HW0eE+6ecT6fFzNDLX5YHnWxnlge
	4OKZt+5nVG3brEZ4CyXbSKgSXSCBWobQNDLgOe2OwL86xtmhutLt/+PrUx//IzhosMIrG7aPsU1
	6NZDAl3n4pxaleT+FzzUzfogW9jIc7ttSBL84tOoWnVT4tr0mX/wn8bugKz/XcpE781AMAbzCzM
	UjThw97aPWX7MK2VKFL/evM70LGfsRfqBan8qXwX42klkr2e7Em2fkU8lFT1IfNkEYE9QaLgrkq
	VaUha8Mw8faZ4HNl3+BV3TNVFhmAX9shUUW2Uug/cscJU99C4HYj+3DywYfXGyL6D+
X-Received: by 2002:ad4:5e8f:0:b0:91f:2208:b68d with SMTP id 6a1803df08f44-92114e3bd93mr81741636d6.28.1795065449362;
        Wed, 18 Nov 2026 21:17:29 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm40734946d6.13.2026.11.18.21.17.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:17:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][scarthgap] linux-yocto/6.6: perf cs-etm: fix a compilation issue in cs_etm_decoder__set_tid()
Date: Thu, 19 Nov 2026 00:17:28 -0500
Message-ID: <20261119051728.3841214-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 05:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250639
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Valentin Caron
    Email: valentin.caron@foss.st.com
    Subject: perf cs-etm: fix a compilation issue in cs_etm_decoder__set_tid()
    Date: Mon, 9 Nov 2026 18:14:57 +0100

    When compiling coresight tool with the command:
    make -C tools/perf CORESIGHT=1 all

    The following build issue occurs:
    util/cs-etm-decoder/cs-etm-decoder.c:551:15: error: too many arguments to
    function 'cs_etm_decoder__buffer_packet'
      551 |         ret = cs_etm_decoder__buffer_packet(etmq, packet_queue,
          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    Fix this by removing the parameter "etmq" from function call to match its
    declaration:
    cs_etm_decoder__buffer_packet(struct cs_etm_packet_queue *packet_queue,
    			      const u8 trace_chan_id,
    			      enum cs_etm_sample_type sample_type)

    Fixes: 99d324594165 ("perf cs-etm: Queue context packets for frontend")
    Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

The upstream -stable broke perf on arm64 when coresight is'
enabled.

This patch fixes the problem, I'll resolve any conflicts when
I do the next 6.6-stable, but this gets us going while we wait
for that.

Bruce

 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index eb44fdc10a..73f136c128 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7593447608d70ada4e27630e9047fdf459b3fd6f"
+SRCREV_machine ?= "259b95b0821202a0da8c3f8f5d571619e5f13b11"
 SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index d39247e331..fe975d3e42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "33978ed066431901d7e235059590916deb73fa28"
+SRCREV_machine ?= "ad54989725c77d1d5312143337fa27111fc552b1"
 SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2a812631ae..32180461f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7fba77c3443f7ffb974bca08c44cd741ae422baf"
-SRCREV_machine:qemuarm64 ?= "b98967f55ff0be50f7ad0dbcc5938c76278d96b5"
-SRCREV_machine:qemuloongarch64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemumips ?= "6a6d5067d6dac276c4c0d0829a0483d47b67c7de"
-SRCREV_machine:qemuppc ?= "da6b28016510be8a0c0ecdf864f48d2a1851ab71"
-SRCREV_machine:qemuriscv64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemuriscv32 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemux86 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemux86-64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemumips64 ?= "a1afaf058fb596aa7e7750378ccb3f9b77297256"
-SRCREV_machine ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
+SRCREV_machine:qemuarm ?= "998bdbd96cbad13521429c68b3563c11e3a467bf"
+SRCREV_machine:qemuarm64 ?= "cd681556b87360f7c06f363e014ae9b45c7cdaa6"
+SRCREV_machine:qemuloongarch64 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemumips ?= "3bd41d59cf64bbf5148da6494cda59b9699e6552"
+SRCREV_machine:qemuppc ?= "2044f334db4be041f163eeeb1823d250910b7c34"
+SRCREV_machine:qemuriscv64 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemuriscv32 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemux86 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemux86-64 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemumips64 ?= "de116283909c1f4a20cafc24d9aaca1b2cd0f002"
+SRCREV_machine ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
 SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.43.0

