Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 388EC770C9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:26:31 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id pv5so3841197pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FfFrpQWk3dsfRuOkzpfdb29qk7bQGqc6Jglol8uS6fs=;
	b=OE4T6PCN03W2kGtTv4t23+YNzh4k7YifcfBlrJhWPEudnR0Cq/l4zpmAiRBYd6jxM8
	2lDs0oeFHxhfxqioWKBDU0K2CPTH4rr9JB0VaudFcs1Q7owfjduT91FoCXKzmkpFTR5K
	tLP9joKvVG42A4pF3B6wQkxoQb8F9dJQhEW2u2wQ8CejCA8PRvjhgbOf4FAmIf8l6eG2
	ooHS6qAr7DxHq89uUI7cmaY4g4UW3s9J6P6EHhULb+Ln9E7BUfvWpQLPk43nv3UxVy7J
	44K6DpI5g3Sw5PJhVBhubxpvfsW3wFuTnFYjjwQwoS/0SXszcifhTzJGC0uSfu4F5D1e
	s8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FfFrpQWk3dsfRuOkzpfdb29qk7bQGqc6Jglol8uS6fs=;
	b=HAnBJteOzw3kDZd+fdvifhAR0h6b9XyYz90YGcuPpOVZP4JRcEFxinXXP5ZlhEbC3F
	1pxnQdbrkuEirONrdm1KIs21Xtz9AjPwb2Yt/JdsHqwfQqRHRgW8i2LXFuNDD4oCBdaz
	aBs5geG1uPELFv/bQkQVlQofIr5KtWMMGEHYIxiEGb7o1qKkSviBfJXNu1ZN2BhQcE7P
	oMNHwwzqJ6nUJokzkSNIhdV+7EUjJ5BasK8IirIYYze0paHp4vTinSXPZ14sSiWvApER
	nR0Ju6GR5V817ztJp742FdNRDY3OMk2+TPeSiWlvfDfvl2OOpMAihfQwJ45GvCkzgvuB
	iPvg==
X-Gm-Message-State: AG10YORpEF8BiOhRbvDtBgZmVJNMfN+I0FuttHuNc+kDaNm9GaQZrAXNV6KoeoxQ09FbMw==
X-Received: by 10.66.100.228 with SMTP id fb4mr8720011pab.84.1453512392304;
	Fri, 22 Jan 2016 17:26:32 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qz9sm12302299pab.39.2016.01.22.17.26.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 17:26:31 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 17:26:05 -0800
Message-Id: <1453512366-11405-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
References: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/7] sqlite3: update 3.10.0 -> 3.10.2
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
X-List-Received-Date: Sat, 23 Jan 2016 01:26:31 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.10.0.bb => sqlite3_3.10.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.10.0.bb => sqlite3_3.10.2.bb} (62%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.10.0.bb b/meta/recipes-support/sqlite/sqlite3_3.10.2.bb
similarity index 62%
rename from meta/recipes-support/sqlite/sqlite3_3.10.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.10.2.bb
index c183692..75fabc6 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.10.2.bb
@@ -7,5 +7,5 @@ SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://parallel.patch \
 "
 
-SRC_URI[md5sum] = "274364e6ca5c1104d42912f11e61ed26"
-SRC_URI[sha256sum] = "43cc292d70711fa7580250c8a1cd7c64813a4a0a479dbd502cce5f10b5d91042"
+SRC_URI[md5sum] = "adaa31593bb5605ec6d6f34f81b43008"
+SRC_URI[sha256sum] = "a2b3b4bd1291ea7d6c8252f7edff36a4362f2f0e5d5370444ba6cbe313ae2971"
-- 
1.9.1


