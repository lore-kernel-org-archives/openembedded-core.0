Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8DB79852
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 09:37:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n2-v6so25066152wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ocWIJ0mBEMDHy5CXvM0mj2TeXJ/zjhSPeEUQmANePcI=;
	b=nFpuE9FoxWC8ngBgoGwWQOGOuVXmZsTciAioludNGe1VoJlEOvfEldoFyA0h/zRUCx
	9/h72ULclVyD9rkURcN8aBis4YWYDGucL5lAaa8gx4k5UDzyA0MyTJASqrzNLJoa0x59
	MsYBrRjoW0o7LguH0L9VgY2UVLLHiN1jaLalI5Wgy9JuOkYPaRiaUxSqBTwWKqOHLO9O
	JFcl+5ODDwtMBzQADWsUs8ojhjNB5pjRRCvgBOX9ycR9uvyfUUjBDLxtUOuEbRkrk2FA
	7yQHVyJHcjhR3QsadCjALwKOkvtuISzgagsLb9uken5McMkI/u/JrDW56az1VDX5Uxwf
	p7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ocWIJ0mBEMDHy5CXvM0mj2TeXJ/zjhSPeEUQmANePcI=;
	b=JCnEnjVhjKYvnJr9rRI68xhs5e1TVyTWBR649AbffJPLtiBURqJO+DuGf+l9Q766Ie
	X9MCnr7PkDCQgiuM0muMjeJooTNLeDnw7bIrwIe6gjA5JA96d4vVUuJI3HuJkTvMfCCU
	uw23OhNHqyLKrjvTIzaggpE6gIa1EP57fnowFZNxTnsOB0G4CTfCGbqVQ0X/OzE/TsQM
	l2e0WfQIVe0WSNXI57593yFzI6Abk7oIy+cmrwjrtpbiObxEBr+3OFZJoMqE3l8uUPMR
	csyXlSMfF6iKI5D8V5nS57XfbeSOF4zsvg183Ef6VFI7EO2g1Dt0hO+T8LBc7cKiP7By
	WtQg==
X-Gm-Message-State: APzg51A/XFIkQSmsjqHHETv/rtRN4FZgWL+zGab8D7JyWP/BWHcBpLwn
	lwJGBGOEVPOWBhn9AXLayYDbM2WP+aY=
X-Google-Smtp-Source: ANB0VdYiRwOm/gnqmngKpWrTxWmDuqju1RKGO2Ekpo6LoSiSzrma6C9bjzvOXy6Co7lysTPgQHP/AQ==
X-Received: by 2002:a5d:4089:: with SMTP id
	o9-v6mr18421682wrp.133.1536658672468; 
	Tue, 11 Sep 2018 02:37:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j66-v6sm25007071wrj.28.2018.09.11.02.37.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 02:37:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 10:37:50 +0100
Message-Id: <20180911093750.5460-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] yasm: remove
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
X-List-Received-Date: Tue, 11 Sep 2018 09:37:52 -0000

Nothing in oe-core is using yasm now that gstreamer-libav and ffmpeg are using
nasm, so remove it from oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc |  1 -
 meta/recipes-devtools/yasm/yasm_1.3.0.bb | 16 ----------------
 2 files changed, 17 deletions(-)
 delete mode 100644 meta/recipes-devtools/yasm/yasm_1.3.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2ecc3d61e38..0c65e8f816c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -732,6 +732,5 @@ RECIPE_MAINTAINER_pn-xvideo-tests = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-yasm = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
diff --git a/meta/recipes-devtools/yasm/yasm_1.3.0.bb b/meta/recipes-devtools/yasm/yasm_1.3.0.bb
deleted file mode 100644
index 31af1e287e9..00000000000
--- a/meta/recipes-devtools/yasm/yasm_1.3.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
-LICENSE = "BSD"
-HOMEPAGE = "http://www.tortall.net/projects/yasm/"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
-
-SRC_URI = "http://www.tortall.net/projects/yasm/releases/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "fc9e586751ff789b34b1f21d572d96af"
-SRC_URI[sha256sum] = "3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f"
-
-export CCLD_FOR_BUILD = "${CC_FOR_BUILD}"
-
-inherit autotools gettext
-
-BBCLASSEXTEND = "native"
-- 
2.11.0


