Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 322426AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 15:15:27 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g202so4952337pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O/RKwu/UxIIDUcMocQ/QIOQltFFD8pFUK49Twsie4hA=;
	b=HumPrzJg3WABwf8PFwEHGBc2HEif2Cmc0TdAKSaeZzz5NkkwkVUqgToqJ9DqdRtmLa
	hOvrfHTZO9Yh7q8+3qrJgKziJyovIHX8rgaaKRtqOU3PfdbfgQAeX8DCf0Z/UsmeWPmu
	J6qZkbc8LrBhGkNjNXXMckdRyMrYAQwdkGsSFYTcZd8Yf77ChuvhusxDMQvgSkBumoXN
	j8K/yJEV53Hc0CiMUczyEdkWTy7Cd51sC4ZTVXHhbWgJW9d6V/OT3bgHiCW52plq9AVu
	dtLuidsxuXrcLNztNp4Gg7Ep0/wcRYczkBBfTZ1iDl2mvxgvZ5B0E5ET4+MinRzPB8AN
	RwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O/RKwu/UxIIDUcMocQ/QIOQltFFD8pFUK49Twsie4hA=;
	b=ExJJT/oFf1onvYVwRbgWWaYGBu9T7YQg7UvpYQQ8qMPtZCXiPRCXUHoEVk4mEV8Qdv
	8s8vQBFjH6l3NCQ91HaKqn1AmOAXQS/i2UJqVyas7m02SflTV6W0EfKKiAYn0/cTEvGk
	Q2R2sHTXe74K/pPa8PYdRybY/kK+smOWKr0mtO1uTjdMiI0X6gsnagpguAK9jz2RcUeG
	VvFdmunobWY53cTiYNr7Dj/QPgjmN2vWVWSJE88iAlSiwihytocThC186v6iwETzDyIa
	GQs1apWFhCCkap0r6jV+lCJKHPUGKZrrwR1XIPe/9Cx5Y04v3T+7Qcme4FpqBo/Cd4TK
	cEyw==
X-Gm-Message-State: ALyK8tIzNlaTNxhUlBNZ7IzvrGHdCD/Ro3H9zNGzIvO4BdhdHzjZR/+7TXPSVdER6uXUWQ==
X-Received: by 10.98.18.221 with SMTP id 90mr13403668pfs.3.1468509328387;
	Thu, 14 Jul 2016 08:15:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id h4sm4399795pfk.47.2016.07.14.08.15.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jul 2016 08:15:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 08:15:17 -0700
Message-Id: <20160714151517.3367-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] musl: Fix mips regressions in 1.1.15
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
X-List-Received-Date: Thu, 14 Jul 2016 15:15:30 -0000

Bobby Bingham (2):
      remove or1k version of sem.h
      remove obsolete gitignore rules

Rich Felker (4):
      remove obsolete and unused gethostbyaddr implementation
      fix asctime day/month names not to vary by locale
      fix regression in tcsetattr on all mips archs
      revert unrelated change that slipped into last commit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index ac321fd..b2cea7f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "faf69b9a73d09fafcbe4fd3007b8d8724293d8e1"
+SRCREV = "39494a273eaa6b714e0fa0c59ce7a1f5fbc80a1e"
 
 PV = "1.1.15+git${SRCPV}"
 
-- 
2.9.0


