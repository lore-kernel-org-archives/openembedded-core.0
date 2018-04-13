Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 56DE67462E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 16:09:51 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p10so2124395pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 09:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LjzrsvaVrLhy/Nyj4Ks2Qr18VxVaf4Q7yaaFHErnn3g=;
	b=fGESI3L0lG0EXolIFI0snM+940rfNEjwG9dqqnlQGF6q+UfR5D/Hvb95Spap/1deIM
	MqHjP9hq6Rpvjhp3xNe8CV1cKLfMHlJEGoVHp401tiv8EwfNJAxSI+CAYMv7nmqkIJRg
	LfB+YTLT9dHz7QYJ5iXGKTDmJheoT7WKuMmCR2CFBfhMX1ChwhvpVUMdN3+pEqhIMoEv
	So424to3Bw0Aa0xMnR9s1hZdA76W61URUk/Xrd2ddCks3mo+zFH0p7VVf3SnbVIxy5xE
	Tc7AYQBeDz9PBtjTm4RvEt1/n1kkc/oqvQEZACb6jyjstVqzlLBgu8ygcz3P/hIxr3lk
	E21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LjzrsvaVrLhy/Nyj4Ks2Qr18VxVaf4Q7yaaFHErnn3g=;
	b=noIXMMGiYznyEvCgh/2v9jELiSPeTTxi+hjZmG3InaD+eo+JkBIrbBDQeePZ4EtB0f
	h2g5AtbnKS/q2syLoBomHHz5TDqg1XFf2O7lrnzmjSZTlBzfd+xspvkQ6OrbYEWJZoiP
	eB7Eb/hKdyWAAe6pGyCsrha70rY+uZCL8f//efAL8G17NnbSMcPRwuaMY6LJjX86iLj5
	dProAItTbM2l5SR218dlUUBkFrnBNrvq3Zg0lcVRb7N0palwuw23r/2j79ZsXIk96zx7
	hojrBW+Yn5DjB//qOA2Qsf5TECiHtylKhg09MDH54RIH4cEyFfOm+2QWryawdsdMA/zo
	n8JQ==
X-Gm-Message-State: ALQs6tDzseU0uG9UZ0co8or0ZBr1ablRG0++irjL0jLQDS9yjOAd7xrj
	CXbo5pqMpAUKCmLuAzm4xPfS+A==
X-Google-Smtp-Source: AIpwx49Oq4zU4J5PNwa6pHxD2vSz9WpV3pfi6v0nj0KnHFz4qY+wvg/9TFq0pO/7AkjmxbdNu25snQ==
X-Received: by 10.98.150.198 with SMTP id s67mr12073134pfk.191.1523635792719; 
	Fri, 13 Apr 2018 09:09:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	e82sm14339472pfh.115.2018.04.13.09.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Apr 2018 09:09:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 09:09:45 -0700
Message-Id: <20180413160945.9944-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] musl: Upgrade to latest
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
X-List-Received-Date: Fri, 13 Apr 2018 16:09:52 -0000

Changes are here

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=55df09bfccbfe21fc9dd7d8f94550c0ff25ace04..ae2a01da2e388535da243b3d974aef74a3c06ae0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9f8c5126e8..42ba411f17 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
+SRCREV = "ae2a01da2e388535da243b3d974aef74a3c06ae0"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.17.0


