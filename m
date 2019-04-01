Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 90F2E6BE2A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 01:13:46 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y6so6491408ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 18:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7G9Y8B4nmTLN/xPFeGHbSmynTDqSXKmfYngb0EEI3wI=;
	b=BG5GOKkxoFbGLNDrBqfk8MSBCb1tuVXx5c4JHdIsBJIw7Jb/ZNPFWf4hjrvWKLKvuY
	DpG9gKHINMx5Pug9d2TkV3iQq7HI/bMkXWiEltAaqstm1dQ1exsGXoOBNJZseQBOeyvp
	2Tmm1iV3h61QB18Loud2RsEnZSju2BTFLCeEVFpzpk5jjiyLMXuj9woMV/QYYx+8LRJx
	irMOyGEBdWvBEwJdo7zmDPcWqc/YHzZw0ZKuOOkJ0BREXjiqeyFbliRTFUjtYg9scqSf
	D1eG0ZD591DW5vED3fzPpmxxbW+QHtxgfGNWcni5VaB3mlsmAyLC26C+vswXNSYjIsf/
	q5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7G9Y8B4nmTLN/xPFeGHbSmynTDqSXKmfYngb0EEI3wI=;
	b=Rtkc+Ss0AE1/gviYsqJEfnRyw8RQJ7qMbYqdvYnJ/t4wnMH/c9fWRvNkRU5PppBAaM
	TaH+r32cEMLigrpWwRzplozABPg6zT/9aPkd0KmQ4xgxukQtxdPmTUSewcGfbRngitji
	kgbWBJMOesLOWRhsl4l+GNa3bV2nxNWzbBO7jYgtWBSg7CU7NOGJtsr3IaG33n9zencD
	D1CRhU6dNb22/4u9hlAkIF4XnKGgKlpwUEszU9XiCS3XGShb6AWeSDO36FH6r9WniMEE
	djVghbVdAyAMkfcFK9KasjO3NFZmuppOvzt09AnIkbw4pCYdbGqK7/4nRqhXdBcfUcYU
	1OuA==
X-Gm-Message-State: APjAAAU7c3doXZbfsd3Vo4fLq6zYZUxQNlAXJ6Px6pjD+vveruCfGnvG
	Auh0S6c4bqUiIYrjuX8U3u1UqvpE9AA=
X-Google-Smtp-Source: APXvYqw2trLWroEvN5gz4opJF/2q+6W4pTQ4hRfreM2BmO5mkPgJ2zl8OsYXDwKnSRQI2NM3PFG9Bw==
X-Received: by 2002:a2e:7206:: with SMTP id n6mr33603577ljc.112.1554081226632; 
	Sun, 31 Mar 2019 18:13:46 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id x2sm1542246lfg.59.2019.03.31.18.13.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 18:13:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 03:13:43 +0200
Message-Id: <20190401011343.2740-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxvmc: update to 1.0.11
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
X-List-Received-Date: Mon, 01 Apr 2019 01:13:47 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxvmc_1.0.10.bb => libxvmc_1.0.11.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.10.bb => libxvmc_1.0.11.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.11.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.11.bb
index 7e49a98ddb..d95f809ed6 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.11.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[md5sum] = "4cbe1c1def7a5e1b0ed5fce8e512f4c6"
-SRC_URI[sha256sum] = "e501a079b5dfaef0897c56152770c77e05e362065cec58910289aa567277ee2e"
+SRC_URI[md5sum] = "707175185a2e0490b8173686c657324f"
+SRC_URI[sha256sum] = "4a2e34d444a683a7c010b01b23cefe2b8043a063ce4dc6a9b855836b5262622d"
-- 
2.17.1


