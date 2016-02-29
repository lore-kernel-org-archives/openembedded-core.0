Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id E9AD977206
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:02:33 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l68so64939899wml.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m5TBlA7GHDYAhNBHAUxUSFoLaSLGG5olNi9inQKEZfI=;
	b=ja4vnJfutj0k94fGfEMw3m5ttMWCmMqLrOVLjQXhywCAjPow40qSL3pS5fhCCL7oaS
	J1HlpgfuNRiP6YlDwIASmrnaoCNn6agXaME053ANhW2LChK6kIzjyD7rxKQkAPdJ/FC+
	cq7htFCN0SXlw9f1H9lZb4VPrB+qRDBCe//6qExorNlSJfiAUmcp7M5urdFuzVHkFcEP
	FgE7fl3B9nxfk/g/hNx6ElzOVLaFEnFRl4ryOHrgPrkURdpGP+uBEcXwV+zBeiLOYZ6W
	3v31RSyu8OosDmIHOE6PvcOmI61ysGwDZp/10RVFCHAMsICDGfFa1llCfezTbHWmf4pn
	Ndew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m5TBlA7GHDYAhNBHAUxUSFoLaSLGG5olNi9inQKEZfI=;
	b=lfq/3HQN+/4DuqvWVTunfBOi4zJMMRi5637aynxpDehgT5YVsLuiqoRHiGLctAaOnL
	UvuRSsNdicwTaDKDH3/Kxs3UEIoIkFR1Zrkyyt2PT6RpitXaadWrKLLbQhj3fZkFnRyK
	ErQfHmzGwMDzLxaA+9U1qQrcdohFkDeJFtbpj7Z+xeGxjvRgKwF+i+Cz11o19JURt1Ri
	Cwf0OheulQWIg3hl/H4PCSOulghBAcjKwdNtUD3/LxPlMIEtw6Ql8zW65UlV545+wwFB
	bBgiuRUQiWYLFJ8QjS4y7dqxlK0DNQh3MMstEwVL4Ut+bvAER4RBG7mFawPC4XuDxSc2
	erYw==
X-Gm-Message-State: AD7BkJIlF2H/TAak9DqIZGwxFp4SETZJKASQYil4kAeaowgmG3dBcCdvouVzL6jjFPsB1ivy
X-Received: by 10.194.209.204 with SMTP id mo12mr16994476wjc.69.1456761753943; 
	Mon, 29 Feb 2016 08:02:33 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i1sm26454322wjs.45.2016.02.29.08.02.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 08:02:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 16:02:26 +0000
Message-Id: <1456761746-419-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1456761746-419-1-git-send-email-ross.burton@intel.com>
References: <1456761746-419-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][jethro][RFC 2/2] conf/local.conf.sample: comment out ASSUME_PROVIDED=libsdl-native
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
X-List-Received-Date: Mon, 29 Feb 2016 16:02:34 -0000

Ubuntu 15.10 and Debian testing can't build qemu-native against the host libsdl.
Now that libsdl-native is buildable, comment out the ASSUME_PROVIDED which meant
it wouldn't be used.

[ YOCTO #8553 ]

(From meta-yocto rev: 759accbfca46de058ce402938713189dab22a70c)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-yocto/conf/local.conf.sample | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index bf6dd90..72c16b25d 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -225,11 +225,12 @@ BB_DISKMON_DIRS = "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. This assumes there is a
-# libsdl library available on your build system.
+# seen. The two lines below enable the SDL backend too. By default libsdl-native will
+# be built, if you want to use your host's libSDL instead of the minimal libsdl built
+# by libsdl-native then uncomment the ASSUME_PROVIDED line below.
 PACKAGECONFIG_append_pn-qemu-native = " sdl"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-ASSUME_PROVIDED += "libsdl-native"
+#ASSUME_PROVIDED += "libsdl-native"
 
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
-- 
2.7.0


