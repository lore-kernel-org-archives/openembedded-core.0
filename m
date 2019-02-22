Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id D00F77CBF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:33:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q1so2603205wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UtmxmCg16WdffBbFRa24yZsSze/AZo7pY02uwN0uee8=;
	b=PGcg47fwIOfexpFwbmCaU2LIHgy1tfkyYyQRUkpwGDnzH5genq+z/8R/3bpFVXk98s
	Hktnnj3DPw06syOVxJIjGcyjylKiE2dct41qWOaEJb2hl5RQNePNzfjhyAPgrgRwL4UT
	fWrcYvIw9+yny2l16E1V1l9949082S0h8nAVMOIm9Xewta8FyO3rehMQZZ7uDEqQmAkR
	i6VMrNlhD681oOKX3jdOlByHZGQWl77fmCBM3DgrCkt6LTCMzW971kSJHzXy/K4hvTO/
	SiMD3azBh8wWRBpXE+bQc+ggSSikls1oknDxIyJ/2YGdOOD/FD8+vxG88Kh7E5QwVUAD
	eTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UtmxmCg16WdffBbFRa24yZsSze/AZo7pY02uwN0uee8=;
	b=naSu92YBP4zb0ssXZ0qlxff4LacuydAumOzQKJkRCPAaeCG7QTXYc1Vdr5w+/b5I7L
	IEl8ojO8appuuXt8En7NWve7/VCNLP+UkoWxFssK+wy4kMVwVk/gYAq4hvl5W6dgKU5a
	utKxBm4aA+p93v5aMOuIEDJNDGXufLA9JoAnOvqjSeGn4uIibpqXAyktXQ+Hq9Gd2Noh
	ImO6FcJ2rCssYNBIlSxkujUmoomaSYKFjPyxGq46chTUa3fJSxleMEsL6R4GkJGnAWBx
	qOjC5aQTirbywCg9koCm9kzPL+SKHRXn4cwCQsgJG6QDwJAcTK+9XhBtSTZo8USRejOI
	E9sA==
X-Gm-Message-State: AHQUAuZtkxuH9ZNWHK3ff3xUd/Q8FkeRks787DTGDokkj8ThowL7drNS
	mwRhBa/ZMS4JnOavR0Ab9Xu03Wfs
X-Google-Smtp-Source: AHgI3IYJKtp3vb/jcq59NrWyrZ7KPN1wQD5ncSGkLv0tKFkAXW9pfwCFmziF2d1pAKfgqYQpPErAiw==
X-Received: by 2002:a5d:4a05:: with SMTP id m5mr3373505wrq.46.1550846038277;
	Fri, 22 Feb 2019 06:33:58 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.33.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:33:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:39 +0100
Message-Id: <aac7a4e61b638ba1672b0ff2e470ec749530545d.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 04/12] local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl
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
X-List-Received-Date: Fri, 22 Feb 2019 14:33:58 -0000

As sdl is deprecated in favor of gtk+, it should not be the default.
The recipe itself no longer enables gtk+ or sdl for native/nativesdk
builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index cf96598819c..961387acbae 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -236,12 +236,9 @@ BB_DISKMON_DIRS ??= "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. By default libsdl2-native will
-# be built, if you want to use your host's libSDL instead of the minimal libsdl built
-# by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-native = " sdl"
-PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-#ASSUME_PROVIDED += "libsdl2-native"
+# seen. The two lines below enable the Gtk UI frontend.
+PACKAGECONFIG_append_pn-qemu-native = " gtk+"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " gtk+"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.17.1


