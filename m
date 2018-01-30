Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CBEF97887F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 11:21:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 143so336159wma.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 03:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KiuH4BaGdXrSQ+Ump/0KG5sD77CUd/1ojCnqmYnKIHU=;
	b=mmXgdW/7FlpTaXzU1AJiXBqn5yJdyhtXj7+uZpuRwyr0dqWbSefbpiq2gxvZa2upFv
	S33ebazoDjh/DXljodjn4ZC9Hi9P0PD1YpO1YXPgquEfWiZqaf1vcCoCQn+s8zY7Z/gU
	yLt/9gWZyOnaZ4eeTFo7NW1FAYRMjv43aXMb6u1QxPE1/+DUc26azbGDzDZ0rVYacuGX
	gJkfFey6tS0BU/xiCeGs/qvAsQYCZ9YhmTM1SfWeV96hGIh9C+vBvZdZFH3UGI+4UJZD
	vmRvuQDXBw9wL4C63AWTp3sL3eV1ol8+brWBGzYHM1wTuqjv/gbNFxYEAVBEAfGP87ry
	AI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KiuH4BaGdXrSQ+Ump/0KG5sD77CUd/1ojCnqmYnKIHU=;
	b=pFKQsYUBKNu/VzTQ/7kLL28/QI7tHgsPHCby2U0NKtcw0PXtScNVF2/rQxjLOipYr6
	yrsq+pUHDxFt5FLC11xdd2JllkPPfrVAgTChz4yPQx+DPHeOT6x2FOSA8xdomlbCyWaf
	S4GeNybuiVQbOuGqRrzQB+TtZGT63FARp7aTVPyBIhLHFRasz9kbdYxByUhAAFTVTAJK
	VUbTbrk5WSco9Pf1GeETUggBC4Nr3XFtEjY/tb5UXfZr6gA/DM2Mv8vohlwwF5XpJ2FV
	Z1HxAEe2mEpDzfKM+uqPo3zVYwyem0wXeXghXXbwIcatg0/SNS0qUXcOHfQ3ifa7EO+f
	Dp1g==
X-Gm-Message-State: AKwxyteQoPMdYHrgFQ9EkTP6Z66lScp4FaFvxjGT343lHpsjapJcWUip
	s2smV0XQ2k4lAzus8C3CRCiqKA==
X-Google-Smtp-Source: AH8x225qs4JVs1D3pYrpyLEcw/98cRIyK5+lZIM7TTHE6bY51E21psKx2c9rh70A9qwFMfG+ZSgeqA==
X-Received: by 10.28.130.84 with SMTP id e81mr19397587wmd.15.1517311302140;
	Tue, 30 Jan 2018 03:21:42 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c24sm15130458wre.10.2018.01.30.03.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jan 2018 03:21:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 11:21:37 +0000
Message-Id: <20180130112137.61-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] tcmode-default.inc: bump LINUXLIBCVERSION to 4.14%
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
X-List-Received-Date: Tue, 30 Jan 2018 11:21:42 -0000

* linux-libc-headers were updated without updating PREFERRED_VERSION causing
  following messages being shown in every single build:
  NOTE: preferred version 4.12% of nativesdk-linux-libc-headers not available (for item nativesdk-linux-libc-headers)
  NOTE: versions of nativesdk-linux-libc-headers available: 4.14.13
  NOTE: preferred version 4.12% of linux-libc-headers not available (for item linux-libc-headers)
  NOTE: versions of linux-libc-headers available: 4.14.13
  NOTE: preferred version 4.12% of linux-libc-headers not available (for item linux-libc-headers-dev)
  NOTE: versions of linux-libc-headers available: 4.14.13
  NOTE: preferred version 4.12% of nativesdk-linux-libc-headers not available (for item nativesdk-linux-libc-headers-dev)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1787a8248d..852ac3c7b4 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.29%"
 GDBVERSION ?= "8.0%"
 GLIBCVERSION ?= "2.26%"
-LINUXLIBCVERSION ?= "4.12%"
+LINUXLIBCVERSION ?= "4.14%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
-- 
2.15.1


