Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7DCD36CD96
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 21:26:45 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id lx4so1108590iec.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 13:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fnVS9JbFyNefwCPZIieSIw53mJGUWIZ6GakSBfUE9DA=;
	b=D6YVbCXWFGPeGwNgaS6KV7Mowg8779BgerL1Cm8QF5wH0ysHul70ji6yFJO0FdT/+f
	ZVHWLcAhQ0rCm7fTM6WHnWZbpvXbWUoTqyMI4a7zzIySQuNAYAEHultz5YS/74nnM6JX
	fmNPe2EgKnN25MEUQfYWcqzHXlA90IgfUW5+uavTUsKfZJQdJW/9NojgXWKXdZxMEs1K
	lR6Kcv8vetcnavUkXte8RY8Q9CB8zsyz7q/vVhUp3C7OMjSvogyCMvmT1B/Vc4SqSqXZ
	ipw2wXNLWK92+uuwNgo5e3IYLd/fn4DKdgYrIo3I84mJSNwERSrkTh7F/Ps8CURd/MDR
	637Q==
X-Gm-Message-State: ALoCoQngMb5jsqj310tmDwOprHxNPLTvBp9c/3mke8xQB9eO9WGdRAvyjPLcv9uR6R6m7Z4n5igV
X-Received: by 10.50.27.42 with SMTP id q10mr812938igg.33.1389130006614;
	Tue, 07 Jan 2014 13:26:46 -0800 (PST)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id kb10sm5349802igb.6.2014.01.07.13.26.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 13:26:45 -0800 (PST)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2014 16:26:23 -0500
Message-Id: <1389129983-11212-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.8.5.2.227.g53f3478
In-Reply-To: <1389129983-11212-1-git-send-email-trevor.woerner@linaro.org>
References: <1389129983-11212-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [PATCH] libxfont: upgrade to 1.4.7
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
X-List-Received-Date: Tue, 07 Jan 2014 21:26:45 -0000

This release includes the fix for CVE-2013-6462, as well as other security
hardening and code cleanups.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 .../xorg-lib/{libxfont_1.4.6.bb => libxfont_1.4.7.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.6.bb => libxfont_1.4.7.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb
index 4f8a6a5..d587ba8 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb
@@ -18,5 +18,5 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "351a9b7348d165029bda52c9fdcb5c7a"
-SRC_URI[sha256sum] = "d0cbfe4554dc17ceea413cdad5601d35ed8d05d5b880e60931a8775fd1157e9f"
+SRC_URI[md5sum] = "b21ee5739d5d2e5028b302fbf9fe630b"
+SRC_URI[sha256sum] = "d16ea3541835d296b19cfb05d7e64fc62173d8e7eb93284402ec761b951d1543"
-- 
1.8.5.2.227.g53f3478


