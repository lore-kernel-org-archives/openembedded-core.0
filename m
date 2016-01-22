Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B351731EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 14:53:00 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r129so216396589wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=IJMLNUwYcAbHp2trgjLOHU30eSrrk16vGh6upLjB1fc=;
	b=mtatOn/i/BBtKZ3G1aV3HvTpaFdtTzSpzVvORWhvietpuLeHtso299gRffS1St1eRo
	FBzIKcbqsSBfsHXqwteUE1RepI4LuPFEwu1DtA6UFHi43qfWFK7A2dbI22Kvr3qCdL3b
	2Ha/6Vcf3uC261hGEXFEGwOgbWhOp4ERzl3TDZVy87rKTFfeMtidSkGqFwWzjSI/ct00
	QH/2W+OLG7VLbvYN63G+ZlDTnDF0q5iRaTT8tbqgle7/n4Od4pK0KS8lo5LaR9AzG44R
	KE76Hr7vpREOrvGAUWmdyult28SqZF0SmD+HKKJd2UTdYaeoVD7zAxetudc3Bj1yjG1g
	okcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IJMLNUwYcAbHp2trgjLOHU30eSrrk16vGh6upLjB1fc=;
	b=WkYLkA4QSnDBW1Vk1F1jLqNPI8vVuQHE2qUM3FexMF0wt0Fxd6bY9mI9GX9w/m0KKa
	/u43V6lWPFPFi+ScZVDDkFnjT0zxpTYpjbg4rFLONewFooMdYeN1x3cGMZMFchEQ5VPo
	7QeRv4tr2bpZ95SaXSNQhSFtZzGUXXUXtiqn7Yr6sSotiNRw1h2W/HxzQwbaA8tcnL/I
	FqinQcSzI97rf8Q9GgMODUwumBlUax+xfkbSWJTerurbAbuHQsx32EPO8bWFt7QrNOKv
	Cy4Gf8A/K+P725yRfYQ+iUCkjVUgPsS2Q1eZ9lf6fc+eg2d/N8H1a6hd8DNCkWUFDz6o
	vNzA==
X-Gm-Message-State: AG10YORiggfuSS3/iLYGSOASXTqePcjiC4T1juE/TKLyf4JvobipGggL5v3EGOLgMkh7FjPw
X-Received: by 10.194.5.193 with SMTP id u1mr3545195wju.166.1453474380056;
	Fri, 22 Jan 2016 06:53:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	di8sm6261545wjc.34.2016.01.22.06.52.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 06:52:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 14:52:56 +0000
Message-Id: <1453474376-7094-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] mesa: add missing wayland-native build dependency
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
X-List-Received-Date: Fri, 22 Jan 2016 14:53:01 -0000

Mesa needs wayland-scanner, which is provided by wayland-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cd01870..9b316e1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -32,7 +32,7 @@ PACKAGECONFIG ??= "egl gles dri \
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
-PACKAGECONFIG[wayland] = ",,wayland"
+PACKAGECONFIG[wayland] = ",,wayland-native wayland"
 
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
-- 
2.6.4


