Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C037D78FB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 12:25:51 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 126-v6so6072418qke.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 05:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bo0RwQPPIWVDdtzP4d8JSK0w8sX+1gJzwCRnUk9VTJ8=;
	b=BE4ae3nzBK0T9uen/t9ZJdS+xxEsNm+hnMb2zXArYNqoStAXeLLQvaMC6vHfwjiXb5
	S9Lu+uH2c0/f+t9xKHhmAee/i+CaiNKdrkFU2WuLOnfSgHkzR8OxI268afIxeC+zVZlo
	wwDq7FazCdhoiUj8IWHx7DmoX2CtbrHf49wgkyW9zV2LNE9rMybQScHZFlwjyruCwnlS
	sRj4/sGBcBPvRVUP2bHQFkpFF5zZcD3V9k3/tAamX70z4WBZ3d6+JZK5sh0TZ+E8rF47
	dIOZsRtWfDjAnA23T3SVss5yIgqHX1eq6RPP1SdU/secLR0+WrSO454i9IMbblbWUlqL
	LgWQ==
X-Gm-Message-State: AOUpUlHQdm/KistaJbwSgnLqf46xPC1BBjwfGFF4TfxBHmFt6XJC3xJg
	hfg5A451RoS8sxzErGdfWOySB3K0
X-Google-Smtp-Source: AA+uWPzl8JNFfAck2A09tn7BdEIOnwfGW7qYU4AOhZnlmuHk2hGrerx5zY83TuYzsQQH0jc570lHyg==
X-Received: by 2002:a37:484a:: with SMTP id
	v71-v6mr30652679qka.38.1534508752288; 
	Fri, 17 Aug 2018 05:25:52 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	c127-v6sm1120743qka.13.2018.08.17.05.25.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Aug 2018 05:25:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2018 08:25:42 -0400
Message-Id: <1534508742-25387-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pip: update to version 18.0
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
X-List-Received-Date: Fri, 17 Aug 2018 12:25:52 -0000

License-Update: Update checksum for copyright year changes

Update to the latest stable version

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pip_10.0.1.bb => python3-pip_18.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_10.0.1.bb => python3-pip_18.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-pip_10.0.1.bb b/meta/recipes-devtools/python/python3-pip_18.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-pip_10.0.1.bb
rename to meta/recipes-devtools/python/python3-pip_18.0.bb
index 8deec2b..3fcdb80 100644
--- a/meta/recipes-devtools/python/python3-pip_10.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_18.0.bb
@@ -2,12 +2,12 @@ SUMMARY = "The PyPA recommended tool for installing Python packages"
 HOMEPAGE = "https://pypi.python.org/pypi/pip"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f8d33acaac5c5dac8c613904bd56a6f"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=593c6cd9d639307226978cbcae61ad4b"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "83a177756e2c801d0b3a6f7b0d4f3f7e"
-SRC_URI[sha256sum] = "f2bd08e0cd1b06e10218feaf6fef299f473ba706582eb3bd9d52203fdbd7ee68"
+SRC_URI[md5sum] = "52f75ceb21e96c258f289859a2996b60"
+SRC_URI[sha256sum] = "a0e11645ee37c90b40c46d607070c4fd583e2cd46231b1c06e389c5e814eed76"
 
 inherit pypi distutils3
 
-- 
2.7.4


