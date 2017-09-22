Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA9A7829E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 00:12:32 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j16so4258715pga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 17:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4IzyMDQc8n/Fliw8SS5TenoAacqTxHBKke12gMMUUDg=;
	b=ShS26KYLf8UnbKOH2Rcs9anIVHBh/MQxMcaBh65cHuFH4SszwbWcajO8Kreno/mHom
	re8+rxLA6LEeZL1HfZNfDT28rocw0RAZhdOipJauQDI1SBAt3vRseRQqqIhavYYWkrbW
	xrd+Np0Ue1Y0v2YbDCFGqrvuczQ7+2il2+JhPxMrXwNMcq1cOKE8UZq4R6KVTsKdHT2e
	hbAl/7wUZJ7pXcGsYJglIyrWvogQRhEH7WsbnWaVSDX1wAxweeAoeD4wahYw6WHy1z82
	urpu3/iIvF6NMwgZR1fuqlL6s9RWLKZpT/YVIfSoK1EGCRBDLxE6PQRHJSiI9TVYBdo5
	cvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4IzyMDQc8n/Fliw8SS5TenoAacqTxHBKke12gMMUUDg=;
	b=LZisr0G8aBQZx/4lceC6q4Fnyo46Ml97YZCeqPJNp6u0pJED8BbEXH4iKD9nOZMuCT
	FnZKNwDf6zJR5/oB7tfVyZlwrK34BSZhTJnzCH91tID9Te0HGgX97vIFWRAIjR6nliW1
	TgX3S9m5erPMrbMcrw2jCmUbTJLWbCYSHHBaODfW9SUWIBWHimhdeB6chMUK/xg2Y9GE
	cngRnsT+NFNCa8hUhMiXAIv7Mc3zk4PRnBMyRHvEtFACkLI/Fgj+xe6kpJBgdTMyFUTH
	dV1EUop8tbKQkQqdpn/L0WyZIC192LKVaRTCpFs0yys4a6pbuXVBlxvVwy1BN0I/aYNG
	Nyxg==
X-Gm-Message-State: AHPjjUjiKPlT3eFbB6mvJM1KI93naHuRHOECAAYfsO/BGElYJ1pQu/DW
	g3T261urV6l89XK/NO7jG8Y0uA==
X-Google-Smtp-Source: AOwi7QBFQHKoF4jrTFzIQwV6UaheoCQzR/YvVFQ6At9XsOvxi70mfKYAHZc1wdZA6QpX3HaM0epqeA==
X-Received: by 10.84.234.197 with SMTP id i5mr7376117plt.184.1506039153525;
	Thu, 21 Sep 2017 17:12:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	o128sm4366114pga.5.2017.09.21.17.12.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 17:12:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 17:12:25 -0700
Message-Id: <20170922001225.17007-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH V2] llvm: Use the SRCREV past final 5.0 release
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
X-List-Received-Date: Fri, 22 Sep 2017 00:12:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V2: Bump patch version to 1

 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 632178fd77..884e2ae0fb 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,9 +19,9 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "9a5c333388cbb54a0ce3a67c4f539f5e590a089b"
+SRCREV = "81029f142231bde8e119becda112a2173f1459c9"
 PV = "5.0"
-PATCH_VERSION = "0"
+PATCH_VERSION = "1"
 SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=release_50;protocol=http \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
-- 
2.14.1


