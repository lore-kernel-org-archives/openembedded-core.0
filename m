Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id C09F06AF70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 17:16:37 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id up14so5845932obb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 10:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=dqD/vY+DZmb+2mcb4wvXjcTQmdxMjJQhnLVVQWLHPcQ=;
	b=iMFfUzXeAM26S5PnUQY7J55prwNvPGcRvpi8YuHS7bNNTqgVxFPfjpeGqkkizM+xZE
	YEEcJJ958XCj8ytZp26ZFTpJIg/m/n9KxSob+bjbnbqpi3Hue/RATf0mUJNIOkqhfvc2
	53zKj8R8DgcpdW/iuk9nEgcpfW3hAUB0Yr4/dTM2lhFHaA9E9VFfXttmq+f6LncALxZF
	qDGuEOZD0WjiAxqu+zXhk+9ijHF+guCAkHxGX3OMup9nIa25s4jnOCbHw+XypuymuNcX
	AvKxHVADNNNXq+JhShVkqP/NvjFT2gWkZwFY6a3BJkVlGXTmSxf4OZfm8++r7MC430EB
	chew==
X-Received: by 10.60.146.180 with SMTP id td20mr21071768oeb.96.1373303798560; 
	Mon, 08 Jul 2013 10:16:38 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id g1sm34129588oeq.6.2013.07.08.10.16.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 10:16:37 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 10:16:25 -0700
Message-Id: <1373303785-8508-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkgVlZG3i+clELY25CsZQzStwIg2nncjrNNgehnxiqKybXTtmkVfN1MvTJMd14UH37ZF/Tr
Subject: [PATCH] pulseaudio: Added consolekit dependency for pulseaudio-module-console-kit package
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
X-List-Received-Date: Mon, 08 Jul 2013 17:16:37 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

When installing pulseaudio-module-console-kit package in an image the
consolekit dependecy cannot be find. This patch makes sure that the consolekit
recipe will be build.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index e4fc648..f925e7d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
 DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
+DEPENDS += "udev alsa-lib glib-2.0 dbus gconf consolekit"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
            file://gcc4-compile-fix.patch \
-- 
1.8.1.4


