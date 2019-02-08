Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id DB8346C0EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 05:21:53 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g189so1067912pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 21:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OOiTkBZ9EOJQxFc/2cynN0Qf2BSbG0EPaXcAtSFdTVA=;
	b=E55Nxr6UVhrCunqewC38vxCuPVNqeDtGJdy3qVFKRVF5WIsaBbtJZyOer2I7a7SehG
	QONQOLWOfRI3QNrIMN79Hv9tA8ZG5JXujXs+3mUV7GsbcQXpvmZccDasn+QC1SbKn+Iy
	tfuWMkcaGw5hGJRySy+66jKO2goArxCLYSNa0At+uV2/KP4+O7C55Af1VzDxxi7fn374
	TdnNSYztjVH68wGag2C+AYQMlhO4zmU8RGT8oD/coVRq3+aJyxUyLhCui/LT7cD/MGoL
	5VPRKWx/IPGQNle9AqoRue4qbq7JLX5dEKEwxcCGID8acs6+qxjDyU7m0t0thJCmT7YV
	bbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OOiTkBZ9EOJQxFc/2cynN0Qf2BSbG0EPaXcAtSFdTVA=;
	b=SXfNuB9mzdC3OxVyqd/iT7P5ckU05dPY8KZZhSoZ20Nu+QnSY/KaYhtgW4QC4OdpZP
	Z2ePN1WM1eQyqLMe1ueXyRScE8ofzDPUd1PaQw/TPh01l+znZQ6vbTCigrbYxmqWuuY9
	CHcic4UgL5E4Nh+9xjTU4i7olV9wCRBdYZFlmZruXRIsKNdJo3Fu8lkRj9ikk6SEuL+4
	qIUi4I6qNGN992wWlxX0SS+Wrb9e4bQhe60C+wKzgXtPz4zdOME7hxTGfmMpW6M7Kn3h
	0Bie1Fm2Jb3IhEATh60nQ809abSWSLG6/Lp83W2ZC723MnwKubWwaeN8t1vVjyFbGsre
	tjYw==
X-Gm-Message-State: AHQUAuYUjdKWTBSVF14wnfNgnbQnd189iP0pqt+nmX8EzNDXVGiquTI4
	kAyWkiHTRcDDSXZOZ3o/+MTCtFu8qFbN+Q==
X-Google-Smtp-Source: AHgI3Ia85AQsF0kwk1h+UqlfyL3g9sF7opEKuj2b4c5OAnNijUQJUpJlPbO+Rjfl+0fBiTsUDXTw+w==
X-Received: by 2002:a65:520a:: with SMTP id o10mr19244632pgp.276.1549603314769;
	Thu, 07 Feb 2019 21:21:54 -0800 (PST)
Received: from ip-172-31-26-68.ap-northeast-2.compute.internal
	(ec2-52-79-217-225.ap-northeast-2.compute.amazonaws.com.
	[52.79.217.225]) by smtp.gmail.com with ESMTPSA id
	n21sm1581519pfg.84.2019.02.07.21.21.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 21:21:54 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 05:21:47 +0000
Message-Id: <20190208052147.2958-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] maintainers.inc: replace Changhyeok Bae's @lge email address with a personal one
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
X-List-Received-Date: Fri, 08 Feb 2019 05:21:54 -0000

As I will leaving LGE, this address will no longer be valid,
so swap it for my person one for now.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8d6eb1afc0..3890f2a65a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -99,7 +99,7 @@ RECIPE_MAINTAINER_pn-clutter-gtk-1.0 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-cmake = "Pascal Bach <pascal.bach@siemens.com>"
 RECIPE_MAINTAINER_pn-cmake-native = "Pascal Bach <pascal.bach@siemens.com>"
 RECIPE_MAINTAINER_pn-cogl-1.0 = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-connman = "Changhyeok Bae <changhyeok.bae@lge.com>"
+RECIPE_MAINTAINER_pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-connman-conf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-connman-gnome = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-console-tools = "Chen Qi <Qi.Chen@windriver.com>"
@@ -168,7 +168,7 @@ RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-ethtool = "Changhyeok Bae <changhyeok.bae@lge.com>"
+RECIPE_MAINTAINER_pn-ethtool = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-eudev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-expect = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -280,12 +280,12 @@ RECIPE_MAINTAINER_pn-initramfs-live-install-efi-testfs = "Anuj Mittal <anuj.mitt
 RECIPE_MAINTAINER_pn-initramfs-live-install-testfs = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-initscripts = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-intltool = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-iproute2 = "Changhyeok Bae <changhyeok.bae@lge.com>"
-RECIPE_MAINTAINER_pn-iptables = "Changhyeok Bae <changhyeok.bae@lge.com>"
-RECIPE_MAINTAINER_pn-iputils = "Changhyeok Bae <changhyeok.bae@lge.com>"
-RECIPE_MAINTAINER_pn-irda-utils = "Changhyeok Bae <changhyeok.bae@lge.com>"
+RECIPE_MAINTAINER_pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
+RECIPE_MAINTAINER_pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
+RECIPE_MAINTAINER_pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
+RECIPE_MAINTAINER_pn-irda-utils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iso-codes = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-iw = "Changhyeok Bae <changhyeok.bae@lge.com>"
+RECIPE_MAINTAINER_pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
@@ -716,7 +716,7 @@ RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-wic-tools = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@lge.com>"
+RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-x11perf = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-x264 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-xauth = "Armin Kuster <akuster808@gmail.com>"
-- 
2.17.1


