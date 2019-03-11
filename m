Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D88E7C704
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 12:21:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z84so4062218wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9DjnNtk5xoU6eryrAOwqa1C8X0d7VyVEWdviRoSYzvc=;
	b=aO1Lg7pvprpBFsTjGSBXVdWSFMqAUtLvPMCRf7eXGsmBiHZvhOsma8wym550HXsHd4
	7kdKV3e8l6UMtJrMGjcNLP9eqoFj5B3ap1nX8D4/mv+t57PXROz1eg35u/bcoXrkk9vP
	ozOddaRGU1FDUT3kDloZ1aPibIJ3o/b6PvTCCu4QNCtC8Y3JaCi/O0xfubX6PVuvqBv6
	yObpYfo5t2RzN6jhwOLkA8bF8wP0rA2kMqXY3KSobeUDrU86p2jGUWkFCz4O6QYcSKv6
	l1hYnvaBcwU27soBbgiLDr7OAapzM4RKA6Fto8JtDmhfsrFvR6kA1emN8y83x/eI/kLp
	VijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9DjnNtk5xoU6eryrAOwqa1C8X0d7VyVEWdviRoSYzvc=;
	b=e1yREJVIc+GwRe0vDq8Io3RA0g7Q09CSf0hYapAfkQEV2QaXQvXfySfIXT6332FtRg
	qx8H0yvgMKa547aDKtZfbibI6H3C19HwxOBFwEqQ8J8NHsd2r26XwWolZaYU3ZpGHf6S
	Ai9zlnD/HJBccEJXaYv0ZhFd5SIVILQn56eRCy40UQHswRr1GsjU6F0VMmB4YfTsfGgg
	QEmUSci/yvh8hB/xIvIXbV6mK3klabl1L1/ltCcmvNBIydHAcbD9fA3Tb/5BKsPC3gE3
	QY/TNgDIF+2Y4q+B+242En7uv5Dk1diwn6Y+83bN7DneTyzf6k5HCEoAp9KNdS5TFHMo
	TCKQ==
X-Gm-Message-State: APjAAAW/6H/COmcDF7zISYiQWg5DFjMLwf8crqi+Wp8Gt7Qdm+wfuWx5
	T4m1RkOHtTieuEfi7y0PExrbMHQDku2uxQ==
X-Google-Smtp-Source: APXvYqxooNHBxEGFK2qhszu9RmTbh1cspj4tGMbQ3SpzVNCpHb9R40/FPRuvEw6taFTU+EtJsee8dw==
X-Received: by 2002:a1c:be11:: with SMTP id o17mr17299736wmf.141.1552306903654;
	Mon, 11 Mar 2019 05:21:43 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	k20sm6834589wre.41.2019.03.11.05.21.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Mar 2019 05:21:42 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 12:21:29 +0000
Message-Id: <20190311122129.32387-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd: do not disable SELinux with musl
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
X-List-Received-Date: Mon, 11 Mar 2019 12:21:43 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Building and running SELinux with musl works fine these days,
so don't disable it in the systemd bitbake file.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 47492c9512..e4534ab8af 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -101,7 +101,6 @@ PACKAGECONFIG_remove_libc-musl = " \
     nss-mymachines \
     nss-resolve \
     resolved \
-    selinux \
     smack \
     sysusers \
     utmp \
-- 
2.20.1


