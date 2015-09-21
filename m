Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 11D30766EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 19:43:28 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so127332699wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iPZWi2SxAOF9u1DU89Aej4TmICsrk8MivC5OPVFDJDU=;
	b=H8+ZXMvdfzyvbPiX9RvyHGB+axLMl0n2DSFiWK+73mucQWs83bPnUJAfqjs2vJF5Dq
	tUCOv9/raQqK53vzlfgRM4lrbENmr7lR11fLJKfU9A96P0jiIXjv8/P9xOTRohte07zm
	t30xp/eIksbN/5JNVpNG9c3tzaGVnapgy7Bg+TS4EDNyxeuILlO1lM20WOXRENb65rC6
	554VmAGO+CLvQdn5zFwNzZPDBHzV3iqQXTRftp485iwB0iLe0TVqYzA//dZOklX7qGpb
	zJkbZ2t+Nqj4cwAs7+YvRY9SoNNNCHAhDe9vnB2W8wwFT857LKdq4MsljyT+G5BhTiBu
	gMAQ==
X-Gm-Message-State: ALoCoQnZJCc1Sj15ARNpVNR2EbqYoCTAk6OIhexZISezmL4zPgw5yPFUKqbHD9m+X46IEMheKYKV
X-Received: by 10.194.48.81 with SMTP id j17mr24135569wjn.81.1442864608363;
	Mon, 21 Sep 2015 12:43:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i9sm25664659wjz.20.2015.09.21.12.43.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Sep 2015 12:43:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 20:36:30 +0100
Message-Id: <1442864190-30232-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] packagegroup-core-standalone-sdk-target: ensure libatomic is in SDK
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
X-List-Received-Date: Mon, 21 Sep 2015 19:43:30 -0000

Some architectures (such as MIPS) need libatomic from gcc-runtime to perform
atomic operations, so this package should be included in all SDKs.

[ YOCTO #8274 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 37f5e43..6997f39 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -7,6 +7,8 @@ inherit packagegroup
 RDEPENDS_${PN} = "\
     libgcc \
     libgcc-dev \
+    libatomic \
+    libatomic-dev \
     libstdc++ \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
-- 
2.1.4


