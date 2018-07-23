Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5071D65C8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:09:36 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y5-v6so1049184pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 12:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qqEIzpW6bVho6E71XzYOaAM7LAFWKOmumLm18Xq0LQw=;
	b=IRBLGycSJMX2fvIBtJqBXJqDw1JrtMB9AInnfbKrCb2WQ19pCBu9knr0PgVfVBtuDP
	ADP69yFtn7oJx8lb6UZy2K9usbKprgNBPiFXMfnCf3oMzjAQGERT8GRZ5HAM6spzb7ya
	uVQYrrRkFyX7XYrRITOo5ugVwF1ysWddeg88R4EUsQYzoL1WziJ7aXLpfpFfUH4jqub3
	lxrNcD8ovTapcTfOsgr5X/tZH3xEFBDNZtLgKNHG9zmFTVD57zcOG0ZoDfGvnz1CxOfZ
	EzbO2yx96H50eLu4VrGOyy3D/HGc5mzz4vkoehAaXacyzhLgtZTjRQSQP7ixhtBSMVSM
	8kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qqEIzpW6bVho6E71XzYOaAM7LAFWKOmumLm18Xq0LQw=;
	b=srzo0BAhubBdxB7ISSMXzrSI1GjCk2pkEXA34KyIXUfw9wWff08D4RvMPIs0If9Ms0
	5REXMr4GFyWzCz00IoNFiIOS7VWM7b5Ze7/WNaM8g+koDZMlVIpfgdKtMW0Rqcq3fjDJ
	2jhPaqwvhk7mXrCHyGSESi2Nrgp3kno/GkCIbVAE3jeW+bNd+o9VxHwmRXSBlPmDhjq2
	5R/nGV+zILGjqBxW0xf+lZWO+7Kuw2a0s4agXw7XIMSXJ4kru83jxlj/S5Mldwd6iFZU
	kgyjra1Vuc4fCPxo+XOwAYkQup420NICuZgdT2gxnUo9J9Ed70xHyubG0MXLPZ/SeNZf
	j1hA==
X-Gm-Message-State: AOUpUlHm3U1+9UspXncSIOXBFOKrWBSY7Mz0IMlAxRnhbph9QPhuiR8N
	m9lYW9LLjyRoGn6RSdIgSG1X6BqZ
X-Google-Smtp-Source: AAOMgpf69s5rD1reeDJ1bqF6f3egx/kaLZg+2GLA24YAd3g9uIB5yKTb9H3Ac6KCbvsWhMj1lbuOcA==
X-Received: by 2002:a63:d518:: with SMTP id
	c24-v6mr13447400pgg.357.1532372977023; 
	Mon, 23 Jul 2018 12:09:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::ee7a])
	by smtp.gmail.com with ESMTPSA id
	p64-v6sm15696389pfa.47.2018.07.23.12.09.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 12:09:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 12:09:28 -0700
Message-Id: <20180723190928.27368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Mon, 23 Jul 2018 19:09:36 -0000

This has been an opt-in for so long, some distributions e.g.
poky-lsb uses it by default however, since most of linux
distros have started to default to these settings for security
enhancements, time has come for OE to make it default too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/defaultsetup.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index ca2f9178d2..352e279596 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -1,6 +1,7 @@
 include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
+require conf/distro/include/security_flags.inc
 include conf/distro/include/world-broken.inc
 
 TCMODE ?= "default"
-- 
2.18.0


