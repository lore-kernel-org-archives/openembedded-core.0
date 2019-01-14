Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDFD27C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t200so9236190wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1Yv6cXC1JF1Kd46EpNGLCSN6Rtbiyu5+lkFHhdyKgl8=;
	b=pePDKGjX6sAq7hKIo3PXmD0Knvp2U3E2ZS7LteYOsGMD5cZE2TQlEqfZhsZcU2ycaF
	SI1cQhBZrs4G83B70fgFqexNx/EvXf0tO/mGldCmL1XUsMcKF8bE5FNybSZp97COG4VM
	BA4wJWNdTn5c0192vb68hgQw576vHI6wV+DjPyZjWf8AJ/atdivBC3qMepbnYaSuz8lf
	HP2M9FikT76RLLBXlauBIfUr3f0jF/LBwPoQsGvjtWKqYo8QhaFh9CCr9sY4f37ttkX3
	sOmA0CUq+MqlYwOlLZDzoU/4bIzgJWSd/dOEowYwEtMc8pE1vljg0tC1zF+N4OAMvoxM
	oyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1Yv6cXC1JF1Kd46EpNGLCSN6Rtbiyu5+lkFHhdyKgl8=;
	b=KkLiMNbuCsQARF3s32H2ESMgGI8rfcPKdX6aan1ahNc0bhmvvhET2LTkY5BQT0uq31
	EljhMxGa2UBUJYuoU2r52UXge5vWpqaY/YTWXiR7lL3LCLfYL7uExfX6QGCpbFL96olf
	C97wNUcZP2Sov5bgisbH77QcF8ktlRp9e+e2GTI+Rf0URbasAphdHnwCGSFqTR0IqA2g
	Qr9Yu7QdWcqTjSkLPf6yMLDE8TjJauvI7LXUxpKPscTXHnIAzlNTS6ISPVxQ2UiY2nUw
	plahxSs9hoUUbnZYozP3H0qEG+scJhUPV1MS3BCfphgZ/HKfHwyep87ysGHLjKftRRcy
	roYQ==
X-Gm-Message-State: AJcUukdUhNS4/A+YW2xlRhbvd3Ay3isKtBUQSIR+Ugc+A5dzgCrKkteL
	8MTFBoFxKJ24GJZt2Yee+P0XJB3C
X-Google-Smtp-Source: ALg8bN6Lym8rKgRSmVyDlA7aEdI+4lJRBrfycpIzxSBS9uQ4/vESsoLANIRcZ+TPczSjxA2NxjuQhQ==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr11921496wme.1.1547478217475;
	Mon, 14 Jan 2019 07:03:37 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:09 +0100
Message-Id: <925374f615a0b3d32a5abcab5d058df166cb78d2.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 13/23] local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:37 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index cf96598819c..079b7b9945d 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -236,12 +236,10 @@ BB_DISKMON_DIRS ??= "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. By default libsdl2-native will
-# be built, if you want to use your host's libSDL instead of the minimal libsdl built
-# by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-native = " sdl"
-PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-#ASSUME_PROVIDED += "libsdl2-native"
+# seen. The two lines below enable the Gtk backend with virgl-assisted GL acceleration
+# support in the guest environment.
+PACKAGECONFIG_append_pn-qemu-native = " gtk+"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " gtk+"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.17.1


