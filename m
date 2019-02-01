Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2184E7C4A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t6so6956528wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=tlxb0LgT6UU8XwkWmOjkdR5AUeLYD1VY2iaAL7Bh/7IKNaUk8DwYmziiZJ3A1iUGmo
	kcZwlIpmmG41z1NmPMNQSIb3dEY0mZG6FF3/+CFWpf+gAISseKJL70AsU1uia/ruAHbx
	bYSNtS23AhpyQN64vMM0Uh+Ix6uD2sJ1/LgCOtluDyo1WlMsRacp668AJ/Mt8W4zwUG4
	AtBuslu1e8UFm0aRwabGTD/CYf7i6VBgSB69QyYTDQ86QcQIf2vJ7RU3rdi4VnMNqs3M
	59TX8KyiCmjf/3gA26WxDYV/3XRqrjw7XfXQDdrI9rPfANlZiG5uiADlIy+P5Nat7wPj
	guJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=sPCMy7Nwx1ac9QqwpQEyn7Swp3LRTpyxyreHjd9VOfW3u+Iey31OH+K2i5Wm2Ec1ME
	Z2V4cXBRwvU5ptImSp44m/tRQQBQtHcw1ausZZLKd9mtj48LemPwnGvQWUEe+x5bT+do
	iSuuccf9gz2hM6HknEmNQYUOP4Gq5cHZ4SjgL/X3rBvRJqoUd1Tt8m+sFVuSqMZ0/eeG
	5Fd+5CF6HFiVXvni9lGjLurbKj6OYIuT/qRPKW7WUe9I/x2tzZSJvfT6dwYdMQxbMNnR
	BJgSGisCdlbPayVhnCW3ZmJe/1uESyxtjFIO8rJoS1Fedkf3kJH5Dy/Z79QoFrRNN652
	aL8A==
X-Gm-Message-State: AJcUuke2jWf10B5CZ38MZ77soTrt3jqkA/aIFAOftuQVnUfTfeoBceMc
	JqrOvw922Y4vtrXQmMeJEvOWXuqQ
X-Google-Smtp-Source: ALg8bN4K+SeBx8av8H9H4bEs6ZhBfd5mJQ/IeHLVZ6jLxpZJ9D19Biob12NC9G1VOiWCZfHzn5NnUA==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr39477874wro.261.1549026366582; 
	Fri, 01 Feb 2019 05:06:06 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:45 +0100
Message-Id: <20190201130554.90094-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/13] local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:06 -0000

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


