Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B14767C857
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 11:28:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w6so2397784wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 03:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h4Cotz79RFxLyUpgJ1emBo/wfR7GOCYWlDJFhb/cmu4=;
	b=gWEBRPnI7Kjm7N4mcVg0BrLSpPw7l1K3lxoukroBolO4frUJoO2PumfiOb7MOhs9Ad
	0nGVyvxR8Sm+vwhAkK3Ln1wYq+gcAP0hV8GFm33jpJ7Q/AyIad4o9izTYeXMjnBgJGh1
	yAE7txsc8ReQBDrHrz1CTNxd56TJou7vNNA9IpTbpSPJUbc6dC69LI8c6Lsk7yz0AbIN
	1mRdsMZt6/p8a1xo7uI3xARhF5o/SSE5OuWwLbdtj5liD3qep2NRKeWHm8m7X7k0p8Kb
	CCMiGidYAz605s7ufFuYb+YEKwJWbUdpwjV0UYN3e5BaoXT2l4zu6h9/mE5PREpiLP62
	EonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h4Cotz79RFxLyUpgJ1emBo/wfR7GOCYWlDJFhb/cmu4=;
	b=W2LlFu4xAg9Hl8HSdvaDEDJR8i0Rb3h75ydV2ZszgXmWT/m/Lk4Ni3N2bXRtd8bqbW
	wBCDePx4MZoCsxhIJ3lsBRCJ1ShkTYMrn94N9Y8qVYhqFkeYZJFDFkECjIjxHiYEPmcm
	ajJhw0mv2QReBx0obBqayH28WAV3AH5Sa8yk16alKmPD733WFhwoda5oG6G3mjcRWAo0
	xSOUS7iEQXRuYv7MbUviMM+oMyhCrhzvPqCIYugYaXeoYhSMvGNqLDZSq+/UgojeLdI0
	M8XDHIR23PYfH4kMTTuh8ucjMi5pVSO4VJtcg6JEK+6gAd68IL72+fdQs4IM+0ne5FAh
	vONQ==
X-Gm-Message-State: APjAAAV1k3qJc2pVB6ZsOfFDuO6xm+A/z2J7qXCSfMv4Xw5OcLPP1Iqh
	UvX/GC7o8T1mhQB8pTW7e+OvB5g2
X-Google-Smtp-Source: APXvYqwN0nC50HLcfl99oDXNaGPIH21v9saazSpLBylBi+e5nL4QRQjlTBI3TEa6Hpk07ox8AsHDpg==
X-Received: by 2002:adf:a147:: with SMTP id r7mr8930345wrr.5.1551612486262;
	Sun, 03 Mar 2019 03:28:06 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id r6sm3773462wrx.48.2019.03.03.03.28.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 03:28:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 12:27:51 +0100
Message-Id: <20190303112752.16353-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190303112752.16353-1-alex.kanavin@gmail.com>
References: <20190303112752.16353-1-alex.kanavin@gmail.com>
Subject: [PATCH 8/9] local.conf.sample: enable gtk+ frontend in addition to sdl
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
X-List-Received-Date: Sun, 03 Mar 2019 11:28:06 -0000

As SDL was found to be buggy for virgl-based GL passthrough,
gtk+ is enabled to allow that use case.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index 9068e567dcd..2775e15d748 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -238,11 +238,12 @@ BB_DISKMON_DIRS ??= "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. By default libsdl2-native will
-# be built, if you want to use your host's libSDL instead of the minimal libsdl built
-# by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-system-native = " sdl"
-PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
+# seen. The two lines below enable the SDL and Gtk UI frontends as well.
+#
+# By default libsdl2-native will be built, if you want to use your host's libSDL instead
+# of the minimal libsdl built by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
+PACKAGECONFIG_append_pn-qemu-system-native = " sdl gtk+"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl gtk+"
 #ASSUME_PROVIDED += "libsdl2-native"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
-- 
2.17.1


