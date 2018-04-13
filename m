Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1638771AB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 05:06:11 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id c7-v6so5409585plr.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eRqJrYoA+YohnsTHlkGveLUCmXXEYJNLVK5zLXZauH4=;
	b=qsUFBSe4yWjRWY9el1tO/bNinK1d16fmFJFzpBBDUDdBrDQLRTlbPiPAjBs8cDdvS/
	QN+b+FWtTJrZ4W+qY5jfdPhOvF4kLm+jShP0XD0EbyyvyBYd14xa9uIjWWjYIfNJWc1s
	/Wk123CC2qEq5Cg9Nj1ZZT3RrpdmlFDuKyRok8u2Yrcl0RvQJZatZ142YGbfttV/IEri
	WS4CmJnTNoj3DnNKj+FUdri+azUKChIrYcEvmWhIbc3Qw5uAFrWEoX54eERsiK5U5l3j
	rREOk2HgLpzxmNLWoXj14PhLTo4XvhAVBEkpfI2xmHynjV2PZd6V6u07Hf050UtpMDo/
	reLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eRqJrYoA+YohnsTHlkGveLUCmXXEYJNLVK5zLXZauH4=;
	b=XR5hXwpD27v80QmQMUzff5x8FgCwXipjeb+Tvt0IV++/LgECOu2RUyTzj5XweeRi9B
	U4qUBsDlOi+TKLmOAQbewz5FnZhH74cJ+pBdddwMtHBp7vxw/jTrfsgAFibOvCauSi6N
	HFaFAicPcgQfXXbk7wUiVOBLarw7yQPnbTxdpfn7obngduFoj9r1P/SzfyB57piPpNYN
	+GHEIjh6thV7Wg2xLAKwlULXHMO/vCQK4KofxHnsRXkIqKF6ReRGs+XNQZ3TP08odZ1N
	uHOzOqlksBV1aJLmZZwVV5H+9myeNjOgV478FAix2O0oFK0kO6Q6DW+XGxXPascHZQtY
	wh2w==
X-Gm-Message-State: ALQs6tBL206Pdy2dk0NSoTYtk3rkCmnlx+r4K3kKkQ9zILDQ3bz2151o
	rqK+OnTUR9Jm4jd/DEMmJFSEAQ==
X-Google-Smtp-Source: AIpwx492KQcENKq8hEPZLeEPi88r+6UCwf4wspC8g7a2+4p9Zn6THeyBbwxjdaMmVtI8bZhRfZrveA==
X-Received: by 2002:a17:902:7501:: with SMTP id
	i1-v6mr1598273pll.211.1523595972668; 
	Thu, 12 Apr 2018 22:06:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	f126sm11288043pfg.25.2018.04.12.22.06.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Apr 2018 22:06:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2018 22:05:59 -0700
Message-Id: <20180413050559.41968-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] glibc: Set libc_cv_ssp_all to no as well
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
X-List-Received-Date: Fri, 13 Apr 2018 05:06:12 -0000

This is not a problem right now but if we
were to use -fstack-protector-all this can
cause build errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 9e02ffdff1..ce1222be68 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -50,6 +50,7 @@ CACHED_CONFIGUREVARS += " \
   libc_cv_rootsbindir=${base_sbindir} \
   libc_cv_localedir=${localedir} \
   libc_cv_ssp_strong=no \
+  libc_cv_ssp_all=no \
   libc_cv_ssp=no \
 "
 
-- 
2.17.0


