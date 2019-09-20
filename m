Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9565F7FA67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 12:03:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id l11so6500698wrx.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ct2NikCl0EoBCozlf1N2RciK76mPcjRnvL/BEowQzaM=;
	b=oeVJ/YQIj6D/zXNv5R0+HWncQX4SbgpCI580IOSJyv4FJLjZJNcyqgd1O+xFtlFhoI
	WAAwAzr4B6Sk/VBoPcvznkqlpdZ+YRU8895Z0tRvRYxs3NWHw51QiJYNO/xn2O6ZcmEK
	oDHnpx3wQvbRCcEjYX7wht8EfQPA/CqLvztpxeWYFgVmOXnLlcTlkFeFxqnMqK0jEl/2
	OpzPy+WdEloqjlU/I29FTMQ+4bxw+1ZOV8Gy+CP/gYMiP2Ry99oRkoP5H/PuZ2ppgxeD
	r0FpijOlT+ByLCia8mmBbtoUyNA9bopY44GhyIsuqVmIo8/EROb6n61X9rMuVz3Edf9r
	t0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ct2NikCl0EoBCozlf1N2RciK76mPcjRnvL/BEowQzaM=;
	b=mVii60jrrpfMs6q1qW1/Oiq71bYH2aezTUp+h71PMuQol1D9jUnenbKDQitsGoMJ4I
	hdsf6ZWKGq3tHwNvQvtb9Mq/jsY2aQsYBJU+DbgPysgDU/4lRPxdrtrJ1TbegvLDmIoO
	seiCIK7gNxWLzU48vRniX6ox+SAMNMIgz823pUQ2j2Wp+Tysty+XAF/jBZ/lSkLSGO7z
	sNzy/LVIUAwiWZjSpzJQTj4uLzO4+K4rpiTu2k9rSMcqNdn9hugI+8Jo7Guw+Js3gmDr
	aHHLZEKv42KFAWVJ2Q3w9AZGK+YYQrHRhCkEeRebBqAn+frh4Z5wc/MunsVQzIbUCBjk
	LcBw==
X-Gm-Message-State: APjAAAXmHFGl0QTfQ+y+V2UC7u4LzHTXMJSDDA1BS1r11D5kp5dtlBLD
	oIus6BFJgzOiZnbgTuP0GTUbpuBNiTw=
X-Google-Smtp-Source: APXvYqziEhC0DuLH+GPKQr6fo7fhYhMssxx/rLOIGZ4nghBcZYhze6KN0TYTeW9pmdoydV8aBx7OQg==
X-Received: by 2002:adf:ed05:: with SMTP id a5mr11415564wro.35.1568981020755; 
	Fri, 20 Sep 2019 05:03:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t203sm2106355wmf.42.2019.09.20.05.03.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 05:03:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 13:03:37 +0100
Message-Id: <20190920120337.1658-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] json-c: use GitHub for upstream release checking
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
X-List-Received-Date: Fri, 20 Sep 2019 12:03:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 9654e60a3d2..8ee9437af16 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -10,13 +10,8 @@ SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
 SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
 SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
 
-UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
-# json-c releases page is fetching the list of releases in some weird XML format
-# from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
-#UPSTREAM_CHECK_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
-RECIPE_UPSTREAM_VERSION = "0.13.1"
-RECIPE_UPSTREAM_DATE = "Mar 04, 2018"
-CHECK_DATE = "May 02, 2018"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES_${PN} = "libjson"
 
-- 
2.20.1


