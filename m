Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 286677F36F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 16:01:46 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id b19so37684256iob.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=766LgyFf0tVc3Lnx4BdhtQzCCz2iO7o01MEvDoYOQOU=;
	b=jdr8i4oR8rtmCXpCSWGHuIbu7M2QbxCqQphhH7GIGubMCFPhj6s1R188ejktR9rhaY
	0ca5P/KA8vYzZE4PTPgc0M8b+qW2WUCDr3179yYG3veKoO5LEdtRAv6a//ejW5CiyFrg
	7lThh+uVwxNCrsNINJtVsc3Qw4IU40XxeXVRTKOgpkavBALD/rAxbJDyT1GmRvsBAZ/b
	2w+ggaL5M95J2PidYI4XclSoCjQpfp1LkTQOHOwX/dnhpZXfpWDr3+5YF6UDBP+WVyD0
	uccCCAWJDStz4PCd3Y6wmzYIuHHDgH/wdj4okpKHNERcTcpLA28SHa76LiNetuo+Vyrd
	NKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=766LgyFf0tVc3Lnx4BdhtQzCCz2iO7o01MEvDoYOQOU=;
	b=N1QMnOXMD6moCRbem2xUDs+VYH8QY/uDEMGNeXzbC8Sne4QAp704tsgkiI/VD/KDSX
	+Gt08k0+bWI/IQjbptp8tPIHiSTXuTJf9LuVXc5fJJH/WCBWDKh8Qxhyi5ihzcIjXqtQ
	T4c7aaliFYvG/jib4sM8KC8cufbfZT5O8BvW4vEfnWnGx8Xxi4hUr4akofgSwghB/mTn
	z2zQbFOVjKpj8avU5xjdUaqGuNLP7nsO7WYRwPShCbw4Yqo1fbEHZgyx3QM84fvHQTgX
	y+0nMNGPIqZueOtpRZjZjbM4pmEZZ0B9DgXR1fsCW5QbV2VuT58t5f4O2yJ73wLlSJZ1
	60Dw==
X-Gm-Message-State: APjAAAVJhN784gANqMU1vDNic9v125ssoHmlBeGpLJ3IVyvBrQMa6yJz
	dQcQWWr3MYteQSiQEgY7WIc=
X-Google-Smtp-Source: APXvYqzQY85OPq+JZfRz6wdlj5mp2s3mnLMzylXVKFVZ37Ey/21/2aU1IkKPSdbPVhdQsAdTzb+FvQ==
X-Received: by 2002:a92:9f0d:: with SMTP id u13mr35083277ili.280.1570550506901;
	Tue, 08 Oct 2019 09:01:46 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e15sm6673083ioe.33.2019.10.08.09.01.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 09:01:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  8 Oct 2019 12:01:44 -0400
Message-Id: <20191008160144.64005-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-rt/5.2: update to -rt9
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
X-List-Received-Date: Tue, 08 Oct 2019 16:01:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to 5.2-rt9. Which comprises the following fixes:

   90a5890111ca v5.2.17-rt9
   7700ef5f6438 sched: migrate disable: Protect cpus_ptr with lock
   11d09bb2607b sched: Remove dead __migrate_disabled() check
   ceb75897bca0 sched: __set_cpus_allowed_ptr: Check cpus_mask, not cpus_ptr
   70d3cef7a488 printk: devkmsg: read: Return EPIPE when the first message user-space wants has gone
   eef2411714d4 drm/i915: Drop the IRQ-off asserts
   f063808d4629 drm/i915: Don't disable interrupts for intel_engine_breadcrumbs_irq()
   d3136b34629a rcutorture: Avoid problematic critical section nesting on RT
   ded0345350a6 rcu: Use rcuc threads on PREEMPT_RT as we did
   ea804ff7a3de sched: migrate_dis/enable: Use sleeping_lock…() to annotate sleeping points
   5221cc57007f rcu: Acquire RCU lock when disabling BHs
   b05b0d20c207 posix-timers: Unlock expiry lock in the early return
   066bbfed5243 v5.2.17-rt8
   163d8462f622 v5.2.14-rt7
   41f51767f77d hrtimer: Add a missing bracket and hide `migration_base' on !SMP
   8d0056d6bd7a v5.2.14-rt6

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

I forgot to send this earlier, and as discussed on IRC, this is why my
strace fix won't apply for -rt. Drop it in the queue first, and all
should be well.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 6ab1f8d3ee..acae24edb1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "04d5cfbbd09ba202134f97f8818372c7c9c81fe7"
+SRCREV_machine ?= "90a5890111ca601af1cfba50939d4003fa8d9ce8"
 SRCREV_meta ?= "56f5bc749e5a8e40b55a3819288ac277813ec5ef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


