Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id EFA267D40E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 13:21:53 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l1so1926898wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=07nKTQJ5HRxJA5Pkado5jd4v6qKN9TtECZ61NRfwjug=;
	b=G8LuVDmZ6tsvrH4paMY+yROqjW3NgvWyls9y5ClYvJMWcgsc1qNqzPBsDTlkMxClDS
	9tBGYRwlfO/mzV4ikzwZ6RbpaurcZJ8ugwIkl/mGQsa6E/f2yr0dTncruIIJM3o3Yfr5
	a5yuo/vEvk1t5cdWEGjz0M2RxIiSpGAJLYj8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=07nKTQJ5HRxJA5Pkado5jd4v6qKN9TtECZ61NRfwjug=;
	b=EM8xrwVOcFvjtnRKrrtGCroRse+WPzVaJ6mInTJ4ea8gLDxgTDHPhMTPeViJ0M2Aj3
	6ZLdNUJatHuz3f2NQoQvBwAweR93SpOkxcv/fcnXDjUinAgw+jGBlDhoBj2d/VZtpKDY
	bpaDYYv1ba6c4WLEuL9aa3sBEn+VAODqdgsxqjO4I2E6ogyDEdM8CkQayyDOEwAVL275
	Pk4fHJwfpCIFL7pKLN13C/RCLNyz8qLHA3SmgA8yH3oJKCJDhED8QC2F5rvzzToDyUGZ
	uoyxvbqZa7WCteW0qXY+0S+yG+MPqF1XeuODepwD0yMMA6mdLIY0cjLporaAA3Jv61mu
	f1AA==
X-Gm-Message-State: APjAAAVHqAgSqpGp57jZB+mqPYKDgcBWAYZ5tS4NJNS8D87tmUoLnZ+5
	mDD7z11+qNKt3UMGgd2dGet+S3t5s7A=
X-Google-Smtp-Source: APXvYqwREWKJ8/gScjRRTObCnflrc4zvKHeWJzbBEDxG0jF1YtUWGdqYMSbC1gWriCfKlcjjCP0mlg==
X-Received: by 2002:a1c:ab0a:: with SMTP id u10mr21726906wme.0.1573478514276; 
	Mon, 11 Nov 2019 05:21:54 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m3sm15236301wrw.20.2019.11.11.05.21.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 05:21:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 13:21:52 +0000
Message-Id: <20191111132152.15249-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sqlite3: Drop pic as we no longer need the sqlite3 static lib
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
X-List-Received-Date: Mon, 11 Nov 2019 13:21:54 -0000
Content-Transfer-Encoding: 8bit

This was added in:
https://git.openembedded.org/openembedded-core/commit/?id=6a58e12d19c539deac9e90679a68438497a42fa4
but is no longer needed now pseudo doesn't use sqlite's static lib.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 4af1e09e80d..07614bdb3e3 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -44,8 +44,6 @@ EXTRA_OECONF = " \
     --disable-static-shell \
 "
 
-CFLAGS_append = " -fPIC"
-
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
 CFLAGS_append = " -DUSE_PREAD"
 
-- 
2.20.1


