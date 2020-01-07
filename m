Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2837F6E4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 16:46:43 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id bg7so23581pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2020 08:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xVIX0IhqkffG/kzaeKHkVRYL/ZL+03at4Q5x4rLzFH0=;
	b=ZfzjJHi4/91TjE6N49g6ikMuxSdFwF3045ia15ic9/U8QinDqzKdED3u0tbcNlIWIU
	m8oRSp7JoDy2kPRWxo+Uu4pxeO19gN8IWoJpBGSxlT9HtTEzhrhZSz0UzMvRz/Z3RWh2
	K1S24VBn9he7MHdTKN1wgLAhXVrBlnkkYNo0K41aIRSjt+Pj7TobavTp3w7pgB8a9B7m
	iQox7sS9vF2an2VKqL/eq94pqB8iXq9KVLzpCNQJlgq3vd9yKpnn7soz/7BhIV+8FDGf
	pU+bho+lg7vpsn1rNhiLZB6eHPvXEjoHgIhITWAeX6AzzA5Hi30omhsaVGYxXQ73kBWu
	Y83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xVIX0IhqkffG/kzaeKHkVRYL/ZL+03at4Q5x4rLzFH0=;
	b=UfaxADGIyf9QwzcItsF4Z24BFNEzI76rU7BWveiXH1AXL8S80WpBfrI2zzF7wyeVNw
	Iua9L3Cr0g7H8YDDoNQ1vBtsv5IWhuldGh+oI/ylN/cc6gIeGPDxxURVdprj3qBq6O2e
	FxMmKvNQNJpl8ZHBX+Hep4yZe2pW+Lssjn8KTrY+9iN1Rk653CwaoIxz3aRYYb8fyrI3
	YUHG2qLDuq1njXghWSRP/nvOiHKDaNpdBLDTqA9NjmnWkiTvw3ah/NRVQ6RY2/0miZfA
	y9errWMhG01woiZPhe95ED4znEdNVhj+txafQBs9Ivu+1nDRRUn4SJRdYyU9LNMoBtg8
	RDlg==
X-Gm-Message-State: APjAAAWwoqx/HS01Px3ltA6aSHc7rnUNbV1lihblorB9D1jZ/eFY3sUS
	wRGV1usSgFWT1uokLK3OsH1w+JbdKeg=
X-Google-Smtp-Source: APXvYqy/ICfRH2t7/ceDVgTJYYMBy5zYpOMxpVjAte1MFlMWDEyVba7hZrc6KN7L2YVEPHswqg8VOA==
X-Received: by 2002:a17:90a:d081:: with SMTP id k1mr654407pju.57.1578415603987;
	Tue, 07 Jan 2020 08:46:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id k12sm257030pgm.65.2020.01.07.08.46.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 08:46:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2020 08:46:39 -0800
Message-Id: <20200107164639.2434160-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH v2] Revert "tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags"
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
X-List-Received-Date: Tue, 07 Jan 2020 16:46:43 -0000
Content-Transfer-Encoding: 8bit

This reverts commit 194bd4136459e7a38510830b2fb0938d892ece45.

 __USE_TIME_BITS64 is already added by musl headers internally now [1]

 [1] https://git.musl-libc.org/cgit/musl/commit/include/alltypes.h.in?id=f12bd8e05c8bb2c3e2b91d635887ec424ef8fbd9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve commit log

 meta/conf/distro/include/tclibc-musl.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 22f8214ba3..8badbbb40a 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -18,7 +18,6 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
 #USE_NLS ?= "no"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
-TARGET_CC_ARCH += "-D__USE_TIME_BITS64"
 
 IMAGE_LINGUAS = ""
 
-- 
2.24.1


