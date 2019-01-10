Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EDFB37C078
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 09:03:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t27so10415418wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 01:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GMT6u2MChy45tbVdjDfSho+MoT6B1X5oJPUb5dr+ZKk=;
	b=mbFJ0SD6OnUH9TvOjwUQp0/ZeARrM7uXlqLScRd1B3I7FR1CFOzg4DTogDetwld5sw
	aEkcjAGDGqvbjK2yZHM5jBN5bzgg5Z/VtebNQqIbgjVKLOnXVDHuylT+qdR9bmGQqNiY
	CuUwH+dRzXXwKrDN86LmC4qsNZ+BFUaB2QSxbgP/7/CydwISnTYRUvIHApsZuzusKL1a
	wlVLh9KWoNuBSnFB4RwPgYMLXVX/3IOzwW43rO56OYE6Lyr81z6epBZ3nSnO5xvlbFMk
	BdKz4hknP36w2pohHuM5Pe2zGeCMoDxJveRgeR7vle3wrhmBXFtmEstLbN1dXs5DFMA9
	SKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GMT6u2MChy45tbVdjDfSho+MoT6B1X5oJPUb5dr+ZKk=;
	b=OPyL11ihAB81YQsvRqLRQpzVCby+JPV7kr97kXU0c629nc0/A3KnS6NaMg+7s0HYAo
	hzH2bMYMY8GCIkqQgJfEaSCb+C3Px/o18cFujQH4dGBFmuTRySXOUq/jv+x5oMjIP/RH
	CmoZbKQFDhG/u8oKW4k94eroYjq+B98a4B7derD2rCV5YdEwz2g2vYjBAL7wNhUydUEC
	j/nrPxcBGpWQxoWcdMQUiBDEukvUMNMYNznJ4E1s/BqxiJsxMPFC3HkxIH67OD2agfg9
	xzYbYI40WVvE92e4vmdUbf4cVuetqaQkeXiDyZcsKLE3JIAkyaR8uuZwak1lPNTyT6t4
	14DA==
X-Gm-Message-State: AJcUukengtwQ56opOVkzBktXr2LCU3Z7QD3+nxt+7DOvHC9vgc7EV1Ba
	FZBeaQ7bfLiOXeQUA2MVhUG+du+N7mU=
X-Google-Smtp-Source: ALg8bN4xtJgbIx9au/X1CMPb0XZ4Ot9Yu963XFLDsUidnu9/jyme+pKb4bCg1/NcehV0D3nQMB4ltg==
X-Received: by 2002:a5d:4250:: with SMTP id s16mr8345911wrr.253.1547111003226; 
	Thu, 10 Jan 2019 01:03:23 -0800 (PST)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	t18sm11870581wmt.35.2019.01.10.01.03.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Jan 2019 01:03:22 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2019 09:03:18 +0000
Message-Id: <1547110998-17405-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] systemd: Add PACKAGECONFIG for gnutls
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
X-List-Received-Date: Thu, 10 Jan 2019 09:03:23 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_239.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index e0c71de01816..be836ffa42f1 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -137,6 +137,7 @@ PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "-Dgcrypt=true,-Dgcrypt=false,libgcrypt"
+PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[gshadow] = "-Dgshadow=true,-Dgshadow=false"
 PACKAGECONFIG[hibernate] = "-Dhibernate=true,-Dhibernate=false"
 PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
-- 
2.7.4


