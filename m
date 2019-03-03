Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8ABE27C833
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 11:28:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id a62so1996994wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 03:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tbaNDN4//bl+lYuFKraVYGYVQETw8RWQvSnO7HZbuzk=;
	b=EAbVNruff2f5TFUScWxWCtXIFEGtGZYXW8ur1jCqTmwUhSWH9V49YS+vGj3F/DOr8x
	cppUiiHNET8i8LIDJ/PDmd9YVRv5Sl3ZuFWlJBr+h6AMXZzVEaK9LjG740bPmm5X65mU
	Vv4ygtyuZgkwAyAWZW+O0kFRYRTkY7fKXHxp9ckwG1RpQf3rmkhwLSHf0ClGXjlg+MT/
	euQXa1ovjtSc4nTVX9dJrOM9VyoY65lwr0gha8V1VhaX7dxBlc2AApuvABhRVQVDvt1v
	mV7FPdkQ2CKWG+WZBNovmoDSLURlIgp42j61Adn84u5Jcm8DfrAtqnXaT5NhPLgHNqCR
	ACUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tbaNDN4//bl+lYuFKraVYGYVQETw8RWQvSnO7HZbuzk=;
	b=i9+Nttr+QRJtzs7swGd39Iu38QFZOYxHVjftfn7GiqQlHhBGzRN5T7izsiEjqPRM5Y
	kL5A0N2i/DucMihGJK62PZqhsJsILuM79anoYMcv8qGOhFtxVdinjOJHXPitTB8GrP8v
	0Z6JEFjcN1OrI9Pu6y5gEXq4va0m81VY22a8QRgXrQTlJmSrHwmxyqYui3gYK6VNiYQS
	c8NWWknEvucmrJ3ssUA1qL1StSQLT1EC0VbelKpMJgofF3F0vcBa92NuNwn00ljGn4h4
	4LnM3eOaJmoKWGErw7rDbWk8NTncogcgboFzgL7OVl1AsMrutmtSw0wcbX6CAGyeFCi9
	JMEA==
X-Gm-Message-State: APjAAAW/xn96wi5ilSHNe6zdSP2s/EgT1WTz7fjreMogQj3VZtr5FvCi
	sMojZ6Jvtfy7bvKe01/wu7hfKAP8
X-Google-Smtp-Source: APXvYqwWWP7QJsLV+8JAij/TGE51mCuiI2tQ7u02hhQLEC9D7AiEleqk0jc1AZTXAY7dhnx7jA/6Nw==
X-Received: by 2002:a1c:c010:: with SMTP id q16mr6925408wmf.134.1551612487063; 
	Sun, 03 Mar 2019 03:28:07 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id r6sm3773462wrx.48.2019.03.03.03.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 03:28:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 12:27:52 +0100
Message-Id: <20190303112752.16353-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190303112752.16353-1-alex.kanavin@gmail.com>
References: <20190303112752.16353-1-alex.kanavin@gmail.com>
Subject: [PATCH 9/9] local.conf.sample: remove support for building against host libsdl
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
X-List-Received-Date: Sun, 03 Mar 2019 11:28:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index 2775e15d748..00795ae6a3f 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -239,12 +239,8 @@ BB_DISKMON_DIRS ??= "\
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
 # seen. The two lines below enable the SDL and Gtk UI frontends as well.
-#
-# By default libsdl2-native will be built, if you want to use your host's libSDL instead
-# of the minimal libsdl built by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
 PACKAGECONFIG_append_pn-qemu-system-native = " sdl gtk+"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl gtk+"
-#ASSUME_PROVIDED += "libsdl2-native"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.17.1


