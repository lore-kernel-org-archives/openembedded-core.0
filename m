Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 528C5731D5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 14:39:30 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id c62so173806152lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3FMybxdx2ncpLTCzPLovKPTfYtTOQNikksi7BuVxBos=;
	b=s/AWrKaTeaT4FpnVj+uBUFb6v3HfDVZ86R3pB0DxkVCjD2DyMcb7iJpXTkOZA010rQ
	+dVItCI/ajOPyjQHu4soxGUgkWF6lNGwZ1GHzFPsxjPVGFgZG27KQzNOHfNTJb1D4BMc
	pJpmZp8Z0cm4q4P3zCkQQaub3ELJxtUIh4i8RW/zWijQJtJOJZV6lmjFMFUXLQnfUXnG
	EUdXHtj9ZG2eO8i43e5vhRRGP2fDH3/OBPBoPmfaiKadI1snPA93WghFUCw+rsMY4z/U
	Pa0ufnwvwGeEM18bYtzX+cf2TyIEfnnM/rIOu+unr7z1DgxFSSi3tvb+xu2s2flcZhuV
	VpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3FMybxdx2ncpLTCzPLovKPTfYtTOQNikksi7BuVxBos=;
	b=MFvaXCsj4sUp8v+/bpW2KgkI7HTW9L6dh7qDfVeduArIt3ze2scSL2oqKCDBiOEGhY
	rsDlB+EKUCNE2LJratyhVt5307MNrA+7GvnI6rRZstcF8lkxrjaGVTixJ4+vJvW7IChF
	o/VIVs7Ix0VEuwhRVvFFbEtzlxxh12GzxGLFRefYpr1N92RS5ctUUXooW7zYi9QbwYuM
	z48DYGXXyXIoS8yUGDydPmg5G6xL2aX3DWkJkZlz+m3O26KqVDNpVVSndouo/jyfj4NA
	Hc8K/BzdJlWT+4wk3pVZz11B9mDlQfEXj43ayb3HGxt7QP4vCb0cL/uVzO7aNyvKzEHI
	E5ww==
X-Gm-Message-State: AD7BkJLju6sahG/DZZQzjfpaEvP9QZHzi7bzqay9Tpga6kw5kMwpQn+NVtxn5kLtBE+vrwd2
X-Received: by 10.28.224.132 with SMTP id x126mr12569533wmg.88.1459780769806; 
	Mon, 04 Apr 2016 07:39:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c144sm14261319wmd.0.2016.04.04.07.39.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 07:39:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:39:22 +0100
Message-Id: <1459780763-22368-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [jethro][PATCH 1/2] cdrtools: update SRC_URI
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
X-List-Received-Date: Mon, 04 Apr 2016 14:39:32 -0000

Upstream released their 3.01 so the alpha releases we were downloading have
moved.  Update the SRC_URI so it continues to download.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
index d0f36e2..50e284c 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/OLD/3.01aX/cdrtools-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "78172557894f469b4584d008e93ec469"
 SRC_URI[sha256sum] = "183b5c12777779e78d8b69461aae52401f863768e7e7391d60730006f8cadc5a"
-- 
2.7.0


