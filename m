Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7AD7DDA8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:13:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d12so5949176wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h4Cotz79RFxLyUpgJ1emBo/wfR7GOCYWlDJFhb/cmu4=;
	b=jHSP9zrCPgm2OgJUw4pzM6yxC4sSl8U+ANcLYjHHve69MGjSI8fbe329vwPsgjL54M
	N/TaTz2vA4OyqQSPBsOk8TDhZxo4SaWDDUZNmRCTuTah8M7v6ogdghLFaWsnXT/SiLAk
	WcKjwIuEIvEJ4zs8UpHSprICqUaBVo35fNC1zzMzXC5YAM72Gk0oLLro7X/hEIRMMq3h
	DcR46y6xcAJbbpSlKoK7UIadDVYNDHImtBEwYcK0ca/4PNnaAbjtY+ItdAIp+mhanaPo
	p5LILY6BNLIDmU2ys03vUsaPZzLUrC5feQvKcPAXnaFbql0Px96Q3AWHJDQCCsSd+Vqr
	fSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h4Cotz79RFxLyUpgJ1emBo/wfR7GOCYWlDJFhb/cmu4=;
	b=FAhA6YZiZflDeZwap2Clcd3OOl/tn+PItFJ6QcrZyaTsjI4Pu7+e4Rdf886LJZwC4x
	SpvgWIikREydEh47YY89twNu0JPe73TZSy1tpl2eO0oXoDfoMXyTuzpPvVSddMA8WV4i
	FJpFFOhex4W6nnFpmhVmU4GhbFvcAz+sRxk4dWl+ekoJdVv3cS0nQPT4xs8GjtMxog9/
	TlPgM2kn+zpQXc3drmyHZae9DI7YwnpAxvzWS31xy2e0PKgf9I+EoVzx1JMNjbduKGKQ
	f/FIqvWJNOmgy050KWpBVAZ2FFEGDAyHASx6pAYGZcBW4G/jFVVAogZnIE8VcG59grzg
	ukhA==
X-Gm-Message-State: APjAAAVgLx4nhT5HzQTpjN4NGk2FpRtC6noZ0KbxNnfvnzkmY/2qBaSd
	CXBug/w7HcoSZ2fqgbC8pZK4EWtV
X-Google-Smtp-Source: APXvYqznKnrvHrqcjuwxHxlsgA/Xl5l2zF0YI+5+v8U5rsrvfT58w6/3dBRVq75NZ7CE/CdPQt8H+w==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr18698220wrv.111.1557310415876;
	Wed, 08 May 2019 03:13:35 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c20sm19088365wre.28.2019.05.08.03.13.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:13:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 12:13:25 +0200
Message-Id: <20190508101325.51102-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508101325.51102-1-alex.kanavin@gmail.com>
References: <20190508101325.51102-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/5] local.conf.sample: enable gtk+ frontend in addition to sdl
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
X-List-Received-Date: Wed, 08 May 2019 10:13:35 -0000

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


