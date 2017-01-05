Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 588D071B0B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:32 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 3so51661619oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CIP76LkbUa9TKK8oahkHArj2TxUNRxYlXXj/22fow5A=;
	b=iL7u0Wkb/vY5dA17Kb8MjVAd6+V7fA5fbS7Eiv/JHUzAe2HhDKk0VQMyNDJbteRUM2
	2S8G+SVQo1jI7MkYPmdM0N8sNQWFs0rEkSBk8mlMmHNGM3c+pfAmBmlLqQ6hYp5JvSdZ
	UvhMmXJfnml2OPyA0/3r0MPLx2VlnKrV66jn8J5+RkG/CSIgAarfOCfN9jrKiMg+jwwP
	L7bTaXmTM9rVdrlIuc2uG/xE1WNOJaH8Ax+eyQzQCrPPllZZKZUZNzorkVXDfDp/a/Nm
	gWjxGR041yVcQf2JW4cvQfvF56a0XBXocvvy2GmAYeaLfxowt6X5WqWD+5U/it3Eapng
	zS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CIP76LkbUa9TKK8oahkHArj2TxUNRxYlXXj/22fow5A=;
	b=pAqx9O8DWNuIScBY5BiLAOGyR3K1fasfieIfKNNNej3XHdwY7uPMtkdJcUekWncqS3
	Sn9hWu1rpNDtjGwbGypesiw02SFYAYfbycq4CXI2qin6zffWcsvp7OtyYN6K0k1Hh8Jk
	I9JoKelaU4sY8xROLGOdyEfkem52dcf0yd4tUv81xc0sQyN4RiwrgmitGO4xI3yHc8VN
	G2P/lQGEhERU/fAwNTYOC2yk8n2VYVQTFRdaDepFgI4biahiyZtYRwa5Jak0WLHxl8qs
	E7ynh72Uhm84A+gXOXIG4kGYKUxbFOlGxkwh27nzDRvq3DriF2XzuynlS9GykGPYaa4t
	/ABA==
X-Gm-Message-State: AIkVDXJYYpsBjVEQmUoyw+qMHz5hBhPk4JBOrawAtHr/nuT17kFcdoqHQeZryFPUG6hCZA==
X-Received: by 10.157.46.9 with SMTP id q9mr29435228otb.88.1483645592923;
	Thu, 05 Jan 2017 11:46:32 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:31 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:13 -0700
Message-Id: <db5c1f6035db49401a88eb0621bb3eb59b8dd4ce.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 01/16] valgrind: skip for linux-gnux32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

valgrind doesn't support x32 at this time, so skip it for that host.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 3385ef7..a4a3e72 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -37,6 +37,9 @@ COMPATIBLE_HOST_armv4 = 'null'
 COMPATIBLE_HOST_armv5 = 'null'
 COMPATIBLE_HOST_armv6 = 'null'
 
+# X32 isn't supported by valgrind at this time
+COMPATIBLE_HOST_linux-gnux32 = 'null'
+
 # Disable for some MIPS variants
 COMPATIBLE_HOST_mipsarcho32 = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
 COMPATIBLE_HOST_mipsarchn32 = 'null'
-- 
2.8.0


