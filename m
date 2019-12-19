Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5157FE6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:54:59 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j42so6033578wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HXaRljC2wegY++cIfampZlYsY0C096eTWSVpY5bxByo=;
	b=cpKlgkIT7FuBEaY0ACJrvGFwSWWZ524/hnNn7vCX/EQB6kg1exo/47sPVDC+cX1Chk
	C/qNQiabdmWmDyDEDZKCzoMufM0voFU/c2ZJ7mztAEUsH24z3OoLsiUqyFF8AZHNjrQ4
	dKIleUQ7jjG5LFDUVxGY7fRrNA1XyBHDSoVnxzm1ovW8uOpeDdeARmRtW96ec5XR7+ne
	KGoDPfoxTtjEIK7XECO5/umJBoUaeYsYAS1T3K9ex8Hg7zxWmMBTGqjO5+p3JZWfo3aH
	S2OtQO2FmgraSCSTyfH47WT+HJJIyGtta/LbA0HVnmjuchtrwPlgCKstQ/Fh2P18eBqL
	QhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HXaRljC2wegY++cIfampZlYsY0C096eTWSVpY5bxByo=;
	b=kwamtrlmY0BIFqkb72gu7gdJTt4eFY+gH/4IqxrhWqh/uMfYUOBys19OoaskU0kM0D
	FPZfV9d1indA/GJ/iHPhEt7Y/J/ibetV+7LjofYXbKUpsSEK1RpjQNXULQvJCmipzy2r
	ByLYC99ShafeYjp/ub9z80GLCsoNdSJ1ud7fb7+GXynNRaeOrsYui9eDMOqY53Zx3km1
	ylsPtpwrd16j1KumMpIAueJSZFGX+3EpkWaZfw+LrkgkJk8MH5nc8c78lq248Wf8biiJ
	mK8Nlts/dO1BJf2HGfIb6dXx9yuVVbi6R6l8X2cIs0ZYE0k6IZ4bfZDzEFqzOgggcPMG
	mHJA==
X-Gm-Message-State: APjAAAVfBFFhw8eDJT8MSlE6BHtGqlAf7d9xYKbEQTo6jShSkCYsgsEU
	JGDYsCOl++d38RQefEHUZgPU2MSGqbY=
X-Google-Smtp-Source: APXvYqxNelGhAkte8EzI69VI7aillfwWPFm8bsQvquWMn3GrkVoXo1FqbEpdu2fAoDK5PBmB37TidQ==
X-Received: by 2002:a5d:4807:: with SMTP id l7mr9852554wrq.64.1576763700279;
	Thu, 19 Dec 2019 05:55:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m7sm6468809wrr.40.2019.12.19.05.54.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:54:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:54:52 +0000
Message-Id: <20191219135454.23080-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] libical: upgrade 3.0.6 -> 3.0.7
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
X-List-Received-Date: Thu, 19 Dec 2019 13:55:00 -0000
Content-Transfer-Encoding: 8bit

License-Update: URL updated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libical/{libical_3.0.6.bb => libical_3.0.7.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.6.bb => libical_3.0.7.bb} (88%)

diff --git a/meta/recipes-support/libical/libical_3.0.6.bb b/meta/recipes-support/libical/libical_3.0.7.bb
similarity index 88%
rename from meta/recipes-support/libical/libical_3.0.6.bb
rename to meta/recipes-support/libical/libical_3.0.7.bb
index f9be898a124..ac9c1146915 100644
--- a/meta/recipes-support/libical/libical_3.0.6.bb
+++ b/meta/recipes-support/libical/libical_3.0.7.bb
@@ -4,15 +4,16 @@ BUGTRACKER = "https://github.com/libical/libical/issues"
 LICENSE = "LGPLv2.1 | MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
                     file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
-                    file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
+                    file://LICENSE.MPL2.txt;md5=f75d2927d3c1ed2414ef72048f5ad640 \
+                    "
 SECTION = "libs"
 
 SRC_URI = " \
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-Use-our-hand-build-native-src-generator.patch \
 "
-SRC_URI[md5sum] = "463a59244c6767b8e67b29379405e297"
-SRC_URI[sha256sum] = "5c8a21c2b732ece4a33e5c862970b4f35a8548bbcda50de5695f6fc211ac4d97"
+SRC_URI[md5sum] = "8a5d07a7fba9e73a85e67f76258bf042"
+SRC_URI[sha256sum] = "0abe66df1ea826e57db7f281c704ede834c84139012e6c686ea7adafd4e763fc"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-- 
2.20.1


