Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id A5A4960BF2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 17:27:48 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id y5so5133797pfb.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 09:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ygq/JiRGHXkhF00ye0LdKpLX2b9uQuqy81FM/+FtIAE=;
	b=H2kaFCMihVxAX2G/VDsesd04YlPc+JKGj4pzPWLl2kkOWw+xBnUIx4YXwD0a+vATTR
	Gjn7/ldkJC8w+5eBuZMIa7Snv/KoGaL+Idn7W6n3j0KDx99Jg+mScipJBKmoLRW9aSIc
	rzPcjRoFrwjVweNITpVBA9jlVmfw60oWbY1n+IooY9MymlJx+pY2uoAcHpDT7P57/2/D
	n4SKD73xzOcE5efzV6UkD1JPLbZg2Edr9ovgP3yaXNv7tX/kYgL66MuOGYyLJTMhlXI5
	+IUzUV13gXHRgvh9eFBrTEvUTCFyE3SsuGLVptBVrZchvurtiSc15BQb2y3Yw7DQIstV
	lPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ygq/JiRGHXkhF00ye0LdKpLX2b9uQuqy81FM/+FtIAE=;
	b=J0OwUL3iFCTlOm5FztxWQLrbXjm5yRFeDofY+/Oby/LGNliJTBLuIH7MPHUMjghj7u
	OSpPBG6yx1RhLUl3GiYlzW+d7XRXjsBY9XhpyALmUZOewP9PDcbyAGZY+3dBTEHUzz1O
	RLI5Q1+XHkUkF1OWZcrR6j3yPVb7dPnkUnmRvcmIztqPHNJTCMMNNcfL41L9QaS6WRXH
	+ZW6lA1V40YHi7pyKjGyHtO3yEAITuY48Rqiw56OL4zva4eA98Vgq2dZ/YCrlo0+RZbs
	X935OEfZXD81q5qJhrT3IhTWVh1Bh6+1HxKX2NyqUihTi3X/KLx59QjV/Np7U0aCMQ2m
	vSXw==
X-Gm-Message-State: APjAAAXkaQtAxG9BjkSLIdigBdWBuEloXHIJE3bhOcp8ieqbvUYymCvz
	70qa5k37E1icq7pOQITj4iuXStfPJj4=
X-Google-Smtp-Source: APXvYqzgr6njDskbeBtHM/0dTdiZ7BnUasG+Ae9JeqXnNc0uqDTJRM+ifjhUS5UAmcwp2xZtsp/Ekg==
X-Received: by 2002:a63:5657:: with SMTP id g23mr16001422pgm.452.1580578069540;
	Sat, 01 Feb 2020 09:27:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id p4sm2916760pgh.14.2020.02.01.09.27.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 09:27:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Feb 2020 09:27:50 -0800
Message-Id: <96641614e47e14ecdcd494dc5bd86e679696f14b.1580577516.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580577515.git.raj.khem@gmail.com>
References: <cover.1580577515.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] uninative: Recognise ppc64 host ldso
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
X-List-Received-Date: Sat, 01 Feb 2020 17:27:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 9f8645a36a..70799bbf6d 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -1,4 +1,4 @@
-UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}"
+UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('BUILD_ARCH', 'ppc64le', 'ld64.so.2', '', d)}"
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-- 
2.25.0


