Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E67660750
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 07:58:56 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l65-v6so6183135pgl.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Q8Nt424zDf/5H7qvXJA1wYpWqrge92HGy+XK2sMf0AI=;
	b=XrnBODNYdxLVk/yemLAqFjQgSJ889o+8TggIYELqOgBEL1DG3RAiR25EVJxPVepPhE
	wWIA5++FN26pPtj+pwiCzyB0iPCs9VwxzSd92hcgP1Bm6sJzrmikBSzZUNNhS/v0OjMb
	yiLycTHdT0gPVWxGRYdqiIPsP2OlLSRR08LloL+lySx5fJOSByrI4sdOtsMF0zPAjf/i
	a8Pa5YOD9aw/Fq3amoHwoo73hhHcD0si2Uf4wU6/TquRfgrU9YNR9qIMJwj+skyQdokg
	wwEWSQjgxxzvAx60i8uyOGilSpzxiEfoXcQLaxuWb8P9U/cOwhLmUZA7TciljIUpL1NY
	xvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q8Nt424zDf/5H7qvXJA1wYpWqrge92HGy+XK2sMf0AI=;
	b=mRMX3qDP/1rvpb06y2GGpguDTUAzJh3XNwXAzFEvXAKzaREn6xQXQ5jU45PPpJanrV
	R73e0viEj+eICKCDBbM9DqjxMHvAJvZ6DCX0oxG9BWgMXMX15jJUB2HnZwAhn/+dWy7Z
	+9fED7Bcecfz0P9BvAqmhYdOirwGykN75jGgTTL4hChAuT7qfwwKvR0MFWYwIwxpQOQ+
	aEs9yL0XjNBwa1e5/5fNzu4kJAH6JLOz2EFolqSmkr8l6aJ+DBIHk3nb7Bwehj32ksa5
	Nv5YOG/6J/ZkuyZ8JKnYmf7x0GBtTQY2get+j65mWMIXH/APA3Ub4+SJJuEEaDhasRpR
	qCHA==
X-Gm-Message-State: APt69E1d38rL1TNUgaviIAfBhYRcoJYls1QhhsECeseQuSSXkdd9PvzP
	reWM1BUPlA7ogs30O1X6XRG/6g==
X-Google-Smtp-Source: ADUXVKJtu76s4qN+sQiOepNXxcwhTKYDIL+7+kUNSZU+Ibfm31i/WEX8cEe3BRi8wEk+OGOH9s2LrQ==
X-Received: by 2002:a63:6142:: with SMTP id
	v63-v6mr7029650pgb.390.1529222337154; 
	Sun, 17 Jun 2018 00:58:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm28937964pfr.172.2018.06.17.00.58.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Jun 2018 00:58:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jun 2018 00:58:57 -0700
Message-Id: <20180617075857.19431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
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
X-List-Received-Date: Sun, 17 Jun 2018 07:58:56 -0000

Changelog:
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=941bd884cc0221d051840ce6d21650339e711863..d5e55ba3320c30310ca1d8938925d5424a652422

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a0a098f5b4..ba2de730f3 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "941bd884cc0221d051840ce6d21650339e711863"
+SRCREV = "d5e55ba3320c30310ca1d8938925d5424a652422"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.17.1


