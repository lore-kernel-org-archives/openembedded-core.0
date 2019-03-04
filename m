Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id D76807C892
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:36:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q1so6049590wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tbaNDN4//bl+lYuFKraVYGYVQETw8RWQvSnO7HZbuzk=;
	b=czJIO5BjX/dSGqHszk43txh4qZwhy53HtZ4zQTaZYj11f/ZSzRphX75APJUaZYuRwx
	4ZD2cp3aq9/RYHCFP+zxR2HtzHdLTcYfPjZ3Oydv5Lpvw9lM8wpXGASJ9q8SJTkV6i02
	VewZWpCLNcFCubnWOKrLpHlCfIZ8tQwClGKnHSqw0I4IH2lcgSjlRHJXx0mOkh6aatue
	piQzNByAEMF2RKftG00Kwj4RLVLEUI8fcZ5Ulm6ldHk1vIyzbeIlqVHguOd4jBkiIcqs
	1+jOM/TaiBTfz/3p4MfzO5luV/kNHXk177S7ZPuDBYlJ3r7+ucO6BFIRbHptGOc9SfQH
	Z4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tbaNDN4//bl+lYuFKraVYGYVQETw8RWQvSnO7HZbuzk=;
	b=E5oHnBrp2qSBrXzFIgKyAUESktTOXvm3iiTFb+iX+338EcUNb/I+DHPJiQKJaPdDy/
	PEGXmgtMFTR2ws9ULiv8nCQRF7KbIAkYW4/TjVpTflR2rG6GmDRQRDK7311j9pjM3tus
	GvgG62VOfFBYelc1hmHFuApt7a/KRK3CHqn0MRqLKx4j/DvPf9hJ2LMaLyt7iuSjyLi6
	RcvE2DfKdi/s/Jio0+c/WWW+vcAgAonIinJV44YepSWOnu1z39Pwa6AZdNGTu9PE3fVD
	mCGDEtTnz7WebOV7VI6Mq3gjFGIczABxfqik8vCBv/U4Na71/czJZu9emm6B8jf/jtzx
	44Tw==
X-Gm-Message-State: APjAAAVU2baizanbpFeYK2MHpEQLJg0gPpSMGXOi8D7lPVHrMSJsRjWc
	hjuokqL/QzRJak3bdwgYtBQljxS3
X-Google-Smtp-Source: APXvYqyQUNBDVw4Uxz6W8svVxUwMJC5DiUe0KWbUtVWoDsSH32gg1IREhqbaJlsyojH3Nu0Jiv8d7w==
X-Received: by 2002:a05:6000:10c1:: with SMTP id
	b1mr12529420wrx.275.1551713817253; 
	Mon, 04 Mar 2019 07:36:57 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id s8sm5523414wrv.12.2019.03.04.07.36.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:36:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 16:36:46 +0100
Message-Id: <20190304153646.59135-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190304153646.59135-1-alex.kanavin@gmail.com>
References: <20190304153646.59135-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/6] local.conf.sample: remove support for building against host libsdl
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
X-List-Received-Date: Mon, 04 Mar 2019 15:36:57 -0000

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


