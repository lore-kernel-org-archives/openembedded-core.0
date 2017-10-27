Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8941A607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 18:30:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i5so5522051pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q18zq3yNCzMPtaI/lq1JHvKzAfEkGa51XjgiLJc4MFo=;
	b=CEP/+OhZ3LOndOXrfSN76f0IiGE2/X6Pwjk59+QtK4qRlIXJhs0zXngNS2HZDDHQcp
	LW8QGiFkLA9DLZgd0wx58+n1fGSlYMWamLvVAHYuxyw2z/mb9KlUXdy74ieMYVLeYodl
	rpI0t4lO8MFXz2UjyfdoJ++0k7LYwWV/PRvftXOl3zt71pFdmbJ2zGyZdU9Bpi4pAN7M
	gVYPG0YBfE39dTlR9feSyEJ4NHl6ntlVSDMG1aggDVw1k7LwKxA/NT2o4d/N9nj3HIUb
	bXbJyaZFAouWkWOGLQCPD7FH+KfFp1SacnJdXlaIJmHvFUTGIy1SrBPYXFXsZEbe01XW
	Hajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q18zq3yNCzMPtaI/lq1JHvKzAfEkGa51XjgiLJc4MFo=;
	b=KdUoCAMlaw+qsdwO7hVTEHqs3ZWgIyyU0oosQBSIywhtDFACSBUoVQJlukEQ7CxnUZ
	Vv4jlEPgZILuyosl9isVM1w8UJMYQKXnimCHDTcwUk8rYIbSqxwm+gGlmapa/XP7iwkz
	kVmiYgtk6IINRTNT1LTJT1k6lxxdRxjjuaEJDUNhH7ClKnw/WT4qt2FPlvWB8ZDaA23G
	qk6BSCpT9QqSpk3mLvxg3XQLH6f7Fawf1o6TG+L7vGj/Yzr/fyFKUR+Nqzm8yRHGkhOo
	FKy9KEHhsx3YCUzbZzdjZ6dbwARUTxCgo42Lx+nn0ihvgkvbECx8HNLOG48d+JExJH4B
	hzdQ==
X-Gm-Message-State: AMCzsaVMiq2Oxmd7pAu1R7E1ADgNKvtE5vHgBCLxyryWweYE/mDS7eT1
	ihgdpSbfhPFyxIV4P1eM142+ZA==
X-Google-Smtp-Source: ABhQp+QtbA6t1hQ5HITWgZVsUF2tpNfu9CrYVtGoKu9rz3dYJQDxBteoMOkXqMJeH8CndRHM95b+eg==
X-Received: by 10.101.77.144 with SMTP id p16mr1000819pgq.226.1509129037370;
	Fri, 27 Oct 2017 11:30:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id
	m78sm17104553pfj.164.2017.10.27.11.30.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Oct 2017 11:30:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 11:30:28 -0700
Message-Id: <20171027183028.13536-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH V2] musl: Update to 1.1.17+
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
X-List-Received-Date: Fri, 27 Oct 2017 18:30:36 -0000

Rich Felker (9):
      fix use of memset without declaration in sched.h cpu set macros
      fix access by setjmp and longjmp to __hwcap on arm built as thumb2
      for executing init array functions, use function type with prototype
      fix read-after-free type error in pthread_detach
      fix incorrect base name offset from nftw when pathname ends in slash(es)
      in dns parsing callback, enforce MAXADDRS to preclude overflow
      release 1.1.17
      fix regression in glob with literal . or .. path component
      fix build regression on ARM for ISA levels less than v5

Szabolcs Nagy (2):
      powerpc{64}: fix MAP_NORESERVE and MAP_LOCKED in mman.h
      math: rewrite fma with mostly int arithmetics

Will Dietz (1):
      posix_spawn: use larger stack to cover worst-case in execvpe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---

Changes in V2: Fix build for armv5

 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index bd7573e0f3..becfbb5874 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "da438ee1fc516c41ba1790cef7be551a9e244397"
+SRCREV = "1b9406b03c0a94ebe2076a8fc1746a8c45e78a83"
 
-PV = "1.1.16+git${SRCPV}"
+PV = "1.1.17+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.14.3


