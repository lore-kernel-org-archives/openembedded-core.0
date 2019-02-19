Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id C14FC7C8D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 13:58:25 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d17so7659354wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 05:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9hQqro8smR6AaYNSqLpBinOyYSSGGtysXkyEALx8yyM=;
	b=DBsPHF4EfqOsquGMf9+JGJuf64JUHPdi351bemdV6R/auBwAlHSsiNO5EaQ6juhwcj
	r9X2BWsGW4d6hCjpXSlpiNNkKOijUMvuaHm99v5Wm3yPbt6DMOx5BhWewz29MP4b15wk
	VXT9swRCs7nNTDcjPTKvhn0m5sZe7KkGWxeDAfZo9EywB0IoNjTKXcLweXm5JoQrWnIh
	Lfaoxfh7bA5UK3NgZofhMf3nrNLr1xbb0YrxkTX1TnuJ1WJXOLWyDRw75egH6vtmZkSa
	9OMepfw36oFEItxFXjyy78z9pbYWHeIfgE8R12Ve3dckchDDD/XfHViFQGXscluPUZHS
	ONXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9hQqro8smR6AaYNSqLpBinOyYSSGGtysXkyEALx8yyM=;
	b=ReTeoMvd0HBNz91nHy2egYnY+xHgolASfTMKQVVsOnH/fyG2QWOUP8IdS3TFHjsQTZ
	AsnS681VlHW/viPfq/IkdCxuC6TxKGiI69W36wJo7sr4hQ6HM161kM3bTWi34z+C8vCL
	4z/DVbhpGKNf6sFAiAb0PdcRswxhUzXk8l6LONOkkWiR4QENOEa6/1btJ3H2AueA2rt5
	nyWxb1vsD8tcYWBuiP4uOQKI7QSXXR52Rd3YGeg1KkCZxzacz6HyrIRKtos7GBAe2J9i
	iex3KyTQu1oGUHb5StT48F0HkEssYDyFmsYtvg3J63okO78kgYrcy8lRhdO7Ajbx9qSn
	AQHA==
X-Gm-Message-State: AHQUAuYitBJX4m/QgLCc7+dRojpDcQmq8yICXRSGrOWSiXWN2g+0FLj0
	Sa2A8OqVN9n+DTV4dc4Wr0nzhQ5j
X-Google-Smtp-Source: AHgI3IZnhfG8bxRhgHeTNMxOn3ccYwQu8bwjULzffBWr8qTL7eZMLSKPOKlP1fTgv7YL2YlsfQz8xw==
X-Received: by 2002:a5d:6207:: with SMTP id y7mr9461403wru.60.1550584706162;
	Tue, 19 Feb 2019 05:58:26 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q24sm1959656wmq.16.2019.02.19.05.58.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 05:58:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 14:58:11 +0100
Message-Id: <20190219135815.18177-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219135815.18177-1-alex.kanavin@gmail.com>
References: <20190219135815.18177-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/8] libxkbcommon: update to 0.8.3
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
X-List-Received-Date: Tue, 19 Feb 2019 13:58:26 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxkbcommon_0.8.2.bb => libxkbcommon_0.8.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.8.2.bb => libxkbcommon_0.8.3.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb
index 8cf508b0bff..ff0f0690b67 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "5f7f8533f907ebcfb1cf8dceb9501264"
-SRC_URI[sha256sum] = "7ab8c4b3403d89d01898066b72cb6069bddeb5af94905a65368f671a026ed58c"
+SRC_URI[md5sum] = "8225a206e00c4146d2e06f5e688b28e7"
+SRC_URI[sha256sum] = "b855c629849a97ab9835a4ad99d6b749a636f70d38a03f070c6ef72024825540"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.17.1


