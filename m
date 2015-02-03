Return-Path: <mail@timomueller.eu>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 575236E5D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 12:21:36 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id p10so44695965wes.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 04:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xGeCxK2Kx8W5LfsXZ/eoFjJHwzkCqZryw87+R3/xEo0=;
	b=Y1RU/LuqgY5XghAXDoylq4mD00gZdOwUg1w/zFPCYzr4MBHWYqb3CtdKEFhcYnfrN+
	8/bFB30rW5f7DhJ1NqoFODU4TC93AwYk29tZrqHDeME0EoER2QqXvx4DaoTqQCAlCI8z
	cZBKrzyt/3gPl/JHUcVtH4boisSdkJzsKxkVYNiX62C5b2N37cEofkSk/5jKfvVZP+y+
	n/utyjpgbJphW6TF1q0te5iLWQRGdLvhhlrLg70urEPkGK4yslVJ2Z2nErxXPV01buF1
	xvhBH0wvBDJjyilQA/K7gBKKGwHN+Flvw28dquV8r3fbgM3L3+oBT9G7QHTSt3ggmn8D
	wDWg==
X-Gm-Message-State: ALoCoQmzw0LHAPniLG/KggrfUo5q8DpUGmK4FBy52jpKVIBwAr7aFhZABzVQuoNFCGzAfTBt4k04
X-Received: by 10.180.84.98 with SMTP id x2mr33429071wiy.14.1422966096895;
	Tue, 03 Feb 2015 04:21:36 -0800 (PST)
Received: from localhost (mail.bmw-carit.de. [62.245.222.98])
	by mx.google.com with ESMTPSA id
	uo6sm32421514wjc.49.2015.02.03.04.21.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Feb 2015 04:21:36 -0800 (PST)
From: Timo Mueller <mail@timomueller.eu>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 13:21:27 +0100
Message-Id: <101216fcee28372a0091d98b73f74f08e6d36b8d.1422954274.git.timo.mueller@bmw-carit.de>
X-Mailer: git-send-email 2.1.0
Cc: Timo Mueller <timo.mueller@bmw-carit.de>
Subject: [PATCHv2 1/2] apr: Allow use in SDK
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
X-List-Received-Date: Tue, 03 Feb 2015 12:21:44 -0000

From: Timo Mueller <timo.mueller@bmw-carit.de>

This adds 'nativesdk' in the BBCLASSEXTEND.

Signed-off-by: Timo Mueller <timo.mueller@bmw-carit.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/apr/apr_1.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.5.1.bb b/meta/recipes-support/apr/apr_1.5.1.bb
index a27b233..985ef67 100644
--- a/meta/recipes-support/apr/apr_1.5.1.bb
+++ b/meta/recipes-support/apr/apr_1.5.1.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
                     file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
-- 
2.1.0


