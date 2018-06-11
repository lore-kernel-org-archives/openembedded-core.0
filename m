Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4715978C9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 22:03:21 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id g20-v6so13114163plq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 15:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=oDzR6GJx9r1GKjxCAqQyANuOyzmOU2RkdMNQAJ9nHsY=;
	b=UQEIv6/lBFLyfVPrVcUGMrTIiQZtP6Ishsw4YYHTbmwtZlQTkI06dbSLmX5an18ShY
	S2za4s351HW/K2b7Xe1CfH98WmKC5y+XuUAzb6n5gfiOpBAN/kWq+MEbDLMoYknVt5O7
	RlsXMuBtK6hnAD6j+5Ds9/Z3ZsM3mI1YpeYbiYbjv6wmg6n8+fIAUIgUu3xSEbaRuAxM
	s0Djwq9cKSNGjoUdMs0f4zmx3EqRs2zndq5kUnWLREh6jx3SpR2UElYEVXVwavLcDUwF
	40hb8fAOZbJ5MSqup0rnTw0qK0TFKzEzuG3jl6ceD8K4INX5hIT2Piwq7OliuVcga0bB
	bLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=oDzR6GJx9r1GKjxCAqQyANuOyzmOU2RkdMNQAJ9nHsY=;
	b=gZ3KbhVStUcwGME1yD0Ak8ufYRmLtw57K3/jfM+DWSdzFiNoQUGj/4xDArIjYEQRyG
	hZtmz/AID3VapdErm3g5DEvpOmq21MvFNHIVT2DWnrmW0SFKlgAm7k6pHUDY+7MTxJyy
	9Z6UNY1JtpF63dsV5rDb36M2vrieOWHHQIzfSrEeDCLWg6BXMocbiJCO7+JQadldvLcG
	mv8u/Jh/DLESNbgMRx5nKXVktnGYzzRvmkyfWnBqBzrsUn1PuzUsjWi1jcobhuZNHkm4
	l/HY9F/XxGcKwiXHxyBr6X+ERuWNESLoE4F7oxlVP3B3KtmWTmw1TNU1GOZb49TfC+ZD
	LJSw==
X-Gm-Message-State: APt69E2vwIafm7iI7OpywrDI6dmsonySOE6ecC/LGMNK9FiZAVUBKhw7
	VYnodWFaL3GDSnej9sWoYtV46w==
X-Google-Smtp-Source: ADUXVKLrVDGuz87PiTQ1mXVHYxP4vT/Uj3Oz82WwfY7lB5px8Z7NqRXes7bfUpWLBb0DFX+/9ygNHw==
X-Received: by 2002:a17:902:7202:: with SMTP id
	ba2-v6mr932253plb.119.1528754602233; 
	Mon, 11 Jun 2018 15:03:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:3dc0:dfd2:694f:63cf])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm54472855pga.21.2018.06.11.15.03.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jun 2018 15:03:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 15:03:20 -0700
Message-Id: <1528754600-26824-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] busybox: remove myself as maintainer.
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
X-List-Received-Date: Mon, 11 Jun 2018 22:03:21 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 628edac..08d7e1b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -85,7 +85,6 @@ RECIPE_MAINTAINER_pn-build-compare = "Randy Witt <randy.e.witt@linux.intel.com>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-busybox = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.7.4


