Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8135F60132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 15:21:40 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q59so23646320wes.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 07:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7brkZSBpEUfMff4+9Oy3B2oCctMxbXhXxkVNxKXSZrU=;
	b=bo1MfN1z+aOSmq8dHBPqrUfD5zKQNG/86BkjUbDswrS4tIYi2Xd3+2eLnw4yVMyLNl
	x7WcPCwEUXRegrRNF6tWRq2JS0KReZ5FptWvkR0r3EuGb9eoDfvDk7dMtCseHBa/fSee
	7ygUudF1seunk/Ntj/Gd0dhwK3+W2HlucfO6VNirb/XQbtFLylbtSD2qoO79iJ/n/G+d
	8bLPqIYU03z2oLo9nKYXAqdgxGoIdHwPJZTtc+bNnUWMJGTfZhwzxYIT9qQYRcue8zIV
	vPG3irhgCpSM+YIGTeurA44PtSn0AOL/X2dW0djtBe44jbqACDRdRvFNoB4Jkwz+dC4A
	L8kw==
X-Gm-Message-State: ALoCoQnEehXWktzci48e7ygHOGjPjpkUEpT24lx4LgemjKAu63iMNzV7tTlvzUJxInBFMRh0+7oY
X-Received: by 10.194.94.164 with SMTP id dd4mr2331661wjb.56.1422544901436;
	Thu, 29 Jan 2015 07:21:41 -0800 (PST)
Received: from hackbox.linaro.org ([81.128.185.36])
	by mx.google.com with ESMTPSA id lg7sm2919671wic.0.2015.01.29.07.21.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Jan 2015 07:21:40 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jan 2015 15:21:35 +0000
Message-Id: <1422544895-17968-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] libdrm: upgrade to 2.4.59
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
X-List-Received-Date: Thu, 29 Jan 2015 15:21:44 -0000

* Refreshed installtests.patch
* Removed --enable-freedreno-experimental-api, since it is now enabled by
  default upstream

Tested on Snapdragon 600 with freedreno and X11.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/drm/libdrm.inc                | 1 -
 meta/recipes-graphics/drm/libdrm/installtests.patch | 2 +-
 meta/recipes-graphics/drm/libdrm_2.4.58.bb          | 6 ------
 meta/recipes-graphics/drm/libdrm_2.4.59.bb          | 6 ++++++
 4 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.58.bb
 create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.59.bb

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index cfac9e2..d3e1e92 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -21,7 +21,6 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-cairo-tests \
                  --enable-omap-experimental-api \
-                 --enable-freedreno-experimental-api \
                  --enable-install-test-programs \
                  --disable-manpages \
                 "
diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
index 7d443af..03d6254 100644
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch
+++ b/meta/recipes-graphics/drm/libdrm/installtests.patch
@@ -18,6 +18,6 @@ index bf1987f..d909e19 100644
  	drmstat
  
 +check_PROGRAMS =
- SUBDIRS = modeprint
+ SUBDIRS = modeprint proptest
  
  if HAVE_LIBKMS
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.58.bb b/meta/recipes-graphics/drm/libdrm_2.4.58.bb
deleted file mode 100644
index 7b1207e..0000000
--- a/meta/recipes-graphics/drm/libdrm_2.4.58.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libdrm.inc
-
-SRC_URI += "file://installtests.patch "
-
-SRC_URI[md5sum] = "24213913333d72b36c16463ed92e522a"
-SRC_URI[sha256sum] = "b155fae6b9c9a3b02ef8b77f58c7c219194c996a4018dc55ba66c03996a365dd"
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.59.bb b/meta/recipes-graphics/drm/libdrm_2.4.59.bb
new file mode 100644
index 0000000..14bf44a
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm_2.4.59.bb
@@ -0,0 +1,6 @@
+require libdrm.inc
+
+SRC_URI += "file://installtests.patch "
+
+SRC_URI[md5sum] = "d32a1d37c2546ee11fc5924abeedb23e"
+SRC_URI[sha256sum] = "68d26e1fd85582f4243d66864f9b43ca4ee93662825de32b5506fc8e181ea41b"
-- 
1.9.1


