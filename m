Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C97777CC76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:15:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e74so9129092wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h85AzAqwSD99+81d/hKs3r+3g6vK0sJShhZLC6vU1qw=;
	b=na7SAcCvbl4BtVtm5RT08Pr57DbCR+mlUiN3pph0lcHR2smi8dHsxxWajMzItUj0ah
	D6VjCSZBNizApQrAuIFG3ADyX8vlvRc/0pc0Yq9aDZQ8D6I9lSwCOQX7Kz8UQwaRTrSS
	g1KhkcJV3s7TtEdb/8z3SFvqxgWz1gAaayqLQwyMUd2fuDTPzCtv2t5yk3g7TVvfZWbV
	y/JHcJxPwMR/AnJsIYAGI4SvWVwE4q1uJkQO7d37c/jhDu7coOe3U9oLU3FDVaMYjlat
	pPSyv3f6JoeS/1rYZZD/Db1WaxmuTA/aT3oIAiXa8JYSpnkoAUKogX5Ls12baeLEHg9m
	9uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h85AzAqwSD99+81d/hKs3r+3g6vK0sJShhZLC6vU1qw=;
	b=uOM7NrpEzS0B6MLCGB7h5ND9w/x79CXQxiiCuOLkQo9auieI7Vauf2SEi0azC0o8/C
	QHNyfjPBw9vV6BrPCX+8511XHen1RBvL3oxrFYMIbE5asPl4QX8LT48nZtftqE4zFncl
	8sefdVeogznDldouenKcVPRcggBNuZ8xtsNuuXdfQuZMtEI/LDNmazXx/HG8kK6Iw26F
	kUD35WRobW0zG3sNj6CMiCS5qymfq0uYk8Km0RRYhHo7H5sSZxfTYYzRzZPWxxkEPQ9w
	Cb0AmgD7AFSLQRB4TPAfs4L89LGfFEC/ur0YIZ8XgZycsGDNInRUgpjUoaoZgaQeN24w
	izvw==
X-Gm-Message-State: AHQUAuZd22RF4HG5YNcS74GK/ESlpBh0bIYbrrpp9praiFrxXnb0iwEq
	oVJJJxbJY/23yrr3dE1GjwjKKsgc
X-Google-Smtp-Source: AHgI3IaOuKI5tvjycFmPw9CBByMNZWG5lUVvWyCMABeUllnM3DzSL39DRNAHkdrxwY8yV62xAKLqwA==
X-Received: by 2002:a1c:cc0c:: with SMTP id h12mr3167177wmb.140.1551359723360; 
	Thu, 28 Feb 2019 05:15:23 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c17sm13644910wrs.17.2019.02.28.05.15.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:15:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 14:15:10 +0100
Message-Id: <20190228131510.43557-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190228131510.43557-1-alex.kanavin@gmail.com>
References: <20190228131510.43557-1-alex.kanavin@gmail.com>
Subject: [PATCH 8/8] local.conf.sample: enable gtk+ frontend in addition to sdl
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
X-List-Received-Date: Thu, 28 Feb 2019 13:15:23 -0000

As SDL was found to be buggy for virgl-based GL passthrough,
gtk+ is enabled to allow that use case.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index 9068e567dcd..00795ae6a3f 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -238,12 +238,9 @@ BB_DISKMON_DIRS ??= "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. By default libsdl2-native will
-# be built, if you want to use your host's libSDL instead of the minimal libsdl built
-# by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-system-native = " sdl"
-PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-#ASSUME_PROVIDED += "libsdl2-native"
+# seen. The two lines below enable the SDL and Gtk UI frontends as well.
+PACKAGECONFIG_append_pn-qemu-system-native = " sdl gtk+"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl gtk+"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.17.1


