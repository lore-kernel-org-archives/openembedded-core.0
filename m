Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id C40517713B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:28:34 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id r21-v6so5642337pgv.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T7RDu0OlMAGmsOKHVQKnvNkSmrDCau1ZmaAwHmHWB44=;
	b=XYm2XCdcTla1uZgC2CPTc+NrLLldNydUJMXy4imCe9xWGlpCTI1oOf+m2V1t0b8f2p
	UhELamVOSXaH7r+NAbnUYn6oie3ASpKGeQe4TIIKO9wEtAS/djjYRM5e4PjZ7lP25KBd
	wIJhfQyZh7+J0DQjJgl5oBDkRrBSl3jjNhPs88yyJEVJ2rSPnOhuaRgW4hZrrd6SP9Iv
	OUMCRRcWOYPTAutJ9IYPe4yegwWhyJAUafE1srcO6VLkGZfVrMOIKh4RBSzdvmtUJ0ob
	5dEbMN7/Dzvrq+lwGFjFBR6r4fc+J6+4KEmIfFLSScXWaMSHMKuFsnCKvNTobsvcUOTm
	yGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T7RDu0OlMAGmsOKHVQKnvNkSmrDCau1ZmaAwHmHWB44=;
	b=H2UzFl2jTYtbu7eevWVzZfKcuO+ft8rfRhdc0x6TGGGCRK54xi6w/GWQPSUvMeWaOJ
	tZkxpJyfj32uq0EefFgQNGRdE0RaQufesq+dR+corIoo54vkEm5zmQFZK96uVbgGtLNp
	L+K/CFLCM61pnV9E9cclSosShvQ+hKS/tGh6p6EDzZ3s/BgtZlV+dlcnyggjDSoOTZbm
	HhBmQyTyIpOHX0g4L87KKPHqcKGvXKBv812fdG7X0oEiA3fBpNktdK1nLpf9jwAX+n2C
	RFwuy/5gyZdMSr4+R5S4iQcRqS6PvpSVzCjg3sTjXg0zHPP+I2xOZJPspdgvdL1nI2EP
	CMWA==
X-Gm-Message-State: APt69E3e5/UA4lZyTPpEJzwpJIShcWSvqQiJOtJ5/mBb42icMjpdWuU6
	YCKRqlfHdRyrGFdOF6ibkeyD0Q==
X-Google-Smtp-Source: ADUXVKJqCG2N2ac+zeBkosZbxweWVPe0hyLbrv8tYgFwbkMrvqhuUMlixiFi6tBdMaOgoYIH8Y9Xhg==
X-Received: by 2002:a63:6185:: with SMTP id
	v127-v6mr4138290pgb.301.1528442915618; 
	Fri, 08 Jun 2018 00:28:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm33935578pfk.12.2018.06.08.00.28.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:28:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 00:28:27 -0700
Message-Id: <5cd02eb482d16a30056d860dc3ef24b365eedc88.1528442551.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528442551.git.raj.khem@gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] tcmode-default: Switch to gcc 8.0
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
X-List-Received-Date: Fri, 08 Jun 2018 07:28:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 8e15f694d0..cb17061706 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "7.%"
+GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.30%"
 GDBVERSION ?= "8.1%"
-- 
2.17.1


