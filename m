Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1407D183
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:16:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s15so19503802wra.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h4Cotz79RFxLyUpgJ1emBo/wfR7GOCYWlDJFhb/cmu4=;
	b=awSk8ZP9cpN75Udxb5hVY9ZVU7SQKWoyiOHYZ25T2MJ1lDxZLQeQLjlnz7T6CQ3XMQ
	giQ8JJFd6lSPC4VNEhMlnfFtCsMzsXOjzaiohov8DMkMXIeVuESUwTQzrbYgmpL2KrSm
	4i0pfecDNAfh9la6Yk+Ux/ATt8CI2IBNqCkUGxztgbKqlVzO7ZreEBeZtq6VuuJSO/jo
	FLnJm31t6eEdoSj69iQyYUItnThtoQrEa2eBqyJXh1wVOemufgacmxxtSI/6qt3snMtn
	NZefeqTefXC8hcctnU+siH3c70D2y8TEXvFhhb/ZPLaAGz282mODXpcwwP7MQcYAJ5w9
	Ikcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h4Cotz79RFxLyUpgJ1emBo/wfR7GOCYWlDJFhb/cmu4=;
	b=rNzIr5q2s6KybFbvgK2KR1fHbB5IgZ5YjBqAfz0+/nJfBBDdSYH8q5aoH870zB54vA
	9npc2N1J05DdOT3K8OIxugUzbcPRWWDfsIU/xeYrW58d5xk9P6vfxiyeH+Swb4X8zfyk
	FOue7h35WagAWZDiObK29rJtIJX6ZTn7e/zfPSZPlb8wH8phqlmNrzVIpbanup+p8POm
	zet1F9C29sXlOLQQ+iNj4E/Q9RQnnuK0qzTKkCOpzzD31mIroqWpzvmI/ClKCb72L2gX
	97dUovwav7X0w+7z0W772PTqcDWapL3AY1Ntnp94hIMmNjDMwlEp9+hpucp0jHwOMwXD
	IVdg==
X-Gm-Message-State: APjAAAXNTHC9St3onx04ZM1sVKA/jxV7Fl+0YXFWQiyPGCSEqG0DrWyj
	TWfwlFUz5kokhh07ZrHKBcX3sKYtlUk=
X-Google-Smtp-Source: APXvYqxzpR21pW9SepuFFfE573vqLXeMCfG/p2khIrFyE7UWf9MVkl/w78i9oBRArNPRUtcAGgnsbQ==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr20497751wrw.301.1553707006855;
	Wed, 27 Mar 2019 10:16:46 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id x84sm873848wmg.13.2019.03.27.10.16.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:16:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:16:32 +0100
Message-Id: <20190327171633.34697-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327171633.34697-1-alex.kanavin@gmail.com>
References: <20190327171633.34697-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/8] local.conf.sample: enable gtk+ frontend in addition to sdl
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
X-List-Received-Date: Wed, 27 Mar 2019 17:16:46 -0000

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


