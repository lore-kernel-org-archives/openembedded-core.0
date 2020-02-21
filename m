Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id CCF2C61632
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:54:08 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d6so243422pgn.5
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CSOBNwxEFe5KT6EBRaL/DtkmfVC2kawVkQyKV7Ceu2Q=;
	b=iFJK4SeGXmTbtN8w+NCR4PI+zi9UtfPvTaurHYPx+1XPVDYugwQPpcVBRqeyoIE8Q9
	OgQPUVqJ8C18boKoUFCRoZKJREt95HFEjPKhQt1+QzAXEizcwTOx023yG7KbFvggUArw
	o7EdhNRj8gDgn+bBO8nRrNVDIFXHUWqnI/WEpw1Cc2J4AwGv0tRTPz64Xbq2UQcsiqox
	/w1X2DkwffTK2Zl5KukNldsWeBHCrgglIXQ66xglQ6tkT1VPvH176MYsouHC808X3rbw
	e7tptkxXEpMR79i6s4mh83kppbOc2kWyvorwxYWh+mLMxJO18T1UU6vZH8/yPWGihHcn
	55JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CSOBNwxEFe5KT6EBRaL/DtkmfVC2kawVkQyKV7Ceu2Q=;
	b=skVZL3c7nDMFBWKIEjeYuqyHli/mGorZG59Fn5tdtNebLFDt9iPUXcW1D1DV/gY7Su
	YNU/XDKAfHN0oOPun7Y9YXaipDZe9f+fiIowb6f5xvdJaRUSP5eFNxvAZ1cpCL5BjCMc
	oZhHduA00IyowVm0dmGosY+WSeD4zVlKd7rKJvvd4rO6TQAO3tHZxgeaaWZo9M5AuOik
	jY4YhHc1YIQuM9dxl2v4LkmCScsXkGvcBOkkhcSxVeNJ4KmibBUsZtcAz4SYTzTzdEwP
	fna4LnL/VsAG35OWWxRDWV9NJARSmjFHnRTmro4K+X3pQyRUnehhin/+qKM1+rgvVtYi
	OnKg==
X-Gm-Message-State: APjAAAV2efRsI7SSNPADvqYAjHU1+24HveIGXNXIMXjl7nG4c0AB6l8Z
	s1Yv8VzF6xZI2Ev/wg7bP/QwP5aU
X-Google-Smtp-Source: APXvYqy6ASujXa+wfsFXKdMWPvMB8AdQmqnex8DDxpr4zJT1xxBaP714zpQO3GYhOwlSQRdy0WQWHA==
X-Received: by 2002:aa7:934a:: with SMTP id 10mr36702554pfn.233.1582253649765; 
	Thu, 20 Feb 2020 18:54:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.54.08
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:54:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:32 -0800
Message-Id: <34428eca5f845293b648801bf61957afd249b315.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
Subject: [warrior 13/14] linux-firmware: Upgrade 20190618 -> 20190815
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
X-List-Received-Date: Fri, 21 Feb 2020 02:54:09 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

License-Update:
- WHENCE: New firmware files additions and version updates

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b4c8f2f139d0eeb2ebef3dc5f8309486afdea3d4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{linux-firmware_20190618.bb => linux-firmware_20190815.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20190618.bb => linux-firmware_20190815.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
index 9afaad73f3..518638806f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
@@ -123,7 +123,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=55814698bbae7c7dd40c9fbde91af0a8 \
+                    file://WHENCE;md5=37a01e379219d1e06dbccfa90a8fc0ad \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -192,7 +192,7 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRCREV = "0731d06eadc7d9c52e58f354727101813b8da6ea"
+SRCREV = "07b925b450bfb4cf3e141c612ec5b104658cd020"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
-- 
2.17.1


