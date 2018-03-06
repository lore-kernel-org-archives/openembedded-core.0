Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86A8B78A4C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 17:31:10 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id a207so239412oii.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 09:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tbk1bKaq2hwE5DEhqlhhq2yvf5Ts0ZOaFnDi72F/ebg=;
	b=eKBKdFe2M+bsI8iCY7gVUWmCg1okcE95MBes8/2LKRs4L2x3SI0xgLvBtAttkXO7is
	blpqsUUqK57Ng4G4z2soteLM3PHLjclacTOUhTTLrqxvpFxXmu9tu37UbO47xLR9luQn
	4q/Vb4x+YdRMo+pS7BxZwEdiJOX2fYW0dMQyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tbk1bKaq2hwE5DEhqlhhq2yvf5Ts0ZOaFnDi72F/ebg=;
	b=tNn7XvuWjB27Xtt5iV20J7vN+k9UqgHS1i220yZvSSRSCL83TCVmQe3w+6ZXsBnsED
	vgRkuuGLCBCfwvJOZ3qn5JeZDzK4eXuxXEaz1XIKs9ekEHc3lLwEHP+j6QWokl7wei2f
	ZP5j2ePMxnfMxHzOAyuqlz77CGy+GIObNZ/2t4zwyIncsqdehzyVuHj5N6pPVMksSuLf
	yH0aYdEuNrMr+RldzJH9bjtpKv3VNzejQpER+goW2uh02Oh7QtaEGccZtqxyHrZvvl6d
	dvCPbqCeZvWAvtxJnheBPQt9vPGpT9nABmhM9R5Cd7/eZPRb5eOOkYJU9M9d/vlfou4o
	J88g==
X-Gm-Message-State: AElRT7GSJcZ4Yo5F8dW4qnI7IVgJHgT4Xs7o39wd2CJ1GTf208udQaT8
	um5HpvyKtaM740D07etr1zFfphbyLBI=
X-Google-Smtp-Source: AG47ELt5h78WXvU800WPLfs3acDHWLJAfI9V0AB7oclQ5yTeH1c4doG4ZFQgArjK5s8Bxb0l7tZtWw==
X-Received: by 10.202.78.70 with SMTP id c67mr11798846oib.314.1520357470909;
	Tue, 06 Mar 2018 09:31:10 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-113-185.PCs.InterCable.net. [187.161.113.185])
	by smtp.googlemail.com with ESMTPSA id
	o10sm7489417oib.27.2018.03.06.09.31.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 09:31:09 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 11:30:44 -0600
Message-Id: <1520357444-25108-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gdb: Add signed-off-by tag to patch
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
X-List-Received-Date: Tue, 06 Mar 2018 17:31:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A patch went in (in 4aaf747) without a proper signed-off-by
because the project (in its upstream repository) does not use
Git.

This will take care of that before spreading the patch to
other branches.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 .../gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
index c7b1d0d..ef97de7 100644
--- a/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
+++ b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
@@ -3,6 +3,9 @@ From: James Clarke <jrtc27@jrtc27.com>
 Date: Fri, 19 Jan 2018 17:22:49 +0000
 Subject: [PATCH] gdb: Fix ia64 defining TRAP_HWBKPT before including
  gdb_wait.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 On ia64, gdb_wait.h eventually includes siginfo-consts-arch.h, which
 contains an enum with TRAP_HWBKPT, along with a #define. Thus we cannot
@@ -16,6 +19,8 @@ gdb/ChangeLog:
 	* nat/linux-ptrace.h: ... to here.
 
 Upstream-Status: Accepted [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8]
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
 ---
  gdb/nat/linux-ptrace.c | 2 --
  gdb/nat/linux-ptrace.h | 1 +
-- 
2.7.4


