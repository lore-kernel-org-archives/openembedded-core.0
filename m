Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA4D57C2D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:58 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t200so21262341wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=F397jPN6dzCIzglU38cBvKE8wM+8ujHXapIcz2m7XxD83aZyyVslPGpDkRMoNFSuCF
	ukfBVT6MKXI5Xd+1ewNOgeDmk4dtQazFBtnhNkNRqha+1GX1s6XZhFclJWJQCEl1oWz9
	SeuPT7W8nHKK1TBzLrY/QHjcuOTumVcNxohcy6PSEV121qwbiyW6VrYOYxi7A1MuHWw1
	xyY9aUsw8TQCrodyJeGj6zZhIZF3KiQsXvJj06yx/g4uOBcexWZG96Gr2xF7tCuhMCsh
	FshCHXXwpmAvSq/vrXLFXoPSmOyROY5CATpOIde+A0j785clhMY//r1Te1IABOYVS6la
	i4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=FBVLL8+nOP/dXu3GEjkJ3wJoP7HZtm20JgUQD6N0sfiERceB2wBiR4Ek0jVHzJirbe
	9Gy9lp/BeomDr+wluyeCrmVfMibiO9UkYi6E6BDYYT+hUoUfyqQ0GLg900HtHfY1o02j
	Zs0eTxHjYDl/aGKY9pV+F0O6FPJNzv8przCd2dr3HAzV5zIAvLgqWVbMeXXCyeseZeUp
	y8VuONj19KuViASSuTW3W1xW0vvvju4eWJBxSC2yl1RPyTtvbgfvyPCtyAX9QRerfPNo
	hfSLRJf0r8D9ilTVsDcbzkKYIDjN2XUs9V387NOIldSPdsGV5yvPrY8apZwIeu1a0n7s
	g0yg==
X-Gm-Message-State: AJcUukeU+EoftlnbP2p+AqIb6nK+Ga7PJ2rzqbOkCQI27iAqgGVw/5Yu
	gNOLBHSXPBaPSWrH0fIJL9+aNRiP
X-Google-Smtp-Source: ALg8bN7vNP/1y635OR9RiHybS7Fw/nlcMbGAj0pCeUHoBULmVhEQ9uWhR/zMgm0ulRWb9KrHYPAMJg==
X-Received: by 2002:a1c:70b:: with SMTP id 11mr25898459wmh.74.1548845999110;
	Wed, 30 Jan 2019 02:59:59 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:31 +0100
Message-Id: <f11bfcea4967aca0e30521eae8f6a2cad8f0d102.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 08/20] local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl
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
X-List-Received-Date: Wed, 30 Jan 2019 10:59:59 -0000

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


