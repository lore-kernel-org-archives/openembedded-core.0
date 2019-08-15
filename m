Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 03A046BE2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 03:55:09 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d85so696458pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 20:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=POfEE8fdlbCNELwGbTH08I3382cawLb8NNVdq3tIkY8=;
	b=qNri9XdhFf9olBY03h0JdQl/BB75olK1nmoCOQs9QpQaNXh8h1XhwJF6XqczSqSMwG
	3XlcViz8EN5UbKevfeO0FGVJfuS5seUXcriu8ifjKOQurWXZydVnDeR5V5S1n2KF8ppV
	ifALod0XAFvoAYmgEDnljLHfGZCW4CYzHKWe+D9dUxDMslvV3YzxTzPPMdkzhNPykNG5
	qyDDUzDa8r2/ZaK+WghCu6JImR0inGYCVJolvLwsl3Kc5iV61t7Rq0eBaSNSfwjnUaYW
	uE7vkOwc3QMbgf72D3kNKKmhA1N+Rqm3j4V6AyfBcTVu8y4oAVuDsueW3Xqrtyn2jhmr
	PA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=POfEE8fdlbCNELwGbTH08I3382cawLb8NNVdq3tIkY8=;
	b=g55eHY/xctNLvkQZIwmdrGoD8ZI4Ovxr6f3PFoHPtui9jsIlYeFpic057PuA6RFF84
	L22dv7jVACVzGI8DKtI0ZYWZKIfzjeNLBhHkZBsPK/BV5hKQKWgjvarniEf8YkJUHrOA
	6o07Cr9bKl2nuaZctfvCCmCo6UgbQifpuh1ewLZ/ZHeM+FmnYu+u54vSN/c4qQi5ydmw
	dHwguw8TQZOF2pU0YrXom5nJ61VAnTkJdUW7zTh9dk9DWYB0fgTAwNeIsOsRG8XwjpLK
	5Zf0pZjx3AUx200t05U0gg3W3Xh8CIPC0hG/uu4IHoiE5evGK8jUwWcPzQOQVKPk9Sqb
	joag==
X-Gm-Message-State: APjAAAUX3XANa2+WjiGyecST3zGCcvLmnkkuTKISepL6B6+/3ZB5svkB
	37p9Tfi2XdjsJ5dxuDmCfRBkZvaebzc=
X-Google-Smtp-Source: APXvYqwG4T8DAwb9Fuscx/ieBTzZDiui12FVzaU3Z35y/tEgezlIJ6rO1XIGeA8Ef60SDILrOptmrw==
X-Received: by 2002:a65:64cf:: with SMTP id t15mr1996655pgv.88.1565841310205; 
	Wed, 14 Aug 2019 20:55:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	x128sm1554494pfd.52.2019.08.14.20.55.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Aug 2019 20:55:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 20:55:01 -0700
Message-Id: <20190815035501.15767-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] systemd: Refresh patch after removal of __secure_getenv patch
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
X-List-Received-Date: Thu, 15 Aug 2019 03:55:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0005-src-basic-missing.h-check-for-missing-strndupa.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index df1043b27d..47ee2795a7 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -76,7 +76,7 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
- #    define secure_getenv getenv
+ #    error "neither secure_getenv nor __secure_getenv are available"
  #  endif
  #endif
 +
-- 
2.22.0


