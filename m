Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED8B6AD33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 14:57:12 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id o10so2891367eaj.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=34RDJ3wkNvxysAVm/Y1Z4S9ygfQHQH8DZxCdEYUect8=;
	b=YxRV+heK3Bg9q/mYJ60lTg+O6ASd06yu2Ax1YmmoXPxRp2KF24kOX8XnAEN5zmZmI9
	zbgBKm7xWzk+87x+PTvCTS4Sfm6YzE+P48J7iIyiDK9UBQKH1AfiJ8jnzhXMIPo3eH+M
	ETxUn+r0wWUPRU18zg24pCQd3qsA32Ua1jGmFpQh26s2upjRPyfIJCavpYOcbeToXcpe
	TlKPR7pDFHvllHprlypQAzwQ4dC7CFYso4O0uLA84RnP4EsBvimuOjH2Y33j++IA4fBJ
	aXJ1gPxFX0bpalsNwj/0UAsYr53EfEw/1iRmGeHqZsTgLd0tQ4PW1k1HYCQ1G3SECSK0
	FyUg==
X-Received: by 10.15.73.197 with SMTP id h45mr20132231eey.146.1374332232719;
	Sat, 20 Jul 2013 07:57:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm35925052eeu.2.2013.07.20.07.57.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 07:57:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 16:57:21 +0200
Message-Id: <ae7403b0379ce48fccaba39841b82527176e87dd.1374332196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
References: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332196.git.Martin.Jansa@gmail.com>
References: <cover.1374332196.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/8] pulseaudio: add PACKAGECONFIG for jack
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
X-List-Received-Date: Sat, 20 Jul 2013 14:57:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index d4f66e6..0158f41 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -50,6 +50,7 @@ PACKAGECONFIG[gtk] = "--enable-gtk2,--disable-gtk2,gtk+"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 
 EXTRA_OECONF_append_arm += "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "--enable-neon-opt=no", d)}"
 
-- 
1.8.3.2


