Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5359016B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 11:01:39 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id r5so6359612wrm.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BE2CfBckLf7G226gMAFj9XJ36/Nn8ZRY2/E8WJN1VbM=;
	b=VW6S0RR4xIOUEd9GBwAsArwp+/cvDQIWfFdiTjzRx2ucudQ5JI/p5OqhMBroxOTey4
	dOW95MtxUwaJyJ1dySXJsDsvWZcWcqO6+shW2byWCvFPvYoZ2hTzMJhahgax2gsBtDSj
	fEBNvhrktDpley87CFMyVmoUJ5aYcG//qkgaIVoruhqzJEBVsMllyrFjo3/nbddXVD8G
	6sHgc+kDkTqgdU8OYlLWajYT7+KWGOSaik56bnqVOXlOAiTwE4U0fBNlVHU1RvxzGPGm
	NXZkNdhTxJRCSqjzxtq7ZHulQYT1zp0Brv/z8SfqqmJ6aL6+cW4QmTcPBx/eIWZOj7/0
	zdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BE2CfBckLf7G226gMAFj9XJ36/Nn8ZRY2/E8WJN1VbM=;
	b=YRIgJjvoinawYZ9VEZWRHNoA2Xgpfr5WOCXRnWREJM+HV1HXhALIrtXlG/9FGU7vX5
	Qew57fQ76QqeRq5CFsedKHkr8t4lAAbGgmNmy44piz2feh53vCE75kXggrl5CRqY/8lU
	q4qjNnIsmdj3F7zO3890Ijd+CRyS6DmyrsM3H45m1JVjY9lRi6Kczc7lh+QC0Sa/3E+R
	1ZqS9L/euyFpQURcMHpmAFNnRdHyh8JbgvZrp3SY+asdl26Ddcc2TTNWx+xnIJOuo77W
	JDbnDH1hw75MLa9QZ8YnFEWEZgzwiDuFoIKEDw+DBHDjCJC8F+5Q6BSixTClBy9Lg4m6
	eEVA==
X-Gm-Message-State: APjAAAVc5jQB78VZFNwJqOjpb9Ye+8Q2SO/Dx7oPbsts7JQtNxt85Wdb
	JpYiX1bIaQ+d/RFfIdMo6rCv/GyS0Kw=
X-Google-Smtp-Source: APXvYqxRsomN0z9830NyQ3EUUSyRd5cPUZ3xyD21K2Gejt/zah57Gf+V3JuHLHaAUsTi1jyX0jgKEg==
X-Received: by 2002:adf:e2d0:: with SMTP id d16mr2730319wrj.245.1568804499754; 
	Wed, 18 Sep 2019 04:01:39 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id n2sm2041872wmc.1.2019.09.18.04.01.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 04:01:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 12:01:34 +0100
Message-Id: <20190918110134.18149-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libinput: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Wed, 18 Sep 2019 11:01:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/{libinput_1.14.0.bb => libinput_1.14.1.bb}   | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.14.0.bb => libinput_1.14.1.bb} (73%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.14.0.bb b/meta/recipes-graphics/wayland/libinput_1.14.1.bb
similarity index 73%
rename from meta/recipes-graphics/wayland/libinput_1.14.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.14.1.bb
index d236f3fa087..38bc8d2c338 100644
--- a/meta/recipes-graphics/wayland/libinput_1.14.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.14.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "1c33d49fc7985926eab877e3de9c17eb"
-SRC_URI[sha256sum] = "7cb85c24f8920b81bc5360220107e267ab4e0e718704c7690a8c7b03fa14fc67"
+SRC_URI[md5sum] = "da29a704dc6f7ea2d5aac754db046340"
+SRC_URI[sha256sum] = "e333a3242835c019ca37d2cef8b51a87d3138eb47444119c0153dc7a8656ee70"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
@@ -21,7 +21,10 @@ PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
-EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} -Ddocumentation=false -Dtests=false"
+EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} \
+                  -Ddocumentation=false \
+                  -Dtests=false \
+                  -Dzshcompletiondir=no"
 
 # package name changed in 1.8.1 upgrade: make sure package upgrades work
 RPROVIDES_${PN} = "libinput"
-- 
2.20.1


