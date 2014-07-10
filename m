Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 76AC8703C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 17:32:14 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id cc10so5000487wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 10:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pts8QZQbJTOyySDpmRJqK52CT4IcxpI2nIq1+vjDHYc=;
	b=QbjkA+5oqoEmqIPY+8phEWYT5VyhOIkwcI/TRrbIGQN6hSpPCRgenvXJKgCm3AoIO7
	PBGTmdyhGQIQ9otluw7+Ae1G5zH5ndHLpMruv5pnBgA6O5rBh72nucSZ6+WVYgXGphjA
	SOJxOFs3fCvSm52uLDGfihr+ZNqbJZ2LCbXTqsXKwpzOEyQsr8JQKUy3kJjOfVKU0TlC
	yeEjF7yn2094EAJ2VVUIBrj3r8S1ojsdhaVuPsXdkZdWsZv4yzO6qydrQS6RemI5wvFF
	1THCbD59RVJNxuKyIZRMkRbKZnREa1zeo5dcbYgxG3kmW+3rYu21Kb+UR5MNBR5hZqeV
	wPKQ==
X-Gm-Message-State: ALoCoQn8cIuXoYxRO1gnIogmsDj3A2RlzpirAdQIOWP0XiPwbnbD7U9BW+g3KyToe9gFoyU03GVw
X-Received: by 10.194.221.6 with SMTP id qa6mr57176964wjc.39.1405013532677;
	Thu, 10 Jul 2014 10:32:12 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	lk7sm111657287wjb.24.2014.07.10.10.32.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Jul 2014 10:32:11 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jul 2014 19:32:04 +0200
Message-Id: <1405013524-11228-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.0.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] git: update to v2.0.1
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
X-List-Received-Date: Thu, 10 Jul 2014 17:32:17 -0000

Also fetch source code from kernel.org. As per the Git release announcement, see
[1], Git source tarball are now located back on kernel.org, at [2].

[1] https://lkml.org/lkml/2014/6/25/760
[2] https://www.kernel.org/pub/software/scm/git/

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-devtools/git/git.inc                        | 1 +
 meta/recipes-devtools/git/{git_1.9.0.bb => git_2.0.1.bb} | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_1.9.0.bb => git_2.0.1.bb} (52%)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 4e0527c..7633577 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -5,6 +5,7 @@ DEPENDS = "openssl curl zlib expat"
 
 PROVIDES_append_class-native = " git-replacement-native"
 
+SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz"
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
diff --git a/meta/recipes-devtools/git/git_1.9.0.bb b/meta/recipes-devtools/git/git_2.0.1.bb
similarity index 52%
rename from meta/recipes-devtools/git/git_1.9.0.bb
rename to meta/recipes-devtools/git/git_2.0.1.bb
index 4eb6c99..dbf32e1 100644
--- a/meta/recipes-devtools/git/git_1.9.0.bb
+++ b/meta/recipes-devtools/git/git_2.0.1.bb
@@ -1,9 +1,7 @@
 require git.inc
 
-SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "e16c14b27c644b8e0dd72bdb5ff77450"
-SRC_URI[sha256sum] = "de3097fdc36d624ea6cf4bb853402fde781acdb860f12152c5eb879777389882"
+SRC_URI[md5sum] = "981f5937840716cb563be1cc6292c8d7"
+SRC_URI[sha256sum] = "02609a06fb40db1f6a968867c0e82bcb959b85902747830de0fda53228712daf"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
2.0.1


