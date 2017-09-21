Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB16780CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 22:27:02 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i130so4152592pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9EYCGIWc8fXTL5qYgt+SyMnXXpr8xuQO9V1lfCX6cRk=;
	b=Ay9A1YDsrUR/pWimL76Lv8Z1sTgUKuwlYJXBesJwMuEwVbFMn/TYwA/U89JjC8QfGG
	1uMgplFhOu8/fs6eSZLxHpOQ11Mt8dsdt3unBLqdnQ3y6TOvCXPGqph4sZqWYHYIdXgy
	CwB9FLbGiI/CrHhbLyqy12WynfQjK+ipvWlM2avD8oTfwpNvTjNK19IqW1OOsQTdJLPU
	9FB2hbNQiLHHJkh6I/RtT8eWcGNtNWA3tXsEnaoWLH2J2SwWPnJU1NLzm4sKbOI8+pCi
	kDA+cwTg+omYr861yGUJQXsh+8kWthprfZ+r32J5kMsSQMXbdFbLUxnrKwW9Kehw7/q1
	Ktaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9EYCGIWc8fXTL5qYgt+SyMnXXpr8xuQO9V1lfCX6cRk=;
	b=dVHjwGjbndfq4lgQ5IORlnaqMndmqPnao1GY+/lUlcHQaS1hOQfhyGSRwAaGEkYHUx
	CoOzY3a4yGfWXNiThthV7DGIfiR6WBrUzdfsGHJOJrj7cAVZBOl3IR5C+HI/IYR8BH4H
	UrD7XLyPy6x7X7/P2dwtIpkCWNTUC9iwxa4xDWolz8umJzLBj9FIh7B4ZVXzyrjb36+A
	us84gtg+qynF7zfCSZY2vhsRA5pP0TvoGl+xFPnmKBf5zuai6wbnG4q8xLGGh6PCNHjs
	ZBMVv3wXxc4RaqHXGmacshCyaNeW+NDof6pAmJ1ZTcZ2Ty7sxneSZv8M9Ead2W5alTRd
	BPEA==
X-Gm-Message-State: AHPjjUjuIqrDwIvJzxDEox3Gde+Mpu68+INHyl9Hd/v5Umxv+qvBW92X
	/iVg26OSxs0XDOlCy7fAFVe6Aw==
X-Google-Smtp-Source: AOwi7QD1mQzWk0p1PQ34kzNYidqf8PhCHiu0Fb5LEYfwQ/B3opSwMthuNH9dtX7KuMFT4Ai2lnMU1A==
X-Received: by 10.84.191.228 with SMTP id a91mr6771862pld.81.1506032823963;
	Thu, 21 Sep 2017 15:27:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	t76sm4674199pfj.43.2017.09.21.15.27.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 15:27:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 15:26:53 -0700
Message-Id: <20170921222653.27216-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] llvm: Use the SRCREV past final 5.0 release
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
X-List-Received-Date: Thu, 21 Sep 2017 22:27:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 632178fd77..5ea7033ec7 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,7 +19,7 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "9a5c333388cbb54a0ce3a67c4f539f5e590a089b"
+SRCREV = "81029f142231bde8e119becda112a2173f1459c9"
 PV = "5.0"
 PATCH_VERSION = "0"
 SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=release_50;protocol=http \
-- 
2.14.1


