Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id A8E0771CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:13:20 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id c1so3752819edk.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HFprI7pRspPpwMIaeE7xNHPfsE+T43uvUO8Symu1lq4=;
	b=A+2x4RZqrIwafbi780PB9Wi70mYQ/cNnXU4eeoMx3WBxZCmO66Dq70dVstiKfGK34w
	fUHtpJwrJ68FFMNKsZjVWYs+CCC0ZI0uHVxn5+KvFvX6J28mutner/FT3K5o2T7XNnsj
	5+bZkkO8E1QhFdSxx5q38Bn4HH+iSkrI5/du1JbG5cwbCX5DyenQ4b19HuJy3a1zqPHW
	XGtTRJwoMuDBWUhy/CDhDd/3smGQYNKxdd7X36aSlcJfZGGKRrCvXBnPrCszzx0r8xek
	VUlJdM2jCsl61XEucJtY0wYpztYd4hXa3bspRO0xaRx1HvZt1fFUKn2Wb3lPdgrFQb83
	IdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HFprI7pRspPpwMIaeE7xNHPfsE+T43uvUO8Symu1lq4=;
	b=YNHW3P1HcxLHgAxwRCSGzA+g3meE9oTjy2QOkcUkkZ8fl9PeFzhMif9NX75B/fZwa6
	k8ZYVH0ZE2h8V432a98hA+GWcl6KjGt4Z7rlZ9XhLGgMmLslYLEuQ03pr23bqdUxukoF
	ri1z95KjOaWTw9jaNGS6xcjRyqXKmqouLt/51Uv4THIOZoOJzItKaN5qWhz1qF1DB6P9
	5GUxgEhCvTtXvXf2xR0GmbD+E1AsQzsJTTqirssv2EHKZlzzA+Txj3s6M8P9INY9tG2/
	Av2uv2NDvEpPZTMLcVdIWhqdWPg3j8mL5pQ7yNyUcqf94WKCJh5wYZD3sCarJyOPpQYY
	02uQ==
X-Gm-Message-State: APjAAAWw38eX8N4IxlHMGj+eE6LqjaIf0LwkD44m6gP3ZNTxovSeuf9y
	n0aRF0cSgxZb9pYLH0wGN3PVQsDgsJ8=
X-Google-Smtp-Source: APXvYqwm1dv9fo71o/4j9ihGDH15vkBy+nQS8fO9SDwtTU2WcIge/HqJSwhgpULBFdX7jgfqvEa22A==
X-Received: by 2002:a05:6402:390:: with SMTP id
	o16mr12078596edv.156.1555946000783; 
	Mon, 22 Apr 2019 08:13:20 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j55sm3716557ede.73.2019.04.22.08.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 08:13:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 17:13:17 +0200
Message-Id: <20190422151317.5383-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] cups: update to 2.2.11
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
X-List-Received-Date: Mon, 22 Apr 2019 15:13:20 -0000

CUPS 2.2.11 is a bug fix release that addresses issues in the scheduler,
IPP Everywhere support, CUPS library, and USB printer support.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/cups/cups_2.2.10.bb | 6 ------
 meta/recipes-extended/cups/cups_2.2.11.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups_2.2.10.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.2.11.bb

diff --git a/meta/recipes-extended/cups/cups_2.2.10.bb b/meta/recipes-extended/cups/cups_2.2.10.bb
deleted file mode 100644
index 490c84e2f4..0000000000
--- a/meta/recipes-extended/cups/cups_2.2.10.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
-
-SRC_URI[md5sum] = "3d22d747403ec5dcd0b66d1332564816"
-SRC_URI[sha256sum] = "77c8b2b3bb7fe8b5fbfffc307f2c817b2d7ec67b657f261a1dd1c61ab81205bb"
diff --git a/meta/recipes-extended/cups/cups_2.2.11.bb b/meta/recipes-extended/cups/cups_2.2.11.bb
new file mode 100644
index 0000000000..aeb2e14e3b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.2.11.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
+
+SRC_URI[md5sum] = "7afbbcd2497e7d742583c492f6de40cd"
+SRC_URI[sha256sum] = "f58010813fd6903f690cdb0c0b91e4d1bc9e5b9570c28734229ba3ed2908b76c"
-- 
2.17.1


