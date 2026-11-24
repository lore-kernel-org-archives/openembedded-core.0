Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30994.1795560771425593999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=j80u2Hfs;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so3907890f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560770; x=1796165570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0M4jH7K/Ci1JBjAAsgFKXoHodUPGwrw5ETQyI/d9f6g=;
        b=j80u2HfszA5RLAyKRfiUZwCCAt8ffj0HuHkoJTZQFBA5mX82vZy9T0Vte70zNM6m62
         r/Xi/WGWLtVIRkpy9lVuEciGxLDubSOiJa7K/84y5PjRBkJOhC0p+kYj0WC0rWcd2Z0B
         jdc2sQ92mlx5R6mRYvz1RAK50gdTIGkzeXrGUWLoUTR6qZG1W5RahLRW6iTGM0xQrCM2
         FPKkysvyVip6EZANRSGNPnXtRboiFCoIwUoNHbvXYczotlhBCGVKM8KtRQ7aVXuWRep9
         /Zjc9cL/18qTr7uUk3TS+wdFIWP5yDwUv4shh6Z226dJAVsf78vNAlL2s+lro61a4m7n
         hnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560770; x=1796165570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0M4jH7K/Ci1JBjAAsgFKXoHodUPGwrw5ETQyI/d9f6g=;
        b=DvWtdmaltHvY8+wQlnWSWsfPr+mLQG+XX++DP3DhraOCt6hY40mO1NbBgMomdJSubM
         5nRkxD7Y+5qCOKky/haNmf0EOYdcyQbyjLlomyDx88a92YYo2o+l14JxJL/NRPSfKQrO
         KzC9nyLAGBlLRBppIZVBKX/f8PqWs/2leE2ja1+gsVAFWuB/dm5TMDY2T1jPsPqaGkny
         Y4roPfv7XRZ+yHBhQ2zMio4kV3fsfBPJKzc8RBhg++pl2UlbCZSuG1FDeszqjLjQhKvK
         FXIrZiOqdYQA8SqrGi7YV/375E+qbZG65oxWsWAR699G2ePB17qHB6IIoXJJJpBzwavG
         CnaA==
X-Gm-Message-State: APuU4Z8R/m0S01AfaoTu6KRww3jqRz3cydRBv3B7G7QlZnq6uPJaSG7W
	NTeZ32y1XRp9mBw2szUre5WfcbigCkZMNVsGzPFfgieHO9X7PCDrlrzfXom4wbTcBygq8YKSR5U
	fDqmILrE=
X-Gm-Gg: AZFdTZfGzV9TjORTh04Ga3Plrr2Np6C/nXLuXQ0G1HWTT9pQeDRcW80eIlPmJ1ZAOgA
	zLKcYLikFLqn/LRUTZkhuji83idbm3jY0jqrBE8OjGgsBL7TdJyJGDGsilxqCKjzwCKXejx4EYN
	RGfZ76ZiXsQu/NCMhzU+TQuQUv3/8DNwWi+9rVAyU4RsXrwjSIiCvxJOLjA29bJ9UPLmd7xJd8e
	2KFg+SxYdr2WY21lAlO/E1flW3CEhNumkubtf7n+kba9mRsmW0gM+so7/9b3aepo3Qtec7DAujI
	3iiE5RtO9AyY9PueSRNCslKwpcNTOUnv/Uo4jW3EWi5apB4sImHFxiu0SIfZPun9+OkBQxMEzu1
	4vF4UmLJdXEtxm/pB3BdiqW/7ujR2onDJR+iJJ/tvzpD81aPNKwSvN9dQ5uf+QkDX8EePEKfgHJ
	ZPtE3RmJ5OZwRQZit8htn+pn8wPAl3D9awXYWEfgOeswde0w643hODtPyzeTFH7B1wi7+m83GTe
	2zWNFiKXpNZDnX8Ig7PNjCTLEQHghcaTHA/TF4/w/uKtIINzDWPog8Au0NxnItLTTybUt5XB/nf
	6Q+jRquuYa2qSiC9Q2MsfSyh2E0qeV+Q7+RXH60ytJbe20CUWN3xyQHn0Zr9mqvH8pn7dgk6YlZ
	Ps0CfgCYf9IAnqCMAq+mCKlLJaTCa
X-Received: by 2002:a05:6000:2c04:b0:4ad:2699:74ec with SMTP id ffacd0b85a97d-4ad269975e8mr33024652f8f.39.1795560769713;
        Tue, 24 Nov 2026 14:52:49 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/21] popt: correct CVE-2026-18739.patch metadata
Date: Tue, 24 Nov 2026 23:52:30 +0100
Message-ID: <db8cf04c12c68771cc1711b12e02ac70f51dd683.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251115
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

There was a typo in CVE tag in this patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15c5b3e7ff3e62b1763dfffa127875145b74730b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/popt/popt/CVE-2026-18739.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
index 0a1e8f35907..94366f63437 100644
--- a/meta/recipes-support/popt/popt/CVE-2026-18739.patch
+++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
@@ -14,7 +14,7 @@ Co-authored-by: Panu Matilainen <pmatilai@redhat.com>
 
 Fixes: CVE-2026-18739
 
-CVE: CVE-2026-18743
+CVE: CVE-2026-18739
 Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
