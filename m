Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4D88460167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 11:45:49 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k11so2273536wes.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 03:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q+OOQGKOwX7Gzv1HFoISrPD0Qav7NYQKPDxK+ur57SE=;
	b=PN9h+l/jIzMON7JwtOb7Sw3BGUhGLqwWoOgf9rAnkgNM5Y5AM4hnGEoOzU74W0d7cI
	WuqBw5+JYoY/X+8pNG+D0QEVyx0Zf3OZhNT1q3xzjNwxShR/hz0oLAfefEKjEfuS1/y1
	KS6YHmx6geWIxRh02dvBZNX2sQ8Q1l8k70ysEnmqgj+Fv6mgpP8pHc5qieqcF6t+e0Kd
	HLUKuMv2e2/BbcMYLG7gzWd9uDw4LsUBpE8HZCAvjeuVHBFIFLI/ObTOuvM8R+4/vbH0
	xn1xO9E2oc9Ip9hknzLhlPuBQn3eF3wZKoaUk1NYK97AEiVkXiKZMyRN/0yh0M/6tPEv
	a8KQ==
X-Gm-Message-State: ALoCoQlXdVQSpyyXGLgZbeRsSTlfbhljSpyqZtwZzqiUCE/mJrsrZWgROpIpIHRvJ/PdH2BJcIKc
X-Received: by 10.180.104.9 with SMTP id ga9mr116554638wib.9.1420026349876;
	Wed, 31 Dec 2014 03:45:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id x6sm23561191wjf.24.2014.12.31.03.45.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Dec 2014 03:45:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Dec 2014 11:44:43 +0000
Message-Id: <1420026283-969-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] waffle: upgrade to 1.5.0
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
X-List-Received-Date: Wed, 31 Dec 2014 11:45:58 -0000

Add inherit of lib_package as there is now a tool in ${bindir} which breaks the
package renaming.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/waffle/{waffle_1.3.0.bb => waffle_1.5.0.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/waffle/{waffle_1.3.0.bb => waffle_1.5.0.bb} (87%)

diff --git a/meta/recipes-graphics/waffle/waffle_1.3.0.bb b/meta/recipes-graphics/waffle/waffle_1.5.0.bb
similarity index 87%
rename from meta/recipes-graphics/waffle/waffle_1.3.0.bb
rename to meta/recipes-graphics/waffle/waffle_1.5.0.bb
index a6d1acd..3a603a8 100644
--- a/meta/recipes-graphics/waffle/waffle_1.3.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.0.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
 SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5020ecc249096c881e1f59ee961f3d41"
-SRC_URI[sha256sum] = "340ee04172dba878249469018cd7ec9d1ecd41af26b612c741b8b52e713bca8e"
+SRC_URI[md5sum] = "81d6060eb03cdacb5c6e1be95a43d668"
+SRC_URI[sha256sum] = "6344fa2803d76182a08380780605b36c38e795639a3229281c96b75cc30137a8"
 
-inherit cmake
+inherit cmake lib_package
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
-- 
1.7.10.4


