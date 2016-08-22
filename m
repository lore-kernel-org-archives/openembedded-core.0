Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 85F51766E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 20:25:16 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id o80so163070040wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=nA76rb51SYjzVjyMwlLtRbkhd4SrCoPQADhSdhI3g1A=;
	b=m/YYW7kj6EsteBeCXj4fzQtiWE/72o8esdCeF4HKVDXJA2Laa00Q1gUE6ZIGvQypDO
	p1DtUrGe4C6Ohtk2zfbcQzHy83tTrnivh3euUctfy8M9fUZH51oZRGxWySYuwEYJqGEI
	cufTWRzHRXITTisauxYtTZvzRlWFnxOqwo7YzzVOjuBfqiueDAL8qKoLZmSJvI4A+8hx
	0VN9Me+j5fDhh5Gsic2CJbFhbz5hsCy0127iKNVdMb03excOF2roOC7PrwSK4NLKdfvc
	XyhPVIT/ApjW9HZrOltIKu8eghhcNRU563OTc3FdgmHS8Na46TWfwGYHhdohCakmAPf9
	9TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nA76rb51SYjzVjyMwlLtRbkhd4SrCoPQADhSdhI3g1A=;
	b=FlQrpokvxiTdUBpu2Bpll3F7lFNJ4DtR2h2CX1sHORMbY9Hmf+9NMgbCZVU/26ztqi
	b/Ktt15q4Cf35jaR9g8hq20m06FvsU0/G5i4afC6jG0xkehop/zCkpY+O4iZpMIOp91h
	M3d8obqY/T4GV5TI4CaRTA7eg14b3AhlNbIrld8kXNiGEXk5KNsMjRZIl3/+FASfs3r/
	Ff+QatlPnezVFHVp3+qcoX/fLZQVoykroxfJxTFObcoCqsx11dlobGmVLq5Lqtrebz2F
	CWu6VtJe3AQOlIpdBV2eDn/+/vPMSOjatLwvu/pALbjnpKyakPxHQE9fQEZCzC25i5A2
	VESg==
X-Gm-Message-State: AEkoousNU8TAuRIrGLHCos/vIEiQ3h+iFcCGaVfmI2L85nH53VnuEBDE+70lmDr8PE1m3zwX
X-Received: by 10.194.42.202 with SMTP id q10mr18649545wjl.190.1471897516338; 
	Mon, 22 Aug 2016 13:25:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f4sm23446880wmf.8.2016.08.22.13.25.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 13:25:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 21:25:13 +0100
Message-Id: <1471897513-13103-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] core-image-weston: add sudo to image explicitly
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
X-List-Received-Date: Mon, 22 Aug 2016 20:25:18 -0000

This is a very rough image for testing purposes, and the OE automated tests
expect that non-minimal images have sudo in (for the RPM tests), so install sudo
explicitly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/images/core-image-weston.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index e36655f..ad48767 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -8,5 +8,5 @@ inherit core-image distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "wayland"
 
-CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples sudo"
 CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
-- 
2.8.1


