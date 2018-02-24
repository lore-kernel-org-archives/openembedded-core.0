Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4F6C7885F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 04:12:55 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id f6so4110476pgs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 20:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GJARVlgvRIzZ3nI4AQUoMzAszyJSxLIUmM41AcUCsl8=;
	b=Bix55GtPFQkAsorF1j3smOcUM2G0DbVXqa9F3j0w4HPG9iwy+G2Gug2iN39MO7CEyk
	Gr1zFKmtb2pnrRn0qVOJ1KgRp6B7H2Q8W6E57Yxji98iSRHV/2dps/BXUwMPSY4JiSvV
	FG61JcBzUdjzuvbPk1z5+XxO8wuyC+3e+DUm9l1AflRF1bhO2EtkoiwUzzZ8eePp+C3+
	E6xYTkRhjrP36nFARSG1naVL8dtV3bsGs8UZBPwt6Mm+JOs75S6zqB5C+sZrAi0ww2me
	9eg5wlPPB4Oc1bNGpx7loPqGBv0yEpQVa5vAbu6b0BnyPsxCNGdXyfFmbXVfW9ZtmYjE
	uEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GJARVlgvRIzZ3nI4AQUoMzAszyJSxLIUmM41AcUCsl8=;
	b=h9rm2gEl9UXD4D1eqI+ksdRvoWEJKdWRnIQ5enNh6PmIPJjIycf1cfW1QRQjRxwLxj
	zp8hoJ0duwEBdYcNmGLrMSTy76jAW8KZy/YefbSp2strYUTb5yvVvASnx8Dz6ZfogP6n
	cU9vXy1DpKuXgFrl94thdGpmoKAbkoBuGwBx0gtl7hK9Uc5IQCpV/su9GyVit7q7RYAi
	1q4O1CJDV9hfim0bmGvRO8gifVrquy3efFhxfsWynOOlw9a7Ve8gzDjo1nJvmS/yc8XZ
	tfQxW3nbA/qUBqhvSznco5oN4+Pj4rqQzDmCQBKAljwbQmxkPNzWU7dhhofCo9K2TXeo
	n5PQ==
X-Gm-Message-State: APf1xPAQqJ7I70QKWyy09U02THlm30SYSwal+uRNeSbGJbJnDmz1s6Ph
	iGtof0WPfRgDpm8U/ZJ8582l+w==
X-Google-Smtp-Source: AH8x224XHDGPS8xb9+cqi3AsqeC1XyeOEmxrdsaQnaZ10Ctcxz4HCmk4p04VQRylkXApy+GBvf/Usg==
X-Received: by 10.98.137.147 with SMTP id n19mr3883380pfk.193.1519445576746;
	Fri, 23 Feb 2018 20:12:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:d4a8:b8d7:4edf:beec])
	by smtp.gmail.com with ESMTPSA id 186sm6641324pfe.2.2018.02.23.20.12.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Feb 2018 20:12:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 20:12:52 -0800
Message-Id: <1519445572-25411-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519445572-25411-1-git-send-email-akuster808@gmail.com>
References: <1519445572-25411-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 3/3] linux-yocto-tiny/4.1: update to 4.1.49 plus meltdown
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
X-List-Received-Date: Sat, 24 Feb 2018 04:12:55 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 537efb1..5adec18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.43"
+LINUX_VERSION ?= "4.1.49"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
-SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
+SRCREV_machine ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
+SRCREV_meta ?= "4e12cb8f8e06636f2058ea0ab3096ed38228a88b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


