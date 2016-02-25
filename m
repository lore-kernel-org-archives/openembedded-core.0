Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF2377197
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 02:15:40 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id il1so2161470obb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/KoCCUBvXbg1lpjwQ5F58zFoxbYT/JpZ71REyVVdYRg=;
	b=yORR1DNqeWi7ltq/Y8LqNV35I5zu+5/tRcK4Gy0kUTzL/XJnP9S8Fr9g5XuSSRKsNe
	umPqDVm5LQ6h28ZWKlUAXJ/Xy+fpAM/cxjwi8Z0VoEWjHHhHi86xqgBgBARMLnu7mNk8
	4THk2vd6CZXmi+W/GYVfnMDLZq3rBfjx1mPZpXXfxtAPJuFSJZwACG4zRqF/T4WVx2RF
	tIuoMj6VLVfR8H5EecNfXVrUYS6yVxsY/pt9/0BT3p06NeEExy/qxPl3/46gVeH0KOKZ
	jC1A7DnzILmEOAOtD7DehcCTEko2TiBGcQwp/ewC7094EewgEVPmUs9BW4DhrDg8Cbd7
	M+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/KoCCUBvXbg1lpjwQ5F58zFoxbYT/JpZ71REyVVdYRg=;
	b=UosiRAuvzv1vPQf/Js7ezppk6e3dMWtijb/C1+MLLWi+tlotv4qBM1ziNI02/WR4tA
	A+HL+O1LMW3YFU8JNC4xQ2aiXPke+gRrQMWt5bvEFvSxDMG8kUV/6iu6v1Og5ok5hnjn
	S5Q97edO55/1lsx5snb7L80/t83XXH7Jyue5wM1jEBB7iJH6lGdrC3fMn4HVwIscwcg5
	WJvR6G5CYcPiHH0M3r7wrI4X/3Mx7Ya7uh61tmo6W8FmrWMEn/Mc6ZaMppt25a/N7R4Y
	Qe665fqqkUmNI7ZCtBrjp2ZzC0LKRGkF3q6407rdzri+clYtRgUZcgccHwlCcE5XFnYS
	oOAw==
X-Gm-Message-State: AG10YORIl608ThD0OiEGhYHHYWLyFbr/Gt50YPGH4W1fhyGN/oyOA9eR9qF8Q8GgHcdCWQ==
X-Received: by 10.60.35.163 with SMTP id i3mr34841186oej.27.1456366541461;
	Wed, 24 Feb 2016 18:15:41 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id to9sm112844oec.9.2016.02.24.18.15.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 18:15:40 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:15:24 -0800
Message-Id: <1456366525-7522-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
References: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] gstreamer1.0.inc: add explicit PACKAGECONFIG init
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
X-List-Received-Date: Thu, 25 Feb 2016 02:15:41 -0000

Although gstreamer1.0.inc doesn't currently set any default
PACKAGECONFIG options, add explicit initialisation in order to
match the style / structure of the other gstreamer1.0 recipes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 662cd1a..5c212e6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -10,6 +10,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
 
 inherit autotools pkgconfig gettext upstream-version-is-even
 
+PACKAGECONFIG ??= ""
+
 PACKAGECONFIG[check] = "--enable-check,--disable-check"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
-- 
1.9.1


