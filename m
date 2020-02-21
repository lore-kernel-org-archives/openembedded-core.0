Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E59A61705
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:11 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o28so2560334qkj.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tfX3RNyWP2n6Kx7MltCW8bQbC+yyGMRAwTRtmphZhiY=;
	b=Gw1pMkUXRzlEmKI3SF9kRL0BJGGMcwRn1+rNKgS4Kuv1IeOen9eAkdmts3ZJm+GGkX
	U3n6rTRsp+pbUqeIosJza/F46dHuexF7xJAF7+p1/XKBxRpvE6OQLr+ReujMVE+Q+Rb9
	YL60mVlWSkyBUdF+RnJ17HljAJIlRh7xyM7eiDIwXAhbDPT6hI764Nd4nIcQry6KvWPR
	y1EIQ34zAmfi64/aAxTdCmxSw5QBwbZl45a8GLOey0p8wFyGVrFqf7Xsh1vlwHXYafO3
	xmJcA0HtwZpxHwD2+mKi2scumuT55qTdhFxO/fRvfx1GsVTlMMSSyPEoY3dmsyeljZPG
	RIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tfX3RNyWP2n6Kx7MltCW8bQbC+yyGMRAwTRtmphZhiY=;
	b=KiHQsRz+W5U69q0LTLf7otIX7t83Hr11QsxNvDHPOCxjclvsviGfsO4sgOd0UwnO8n
	CtWynH/YimGyX+DFeD6vmlOzRP/Rs2yRBtcV3uVKddwBXBbVnZpEwodfPE7XBAdvi4YB
	F51tOvkyB7BY9TvaN8tOeWrr4Cc6BHBgykRbpPdt1PuI/edCiXYSkIpbIv4fFWfrtxxO
	NkYnMWexELwkDnoVyIukkFKCso3BpkVvAPVQWNUJ2kZNiwJznH0wWjV8+7X8zWAslwDX
	Cms5EB/LkxRE0wQT6udcdvDz2xs2LllftX1AmxK3/rICDsqltxg4COI6p/u9nrjcpswR
	ZBxg==
X-Gm-Message-State: APjAAAUiSce63p46R0+MhOTGBbFs9iuJdC6eOpEPzWl+UhB/cjviQ95N
	AHHcFZZNImx0dszPF3YyYGg=
X-Google-Smtp-Source: APXvYqz6obzvoH3+aY4muxaP0iLYBcFIFjQqLyS/+y535BlTsEwEii0/vuIOX8cqs7E718FlO4aSAw==
X-Received: by 2002:a37:47c8:: with SMTP id
	u191mr35662275qka.438.1582307172379; 
	Fri, 21 Feb 2020 09:46:12 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:46:00 -0500
Message-Id: <91fa1c088cb62a5b4df46737b4a342bbf16b0c2b.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] linux-yocto/5.4: update to -rt11
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:11 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the -rt11 changes into the linux-yocto-rt branches:

    e3a0470f1ebe (HEAD -> v5.4/standard/preempt-rt/base, origin/v5.4/standard/preempt-rt/base) v5.4.19-rt11
    2748be173948 bpf/stackmap: Don't trylock mmap_sem with PREEMPT_RT and interrupts disabled
    d721d73cb752 bpf, lpm: Make locking RT friendly
    dc53d4c7fad3 bpf: Prepare hashtab locking for PREEMPT_RT
    a13a53a8ae75 bpf: Factor out hashtab bucket lock operations
    96a25d8a5a2d bpf: Use migrate_disable() in sys_bpf()
    bb8a96d7e701 bpf: Use migrate_disable() in hashtab code
    615cc5998661 bpf: Use migrate_disable/enable in array macros and cgroup/lirc code.
    c3a06a1ab3d4 bpf/tests: Use migrate disable instead of preempt disable
    0717741a61e6 trace/bpf: Use migrate disable in trace_call_bpf()
    b528161bf4e0 bpf: Use BPF_PROG_RUN_PIN_ON_CPU() at simple call sites.
    a3b5b903f04f bpf: Replace cant_sleep() with cant_migrate()
    dd708fd4fb18 bpf: Provide BPF_PROG_RUN_PIN_ON_CPU() macro
    6ccad68939c7 bpf: Don't iterate over possible CPUs with interrupts disabled
    055b62ad0b2c perf/bpf: Remove preempt disable around BPF invocation
    7848f4a45054 bpf/tracing: Remove redundant preempt_disable() in __bpf_trace_run()
    caf8a5d6b42f bpf: Update locking comment in hashtab code
    2ddd1653369d sched: Provide cant_migrate()
    37b6c8361d28 sched: Provide migrate_disable/enable() inlines
    2a1c4980a1e6 drm/i915/gt: use a LOCAL_IRQ_LOCK in __timeline_mark_lock()
    84a119be5c68 v5.4.19-rt10
    bb5e8418fb66 v5.4.17-rt9
    bf976f5d86e7 locallock: Include header for the `current' macro
    7a00b04683bd mm/memcontrol: Move misplaced local_unlock_irqrestore()
    b647f8807169 sched: migrate_enable: Remove __schedule() call
    2b321530c794 sched: migrate_enable: Use per-cpu cpu_stop_work
    22b448083286 locking: Percpu-rwsem rewrite
    f5d550cc9950 v5.4.17-rt8

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2a35e33830..37282b2e05 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97cb5fe4e4fa529a5b8165c4f84182d2d4751b39"
+SRCREV_machine ?= "e3a0470f1ebedce56d1c924f8ac8d3638f52304c"
 SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


