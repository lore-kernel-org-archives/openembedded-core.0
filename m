Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3406065CB6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 15:49:10 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j3so3499400pga.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/TjcrMG/IvghZgxO1/HzPAEHistrLDXBLP4YKB64Dvw=;
	b=He/XGKPEw8DLI0VqvxEsNx/rpQUfrn810OOSxNLGUdLnrjkETWOY/pA/i9fXBuZr73
	2fv/PqWUWf5VMtkPUNBwWxGjqWmczvw3bFfZu23RRE2DJjCkn7mOU2TooakET+X+IIey
	Hw4SF+ze8GnLmhMwNTxIsCzOiJtrv15AFbR4E2eybYOI6Aci3dAkbXUTWCmTRdRI8/7S
	FuMidKlhLgqiDLMvT3NcUbppTjnqGJf2HyeN3PixyTZwNUGsd/4PT5QwZV6nrQJ6rmIo
	FyVcD2pzZB0JmEev6phmRufg6IhL+x7nJz1nT74+YJZT7iG+0geVdoOs32O0eS83ViQy
	Ho9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/TjcrMG/IvghZgxO1/HzPAEHistrLDXBLP4YKB64Dvw=;
	b=M8nsXj9nwzjsJjPVBlmuQY9xcwBMmRqvRD0ivsfNKqnkUClQRZ2ChuoEXcVmqVHU0N
	/UXOD3G699Ci3yO8rQSkwuc2OZvlBlOZ2UQkF9jvTUQRKtd08GznlHfQurgmmyaS7wvo
	yjLWHDl6/iCDFRIAYNDMuCedfJZ99qjR3uZ+P1Xf85WGmXjxQT/2GVry9hlD+jegGFsj
	vY+sR5CrIbKgKudU3L2Zk/kX98oFa3Yg+cr+DiB8EX9zxCHEpdw3cmbFOEF6OIeuKJ/Y
	yrLEpRahxbglVJM6JcYsNrcm513+femTvy3wNvDq5AYPcCoH7eAZndJM7Iu9KTV9Sl4o
	1IwA==
X-Gm-Message-State: AMCzsaWHWZ/SM35gUNHF3FYUnIzOMzYNF2jDP/iw2QTCjGhKQ+Ng0vLo
	SRr9QuAKi/hhgFd9I19qwZiOBw==
X-Google-Smtp-Source: AOwi7QCL71MLV4in50n1HHUWe1fTHaC+4aTOzrHiKcPJrer4GHWzskZYTq6LXWRxRUx977mEM2pVug==
X-Received: by 10.98.236.220 with SMTP id e89mr4314074pfm.219.1507996152090;
	Sat, 14 Oct 2017 08:49:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id r9sm8384819pfd.6.2017.10.14.08.49.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Oct 2017 08:49:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Oct 2017 08:48:54 -0700
Message-Id: <20171014154858.35123-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171014154858.35123-1-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
Subject: [PATCH 3/7] musl: Update to latest
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
X-List-Received-Date: Sat, 14 Oct 2017 15:49:11 -0000

* fix use of memset without declaration in sched.h cpu set macros
* powerpc{64}: fix MAP_NORESERVE and MAP_LOCKED in mman.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 8b6a2e3454..1d16bfe27e 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "da438ee1fc516c41ba1790cef7be551a9e244397"
+SRCREV = "48be5b6313d7b827acf555769e93b389fa9f6307"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.14.2


