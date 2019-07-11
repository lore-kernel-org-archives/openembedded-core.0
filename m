Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB8E7F0A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 23:54:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p13so8018348wru.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 16:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zJjy5dIGrZ+4v28AqHPGimvQrsof0xm0RoDda3rhxGg=;
	b=WgX4TtU1sWOeLVjmUFTll6hqHsrw4ArC7OBxhtndR997j20qiioktMXP0ZL0ED83rN
	7o1uc3IFKbkQfNq3uezVnrZ6pG/j0AUPtuoDL+B+IgTJsa0/mCa8R4zlIgfsSKqCPu2f
	IJ1UQnnTEEkInC5AUADAs0m46F/zcevCFMD+aEKBggvecpiqmMR0darZkpRolwPhn4dH
	O2nib3IR7DaNHHg6t2rs12JWoCbQo2DUxhlNLhZ/BSZq6W7qDqhUA9ZwwhbiB1iZZb0n
	y9jZN4IXsM0nGwfJM5dlZGUZPTsfpddU4HoUWYG6wKcu91GSFKWPu3qvU6sDTj9PvynU
	P84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zJjy5dIGrZ+4v28AqHPGimvQrsof0xm0RoDda3rhxGg=;
	b=XcZ76GYo8L5M9UT7sLiDXz8gxk9Rm1fQMRf9uZR+Bhsy13IF5XcdxpdMlKOep34gtx
	MpXcYHR5KeFzqirexC9/heJrxT+oZcO2Ih+lOyf7roOdXWgRXhKC2BBw3UZB5OZVxwzG
	Us6RJbYhjBsMj/5mteTbrYvDbYYnHDXe45CC2b7/Th/EI3sRG9KV6IUsZdcD1pTpM/nN
	iy1RcbvWliJlDFr5guZIwZXJZNM9SBRuQF9pjp8QJgjivSW4+Xldw0eqCu80sRNvl67q
	rJ/5z3+iYYzLty8ZpBj76PewHJmLvKm6mNMxquuF68kFixaFMy8gId3/59r+nSrKu0Gb
	tx2w==
X-Gm-Message-State: APjAAAVH8GjhfL0RSbp3MqwlnZFSloUBFg3zjtEN4osdOAiWWGd/582A
	NloQTjMRbjWkzRRTNyYtyItAP98Kul4=
X-Google-Smtp-Source: APXvYqyYiYcrh/2b72/LMiJf2J2i3xvGm43gZG501I2uMcMxxlZff6XcflA6wPQUpNppgXLQELlUKw==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr7464269wrw.345.1562889269693; 
	Thu, 11 Jul 2019 16:54:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t3sm3291716wmi.6.2019.07.11.16.54.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 16:54:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 00:54:27 +0100
Message-Id: <20190711235427.23066-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] grub: build with python 3
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
X-List-Received-Date: Thu, 11 Jul 2019 23:54:29 -0000
Content-Transfer-Encoding: 8bit

As part of the mission to remove the use of Python 2, explicitly use Python 3
when building grub.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 20877e77355..c5ff10e5986 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -60,6 +60,8 @@ BUILD_CFLAGS = ""
 BUILD_CXXFLAGS = ""
 BUILD_LDFLAGS = ""
 
+export PYTHON = "python3"
+
 CFLAGS_append = " -Wno-error"
 
 do_configure_prepend() {
-- 
2.20.1


