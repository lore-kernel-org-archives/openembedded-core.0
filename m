Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 61F547F397
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:46 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b24so7256087pfp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tWN7YDDOx4D2WWY9jRYhDGm4L9n/YT0eLXhSdCEVGzY=;
	b=JOtueXXllKx89w41e/0Ob+oS82GO4WUM8hHtNL2yxcFERKwaM7l2X1KycAQfeHTPF9
	L1hkX1K+JfzHrHhhh6a+iOACparKUdEBMf9QZ+t8FDztSvXh8yyvIQ0D+l8HFmZIiWgy
	BWCJKDv6KSU2EcNMMyF58IwwK4xEYAboI3icaIB6guPWFOGSx3OiYh/jFO69PyeM1r1K
	7a1AHfYmQZIV1u1KgaSKJl0m/mwPS5jgNbtjFVZEK6Itc4/kcgV+JX5wcS0ltkyH1RXo
	eGYb9GScBNeuhLp+JeIjBRmd/sp7kYVbQRkunC70zDbwHc2OHI9SOi/6Ic4S4g3eEor4
	1mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tWN7YDDOx4D2WWY9jRYhDGm4L9n/YT0eLXhSdCEVGzY=;
	b=uAUsvhKGHzOVCCwJLQQKaQGAXpLokwabzLG/hNeDITQOpYM7cZhyvfEszkczgoolpP
	DCXFymxk7ITRm009pPkiuYMgS3Dj2pcgdoseS1gLLKFMItSpUu59Z9M27S3CEpccvtq/
	RN0i3o6M/iJXOv6vWoxQpXxESCWNkiPkF6H6ZSzcJC2UvREDH+Qvgq/8nfotJjAsBHG7
	sVuoTBsRdy8wh/ZY6siQtH8OUkWZdGn2Nb/WPqakba5QMgTQ5lQ3EksciGS/o2ZvFI69
	eyvM+/16QD+pLwSnCZk+HzrckqjhImZBzwqqE4U6giwT0XCHUzdf2jDp2IcOJ01B/p30
	UpoQ==
X-Gm-Message-State: APjAAAXI/xb8iNBX/ZH8mrBKo5Vqbx6CYhOo5/BexoalTBDbX2PzLBUm
	jgACk7NX2+8RBn5Tb6aXA5RHkc0+
X-Google-Smtp-Source: APXvYqwnXGXP1yxdSJWdmykIAJiOeKJQxC4XPmPu2Bs5Sagze9oyn88gwLKHfcyWEVstBv7QOYiEAA==
X-Received: by 2002:a62:7912:: with SMTP id u18mr7776984pfc.254.1566593567273; 
	Fri, 23 Aug 2019 13:52:47 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:35 -0700
Message-Id: <1566593504-21918-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 04/13] tune-ep9312.inc: fix TUNEVALID description
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:46 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-ep9312.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 4d92821..be20eb3 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "ep9312"
 
 require conf/machine/include/arm/arch-armv4.inc
 
-TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
+TUNEVALID[ep9312] = "Enable Cirrus Logic EP9312 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '' ,d)}"
 
-- 
1.9.1


