Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7851F6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 14:24:23 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o205so4251348qke.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 07:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ozWj7cm2+6keJqKHyHSsv6Fw9iYBXQRYpJVZUZM0TN8=;
	b=YCXje+6+0qOOrxH/JewaOZnqaTGnxoazPKg9wdWj3XnuleYyDp27Tg7fbwooVRRaLy
	91Rm/Ume7R8bzu5n1IiNfdlJBAl+GdQUqPy+pkrwBgBSWi++BEQ/7Sridu541Ty9IyT8
	k1P880A8hekPLoM93vz0UbhQMYeBW4xtvzkC/6YmW2wOXiCsVe7HAGehnuODvWziaj91
	BrmKZ9Wr0Vm24IRtB2dg15Teo8xfTf/tgMfi+/owaEAi+CNeWxEA4wYz0KrCaRlpXtGF
	Xf42ltZPg/1AyqdyZdTNhDGHacgCnZHl105K0tujcqzRPZkut1DHp81eIRKGorvwRgm6
	LjGA==
X-Gm-Message-State: AElRT7E9/t82GksNczdI9mxXke2FuON9AXzrZY0KKCbHVQRW9e3cjEAp
	AJ/SDNaBiiRvG7BwfI7x6iL+ugc1
X-Google-Smtp-Source: AG47ELsySsh0k7ixkvqpNapN6j6yxnMXRGEInuz5q2a8eHO32WBbm5IuInmX4E4Wx9PR/3Y3nH7j3Q==
X-Received: by 10.55.171.6 with SMTP id u6mr43691897qke.331.1521901464081;
	Sat, 24 Mar 2018 07:24:24 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	x49sm8343470qth.62.2018.03.24.07.24.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 07:24:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2018 10:23:52 -0400
Message-Id: <1521901432-1251-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pip: update to version 9.0.3
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
X-List-Received-Date: Sat, 24 Mar 2018 14:24:23 -0000

Update to the latest stable version

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pip_9.0.2.bb => python3-pip_9.0.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_9.0.2.bb => python3-pip_9.0.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pip_9.0.2.bb b/meta/recipes-devtools/python/python3-pip_9.0.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pip_9.0.2.bb
rename to meta/recipes-devtools/python/python3-pip_9.0.3.bb
index 53fd6dc..850556d 100644
--- a/meta/recipes-devtools/python/python3-pip_9.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_9.0.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "2fddd680422326b9d1fbf56112cf341d"
-SRC_URI[sha256sum] = "88110a224e9d30e5d76592a0b2130ef10e7e67a6426e8617bb918fffbfe91fe5"
+SRC_URI[md5sum] = "b15b33f9aad61f88d0f8c866d16c55d8"
+SRC_URI[sha256sum] = "7bf48f9a693be1d58f49f7af7e0ae9fe29fd671cde8a55e6edca3581c4ef5796"
 
 inherit pypi distutils3
 
-- 
2.7.4


