Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id C54857C119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:15 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id m22so3909515wml.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1Yv6cXC1JF1Kd46EpNGLCSN6Rtbiyu5+lkFHhdyKgl8=;
	b=MXTAJYkXTce4MhwJHTZuKfzZcNepV8goowlF18QD4+LAJyy3jmxmZY6UFySeJVZg+U
	+CdPiKqWU1yX7Ln73qaqT35Nv5Ost6oLvIdJBr9D/lArQ+nHQdbYXq2CPc6zqmU0V/HZ
	BVLjoRcegWoROjisQPV8FKu3M5F3hTG7ApsmqcBMps+W7KFw4LT1bUMsk9iL8UD/S4Ee
	C+I6qPD4Ko5/BwWnG26JzQidMiffLy48T34FLoveMVTqHXWfN4jYB1AoYby1HbZ3lnZY
	7xXGjHnUhNvsluoKhBuggK/w5jn3vLZbRe8myBot6s1lz31CPv4Kco3hi0Z6P4i1YWul
	mm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1Yv6cXC1JF1Kd46EpNGLCSN6Rtbiyu5+lkFHhdyKgl8=;
	b=nHfVoLGvT7zGXMUxzQKr9215x1UzX9DSZ9P8PNdZCvRsRFsP7e3Iv1EDcFjJvSYxA4
	ki4Hs3RTAW7ftuZFbuu925ox9aC/kO7Hab2TufgAcKhQGizMk4t+7pLsVbwEAO13uXF1
	PxaeoTm3rMfDvOaoAE24E9AYx9Bkm+Y3UwY/x15Uerb2nbO7+FbRBXENLkL5WTGKM3MM
	FhEkVD8ox8WdtfZDWPlEIDH6ydR+SN/bWP5Br+XDGXTMHO0HKGQUnTZZHCvKQWrzTNDZ
	ZaFzkJ7qk0H8d/BiNL40+wynfAWbFb6TOFhSGFcS80wuePLvrtqRVZ1gnmYJ4/PeE5OT
	k/IQ==
X-Gm-Message-State: AJcUukfeB8Azrw0xffv8tJfSPhlhA/3BOMKz2LtE9fdQsTUlGka0awtI
	Zi2eAhtKWPwKWdaKRRWkyjvb+9zxz/s=
X-Google-Smtp-Source: ALg8bN4Tyf1cMPNlnbmjDtrteRoY8D/pulcDhz22yX0So/D8xUZnfHVbR6O/+4jN2O4dOCnGVk8lYg==
X-Received: by 2002:a1c:570d:: with SMTP id l13mr4163968wmb.139.1547570356296; 
	Tue, 15 Jan 2019 08:39:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:47 +0100
Message-Id: <213fe43a47b92657cf8c13eb8b4a5134e0c25a3a.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 12/22] local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:16 -0000

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


