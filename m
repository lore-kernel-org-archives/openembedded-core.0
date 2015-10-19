Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3883575D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:13:05 +0000 (UTC)
Received: by lffz202 with SMTP id z202so24674100lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 03:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tiD7y+oEUmnoCXOmD3jEX81t4ZXgXIryfQM7v9Zqjq4=;
	b=hl7z83N0CnZEnKaCXZeQOyF+2MJtZ9FUtnASzbTIjd3qp3sE6ZhB+fpOGlTTaWC0Ic
	Rvl2uo1b4espkVWpTfopp7sP9W5gK/bzVqlxhJzNiOGNAZB8F9Rld3vjkPlhl1c6R0bU
	O7yfERxzEG+IfWmZV9yvU801Eax7tY9RL8qxrkYB13VbJ7a7Jx0Yjr7Wo9qU4rEF9PVn
	YsG1rbnygRXfPl70yrriTg98QFHGCYLSBZYQCVKpR/r9ovir2/OvBUnOyDOPQ2cjNrgo
	4BnP8AGAMvLs60K3ERIkE35BObraI4XfE0uEwEEC5H0sr4AxCHYqaefdke+rNXdEKhhJ
	Qq3w==
X-Gm-Message-State: ALoCoQlvL0uDvoY8vKZddYCfKjm1pQXm8R0h4BdlI/AKdembOOPYw5u3Hdr/ihC29z8uWaMKXadc
X-Received: by 10.180.85.226 with SMTP id k2mr20738511wiz.67.1445249583317;
	Mon, 19 Oct 2015 03:13:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	he3sm39245624wjc.48.2015.10.19.03.13.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 03:13:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:05:27 +0100
Message-Id: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] bitbake: add file-native to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 19 Oct 2015 10:13:06 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9ddd1c0..06971da 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -166,6 +166,7 @@ DATETIME = "${DATE}${TIME}"
 ASSUME_PROVIDED = "\
     bzip2-native \
     chrpath-native \
+    file-native \
     git-native \
     grep-native \
     diffstat-native \
-- 
2.1.4


